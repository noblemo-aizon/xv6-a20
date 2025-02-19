﻿// Console input and output.
// Input is from the keyboard or serial port.
// Output is written to the screen and serial port.

#include "types.h"
#include "defs.h"
#include "param.h"
#include "spinlock.h"
#include "fs.h"
#include "file.h"
#include "memlayout.h"
#include "mmu.h"
#include "proc.h"

static void consputc (int);

static int panicked = 0;

static struct {
    struct spinlock lock;
    int locking;
} cons;

static void
printint(int xx, int base, int sign)
{
	static u8 digits[] = "0123456789abcdef";
	u8 buf[16];
	int i;
	uint x, y, b;

	if(sign && (sign = xx < 0))
		x = -xx;
	else
		x = xx;

	b = base;
	i = 0;
	do{
		y = div(x, b);
		buf[i++] = digits[x - y * b];
	}while((x = y) != 0);

	if(sign)
		buf[i++] = '-';

	while(--i >= 0){
		uartputc(buf[i]);
	}
}

//PAGEBREAK: 50

// Print to the console. only understands %d, %x, %p, %s.
void cprintf (char *fmt, ...)
{
    int i, c, locking;
    uint *argp;
    char *s;

    locking = cons.locking;

    if (locking) {
        acquire(&cons.lock);
    }

    if (fmt == 0) {
        panic("null fmt");
    }

    argp = (uint*) (void*) (&fmt + 1);

    for (i = 0; (c = fmt[i] & 0xff) != 0; i++) {
        if (c != '%') {
            consputc(c);
            continue;
        }

        c = fmt[++i] & 0xff;

        if (c == 0) {
            break;
        }

        switch (c) {
        case 'd':
            printint(*argp++, 10, 1);
            break;

        case 'x':
        case 'p':
            printint(*argp++, 16, 0);
            break;

        case 's':
            if ((s = (char*) *argp++) == 0) {
                s = "(null)";
            }

            for (; *s; s++) {
                consputc(*s);
            }
            break;

        case '%':
            consputc('%');
            break;

        default:
            // Print unknown % sequence to draw attention.
            consputc('%');
            consputc(c);
            break;
        }
    }

    if (locking) {
        release(&cons.lock);
    }
}

void panic (char *s)
{
    cli();

    cons.locking = 0;

    cprintf("cpu :: panic: \n");

    //show_callstk(s);
    panicked = 1; // freeze other CPU

    while (1)
        ;
}

//PAGEBREAK: 50
#define BACKSPACE 0x100
#define CRTPORT 0x3d4

void consputc (int c)
{
    if (panicked) {
        cli();
        while (1)
            ;
    }

    if (c == BACKSPACE) {
        uartputc('\b');
        uartputc(' ');
        uartputc('\b');
    } else {
        if (c == '\n')
          uartputc('\r');
        uartputc(c);
    }

    // cgaputc(c);
}

#define INPUT_BUF 512
struct {
    struct spinlock lock;
    char buf[INPUT_BUF];
    uint r;  // Read index
    uint w;  // Write index
    uint e;  // Edit index
} input;

#define C(x)  ((x)-'@')  // Control-x
void consoleintr (int (*getc) (void))
{
    int c;

    acquire(&input.lock);

    while ((c = getc()) >= 0) {
        switch (c) {
        case C('P'):  // Process listing.
            procdump();
            break;

        case C('U'):  // Kill line.
            while ((input.e != input.w) && (input.buf[(input.e - 1) % INPUT_BUF] != '\n')) {
                input.e--;
                consputc(BACKSPACE);
            }

            break;

        case C('H'):
        case '\x7f':  // Backspace
            if (input.e != input.w) {
                input.e--;
                consputc(BACKSPACE);
            }

            break;

        default:
            if ((c != 0) && (input.e - input.r < INPUT_BUF)) {
                c = (c == '\r') ? '\n' : c;

                input.buf[input.e++ % INPUT_BUF] = c;
                consputc(c);

                if (c == '\n' || c == C('D') || input.e == input.r + INPUT_BUF) {
                    input.w = input.e;
                    wakeup(&input.r);
                }
            }

            break;
        }
    }

    release(&input.lock);
}

int consoleread (struct inode *ip, char *dst, int n)
{
    uint target;
    int c;

    iunlock(ip);

    target = n;
    acquire(&input.lock);

    while (n > 0) {
        while (input.r == input.w) {
            if (curr_proc->killed) {
                release(&input.lock);
                ilock(ip);
                return -1;
            }

            sleep(&input.r, &input.lock);
        }

        c = input.buf[input.r++ % INPUT_BUF];

        if (c == C('D')) {  // EOF
            if (n < target) {
                // Save ^D for next time, to make sure
                // caller gets a 0-byte result.
                input.r--;
            }

            break;
        }

        *dst++ = c;
        --n;

        if (c == '\n') {
            break;
        }
    }

    release(&input.lock);
    ilock(ip);

    return target - n;
}

int consolewrite (struct inode *ip, char *buf, int n)
{
    int i;

    iunlock(ip);

    acquire(&cons.lock);

    for (i = 0; i < n; i++) {
        consputc(buf[i] & 0xff);
    }

    release(&cons.lock);

    ilock(ip);

    return n;
}

void consoleinit (void)
{
    initlock(&cons.lock, "console");
	memset(&input, 0, sizeof(input));
    initlock(&input.lock, "input");

	memset(devsw, 0, sizeof(struct devsw)*NDEV);
	devsw[CONSOLE].write = consolewrite;
	devsw[CONSOLE].read = consoleread;
	cons.locking = 1;
	panicked = 0; // must initialize in code since the compiler does not

	//cursor_x=cursor_y=0;

}

