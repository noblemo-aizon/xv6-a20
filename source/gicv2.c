#include "types.h"
#include "param.h"
#include "memlayout.h"
//#include "aarch64.h"
#include "defs.h"

//
// aarch64 Global Interrupt Controller (GICv2).
//

// GICD base
#define RegD(reg) ((volatile uint32 *)(GICDBASE + (reg)))
// GICC base
#define RegC(reg) ((volatile uint32 *)(GICCBASE + (reg)))

#define D_CTLR          0x0
#define D_TYPER         0x4
#define D_ISENABLER(n)  (0x100 + (uint32)(n) * 4)
#define D_ICENABLER(n)  (0x180 + (uint32)(n) * 4)
#define D_ISPENDR(n)    (0x200 + (uint32)(n) * 4)
#define D_ICPENDR(n)    (0x280 + (uint32)(n) * 4)
#define D_IPRIORITYR(n) (0x400 + (uint32)(n) * 4)
#define D_ITARGETSR(n)  (0x800 + (uint32)(n) * 4)
#define D_ICFGR(n)      (0xc00 + (uint32)(n) * 4)

#define C_CTLR  0x0 
#define C_PMR   0x4
#define C_IAR   0xc
#define C_EOIR  0x10
#define C_HPPIR 0x18
#define C_AIAR  0x20
#define C_AEOIR 0x24


#define NUM_INTSRC    128 // numbers of interrupt source supported
// declare an array of ISR functions to handle interrupts
static ISR isrs[NUM_INTSRC];


static void gic_setup_ppi(uint32 intid);
static void gic_setup_spi(uint32 intid);
uint32 gic_iar();
void gic_eoi(uint32 iar);

// dispatch the interrupt
void pic_dispatch (struct trapframe *tp) {
    int intno;
    
    // get & ack the irqno from gic register
    intno = gic_iar();
    //cprintf("intno: %x\n", intno);
  
    // execute the registerd ISR function
    isrs[intno](tp, intno);
    
    // clear the irqno from gic register
    gic_eoi(intno);
    
    // Force process exit if it has been killed and is in user space.
    // (If it is still executing in the kernel, let it keep running
    // until it gets to the regular system call return.)
    //
    // on xv6 x86
    //if(proc && proc->killed && (tf->cs&3) == DPL_USER)
    // 
    // on arm: (r14_svc == pc if SWI) 
    // - the proc in swi is in kernel space
    // - the proc not in swi is in user space
    // so: we need to compare tp->r14_svc with tp->pc
    // they need to be diferent to proc be in user space
    /*
    if(proc && proc->killed && (tp->r14_svc) != (tp->pc)) {
      exit();
    }
    */

    // Force process to give up CPU on clock tick.
    // If interrupts were on while locks held, would need to check nlock.
    /*if(proc && proc->state == RUNNING && intno == TMR_0_IRQNO) {
      yield();
    }*/
    
    // Check if the process has been killed since we yielded
    /*if(proc && proc->killed && (tp->r14_svc) != (tp->pc)) {
      exit();
    }*/
    
}


void pic_enable(int n, ISR isr) {
    if ((n<0) || (n>=NUM_INTSRC)) {
        panic("invalid interrupt source");
    }
    if(n < NUM_INTSRC) {
      // configure irq n on gicv2
      //gic_irq_enable(n);
      gic_setup_spi(n);
      // add the function to ISRS array
      isrs[n] = isr;
    }
}


static void
giccinit()
{
  *RegC(C_CTLR) = 0;
  *RegC(C_PMR) = 0xf0;
}

static void
gicdinit()
{
  *RegD(D_CTLR) = 0;
}

void
gicv2init()
{
  #define TIMER0_IRQ 54
  #define UART0_IRQ  33
  gic_setup_spi(TIMER0_IRQ);
  gic_setup_spi(UART0_IRQ);
}

static void default_isr(struct trapframe *tf, int n) {
    //(void)tf;
    cprintf("unhandled interrupt: %d\n", n);
}


void
gicv2inithart()
{
	 int i;
  giccinit();
  gicdinit();

  *RegC(C_CTLR) |= 0x1;
  *RegD(D_CTLR) |= 0x1;

   
    for (i=0; i< NUM_INTSRC; i++)
      isrs[i] = default_isr;
  
}

static void
gic_enable_int(uint32 intid)
{
  *RegD(D_ISENABLER(intid / 32)) |= 1 << (intid % 32);
}

static void
gic_clear_pending(uint32 intid)
{
  *RegD(D_ICPENDR(intid / 32)) |= 1 << (intid % 32);
}

static void
gic_set_prio0(uint32 intid)
{
  // set priority to 0
  *RegD(D_IPRIORITYR(intid / 4)) &= ~((uint32)0xff << (intid % 4 * 8));
  *RegD(D_IPRIORITYR(intid / 4)) |= ((uint32)0xe << (intid % 4 * 8));
}

static void
gic_set_target(uint32 intid, uint32 cpuid)
{
  uint32 i = *RegD(D_ITARGETSR(intid / 4));
  i &= ~((uint32)0xff << (intid % 4 * 8));
  *RegD(D_ITARGETSR(intid / 4)) = i | ((uint32)(1 << cpuid) << (intid % 4 * 8));
}

static void
gic_setup_ppi(uint32 intid)
{
  gic_set_prio0(intid);
  gic_clear_pending(intid);
  gic_enable_int(intid);
}

static void
gic_setup_spi(uint32 intid)
{
  gic_set_prio0(intid);

  // all interrupts are handled by cpu0　
  gic_set_target(intid, 0);

  gic_clear_pending(intid);
  gic_enable_int(intid);
}

// irq from iar
int
gic_iar_irq(uint32 iar)
{
  return iar & 0x3ff;
}

// interrupt acknowledge register:
// ask GIC what interrupt we should serve.
uint32
gic_iar()
{
  return *RegC(C_IAR);
}

// tell GIC we've served this IRQ.
void
gic_eoi(uint32 iar)
{
  *RegC(C_EOIR) = iar;
}

