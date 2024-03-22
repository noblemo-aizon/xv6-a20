
_zombie:     file format elf32-littlearm


Disassembly of section .text:

00000000 <main>:
#include "stat.h"
#include "user.h"

int
main(void)
{
       0:	e92d4800 	push	{fp, lr}
       4:	e28db004 	add	fp, sp, #4
  if(fork() > 0){
       8:	eb000112 	bl	458 <fork>
       c:	e1a03000 	mov	r3, r0
      10:	e3530000 	cmp	r3, #0
      14:	da000006 	ble	34 <main+0x34>
    sleep(5);  // Let child exit before parent.
      18:	e3a00005 	mov	r0, #5
      1c:	eb000204 	bl	834 <sleep>
    printf(2, "Parent exits!\n");
      20:	e3011090 	movw	r1, #4240	@ 0x1090
      24:	e3401000 	movt	r1, #0
      28:	e3a00002 	mov	r0, #2
      2c:	eb0002a7 	bl	ad0 <printf>
    exit();
      30:	eb000115 	bl	48c <exit>
  }
  printf(2, "Child exits!\n");
      34:	e30110a0 	movw	r1, #4256	@ 0x10a0
      38:	e3401000 	movt	r1, #0
      3c:	e3a00002 	mov	r0, #2
      40:	eb0002a2 	bl	ad0 <printf>
  exit();
      44:	eb000110 	bl	48c <exit>

00000048 <strcpy>:
#include "user.h"
#include "arm.h"

char*
strcpy(char *s, char *t)
{
      48:	e52db004 	push	{fp}		@ (str fp, [sp, #-4]!)
      4c:	e28db000 	add	fp, sp, #0
      50:	e24dd014 	sub	sp, sp, #20
      54:	e50b0010 	str	r0, [fp, #-16]
      58:	e50b1014 	str	r1, [fp, #-20]	@ 0xffffffec
  char *os;

  os = s;
      5c:	e51b3010 	ldr	r3, [fp, #-16]
      60:	e50b3008 	str	r3, [fp, #-8]
  while((*s++ = *t++) != 0)
      64:	e320f000 	nop	{0}
      68:	e51b2014 	ldr	r2, [fp, #-20]	@ 0xffffffec
      6c:	e2823001 	add	r3, r2, #1
      70:	e50b3014 	str	r3, [fp, #-20]	@ 0xffffffec
      74:	e51b3010 	ldr	r3, [fp, #-16]
      78:	e2831001 	add	r1, r3, #1
      7c:	e50b1010 	str	r1, [fp, #-16]
      80:	e5d22000 	ldrb	r2, [r2]
      84:	e5c32000 	strb	r2, [r3]
      88:	e5d33000 	ldrb	r3, [r3]
      8c:	e3530000 	cmp	r3, #0
      90:	1afffff4 	bne	68 <strcpy+0x20>
    ;
  return os;
      94:	e51b3008 	ldr	r3, [fp, #-8]
}
      98:	e1a00003 	mov	r0, r3
      9c:	e28bd000 	add	sp, fp, #0
      a0:	e49db004 	pop	{fp}		@ (ldr fp, [sp], #4)
      a4:	e12fff1e 	bx	lr

000000a8 <strcmp>:

int
strcmp(const char *p, const char *q)
{
      a8:	e52db004 	push	{fp}		@ (str fp, [sp, #-4]!)
      ac:	e28db000 	add	fp, sp, #0
      b0:	e24dd00c 	sub	sp, sp, #12
      b4:	e50b0008 	str	r0, [fp, #-8]
      b8:	e50b100c 	str	r1, [fp, #-12]
  while(*p && *p == *q)
      bc:	ea000005 	b	d8 <strcmp+0x30>
    p++, q++;
      c0:	e51b3008 	ldr	r3, [fp, #-8]
      c4:	e2833001 	add	r3, r3, #1
      c8:	e50b3008 	str	r3, [fp, #-8]
      cc:	e51b300c 	ldr	r3, [fp, #-12]
      d0:	e2833001 	add	r3, r3, #1
      d4:	e50b300c 	str	r3, [fp, #-12]
  while(*p && *p == *q)
      d8:	e51b3008 	ldr	r3, [fp, #-8]
      dc:	e5d33000 	ldrb	r3, [r3]
      e0:	e3530000 	cmp	r3, #0
      e4:	0a000005 	beq	100 <strcmp+0x58>
      e8:	e51b3008 	ldr	r3, [fp, #-8]
      ec:	e5d32000 	ldrb	r2, [r3]
      f0:	e51b300c 	ldr	r3, [fp, #-12]
      f4:	e5d33000 	ldrb	r3, [r3]
      f8:	e1520003 	cmp	r2, r3
      fc:	0affffef 	beq	c0 <strcmp+0x18>
  return (uchar)*p - (uchar)*q;
     100:	e51b3008 	ldr	r3, [fp, #-8]
     104:	e5d33000 	ldrb	r3, [r3]
     108:	e1a02003 	mov	r2, r3
     10c:	e51b300c 	ldr	r3, [fp, #-12]
     110:	e5d33000 	ldrb	r3, [r3]
     114:	e0423003 	sub	r3, r2, r3
}
     118:	e1a00003 	mov	r0, r3
     11c:	e28bd000 	add	sp, fp, #0
     120:	e49db004 	pop	{fp}		@ (ldr fp, [sp], #4)
     124:	e12fff1e 	bx	lr

00000128 <strlen>:

uint
strlen(char *s)
{
     128:	e52db004 	push	{fp}		@ (str fp, [sp, #-4]!)
     12c:	e28db000 	add	fp, sp, #0
     130:	e24dd014 	sub	sp, sp, #20
     134:	e50b0010 	str	r0, [fp, #-16]
  int n;

  for(n = 0; s[n]; n++)
     138:	e3a03000 	mov	r3, #0
     13c:	e50b3008 	str	r3, [fp, #-8]
     140:	ea000002 	b	150 <strlen+0x28>
     144:	e51b3008 	ldr	r3, [fp, #-8]
     148:	e2833001 	add	r3, r3, #1
     14c:	e50b3008 	str	r3, [fp, #-8]
     150:	e51b3008 	ldr	r3, [fp, #-8]
     154:	e51b2010 	ldr	r2, [fp, #-16]
     158:	e0823003 	add	r3, r2, r3
     15c:	e5d33000 	ldrb	r3, [r3]
     160:	e3530000 	cmp	r3, #0
     164:	1afffff6 	bne	144 <strlen+0x1c>
    ;
  return n;
     168:	e51b3008 	ldr	r3, [fp, #-8]
}
     16c:	e1a00003 	mov	r0, r3
     170:	e28bd000 	add	sp, fp, #0
     174:	e49db004 	pop	{fp}		@ (ldr fp, [sp], #4)
     178:	e12fff1e 	bx	lr

0000017c <memset>:

void*
memset(void *dst, int c, uint n)
{
     17c:	e52db004 	push	{fp}		@ (str fp, [sp, #-4]!)
     180:	e28db000 	add	fp, sp, #0
     184:	e24dd01c 	sub	sp, sp, #28
     188:	e50b0010 	str	r0, [fp, #-16]
     18c:	e50b1014 	str	r1, [fp, #-20]	@ 0xffffffec
     190:	e50b2018 	str	r2, [fp, #-24]	@ 0xffffffe8
  char *p=dst;
     194:	e51b3010 	ldr	r3, [fp, #-16]
     198:	e50b3008 	str	r3, [fp, #-8]
  u32 rc=n;
     19c:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
     1a0:	e50b300c 	str	r3, [fp, #-12]

  while (rc-- > 0) *p++ = c;
     1a4:	ea000005 	b	1c0 <memset+0x44>
     1a8:	e51b3008 	ldr	r3, [fp, #-8]
     1ac:	e2832001 	add	r2, r3, #1
     1b0:	e50b2008 	str	r2, [fp, #-8]
     1b4:	e51b2014 	ldr	r2, [fp, #-20]	@ 0xffffffec
     1b8:	e6ef2072 	uxtb	r2, r2
     1bc:	e5c32000 	strb	r2, [r3]
     1c0:	e51b300c 	ldr	r3, [fp, #-12]
     1c4:	e2432001 	sub	r2, r3, #1
     1c8:	e50b200c 	str	r2, [fp, #-12]
     1cc:	e3530000 	cmp	r3, #0
     1d0:	1afffff4 	bne	1a8 <memset+0x2c>
  return (void *)p;
     1d4:	e51b3008 	ldr	r3, [fp, #-8]
}
     1d8:	e1a00003 	mov	r0, r3
     1dc:	e28bd000 	add	sp, fp, #0
     1e0:	e49db004 	pop	{fp}		@ (ldr fp, [sp], #4)
     1e4:	e12fff1e 	bx	lr

000001e8 <strchr>:

char*
strchr(const char *s, char c)
{
     1e8:	e52db004 	push	{fp}		@ (str fp, [sp, #-4]!)
     1ec:	e28db000 	add	fp, sp, #0
     1f0:	e24dd00c 	sub	sp, sp, #12
     1f4:	e50b0008 	str	r0, [fp, #-8]
     1f8:	e1a03001 	mov	r3, r1
     1fc:	e54b3009 	strb	r3, [fp, #-9]
  for(; *s; s++)
     200:	ea000009 	b	22c <strchr+0x44>
    if(*s == c)
     204:	e51b3008 	ldr	r3, [fp, #-8]
     208:	e5d33000 	ldrb	r3, [r3]
     20c:	e55b2009 	ldrb	r2, [fp, #-9]
     210:	e1520003 	cmp	r2, r3
     214:	1a000001 	bne	220 <strchr+0x38>
      return (char*)s;
     218:	e51b3008 	ldr	r3, [fp, #-8]
     21c:	ea000007 	b	240 <strchr+0x58>
  for(; *s; s++)
     220:	e51b3008 	ldr	r3, [fp, #-8]
     224:	e2833001 	add	r3, r3, #1
     228:	e50b3008 	str	r3, [fp, #-8]
     22c:	e51b3008 	ldr	r3, [fp, #-8]
     230:	e5d33000 	ldrb	r3, [r3]
     234:	e3530000 	cmp	r3, #0
     238:	1afffff1 	bne	204 <strchr+0x1c>
  return 0;
     23c:	e3a03000 	mov	r3, #0
}
     240:	e1a00003 	mov	r0, r3
     244:	e28bd000 	add	sp, fp, #0
     248:	e49db004 	pop	{fp}		@ (ldr fp, [sp], #4)
     24c:	e12fff1e 	bx	lr

00000250 <gets>:

char*
gets(char *buf, int max)
{
     250:	e92d4800 	push	{fp, lr}
     254:	e28db004 	add	fp, sp, #4
     258:	e24dd018 	sub	sp, sp, #24
     25c:	e50b0018 	str	r0, [fp, #-24]	@ 0xffffffe8
     260:	e50b101c 	str	r1, [fp, #-28]	@ 0xffffffe4
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
     264:	e3a03000 	mov	r3, #0
     268:	e50b3008 	str	r3, [fp, #-8]
     26c:	ea000016 	b	2cc <gets+0x7c>
    cc = read(0, &c, 1);
     270:	e24b300d 	sub	r3, fp, #13
     274:	e3a02001 	mov	r2, #1
     278:	e1a01003 	mov	r1, r3
     27c:	e3a00000 	mov	r0, #0
     280:	eb0000a8 	bl	528 <read>
     284:	e50b000c 	str	r0, [fp, #-12]
    if(cc < 1)
     288:	e51b300c 	ldr	r3, [fp, #-12]
     28c:	e3530000 	cmp	r3, #0
     290:	da000013 	ble	2e4 <gets+0x94>
      break;
    buf[i++] = c;
     294:	e51b3008 	ldr	r3, [fp, #-8]
     298:	e2832001 	add	r2, r3, #1
     29c:	e50b2008 	str	r2, [fp, #-8]
     2a0:	e1a02003 	mov	r2, r3
     2a4:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
     2a8:	e0833002 	add	r3, r3, r2
     2ac:	e55b200d 	ldrb	r2, [fp, #-13]
     2b0:	e5c32000 	strb	r2, [r3]
    if(c == '\n' || c == '\r')
     2b4:	e55b300d 	ldrb	r3, [fp, #-13]
     2b8:	e353000a 	cmp	r3, #10
     2bc:	0a000009 	beq	2e8 <gets+0x98>
     2c0:	e55b300d 	ldrb	r3, [fp, #-13]
     2c4:	e353000d 	cmp	r3, #13
     2c8:	0a000006 	beq	2e8 <gets+0x98>
  for(i=0; i+1 < max; ){
     2cc:	e51b3008 	ldr	r3, [fp, #-8]
     2d0:	e2833001 	add	r3, r3, #1
     2d4:	e51b201c 	ldr	r2, [fp, #-28]	@ 0xffffffe4
     2d8:	e1520003 	cmp	r2, r3
     2dc:	caffffe3 	bgt	270 <gets+0x20>
     2e0:	ea000000 	b	2e8 <gets+0x98>
      break;
     2e4:	e320f000 	nop	{0}
      break;
  }
  buf[i] = '\0';
     2e8:	e51b3008 	ldr	r3, [fp, #-8]
     2ec:	e51b2018 	ldr	r2, [fp, #-24]	@ 0xffffffe8
     2f0:	e0823003 	add	r3, r2, r3
     2f4:	e3a02000 	mov	r2, #0
     2f8:	e5c32000 	strb	r2, [r3]
  return buf;
     2fc:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
}
     300:	e1a00003 	mov	r0, r3
     304:	e24bd004 	sub	sp, fp, #4
     308:	e8bd8800 	pop	{fp, pc}

0000030c <stat>:

int
stat(char *n, struct stat *st)
{
     30c:	e92d4800 	push	{fp, lr}
     310:	e28db004 	add	fp, sp, #4
     314:	e24dd010 	sub	sp, sp, #16
     318:	e50b0010 	str	r0, [fp, #-16]
     31c:	e50b1014 	str	r1, [fp, #-20]	@ 0xffffffec
  int fd;
  int r;

  fd = open(n, O_RDONLY);
     320:	e3a01000 	mov	r1, #0
     324:	e51b0010 	ldr	r0, [fp, #-16]
     328:	eb0000bf 	bl	62c <open>
     32c:	e50b0008 	str	r0, [fp, #-8]
  if(fd < 0)
     330:	e51b3008 	ldr	r3, [fp, #-8]
     334:	e3530000 	cmp	r3, #0
     338:	aa000001 	bge	344 <stat+0x38>
    return -1;
     33c:	e3e03000 	mvn	r3, #0
     340:	ea000006 	b	360 <stat+0x54>
  r = fstat(fd, st);
     344:	e51b1014 	ldr	r1, [fp, #-20]	@ 0xffffffec
     348:	e51b0008 	ldr	r0, [fp, #-8]
     34c:	eb0000dd 	bl	6c8 <fstat>
     350:	e50b000c 	str	r0, [fp, #-12]
  close(fd);
     354:	e51b0008 	ldr	r0, [fp, #-8]
     358:	eb00008c 	bl	590 <close>
  return r;
     35c:	e51b300c 	ldr	r3, [fp, #-12]
}
     360:	e1a00003 	mov	r0, r3
     364:	e24bd004 	sub	sp, fp, #4
     368:	e8bd8800 	pop	{fp, pc}

0000036c <atoi>:

int
atoi(const char *s)
{
     36c:	e52db004 	push	{fp}		@ (str fp, [sp, #-4]!)
     370:	e28db000 	add	fp, sp, #0
     374:	e24dd014 	sub	sp, sp, #20
     378:	e50b0010 	str	r0, [fp, #-16]
  int n;

  n = 0;
     37c:	e3a03000 	mov	r3, #0
     380:	e50b3008 	str	r3, [fp, #-8]
  while('0' <= *s && *s <= '9')
     384:	ea000009 	b	3b0 <atoi+0x44>
    n = n*10 + *s++ - '0';
     388:	e51b3008 	ldr	r3, [fp, #-8]
     38c:	e3a0200a 	mov	r2, #10
     390:	e0020392 	mul	r2, r2, r3
     394:	e51b3010 	ldr	r3, [fp, #-16]
     398:	e2831001 	add	r1, r3, #1
     39c:	e50b1010 	str	r1, [fp, #-16]
     3a0:	e5d33000 	ldrb	r3, [r3]
     3a4:	e0823003 	add	r3, r2, r3
     3a8:	e2433030 	sub	r3, r3, #48	@ 0x30
     3ac:	e50b3008 	str	r3, [fp, #-8]
  while('0' <= *s && *s <= '9')
     3b0:	e51b3010 	ldr	r3, [fp, #-16]
     3b4:	e5d33000 	ldrb	r3, [r3]
     3b8:	e353002f 	cmp	r3, #47	@ 0x2f
     3bc:	9a000003 	bls	3d0 <atoi+0x64>
     3c0:	e51b3010 	ldr	r3, [fp, #-16]
     3c4:	e5d33000 	ldrb	r3, [r3]
     3c8:	e3530039 	cmp	r3, #57	@ 0x39
     3cc:	9affffed 	bls	388 <atoi+0x1c>
  return n;
     3d0:	e51b3008 	ldr	r3, [fp, #-8]
}
     3d4:	e1a00003 	mov	r0, r3
     3d8:	e28bd000 	add	sp, fp, #0
     3dc:	e49db004 	pop	{fp}		@ (ldr fp, [sp], #4)
     3e0:	e12fff1e 	bx	lr

000003e4 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
     3e4:	e52db004 	push	{fp}		@ (str fp, [sp, #-4]!)
     3e8:	e28db000 	add	fp, sp, #0
     3ec:	e24dd01c 	sub	sp, sp, #28
     3f0:	e50b0010 	str	r0, [fp, #-16]
     3f4:	e50b1014 	str	r1, [fp, #-20]	@ 0xffffffec
     3f8:	e50b2018 	str	r2, [fp, #-24]	@ 0xffffffe8
  char *dst, *src;
  
  dst = vdst;
     3fc:	e51b3010 	ldr	r3, [fp, #-16]
     400:	e50b3008 	str	r3, [fp, #-8]
  src = vsrc;
     404:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
     408:	e50b300c 	str	r3, [fp, #-12]
  while(n-- > 0)
     40c:	ea000007 	b	430 <memmove+0x4c>
    *dst++ = *src++;
     410:	e51b200c 	ldr	r2, [fp, #-12]
     414:	e2823001 	add	r3, r2, #1
     418:	e50b300c 	str	r3, [fp, #-12]
     41c:	e51b3008 	ldr	r3, [fp, #-8]
     420:	e2831001 	add	r1, r3, #1
     424:	e50b1008 	str	r1, [fp, #-8]
     428:	e5d22000 	ldrb	r2, [r2]
     42c:	e5c32000 	strb	r2, [r3]
  while(n-- > 0)
     430:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
     434:	e2432001 	sub	r2, r3, #1
     438:	e50b2018 	str	r2, [fp, #-24]	@ 0xffffffe8
     43c:	e3530000 	cmp	r3, #0
     440:	cafffff2 	bgt	410 <memmove+0x2c>
  return vdst;
     444:	e51b3010 	ldr	r3, [fp, #-16]
}
     448:	e1a00003 	mov	r0, r3
     44c:	e28bd000 	add	sp, fp, #0
     450:	e49db004 	pop	{fp}		@ (ldr fp, [sp], #4)
     454:	e12fff1e 	bx	lr

00000458 <fork>:
     458:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
     45c:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
     460:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
     464:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
     468:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
     46c:	e3a00001 	mov	r0, #1
     470:	ef000040 	svc	0x00000040
     474:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     478:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     47c:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
     480:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
     484:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
     488:	e12fff1e 	bx	lr

0000048c <exit>:
     48c:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
     490:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
     494:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
     498:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
     49c:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
     4a0:	e3a00002 	mov	r0, #2
     4a4:	ef000040 	svc	0x00000040
     4a8:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     4ac:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     4b0:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
     4b4:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
     4b8:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
     4bc:	e12fff1e 	bx	lr

000004c0 <wait>:
     4c0:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
     4c4:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
     4c8:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
     4cc:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
     4d0:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
     4d4:	e3a00003 	mov	r0, #3
     4d8:	ef000040 	svc	0x00000040
     4dc:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     4e0:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     4e4:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
     4e8:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
     4ec:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
     4f0:	e12fff1e 	bx	lr

000004f4 <pipe>:
     4f4:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
     4f8:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
     4fc:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
     500:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
     504:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
     508:	e3a00004 	mov	r0, #4
     50c:	ef000040 	svc	0x00000040
     510:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     514:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     518:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
     51c:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
     520:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
     524:	e12fff1e 	bx	lr

00000528 <read>:
     528:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
     52c:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
     530:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
     534:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
     538:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
     53c:	e3a00005 	mov	r0, #5
     540:	ef000040 	svc	0x00000040
     544:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     548:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     54c:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
     550:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
     554:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
     558:	e12fff1e 	bx	lr

0000055c <write>:
     55c:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
     560:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
     564:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
     568:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
     56c:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
     570:	e3a00010 	mov	r0, #16
     574:	ef000040 	svc	0x00000040
     578:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     57c:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     580:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
     584:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
     588:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
     58c:	e12fff1e 	bx	lr

00000590 <close>:
     590:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
     594:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
     598:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
     59c:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
     5a0:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
     5a4:	e3a00015 	mov	r0, #21
     5a8:	ef000040 	svc	0x00000040
     5ac:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     5b0:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     5b4:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
     5b8:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
     5bc:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
     5c0:	e12fff1e 	bx	lr

000005c4 <kill>:
     5c4:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
     5c8:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
     5cc:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
     5d0:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
     5d4:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
     5d8:	e3a00006 	mov	r0, #6
     5dc:	ef000040 	svc	0x00000040
     5e0:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     5e4:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     5e8:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
     5ec:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
     5f0:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
     5f4:	e12fff1e 	bx	lr

000005f8 <exec>:
     5f8:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
     5fc:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
     600:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
     604:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
     608:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
     60c:	e3a00007 	mov	r0, #7
     610:	ef000040 	svc	0x00000040
     614:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     618:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     61c:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
     620:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
     624:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
     628:	e12fff1e 	bx	lr

0000062c <open>:
     62c:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
     630:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
     634:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
     638:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
     63c:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
     640:	e3a0000f 	mov	r0, #15
     644:	ef000040 	svc	0x00000040
     648:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     64c:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     650:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
     654:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
     658:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
     65c:	e12fff1e 	bx	lr

00000660 <mknod>:
     660:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
     664:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
     668:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
     66c:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
     670:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
     674:	e3a00011 	mov	r0, #17
     678:	ef000040 	svc	0x00000040
     67c:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     680:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     684:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
     688:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
     68c:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
     690:	e12fff1e 	bx	lr

00000694 <unlink>:
     694:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
     698:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
     69c:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
     6a0:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
     6a4:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
     6a8:	e3a00012 	mov	r0, #18
     6ac:	ef000040 	svc	0x00000040
     6b0:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     6b4:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     6b8:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
     6bc:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
     6c0:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
     6c4:	e12fff1e 	bx	lr

000006c8 <fstat>:
     6c8:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
     6cc:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
     6d0:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
     6d4:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
     6d8:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
     6dc:	e3a00008 	mov	r0, #8
     6e0:	ef000040 	svc	0x00000040
     6e4:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     6e8:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     6ec:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
     6f0:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
     6f4:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
     6f8:	e12fff1e 	bx	lr

000006fc <link>:
     6fc:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
     700:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
     704:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
     708:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
     70c:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
     710:	e3a00013 	mov	r0, #19
     714:	ef000040 	svc	0x00000040
     718:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     71c:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     720:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
     724:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
     728:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
     72c:	e12fff1e 	bx	lr

00000730 <mkdir>:
     730:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
     734:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
     738:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
     73c:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
     740:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
     744:	e3a00014 	mov	r0, #20
     748:	ef000040 	svc	0x00000040
     74c:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     750:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     754:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
     758:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
     75c:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
     760:	e12fff1e 	bx	lr

00000764 <chdir>:
     764:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
     768:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
     76c:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
     770:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
     774:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
     778:	e3a00009 	mov	r0, #9
     77c:	ef000040 	svc	0x00000040
     780:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     784:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     788:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
     78c:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
     790:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
     794:	e12fff1e 	bx	lr

00000798 <dup>:
     798:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
     79c:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
     7a0:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
     7a4:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
     7a8:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
     7ac:	e3a0000a 	mov	r0, #10
     7b0:	ef000040 	svc	0x00000040
     7b4:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     7b8:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     7bc:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
     7c0:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
     7c4:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
     7c8:	e12fff1e 	bx	lr

000007cc <getpid>:
     7cc:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
     7d0:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
     7d4:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
     7d8:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
     7dc:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
     7e0:	e3a0000b 	mov	r0, #11
     7e4:	ef000040 	svc	0x00000040
     7e8:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     7ec:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     7f0:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
     7f4:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
     7f8:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
     7fc:	e12fff1e 	bx	lr

00000800 <sbrk>:
     800:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
     804:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
     808:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
     80c:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
     810:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
     814:	e3a0000c 	mov	r0, #12
     818:	ef000040 	svc	0x00000040
     81c:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     820:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     824:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
     828:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
     82c:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
     830:	e12fff1e 	bx	lr

00000834 <sleep>:
     834:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
     838:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
     83c:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
     840:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
     844:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
     848:	e3a0000d 	mov	r0, #13
     84c:	ef000040 	svc	0x00000040
     850:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     854:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     858:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
     85c:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
     860:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
     864:	e12fff1e 	bx	lr

00000868 <uptime>:
     868:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
     86c:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
     870:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
     874:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
     878:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
     87c:	e3a0000e 	mov	r0, #14
     880:	ef000040 	svc	0x00000040
     884:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     888:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     88c:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
     890:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
     894:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
     898:	e12fff1e 	bx	lr

0000089c <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
     89c:	e92d4800 	push	{fp, lr}
     8a0:	e28db004 	add	fp, sp, #4
     8a4:	e24dd008 	sub	sp, sp, #8
     8a8:	e50b0008 	str	r0, [fp, #-8]
     8ac:	e1a03001 	mov	r3, r1
     8b0:	e54b3009 	strb	r3, [fp, #-9]
  write(fd, &c, 1);
     8b4:	e24b3009 	sub	r3, fp, #9
     8b8:	e3a02001 	mov	r2, #1
     8bc:	e1a01003 	mov	r1, r3
     8c0:	e51b0008 	ldr	r0, [fp, #-8]
     8c4:	ebffff24 	bl	55c <write>
}
     8c8:	e320f000 	nop	{0}
     8cc:	e24bd004 	sub	sp, fp, #4
     8d0:	e8bd8800 	pop	{fp, pc}

000008d4 <div>:

u32 div(u32 n, u32 d)  // long division
{
     8d4:	e52db004 	push	{fp}		@ (str fp, [sp, #-4]!)
     8d8:	e28db000 	add	fp, sp, #0
     8dc:	e24dd01c 	sub	sp, sp, #28
     8e0:	e50b0018 	str	r0, [fp, #-24]	@ 0xffffffe8
     8e4:	e50b101c 	str	r1, [fp, #-28]	@ 0xffffffe4
    u32 q=0, r=0;
     8e8:	e3a03000 	mov	r3, #0
     8ec:	e50b3008 	str	r3, [fp, #-8]
     8f0:	e3a03000 	mov	r3, #0
     8f4:	e50b300c 	str	r3, [fp, #-12]
    int i;

    for(i=31;i>=0;i--){
     8f8:	e3a0301f 	mov	r3, #31
     8fc:	e50b3010 	str	r3, [fp, #-16]
     900:	ea00001b 	b	974 <div+0xa0>
        r = r << 1;
     904:	e51b300c 	ldr	r3, [fp, #-12]
     908:	e1a03083 	lsl	r3, r3, #1
     90c:	e50b300c 	str	r3, [fp, #-12]
        r = r | ((n >> i) & 1);
     910:	e51b2018 	ldr	r2, [fp, #-24]	@ 0xffffffe8
     914:	e51b3010 	ldr	r3, [fp, #-16]
     918:	e1a03332 	lsr	r3, r2, r3
     91c:	e2033001 	and	r3, r3, #1
     920:	e51b200c 	ldr	r2, [fp, #-12]
     924:	e1823003 	orr	r3, r2, r3
     928:	e50b300c 	str	r3, [fp, #-12]
        if(r >= d) {
     92c:	e51b200c 	ldr	r2, [fp, #-12]
     930:	e51b301c 	ldr	r3, [fp, #-28]	@ 0xffffffe4
     934:	e1520003 	cmp	r2, r3
     938:	3a00000a 	bcc	968 <div+0x94>
            r = r - d;
     93c:	e51b200c 	ldr	r2, [fp, #-12]
     940:	e51b301c 	ldr	r3, [fp, #-28]	@ 0xffffffe4
     944:	e0423003 	sub	r3, r2, r3
     948:	e50b300c 	str	r3, [fp, #-12]
            q = q | (1 << i);
     94c:	e3a02001 	mov	r2, #1
     950:	e51b3010 	ldr	r3, [fp, #-16]
     954:	e1a03312 	lsl	r3, r2, r3
     958:	e1a02003 	mov	r2, r3
     95c:	e51b3008 	ldr	r3, [fp, #-8]
     960:	e1833002 	orr	r3, r3, r2
     964:	e50b3008 	str	r3, [fp, #-8]
    for(i=31;i>=0;i--){
     968:	e51b3010 	ldr	r3, [fp, #-16]
     96c:	e2433001 	sub	r3, r3, #1
     970:	e50b3010 	str	r3, [fp, #-16]
     974:	e51b3010 	ldr	r3, [fp, #-16]
     978:	e3530000 	cmp	r3, #0
     97c:	aaffffe0 	bge	904 <div+0x30>
        }
    }
    return q;
     980:	e51b3008 	ldr	r3, [fp, #-8]
}
     984:	e1a00003 	mov	r0, r3
     988:	e28bd000 	add	sp, fp, #0
     98c:	e49db004 	pop	{fp}		@ (ldr fp, [sp], #4)
     990:	e12fff1e 	bx	lr

00000994 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
     994:	e92d4800 	push	{fp, lr}
     998:	e28db004 	add	fp, sp, #4
     99c:	e24dd038 	sub	sp, sp, #56	@ 0x38
     9a0:	e50b0030 	str	r0, [fp, #-48]	@ 0xffffffd0
     9a4:	e50b1034 	str	r1, [fp, #-52]	@ 0xffffffcc
     9a8:	e50b2038 	str	r2, [fp, #-56]	@ 0xffffffc8
     9ac:	e50b303c 	str	r3, [fp, #-60]	@ 0xffffffc4
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x, y, b;

  neg = 0;
     9b0:	e3a03000 	mov	r3, #0
     9b4:	e50b300c 	str	r3, [fp, #-12]
  if(sgn && xx < 0){
     9b8:	e51b303c 	ldr	r3, [fp, #-60]	@ 0xffffffc4
     9bc:	e3530000 	cmp	r3, #0
     9c0:	0a000008 	beq	9e8 <printint+0x54>
     9c4:	e51b3034 	ldr	r3, [fp, #-52]	@ 0xffffffcc
     9c8:	e3530000 	cmp	r3, #0
     9cc:	aa000005 	bge	9e8 <printint+0x54>
    neg = 1;
     9d0:	e3a03001 	mov	r3, #1
     9d4:	e50b300c 	str	r3, [fp, #-12]
    x = -xx;
     9d8:	e51b3034 	ldr	r3, [fp, #-52]	@ 0xffffffcc
     9dc:	e2633000 	rsb	r3, r3, #0
     9e0:	e50b3010 	str	r3, [fp, #-16]
     9e4:	ea000001 	b	9f0 <printint+0x5c>
  } else {
    x = xx;
     9e8:	e51b3034 	ldr	r3, [fp, #-52]	@ 0xffffffcc
     9ec:	e50b3010 	str	r3, [fp, #-16]
  }

  b = base;
     9f0:	e51b3038 	ldr	r3, [fp, #-56]	@ 0xffffffc8
     9f4:	e50b3014 	str	r3, [fp, #-20]	@ 0xffffffec
  i = 0;
     9f8:	e3a03000 	mov	r3, #0
     9fc:	e50b3008 	str	r3, [fp, #-8]
  do{
    y = div(x, b);
     a00:	e51b1014 	ldr	r1, [fp, #-20]	@ 0xffffffec
     a04:	e51b0010 	ldr	r0, [fp, #-16]
     a08:	ebffffb1 	bl	8d4 <div>
     a0c:	e50b0018 	str	r0, [fp, #-24]	@ 0xffffffe8
    buf[i++] = digits[x - y * b];
     a10:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
     a14:	e51b2014 	ldr	r2, [fp, #-20]	@ 0xffffffec
     a18:	e0030392 	mul	r3, r2, r3
     a1c:	e51b2010 	ldr	r2, [fp, #-16]
     a20:	e0421003 	sub	r1, r2, r3
     a24:	e51b2008 	ldr	r2, [fp, #-8]
     a28:	e2823001 	add	r3, r2, #1
     a2c:	e50b3008 	str	r3, [fp, #-8]
     a30:	e30130b8 	movw	r3, #4280	@ 0x10b8
     a34:	e3403000 	movt	r3, #0
     a38:	e7d31001 	ldrb	r1, [r3, r1]
     a3c:	e2423004 	sub	r3, r2, #4
     a40:	e083300b 	add	r3, r3, fp
     a44:	e1a02001 	mov	r2, r1
     a48:	e5432024 	strb	r2, [r3, #-36]	@ 0xffffffdc
  }while((x = y) != 0);
     a4c:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
     a50:	e50b3010 	str	r3, [fp, #-16]
     a54:	e51b3010 	ldr	r3, [fp, #-16]
     a58:	e3530000 	cmp	r3, #0
     a5c:	1affffe7 	bne	a00 <printint+0x6c>
  if(neg)
     a60:	e51b300c 	ldr	r3, [fp, #-12]
     a64:	e3530000 	cmp	r3, #0
     a68:	0a00000e 	beq	aa8 <printint+0x114>
    buf[i++] = '-';
     a6c:	e51b3008 	ldr	r3, [fp, #-8]
     a70:	e2832001 	add	r2, r3, #1
     a74:	e50b2008 	str	r2, [fp, #-8]
     a78:	e2433004 	sub	r3, r3, #4
     a7c:	e083300b 	add	r3, r3, fp
     a80:	e3a0202d 	mov	r2, #45	@ 0x2d
     a84:	e5432024 	strb	r2, [r3, #-36]	@ 0xffffffdc

  while(--i >= 0)
     a88:	ea000006 	b	aa8 <printint+0x114>
    putc(fd, buf[i]);
     a8c:	e24b2028 	sub	r2, fp, #40	@ 0x28
     a90:	e51b3008 	ldr	r3, [fp, #-8]
     a94:	e0823003 	add	r3, r2, r3
     a98:	e5d33000 	ldrb	r3, [r3]
     a9c:	e1a01003 	mov	r1, r3
     aa0:	e51b0030 	ldr	r0, [fp, #-48]	@ 0xffffffd0
     aa4:	ebffff7c 	bl	89c <putc>
  while(--i >= 0)
     aa8:	e51b3008 	ldr	r3, [fp, #-8]
     aac:	e2433001 	sub	r3, r3, #1
     ab0:	e50b3008 	str	r3, [fp, #-8]
     ab4:	e51b3008 	ldr	r3, [fp, #-8]
     ab8:	e3530000 	cmp	r3, #0
     abc:	aafffff2 	bge	a8c <printint+0xf8>
}
     ac0:	e320f000 	nop	{0}
     ac4:	e320f000 	nop	{0}
     ac8:	e24bd004 	sub	sp, fp, #4
     acc:	e8bd8800 	pop	{fp, pc}

00000ad0 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
     ad0:	e92d000e 	push	{r1, r2, r3}
     ad4:	e92d4800 	push	{fp, lr}
     ad8:	e28db004 	add	fp, sp, #4
     adc:	e24dd024 	sub	sp, sp, #36	@ 0x24
     ae0:	e50b0024 	str	r0, [fp, #-36]	@ 0xffffffdc
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
     ae4:	e3a03000 	mov	r3, #0
     ae8:	e50b3014 	str	r3, [fp, #-20]	@ 0xffffffec
  ap = (uint*)(void*)&fmt + 1;
     aec:	e28b3008 	add	r3, fp, #8
     af0:	e50b3018 	str	r3, [fp, #-24]	@ 0xffffffe8
  for(i = 0; fmt[i]; i++){
     af4:	e3a03000 	mov	r3, #0
     af8:	e50b3010 	str	r3, [fp, #-16]
     afc:	ea000075 	b	cd8 <printf+0x208>
    c = fmt[i] & 0xff;
     b00:	e59b2004 	ldr	r2, [fp, #4]
     b04:	e51b3010 	ldr	r3, [fp, #-16]
     b08:	e0823003 	add	r3, r2, r3
     b0c:	e5d33000 	ldrb	r3, [r3]
     b10:	e50b301c 	str	r3, [fp, #-28]	@ 0xffffffe4
    if(state == 0){
     b14:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
     b18:	e3530000 	cmp	r3, #0
     b1c:	1a00000b 	bne	b50 <printf+0x80>
      if(c == '%'){
     b20:	e51b301c 	ldr	r3, [fp, #-28]	@ 0xffffffe4
     b24:	e3530025 	cmp	r3, #37	@ 0x25
     b28:	1a000002 	bne	b38 <printf+0x68>
        state = '%';
     b2c:	e3a03025 	mov	r3, #37	@ 0x25
     b30:	e50b3014 	str	r3, [fp, #-20]	@ 0xffffffec
     b34:	ea000064 	b	ccc <printf+0x1fc>
      } else {
        putc(fd, c);
     b38:	e51b301c 	ldr	r3, [fp, #-28]	@ 0xffffffe4
     b3c:	e6ef3073 	uxtb	r3, r3
     b40:	e1a01003 	mov	r1, r3
     b44:	e51b0024 	ldr	r0, [fp, #-36]	@ 0xffffffdc
     b48:	ebffff53 	bl	89c <putc>
     b4c:	ea00005e 	b	ccc <printf+0x1fc>
      }
    } else if(state == '%'){
     b50:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
     b54:	e3530025 	cmp	r3, #37	@ 0x25
     b58:	1a00005b 	bne	ccc <printf+0x1fc>
      if(c == 'd'){
     b5c:	e51b301c 	ldr	r3, [fp, #-28]	@ 0xffffffe4
     b60:	e3530064 	cmp	r3, #100	@ 0x64
     b64:	1a00000a 	bne	b94 <printf+0xc4>
        printint(fd, *ap, 10, 1);
     b68:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
     b6c:	e5933000 	ldr	r3, [r3]
     b70:	e1a01003 	mov	r1, r3
     b74:	e3a03001 	mov	r3, #1
     b78:	e3a0200a 	mov	r2, #10
     b7c:	e51b0024 	ldr	r0, [fp, #-36]	@ 0xffffffdc
     b80:	ebffff83 	bl	994 <printint>
        ap++;
     b84:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
     b88:	e2833004 	add	r3, r3, #4
     b8c:	e50b3018 	str	r3, [fp, #-24]	@ 0xffffffe8
     b90:	ea00004b 	b	cc4 <printf+0x1f4>
      } else if(c == 'x' || c == 'p'){
     b94:	e51b301c 	ldr	r3, [fp, #-28]	@ 0xffffffe4
     b98:	e3530078 	cmp	r3, #120	@ 0x78
     b9c:	0a000002 	beq	bac <printf+0xdc>
     ba0:	e51b301c 	ldr	r3, [fp, #-28]	@ 0xffffffe4
     ba4:	e3530070 	cmp	r3, #112	@ 0x70
     ba8:	1a00000a 	bne	bd8 <printf+0x108>
        printint(fd, *ap, 16, 0);
     bac:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
     bb0:	e5933000 	ldr	r3, [r3]
     bb4:	e1a01003 	mov	r1, r3
     bb8:	e3a03000 	mov	r3, #0
     bbc:	e3a02010 	mov	r2, #16
     bc0:	e51b0024 	ldr	r0, [fp, #-36]	@ 0xffffffdc
     bc4:	ebffff72 	bl	994 <printint>
        ap++;
     bc8:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
     bcc:	e2833004 	add	r3, r3, #4
     bd0:	e50b3018 	str	r3, [fp, #-24]	@ 0xffffffe8
     bd4:	ea00003a 	b	cc4 <printf+0x1f4>
      } else if(c == 's'){
     bd8:	e51b301c 	ldr	r3, [fp, #-28]	@ 0xffffffe4
     bdc:	e3530073 	cmp	r3, #115	@ 0x73
     be0:	1a000019 	bne	c4c <printf+0x17c>
        s = (char*)*ap;
     be4:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
     be8:	e5933000 	ldr	r3, [r3]
     bec:	e50b300c 	str	r3, [fp, #-12]
        ap++;
     bf0:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
     bf4:	e2833004 	add	r3, r3, #4
     bf8:	e50b3018 	str	r3, [fp, #-24]	@ 0xffffffe8
        if(s == 0)
     bfc:	e51b300c 	ldr	r3, [fp, #-12]
     c00:	e3530000 	cmp	r3, #0
     c04:	1a00000b 	bne	c38 <printf+0x168>
          s = "(null)";
     c08:	e30130b0 	movw	r3, #4272	@ 0x10b0
     c0c:	e3403000 	movt	r3, #0
     c10:	e50b300c 	str	r3, [fp, #-12]
        while(*s != 0){
     c14:	ea000007 	b	c38 <printf+0x168>
          putc(fd, *s);
     c18:	e51b300c 	ldr	r3, [fp, #-12]
     c1c:	e5d33000 	ldrb	r3, [r3]
     c20:	e1a01003 	mov	r1, r3
     c24:	e51b0024 	ldr	r0, [fp, #-36]	@ 0xffffffdc
     c28:	ebffff1b 	bl	89c <putc>
          s++;
     c2c:	e51b300c 	ldr	r3, [fp, #-12]
     c30:	e2833001 	add	r3, r3, #1
     c34:	e50b300c 	str	r3, [fp, #-12]
        while(*s != 0){
     c38:	e51b300c 	ldr	r3, [fp, #-12]
     c3c:	e5d33000 	ldrb	r3, [r3]
     c40:	e3530000 	cmp	r3, #0
     c44:	1afffff3 	bne	c18 <printf+0x148>
     c48:	ea00001d 	b	cc4 <printf+0x1f4>
        }
      } else if(c == 'c'){
     c4c:	e51b301c 	ldr	r3, [fp, #-28]	@ 0xffffffe4
     c50:	e3530063 	cmp	r3, #99	@ 0x63
     c54:	1a000009 	bne	c80 <printf+0x1b0>
        putc(fd, *ap);
     c58:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
     c5c:	e5933000 	ldr	r3, [r3]
     c60:	e6ef3073 	uxtb	r3, r3
     c64:	e1a01003 	mov	r1, r3
     c68:	e51b0024 	ldr	r0, [fp, #-36]	@ 0xffffffdc
     c6c:	ebffff0a 	bl	89c <putc>
        ap++;
     c70:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
     c74:	e2833004 	add	r3, r3, #4
     c78:	e50b3018 	str	r3, [fp, #-24]	@ 0xffffffe8
     c7c:	ea000010 	b	cc4 <printf+0x1f4>
      } else if(c == '%'){
     c80:	e51b301c 	ldr	r3, [fp, #-28]	@ 0xffffffe4
     c84:	e3530025 	cmp	r3, #37	@ 0x25
     c88:	1a000005 	bne	ca4 <printf+0x1d4>
        putc(fd, c);
     c8c:	e51b301c 	ldr	r3, [fp, #-28]	@ 0xffffffe4
     c90:	e6ef3073 	uxtb	r3, r3
     c94:	e1a01003 	mov	r1, r3
     c98:	e51b0024 	ldr	r0, [fp, #-36]	@ 0xffffffdc
     c9c:	ebfffefe 	bl	89c <putc>
     ca0:	ea000007 	b	cc4 <printf+0x1f4>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
     ca4:	e3a01025 	mov	r1, #37	@ 0x25
     ca8:	e51b0024 	ldr	r0, [fp, #-36]	@ 0xffffffdc
     cac:	ebfffefa 	bl	89c <putc>
        putc(fd, c);
     cb0:	e51b301c 	ldr	r3, [fp, #-28]	@ 0xffffffe4
     cb4:	e6ef3073 	uxtb	r3, r3
     cb8:	e1a01003 	mov	r1, r3
     cbc:	e51b0024 	ldr	r0, [fp, #-36]	@ 0xffffffdc
     cc0:	ebfffef5 	bl	89c <putc>
      }
      state = 0;
     cc4:	e3a03000 	mov	r3, #0
     cc8:	e50b3014 	str	r3, [fp, #-20]	@ 0xffffffec
  for(i = 0; fmt[i]; i++){
     ccc:	e51b3010 	ldr	r3, [fp, #-16]
     cd0:	e2833001 	add	r3, r3, #1
     cd4:	e50b3010 	str	r3, [fp, #-16]
     cd8:	e59b2004 	ldr	r2, [fp, #4]
     cdc:	e51b3010 	ldr	r3, [fp, #-16]
     ce0:	e0823003 	add	r3, r2, r3
     ce4:	e5d33000 	ldrb	r3, [r3]
     ce8:	e3530000 	cmp	r3, #0
     cec:	1affff83 	bne	b00 <printf+0x30>
    }
  }
}
     cf0:	e320f000 	nop	{0}
     cf4:	e320f000 	nop	{0}
     cf8:	e24bd004 	sub	sp, fp, #4
     cfc:	e8bd4800 	pop	{fp, lr}
     d00:	e28dd00c 	add	sp, sp, #12
     d04:	e12fff1e 	bx	lr

00000d08 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
     d08:	e52db004 	push	{fp}		@ (str fp, [sp, #-4]!)
     d0c:	e28db000 	add	fp, sp, #0
     d10:	e24dd014 	sub	sp, sp, #20
     d14:	e50b0010 	str	r0, [fp, #-16]
  Header *bp, *p;

  bp = (Header*)ap - 1;
     d18:	e51b3010 	ldr	r3, [fp, #-16]
     d1c:	e2433008 	sub	r3, r3, #8
     d20:	e50b300c 	str	r3, [fp, #-12]
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
     d24:	e30130d4 	movw	r3, #4308	@ 0x10d4
     d28:	e3403000 	movt	r3, #0
     d2c:	e5933000 	ldr	r3, [r3]
     d30:	e50b3008 	str	r3, [fp, #-8]
     d34:	ea000010 	b	d7c <free+0x74>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
     d38:	e51b3008 	ldr	r3, [fp, #-8]
     d3c:	e5933000 	ldr	r3, [r3]
     d40:	e51b2008 	ldr	r2, [fp, #-8]
     d44:	e1520003 	cmp	r2, r3
     d48:	3a000008 	bcc	d70 <free+0x68>
     d4c:	e51b200c 	ldr	r2, [fp, #-12]
     d50:	e51b3008 	ldr	r3, [fp, #-8]
     d54:	e1520003 	cmp	r2, r3
     d58:	8a000010 	bhi	da0 <free+0x98>
     d5c:	e51b3008 	ldr	r3, [fp, #-8]
     d60:	e5933000 	ldr	r3, [r3]
     d64:	e51b200c 	ldr	r2, [fp, #-12]
     d68:	e1520003 	cmp	r2, r3
     d6c:	3a00000b 	bcc	da0 <free+0x98>
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
     d70:	e51b3008 	ldr	r3, [fp, #-8]
     d74:	e5933000 	ldr	r3, [r3]
     d78:	e50b3008 	str	r3, [fp, #-8]
     d7c:	e51b200c 	ldr	r2, [fp, #-12]
     d80:	e51b3008 	ldr	r3, [fp, #-8]
     d84:	e1520003 	cmp	r2, r3
     d88:	9affffea 	bls	d38 <free+0x30>
     d8c:	e51b3008 	ldr	r3, [fp, #-8]
     d90:	e5933000 	ldr	r3, [r3]
     d94:	e51b200c 	ldr	r2, [fp, #-12]
     d98:	e1520003 	cmp	r2, r3
     d9c:	2affffe5 	bcs	d38 <free+0x30>
      break;
  if(bp + bp->s.size == p->s.ptr){
     da0:	e51b300c 	ldr	r3, [fp, #-12]
     da4:	e5933004 	ldr	r3, [r3, #4]
     da8:	e1a03183 	lsl	r3, r3, #3
     dac:	e51b200c 	ldr	r2, [fp, #-12]
     db0:	e0822003 	add	r2, r2, r3
     db4:	e51b3008 	ldr	r3, [fp, #-8]
     db8:	e5933000 	ldr	r3, [r3]
     dbc:	e1520003 	cmp	r2, r3
     dc0:	1a00000d 	bne	dfc <free+0xf4>
    bp->s.size += p->s.ptr->s.size;
     dc4:	e51b300c 	ldr	r3, [fp, #-12]
     dc8:	e5932004 	ldr	r2, [r3, #4]
     dcc:	e51b3008 	ldr	r3, [fp, #-8]
     dd0:	e5933000 	ldr	r3, [r3]
     dd4:	e5933004 	ldr	r3, [r3, #4]
     dd8:	e0822003 	add	r2, r2, r3
     ddc:	e51b300c 	ldr	r3, [fp, #-12]
     de0:	e5832004 	str	r2, [r3, #4]
    bp->s.ptr = p->s.ptr->s.ptr;
     de4:	e51b3008 	ldr	r3, [fp, #-8]
     de8:	e5933000 	ldr	r3, [r3]
     dec:	e5932000 	ldr	r2, [r3]
     df0:	e51b300c 	ldr	r3, [fp, #-12]
     df4:	e5832000 	str	r2, [r3]
     df8:	ea000003 	b	e0c <free+0x104>
  } else
    bp->s.ptr = p->s.ptr;
     dfc:	e51b3008 	ldr	r3, [fp, #-8]
     e00:	e5932000 	ldr	r2, [r3]
     e04:	e51b300c 	ldr	r3, [fp, #-12]
     e08:	e5832000 	str	r2, [r3]
  if(p + p->s.size == bp){
     e0c:	e51b3008 	ldr	r3, [fp, #-8]
     e10:	e5933004 	ldr	r3, [r3, #4]
     e14:	e1a03183 	lsl	r3, r3, #3
     e18:	e51b2008 	ldr	r2, [fp, #-8]
     e1c:	e0823003 	add	r3, r2, r3
     e20:	e51b200c 	ldr	r2, [fp, #-12]
     e24:	e1520003 	cmp	r2, r3
     e28:	1a00000b 	bne	e5c <free+0x154>
    p->s.size += bp->s.size;
     e2c:	e51b3008 	ldr	r3, [fp, #-8]
     e30:	e5932004 	ldr	r2, [r3, #4]
     e34:	e51b300c 	ldr	r3, [fp, #-12]
     e38:	e5933004 	ldr	r3, [r3, #4]
     e3c:	e0822003 	add	r2, r2, r3
     e40:	e51b3008 	ldr	r3, [fp, #-8]
     e44:	e5832004 	str	r2, [r3, #4]
    p->s.ptr = bp->s.ptr;
     e48:	e51b300c 	ldr	r3, [fp, #-12]
     e4c:	e5932000 	ldr	r2, [r3]
     e50:	e51b3008 	ldr	r3, [fp, #-8]
     e54:	e5832000 	str	r2, [r3]
     e58:	ea000002 	b	e68 <free+0x160>
  } else
    p->s.ptr = bp;
     e5c:	e51b3008 	ldr	r3, [fp, #-8]
     e60:	e51b200c 	ldr	r2, [fp, #-12]
     e64:	e5832000 	str	r2, [r3]
  freep = p;
     e68:	e30130d4 	movw	r3, #4308	@ 0x10d4
     e6c:	e3403000 	movt	r3, #0
     e70:	e51b2008 	ldr	r2, [fp, #-8]
     e74:	e5832000 	str	r2, [r3]
}
     e78:	e320f000 	nop	{0}
     e7c:	e28bd000 	add	sp, fp, #0
     e80:	e49db004 	pop	{fp}		@ (ldr fp, [sp], #4)
     e84:	e12fff1e 	bx	lr

00000e88 <morecore>:

static Header*
morecore(uint nu)
{
     e88:	e92d4800 	push	{fp, lr}
     e8c:	e28db004 	add	fp, sp, #4
     e90:	e24dd010 	sub	sp, sp, #16
     e94:	e50b0010 	str	r0, [fp, #-16]
  char *p;
  Header *hp;

  if(nu < 4096)
     e98:	e51b3010 	ldr	r3, [fp, #-16]
     e9c:	e3530a01 	cmp	r3, #4096	@ 0x1000
     ea0:	2a000001 	bcs	eac <morecore+0x24>
    nu = 4096;
     ea4:	e3a03a01 	mov	r3, #4096	@ 0x1000
     ea8:	e50b3010 	str	r3, [fp, #-16]
  p = sbrk(nu * sizeof(Header));
     eac:	e51b3010 	ldr	r3, [fp, #-16]
     eb0:	e1a03183 	lsl	r3, r3, #3
     eb4:	e1a00003 	mov	r0, r3
     eb8:	ebfffe50 	bl	800 <sbrk>
     ebc:	e50b0008 	str	r0, [fp, #-8]
  if(p == (char*)-1)
     ec0:	e51b3008 	ldr	r3, [fp, #-8]
     ec4:	e3730001 	cmn	r3, #1
     ec8:	1a000001 	bne	ed4 <morecore+0x4c>
    return 0;
     ecc:	e3a03000 	mov	r3, #0
     ed0:	ea00000b 	b	f04 <morecore+0x7c>
  hp = (Header*)p;
     ed4:	e51b3008 	ldr	r3, [fp, #-8]
     ed8:	e50b300c 	str	r3, [fp, #-12]
  hp->s.size = nu;
     edc:	e51b300c 	ldr	r3, [fp, #-12]
     ee0:	e51b2010 	ldr	r2, [fp, #-16]
     ee4:	e5832004 	str	r2, [r3, #4]
  free((void*)(hp + 1));
     ee8:	e51b300c 	ldr	r3, [fp, #-12]
     eec:	e2833008 	add	r3, r3, #8
     ef0:	e1a00003 	mov	r0, r3
     ef4:	ebffff83 	bl	d08 <free>
  return freep;
     ef8:	e30130d4 	movw	r3, #4308	@ 0x10d4
     efc:	e3403000 	movt	r3, #0
     f00:	e5933000 	ldr	r3, [r3]
}
     f04:	e1a00003 	mov	r0, r3
     f08:	e24bd004 	sub	sp, fp, #4
     f0c:	e8bd8800 	pop	{fp, pc}

00000f10 <malloc>:

void*
malloc(uint nbytes)
{
     f10:	e92d4800 	push	{fp, lr}
     f14:	e28db004 	add	fp, sp, #4
     f18:	e24dd018 	sub	sp, sp, #24
     f1c:	e50b0018 	str	r0, [fp, #-24]	@ 0xffffffe8
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
     f20:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
     f24:	e2833007 	add	r3, r3, #7
     f28:	e1a031a3 	lsr	r3, r3, #3
     f2c:	e2833001 	add	r3, r3, #1
     f30:	e50b3010 	str	r3, [fp, #-16]
  if((prevp = freep) == 0){
     f34:	e30130d4 	movw	r3, #4308	@ 0x10d4
     f38:	e3403000 	movt	r3, #0
     f3c:	e5933000 	ldr	r3, [r3]
     f40:	e50b300c 	str	r3, [fp, #-12]
     f44:	e51b300c 	ldr	r3, [fp, #-12]
     f48:	e3530000 	cmp	r3, #0
     f4c:	1a000010 	bne	f94 <malloc+0x84>
    base.s.ptr = freep = prevp = &base;
     f50:	e30130cc 	movw	r3, #4300	@ 0x10cc
     f54:	e3403000 	movt	r3, #0
     f58:	e50b300c 	str	r3, [fp, #-12]
     f5c:	e30130d4 	movw	r3, #4308	@ 0x10d4
     f60:	e3403000 	movt	r3, #0
     f64:	e51b200c 	ldr	r2, [fp, #-12]
     f68:	e5832000 	str	r2, [r3]
     f6c:	e30130d4 	movw	r3, #4308	@ 0x10d4
     f70:	e3403000 	movt	r3, #0
     f74:	e5932000 	ldr	r2, [r3]
     f78:	e30130cc 	movw	r3, #4300	@ 0x10cc
     f7c:	e3403000 	movt	r3, #0
     f80:	e5832000 	str	r2, [r3]
    base.s.size = 0;
     f84:	e30130cc 	movw	r3, #4300	@ 0x10cc
     f88:	e3403000 	movt	r3, #0
     f8c:	e3a02000 	mov	r2, #0
     f90:	e5832004 	str	r2, [r3, #4]
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
     f94:	e51b300c 	ldr	r3, [fp, #-12]
     f98:	e5933000 	ldr	r3, [r3]
     f9c:	e50b3008 	str	r3, [fp, #-8]
    if(p->s.size >= nunits){
     fa0:	e51b3008 	ldr	r3, [fp, #-8]
     fa4:	e5933004 	ldr	r3, [r3, #4]
     fa8:	e51b2010 	ldr	r2, [fp, #-16]
     fac:	e1520003 	cmp	r2, r3
     fb0:	8a00001f 	bhi	1034 <malloc+0x124>
      if(p->s.size == nunits)
     fb4:	e51b3008 	ldr	r3, [fp, #-8]
     fb8:	e5933004 	ldr	r3, [r3, #4]
     fbc:	e51b2010 	ldr	r2, [fp, #-16]
     fc0:	e1520003 	cmp	r2, r3
     fc4:	1a000004 	bne	fdc <malloc+0xcc>
        prevp->s.ptr = p->s.ptr;
     fc8:	e51b3008 	ldr	r3, [fp, #-8]
     fcc:	e5932000 	ldr	r2, [r3]
     fd0:	e51b300c 	ldr	r3, [fp, #-12]
     fd4:	e5832000 	str	r2, [r3]
     fd8:	ea00000e 	b	1018 <malloc+0x108>
      else {
        p->s.size -= nunits;
     fdc:	e51b3008 	ldr	r3, [fp, #-8]
     fe0:	e5932004 	ldr	r2, [r3, #4]
     fe4:	e51b3010 	ldr	r3, [fp, #-16]
     fe8:	e0422003 	sub	r2, r2, r3
     fec:	e51b3008 	ldr	r3, [fp, #-8]
     ff0:	e5832004 	str	r2, [r3, #4]
        p += p->s.size;
     ff4:	e51b3008 	ldr	r3, [fp, #-8]
     ff8:	e5933004 	ldr	r3, [r3, #4]
     ffc:	e1a03183 	lsl	r3, r3, #3
    1000:	e51b2008 	ldr	r2, [fp, #-8]
    1004:	e0823003 	add	r3, r2, r3
    1008:	e50b3008 	str	r3, [fp, #-8]
        p->s.size = nunits;
    100c:	e51b3008 	ldr	r3, [fp, #-8]
    1010:	e51b2010 	ldr	r2, [fp, #-16]
    1014:	e5832004 	str	r2, [r3, #4]
      }
      freep = prevp;
    1018:	e30130d4 	movw	r3, #4308	@ 0x10d4
    101c:	e3403000 	movt	r3, #0
    1020:	e51b200c 	ldr	r2, [fp, #-12]
    1024:	e5832000 	str	r2, [r3]
      return (void*)(p + 1);
    1028:	e51b3008 	ldr	r3, [fp, #-8]
    102c:	e2833008 	add	r3, r3, #8
    1030:	ea000013 	b	1084 <malloc+0x174>
    }
    if(p == freep)
    1034:	e30130d4 	movw	r3, #4308	@ 0x10d4
    1038:	e3403000 	movt	r3, #0
    103c:	e5933000 	ldr	r3, [r3]
    1040:	e51b2008 	ldr	r2, [fp, #-8]
    1044:	e1520003 	cmp	r2, r3
    1048:	1a000007 	bne	106c <malloc+0x15c>
      if((p = morecore(nunits)) == 0)
    104c:	e51b0010 	ldr	r0, [fp, #-16]
    1050:	ebffff8c 	bl	e88 <morecore>
    1054:	e50b0008 	str	r0, [fp, #-8]
    1058:	e51b3008 	ldr	r3, [fp, #-8]
    105c:	e3530000 	cmp	r3, #0
    1060:	1a000001 	bne	106c <malloc+0x15c>
        return 0;
    1064:	e3a03000 	mov	r3, #0
    1068:	ea000005 	b	1084 <malloc+0x174>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    106c:	e51b3008 	ldr	r3, [fp, #-8]
    1070:	e50b300c 	str	r3, [fp, #-12]
    1074:	e51b3008 	ldr	r3, [fp, #-8]
    1078:	e5933000 	ldr	r3, [r3]
    107c:	e50b3008 	str	r3, [fp, #-8]
    if(p->s.size >= nunits){
    1080:	eaffffc6 	b	fa0 <malloc+0x90>
  }
}
    1084:	e1a00003 	mov	r0, r3
    1088:	e24bd004 	sub	sp, fp, #4
    108c:	e8bd8800 	pop	{fp, pc}
