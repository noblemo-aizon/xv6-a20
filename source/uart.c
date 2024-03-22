#include "types.h"
#include "defs.h"
//#include "arm.h"
#include "memlayout.h"

#include "uart_io.h"
#include "macro.h"

void uartputc(uint c)
{
  if(c=='\n') {
  	while ((mmio_read32(UART0_LSR+MMIO_VA) & 0x20) == 0) continue;
    mmio_write32(UART0_THR+MMIO_VA, 0x0d);// add CR before LF
  }
  while ((mmio_read32(UART0_LSR+MMIO_VA) & 0x20) == 0) continue;
  mmio_write32(UART0_THR+MMIO_VA, c);
}

void uart_puts(const char *s)
{
  while (*s) {
    if (*s == '\n')
      uartputc('\r');
    uartputc(*s++);
  }
}

int uartgetc()
{
  if ((mmio_read32(UART0_LSR+MMIO_VA) & 0x01) == 0) {
  	mmio_read32(UART0_RBR+MMIO_VA);
	//cprintf("no data \n");
    return -1;
  } else {
  	//cprintf("uartgetc function clear and return \n");
    return mmio_read32(UART0_RBR+MMIO_VA);
  }
}

// *****************************************************************************

void isr_uart (struct trapframe *tf, int idx)
{
  
   //cprintf("isr_uart function LSR: %x\n", mmio_read32(UART0_LSR+MMIO_VA));
   //cprintf("isr_uart function UART0_IIR: %x\n", mmio_read32(UART0_IIR+MMIO_VA));
  //mmio_write32(UART0_LSR+MMIO_VA,)
  #define UART_IIR_BUSY		0x07 /* DesignWare APB Busy Detect */
  if (mmio_read32(UART0_IIR+MMIO_VA) == UART_IIR_BUSY)
  {	
  	cprintf("UART_IIR_BUSY is detected\n");
	//clear the Busy detect indication
  	mmio_read32(UART0_USR+MMIO_VA);
  }
   
  if ((mmio_read32(UART0_LSR+MMIO_VA) & 0x01) != 0) {
    consoleintr(uartgetc);
  }
    /*
    if (uart_base[UART_MIS] & UART_RXI) {
        consoleintr(uartgetc);
    }

    // clear the interrupt
    uart_base[UART_ICR] = UART_RXI | UART_TXI;
    */
}

void clock_init_uart(void)
{
  // Open the clock gate for UART0
  //set_wbit(APB2_GATE, 1 << (APB2_GATE_UART_SHIFT + CONFIG_CONS_INDEX - 1));
  mmio_write32or(APB0_GATE+MMIO_VA, 1 << 5); //PIO_APB_GATING.
  mmio_write32or(APB2_GATE+MMIO_VA, 1 << (APB2_GATE_UART_SHIFT + CONFIG_CONS_INDEX - 1));
  // Deassert UART0 reset (only needed on A31/A64/H3)
  mmio_write32or(APB2_RESET+MMIO_VA, 1 << (APB2_RESET_UART_SHIFT + CONFIG_CONS_INDEX - 1));
}
/*
There are three different fixes:

1 Fix for DesignWare APB THRE errata: In brief, this is a non-standard
  16550 in that the THRE interrupt will not re-assert itself simply by
  disabling and re-enabling the THRI bit in the IER, it is only re-enabled
  if a character is actually sent out.

  It appears that the "8250-uart-backup-timer.patch" in the "mm" tree
  also fixes it so we have dropped our initial workaround.  This patch now
  needs to be applied on top of that "mm" patch.

2 Fix for Busy Detect on LCR write: The DesignWare APB UART has a feature
  which causes a new Busy Detect interrupt to be generated if it's busy
  when the LCR is written.  This fix saves the value of the LCR and
  rewrites it after clearing the interrupt.

3 Workaround for interrupt/data concurrency issue: The SoC needs to
  ensure that writes that can cause interrupts to be cleared reach the UART
  before returning from the ISR.  This fix reads a non-destructive register
  on the UART so the read transaction completion ensures the previously
  queued write transaction has also completed.
*/

void uart_init(void)
{
  //clock_init_uart();
  
  // select dll dlh
  mmio_write32(UART0_LCR+MMIO_VA, 0x80);
  // set baudrate
  mmio_write32(UART0_DLL+MMIO_VA, BAUD_115200);
  // set line control
  mmio_write32(UART0_LCR+MMIO_VA, LC_8_N_1);

   // disable uart0 interrupts
  mmio_write32(UART0_IER+MMIO_VA, 0);
  //disable the FIFO 
  mmio_write32(UART0_FCR+MMIO_VA, 0x00);
  // enable uart0 interrupts
  //writel(0x3, UART0_IER);
  //writel(0x7, UART0_IER);
}


void uart_enable_rx ()
{

    //mmio_write32(UART0_IER+MMIO_VA, 1 | mmio_read32(UART0_IER+MMIO_VA)); // ERBFI + ELSI
	//mmio_write32(UART0_LCR+MMIO_VA, 0x00);
	mmio_write32(UART0_IER+MMIO_VA, 0x01); // ERBFI + ELSI
    
    pic_enable(UART0_IRQNO, isr_uart);
    
    // enable uart interrupts for gic
    // 0 = no int | 1 = rx int | 2 = rx/tx int
    /*
    switch (mode) {
      case 1:
        mmio_write32(UART0_IER, 1);
        break;
      case 2:
        mmio_write32(UART0_IER, 5 | mmio_read32(UART0_IER)); // ERBFI + ELSI
        break;
      default:
        mmio_write32(UART0_IER, 0);
        break;
    }
    */
}

// *****************************************************************************
#if 0
void print_hex(uint val) {
    char digit[16] = {'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'a', 'b', 'c', 'd', 'e', 'f'};
    char number[8] = {'0','0','0','0','0','0','0','0'};
    uint base = 16;
    int i = 7;
    uartputc('0');
    uartputc('x');

    while(val > 0) {
        number[i--] = digit[val % base];
        val /= base;

    }
    for(i=0;i<8;++i) {
        uartputc(number[i]);
    }
    uartputc('\r');
    uartputc('\n');
}

// *****************************************************************************
// bof my debug
// *****************************************************************************

void hexstrings ( unsigned int d )
{
  unsigned int rb;
  unsigned int rc;

  rb=32;
  while(1)
  {
    rb-=4;
    rc=(d>>rb)&0xF;
    if(rc>9) rc+=0x37; else rc+=0x30;
    uartputc(rc);
    if(rb==0) break;
  }
  uartputc(0x20);
}

void hexstring ( unsigned int d )
{
  hexstrings(d);
  uartputc(0x0D);
  uartputc(0x0A);
}
#endif
// eof my debug
