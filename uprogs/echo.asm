
_echo:     file format elf32-littlearm


Disassembly of section .text:

00000000 <main>:
#include "stat.h"
#include "user.h"

int
main(int argc, char *argv[])
{
       0:	e92d4800 	push	{fp, lr}
       4:	e28db004 	add	fp, sp, #4
       8:	e24dd010 	sub	sp, sp, #16
       c:	e50b0010 	str	r0, [fp, #-16]
      10:	e50b1014 	str	r1, [fp, #-20]	@ 0xffffffec
  int i;

  for(i = 1; i < argc; i++)
      14:	e3a03001 	mov	r3, #1
      18:	e50b3008 	str	r3, [fp, #-8]
      1c:	ea000016 	b	7c <main+0x7c>
    printf(1, "%s%s", argv[i], i+1 < argc ? " " : "\n");
      20:	e51b3008 	ldr	r3, [fp, #-8]
      24:	e1a03103 	lsl	r3, r3, #2
      28:	e51b2014 	ldr	r2, [fp, #-20]	@ 0xffffffec
      2c:	e0823003 	add	r3, r2, r3
      30:	e5931000 	ldr	r1, [r3]
      34:	e51b3008 	ldr	r3, [fp, #-8]
      38:	e2833001 	add	r3, r3, #1
      3c:	e51b2010 	ldr	r2, [fp, #-16]
      40:	e1520003 	cmp	r2, r3
      44:	da000002 	ble	54 <main+0x54>
      48:	e30130d8 	movw	r3, #4312	@ 0x10d8
      4c:	e3403000 	movt	r3, #0
      50:	ea000001 	b	5c <main+0x5c>
      54:	e30130dc 	movw	r3, #4316	@ 0x10dc
      58:	e3403000 	movt	r3, #0
      5c:	e1a02001 	mov	r2, r1
      60:	e30110e0 	movw	r1, #4320	@ 0x10e0
      64:	e3401000 	movt	r1, #0
      68:	e3a00001 	mov	r0, #1
      6c:	eb0002a9 	bl	b18 <printf>
  for(i = 1; i < argc; i++)
      70:	e51b3008 	ldr	r3, [fp, #-8]
      74:	e2833001 	add	r3, r3, #1
      78:	e50b3008 	str	r3, [fp, #-8]
      7c:	e51b2008 	ldr	r2, [fp, #-8]
      80:	e51b3010 	ldr	r3, [fp, #-16]
      84:	e1520003 	cmp	r2, r3
      88:	baffffe4 	blt	20 <main+0x20>
  exit();
      8c:	eb000110 	bl	4d4 <exit>

00000090 <strcpy>:
#include "user.h"
#include "arm.h"

char*
strcpy(char *s, char *t)
{
      90:	e52db004 	push	{fp}		@ (str fp, [sp, #-4]!)
      94:	e28db000 	add	fp, sp, #0
      98:	e24dd014 	sub	sp, sp, #20
      9c:	e50b0010 	str	r0, [fp, #-16]
      a0:	e50b1014 	str	r1, [fp, #-20]	@ 0xffffffec
  char *os;

  os = s;
      a4:	e51b3010 	ldr	r3, [fp, #-16]
      a8:	e50b3008 	str	r3, [fp, #-8]
  while((*s++ = *t++) != 0)
      ac:	e320f000 	nop	{0}
      b0:	e51b2014 	ldr	r2, [fp, #-20]	@ 0xffffffec
      b4:	e2823001 	add	r3, r2, #1
      b8:	e50b3014 	str	r3, [fp, #-20]	@ 0xffffffec
      bc:	e51b3010 	ldr	r3, [fp, #-16]
      c0:	e2831001 	add	r1, r3, #1
      c4:	e50b1010 	str	r1, [fp, #-16]
      c8:	e5d22000 	ldrb	r2, [r2]
      cc:	e5c32000 	strb	r2, [r3]
      d0:	e5d33000 	ldrb	r3, [r3]
      d4:	e3530000 	cmp	r3, #0
      d8:	1afffff4 	bne	b0 <strcpy+0x20>
    ;
  return os;
      dc:	e51b3008 	ldr	r3, [fp, #-8]
}
      e0:	e1a00003 	mov	r0, r3
      e4:	e28bd000 	add	sp, fp, #0
      e8:	e49db004 	pop	{fp}		@ (ldr fp, [sp], #4)
      ec:	e12fff1e 	bx	lr

000000f0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
      f0:	e52db004 	push	{fp}		@ (str fp, [sp, #-4]!)
      f4:	e28db000 	add	fp, sp, #0
      f8:	e24dd00c 	sub	sp, sp, #12
      fc:	e50b0008 	str	r0, [fp, #-8]
     100:	e50b100c 	str	r1, [fp, #-12]
  while(*p && *p == *q)
     104:	ea000005 	b	120 <strcmp+0x30>
    p++, q++;
     108:	e51b3008 	ldr	r3, [fp, #-8]
     10c:	e2833001 	add	r3, r3, #1
     110:	e50b3008 	str	r3, [fp, #-8]
     114:	e51b300c 	ldr	r3, [fp, #-12]
     118:	e2833001 	add	r3, r3, #1
     11c:	e50b300c 	str	r3, [fp, #-12]
  while(*p && *p == *q)
     120:	e51b3008 	ldr	r3, [fp, #-8]
     124:	e5d33000 	ldrb	r3, [r3]
     128:	e3530000 	cmp	r3, #0
     12c:	0a000005 	beq	148 <strcmp+0x58>
     130:	e51b3008 	ldr	r3, [fp, #-8]
     134:	e5d32000 	ldrb	r2, [r3]
     138:	e51b300c 	ldr	r3, [fp, #-12]
     13c:	e5d33000 	ldrb	r3, [r3]
     140:	e1520003 	cmp	r2, r3
     144:	0affffef 	beq	108 <strcmp+0x18>
  return (uchar)*p - (uchar)*q;
     148:	e51b3008 	ldr	r3, [fp, #-8]
     14c:	e5d33000 	ldrb	r3, [r3]
     150:	e1a02003 	mov	r2, r3
     154:	e51b300c 	ldr	r3, [fp, #-12]
     158:	e5d33000 	ldrb	r3, [r3]
     15c:	e0423003 	sub	r3, r2, r3
}
     160:	e1a00003 	mov	r0, r3
     164:	e28bd000 	add	sp, fp, #0
     168:	e49db004 	pop	{fp}		@ (ldr fp, [sp], #4)
     16c:	e12fff1e 	bx	lr

00000170 <strlen>:

uint
strlen(char *s)
{
     170:	e52db004 	push	{fp}		@ (str fp, [sp, #-4]!)
     174:	e28db000 	add	fp, sp, #0
     178:	e24dd014 	sub	sp, sp, #20
     17c:	e50b0010 	str	r0, [fp, #-16]
  int n;

  for(n = 0; s[n]; n++)
     180:	e3a03000 	mov	r3, #0
     184:	e50b3008 	str	r3, [fp, #-8]
     188:	ea000002 	b	198 <strlen+0x28>
     18c:	e51b3008 	ldr	r3, [fp, #-8]
     190:	e2833001 	add	r3, r3, #1
     194:	e50b3008 	str	r3, [fp, #-8]
     198:	e51b3008 	ldr	r3, [fp, #-8]
     19c:	e51b2010 	ldr	r2, [fp, #-16]
     1a0:	e0823003 	add	r3, r2, r3
     1a4:	e5d33000 	ldrb	r3, [r3]
     1a8:	e3530000 	cmp	r3, #0
     1ac:	1afffff6 	bne	18c <strlen+0x1c>
    ;
  return n;
     1b0:	e51b3008 	ldr	r3, [fp, #-8]
}
     1b4:	e1a00003 	mov	r0, r3
     1b8:	e28bd000 	add	sp, fp, #0
     1bc:	e49db004 	pop	{fp}		@ (ldr fp, [sp], #4)
     1c0:	e12fff1e 	bx	lr

000001c4 <memset>:

void*
memset(void *dst, int c, uint n)
{
     1c4:	e52db004 	push	{fp}		@ (str fp, [sp, #-4]!)
     1c8:	e28db000 	add	fp, sp, #0
     1cc:	e24dd01c 	sub	sp, sp, #28
     1d0:	e50b0010 	str	r0, [fp, #-16]
     1d4:	e50b1014 	str	r1, [fp, #-20]	@ 0xffffffec
     1d8:	e50b2018 	str	r2, [fp, #-24]	@ 0xffffffe8
  char *p=dst;
     1dc:	e51b3010 	ldr	r3, [fp, #-16]
     1e0:	e50b3008 	str	r3, [fp, #-8]
  u32 rc=n;
     1e4:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
     1e8:	e50b300c 	str	r3, [fp, #-12]

  while (rc-- > 0) *p++ = c;
     1ec:	ea000005 	b	208 <memset+0x44>
     1f0:	e51b3008 	ldr	r3, [fp, #-8]
     1f4:	e2832001 	add	r2, r3, #1
     1f8:	e50b2008 	str	r2, [fp, #-8]
     1fc:	e51b2014 	ldr	r2, [fp, #-20]	@ 0xffffffec
     200:	e6ef2072 	uxtb	r2, r2
     204:	e5c32000 	strb	r2, [r3]
     208:	e51b300c 	ldr	r3, [fp, #-12]
     20c:	e2432001 	sub	r2, r3, #1
     210:	e50b200c 	str	r2, [fp, #-12]
     214:	e3530000 	cmp	r3, #0
     218:	1afffff4 	bne	1f0 <memset+0x2c>
  return (void *)p;
     21c:	e51b3008 	ldr	r3, [fp, #-8]
}
     220:	e1a00003 	mov	r0, r3
     224:	e28bd000 	add	sp, fp, #0
     228:	e49db004 	pop	{fp}		@ (ldr fp, [sp], #4)
     22c:	e12fff1e 	bx	lr

00000230 <strchr>:

char*
strchr(const char *s, char c)
{
     230:	e52db004 	push	{fp}		@ (str fp, [sp, #-4]!)
     234:	e28db000 	add	fp, sp, #0
     238:	e24dd00c 	sub	sp, sp, #12
     23c:	e50b0008 	str	r0, [fp, #-8]
     240:	e1a03001 	mov	r3, r1
     244:	e54b3009 	strb	r3, [fp, #-9]
  for(; *s; s++)
     248:	ea000009 	b	274 <strchr+0x44>
    if(*s == c)
     24c:	e51b3008 	ldr	r3, [fp, #-8]
     250:	e5d33000 	ldrb	r3, [r3]
     254:	e55b2009 	ldrb	r2, [fp, #-9]
     258:	e1520003 	cmp	r2, r3
     25c:	1a000001 	bne	268 <strchr+0x38>
      return (char*)s;
     260:	e51b3008 	ldr	r3, [fp, #-8]
     264:	ea000007 	b	288 <strchr+0x58>
  for(; *s; s++)
     268:	e51b3008 	ldr	r3, [fp, #-8]
     26c:	e2833001 	add	r3, r3, #1
     270:	e50b3008 	str	r3, [fp, #-8]
     274:	e51b3008 	ldr	r3, [fp, #-8]
     278:	e5d33000 	ldrb	r3, [r3]
     27c:	e3530000 	cmp	r3, #0
     280:	1afffff1 	bne	24c <strchr+0x1c>
  return 0;
     284:	e3a03000 	mov	r3, #0
}
     288:	e1a00003 	mov	r0, r3
     28c:	e28bd000 	add	sp, fp, #0
     290:	e49db004 	pop	{fp}		@ (ldr fp, [sp], #4)
     294:	e12fff1e 	bx	lr

00000298 <gets>:

char*
gets(char *buf, int max)
{
     298:	e92d4800 	push	{fp, lr}
     29c:	e28db004 	add	fp, sp, #4
     2a0:	e24dd018 	sub	sp, sp, #24
     2a4:	e50b0018 	str	r0, [fp, #-24]	@ 0xffffffe8
     2a8:	e50b101c 	str	r1, [fp, #-28]	@ 0xffffffe4
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
     2ac:	e3a03000 	mov	r3, #0
     2b0:	e50b3008 	str	r3, [fp, #-8]
     2b4:	ea000016 	b	314 <gets+0x7c>
    cc = read(0, &c, 1);
     2b8:	e24b300d 	sub	r3, fp, #13
     2bc:	e3a02001 	mov	r2, #1
     2c0:	e1a01003 	mov	r1, r3
     2c4:	e3a00000 	mov	r0, #0
     2c8:	eb0000a8 	bl	570 <read>
     2cc:	e50b000c 	str	r0, [fp, #-12]
    if(cc < 1)
     2d0:	e51b300c 	ldr	r3, [fp, #-12]
     2d4:	e3530000 	cmp	r3, #0
     2d8:	da000013 	ble	32c <gets+0x94>
      break;
    buf[i++] = c;
     2dc:	e51b3008 	ldr	r3, [fp, #-8]
     2e0:	e2832001 	add	r2, r3, #1
     2e4:	e50b2008 	str	r2, [fp, #-8]
     2e8:	e1a02003 	mov	r2, r3
     2ec:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
     2f0:	e0833002 	add	r3, r3, r2
     2f4:	e55b200d 	ldrb	r2, [fp, #-13]
     2f8:	e5c32000 	strb	r2, [r3]
    if(c == '\n' || c == '\r')
     2fc:	e55b300d 	ldrb	r3, [fp, #-13]
     300:	e353000a 	cmp	r3, #10
     304:	0a000009 	beq	330 <gets+0x98>
     308:	e55b300d 	ldrb	r3, [fp, #-13]
     30c:	e353000d 	cmp	r3, #13
     310:	0a000006 	beq	330 <gets+0x98>
  for(i=0; i+1 < max; ){
     314:	e51b3008 	ldr	r3, [fp, #-8]
     318:	e2833001 	add	r3, r3, #1
     31c:	e51b201c 	ldr	r2, [fp, #-28]	@ 0xffffffe4
     320:	e1520003 	cmp	r2, r3
     324:	caffffe3 	bgt	2b8 <gets+0x20>
     328:	ea000000 	b	330 <gets+0x98>
      break;
     32c:	e320f000 	nop	{0}
      break;
  }
  buf[i] = '\0';
     330:	e51b3008 	ldr	r3, [fp, #-8]
     334:	e51b2018 	ldr	r2, [fp, #-24]	@ 0xffffffe8
     338:	e0823003 	add	r3, r2, r3
     33c:	e3a02000 	mov	r2, #0
     340:	e5c32000 	strb	r2, [r3]
  return buf;
     344:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
}
     348:	e1a00003 	mov	r0, r3
     34c:	e24bd004 	sub	sp, fp, #4
     350:	e8bd8800 	pop	{fp, pc}

00000354 <stat>:

int
stat(char *n, struct stat *st)
{
     354:	e92d4800 	push	{fp, lr}
     358:	e28db004 	add	fp, sp, #4
     35c:	e24dd010 	sub	sp, sp, #16
     360:	e50b0010 	str	r0, [fp, #-16]
     364:	e50b1014 	str	r1, [fp, #-20]	@ 0xffffffec
  int fd;
  int r;

  fd = open(n, O_RDONLY);
     368:	e3a01000 	mov	r1, #0
     36c:	e51b0010 	ldr	r0, [fp, #-16]
     370:	eb0000bf 	bl	674 <open>
     374:	e50b0008 	str	r0, [fp, #-8]
  if(fd < 0)
     378:	e51b3008 	ldr	r3, [fp, #-8]
     37c:	e3530000 	cmp	r3, #0
     380:	aa000001 	bge	38c <stat+0x38>
    return -1;
     384:	e3e03000 	mvn	r3, #0
     388:	ea000006 	b	3a8 <stat+0x54>
  r = fstat(fd, st);
     38c:	e51b1014 	ldr	r1, [fp, #-20]	@ 0xffffffec
     390:	e51b0008 	ldr	r0, [fp, #-8]
     394:	eb0000dd 	bl	710 <fstat>
     398:	e50b000c 	str	r0, [fp, #-12]
  close(fd);
     39c:	e51b0008 	ldr	r0, [fp, #-8]
     3a0:	eb00008c 	bl	5d8 <close>
  return r;
     3a4:	e51b300c 	ldr	r3, [fp, #-12]
}
     3a8:	e1a00003 	mov	r0, r3
     3ac:	e24bd004 	sub	sp, fp, #4
     3b0:	e8bd8800 	pop	{fp, pc}

000003b4 <atoi>:

int
atoi(const char *s)
{
     3b4:	e52db004 	push	{fp}		@ (str fp, [sp, #-4]!)
     3b8:	e28db000 	add	fp, sp, #0
     3bc:	e24dd014 	sub	sp, sp, #20
     3c0:	e50b0010 	str	r0, [fp, #-16]
  int n;

  n = 0;
     3c4:	e3a03000 	mov	r3, #0
     3c8:	e50b3008 	str	r3, [fp, #-8]
  while('0' <= *s && *s <= '9')
     3cc:	ea000009 	b	3f8 <atoi+0x44>
    n = n*10 + *s++ - '0';
     3d0:	e51b3008 	ldr	r3, [fp, #-8]
     3d4:	e3a0200a 	mov	r2, #10
     3d8:	e0020392 	mul	r2, r2, r3
     3dc:	e51b3010 	ldr	r3, [fp, #-16]
     3e0:	e2831001 	add	r1, r3, #1
     3e4:	e50b1010 	str	r1, [fp, #-16]
     3e8:	e5d33000 	ldrb	r3, [r3]
     3ec:	e0823003 	add	r3, r2, r3
     3f0:	e2433030 	sub	r3, r3, #48	@ 0x30
     3f4:	e50b3008 	str	r3, [fp, #-8]
  while('0' <= *s && *s <= '9')
     3f8:	e51b3010 	ldr	r3, [fp, #-16]
     3fc:	e5d33000 	ldrb	r3, [r3]
     400:	e353002f 	cmp	r3, #47	@ 0x2f
     404:	9a000003 	bls	418 <atoi+0x64>
     408:	e51b3010 	ldr	r3, [fp, #-16]
     40c:	e5d33000 	ldrb	r3, [r3]
     410:	e3530039 	cmp	r3, #57	@ 0x39
     414:	9affffed 	bls	3d0 <atoi+0x1c>
  return n;
     418:	e51b3008 	ldr	r3, [fp, #-8]
}
     41c:	e1a00003 	mov	r0, r3
     420:	e28bd000 	add	sp, fp, #0
     424:	e49db004 	pop	{fp}		@ (ldr fp, [sp], #4)
     428:	e12fff1e 	bx	lr

0000042c <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
     42c:	e52db004 	push	{fp}		@ (str fp, [sp, #-4]!)
     430:	e28db000 	add	fp, sp, #0
     434:	e24dd01c 	sub	sp, sp, #28
     438:	e50b0010 	str	r0, [fp, #-16]
     43c:	e50b1014 	str	r1, [fp, #-20]	@ 0xffffffec
     440:	e50b2018 	str	r2, [fp, #-24]	@ 0xffffffe8
  char *dst, *src;
  
  dst = vdst;
     444:	e51b3010 	ldr	r3, [fp, #-16]
     448:	e50b3008 	str	r3, [fp, #-8]
  src = vsrc;
     44c:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
     450:	e50b300c 	str	r3, [fp, #-12]
  while(n-- > 0)
     454:	ea000007 	b	478 <memmove+0x4c>
    *dst++ = *src++;
     458:	e51b200c 	ldr	r2, [fp, #-12]
     45c:	e2823001 	add	r3, r2, #1
     460:	e50b300c 	str	r3, [fp, #-12]
     464:	e51b3008 	ldr	r3, [fp, #-8]
     468:	e2831001 	add	r1, r3, #1
     46c:	e50b1008 	str	r1, [fp, #-8]
     470:	e5d22000 	ldrb	r2, [r2]
     474:	e5c32000 	strb	r2, [r3]
  while(n-- > 0)
     478:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
     47c:	e2432001 	sub	r2, r3, #1
     480:	e50b2018 	str	r2, [fp, #-24]	@ 0xffffffe8
     484:	e3530000 	cmp	r3, #0
     488:	cafffff2 	bgt	458 <memmove+0x2c>
  return vdst;
     48c:	e51b3010 	ldr	r3, [fp, #-16]
}
     490:	e1a00003 	mov	r0, r3
     494:	e28bd000 	add	sp, fp, #0
     498:	e49db004 	pop	{fp}		@ (ldr fp, [sp], #4)
     49c:	e12fff1e 	bx	lr

000004a0 <fork>:
     4a0:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
     4a4:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
     4a8:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
     4ac:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
     4b0:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
     4b4:	e3a00001 	mov	r0, #1
     4b8:	ef000040 	svc	0x00000040
     4bc:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     4c0:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     4c4:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
     4c8:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
     4cc:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
     4d0:	e12fff1e 	bx	lr

000004d4 <exit>:
     4d4:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
     4d8:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
     4dc:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
     4e0:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
     4e4:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
     4e8:	e3a00002 	mov	r0, #2
     4ec:	ef000040 	svc	0x00000040
     4f0:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     4f4:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     4f8:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
     4fc:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
     500:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
     504:	e12fff1e 	bx	lr

00000508 <wait>:
     508:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
     50c:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
     510:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
     514:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
     518:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
     51c:	e3a00003 	mov	r0, #3
     520:	ef000040 	svc	0x00000040
     524:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     528:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     52c:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
     530:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
     534:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
     538:	e12fff1e 	bx	lr

0000053c <pipe>:
     53c:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
     540:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
     544:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
     548:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
     54c:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
     550:	e3a00004 	mov	r0, #4
     554:	ef000040 	svc	0x00000040
     558:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     55c:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     560:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
     564:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
     568:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
     56c:	e12fff1e 	bx	lr

00000570 <read>:
     570:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
     574:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
     578:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
     57c:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
     580:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
     584:	e3a00005 	mov	r0, #5
     588:	ef000040 	svc	0x00000040
     58c:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     590:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     594:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
     598:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
     59c:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
     5a0:	e12fff1e 	bx	lr

000005a4 <write>:
     5a4:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
     5a8:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
     5ac:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
     5b0:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
     5b4:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
     5b8:	e3a00010 	mov	r0, #16
     5bc:	ef000040 	svc	0x00000040
     5c0:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     5c4:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     5c8:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
     5cc:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
     5d0:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
     5d4:	e12fff1e 	bx	lr

000005d8 <close>:
     5d8:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
     5dc:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
     5e0:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
     5e4:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
     5e8:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
     5ec:	e3a00015 	mov	r0, #21
     5f0:	ef000040 	svc	0x00000040
     5f4:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     5f8:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     5fc:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
     600:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
     604:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
     608:	e12fff1e 	bx	lr

0000060c <kill>:
     60c:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
     610:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
     614:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
     618:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
     61c:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
     620:	e3a00006 	mov	r0, #6
     624:	ef000040 	svc	0x00000040
     628:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     62c:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     630:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
     634:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
     638:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
     63c:	e12fff1e 	bx	lr

00000640 <exec>:
     640:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
     644:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
     648:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
     64c:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
     650:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
     654:	e3a00007 	mov	r0, #7
     658:	ef000040 	svc	0x00000040
     65c:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     660:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     664:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
     668:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
     66c:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
     670:	e12fff1e 	bx	lr

00000674 <open>:
     674:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
     678:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
     67c:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
     680:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
     684:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
     688:	e3a0000f 	mov	r0, #15
     68c:	ef000040 	svc	0x00000040
     690:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     694:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     698:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
     69c:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
     6a0:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
     6a4:	e12fff1e 	bx	lr

000006a8 <mknod>:
     6a8:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
     6ac:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
     6b0:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
     6b4:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
     6b8:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
     6bc:	e3a00011 	mov	r0, #17
     6c0:	ef000040 	svc	0x00000040
     6c4:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     6c8:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     6cc:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
     6d0:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
     6d4:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
     6d8:	e12fff1e 	bx	lr

000006dc <unlink>:
     6dc:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
     6e0:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
     6e4:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
     6e8:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
     6ec:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
     6f0:	e3a00012 	mov	r0, #18
     6f4:	ef000040 	svc	0x00000040
     6f8:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     6fc:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     700:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
     704:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
     708:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
     70c:	e12fff1e 	bx	lr

00000710 <fstat>:
     710:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
     714:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
     718:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
     71c:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
     720:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
     724:	e3a00008 	mov	r0, #8
     728:	ef000040 	svc	0x00000040
     72c:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     730:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     734:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
     738:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
     73c:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
     740:	e12fff1e 	bx	lr

00000744 <link>:
     744:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
     748:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
     74c:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
     750:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
     754:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
     758:	e3a00013 	mov	r0, #19
     75c:	ef000040 	svc	0x00000040
     760:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     764:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     768:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
     76c:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
     770:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
     774:	e12fff1e 	bx	lr

00000778 <mkdir>:
     778:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
     77c:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
     780:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
     784:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
     788:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
     78c:	e3a00014 	mov	r0, #20
     790:	ef000040 	svc	0x00000040
     794:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     798:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     79c:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
     7a0:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
     7a4:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
     7a8:	e12fff1e 	bx	lr

000007ac <chdir>:
     7ac:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
     7b0:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
     7b4:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
     7b8:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
     7bc:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
     7c0:	e3a00009 	mov	r0, #9
     7c4:	ef000040 	svc	0x00000040
     7c8:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     7cc:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     7d0:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
     7d4:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
     7d8:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
     7dc:	e12fff1e 	bx	lr

000007e0 <dup>:
     7e0:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
     7e4:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
     7e8:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
     7ec:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
     7f0:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
     7f4:	e3a0000a 	mov	r0, #10
     7f8:	ef000040 	svc	0x00000040
     7fc:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     800:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     804:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
     808:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
     80c:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
     810:	e12fff1e 	bx	lr

00000814 <getpid>:
     814:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
     818:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
     81c:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
     820:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
     824:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
     828:	e3a0000b 	mov	r0, #11
     82c:	ef000040 	svc	0x00000040
     830:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     834:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     838:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
     83c:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
     840:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
     844:	e12fff1e 	bx	lr

00000848 <sbrk>:
     848:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
     84c:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
     850:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
     854:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
     858:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
     85c:	e3a0000c 	mov	r0, #12
     860:	ef000040 	svc	0x00000040
     864:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     868:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     86c:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
     870:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
     874:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
     878:	e12fff1e 	bx	lr

0000087c <sleep>:
     87c:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
     880:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
     884:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
     888:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
     88c:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
     890:	e3a0000d 	mov	r0, #13
     894:	ef000040 	svc	0x00000040
     898:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     89c:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     8a0:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
     8a4:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
     8a8:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
     8ac:	e12fff1e 	bx	lr

000008b0 <uptime>:
     8b0:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
     8b4:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
     8b8:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
     8bc:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
     8c0:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
     8c4:	e3a0000e 	mov	r0, #14
     8c8:	ef000040 	svc	0x00000040
     8cc:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     8d0:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     8d4:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
     8d8:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
     8dc:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
     8e0:	e12fff1e 	bx	lr

000008e4 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
     8e4:	e92d4800 	push	{fp, lr}
     8e8:	e28db004 	add	fp, sp, #4
     8ec:	e24dd008 	sub	sp, sp, #8
     8f0:	e50b0008 	str	r0, [fp, #-8]
     8f4:	e1a03001 	mov	r3, r1
     8f8:	e54b3009 	strb	r3, [fp, #-9]
  write(fd, &c, 1);
     8fc:	e24b3009 	sub	r3, fp, #9
     900:	e3a02001 	mov	r2, #1
     904:	e1a01003 	mov	r1, r3
     908:	e51b0008 	ldr	r0, [fp, #-8]
     90c:	ebffff24 	bl	5a4 <write>
}
     910:	e320f000 	nop	{0}
     914:	e24bd004 	sub	sp, fp, #4
     918:	e8bd8800 	pop	{fp, pc}

0000091c <div>:

u32 div(u32 n, u32 d)  // long division
{
     91c:	e52db004 	push	{fp}		@ (str fp, [sp, #-4]!)
     920:	e28db000 	add	fp, sp, #0
     924:	e24dd01c 	sub	sp, sp, #28
     928:	e50b0018 	str	r0, [fp, #-24]	@ 0xffffffe8
     92c:	e50b101c 	str	r1, [fp, #-28]	@ 0xffffffe4
    u32 q=0, r=0;
     930:	e3a03000 	mov	r3, #0
     934:	e50b3008 	str	r3, [fp, #-8]
     938:	e3a03000 	mov	r3, #0
     93c:	e50b300c 	str	r3, [fp, #-12]
    int i;

    for(i=31;i>=0;i--){
     940:	e3a0301f 	mov	r3, #31
     944:	e50b3010 	str	r3, [fp, #-16]
     948:	ea00001b 	b	9bc <div+0xa0>
        r = r << 1;
     94c:	e51b300c 	ldr	r3, [fp, #-12]
     950:	e1a03083 	lsl	r3, r3, #1
     954:	e50b300c 	str	r3, [fp, #-12]
        r = r | ((n >> i) & 1);
     958:	e51b2018 	ldr	r2, [fp, #-24]	@ 0xffffffe8
     95c:	e51b3010 	ldr	r3, [fp, #-16]
     960:	e1a03332 	lsr	r3, r2, r3
     964:	e2033001 	and	r3, r3, #1
     968:	e51b200c 	ldr	r2, [fp, #-12]
     96c:	e1823003 	orr	r3, r2, r3
     970:	e50b300c 	str	r3, [fp, #-12]
        if(r >= d) {
     974:	e51b200c 	ldr	r2, [fp, #-12]
     978:	e51b301c 	ldr	r3, [fp, #-28]	@ 0xffffffe4
     97c:	e1520003 	cmp	r2, r3
     980:	3a00000a 	bcc	9b0 <div+0x94>
            r = r - d;
     984:	e51b200c 	ldr	r2, [fp, #-12]
     988:	e51b301c 	ldr	r3, [fp, #-28]	@ 0xffffffe4
     98c:	e0423003 	sub	r3, r2, r3
     990:	e50b300c 	str	r3, [fp, #-12]
            q = q | (1 << i);
     994:	e3a02001 	mov	r2, #1
     998:	e51b3010 	ldr	r3, [fp, #-16]
     99c:	e1a03312 	lsl	r3, r2, r3
     9a0:	e1a02003 	mov	r2, r3
     9a4:	e51b3008 	ldr	r3, [fp, #-8]
     9a8:	e1833002 	orr	r3, r3, r2
     9ac:	e50b3008 	str	r3, [fp, #-8]
    for(i=31;i>=0;i--){
     9b0:	e51b3010 	ldr	r3, [fp, #-16]
     9b4:	e2433001 	sub	r3, r3, #1
     9b8:	e50b3010 	str	r3, [fp, #-16]
     9bc:	e51b3010 	ldr	r3, [fp, #-16]
     9c0:	e3530000 	cmp	r3, #0
     9c4:	aaffffe0 	bge	94c <div+0x30>
        }
    }
    return q;
     9c8:	e51b3008 	ldr	r3, [fp, #-8]
}
     9cc:	e1a00003 	mov	r0, r3
     9d0:	e28bd000 	add	sp, fp, #0
     9d4:	e49db004 	pop	{fp}		@ (ldr fp, [sp], #4)
     9d8:	e12fff1e 	bx	lr

000009dc <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
     9dc:	e92d4800 	push	{fp, lr}
     9e0:	e28db004 	add	fp, sp, #4
     9e4:	e24dd038 	sub	sp, sp, #56	@ 0x38
     9e8:	e50b0030 	str	r0, [fp, #-48]	@ 0xffffffd0
     9ec:	e50b1034 	str	r1, [fp, #-52]	@ 0xffffffcc
     9f0:	e50b2038 	str	r2, [fp, #-56]	@ 0xffffffc8
     9f4:	e50b303c 	str	r3, [fp, #-60]	@ 0xffffffc4
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x, y, b;

  neg = 0;
     9f8:	e3a03000 	mov	r3, #0
     9fc:	e50b300c 	str	r3, [fp, #-12]
  if(sgn && xx < 0){
     a00:	e51b303c 	ldr	r3, [fp, #-60]	@ 0xffffffc4
     a04:	e3530000 	cmp	r3, #0
     a08:	0a000008 	beq	a30 <printint+0x54>
     a0c:	e51b3034 	ldr	r3, [fp, #-52]	@ 0xffffffcc
     a10:	e3530000 	cmp	r3, #0
     a14:	aa000005 	bge	a30 <printint+0x54>
    neg = 1;
     a18:	e3a03001 	mov	r3, #1
     a1c:	e50b300c 	str	r3, [fp, #-12]
    x = -xx;
     a20:	e51b3034 	ldr	r3, [fp, #-52]	@ 0xffffffcc
     a24:	e2633000 	rsb	r3, r3, #0
     a28:	e50b3010 	str	r3, [fp, #-16]
     a2c:	ea000001 	b	a38 <printint+0x5c>
  } else {
    x = xx;
     a30:	e51b3034 	ldr	r3, [fp, #-52]	@ 0xffffffcc
     a34:	e50b3010 	str	r3, [fp, #-16]
  }

  b = base;
     a38:	e51b3038 	ldr	r3, [fp, #-56]	@ 0xffffffc8
     a3c:	e50b3014 	str	r3, [fp, #-20]	@ 0xffffffec
  i = 0;
     a40:	e3a03000 	mov	r3, #0
     a44:	e50b3008 	str	r3, [fp, #-8]
  do{
    y = div(x, b);
     a48:	e51b1014 	ldr	r1, [fp, #-20]	@ 0xffffffec
     a4c:	e51b0010 	ldr	r0, [fp, #-16]
     a50:	ebffffb1 	bl	91c <div>
     a54:	e50b0018 	str	r0, [fp, #-24]	@ 0xffffffe8
    buf[i++] = digits[x - y * b];
     a58:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
     a5c:	e51b2014 	ldr	r2, [fp, #-20]	@ 0xffffffec
     a60:	e0030392 	mul	r3, r2, r3
     a64:	e51b2010 	ldr	r2, [fp, #-16]
     a68:	e0421003 	sub	r1, r2, r3
     a6c:	e51b2008 	ldr	r2, [fp, #-8]
     a70:	e2823001 	add	r3, r2, #1
     a74:	e50b3008 	str	r3, [fp, #-8]
     a78:	e30130f0 	movw	r3, #4336	@ 0x10f0
     a7c:	e3403000 	movt	r3, #0
     a80:	e7d31001 	ldrb	r1, [r3, r1]
     a84:	e2423004 	sub	r3, r2, #4
     a88:	e083300b 	add	r3, r3, fp
     a8c:	e1a02001 	mov	r2, r1
     a90:	e5432024 	strb	r2, [r3, #-36]	@ 0xffffffdc
  }while((x = y) != 0);
     a94:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
     a98:	e50b3010 	str	r3, [fp, #-16]
     a9c:	e51b3010 	ldr	r3, [fp, #-16]
     aa0:	e3530000 	cmp	r3, #0
     aa4:	1affffe7 	bne	a48 <printint+0x6c>
  if(neg)
     aa8:	e51b300c 	ldr	r3, [fp, #-12]
     aac:	e3530000 	cmp	r3, #0
     ab0:	0a00000e 	beq	af0 <printint+0x114>
    buf[i++] = '-';
     ab4:	e51b3008 	ldr	r3, [fp, #-8]
     ab8:	e2832001 	add	r2, r3, #1
     abc:	e50b2008 	str	r2, [fp, #-8]
     ac0:	e2433004 	sub	r3, r3, #4
     ac4:	e083300b 	add	r3, r3, fp
     ac8:	e3a0202d 	mov	r2, #45	@ 0x2d
     acc:	e5432024 	strb	r2, [r3, #-36]	@ 0xffffffdc

  while(--i >= 0)
     ad0:	ea000006 	b	af0 <printint+0x114>
    putc(fd, buf[i]);
     ad4:	e24b2028 	sub	r2, fp, #40	@ 0x28
     ad8:	e51b3008 	ldr	r3, [fp, #-8]
     adc:	e0823003 	add	r3, r2, r3
     ae0:	e5d33000 	ldrb	r3, [r3]
     ae4:	e1a01003 	mov	r1, r3
     ae8:	e51b0030 	ldr	r0, [fp, #-48]	@ 0xffffffd0
     aec:	ebffff7c 	bl	8e4 <putc>
  while(--i >= 0)
     af0:	e51b3008 	ldr	r3, [fp, #-8]
     af4:	e2433001 	sub	r3, r3, #1
     af8:	e50b3008 	str	r3, [fp, #-8]
     afc:	e51b3008 	ldr	r3, [fp, #-8]
     b00:	e3530000 	cmp	r3, #0
     b04:	aafffff2 	bge	ad4 <printint+0xf8>
}
     b08:	e320f000 	nop	{0}
     b0c:	e320f000 	nop	{0}
     b10:	e24bd004 	sub	sp, fp, #4
     b14:	e8bd8800 	pop	{fp, pc}

00000b18 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
     b18:	e92d000e 	push	{r1, r2, r3}
     b1c:	e92d4800 	push	{fp, lr}
     b20:	e28db004 	add	fp, sp, #4
     b24:	e24dd024 	sub	sp, sp, #36	@ 0x24
     b28:	e50b0024 	str	r0, [fp, #-36]	@ 0xffffffdc
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
     b2c:	e3a03000 	mov	r3, #0
     b30:	e50b3014 	str	r3, [fp, #-20]	@ 0xffffffec
  ap = (uint*)(void*)&fmt + 1;
     b34:	e28b3008 	add	r3, fp, #8
     b38:	e50b3018 	str	r3, [fp, #-24]	@ 0xffffffe8
  for(i = 0; fmt[i]; i++){
     b3c:	e3a03000 	mov	r3, #0
     b40:	e50b3010 	str	r3, [fp, #-16]
     b44:	ea000075 	b	d20 <printf+0x208>
    c = fmt[i] & 0xff;
     b48:	e59b2004 	ldr	r2, [fp, #4]
     b4c:	e51b3010 	ldr	r3, [fp, #-16]
     b50:	e0823003 	add	r3, r2, r3
     b54:	e5d33000 	ldrb	r3, [r3]
     b58:	e50b301c 	str	r3, [fp, #-28]	@ 0xffffffe4
    if(state == 0){
     b5c:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
     b60:	e3530000 	cmp	r3, #0
     b64:	1a00000b 	bne	b98 <printf+0x80>
      if(c == '%'){
     b68:	e51b301c 	ldr	r3, [fp, #-28]	@ 0xffffffe4
     b6c:	e3530025 	cmp	r3, #37	@ 0x25
     b70:	1a000002 	bne	b80 <printf+0x68>
        state = '%';
     b74:	e3a03025 	mov	r3, #37	@ 0x25
     b78:	e50b3014 	str	r3, [fp, #-20]	@ 0xffffffec
     b7c:	ea000064 	b	d14 <printf+0x1fc>
      } else {
        putc(fd, c);
     b80:	e51b301c 	ldr	r3, [fp, #-28]	@ 0xffffffe4
     b84:	e6ef3073 	uxtb	r3, r3
     b88:	e1a01003 	mov	r1, r3
     b8c:	e51b0024 	ldr	r0, [fp, #-36]	@ 0xffffffdc
     b90:	ebffff53 	bl	8e4 <putc>
     b94:	ea00005e 	b	d14 <printf+0x1fc>
      }
    } else if(state == '%'){
     b98:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
     b9c:	e3530025 	cmp	r3, #37	@ 0x25
     ba0:	1a00005b 	bne	d14 <printf+0x1fc>
      if(c == 'd'){
     ba4:	e51b301c 	ldr	r3, [fp, #-28]	@ 0xffffffe4
     ba8:	e3530064 	cmp	r3, #100	@ 0x64
     bac:	1a00000a 	bne	bdc <printf+0xc4>
        printint(fd, *ap, 10, 1);
     bb0:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
     bb4:	e5933000 	ldr	r3, [r3]
     bb8:	e1a01003 	mov	r1, r3
     bbc:	e3a03001 	mov	r3, #1
     bc0:	e3a0200a 	mov	r2, #10
     bc4:	e51b0024 	ldr	r0, [fp, #-36]	@ 0xffffffdc
     bc8:	ebffff83 	bl	9dc <printint>
        ap++;
     bcc:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
     bd0:	e2833004 	add	r3, r3, #4
     bd4:	e50b3018 	str	r3, [fp, #-24]	@ 0xffffffe8
     bd8:	ea00004b 	b	d0c <printf+0x1f4>
      } else if(c == 'x' || c == 'p'){
     bdc:	e51b301c 	ldr	r3, [fp, #-28]	@ 0xffffffe4
     be0:	e3530078 	cmp	r3, #120	@ 0x78
     be4:	0a000002 	beq	bf4 <printf+0xdc>
     be8:	e51b301c 	ldr	r3, [fp, #-28]	@ 0xffffffe4
     bec:	e3530070 	cmp	r3, #112	@ 0x70
     bf0:	1a00000a 	bne	c20 <printf+0x108>
        printint(fd, *ap, 16, 0);
     bf4:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
     bf8:	e5933000 	ldr	r3, [r3]
     bfc:	e1a01003 	mov	r1, r3
     c00:	e3a03000 	mov	r3, #0
     c04:	e3a02010 	mov	r2, #16
     c08:	e51b0024 	ldr	r0, [fp, #-36]	@ 0xffffffdc
     c0c:	ebffff72 	bl	9dc <printint>
        ap++;
     c10:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
     c14:	e2833004 	add	r3, r3, #4
     c18:	e50b3018 	str	r3, [fp, #-24]	@ 0xffffffe8
     c1c:	ea00003a 	b	d0c <printf+0x1f4>
      } else if(c == 's'){
     c20:	e51b301c 	ldr	r3, [fp, #-28]	@ 0xffffffe4
     c24:	e3530073 	cmp	r3, #115	@ 0x73
     c28:	1a000019 	bne	c94 <printf+0x17c>
        s = (char*)*ap;
     c2c:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
     c30:	e5933000 	ldr	r3, [r3]
     c34:	e50b300c 	str	r3, [fp, #-12]
        ap++;
     c38:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
     c3c:	e2833004 	add	r3, r3, #4
     c40:	e50b3018 	str	r3, [fp, #-24]	@ 0xffffffe8
        if(s == 0)
     c44:	e51b300c 	ldr	r3, [fp, #-12]
     c48:	e3530000 	cmp	r3, #0
     c4c:	1a00000b 	bne	c80 <printf+0x168>
          s = "(null)";
     c50:	e30130e8 	movw	r3, #4328	@ 0x10e8
     c54:	e3403000 	movt	r3, #0
     c58:	e50b300c 	str	r3, [fp, #-12]
        while(*s != 0){
     c5c:	ea000007 	b	c80 <printf+0x168>
          putc(fd, *s);
     c60:	e51b300c 	ldr	r3, [fp, #-12]
     c64:	e5d33000 	ldrb	r3, [r3]
     c68:	e1a01003 	mov	r1, r3
     c6c:	e51b0024 	ldr	r0, [fp, #-36]	@ 0xffffffdc
     c70:	ebffff1b 	bl	8e4 <putc>
          s++;
     c74:	e51b300c 	ldr	r3, [fp, #-12]
     c78:	e2833001 	add	r3, r3, #1
     c7c:	e50b300c 	str	r3, [fp, #-12]
        while(*s != 0){
     c80:	e51b300c 	ldr	r3, [fp, #-12]
     c84:	e5d33000 	ldrb	r3, [r3]
     c88:	e3530000 	cmp	r3, #0
     c8c:	1afffff3 	bne	c60 <printf+0x148>
     c90:	ea00001d 	b	d0c <printf+0x1f4>
        }
      } else if(c == 'c'){
     c94:	e51b301c 	ldr	r3, [fp, #-28]	@ 0xffffffe4
     c98:	e3530063 	cmp	r3, #99	@ 0x63
     c9c:	1a000009 	bne	cc8 <printf+0x1b0>
        putc(fd, *ap);
     ca0:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
     ca4:	e5933000 	ldr	r3, [r3]
     ca8:	e6ef3073 	uxtb	r3, r3
     cac:	e1a01003 	mov	r1, r3
     cb0:	e51b0024 	ldr	r0, [fp, #-36]	@ 0xffffffdc
     cb4:	ebffff0a 	bl	8e4 <putc>
        ap++;
     cb8:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
     cbc:	e2833004 	add	r3, r3, #4
     cc0:	e50b3018 	str	r3, [fp, #-24]	@ 0xffffffe8
     cc4:	ea000010 	b	d0c <printf+0x1f4>
      } else if(c == '%'){
     cc8:	e51b301c 	ldr	r3, [fp, #-28]	@ 0xffffffe4
     ccc:	e3530025 	cmp	r3, #37	@ 0x25
     cd0:	1a000005 	bne	cec <printf+0x1d4>
        putc(fd, c);
     cd4:	e51b301c 	ldr	r3, [fp, #-28]	@ 0xffffffe4
     cd8:	e6ef3073 	uxtb	r3, r3
     cdc:	e1a01003 	mov	r1, r3
     ce0:	e51b0024 	ldr	r0, [fp, #-36]	@ 0xffffffdc
     ce4:	ebfffefe 	bl	8e4 <putc>
     ce8:	ea000007 	b	d0c <printf+0x1f4>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
     cec:	e3a01025 	mov	r1, #37	@ 0x25
     cf0:	e51b0024 	ldr	r0, [fp, #-36]	@ 0xffffffdc
     cf4:	ebfffefa 	bl	8e4 <putc>
        putc(fd, c);
     cf8:	e51b301c 	ldr	r3, [fp, #-28]	@ 0xffffffe4
     cfc:	e6ef3073 	uxtb	r3, r3
     d00:	e1a01003 	mov	r1, r3
     d04:	e51b0024 	ldr	r0, [fp, #-36]	@ 0xffffffdc
     d08:	ebfffef5 	bl	8e4 <putc>
      }
      state = 0;
     d0c:	e3a03000 	mov	r3, #0
     d10:	e50b3014 	str	r3, [fp, #-20]	@ 0xffffffec
  for(i = 0; fmt[i]; i++){
     d14:	e51b3010 	ldr	r3, [fp, #-16]
     d18:	e2833001 	add	r3, r3, #1
     d1c:	e50b3010 	str	r3, [fp, #-16]
     d20:	e59b2004 	ldr	r2, [fp, #4]
     d24:	e51b3010 	ldr	r3, [fp, #-16]
     d28:	e0823003 	add	r3, r2, r3
     d2c:	e5d33000 	ldrb	r3, [r3]
     d30:	e3530000 	cmp	r3, #0
     d34:	1affff83 	bne	b48 <printf+0x30>
    }
  }
}
     d38:	e320f000 	nop	{0}
     d3c:	e320f000 	nop	{0}
     d40:	e24bd004 	sub	sp, fp, #4
     d44:	e8bd4800 	pop	{fp, lr}
     d48:	e28dd00c 	add	sp, sp, #12
     d4c:	e12fff1e 	bx	lr

00000d50 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
     d50:	e52db004 	push	{fp}		@ (str fp, [sp, #-4]!)
     d54:	e28db000 	add	fp, sp, #0
     d58:	e24dd014 	sub	sp, sp, #20
     d5c:	e50b0010 	str	r0, [fp, #-16]
  Header *bp, *p;

  bp = (Header*)ap - 1;
     d60:	e51b3010 	ldr	r3, [fp, #-16]
     d64:	e2433008 	sub	r3, r3, #8
     d68:	e50b300c 	str	r3, [fp, #-12]
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
     d6c:	e301310c 	movw	r3, #4364	@ 0x110c
     d70:	e3403000 	movt	r3, #0
     d74:	e5933000 	ldr	r3, [r3]
     d78:	e50b3008 	str	r3, [fp, #-8]
     d7c:	ea000010 	b	dc4 <free+0x74>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
     d80:	e51b3008 	ldr	r3, [fp, #-8]
     d84:	e5933000 	ldr	r3, [r3]
     d88:	e51b2008 	ldr	r2, [fp, #-8]
     d8c:	e1520003 	cmp	r2, r3
     d90:	3a000008 	bcc	db8 <free+0x68>
     d94:	e51b200c 	ldr	r2, [fp, #-12]
     d98:	e51b3008 	ldr	r3, [fp, #-8]
     d9c:	e1520003 	cmp	r2, r3
     da0:	8a000010 	bhi	de8 <free+0x98>
     da4:	e51b3008 	ldr	r3, [fp, #-8]
     da8:	e5933000 	ldr	r3, [r3]
     dac:	e51b200c 	ldr	r2, [fp, #-12]
     db0:	e1520003 	cmp	r2, r3
     db4:	3a00000b 	bcc	de8 <free+0x98>
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
     db8:	e51b3008 	ldr	r3, [fp, #-8]
     dbc:	e5933000 	ldr	r3, [r3]
     dc0:	e50b3008 	str	r3, [fp, #-8]
     dc4:	e51b200c 	ldr	r2, [fp, #-12]
     dc8:	e51b3008 	ldr	r3, [fp, #-8]
     dcc:	e1520003 	cmp	r2, r3
     dd0:	9affffea 	bls	d80 <free+0x30>
     dd4:	e51b3008 	ldr	r3, [fp, #-8]
     dd8:	e5933000 	ldr	r3, [r3]
     ddc:	e51b200c 	ldr	r2, [fp, #-12]
     de0:	e1520003 	cmp	r2, r3
     de4:	2affffe5 	bcs	d80 <free+0x30>
      break;
  if(bp + bp->s.size == p->s.ptr){
     de8:	e51b300c 	ldr	r3, [fp, #-12]
     dec:	e5933004 	ldr	r3, [r3, #4]
     df0:	e1a03183 	lsl	r3, r3, #3
     df4:	e51b200c 	ldr	r2, [fp, #-12]
     df8:	e0822003 	add	r2, r2, r3
     dfc:	e51b3008 	ldr	r3, [fp, #-8]
     e00:	e5933000 	ldr	r3, [r3]
     e04:	e1520003 	cmp	r2, r3
     e08:	1a00000d 	bne	e44 <free+0xf4>
    bp->s.size += p->s.ptr->s.size;
     e0c:	e51b300c 	ldr	r3, [fp, #-12]
     e10:	e5932004 	ldr	r2, [r3, #4]
     e14:	e51b3008 	ldr	r3, [fp, #-8]
     e18:	e5933000 	ldr	r3, [r3]
     e1c:	e5933004 	ldr	r3, [r3, #4]
     e20:	e0822003 	add	r2, r2, r3
     e24:	e51b300c 	ldr	r3, [fp, #-12]
     e28:	e5832004 	str	r2, [r3, #4]
    bp->s.ptr = p->s.ptr->s.ptr;
     e2c:	e51b3008 	ldr	r3, [fp, #-8]
     e30:	e5933000 	ldr	r3, [r3]
     e34:	e5932000 	ldr	r2, [r3]
     e38:	e51b300c 	ldr	r3, [fp, #-12]
     e3c:	e5832000 	str	r2, [r3]
     e40:	ea000003 	b	e54 <free+0x104>
  } else
    bp->s.ptr = p->s.ptr;
     e44:	e51b3008 	ldr	r3, [fp, #-8]
     e48:	e5932000 	ldr	r2, [r3]
     e4c:	e51b300c 	ldr	r3, [fp, #-12]
     e50:	e5832000 	str	r2, [r3]
  if(p + p->s.size == bp){
     e54:	e51b3008 	ldr	r3, [fp, #-8]
     e58:	e5933004 	ldr	r3, [r3, #4]
     e5c:	e1a03183 	lsl	r3, r3, #3
     e60:	e51b2008 	ldr	r2, [fp, #-8]
     e64:	e0823003 	add	r3, r2, r3
     e68:	e51b200c 	ldr	r2, [fp, #-12]
     e6c:	e1520003 	cmp	r2, r3
     e70:	1a00000b 	bne	ea4 <free+0x154>
    p->s.size += bp->s.size;
     e74:	e51b3008 	ldr	r3, [fp, #-8]
     e78:	e5932004 	ldr	r2, [r3, #4]
     e7c:	e51b300c 	ldr	r3, [fp, #-12]
     e80:	e5933004 	ldr	r3, [r3, #4]
     e84:	e0822003 	add	r2, r2, r3
     e88:	e51b3008 	ldr	r3, [fp, #-8]
     e8c:	e5832004 	str	r2, [r3, #4]
    p->s.ptr = bp->s.ptr;
     e90:	e51b300c 	ldr	r3, [fp, #-12]
     e94:	e5932000 	ldr	r2, [r3]
     e98:	e51b3008 	ldr	r3, [fp, #-8]
     e9c:	e5832000 	str	r2, [r3]
     ea0:	ea000002 	b	eb0 <free+0x160>
  } else
    p->s.ptr = bp;
     ea4:	e51b3008 	ldr	r3, [fp, #-8]
     ea8:	e51b200c 	ldr	r2, [fp, #-12]
     eac:	e5832000 	str	r2, [r3]
  freep = p;
     eb0:	e301310c 	movw	r3, #4364	@ 0x110c
     eb4:	e3403000 	movt	r3, #0
     eb8:	e51b2008 	ldr	r2, [fp, #-8]
     ebc:	e5832000 	str	r2, [r3]
}
     ec0:	e320f000 	nop	{0}
     ec4:	e28bd000 	add	sp, fp, #0
     ec8:	e49db004 	pop	{fp}		@ (ldr fp, [sp], #4)
     ecc:	e12fff1e 	bx	lr

00000ed0 <morecore>:

static Header*
morecore(uint nu)
{
     ed0:	e92d4800 	push	{fp, lr}
     ed4:	e28db004 	add	fp, sp, #4
     ed8:	e24dd010 	sub	sp, sp, #16
     edc:	e50b0010 	str	r0, [fp, #-16]
  char *p;
  Header *hp;

  if(nu < 4096)
     ee0:	e51b3010 	ldr	r3, [fp, #-16]
     ee4:	e3530a01 	cmp	r3, #4096	@ 0x1000
     ee8:	2a000001 	bcs	ef4 <morecore+0x24>
    nu = 4096;
     eec:	e3a03a01 	mov	r3, #4096	@ 0x1000
     ef0:	e50b3010 	str	r3, [fp, #-16]
  p = sbrk(nu * sizeof(Header));
     ef4:	e51b3010 	ldr	r3, [fp, #-16]
     ef8:	e1a03183 	lsl	r3, r3, #3
     efc:	e1a00003 	mov	r0, r3
     f00:	ebfffe50 	bl	848 <sbrk>
     f04:	e50b0008 	str	r0, [fp, #-8]
  if(p == (char*)-1)
     f08:	e51b3008 	ldr	r3, [fp, #-8]
     f0c:	e3730001 	cmn	r3, #1
     f10:	1a000001 	bne	f1c <morecore+0x4c>
    return 0;
     f14:	e3a03000 	mov	r3, #0
     f18:	ea00000b 	b	f4c <morecore+0x7c>
  hp = (Header*)p;
     f1c:	e51b3008 	ldr	r3, [fp, #-8]
     f20:	e50b300c 	str	r3, [fp, #-12]
  hp->s.size = nu;
     f24:	e51b300c 	ldr	r3, [fp, #-12]
     f28:	e51b2010 	ldr	r2, [fp, #-16]
     f2c:	e5832004 	str	r2, [r3, #4]
  free((void*)(hp + 1));
     f30:	e51b300c 	ldr	r3, [fp, #-12]
     f34:	e2833008 	add	r3, r3, #8
     f38:	e1a00003 	mov	r0, r3
     f3c:	ebffff83 	bl	d50 <free>
  return freep;
     f40:	e301310c 	movw	r3, #4364	@ 0x110c
     f44:	e3403000 	movt	r3, #0
     f48:	e5933000 	ldr	r3, [r3]
}
     f4c:	e1a00003 	mov	r0, r3
     f50:	e24bd004 	sub	sp, fp, #4
     f54:	e8bd8800 	pop	{fp, pc}

00000f58 <malloc>:

void*
malloc(uint nbytes)
{
     f58:	e92d4800 	push	{fp, lr}
     f5c:	e28db004 	add	fp, sp, #4
     f60:	e24dd018 	sub	sp, sp, #24
     f64:	e50b0018 	str	r0, [fp, #-24]	@ 0xffffffe8
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
     f68:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
     f6c:	e2833007 	add	r3, r3, #7
     f70:	e1a031a3 	lsr	r3, r3, #3
     f74:	e2833001 	add	r3, r3, #1
     f78:	e50b3010 	str	r3, [fp, #-16]
  if((prevp = freep) == 0){
     f7c:	e301310c 	movw	r3, #4364	@ 0x110c
     f80:	e3403000 	movt	r3, #0
     f84:	e5933000 	ldr	r3, [r3]
     f88:	e50b300c 	str	r3, [fp, #-12]
     f8c:	e51b300c 	ldr	r3, [fp, #-12]
     f90:	e3530000 	cmp	r3, #0
     f94:	1a000010 	bne	fdc <malloc+0x84>
    base.s.ptr = freep = prevp = &base;
     f98:	e3013104 	movw	r3, #4356	@ 0x1104
     f9c:	e3403000 	movt	r3, #0
     fa0:	e50b300c 	str	r3, [fp, #-12]
     fa4:	e301310c 	movw	r3, #4364	@ 0x110c
     fa8:	e3403000 	movt	r3, #0
     fac:	e51b200c 	ldr	r2, [fp, #-12]
     fb0:	e5832000 	str	r2, [r3]
     fb4:	e301310c 	movw	r3, #4364	@ 0x110c
     fb8:	e3403000 	movt	r3, #0
     fbc:	e5932000 	ldr	r2, [r3]
     fc0:	e3013104 	movw	r3, #4356	@ 0x1104
     fc4:	e3403000 	movt	r3, #0
     fc8:	e5832000 	str	r2, [r3]
    base.s.size = 0;
     fcc:	e3013104 	movw	r3, #4356	@ 0x1104
     fd0:	e3403000 	movt	r3, #0
     fd4:	e3a02000 	mov	r2, #0
     fd8:	e5832004 	str	r2, [r3, #4]
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
     fdc:	e51b300c 	ldr	r3, [fp, #-12]
     fe0:	e5933000 	ldr	r3, [r3]
     fe4:	e50b3008 	str	r3, [fp, #-8]
    if(p->s.size >= nunits){
     fe8:	e51b3008 	ldr	r3, [fp, #-8]
     fec:	e5933004 	ldr	r3, [r3, #4]
     ff0:	e51b2010 	ldr	r2, [fp, #-16]
     ff4:	e1520003 	cmp	r2, r3
     ff8:	8a00001f 	bhi	107c <malloc+0x124>
      if(p->s.size == nunits)
     ffc:	e51b3008 	ldr	r3, [fp, #-8]
    1000:	e5933004 	ldr	r3, [r3, #4]
    1004:	e51b2010 	ldr	r2, [fp, #-16]
    1008:	e1520003 	cmp	r2, r3
    100c:	1a000004 	bne	1024 <malloc+0xcc>
        prevp->s.ptr = p->s.ptr;
    1010:	e51b3008 	ldr	r3, [fp, #-8]
    1014:	e5932000 	ldr	r2, [r3]
    1018:	e51b300c 	ldr	r3, [fp, #-12]
    101c:	e5832000 	str	r2, [r3]
    1020:	ea00000e 	b	1060 <malloc+0x108>
      else {
        p->s.size -= nunits;
    1024:	e51b3008 	ldr	r3, [fp, #-8]
    1028:	e5932004 	ldr	r2, [r3, #4]
    102c:	e51b3010 	ldr	r3, [fp, #-16]
    1030:	e0422003 	sub	r2, r2, r3
    1034:	e51b3008 	ldr	r3, [fp, #-8]
    1038:	e5832004 	str	r2, [r3, #4]
        p += p->s.size;
    103c:	e51b3008 	ldr	r3, [fp, #-8]
    1040:	e5933004 	ldr	r3, [r3, #4]
    1044:	e1a03183 	lsl	r3, r3, #3
    1048:	e51b2008 	ldr	r2, [fp, #-8]
    104c:	e0823003 	add	r3, r2, r3
    1050:	e50b3008 	str	r3, [fp, #-8]
        p->s.size = nunits;
    1054:	e51b3008 	ldr	r3, [fp, #-8]
    1058:	e51b2010 	ldr	r2, [fp, #-16]
    105c:	e5832004 	str	r2, [r3, #4]
      }
      freep = prevp;
    1060:	e301310c 	movw	r3, #4364	@ 0x110c
    1064:	e3403000 	movt	r3, #0
    1068:	e51b200c 	ldr	r2, [fp, #-12]
    106c:	e5832000 	str	r2, [r3]
      return (void*)(p + 1);
    1070:	e51b3008 	ldr	r3, [fp, #-8]
    1074:	e2833008 	add	r3, r3, #8
    1078:	ea000013 	b	10cc <malloc+0x174>
    }
    if(p == freep)
    107c:	e301310c 	movw	r3, #4364	@ 0x110c
    1080:	e3403000 	movt	r3, #0
    1084:	e5933000 	ldr	r3, [r3]
    1088:	e51b2008 	ldr	r2, [fp, #-8]
    108c:	e1520003 	cmp	r2, r3
    1090:	1a000007 	bne	10b4 <malloc+0x15c>
      if((p = morecore(nunits)) == 0)
    1094:	e51b0010 	ldr	r0, [fp, #-16]
    1098:	ebffff8c 	bl	ed0 <morecore>
    109c:	e50b0008 	str	r0, [fp, #-8]
    10a0:	e51b3008 	ldr	r3, [fp, #-8]
    10a4:	e3530000 	cmp	r3, #0
    10a8:	1a000001 	bne	10b4 <malloc+0x15c>
        return 0;
    10ac:	e3a03000 	mov	r3, #0
    10b0:	ea000005 	b	10cc <malloc+0x174>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    10b4:	e51b3008 	ldr	r3, [fp, #-8]
    10b8:	e50b300c 	str	r3, [fp, #-12]
    10bc:	e51b3008 	ldr	r3, [fp, #-8]
    10c0:	e5933000 	ldr	r3, [r3]
    10c4:	e50b3008 	str	r3, [fp, #-8]
    if(p->s.size >= nunits){
    10c8:	eaffffc6 	b	fe8 <malloc+0x90>
  }
}
    10cc:	e1a00003 	mov	r0, r3
    10d0:	e24bd004 	sub	sp, fp, #4
    10d4:	e8bd8800 	pop	{fp, pc}
