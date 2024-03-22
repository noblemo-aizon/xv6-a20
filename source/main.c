/*****************************************************************
*       main.c
*       by Zhiyi Huang, hzy@cs.otago.ac.nz
*       University of Otago
*
********************************************************************/


#include "types.h"
#include "defs.h"
#include "param.h"
#include "memlayout.h"
#include "mmu.h"
#include "proc.h"
#include "arm.h"
#include "mailbox.h"

extern char end[]; // first address after kernel loaded from ELF file
extern pde_t *kpgdir;
extern volatile uint *mailbuffer;
extern unsigned int pm_size;

unsigned int boardmodel, boardrevision, max_core_clock_freq;

#if defined (RPI1) || defined (RPI2)
unsigned int core_clock_freq = 250000000;
#else
unsigned int core_clock_freq = 400000000;
#endif

void sti1(void)
 {
     uint val;
 #define DIS_INT     0x80
     // ok, enable paging using read/modify/write
     asm("MRS %[v], cpsr": [v]"=r" (val)::);
     val &= ~DIS_INT;
     asm("MSR cpsr_cxsf, %[v]": :[v]"r" (val):);
 }


static inline void _delay(unsigned int count)
{
  asm volatile("__delay_%=: subs %[count], %[count], #1; bne __delay_%=\n"
     : "=r"(count): [count]"0"(count) : "cc");
}


void OkLoop()
{
   /*setgpiofunc(18, 1); // gpio 18 for Ok Led, set as an output
   while(1){
        setgpioval(18, 0);
        delay(2000000);
        setgpioval(18, 1);
        delay(2000000);
   }*/
}

void NotOkLoop()
{
   while(1)
    {
    	
        static int count;
        //configure the output mode
        asm (" \n"
            "ldr r0, =0x00110000 \n"
            "ldr r3, =0xD1C20904 \n"
            "str r0, [r3]");
        if (count  < 60) {
            //cprintf("set high level -count ::%d-----\n", count++);
            //hexstring(0xaa);
            asm (" \n"
                "ldr r0, =0x00300031 \n"
                "ldr r3, =0xD1C2090C \n"
                "str r0, [r3]");
            _delay(9500000); // need to wait to take effect
            
        }  else if (count <= 180) {
            //cprintf("set low level -count ::%d-----\n", count++);
            //hexstring(0xbb);
            asm (" \n"
                "ldr r0, =0x00000031 \n"
                "ldr r3, =0xD1C2090C \n"
                "str r0, [r3]");
            _delay(9500000); // need to wait to take effect
        } else {
            count = 0;

        }
        count++;
		cprintf("NotOkLoop---\n");
        //hexstring(count);
    }
}


void machinit(void)
{
    memset(cpus, 0, sizeof(struct cpu)*NCPU);
}

uint mb_data[10];

int cmain()
{
	asm (" \n"
	"ldr r0, =0x00000041 \n"
	"ldr r3, =0xD1C28000 \n"                                                                                                   
	"str r0, [r3]");
  
	/*asm (" \n"
	"ldr r0, =0x00100000 \n"
	"ldr r3, =0xD1C2090C \n"                                                                                                   
	"str r0, [r3]");*/
  mmuinit0();
	asm (" \n"
	"ldr r0, =0x00000042 \n"
	"ldr r3, =0xD1C28000 \n"                                                                                                   
	"str r0, [r3]");
	


// Bare-minimum start-up code to run NEON code
//__asm void EnableNEON(void)
#if 0
asm (" \n"

"MRC p15,0,r0,c1,c0,2 \n"    // Read CPAccess register
"ORR r0,r0,#0x00f00000 \n"   // Enablefull access to NEON/VFP by enabling access to
                             // Coprocessors 10 and 11
"MCR p15,0,r0,c1,c0,2 \n"    // Write CPAccess registerISB
"MOV r0,#0x40000000 \n"      // Switch onthe VFP and NEON hardware
"MSR FPEXC,r0");            // Set EN bit inFPEXC
#endif
  machinit();

  /*#if defined (RPI1) || defined (RPI2) || defined (RPI3)
  uartinit();
  #elif defined (FVP)
  uartinit_fvp();
  #endif*/

  uart_init();

  dsb_barrier();

  consoleinit();
  asm (" \n"
	"ldr r0, =0x00200000 \n"
	"ldr r3, =0xD1C2090C \n"                                                                                                   
	"str r0, [r3]");
  
  cprintf("\nHello World from xv6\n");

  kinit1(end, P2V((32*1024*1024)+PHYSTART)); 
  // collect some free space (8 MB) for imminent use
  // the physical space below 0x8000 is reserved for PGDIR and kernel stack
  kpgdir=p2v(K_PDX_BASE);
  //cprintf("---ARM memory is %x ---\n", pm_size);

  //mailboxinit();
    //256M ram
  pm_size = 0x10000000;//  + PHYSTART;//getpmsize();

  //mmuinit1();
  //gpuinit();

  cprintf("ARM memory is %x\n", pm_size);
  /*max_core_clock_freq = getmaxclockrate(CORE_CLOCK_ID);
  cprintf("Max core clock rate is %d\n", max_core_clock_freq);
  cprintf("Min core clock rate is %d\n", getminclockrate(CORE_CLOCK_ID));
  // set the core clock rate to max core clock frequency (for RPI 3 it is 400000000, and 250000000 for RPI 2)
  // In this way the core clock frequency can be fixed and the UART baud rate, that relies on the core clock frequency, 
  // could be correctly calculated. 
  cprintf("The core clock rate is set to %d\n", setclockrate(CORE_CLOCK_ID, max_core_clock_freq));

  boardmodel = getboardmodel();
  boardrevision = getboardrevision();

  core_clock_freq = getclockratemeasured(CORE_CLOCK_ID);
  cprintf("The core clock rate measured is %d\n", core_clock_freq);

  cprintf("The board model is %x\n", boardmodel);
  cprintf("The board revision is %x\n", boardrevision);

  #if defined (RPI1) || defined (RPI2) || defined (RPI3)
  uartinit(); // re-init miniUART according to the core clock frequency
  #endif
  */

  pinit();
  tvinit();
  cprintf("it is ok after tvinit\n");
  //#define GIC_BASE (0x01C80000)
  //gic_init();
  //gicv2init();
  gicv2inithart();
  cprintf("it is ok after gic_init\n");
  uart_enable_rx();          // interrupt for uart
  binit();
  cprintf("it is ok after binit\n");
  fileinit();
  cprintf("it is ok after fileinit\n");
  iinit();
  cprintf("it is ok after iinit\n");
  ideinit();
  cprintf("it is ok after ideinit\n");
  //kinit2(P2V((8*1024*1024)+PHYSTART), P2V(pm_size + PHYSTART));
  cprintf("it is ok after kinit2\n");
  
  userinit();
  cprintf("it is ok after userinit\n");
  //sti1();
  //while(1);
  //timer3init();
  timer_init();
  cprintf("it is ok after timerinit\n");
  scheduler();
  NotOkLoop();
  return 0;
}
