
_kill:     file format elf32-littlearm


Disassembly of section .text:

00000000 <main>:
#include "stat.h"
#include "user.h"

int
main(int argc, char **argv)
{
       0:	e92d4800 	push	{fp, lr}
       4:	e28db004 	add	fp, sp, #4
       8:	e24dd010 	sub	sp, sp, #16
       c:	e50b0010 	str	r0, [fp, #-16]
      10:	e50b1014 	str	r1, [fp, #-20]	@ 0xffffffec
  int i;

  if(argc < 1){
      14:	e51b3010 	ldr	r3, [fp, #-16]
      18:	e3530000 	cmp	r3, #0
      1c:	ca000004 	bgt	34 <main+0x34>
    printf(2, "usage: kill pid...\n");
      20:	e30110d0 	movw	r1, #4304	@ 0x10d0
      24:	e3401000 	movt	r1, #0
      28:	e3a00002 	mov	r0, #2
      2c:	eb0002b7 	bl	b10 <printf>
    exit();
      30:	eb000125 	bl	4cc <exit>
  }
  for(i=1; i<argc; i++)
      34:	e3a03001 	mov	r3, #1
      38:	e50b3008 	str	r3, [fp, #-8]
      3c:	ea00000c 	b	74 <main+0x74>
    kill(atoi(argv[i]));
      40:	e51b3008 	ldr	r3, [fp, #-8]
      44:	e1a03103 	lsl	r3, r3, #2
      48:	e51b2014 	ldr	r2, [fp, #-20]	@ 0xffffffec
      4c:	e0823003 	add	r3, r2, r3
      50:	e5933000 	ldr	r3, [r3]
      54:	e1a00003 	mov	r0, r3
      58:	eb0000d3 	bl	3ac <atoi>
      5c:	e1a03000 	mov	r3, r0
      60:	e1a00003 	mov	r0, r3
      64:	eb000166 	bl	604 <kill>
  for(i=1; i<argc; i++)
      68:	e51b3008 	ldr	r3, [fp, #-8]
      6c:	e2833001 	add	r3, r3, #1
      70:	e50b3008 	str	r3, [fp, #-8]
      74:	e51b2008 	ldr	r2, [fp, #-8]
      78:	e51b3010 	ldr	r3, [fp, #-16]
      7c:	e1520003 	cmp	r2, r3
      80:	baffffee 	blt	40 <main+0x40>
  exit();
      84:	eb000110 	bl	4cc <exit>

00000088 <strcpy>:
#include "user.h"
#include "arm.h"

char*
strcpy(char *s, char *t)
{
      88:	e52db004 	push	{fp}		@ (str fp, [sp, #-4]!)
      8c:	e28db000 	add	fp, sp, #0
      90:	e24dd014 	sub	sp, sp, #20
      94:	e50b0010 	str	r0, [fp, #-16]
      98:	e50b1014 	str	r1, [fp, #-20]	@ 0xffffffec
  char *os;

  os = s;
      9c:	e51b3010 	ldr	r3, [fp, #-16]
      a0:	e50b3008 	str	r3, [fp, #-8]
  while((*s++ = *t++) != 0)
      a4:	e320f000 	nop	{0}
      a8:	e51b2014 	ldr	r2, [fp, #-20]	@ 0xffffffec
      ac:	e2823001 	add	r3, r2, #1
      b0:	e50b3014 	str	r3, [fp, #-20]	@ 0xffffffec
      b4:	e51b3010 	ldr	r3, [fp, #-16]
      b8:	e2831001 	add	r1, r3, #1
      bc:	e50b1010 	str	r1, [fp, #-16]
      c0:	e5d22000 	ldrb	r2, [r2]
      c4:	e5c32000 	strb	r2, [r3]
      c8:	e5d33000 	ldrb	r3, [r3]
      cc:	e3530000 	cmp	r3, #0
      d0:	1afffff4 	bne	a8 <strcpy+0x20>
    ;
  return os;
      d4:	e51b3008 	ldr	r3, [fp, #-8]
}
      d8:	e1a00003 	mov	r0, r3
      dc:	e28bd000 	add	sp, fp, #0
      e0:	e49db004 	pop	{fp}		@ (ldr fp, [sp], #4)
      e4:	e12fff1e 	bx	lr

000000e8 <strcmp>:

int
strcmp(const char *p, const char *q)
{
      e8:	e52db004 	push	{fp}		@ (str fp, [sp, #-4]!)
      ec:	e28db000 	add	fp, sp, #0
      f0:	e24dd00c 	sub	sp, sp, #12
      f4:	e50b0008 	str	r0, [fp, #-8]
      f8:	e50b100c 	str	r1, [fp, #-12]
  while(*p && *p == *q)
      fc:	ea000005 	b	118 <strcmp+0x30>
    p++, q++;
     100:	e51b3008 	ldr	r3, [fp, #-8]
     104:	e2833001 	add	r3, r3, #1
     108:	e50b3008 	str	r3, [fp, #-8]
     10c:	e51b300c 	ldr	r3, [fp, #-12]
     110:	e2833001 	add	r3, r3, #1
     114:	e50b300c 	str	r3, [fp, #-12]
  while(*p && *p == *q)
     118:	e51b3008 	ldr	r3, [fp, #-8]
     11c:	e5d33000 	ldrb	r3, [r3]
     120:	e3530000 	cmp	r3, #0
     124:	0a000005 	beq	140 <strcmp+0x58>
     128:	e51b3008 	ldr	r3, [fp, #-8]
     12c:	e5d32000 	ldrb	r2, [r3]
     130:	e51b300c 	ldr	r3, [fp, #-12]
     134:	e5d33000 	ldrb	r3, [r3]
     138:	e1520003 	cmp	r2, r3
     13c:	0affffef 	beq	100 <strcmp+0x18>
  return (uchar)*p - (uchar)*q;
     140:	e51b3008 	ldr	r3, [fp, #-8]
     144:	e5d33000 	ldrb	r3, [r3]
     148:	e1a02003 	mov	r2, r3
     14c:	e51b300c 	ldr	r3, [fp, #-12]
     150:	e5d33000 	ldrb	r3, [r3]
     154:	e0423003 	sub	r3, r2, r3
}
     158:	e1a00003 	mov	r0, r3
     15c:	e28bd000 	add	sp, fp, #0
     160:	e49db004 	pop	{fp}		@ (ldr fp, [sp], #4)
     164:	e12fff1e 	bx	lr

00000168 <strlen>:

uint
strlen(char *s)
{
     168:	e52db004 	push	{fp}		@ (str fp, [sp, #-4]!)
     16c:	e28db000 	add	fp, sp, #0
     170:	e24dd014 	sub	sp, sp, #20
     174:	e50b0010 	str	r0, [fp, #-16]
  int n;

  for(n = 0; s[n]; n++)
     178:	e3a03000 	mov	r3, #0
     17c:	e50b3008 	str	r3, [fp, #-8]
     180:	ea000002 	b	190 <strlen+0x28>
     184:	e51b3008 	ldr	r3, [fp, #-8]
     188:	e2833001 	add	r3, r3, #1
     18c:	e50b3008 	str	r3, [fp, #-8]
     190:	e51b3008 	ldr	r3, [fp, #-8]
     194:	e51b2010 	ldr	r2, [fp, #-16]
     198:	e0823003 	add	r3, r2, r3
     19c:	e5d33000 	ldrb	r3, [r3]
     1a0:	e3530000 	cmp	r3, #0
     1a4:	1afffff6 	bne	184 <strlen+0x1c>
    ;
  return n;
     1a8:	e51b3008 	ldr	r3, [fp, #-8]
}
     1ac:	e1a00003 	mov	r0, r3
     1b0:	e28bd000 	add	sp, fp, #0
     1b4:	e49db004 	pop	{fp}		@ (ldr fp, [sp], #4)
     1b8:	e12fff1e 	bx	lr

000001bc <memset>:

void*
memset(void *dst, int c, uint n)
{
     1bc:	e52db004 	push	{fp}		@ (str fp, [sp, #-4]!)
     1c0:	e28db000 	add	fp, sp, #0
     1c4:	e24dd01c 	sub	sp, sp, #28
     1c8:	e50b0010 	str	r0, [fp, #-16]
     1cc:	e50b1014 	str	r1, [fp, #-20]	@ 0xffffffec
     1d0:	e50b2018 	str	r2, [fp, #-24]	@ 0xffffffe8
  char *p=dst;
     1d4:	e51b3010 	ldr	r3, [fp, #-16]
     1d8:	e50b3008 	str	r3, [fp, #-8]
  u32 rc=n;
     1dc:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
     1e0:	e50b300c 	str	r3, [fp, #-12]

  while (rc-- > 0) *p++ = c;
     1e4:	ea000005 	b	200 <memset+0x44>
     1e8:	e51b3008 	ldr	r3, [fp, #-8]
     1ec:	e2832001 	add	r2, r3, #1
     1f0:	e50b2008 	str	r2, [fp, #-8]
     1f4:	e51b2014 	ldr	r2, [fp, #-20]	@ 0xffffffec
     1f8:	e6ef2072 	uxtb	r2, r2
     1fc:	e5c32000 	strb	r2, [r3]
     200:	e51b300c 	ldr	r3, [fp, #-12]
     204:	e2432001 	sub	r2, r3, #1
     208:	e50b200c 	str	r2, [fp, #-12]
     20c:	e3530000 	cmp	r3, #0
     210:	1afffff4 	bne	1e8 <memset+0x2c>
  return (void *)p;
     214:	e51b3008 	ldr	r3, [fp, #-8]
}
     218:	e1a00003 	mov	r0, r3
     21c:	e28bd000 	add	sp, fp, #0
     220:	e49db004 	pop	{fp}		@ (ldr fp, [sp], #4)
     224:	e12fff1e 	bx	lr

00000228 <strchr>:

char*
strchr(const char *s, char c)
{
     228:	e52db004 	push	{fp}		@ (str fp, [sp, #-4]!)
     22c:	e28db000 	add	fp, sp, #0
     230:	e24dd00c 	sub	sp, sp, #12
     234:	e50b0008 	str	r0, [fp, #-8]
     238:	e1a03001 	mov	r3, r1
     23c:	e54b3009 	strb	r3, [fp, #-9]
  for(; *s; s++)
     240:	ea000009 	b	26c <strchr+0x44>
    if(*s == c)
     244:	e51b3008 	ldr	r3, [fp, #-8]
     248:	e5d33000 	ldrb	r3, [r3]
     24c:	e55b2009 	ldrb	r2, [fp, #-9]
     250:	e1520003 	cmp	r2, r3
     254:	1a000001 	bne	260 <strchr+0x38>
      return (char*)s;
     258:	e51b3008 	ldr	r3, [fp, #-8]
     25c:	ea000007 	b	280 <strchr+0x58>
  for(; *s; s++)
     260:	e51b3008 	ldr	r3, [fp, #-8]
     264:	e2833001 	add	r3, r3, #1
     268:	e50b3008 	str	r3, [fp, #-8]
     26c:	e51b3008 	ldr	r3, [fp, #-8]
     270:	e5d33000 	ldrb	r3, [r3]
     274:	e3530000 	cmp	r3, #0
     278:	1afffff1 	bne	244 <strchr+0x1c>
  return 0;
     27c:	e3a03000 	mov	r3, #0
}
     280:	e1a00003 	mov	r0, r3
     284:	e28bd000 	add	sp, fp, #0
     288:	e49db004 	pop	{fp}		@ (ldr fp, [sp], #4)
     28c:	e12fff1e 	bx	lr

00000290 <gets>:

char*
gets(char *buf, int max)
{
     290:	e92d4800 	push	{fp, lr}
     294:	e28db004 	add	fp, sp, #4
     298:	e24dd018 	sub	sp, sp, #24
     29c:	e50b0018 	str	r0, [fp, #-24]	@ 0xffffffe8
     2a0:	e50b101c 	str	r1, [fp, #-28]	@ 0xffffffe4
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
     2a4:	e3a03000 	mov	r3, #0
     2a8:	e50b3008 	str	r3, [fp, #-8]
     2ac:	ea000016 	b	30c <gets+0x7c>
    cc = read(0, &c, 1);
     2b0:	e24b300d 	sub	r3, fp, #13
     2b4:	e3a02001 	mov	r2, #1
     2b8:	e1a01003 	mov	r1, r3
     2bc:	e3a00000 	mov	r0, #0
     2c0:	eb0000a8 	bl	568 <read>
     2c4:	e50b000c 	str	r0, [fp, #-12]
    if(cc < 1)
     2c8:	e51b300c 	ldr	r3, [fp, #-12]
     2cc:	e3530000 	cmp	r3, #0
     2d0:	da000013 	ble	324 <gets+0x94>
      break;
    buf[i++] = c;
     2d4:	e51b3008 	ldr	r3, [fp, #-8]
     2d8:	e2832001 	add	r2, r3, #1
     2dc:	e50b2008 	str	r2, [fp, #-8]
     2e0:	e1a02003 	mov	r2, r3
     2e4:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
     2e8:	e0833002 	add	r3, r3, r2
     2ec:	e55b200d 	ldrb	r2, [fp, #-13]
     2f0:	e5c32000 	strb	r2, [r3]
    if(c == '\n' || c == '\r')
     2f4:	e55b300d 	ldrb	r3, [fp, #-13]
     2f8:	e353000a 	cmp	r3, #10
     2fc:	0a000009 	beq	328 <gets+0x98>
     300:	e55b300d 	ldrb	r3, [fp, #-13]
     304:	e353000d 	cmp	r3, #13
     308:	0a000006 	beq	328 <gets+0x98>
  for(i=0; i+1 < max; ){
     30c:	e51b3008 	ldr	r3, [fp, #-8]
     310:	e2833001 	add	r3, r3, #1
     314:	e51b201c 	ldr	r2, [fp, #-28]	@ 0xffffffe4
     318:	e1520003 	cmp	r2, r3
     31c:	caffffe3 	bgt	2b0 <gets+0x20>
     320:	ea000000 	b	328 <gets+0x98>
      break;
     324:	e320f000 	nop	{0}
      break;
  }
  buf[i] = '\0';
     328:	e51b3008 	ldr	r3, [fp, #-8]
     32c:	e51b2018 	ldr	r2, [fp, #-24]	@ 0xffffffe8
     330:	e0823003 	add	r3, r2, r3
     334:	e3a02000 	mov	r2, #0
     338:	e5c32000 	strb	r2, [r3]
  return buf;
     33c:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
}
     340:	e1a00003 	mov	r0, r3
     344:	e24bd004 	sub	sp, fp, #4
     348:	e8bd8800 	pop	{fp, pc}

0000034c <stat>:

int
stat(char *n, struct stat *st)
{
     34c:	e92d4800 	push	{fp, lr}
     350:	e28db004 	add	fp, sp, #4
     354:	e24dd010 	sub	sp, sp, #16
     358:	e50b0010 	str	r0, [fp, #-16]
     35c:	e50b1014 	str	r1, [fp, #-20]	@ 0xffffffec
  int fd;
  int r;

  fd = open(n, O_RDONLY);
     360:	e3a01000 	mov	r1, #0
     364:	e51b0010 	ldr	r0, [fp, #-16]
     368:	eb0000bf 	bl	66c <open>
     36c:	e50b0008 	str	r0, [fp, #-8]
  if(fd < 0)
     370:	e51b3008 	ldr	r3, [fp, #-8]
     374:	e3530000 	cmp	r3, #0
     378:	aa000001 	bge	384 <stat+0x38>
    return -1;
     37c:	e3e03000 	mvn	r3, #0
     380:	ea000006 	b	3a0 <stat+0x54>
  r = fstat(fd, st);
     384:	e51b1014 	ldr	r1, [fp, #-20]	@ 0xffffffec
     388:	e51b0008 	ldr	r0, [fp, #-8]
     38c:	eb0000dd 	bl	708 <fstat>
     390:	e50b000c 	str	r0, [fp, #-12]
  close(fd);
     394:	e51b0008 	ldr	r0, [fp, #-8]
     398:	eb00008c 	bl	5d0 <close>
  return r;
     39c:	e51b300c 	ldr	r3, [fp, #-12]
}
     3a0:	e1a00003 	mov	r0, r3
     3a4:	e24bd004 	sub	sp, fp, #4
     3a8:	e8bd8800 	pop	{fp, pc}

000003ac <atoi>:

int
atoi(const char *s)
{
     3ac:	e52db004 	push	{fp}		@ (str fp, [sp, #-4]!)
     3b0:	e28db000 	add	fp, sp, #0
     3b4:	e24dd014 	sub	sp, sp, #20
     3b8:	e50b0010 	str	r0, [fp, #-16]
  int n;

  n = 0;
     3bc:	e3a03000 	mov	r3, #0
     3c0:	e50b3008 	str	r3, [fp, #-8]
  while('0' <= *s && *s <= '9')
     3c4:	ea000009 	b	3f0 <atoi+0x44>
    n = n*10 + *s++ - '0';
     3c8:	e51b3008 	ldr	r3, [fp, #-8]
     3cc:	e3a0200a 	mov	r2, #10
     3d0:	e0020392 	mul	r2, r2, r3
     3d4:	e51b3010 	ldr	r3, [fp, #-16]
     3d8:	e2831001 	add	r1, r3, #1
     3dc:	e50b1010 	str	r1, [fp, #-16]
     3e0:	e5d33000 	ldrb	r3, [r3]
     3e4:	e0823003 	add	r3, r2, r3
     3e8:	e2433030 	sub	r3, r3, #48	@ 0x30
     3ec:	e50b3008 	str	r3, [fp, #-8]
  while('0' <= *s && *s <= '9')
     3f0:	e51b3010 	ldr	r3, [fp, #-16]
     3f4:	e5d33000 	ldrb	r3, [r3]
     3f8:	e353002f 	cmp	r3, #47	@ 0x2f
     3fc:	9a000003 	bls	410 <atoi+0x64>
     400:	e51b3010 	ldr	r3, [fp, #-16]
     404:	e5d33000 	ldrb	r3, [r3]
     408:	e3530039 	cmp	r3, #57	@ 0x39
     40c:	9affffed 	bls	3c8 <atoi+0x1c>
  return n;
     410:	e51b3008 	ldr	r3, [fp, #-8]
}
     414:	e1a00003 	mov	r0, r3
     418:	e28bd000 	add	sp, fp, #0
     41c:	e49db004 	pop	{fp}		@ (ldr fp, [sp], #4)
     420:	e12fff1e 	bx	lr

00000424 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
     424:	e52db004 	push	{fp}		@ (str fp, [sp, #-4]!)
     428:	e28db000 	add	fp, sp, #0
     42c:	e24dd01c 	sub	sp, sp, #28
     430:	e50b0010 	str	r0, [fp, #-16]
     434:	e50b1014 	str	r1, [fp, #-20]	@ 0xffffffec
     438:	e50b2018 	str	r2, [fp, #-24]	@ 0xffffffe8
  char *dst, *src;
  
  dst = vdst;
     43c:	e51b3010 	ldr	r3, [fp, #-16]
     440:	e50b3008 	str	r3, [fp, #-8]
  src = vsrc;
     444:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
     448:	e50b300c 	str	r3, [fp, #-12]
  while(n-- > 0)
     44c:	ea000007 	b	470 <memmove+0x4c>
    *dst++ = *src++;
     450:	e51b200c 	ldr	r2, [fp, #-12]
     454:	e2823001 	add	r3, r2, #1
     458:	e50b300c 	str	r3, [fp, #-12]
     45c:	e51b3008 	ldr	r3, [fp, #-8]
     460:	e2831001 	add	r1, r3, #1
     464:	e50b1008 	str	r1, [fp, #-8]
     468:	e5d22000 	ldrb	r2, [r2]
     46c:	e5c32000 	strb	r2, [r3]
  while(n-- > 0)
     470:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
     474:	e2432001 	sub	r2, r3, #1
     478:	e50b2018 	str	r2, [fp, #-24]	@ 0xffffffe8
     47c:	e3530000 	cmp	r3, #0
     480:	cafffff2 	bgt	450 <memmove+0x2c>
  return vdst;
     484:	e51b3010 	ldr	r3, [fp, #-16]
}
     488:	e1a00003 	mov	r0, r3
     48c:	e28bd000 	add	sp, fp, #0
     490:	e49db004 	pop	{fp}		@ (ldr fp, [sp], #4)
     494:	e12fff1e 	bx	lr

00000498 <fork>:
     498:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
     49c:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
     4a0:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
     4a4:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
     4a8:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
     4ac:	e3a00001 	mov	r0, #1
     4b0:	ef000040 	svc	0x00000040
     4b4:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     4b8:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     4bc:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
     4c0:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
     4c4:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
     4c8:	e12fff1e 	bx	lr

000004cc <exit>:
     4cc:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
     4d0:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
     4d4:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
     4d8:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
     4dc:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
     4e0:	e3a00002 	mov	r0, #2
     4e4:	ef000040 	svc	0x00000040
     4e8:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     4ec:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     4f0:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
     4f4:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
     4f8:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
     4fc:	e12fff1e 	bx	lr

00000500 <wait>:
     500:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
     504:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
     508:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
     50c:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
     510:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
     514:	e3a00003 	mov	r0, #3
     518:	ef000040 	svc	0x00000040
     51c:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     520:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     524:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
     528:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
     52c:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
     530:	e12fff1e 	bx	lr

00000534 <pipe>:
     534:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
     538:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
     53c:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
     540:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
     544:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
     548:	e3a00004 	mov	r0, #4
     54c:	ef000040 	svc	0x00000040
     550:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     554:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     558:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
     55c:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
     560:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
     564:	e12fff1e 	bx	lr

00000568 <read>:
     568:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
     56c:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
     570:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
     574:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
     578:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
     57c:	e3a00005 	mov	r0, #5
     580:	ef000040 	svc	0x00000040
     584:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     588:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     58c:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
     590:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
     594:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
     598:	e12fff1e 	bx	lr

0000059c <write>:
     59c:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
     5a0:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
     5a4:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
     5a8:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
     5ac:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
     5b0:	e3a00010 	mov	r0, #16
     5b4:	ef000040 	svc	0x00000040
     5b8:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     5bc:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     5c0:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
     5c4:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
     5c8:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
     5cc:	e12fff1e 	bx	lr

000005d0 <close>:
     5d0:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
     5d4:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
     5d8:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
     5dc:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
     5e0:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
     5e4:	e3a00015 	mov	r0, #21
     5e8:	ef000040 	svc	0x00000040
     5ec:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     5f0:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     5f4:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
     5f8:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
     5fc:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
     600:	e12fff1e 	bx	lr

00000604 <kill>:
     604:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
     608:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
     60c:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
     610:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
     614:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
     618:	e3a00006 	mov	r0, #6
     61c:	ef000040 	svc	0x00000040
     620:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     624:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     628:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
     62c:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
     630:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
     634:	e12fff1e 	bx	lr

00000638 <exec>:
     638:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
     63c:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
     640:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
     644:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
     648:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
     64c:	e3a00007 	mov	r0, #7
     650:	ef000040 	svc	0x00000040
     654:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     658:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     65c:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
     660:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
     664:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
     668:	e12fff1e 	bx	lr

0000066c <open>:
     66c:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
     670:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
     674:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
     678:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
     67c:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
     680:	e3a0000f 	mov	r0, #15
     684:	ef000040 	svc	0x00000040
     688:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     68c:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     690:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
     694:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
     698:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
     69c:	e12fff1e 	bx	lr

000006a0 <mknod>:
     6a0:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
     6a4:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
     6a8:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
     6ac:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
     6b0:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
     6b4:	e3a00011 	mov	r0, #17
     6b8:	ef000040 	svc	0x00000040
     6bc:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     6c0:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     6c4:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
     6c8:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
     6cc:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
     6d0:	e12fff1e 	bx	lr

000006d4 <unlink>:
     6d4:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
     6d8:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
     6dc:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
     6e0:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
     6e4:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
     6e8:	e3a00012 	mov	r0, #18
     6ec:	ef000040 	svc	0x00000040
     6f0:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     6f4:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     6f8:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
     6fc:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
     700:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
     704:	e12fff1e 	bx	lr

00000708 <fstat>:
     708:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
     70c:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
     710:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
     714:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
     718:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
     71c:	e3a00008 	mov	r0, #8
     720:	ef000040 	svc	0x00000040
     724:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     728:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     72c:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
     730:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
     734:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
     738:	e12fff1e 	bx	lr

0000073c <link>:
     73c:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
     740:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
     744:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
     748:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
     74c:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
     750:	e3a00013 	mov	r0, #19
     754:	ef000040 	svc	0x00000040
     758:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     75c:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     760:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
     764:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
     768:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
     76c:	e12fff1e 	bx	lr

00000770 <mkdir>:
     770:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
     774:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
     778:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
     77c:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
     780:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
     784:	e3a00014 	mov	r0, #20
     788:	ef000040 	svc	0x00000040
     78c:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     790:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     794:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
     798:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
     79c:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
     7a0:	e12fff1e 	bx	lr

000007a4 <chdir>:
     7a4:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
     7a8:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
     7ac:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
     7b0:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
     7b4:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
     7b8:	e3a00009 	mov	r0, #9
     7bc:	ef000040 	svc	0x00000040
     7c0:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     7c4:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     7c8:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
     7cc:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
     7d0:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
     7d4:	e12fff1e 	bx	lr

000007d8 <dup>:
     7d8:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
     7dc:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
     7e0:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
     7e4:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
     7e8:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
     7ec:	e3a0000a 	mov	r0, #10
     7f0:	ef000040 	svc	0x00000040
     7f4:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     7f8:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     7fc:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
     800:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
     804:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
     808:	e12fff1e 	bx	lr

0000080c <getpid>:
     80c:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
     810:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
     814:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
     818:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
     81c:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
     820:	e3a0000b 	mov	r0, #11
     824:	ef000040 	svc	0x00000040
     828:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     82c:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     830:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
     834:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
     838:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
     83c:	e12fff1e 	bx	lr

00000840 <sbrk>:
     840:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
     844:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
     848:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
     84c:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
     850:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
     854:	e3a0000c 	mov	r0, #12
     858:	ef000040 	svc	0x00000040
     85c:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     860:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     864:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
     868:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
     86c:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
     870:	e12fff1e 	bx	lr

00000874 <sleep>:
     874:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
     878:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
     87c:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
     880:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
     884:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
     888:	e3a0000d 	mov	r0, #13
     88c:	ef000040 	svc	0x00000040
     890:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     894:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     898:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
     89c:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
     8a0:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
     8a4:	e12fff1e 	bx	lr

000008a8 <uptime>:
     8a8:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
     8ac:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
     8b0:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
     8b4:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
     8b8:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
     8bc:	e3a0000e 	mov	r0, #14
     8c0:	ef000040 	svc	0x00000040
     8c4:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     8c8:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     8cc:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
     8d0:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
     8d4:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
     8d8:	e12fff1e 	bx	lr

000008dc <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
     8dc:	e92d4800 	push	{fp, lr}
     8e0:	e28db004 	add	fp, sp, #4
     8e4:	e24dd008 	sub	sp, sp, #8
     8e8:	e50b0008 	str	r0, [fp, #-8]
     8ec:	e1a03001 	mov	r3, r1
     8f0:	e54b3009 	strb	r3, [fp, #-9]
  write(fd, &c, 1);
     8f4:	e24b3009 	sub	r3, fp, #9
     8f8:	e3a02001 	mov	r2, #1
     8fc:	e1a01003 	mov	r1, r3
     900:	e51b0008 	ldr	r0, [fp, #-8]
     904:	ebffff24 	bl	59c <write>
}
     908:	e320f000 	nop	{0}
     90c:	e24bd004 	sub	sp, fp, #4
     910:	e8bd8800 	pop	{fp, pc}

00000914 <div>:

u32 div(u32 n, u32 d)  // long division
{
     914:	e52db004 	push	{fp}		@ (str fp, [sp, #-4]!)
     918:	e28db000 	add	fp, sp, #0
     91c:	e24dd01c 	sub	sp, sp, #28
     920:	e50b0018 	str	r0, [fp, #-24]	@ 0xffffffe8
     924:	e50b101c 	str	r1, [fp, #-28]	@ 0xffffffe4
    u32 q=0, r=0;
     928:	e3a03000 	mov	r3, #0
     92c:	e50b3008 	str	r3, [fp, #-8]
     930:	e3a03000 	mov	r3, #0
     934:	e50b300c 	str	r3, [fp, #-12]
    int i;

    for(i=31;i>=0;i--){
     938:	e3a0301f 	mov	r3, #31
     93c:	e50b3010 	str	r3, [fp, #-16]
     940:	ea00001b 	b	9b4 <div+0xa0>
        r = r << 1;
     944:	e51b300c 	ldr	r3, [fp, #-12]
     948:	e1a03083 	lsl	r3, r3, #1
     94c:	e50b300c 	str	r3, [fp, #-12]
        r = r | ((n >> i) & 1);
     950:	e51b2018 	ldr	r2, [fp, #-24]	@ 0xffffffe8
     954:	e51b3010 	ldr	r3, [fp, #-16]
     958:	e1a03332 	lsr	r3, r2, r3
     95c:	e2033001 	and	r3, r3, #1
     960:	e51b200c 	ldr	r2, [fp, #-12]
     964:	e1823003 	orr	r3, r2, r3
     968:	e50b300c 	str	r3, [fp, #-12]
        if(r >= d) {
     96c:	e51b200c 	ldr	r2, [fp, #-12]
     970:	e51b301c 	ldr	r3, [fp, #-28]	@ 0xffffffe4
     974:	e1520003 	cmp	r2, r3
     978:	3a00000a 	bcc	9a8 <div+0x94>
            r = r - d;
     97c:	e51b200c 	ldr	r2, [fp, #-12]
     980:	e51b301c 	ldr	r3, [fp, #-28]	@ 0xffffffe4
     984:	e0423003 	sub	r3, r2, r3
     988:	e50b300c 	str	r3, [fp, #-12]
            q = q | (1 << i);
     98c:	e3a02001 	mov	r2, #1
     990:	e51b3010 	ldr	r3, [fp, #-16]
     994:	e1a03312 	lsl	r3, r2, r3
     998:	e1a02003 	mov	r2, r3
     99c:	e51b3008 	ldr	r3, [fp, #-8]
     9a0:	e1833002 	orr	r3, r3, r2
     9a4:	e50b3008 	str	r3, [fp, #-8]
    for(i=31;i>=0;i--){
     9a8:	e51b3010 	ldr	r3, [fp, #-16]
     9ac:	e2433001 	sub	r3, r3, #1
     9b0:	e50b3010 	str	r3, [fp, #-16]
     9b4:	e51b3010 	ldr	r3, [fp, #-16]
     9b8:	e3530000 	cmp	r3, #0
     9bc:	aaffffe0 	bge	944 <div+0x30>
        }
    }
    return q;
     9c0:	e51b3008 	ldr	r3, [fp, #-8]
}
     9c4:	e1a00003 	mov	r0, r3
     9c8:	e28bd000 	add	sp, fp, #0
     9cc:	e49db004 	pop	{fp}		@ (ldr fp, [sp], #4)
     9d0:	e12fff1e 	bx	lr

000009d4 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
     9d4:	e92d4800 	push	{fp, lr}
     9d8:	e28db004 	add	fp, sp, #4
     9dc:	e24dd038 	sub	sp, sp, #56	@ 0x38
     9e0:	e50b0030 	str	r0, [fp, #-48]	@ 0xffffffd0
     9e4:	e50b1034 	str	r1, [fp, #-52]	@ 0xffffffcc
     9e8:	e50b2038 	str	r2, [fp, #-56]	@ 0xffffffc8
     9ec:	e50b303c 	str	r3, [fp, #-60]	@ 0xffffffc4
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x, y, b;

  neg = 0;
     9f0:	e3a03000 	mov	r3, #0
     9f4:	e50b300c 	str	r3, [fp, #-12]
  if(sgn && xx < 0){
     9f8:	e51b303c 	ldr	r3, [fp, #-60]	@ 0xffffffc4
     9fc:	e3530000 	cmp	r3, #0
     a00:	0a000008 	beq	a28 <printint+0x54>
     a04:	e51b3034 	ldr	r3, [fp, #-52]	@ 0xffffffcc
     a08:	e3530000 	cmp	r3, #0
     a0c:	aa000005 	bge	a28 <printint+0x54>
    neg = 1;
     a10:	e3a03001 	mov	r3, #1
     a14:	e50b300c 	str	r3, [fp, #-12]
    x = -xx;
     a18:	e51b3034 	ldr	r3, [fp, #-52]	@ 0xffffffcc
     a1c:	e2633000 	rsb	r3, r3, #0
     a20:	e50b3010 	str	r3, [fp, #-16]
     a24:	ea000001 	b	a30 <printint+0x5c>
  } else {
    x = xx;
     a28:	e51b3034 	ldr	r3, [fp, #-52]	@ 0xffffffcc
     a2c:	e50b3010 	str	r3, [fp, #-16]
  }

  b = base;
     a30:	e51b3038 	ldr	r3, [fp, #-56]	@ 0xffffffc8
     a34:	e50b3014 	str	r3, [fp, #-20]	@ 0xffffffec
  i = 0;
     a38:	e3a03000 	mov	r3, #0
     a3c:	e50b3008 	str	r3, [fp, #-8]
  do{
    y = div(x, b);
     a40:	e51b1014 	ldr	r1, [fp, #-20]	@ 0xffffffec
     a44:	e51b0010 	ldr	r0, [fp, #-16]
     a48:	ebffffb1 	bl	914 <div>
     a4c:	e50b0018 	str	r0, [fp, #-24]	@ 0xffffffe8
    buf[i++] = digits[x - y * b];
     a50:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
     a54:	e51b2014 	ldr	r2, [fp, #-20]	@ 0xffffffec
     a58:	e0030392 	mul	r3, r2, r3
     a5c:	e51b2010 	ldr	r2, [fp, #-16]
     a60:	e0421003 	sub	r1, r2, r3
     a64:	e51b2008 	ldr	r2, [fp, #-8]
     a68:	e2823001 	add	r3, r2, #1
     a6c:	e50b3008 	str	r3, [fp, #-8]
     a70:	e30130ec 	movw	r3, #4332	@ 0x10ec
     a74:	e3403000 	movt	r3, #0
     a78:	e7d31001 	ldrb	r1, [r3, r1]
     a7c:	e2423004 	sub	r3, r2, #4
     a80:	e083300b 	add	r3, r3, fp
     a84:	e1a02001 	mov	r2, r1
     a88:	e5432024 	strb	r2, [r3, #-36]	@ 0xffffffdc
  }while((x = y) != 0);
     a8c:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
     a90:	e50b3010 	str	r3, [fp, #-16]
     a94:	e51b3010 	ldr	r3, [fp, #-16]
     a98:	e3530000 	cmp	r3, #0
     a9c:	1affffe7 	bne	a40 <printint+0x6c>
  if(neg)
     aa0:	e51b300c 	ldr	r3, [fp, #-12]
     aa4:	e3530000 	cmp	r3, #0
     aa8:	0a00000e 	beq	ae8 <printint+0x114>
    buf[i++] = '-';
     aac:	e51b3008 	ldr	r3, [fp, #-8]
     ab0:	e2832001 	add	r2, r3, #1
     ab4:	e50b2008 	str	r2, [fp, #-8]
     ab8:	e2433004 	sub	r3, r3, #4
     abc:	e083300b 	add	r3, r3, fp
     ac0:	e3a0202d 	mov	r2, #45	@ 0x2d
     ac4:	e5432024 	strb	r2, [r3, #-36]	@ 0xffffffdc

  while(--i >= 0)
     ac8:	ea000006 	b	ae8 <printint+0x114>
    putc(fd, buf[i]);
     acc:	e24b2028 	sub	r2, fp, #40	@ 0x28
     ad0:	e51b3008 	ldr	r3, [fp, #-8]
     ad4:	e0823003 	add	r3, r2, r3
     ad8:	e5d33000 	ldrb	r3, [r3]
     adc:	e1a01003 	mov	r1, r3
     ae0:	e51b0030 	ldr	r0, [fp, #-48]	@ 0xffffffd0
     ae4:	ebffff7c 	bl	8dc <putc>
  while(--i >= 0)
     ae8:	e51b3008 	ldr	r3, [fp, #-8]
     aec:	e2433001 	sub	r3, r3, #1
     af0:	e50b3008 	str	r3, [fp, #-8]
     af4:	e51b3008 	ldr	r3, [fp, #-8]
     af8:	e3530000 	cmp	r3, #0
     afc:	aafffff2 	bge	acc <printint+0xf8>
}
     b00:	e320f000 	nop	{0}
     b04:	e320f000 	nop	{0}
     b08:	e24bd004 	sub	sp, fp, #4
     b0c:	e8bd8800 	pop	{fp, pc}

00000b10 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
     b10:	e92d000e 	push	{r1, r2, r3}
     b14:	e92d4800 	push	{fp, lr}
     b18:	e28db004 	add	fp, sp, #4
     b1c:	e24dd024 	sub	sp, sp, #36	@ 0x24
     b20:	e50b0024 	str	r0, [fp, #-36]	@ 0xffffffdc
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
     b24:	e3a03000 	mov	r3, #0
     b28:	e50b3014 	str	r3, [fp, #-20]	@ 0xffffffec
  ap = (uint*)(void*)&fmt + 1;
     b2c:	e28b3008 	add	r3, fp, #8
     b30:	e50b3018 	str	r3, [fp, #-24]	@ 0xffffffe8
  for(i = 0; fmt[i]; i++){
     b34:	e3a03000 	mov	r3, #0
     b38:	e50b3010 	str	r3, [fp, #-16]
     b3c:	ea000075 	b	d18 <printf+0x208>
    c = fmt[i] & 0xff;
     b40:	e59b2004 	ldr	r2, [fp, #4]
     b44:	e51b3010 	ldr	r3, [fp, #-16]
     b48:	e0823003 	add	r3, r2, r3
     b4c:	e5d33000 	ldrb	r3, [r3]
     b50:	e50b301c 	str	r3, [fp, #-28]	@ 0xffffffe4
    if(state == 0){
     b54:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
     b58:	e3530000 	cmp	r3, #0
     b5c:	1a00000b 	bne	b90 <printf+0x80>
      if(c == '%'){
     b60:	e51b301c 	ldr	r3, [fp, #-28]	@ 0xffffffe4
     b64:	e3530025 	cmp	r3, #37	@ 0x25
     b68:	1a000002 	bne	b78 <printf+0x68>
        state = '%';
     b6c:	e3a03025 	mov	r3, #37	@ 0x25
     b70:	e50b3014 	str	r3, [fp, #-20]	@ 0xffffffec
     b74:	ea000064 	b	d0c <printf+0x1fc>
      } else {
        putc(fd, c);
     b78:	e51b301c 	ldr	r3, [fp, #-28]	@ 0xffffffe4
     b7c:	e6ef3073 	uxtb	r3, r3
     b80:	e1a01003 	mov	r1, r3
     b84:	e51b0024 	ldr	r0, [fp, #-36]	@ 0xffffffdc
     b88:	ebffff53 	bl	8dc <putc>
     b8c:	ea00005e 	b	d0c <printf+0x1fc>
      }
    } else if(state == '%'){
     b90:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
     b94:	e3530025 	cmp	r3, #37	@ 0x25
     b98:	1a00005b 	bne	d0c <printf+0x1fc>
      if(c == 'd'){
     b9c:	e51b301c 	ldr	r3, [fp, #-28]	@ 0xffffffe4
     ba0:	e3530064 	cmp	r3, #100	@ 0x64
     ba4:	1a00000a 	bne	bd4 <printf+0xc4>
        printint(fd, *ap, 10, 1);
     ba8:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
     bac:	e5933000 	ldr	r3, [r3]
     bb0:	e1a01003 	mov	r1, r3
     bb4:	e3a03001 	mov	r3, #1
     bb8:	e3a0200a 	mov	r2, #10
     bbc:	e51b0024 	ldr	r0, [fp, #-36]	@ 0xffffffdc
     bc0:	ebffff83 	bl	9d4 <printint>
        ap++;
     bc4:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
     bc8:	e2833004 	add	r3, r3, #4
     bcc:	e50b3018 	str	r3, [fp, #-24]	@ 0xffffffe8
     bd0:	ea00004b 	b	d04 <printf+0x1f4>
      } else if(c == 'x' || c == 'p'){
     bd4:	e51b301c 	ldr	r3, [fp, #-28]	@ 0xffffffe4
     bd8:	e3530078 	cmp	r3, #120	@ 0x78
     bdc:	0a000002 	beq	bec <printf+0xdc>
     be0:	e51b301c 	ldr	r3, [fp, #-28]	@ 0xffffffe4
     be4:	e3530070 	cmp	r3, #112	@ 0x70
     be8:	1a00000a 	bne	c18 <printf+0x108>
        printint(fd, *ap, 16, 0);
     bec:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
     bf0:	e5933000 	ldr	r3, [r3]
     bf4:	e1a01003 	mov	r1, r3
     bf8:	e3a03000 	mov	r3, #0
     bfc:	e3a02010 	mov	r2, #16
     c00:	e51b0024 	ldr	r0, [fp, #-36]	@ 0xffffffdc
     c04:	ebffff72 	bl	9d4 <printint>
        ap++;
     c08:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
     c0c:	e2833004 	add	r3, r3, #4
     c10:	e50b3018 	str	r3, [fp, #-24]	@ 0xffffffe8
     c14:	ea00003a 	b	d04 <printf+0x1f4>
      } else if(c == 's'){
     c18:	e51b301c 	ldr	r3, [fp, #-28]	@ 0xffffffe4
     c1c:	e3530073 	cmp	r3, #115	@ 0x73
     c20:	1a000019 	bne	c8c <printf+0x17c>
        s = (char*)*ap;
     c24:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
     c28:	e5933000 	ldr	r3, [r3]
     c2c:	e50b300c 	str	r3, [fp, #-12]
        ap++;
     c30:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
     c34:	e2833004 	add	r3, r3, #4
     c38:	e50b3018 	str	r3, [fp, #-24]	@ 0xffffffe8
        if(s == 0)
     c3c:	e51b300c 	ldr	r3, [fp, #-12]
     c40:	e3530000 	cmp	r3, #0
     c44:	1a00000b 	bne	c78 <printf+0x168>
          s = "(null)";
     c48:	e30130e4 	movw	r3, #4324	@ 0x10e4
     c4c:	e3403000 	movt	r3, #0
     c50:	e50b300c 	str	r3, [fp, #-12]
        while(*s != 0){
     c54:	ea000007 	b	c78 <printf+0x168>
          putc(fd, *s);
     c58:	e51b300c 	ldr	r3, [fp, #-12]
     c5c:	e5d33000 	ldrb	r3, [r3]
     c60:	e1a01003 	mov	r1, r3
     c64:	e51b0024 	ldr	r0, [fp, #-36]	@ 0xffffffdc
     c68:	ebffff1b 	bl	8dc <putc>
          s++;
     c6c:	e51b300c 	ldr	r3, [fp, #-12]
     c70:	e2833001 	add	r3, r3, #1
     c74:	e50b300c 	str	r3, [fp, #-12]
        while(*s != 0){
     c78:	e51b300c 	ldr	r3, [fp, #-12]
     c7c:	e5d33000 	ldrb	r3, [r3]
     c80:	e3530000 	cmp	r3, #0
     c84:	1afffff3 	bne	c58 <printf+0x148>
     c88:	ea00001d 	b	d04 <printf+0x1f4>
        }
      } else if(c == 'c'){
     c8c:	e51b301c 	ldr	r3, [fp, #-28]	@ 0xffffffe4
     c90:	e3530063 	cmp	r3, #99	@ 0x63
     c94:	1a000009 	bne	cc0 <printf+0x1b0>
        putc(fd, *ap);
     c98:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
     c9c:	e5933000 	ldr	r3, [r3]
     ca0:	e6ef3073 	uxtb	r3, r3
     ca4:	e1a01003 	mov	r1, r3
     ca8:	e51b0024 	ldr	r0, [fp, #-36]	@ 0xffffffdc
     cac:	ebffff0a 	bl	8dc <putc>
        ap++;
     cb0:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
     cb4:	e2833004 	add	r3, r3, #4
     cb8:	e50b3018 	str	r3, [fp, #-24]	@ 0xffffffe8
     cbc:	ea000010 	b	d04 <printf+0x1f4>
      } else if(c == '%'){
     cc0:	e51b301c 	ldr	r3, [fp, #-28]	@ 0xffffffe4
     cc4:	e3530025 	cmp	r3, #37	@ 0x25
     cc8:	1a000005 	bne	ce4 <printf+0x1d4>
        putc(fd, c);
     ccc:	e51b301c 	ldr	r3, [fp, #-28]	@ 0xffffffe4
     cd0:	e6ef3073 	uxtb	r3, r3
     cd4:	e1a01003 	mov	r1, r3
     cd8:	e51b0024 	ldr	r0, [fp, #-36]	@ 0xffffffdc
     cdc:	ebfffefe 	bl	8dc <putc>
     ce0:	ea000007 	b	d04 <printf+0x1f4>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
     ce4:	e3a01025 	mov	r1, #37	@ 0x25
     ce8:	e51b0024 	ldr	r0, [fp, #-36]	@ 0xffffffdc
     cec:	ebfffefa 	bl	8dc <putc>
        putc(fd, c);
     cf0:	e51b301c 	ldr	r3, [fp, #-28]	@ 0xffffffe4
     cf4:	e6ef3073 	uxtb	r3, r3
     cf8:	e1a01003 	mov	r1, r3
     cfc:	e51b0024 	ldr	r0, [fp, #-36]	@ 0xffffffdc
     d00:	ebfffef5 	bl	8dc <putc>
      }
      state = 0;
     d04:	e3a03000 	mov	r3, #0
     d08:	e50b3014 	str	r3, [fp, #-20]	@ 0xffffffec
  for(i = 0; fmt[i]; i++){
     d0c:	e51b3010 	ldr	r3, [fp, #-16]
     d10:	e2833001 	add	r3, r3, #1
     d14:	e50b3010 	str	r3, [fp, #-16]
     d18:	e59b2004 	ldr	r2, [fp, #4]
     d1c:	e51b3010 	ldr	r3, [fp, #-16]
     d20:	e0823003 	add	r3, r2, r3
     d24:	e5d33000 	ldrb	r3, [r3]
     d28:	e3530000 	cmp	r3, #0
     d2c:	1affff83 	bne	b40 <printf+0x30>
    }
  }
}
     d30:	e320f000 	nop	{0}
     d34:	e320f000 	nop	{0}
     d38:	e24bd004 	sub	sp, fp, #4
     d3c:	e8bd4800 	pop	{fp, lr}
     d40:	e28dd00c 	add	sp, sp, #12
     d44:	e12fff1e 	bx	lr

00000d48 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
     d48:	e52db004 	push	{fp}		@ (str fp, [sp, #-4]!)
     d4c:	e28db000 	add	fp, sp, #0
     d50:	e24dd014 	sub	sp, sp, #20
     d54:	e50b0010 	str	r0, [fp, #-16]
  Header *bp, *p;

  bp = (Header*)ap - 1;
     d58:	e51b3010 	ldr	r3, [fp, #-16]
     d5c:	e2433008 	sub	r3, r3, #8
     d60:	e50b300c 	str	r3, [fp, #-12]
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
     d64:	e3013108 	movw	r3, #4360	@ 0x1108
     d68:	e3403000 	movt	r3, #0
     d6c:	e5933000 	ldr	r3, [r3]
     d70:	e50b3008 	str	r3, [fp, #-8]
     d74:	ea000010 	b	dbc <free+0x74>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
     d78:	e51b3008 	ldr	r3, [fp, #-8]
     d7c:	e5933000 	ldr	r3, [r3]
     d80:	e51b2008 	ldr	r2, [fp, #-8]
     d84:	e1520003 	cmp	r2, r3
     d88:	3a000008 	bcc	db0 <free+0x68>
     d8c:	e51b200c 	ldr	r2, [fp, #-12]
     d90:	e51b3008 	ldr	r3, [fp, #-8]
     d94:	e1520003 	cmp	r2, r3
     d98:	8a000010 	bhi	de0 <free+0x98>
     d9c:	e51b3008 	ldr	r3, [fp, #-8]
     da0:	e5933000 	ldr	r3, [r3]
     da4:	e51b200c 	ldr	r2, [fp, #-12]
     da8:	e1520003 	cmp	r2, r3
     dac:	3a00000b 	bcc	de0 <free+0x98>
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
     db0:	e51b3008 	ldr	r3, [fp, #-8]
     db4:	e5933000 	ldr	r3, [r3]
     db8:	e50b3008 	str	r3, [fp, #-8]
     dbc:	e51b200c 	ldr	r2, [fp, #-12]
     dc0:	e51b3008 	ldr	r3, [fp, #-8]
     dc4:	e1520003 	cmp	r2, r3
     dc8:	9affffea 	bls	d78 <free+0x30>
     dcc:	e51b3008 	ldr	r3, [fp, #-8]
     dd0:	e5933000 	ldr	r3, [r3]
     dd4:	e51b200c 	ldr	r2, [fp, #-12]
     dd8:	e1520003 	cmp	r2, r3
     ddc:	2affffe5 	bcs	d78 <free+0x30>
      break;
  if(bp + bp->s.size == p->s.ptr){
     de0:	e51b300c 	ldr	r3, [fp, #-12]
     de4:	e5933004 	ldr	r3, [r3, #4]
     de8:	e1a03183 	lsl	r3, r3, #3
     dec:	e51b200c 	ldr	r2, [fp, #-12]
     df0:	e0822003 	add	r2, r2, r3
     df4:	e51b3008 	ldr	r3, [fp, #-8]
     df8:	e5933000 	ldr	r3, [r3]
     dfc:	e1520003 	cmp	r2, r3
     e00:	1a00000d 	bne	e3c <free+0xf4>
    bp->s.size += p->s.ptr->s.size;
     e04:	e51b300c 	ldr	r3, [fp, #-12]
     e08:	e5932004 	ldr	r2, [r3, #4]
     e0c:	e51b3008 	ldr	r3, [fp, #-8]
     e10:	e5933000 	ldr	r3, [r3]
     e14:	e5933004 	ldr	r3, [r3, #4]
     e18:	e0822003 	add	r2, r2, r3
     e1c:	e51b300c 	ldr	r3, [fp, #-12]
     e20:	e5832004 	str	r2, [r3, #4]
    bp->s.ptr = p->s.ptr->s.ptr;
     e24:	e51b3008 	ldr	r3, [fp, #-8]
     e28:	e5933000 	ldr	r3, [r3]
     e2c:	e5932000 	ldr	r2, [r3]
     e30:	e51b300c 	ldr	r3, [fp, #-12]
     e34:	e5832000 	str	r2, [r3]
     e38:	ea000003 	b	e4c <free+0x104>
  } else
    bp->s.ptr = p->s.ptr;
     e3c:	e51b3008 	ldr	r3, [fp, #-8]
     e40:	e5932000 	ldr	r2, [r3]
     e44:	e51b300c 	ldr	r3, [fp, #-12]
     e48:	e5832000 	str	r2, [r3]
  if(p + p->s.size == bp){
     e4c:	e51b3008 	ldr	r3, [fp, #-8]
     e50:	e5933004 	ldr	r3, [r3, #4]
     e54:	e1a03183 	lsl	r3, r3, #3
     e58:	e51b2008 	ldr	r2, [fp, #-8]
     e5c:	e0823003 	add	r3, r2, r3
     e60:	e51b200c 	ldr	r2, [fp, #-12]
     e64:	e1520003 	cmp	r2, r3
     e68:	1a00000b 	bne	e9c <free+0x154>
    p->s.size += bp->s.size;
     e6c:	e51b3008 	ldr	r3, [fp, #-8]
     e70:	e5932004 	ldr	r2, [r3, #4]
     e74:	e51b300c 	ldr	r3, [fp, #-12]
     e78:	e5933004 	ldr	r3, [r3, #4]
     e7c:	e0822003 	add	r2, r2, r3
     e80:	e51b3008 	ldr	r3, [fp, #-8]
     e84:	e5832004 	str	r2, [r3, #4]
    p->s.ptr = bp->s.ptr;
     e88:	e51b300c 	ldr	r3, [fp, #-12]
     e8c:	e5932000 	ldr	r2, [r3]
     e90:	e51b3008 	ldr	r3, [fp, #-8]
     e94:	e5832000 	str	r2, [r3]
     e98:	ea000002 	b	ea8 <free+0x160>
  } else
    p->s.ptr = bp;
     e9c:	e51b3008 	ldr	r3, [fp, #-8]
     ea0:	e51b200c 	ldr	r2, [fp, #-12]
     ea4:	e5832000 	str	r2, [r3]
  freep = p;
     ea8:	e3013108 	movw	r3, #4360	@ 0x1108
     eac:	e3403000 	movt	r3, #0
     eb0:	e51b2008 	ldr	r2, [fp, #-8]
     eb4:	e5832000 	str	r2, [r3]
}
     eb8:	e320f000 	nop	{0}
     ebc:	e28bd000 	add	sp, fp, #0
     ec0:	e49db004 	pop	{fp}		@ (ldr fp, [sp], #4)
     ec4:	e12fff1e 	bx	lr

00000ec8 <morecore>:

static Header*
morecore(uint nu)
{
     ec8:	e92d4800 	push	{fp, lr}
     ecc:	e28db004 	add	fp, sp, #4
     ed0:	e24dd010 	sub	sp, sp, #16
     ed4:	e50b0010 	str	r0, [fp, #-16]
  char *p;
  Header *hp;

  if(nu < 4096)
     ed8:	e51b3010 	ldr	r3, [fp, #-16]
     edc:	e3530a01 	cmp	r3, #4096	@ 0x1000
     ee0:	2a000001 	bcs	eec <morecore+0x24>
    nu = 4096;
     ee4:	e3a03a01 	mov	r3, #4096	@ 0x1000
     ee8:	e50b3010 	str	r3, [fp, #-16]
  p = sbrk(nu * sizeof(Header));
     eec:	e51b3010 	ldr	r3, [fp, #-16]
     ef0:	e1a03183 	lsl	r3, r3, #3
     ef4:	e1a00003 	mov	r0, r3
     ef8:	ebfffe50 	bl	840 <sbrk>
     efc:	e50b0008 	str	r0, [fp, #-8]
  if(p == (char*)-1)
     f00:	e51b3008 	ldr	r3, [fp, #-8]
     f04:	e3730001 	cmn	r3, #1
     f08:	1a000001 	bne	f14 <morecore+0x4c>
    return 0;
     f0c:	e3a03000 	mov	r3, #0
     f10:	ea00000b 	b	f44 <morecore+0x7c>
  hp = (Header*)p;
     f14:	e51b3008 	ldr	r3, [fp, #-8]
     f18:	e50b300c 	str	r3, [fp, #-12]
  hp->s.size = nu;
     f1c:	e51b300c 	ldr	r3, [fp, #-12]
     f20:	e51b2010 	ldr	r2, [fp, #-16]
     f24:	e5832004 	str	r2, [r3, #4]
  free((void*)(hp + 1));
     f28:	e51b300c 	ldr	r3, [fp, #-12]
     f2c:	e2833008 	add	r3, r3, #8
     f30:	e1a00003 	mov	r0, r3
     f34:	ebffff83 	bl	d48 <free>
  return freep;
     f38:	e3013108 	movw	r3, #4360	@ 0x1108
     f3c:	e3403000 	movt	r3, #0
     f40:	e5933000 	ldr	r3, [r3]
}
     f44:	e1a00003 	mov	r0, r3
     f48:	e24bd004 	sub	sp, fp, #4
     f4c:	e8bd8800 	pop	{fp, pc}

00000f50 <malloc>:

void*
malloc(uint nbytes)
{
     f50:	e92d4800 	push	{fp, lr}
     f54:	e28db004 	add	fp, sp, #4
     f58:	e24dd018 	sub	sp, sp, #24
     f5c:	e50b0018 	str	r0, [fp, #-24]	@ 0xffffffe8
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
     f60:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
     f64:	e2833007 	add	r3, r3, #7
     f68:	e1a031a3 	lsr	r3, r3, #3
     f6c:	e2833001 	add	r3, r3, #1
     f70:	e50b3010 	str	r3, [fp, #-16]
  if((prevp = freep) == 0){
     f74:	e3013108 	movw	r3, #4360	@ 0x1108
     f78:	e3403000 	movt	r3, #0
     f7c:	e5933000 	ldr	r3, [r3]
     f80:	e50b300c 	str	r3, [fp, #-12]
     f84:	e51b300c 	ldr	r3, [fp, #-12]
     f88:	e3530000 	cmp	r3, #0
     f8c:	1a000010 	bne	fd4 <malloc+0x84>
    base.s.ptr = freep = prevp = &base;
     f90:	e3013100 	movw	r3, #4352	@ 0x1100
     f94:	e3403000 	movt	r3, #0
     f98:	e50b300c 	str	r3, [fp, #-12]
     f9c:	e3013108 	movw	r3, #4360	@ 0x1108
     fa0:	e3403000 	movt	r3, #0
     fa4:	e51b200c 	ldr	r2, [fp, #-12]
     fa8:	e5832000 	str	r2, [r3]
     fac:	e3013108 	movw	r3, #4360	@ 0x1108
     fb0:	e3403000 	movt	r3, #0
     fb4:	e5932000 	ldr	r2, [r3]
     fb8:	e3013100 	movw	r3, #4352	@ 0x1100
     fbc:	e3403000 	movt	r3, #0
     fc0:	e5832000 	str	r2, [r3]
    base.s.size = 0;
     fc4:	e3013100 	movw	r3, #4352	@ 0x1100
     fc8:	e3403000 	movt	r3, #0
     fcc:	e3a02000 	mov	r2, #0
     fd0:	e5832004 	str	r2, [r3, #4]
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
     fd4:	e51b300c 	ldr	r3, [fp, #-12]
     fd8:	e5933000 	ldr	r3, [r3]
     fdc:	e50b3008 	str	r3, [fp, #-8]
    if(p->s.size >= nunits){
     fe0:	e51b3008 	ldr	r3, [fp, #-8]
     fe4:	e5933004 	ldr	r3, [r3, #4]
     fe8:	e51b2010 	ldr	r2, [fp, #-16]
     fec:	e1520003 	cmp	r2, r3
     ff0:	8a00001f 	bhi	1074 <malloc+0x124>
      if(p->s.size == nunits)
     ff4:	e51b3008 	ldr	r3, [fp, #-8]
     ff8:	e5933004 	ldr	r3, [r3, #4]
     ffc:	e51b2010 	ldr	r2, [fp, #-16]
    1000:	e1520003 	cmp	r2, r3
    1004:	1a000004 	bne	101c <malloc+0xcc>
        prevp->s.ptr = p->s.ptr;
    1008:	e51b3008 	ldr	r3, [fp, #-8]
    100c:	e5932000 	ldr	r2, [r3]
    1010:	e51b300c 	ldr	r3, [fp, #-12]
    1014:	e5832000 	str	r2, [r3]
    1018:	ea00000e 	b	1058 <malloc+0x108>
      else {
        p->s.size -= nunits;
    101c:	e51b3008 	ldr	r3, [fp, #-8]
    1020:	e5932004 	ldr	r2, [r3, #4]
    1024:	e51b3010 	ldr	r3, [fp, #-16]
    1028:	e0422003 	sub	r2, r2, r3
    102c:	e51b3008 	ldr	r3, [fp, #-8]
    1030:	e5832004 	str	r2, [r3, #4]
        p += p->s.size;
    1034:	e51b3008 	ldr	r3, [fp, #-8]
    1038:	e5933004 	ldr	r3, [r3, #4]
    103c:	e1a03183 	lsl	r3, r3, #3
    1040:	e51b2008 	ldr	r2, [fp, #-8]
    1044:	e0823003 	add	r3, r2, r3
    1048:	e50b3008 	str	r3, [fp, #-8]
        p->s.size = nunits;
    104c:	e51b3008 	ldr	r3, [fp, #-8]
    1050:	e51b2010 	ldr	r2, [fp, #-16]
    1054:	e5832004 	str	r2, [r3, #4]
      }
      freep = prevp;
    1058:	e3013108 	movw	r3, #4360	@ 0x1108
    105c:	e3403000 	movt	r3, #0
    1060:	e51b200c 	ldr	r2, [fp, #-12]
    1064:	e5832000 	str	r2, [r3]
      return (void*)(p + 1);
    1068:	e51b3008 	ldr	r3, [fp, #-8]
    106c:	e2833008 	add	r3, r3, #8
    1070:	ea000013 	b	10c4 <malloc+0x174>
    }
    if(p == freep)
    1074:	e3013108 	movw	r3, #4360	@ 0x1108
    1078:	e3403000 	movt	r3, #0
    107c:	e5933000 	ldr	r3, [r3]
    1080:	e51b2008 	ldr	r2, [fp, #-8]
    1084:	e1520003 	cmp	r2, r3
    1088:	1a000007 	bne	10ac <malloc+0x15c>
      if((p = morecore(nunits)) == 0)
    108c:	e51b0010 	ldr	r0, [fp, #-16]
    1090:	ebffff8c 	bl	ec8 <morecore>
    1094:	e50b0008 	str	r0, [fp, #-8]
    1098:	e51b3008 	ldr	r3, [fp, #-8]
    109c:	e3530000 	cmp	r3, #0
    10a0:	1a000001 	bne	10ac <malloc+0x15c>
        return 0;
    10a4:	e3a03000 	mov	r3, #0
    10a8:	ea000005 	b	10c4 <malloc+0x174>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    10ac:	e51b3008 	ldr	r3, [fp, #-8]
    10b0:	e50b300c 	str	r3, [fp, #-12]
    10b4:	e51b3008 	ldr	r3, [fp, #-8]
    10b8:	e5933000 	ldr	r3, [r3]
    10bc:	e50b3008 	str	r3, [fp, #-8]
    if(p->s.size >= nunits){
    10c0:	eaffffc6 	b	fe0 <malloc+0x90>
  }
}
    10c4:	e1a00003 	mov	r0, r3
    10c8:	e24bd004 	sub	sp, fp, #4
    10cc:	e8bd8800 	pop	{fp, pc}
