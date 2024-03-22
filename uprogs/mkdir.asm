
_mkdir:     file format elf32-littlearm


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

  if(argc < 2){
      14:	e51b3010 	ldr	r3, [fp, #-16]
      18:	e3530001 	cmp	r3, #1
      1c:	ca000004 	bgt	34 <main+0x34>
    printf(2, "Usage: mkdir files...\n");
      20:	e30110fc 	movw	r1, #4348	@ 0x10fc
      24:	e3401000 	movt	r1, #0
      28:	e3a00002 	mov	r0, #2
      2c:	eb0002c2 	bl	b3c <printf>
    exit();
      30:	eb000130 	bl	4f8 <exit>
  }

  for(i = 1; i < argc; i++){
      34:	e3a03001 	mov	r3, #1
      38:	e50b3008 	str	r3, [fp, #-8]
      3c:	ea000017 	b	a0 <main+0xa0>
    if(mkdir(argv[i]) < 0){
      40:	e51b3008 	ldr	r3, [fp, #-8]
      44:	e1a03103 	lsl	r3, r3, #2
      48:	e51b2014 	ldr	r2, [fp, #-20]	@ 0xffffffec
      4c:	e0823003 	add	r3, r2, r3
      50:	e5933000 	ldr	r3, [r3]
      54:	e1a00003 	mov	r0, r3
      58:	eb0001cf 	bl	79c <mkdir>
      5c:	e1a03000 	mov	r3, r0
      60:	e3530000 	cmp	r3, #0
      64:	aa00000a 	bge	94 <main+0x94>
      printf(2, "mkdir: %s failed to create\n", argv[i]);
      68:	e51b3008 	ldr	r3, [fp, #-8]
      6c:	e1a03103 	lsl	r3, r3, #2
      70:	e51b2014 	ldr	r2, [fp, #-20]	@ 0xffffffec
      74:	e0823003 	add	r3, r2, r3
      78:	e5933000 	ldr	r3, [r3]
      7c:	e1a02003 	mov	r2, r3
      80:	e3011114 	movw	r1, #4372	@ 0x1114
      84:	e3401000 	movt	r1, #0
      88:	e3a00002 	mov	r0, #2
      8c:	eb0002aa 	bl	b3c <printf>
      break;
      90:	ea000006 	b	b0 <main+0xb0>
  for(i = 1; i < argc; i++){
      94:	e51b3008 	ldr	r3, [fp, #-8]
      98:	e2833001 	add	r3, r3, #1
      9c:	e50b3008 	str	r3, [fp, #-8]
      a0:	e51b2008 	ldr	r2, [fp, #-8]
      a4:	e51b3010 	ldr	r3, [fp, #-16]
      a8:	e1520003 	cmp	r2, r3
      ac:	baffffe3 	blt	40 <main+0x40>
    }
  }

  exit();
      b0:	eb000110 	bl	4f8 <exit>

000000b4 <strcpy>:
#include "user.h"
#include "arm.h"

char*
strcpy(char *s, char *t)
{
      b4:	e52db004 	push	{fp}		@ (str fp, [sp, #-4]!)
      b8:	e28db000 	add	fp, sp, #0
      bc:	e24dd014 	sub	sp, sp, #20
      c0:	e50b0010 	str	r0, [fp, #-16]
      c4:	e50b1014 	str	r1, [fp, #-20]	@ 0xffffffec
  char *os;

  os = s;
      c8:	e51b3010 	ldr	r3, [fp, #-16]
      cc:	e50b3008 	str	r3, [fp, #-8]
  while((*s++ = *t++) != 0)
      d0:	e320f000 	nop	{0}
      d4:	e51b2014 	ldr	r2, [fp, #-20]	@ 0xffffffec
      d8:	e2823001 	add	r3, r2, #1
      dc:	e50b3014 	str	r3, [fp, #-20]	@ 0xffffffec
      e0:	e51b3010 	ldr	r3, [fp, #-16]
      e4:	e2831001 	add	r1, r3, #1
      e8:	e50b1010 	str	r1, [fp, #-16]
      ec:	e5d22000 	ldrb	r2, [r2]
      f0:	e5c32000 	strb	r2, [r3]
      f4:	e5d33000 	ldrb	r3, [r3]
      f8:	e3530000 	cmp	r3, #0
      fc:	1afffff4 	bne	d4 <strcpy+0x20>
    ;
  return os;
     100:	e51b3008 	ldr	r3, [fp, #-8]
}
     104:	e1a00003 	mov	r0, r3
     108:	e28bd000 	add	sp, fp, #0
     10c:	e49db004 	pop	{fp}		@ (ldr fp, [sp], #4)
     110:	e12fff1e 	bx	lr

00000114 <strcmp>:

int
strcmp(const char *p, const char *q)
{
     114:	e52db004 	push	{fp}		@ (str fp, [sp, #-4]!)
     118:	e28db000 	add	fp, sp, #0
     11c:	e24dd00c 	sub	sp, sp, #12
     120:	e50b0008 	str	r0, [fp, #-8]
     124:	e50b100c 	str	r1, [fp, #-12]
  while(*p && *p == *q)
     128:	ea000005 	b	144 <strcmp+0x30>
    p++, q++;
     12c:	e51b3008 	ldr	r3, [fp, #-8]
     130:	e2833001 	add	r3, r3, #1
     134:	e50b3008 	str	r3, [fp, #-8]
     138:	e51b300c 	ldr	r3, [fp, #-12]
     13c:	e2833001 	add	r3, r3, #1
     140:	e50b300c 	str	r3, [fp, #-12]
  while(*p && *p == *q)
     144:	e51b3008 	ldr	r3, [fp, #-8]
     148:	e5d33000 	ldrb	r3, [r3]
     14c:	e3530000 	cmp	r3, #0
     150:	0a000005 	beq	16c <strcmp+0x58>
     154:	e51b3008 	ldr	r3, [fp, #-8]
     158:	e5d32000 	ldrb	r2, [r3]
     15c:	e51b300c 	ldr	r3, [fp, #-12]
     160:	e5d33000 	ldrb	r3, [r3]
     164:	e1520003 	cmp	r2, r3
     168:	0affffef 	beq	12c <strcmp+0x18>
  return (uchar)*p - (uchar)*q;
     16c:	e51b3008 	ldr	r3, [fp, #-8]
     170:	e5d33000 	ldrb	r3, [r3]
     174:	e1a02003 	mov	r2, r3
     178:	e51b300c 	ldr	r3, [fp, #-12]
     17c:	e5d33000 	ldrb	r3, [r3]
     180:	e0423003 	sub	r3, r2, r3
}
     184:	e1a00003 	mov	r0, r3
     188:	e28bd000 	add	sp, fp, #0
     18c:	e49db004 	pop	{fp}		@ (ldr fp, [sp], #4)
     190:	e12fff1e 	bx	lr

00000194 <strlen>:

uint
strlen(char *s)
{
     194:	e52db004 	push	{fp}		@ (str fp, [sp, #-4]!)
     198:	e28db000 	add	fp, sp, #0
     19c:	e24dd014 	sub	sp, sp, #20
     1a0:	e50b0010 	str	r0, [fp, #-16]
  int n;

  for(n = 0; s[n]; n++)
     1a4:	e3a03000 	mov	r3, #0
     1a8:	e50b3008 	str	r3, [fp, #-8]
     1ac:	ea000002 	b	1bc <strlen+0x28>
     1b0:	e51b3008 	ldr	r3, [fp, #-8]
     1b4:	e2833001 	add	r3, r3, #1
     1b8:	e50b3008 	str	r3, [fp, #-8]
     1bc:	e51b3008 	ldr	r3, [fp, #-8]
     1c0:	e51b2010 	ldr	r2, [fp, #-16]
     1c4:	e0823003 	add	r3, r2, r3
     1c8:	e5d33000 	ldrb	r3, [r3]
     1cc:	e3530000 	cmp	r3, #0
     1d0:	1afffff6 	bne	1b0 <strlen+0x1c>
    ;
  return n;
     1d4:	e51b3008 	ldr	r3, [fp, #-8]
}
     1d8:	e1a00003 	mov	r0, r3
     1dc:	e28bd000 	add	sp, fp, #0
     1e0:	e49db004 	pop	{fp}		@ (ldr fp, [sp], #4)
     1e4:	e12fff1e 	bx	lr

000001e8 <memset>:

void*
memset(void *dst, int c, uint n)
{
     1e8:	e52db004 	push	{fp}		@ (str fp, [sp, #-4]!)
     1ec:	e28db000 	add	fp, sp, #0
     1f0:	e24dd01c 	sub	sp, sp, #28
     1f4:	e50b0010 	str	r0, [fp, #-16]
     1f8:	e50b1014 	str	r1, [fp, #-20]	@ 0xffffffec
     1fc:	e50b2018 	str	r2, [fp, #-24]	@ 0xffffffe8
  char *p=dst;
     200:	e51b3010 	ldr	r3, [fp, #-16]
     204:	e50b3008 	str	r3, [fp, #-8]
  u32 rc=n;
     208:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
     20c:	e50b300c 	str	r3, [fp, #-12]

  while (rc-- > 0) *p++ = c;
     210:	ea000005 	b	22c <memset+0x44>
     214:	e51b3008 	ldr	r3, [fp, #-8]
     218:	e2832001 	add	r2, r3, #1
     21c:	e50b2008 	str	r2, [fp, #-8]
     220:	e51b2014 	ldr	r2, [fp, #-20]	@ 0xffffffec
     224:	e6ef2072 	uxtb	r2, r2
     228:	e5c32000 	strb	r2, [r3]
     22c:	e51b300c 	ldr	r3, [fp, #-12]
     230:	e2432001 	sub	r2, r3, #1
     234:	e50b200c 	str	r2, [fp, #-12]
     238:	e3530000 	cmp	r3, #0
     23c:	1afffff4 	bne	214 <memset+0x2c>
  return (void *)p;
     240:	e51b3008 	ldr	r3, [fp, #-8]
}
     244:	e1a00003 	mov	r0, r3
     248:	e28bd000 	add	sp, fp, #0
     24c:	e49db004 	pop	{fp}		@ (ldr fp, [sp], #4)
     250:	e12fff1e 	bx	lr

00000254 <strchr>:

char*
strchr(const char *s, char c)
{
     254:	e52db004 	push	{fp}		@ (str fp, [sp, #-4]!)
     258:	e28db000 	add	fp, sp, #0
     25c:	e24dd00c 	sub	sp, sp, #12
     260:	e50b0008 	str	r0, [fp, #-8]
     264:	e1a03001 	mov	r3, r1
     268:	e54b3009 	strb	r3, [fp, #-9]
  for(; *s; s++)
     26c:	ea000009 	b	298 <strchr+0x44>
    if(*s == c)
     270:	e51b3008 	ldr	r3, [fp, #-8]
     274:	e5d33000 	ldrb	r3, [r3]
     278:	e55b2009 	ldrb	r2, [fp, #-9]
     27c:	e1520003 	cmp	r2, r3
     280:	1a000001 	bne	28c <strchr+0x38>
      return (char*)s;
     284:	e51b3008 	ldr	r3, [fp, #-8]
     288:	ea000007 	b	2ac <strchr+0x58>
  for(; *s; s++)
     28c:	e51b3008 	ldr	r3, [fp, #-8]
     290:	e2833001 	add	r3, r3, #1
     294:	e50b3008 	str	r3, [fp, #-8]
     298:	e51b3008 	ldr	r3, [fp, #-8]
     29c:	e5d33000 	ldrb	r3, [r3]
     2a0:	e3530000 	cmp	r3, #0
     2a4:	1afffff1 	bne	270 <strchr+0x1c>
  return 0;
     2a8:	e3a03000 	mov	r3, #0
}
     2ac:	e1a00003 	mov	r0, r3
     2b0:	e28bd000 	add	sp, fp, #0
     2b4:	e49db004 	pop	{fp}		@ (ldr fp, [sp], #4)
     2b8:	e12fff1e 	bx	lr

000002bc <gets>:

char*
gets(char *buf, int max)
{
     2bc:	e92d4800 	push	{fp, lr}
     2c0:	e28db004 	add	fp, sp, #4
     2c4:	e24dd018 	sub	sp, sp, #24
     2c8:	e50b0018 	str	r0, [fp, #-24]	@ 0xffffffe8
     2cc:	e50b101c 	str	r1, [fp, #-28]	@ 0xffffffe4
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
     2d0:	e3a03000 	mov	r3, #0
     2d4:	e50b3008 	str	r3, [fp, #-8]
     2d8:	ea000016 	b	338 <gets+0x7c>
    cc = read(0, &c, 1);
     2dc:	e24b300d 	sub	r3, fp, #13
     2e0:	e3a02001 	mov	r2, #1
     2e4:	e1a01003 	mov	r1, r3
     2e8:	e3a00000 	mov	r0, #0
     2ec:	eb0000a8 	bl	594 <read>
     2f0:	e50b000c 	str	r0, [fp, #-12]
    if(cc < 1)
     2f4:	e51b300c 	ldr	r3, [fp, #-12]
     2f8:	e3530000 	cmp	r3, #0
     2fc:	da000013 	ble	350 <gets+0x94>
      break;
    buf[i++] = c;
     300:	e51b3008 	ldr	r3, [fp, #-8]
     304:	e2832001 	add	r2, r3, #1
     308:	e50b2008 	str	r2, [fp, #-8]
     30c:	e1a02003 	mov	r2, r3
     310:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
     314:	e0833002 	add	r3, r3, r2
     318:	e55b200d 	ldrb	r2, [fp, #-13]
     31c:	e5c32000 	strb	r2, [r3]
    if(c == '\n' || c == '\r')
     320:	e55b300d 	ldrb	r3, [fp, #-13]
     324:	e353000a 	cmp	r3, #10
     328:	0a000009 	beq	354 <gets+0x98>
     32c:	e55b300d 	ldrb	r3, [fp, #-13]
     330:	e353000d 	cmp	r3, #13
     334:	0a000006 	beq	354 <gets+0x98>
  for(i=0; i+1 < max; ){
     338:	e51b3008 	ldr	r3, [fp, #-8]
     33c:	e2833001 	add	r3, r3, #1
     340:	e51b201c 	ldr	r2, [fp, #-28]	@ 0xffffffe4
     344:	e1520003 	cmp	r2, r3
     348:	caffffe3 	bgt	2dc <gets+0x20>
     34c:	ea000000 	b	354 <gets+0x98>
      break;
     350:	e320f000 	nop	{0}
      break;
  }
  buf[i] = '\0';
     354:	e51b3008 	ldr	r3, [fp, #-8]
     358:	e51b2018 	ldr	r2, [fp, #-24]	@ 0xffffffe8
     35c:	e0823003 	add	r3, r2, r3
     360:	e3a02000 	mov	r2, #0
     364:	e5c32000 	strb	r2, [r3]
  return buf;
     368:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
}
     36c:	e1a00003 	mov	r0, r3
     370:	e24bd004 	sub	sp, fp, #4
     374:	e8bd8800 	pop	{fp, pc}

00000378 <stat>:

int
stat(char *n, struct stat *st)
{
     378:	e92d4800 	push	{fp, lr}
     37c:	e28db004 	add	fp, sp, #4
     380:	e24dd010 	sub	sp, sp, #16
     384:	e50b0010 	str	r0, [fp, #-16]
     388:	e50b1014 	str	r1, [fp, #-20]	@ 0xffffffec
  int fd;
  int r;

  fd = open(n, O_RDONLY);
     38c:	e3a01000 	mov	r1, #0
     390:	e51b0010 	ldr	r0, [fp, #-16]
     394:	eb0000bf 	bl	698 <open>
     398:	e50b0008 	str	r0, [fp, #-8]
  if(fd < 0)
     39c:	e51b3008 	ldr	r3, [fp, #-8]
     3a0:	e3530000 	cmp	r3, #0
     3a4:	aa000001 	bge	3b0 <stat+0x38>
    return -1;
     3a8:	e3e03000 	mvn	r3, #0
     3ac:	ea000006 	b	3cc <stat+0x54>
  r = fstat(fd, st);
     3b0:	e51b1014 	ldr	r1, [fp, #-20]	@ 0xffffffec
     3b4:	e51b0008 	ldr	r0, [fp, #-8]
     3b8:	eb0000dd 	bl	734 <fstat>
     3bc:	e50b000c 	str	r0, [fp, #-12]
  close(fd);
     3c0:	e51b0008 	ldr	r0, [fp, #-8]
     3c4:	eb00008c 	bl	5fc <close>
  return r;
     3c8:	e51b300c 	ldr	r3, [fp, #-12]
}
     3cc:	e1a00003 	mov	r0, r3
     3d0:	e24bd004 	sub	sp, fp, #4
     3d4:	e8bd8800 	pop	{fp, pc}

000003d8 <atoi>:

int
atoi(const char *s)
{
     3d8:	e52db004 	push	{fp}		@ (str fp, [sp, #-4]!)
     3dc:	e28db000 	add	fp, sp, #0
     3e0:	e24dd014 	sub	sp, sp, #20
     3e4:	e50b0010 	str	r0, [fp, #-16]
  int n;

  n = 0;
     3e8:	e3a03000 	mov	r3, #0
     3ec:	e50b3008 	str	r3, [fp, #-8]
  while('0' <= *s && *s <= '9')
     3f0:	ea000009 	b	41c <atoi+0x44>
    n = n*10 + *s++ - '0';
     3f4:	e51b3008 	ldr	r3, [fp, #-8]
     3f8:	e3a0200a 	mov	r2, #10
     3fc:	e0020392 	mul	r2, r2, r3
     400:	e51b3010 	ldr	r3, [fp, #-16]
     404:	e2831001 	add	r1, r3, #1
     408:	e50b1010 	str	r1, [fp, #-16]
     40c:	e5d33000 	ldrb	r3, [r3]
     410:	e0823003 	add	r3, r2, r3
     414:	e2433030 	sub	r3, r3, #48	@ 0x30
     418:	e50b3008 	str	r3, [fp, #-8]
  while('0' <= *s && *s <= '9')
     41c:	e51b3010 	ldr	r3, [fp, #-16]
     420:	e5d33000 	ldrb	r3, [r3]
     424:	e353002f 	cmp	r3, #47	@ 0x2f
     428:	9a000003 	bls	43c <atoi+0x64>
     42c:	e51b3010 	ldr	r3, [fp, #-16]
     430:	e5d33000 	ldrb	r3, [r3]
     434:	e3530039 	cmp	r3, #57	@ 0x39
     438:	9affffed 	bls	3f4 <atoi+0x1c>
  return n;
     43c:	e51b3008 	ldr	r3, [fp, #-8]
}
     440:	e1a00003 	mov	r0, r3
     444:	e28bd000 	add	sp, fp, #0
     448:	e49db004 	pop	{fp}		@ (ldr fp, [sp], #4)
     44c:	e12fff1e 	bx	lr

00000450 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
     450:	e52db004 	push	{fp}		@ (str fp, [sp, #-4]!)
     454:	e28db000 	add	fp, sp, #0
     458:	e24dd01c 	sub	sp, sp, #28
     45c:	e50b0010 	str	r0, [fp, #-16]
     460:	e50b1014 	str	r1, [fp, #-20]	@ 0xffffffec
     464:	e50b2018 	str	r2, [fp, #-24]	@ 0xffffffe8
  char *dst, *src;
  
  dst = vdst;
     468:	e51b3010 	ldr	r3, [fp, #-16]
     46c:	e50b3008 	str	r3, [fp, #-8]
  src = vsrc;
     470:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
     474:	e50b300c 	str	r3, [fp, #-12]
  while(n-- > 0)
     478:	ea000007 	b	49c <memmove+0x4c>
    *dst++ = *src++;
     47c:	e51b200c 	ldr	r2, [fp, #-12]
     480:	e2823001 	add	r3, r2, #1
     484:	e50b300c 	str	r3, [fp, #-12]
     488:	e51b3008 	ldr	r3, [fp, #-8]
     48c:	e2831001 	add	r1, r3, #1
     490:	e50b1008 	str	r1, [fp, #-8]
     494:	e5d22000 	ldrb	r2, [r2]
     498:	e5c32000 	strb	r2, [r3]
  while(n-- > 0)
     49c:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
     4a0:	e2432001 	sub	r2, r3, #1
     4a4:	e50b2018 	str	r2, [fp, #-24]	@ 0xffffffe8
     4a8:	e3530000 	cmp	r3, #0
     4ac:	cafffff2 	bgt	47c <memmove+0x2c>
  return vdst;
     4b0:	e51b3010 	ldr	r3, [fp, #-16]
}
     4b4:	e1a00003 	mov	r0, r3
     4b8:	e28bd000 	add	sp, fp, #0
     4bc:	e49db004 	pop	{fp}		@ (ldr fp, [sp], #4)
     4c0:	e12fff1e 	bx	lr

000004c4 <fork>:
     4c4:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
     4c8:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
     4cc:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
     4d0:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
     4d4:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
     4d8:	e3a00001 	mov	r0, #1
     4dc:	ef000040 	svc	0x00000040
     4e0:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     4e4:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     4e8:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
     4ec:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
     4f0:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
     4f4:	e12fff1e 	bx	lr

000004f8 <exit>:
     4f8:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
     4fc:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
     500:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
     504:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
     508:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
     50c:	e3a00002 	mov	r0, #2
     510:	ef000040 	svc	0x00000040
     514:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     518:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     51c:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
     520:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
     524:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
     528:	e12fff1e 	bx	lr

0000052c <wait>:
     52c:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
     530:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
     534:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
     538:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
     53c:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
     540:	e3a00003 	mov	r0, #3
     544:	ef000040 	svc	0x00000040
     548:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     54c:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     550:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
     554:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
     558:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
     55c:	e12fff1e 	bx	lr

00000560 <pipe>:
     560:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
     564:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
     568:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
     56c:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
     570:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
     574:	e3a00004 	mov	r0, #4
     578:	ef000040 	svc	0x00000040
     57c:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     580:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     584:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
     588:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
     58c:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
     590:	e12fff1e 	bx	lr

00000594 <read>:
     594:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
     598:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
     59c:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
     5a0:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
     5a4:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
     5a8:	e3a00005 	mov	r0, #5
     5ac:	ef000040 	svc	0x00000040
     5b0:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     5b4:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     5b8:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
     5bc:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
     5c0:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
     5c4:	e12fff1e 	bx	lr

000005c8 <write>:
     5c8:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
     5cc:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
     5d0:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
     5d4:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
     5d8:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
     5dc:	e3a00010 	mov	r0, #16
     5e0:	ef000040 	svc	0x00000040
     5e4:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     5e8:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     5ec:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
     5f0:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
     5f4:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
     5f8:	e12fff1e 	bx	lr

000005fc <close>:
     5fc:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
     600:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
     604:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
     608:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
     60c:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
     610:	e3a00015 	mov	r0, #21
     614:	ef000040 	svc	0x00000040
     618:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     61c:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     620:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
     624:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
     628:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
     62c:	e12fff1e 	bx	lr

00000630 <kill>:
     630:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
     634:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
     638:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
     63c:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
     640:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
     644:	e3a00006 	mov	r0, #6
     648:	ef000040 	svc	0x00000040
     64c:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     650:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     654:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
     658:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
     65c:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
     660:	e12fff1e 	bx	lr

00000664 <exec>:
     664:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
     668:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
     66c:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
     670:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
     674:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
     678:	e3a00007 	mov	r0, #7
     67c:	ef000040 	svc	0x00000040
     680:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     684:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     688:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
     68c:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
     690:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
     694:	e12fff1e 	bx	lr

00000698 <open>:
     698:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
     69c:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
     6a0:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
     6a4:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
     6a8:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
     6ac:	e3a0000f 	mov	r0, #15
     6b0:	ef000040 	svc	0x00000040
     6b4:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     6b8:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     6bc:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
     6c0:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
     6c4:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
     6c8:	e12fff1e 	bx	lr

000006cc <mknod>:
     6cc:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
     6d0:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
     6d4:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
     6d8:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
     6dc:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
     6e0:	e3a00011 	mov	r0, #17
     6e4:	ef000040 	svc	0x00000040
     6e8:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     6ec:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     6f0:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
     6f4:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
     6f8:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
     6fc:	e12fff1e 	bx	lr

00000700 <unlink>:
     700:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
     704:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
     708:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
     70c:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
     710:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
     714:	e3a00012 	mov	r0, #18
     718:	ef000040 	svc	0x00000040
     71c:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     720:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     724:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
     728:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
     72c:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
     730:	e12fff1e 	bx	lr

00000734 <fstat>:
     734:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
     738:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
     73c:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
     740:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
     744:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
     748:	e3a00008 	mov	r0, #8
     74c:	ef000040 	svc	0x00000040
     750:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     754:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     758:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
     75c:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
     760:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
     764:	e12fff1e 	bx	lr

00000768 <link>:
     768:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
     76c:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
     770:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
     774:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
     778:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
     77c:	e3a00013 	mov	r0, #19
     780:	ef000040 	svc	0x00000040
     784:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     788:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     78c:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
     790:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
     794:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
     798:	e12fff1e 	bx	lr

0000079c <mkdir>:
     79c:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
     7a0:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
     7a4:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
     7a8:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
     7ac:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
     7b0:	e3a00014 	mov	r0, #20
     7b4:	ef000040 	svc	0x00000040
     7b8:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     7bc:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     7c0:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
     7c4:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
     7c8:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
     7cc:	e12fff1e 	bx	lr

000007d0 <chdir>:
     7d0:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
     7d4:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
     7d8:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
     7dc:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
     7e0:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
     7e4:	e3a00009 	mov	r0, #9
     7e8:	ef000040 	svc	0x00000040
     7ec:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     7f0:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     7f4:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
     7f8:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
     7fc:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
     800:	e12fff1e 	bx	lr

00000804 <dup>:
     804:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
     808:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
     80c:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
     810:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
     814:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
     818:	e3a0000a 	mov	r0, #10
     81c:	ef000040 	svc	0x00000040
     820:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     824:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     828:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
     82c:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
     830:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
     834:	e12fff1e 	bx	lr

00000838 <getpid>:
     838:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
     83c:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
     840:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
     844:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
     848:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
     84c:	e3a0000b 	mov	r0, #11
     850:	ef000040 	svc	0x00000040
     854:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     858:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     85c:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
     860:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
     864:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
     868:	e12fff1e 	bx	lr

0000086c <sbrk>:
     86c:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
     870:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
     874:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
     878:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
     87c:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
     880:	e3a0000c 	mov	r0, #12
     884:	ef000040 	svc	0x00000040
     888:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     88c:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     890:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
     894:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
     898:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
     89c:	e12fff1e 	bx	lr

000008a0 <sleep>:
     8a0:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
     8a4:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
     8a8:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
     8ac:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
     8b0:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
     8b4:	e3a0000d 	mov	r0, #13
     8b8:	ef000040 	svc	0x00000040
     8bc:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     8c0:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     8c4:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
     8c8:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
     8cc:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
     8d0:	e12fff1e 	bx	lr

000008d4 <uptime>:
     8d4:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
     8d8:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
     8dc:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
     8e0:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
     8e4:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
     8e8:	e3a0000e 	mov	r0, #14
     8ec:	ef000040 	svc	0x00000040
     8f0:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     8f4:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     8f8:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
     8fc:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
     900:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
     904:	e12fff1e 	bx	lr

00000908 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
     908:	e92d4800 	push	{fp, lr}
     90c:	e28db004 	add	fp, sp, #4
     910:	e24dd008 	sub	sp, sp, #8
     914:	e50b0008 	str	r0, [fp, #-8]
     918:	e1a03001 	mov	r3, r1
     91c:	e54b3009 	strb	r3, [fp, #-9]
  write(fd, &c, 1);
     920:	e24b3009 	sub	r3, fp, #9
     924:	e3a02001 	mov	r2, #1
     928:	e1a01003 	mov	r1, r3
     92c:	e51b0008 	ldr	r0, [fp, #-8]
     930:	ebffff24 	bl	5c8 <write>
}
     934:	e320f000 	nop	{0}
     938:	e24bd004 	sub	sp, fp, #4
     93c:	e8bd8800 	pop	{fp, pc}

00000940 <div>:

u32 div(u32 n, u32 d)  // long division
{
     940:	e52db004 	push	{fp}		@ (str fp, [sp, #-4]!)
     944:	e28db000 	add	fp, sp, #0
     948:	e24dd01c 	sub	sp, sp, #28
     94c:	e50b0018 	str	r0, [fp, #-24]	@ 0xffffffe8
     950:	e50b101c 	str	r1, [fp, #-28]	@ 0xffffffe4
    u32 q=0, r=0;
     954:	e3a03000 	mov	r3, #0
     958:	e50b3008 	str	r3, [fp, #-8]
     95c:	e3a03000 	mov	r3, #0
     960:	e50b300c 	str	r3, [fp, #-12]
    int i;

    for(i=31;i>=0;i--){
     964:	e3a0301f 	mov	r3, #31
     968:	e50b3010 	str	r3, [fp, #-16]
     96c:	ea00001b 	b	9e0 <div+0xa0>
        r = r << 1;
     970:	e51b300c 	ldr	r3, [fp, #-12]
     974:	e1a03083 	lsl	r3, r3, #1
     978:	e50b300c 	str	r3, [fp, #-12]
        r = r | ((n >> i) & 1);
     97c:	e51b2018 	ldr	r2, [fp, #-24]	@ 0xffffffe8
     980:	e51b3010 	ldr	r3, [fp, #-16]
     984:	e1a03332 	lsr	r3, r2, r3
     988:	e2033001 	and	r3, r3, #1
     98c:	e51b200c 	ldr	r2, [fp, #-12]
     990:	e1823003 	orr	r3, r2, r3
     994:	e50b300c 	str	r3, [fp, #-12]
        if(r >= d) {
     998:	e51b200c 	ldr	r2, [fp, #-12]
     99c:	e51b301c 	ldr	r3, [fp, #-28]	@ 0xffffffe4
     9a0:	e1520003 	cmp	r2, r3
     9a4:	3a00000a 	bcc	9d4 <div+0x94>
            r = r - d;
     9a8:	e51b200c 	ldr	r2, [fp, #-12]
     9ac:	e51b301c 	ldr	r3, [fp, #-28]	@ 0xffffffe4
     9b0:	e0423003 	sub	r3, r2, r3
     9b4:	e50b300c 	str	r3, [fp, #-12]
            q = q | (1 << i);
     9b8:	e3a02001 	mov	r2, #1
     9bc:	e51b3010 	ldr	r3, [fp, #-16]
     9c0:	e1a03312 	lsl	r3, r2, r3
     9c4:	e1a02003 	mov	r2, r3
     9c8:	e51b3008 	ldr	r3, [fp, #-8]
     9cc:	e1833002 	orr	r3, r3, r2
     9d0:	e50b3008 	str	r3, [fp, #-8]
    for(i=31;i>=0;i--){
     9d4:	e51b3010 	ldr	r3, [fp, #-16]
     9d8:	e2433001 	sub	r3, r3, #1
     9dc:	e50b3010 	str	r3, [fp, #-16]
     9e0:	e51b3010 	ldr	r3, [fp, #-16]
     9e4:	e3530000 	cmp	r3, #0
     9e8:	aaffffe0 	bge	970 <div+0x30>
        }
    }
    return q;
     9ec:	e51b3008 	ldr	r3, [fp, #-8]
}
     9f0:	e1a00003 	mov	r0, r3
     9f4:	e28bd000 	add	sp, fp, #0
     9f8:	e49db004 	pop	{fp}		@ (ldr fp, [sp], #4)
     9fc:	e12fff1e 	bx	lr

00000a00 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
     a00:	e92d4800 	push	{fp, lr}
     a04:	e28db004 	add	fp, sp, #4
     a08:	e24dd038 	sub	sp, sp, #56	@ 0x38
     a0c:	e50b0030 	str	r0, [fp, #-48]	@ 0xffffffd0
     a10:	e50b1034 	str	r1, [fp, #-52]	@ 0xffffffcc
     a14:	e50b2038 	str	r2, [fp, #-56]	@ 0xffffffc8
     a18:	e50b303c 	str	r3, [fp, #-60]	@ 0xffffffc4
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x, y, b;

  neg = 0;
     a1c:	e3a03000 	mov	r3, #0
     a20:	e50b300c 	str	r3, [fp, #-12]
  if(sgn && xx < 0){
     a24:	e51b303c 	ldr	r3, [fp, #-60]	@ 0xffffffc4
     a28:	e3530000 	cmp	r3, #0
     a2c:	0a000008 	beq	a54 <printint+0x54>
     a30:	e51b3034 	ldr	r3, [fp, #-52]	@ 0xffffffcc
     a34:	e3530000 	cmp	r3, #0
     a38:	aa000005 	bge	a54 <printint+0x54>
    neg = 1;
     a3c:	e3a03001 	mov	r3, #1
     a40:	e50b300c 	str	r3, [fp, #-12]
    x = -xx;
     a44:	e51b3034 	ldr	r3, [fp, #-52]	@ 0xffffffcc
     a48:	e2633000 	rsb	r3, r3, #0
     a4c:	e50b3010 	str	r3, [fp, #-16]
     a50:	ea000001 	b	a5c <printint+0x5c>
  } else {
    x = xx;
     a54:	e51b3034 	ldr	r3, [fp, #-52]	@ 0xffffffcc
     a58:	e50b3010 	str	r3, [fp, #-16]
  }

  b = base;
     a5c:	e51b3038 	ldr	r3, [fp, #-56]	@ 0xffffffc8
     a60:	e50b3014 	str	r3, [fp, #-20]	@ 0xffffffec
  i = 0;
     a64:	e3a03000 	mov	r3, #0
     a68:	e50b3008 	str	r3, [fp, #-8]
  do{
    y = div(x, b);
     a6c:	e51b1014 	ldr	r1, [fp, #-20]	@ 0xffffffec
     a70:	e51b0010 	ldr	r0, [fp, #-16]
     a74:	ebffffb1 	bl	940 <div>
     a78:	e50b0018 	str	r0, [fp, #-24]	@ 0xffffffe8
    buf[i++] = digits[x - y * b];
     a7c:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
     a80:	e51b2014 	ldr	r2, [fp, #-20]	@ 0xffffffec
     a84:	e0030392 	mul	r3, r2, r3
     a88:	e51b2010 	ldr	r2, [fp, #-16]
     a8c:	e0421003 	sub	r1, r2, r3
     a90:	e51b2008 	ldr	r2, [fp, #-8]
     a94:	e2823001 	add	r3, r2, #1
     a98:	e50b3008 	str	r3, [fp, #-8]
     a9c:	e3013138 	movw	r3, #4408	@ 0x1138
     aa0:	e3403000 	movt	r3, #0
     aa4:	e7d31001 	ldrb	r1, [r3, r1]
     aa8:	e2423004 	sub	r3, r2, #4
     aac:	e083300b 	add	r3, r3, fp
     ab0:	e1a02001 	mov	r2, r1
     ab4:	e5432024 	strb	r2, [r3, #-36]	@ 0xffffffdc
  }while((x = y) != 0);
     ab8:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
     abc:	e50b3010 	str	r3, [fp, #-16]
     ac0:	e51b3010 	ldr	r3, [fp, #-16]
     ac4:	e3530000 	cmp	r3, #0
     ac8:	1affffe7 	bne	a6c <printint+0x6c>
  if(neg)
     acc:	e51b300c 	ldr	r3, [fp, #-12]
     ad0:	e3530000 	cmp	r3, #0
     ad4:	0a00000e 	beq	b14 <printint+0x114>
    buf[i++] = '-';
     ad8:	e51b3008 	ldr	r3, [fp, #-8]
     adc:	e2832001 	add	r2, r3, #1
     ae0:	e50b2008 	str	r2, [fp, #-8]
     ae4:	e2433004 	sub	r3, r3, #4
     ae8:	e083300b 	add	r3, r3, fp
     aec:	e3a0202d 	mov	r2, #45	@ 0x2d
     af0:	e5432024 	strb	r2, [r3, #-36]	@ 0xffffffdc

  while(--i >= 0)
     af4:	ea000006 	b	b14 <printint+0x114>
    putc(fd, buf[i]);
     af8:	e24b2028 	sub	r2, fp, #40	@ 0x28
     afc:	e51b3008 	ldr	r3, [fp, #-8]
     b00:	e0823003 	add	r3, r2, r3
     b04:	e5d33000 	ldrb	r3, [r3]
     b08:	e1a01003 	mov	r1, r3
     b0c:	e51b0030 	ldr	r0, [fp, #-48]	@ 0xffffffd0
     b10:	ebffff7c 	bl	908 <putc>
  while(--i >= 0)
     b14:	e51b3008 	ldr	r3, [fp, #-8]
     b18:	e2433001 	sub	r3, r3, #1
     b1c:	e50b3008 	str	r3, [fp, #-8]
     b20:	e51b3008 	ldr	r3, [fp, #-8]
     b24:	e3530000 	cmp	r3, #0
     b28:	aafffff2 	bge	af8 <printint+0xf8>
}
     b2c:	e320f000 	nop	{0}
     b30:	e320f000 	nop	{0}
     b34:	e24bd004 	sub	sp, fp, #4
     b38:	e8bd8800 	pop	{fp, pc}

00000b3c <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
     b3c:	e92d000e 	push	{r1, r2, r3}
     b40:	e92d4800 	push	{fp, lr}
     b44:	e28db004 	add	fp, sp, #4
     b48:	e24dd024 	sub	sp, sp, #36	@ 0x24
     b4c:	e50b0024 	str	r0, [fp, #-36]	@ 0xffffffdc
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
     b50:	e3a03000 	mov	r3, #0
     b54:	e50b3014 	str	r3, [fp, #-20]	@ 0xffffffec
  ap = (uint*)(void*)&fmt + 1;
     b58:	e28b3008 	add	r3, fp, #8
     b5c:	e50b3018 	str	r3, [fp, #-24]	@ 0xffffffe8
  for(i = 0; fmt[i]; i++){
     b60:	e3a03000 	mov	r3, #0
     b64:	e50b3010 	str	r3, [fp, #-16]
     b68:	ea000075 	b	d44 <printf+0x208>
    c = fmt[i] & 0xff;
     b6c:	e59b2004 	ldr	r2, [fp, #4]
     b70:	e51b3010 	ldr	r3, [fp, #-16]
     b74:	e0823003 	add	r3, r2, r3
     b78:	e5d33000 	ldrb	r3, [r3]
     b7c:	e50b301c 	str	r3, [fp, #-28]	@ 0xffffffe4
    if(state == 0){
     b80:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
     b84:	e3530000 	cmp	r3, #0
     b88:	1a00000b 	bne	bbc <printf+0x80>
      if(c == '%'){
     b8c:	e51b301c 	ldr	r3, [fp, #-28]	@ 0xffffffe4
     b90:	e3530025 	cmp	r3, #37	@ 0x25
     b94:	1a000002 	bne	ba4 <printf+0x68>
        state = '%';
     b98:	e3a03025 	mov	r3, #37	@ 0x25
     b9c:	e50b3014 	str	r3, [fp, #-20]	@ 0xffffffec
     ba0:	ea000064 	b	d38 <printf+0x1fc>
      } else {
        putc(fd, c);
     ba4:	e51b301c 	ldr	r3, [fp, #-28]	@ 0xffffffe4
     ba8:	e6ef3073 	uxtb	r3, r3
     bac:	e1a01003 	mov	r1, r3
     bb0:	e51b0024 	ldr	r0, [fp, #-36]	@ 0xffffffdc
     bb4:	ebffff53 	bl	908 <putc>
     bb8:	ea00005e 	b	d38 <printf+0x1fc>
      }
    } else if(state == '%'){
     bbc:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
     bc0:	e3530025 	cmp	r3, #37	@ 0x25
     bc4:	1a00005b 	bne	d38 <printf+0x1fc>
      if(c == 'd'){
     bc8:	e51b301c 	ldr	r3, [fp, #-28]	@ 0xffffffe4
     bcc:	e3530064 	cmp	r3, #100	@ 0x64
     bd0:	1a00000a 	bne	c00 <printf+0xc4>
        printint(fd, *ap, 10, 1);
     bd4:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
     bd8:	e5933000 	ldr	r3, [r3]
     bdc:	e1a01003 	mov	r1, r3
     be0:	e3a03001 	mov	r3, #1
     be4:	e3a0200a 	mov	r2, #10
     be8:	e51b0024 	ldr	r0, [fp, #-36]	@ 0xffffffdc
     bec:	ebffff83 	bl	a00 <printint>
        ap++;
     bf0:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
     bf4:	e2833004 	add	r3, r3, #4
     bf8:	e50b3018 	str	r3, [fp, #-24]	@ 0xffffffe8
     bfc:	ea00004b 	b	d30 <printf+0x1f4>
      } else if(c == 'x' || c == 'p'){
     c00:	e51b301c 	ldr	r3, [fp, #-28]	@ 0xffffffe4
     c04:	e3530078 	cmp	r3, #120	@ 0x78
     c08:	0a000002 	beq	c18 <printf+0xdc>
     c0c:	e51b301c 	ldr	r3, [fp, #-28]	@ 0xffffffe4
     c10:	e3530070 	cmp	r3, #112	@ 0x70
     c14:	1a00000a 	bne	c44 <printf+0x108>
        printint(fd, *ap, 16, 0);
     c18:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
     c1c:	e5933000 	ldr	r3, [r3]
     c20:	e1a01003 	mov	r1, r3
     c24:	e3a03000 	mov	r3, #0
     c28:	e3a02010 	mov	r2, #16
     c2c:	e51b0024 	ldr	r0, [fp, #-36]	@ 0xffffffdc
     c30:	ebffff72 	bl	a00 <printint>
        ap++;
     c34:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
     c38:	e2833004 	add	r3, r3, #4
     c3c:	e50b3018 	str	r3, [fp, #-24]	@ 0xffffffe8
     c40:	ea00003a 	b	d30 <printf+0x1f4>
      } else if(c == 's'){
     c44:	e51b301c 	ldr	r3, [fp, #-28]	@ 0xffffffe4
     c48:	e3530073 	cmp	r3, #115	@ 0x73
     c4c:	1a000019 	bne	cb8 <printf+0x17c>
        s = (char*)*ap;
     c50:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
     c54:	e5933000 	ldr	r3, [r3]
     c58:	e50b300c 	str	r3, [fp, #-12]
        ap++;
     c5c:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
     c60:	e2833004 	add	r3, r3, #4
     c64:	e50b3018 	str	r3, [fp, #-24]	@ 0xffffffe8
        if(s == 0)
     c68:	e51b300c 	ldr	r3, [fp, #-12]
     c6c:	e3530000 	cmp	r3, #0
     c70:	1a00000b 	bne	ca4 <printf+0x168>
          s = "(null)";
     c74:	e3013130 	movw	r3, #4400	@ 0x1130
     c78:	e3403000 	movt	r3, #0
     c7c:	e50b300c 	str	r3, [fp, #-12]
        while(*s != 0){
     c80:	ea000007 	b	ca4 <printf+0x168>
          putc(fd, *s);
     c84:	e51b300c 	ldr	r3, [fp, #-12]
     c88:	e5d33000 	ldrb	r3, [r3]
     c8c:	e1a01003 	mov	r1, r3
     c90:	e51b0024 	ldr	r0, [fp, #-36]	@ 0xffffffdc
     c94:	ebffff1b 	bl	908 <putc>
          s++;
     c98:	e51b300c 	ldr	r3, [fp, #-12]
     c9c:	e2833001 	add	r3, r3, #1
     ca0:	e50b300c 	str	r3, [fp, #-12]
        while(*s != 0){
     ca4:	e51b300c 	ldr	r3, [fp, #-12]
     ca8:	e5d33000 	ldrb	r3, [r3]
     cac:	e3530000 	cmp	r3, #0
     cb0:	1afffff3 	bne	c84 <printf+0x148>
     cb4:	ea00001d 	b	d30 <printf+0x1f4>
        }
      } else if(c == 'c'){
     cb8:	e51b301c 	ldr	r3, [fp, #-28]	@ 0xffffffe4
     cbc:	e3530063 	cmp	r3, #99	@ 0x63
     cc0:	1a000009 	bne	cec <printf+0x1b0>
        putc(fd, *ap);
     cc4:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
     cc8:	e5933000 	ldr	r3, [r3]
     ccc:	e6ef3073 	uxtb	r3, r3
     cd0:	e1a01003 	mov	r1, r3
     cd4:	e51b0024 	ldr	r0, [fp, #-36]	@ 0xffffffdc
     cd8:	ebffff0a 	bl	908 <putc>
        ap++;
     cdc:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
     ce0:	e2833004 	add	r3, r3, #4
     ce4:	e50b3018 	str	r3, [fp, #-24]	@ 0xffffffe8
     ce8:	ea000010 	b	d30 <printf+0x1f4>
      } else if(c == '%'){
     cec:	e51b301c 	ldr	r3, [fp, #-28]	@ 0xffffffe4
     cf0:	e3530025 	cmp	r3, #37	@ 0x25
     cf4:	1a000005 	bne	d10 <printf+0x1d4>
        putc(fd, c);
     cf8:	e51b301c 	ldr	r3, [fp, #-28]	@ 0xffffffe4
     cfc:	e6ef3073 	uxtb	r3, r3
     d00:	e1a01003 	mov	r1, r3
     d04:	e51b0024 	ldr	r0, [fp, #-36]	@ 0xffffffdc
     d08:	ebfffefe 	bl	908 <putc>
     d0c:	ea000007 	b	d30 <printf+0x1f4>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
     d10:	e3a01025 	mov	r1, #37	@ 0x25
     d14:	e51b0024 	ldr	r0, [fp, #-36]	@ 0xffffffdc
     d18:	ebfffefa 	bl	908 <putc>
        putc(fd, c);
     d1c:	e51b301c 	ldr	r3, [fp, #-28]	@ 0xffffffe4
     d20:	e6ef3073 	uxtb	r3, r3
     d24:	e1a01003 	mov	r1, r3
     d28:	e51b0024 	ldr	r0, [fp, #-36]	@ 0xffffffdc
     d2c:	ebfffef5 	bl	908 <putc>
      }
      state = 0;
     d30:	e3a03000 	mov	r3, #0
     d34:	e50b3014 	str	r3, [fp, #-20]	@ 0xffffffec
  for(i = 0; fmt[i]; i++){
     d38:	e51b3010 	ldr	r3, [fp, #-16]
     d3c:	e2833001 	add	r3, r3, #1
     d40:	e50b3010 	str	r3, [fp, #-16]
     d44:	e59b2004 	ldr	r2, [fp, #4]
     d48:	e51b3010 	ldr	r3, [fp, #-16]
     d4c:	e0823003 	add	r3, r2, r3
     d50:	e5d33000 	ldrb	r3, [r3]
     d54:	e3530000 	cmp	r3, #0
     d58:	1affff83 	bne	b6c <printf+0x30>
    }
  }
}
     d5c:	e320f000 	nop	{0}
     d60:	e320f000 	nop	{0}
     d64:	e24bd004 	sub	sp, fp, #4
     d68:	e8bd4800 	pop	{fp, lr}
     d6c:	e28dd00c 	add	sp, sp, #12
     d70:	e12fff1e 	bx	lr

00000d74 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
     d74:	e52db004 	push	{fp}		@ (str fp, [sp, #-4]!)
     d78:	e28db000 	add	fp, sp, #0
     d7c:	e24dd014 	sub	sp, sp, #20
     d80:	e50b0010 	str	r0, [fp, #-16]
  Header *bp, *p;

  bp = (Header*)ap - 1;
     d84:	e51b3010 	ldr	r3, [fp, #-16]
     d88:	e2433008 	sub	r3, r3, #8
     d8c:	e50b300c 	str	r3, [fp, #-12]
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
     d90:	e3013154 	movw	r3, #4436	@ 0x1154
     d94:	e3403000 	movt	r3, #0
     d98:	e5933000 	ldr	r3, [r3]
     d9c:	e50b3008 	str	r3, [fp, #-8]
     da0:	ea000010 	b	de8 <free+0x74>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
     da4:	e51b3008 	ldr	r3, [fp, #-8]
     da8:	e5933000 	ldr	r3, [r3]
     dac:	e51b2008 	ldr	r2, [fp, #-8]
     db0:	e1520003 	cmp	r2, r3
     db4:	3a000008 	bcc	ddc <free+0x68>
     db8:	e51b200c 	ldr	r2, [fp, #-12]
     dbc:	e51b3008 	ldr	r3, [fp, #-8]
     dc0:	e1520003 	cmp	r2, r3
     dc4:	8a000010 	bhi	e0c <free+0x98>
     dc8:	e51b3008 	ldr	r3, [fp, #-8]
     dcc:	e5933000 	ldr	r3, [r3]
     dd0:	e51b200c 	ldr	r2, [fp, #-12]
     dd4:	e1520003 	cmp	r2, r3
     dd8:	3a00000b 	bcc	e0c <free+0x98>
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
     ddc:	e51b3008 	ldr	r3, [fp, #-8]
     de0:	e5933000 	ldr	r3, [r3]
     de4:	e50b3008 	str	r3, [fp, #-8]
     de8:	e51b200c 	ldr	r2, [fp, #-12]
     dec:	e51b3008 	ldr	r3, [fp, #-8]
     df0:	e1520003 	cmp	r2, r3
     df4:	9affffea 	bls	da4 <free+0x30>
     df8:	e51b3008 	ldr	r3, [fp, #-8]
     dfc:	e5933000 	ldr	r3, [r3]
     e00:	e51b200c 	ldr	r2, [fp, #-12]
     e04:	e1520003 	cmp	r2, r3
     e08:	2affffe5 	bcs	da4 <free+0x30>
      break;
  if(bp + bp->s.size == p->s.ptr){
     e0c:	e51b300c 	ldr	r3, [fp, #-12]
     e10:	e5933004 	ldr	r3, [r3, #4]
     e14:	e1a03183 	lsl	r3, r3, #3
     e18:	e51b200c 	ldr	r2, [fp, #-12]
     e1c:	e0822003 	add	r2, r2, r3
     e20:	e51b3008 	ldr	r3, [fp, #-8]
     e24:	e5933000 	ldr	r3, [r3]
     e28:	e1520003 	cmp	r2, r3
     e2c:	1a00000d 	bne	e68 <free+0xf4>
    bp->s.size += p->s.ptr->s.size;
     e30:	e51b300c 	ldr	r3, [fp, #-12]
     e34:	e5932004 	ldr	r2, [r3, #4]
     e38:	e51b3008 	ldr	r3, [fp, #-8]
     e3c:	e5933000 	ldr	r3, [r3]
     e40:	e5933004 	ldr	r3, [r3, #4]
     e44:	e0822003 	add	r2, r2, r3
     e48:	e51b300c 	ldr	r3, [fp, #-12]
     e4c:	e5832004 	str	r2, [r3, #4]
    bp->s.ptr = p->s.ptr->s.ptr;
     e50:	e51b3008 	ldr	r3, [fp, #-8]
     e54:	e5933000 	ldr	r3, [r3]
     e58:	e5932000 	ldr	r2, [r3]
     e5c:	e51b300c 	ldr	r3, [fp, #-12]
     e60:	e5832000 	str	r2, [r3]
     e64:	ea000003 	b	e78 <free+0x104>
  } else
    bp->s.ptr = p->s.ptr;
     e68:	e51b3008 	ldr	r3, [fp, #-8]
     e6c:	e5932000 	ldr	r2, [r3]
     e70:	e51b300c 	ldr	r3, [fp, #-12]
     e74:	e5832000 	str	r2, [r3]
  if(p + p->s.size == bp){
     e78:	e51b3008 	ldr	r3, [fp, #-8]
     e7c:	e5933004 	ldr	r3, [r3, #4]
     e80:	e1a03183 	lsl	r3, r3, #3
     e84:	e51b2008 	ldr	r2, [fp, #-8]
     e88:	e0823003 	add	r3, r2, r3
     e8c:	e51b200c 	ldr	r2, [fp, #-12]
     e90:	e1520003 	cmp	r2, r3
     e94:	1a00000b 	bne	ec8 <free+0x154>
    p->s.size += bp->s.size;
     e98:	e51b3008 	ldr	r3, [fp, #-8]
     e9c:	e5932004 	ldr	r2, [r3, #4]
     ea0:	e51b300c 	ldr	r3, [fp, #-12]
     ea4:	e5933004 	ldr	r3, [r3, #4]
     ea8:	e0822003 	add	r2, r2, r3
     eac:	e51b3008 	ldr	r3, [fp, #-8]
     eb0:	e5832004 	str	r2, [r3, #4]
    p->s.ptr = bp->s.ptr;
     eb4:	e51b300c 	ldr	r3, [fp, #-12]
     eb8:	e5932000 	ldr	r2, [r3]
     ebc:	e51b3008 	ldr	r3, [fp, #-8]
     ec0:	e5832000 	str	r2, [r3]
     ec4:	ea000002 	b	ed4 <free+0x160>
  } else
    p->s.ptr = bp;
     ec8:	e51b3008 	ldr	r3, [fp, #-8]
     ecc:	e51b200c 	ldr	r2, [fp, #-12]
     ed0:	e5832000 	str	r2, [r3]
  freep = p;
     ed4:	e3013154 	movw	r3, #4436	@ 0x1154
     ed8:	e3403000 	movt	r3, #0
     edc:	e51b2008 	ldr	r2, [fp, #-8]
     ee0:	e5832000 	str	r2, [r3]
}
     ee4:	e320f000 	nop	{0}
     ee8:	e28bd000 	add	sp, fp, #0
     eec:	e49db004 	pop	{fp}		@ (ldr fp, [sp], #4)
     ef0:	e12fff1e 	bx	lr

00000ef4 <morecore>:

static Header*
morecore(uint nu)
{
     ef4:	e92d4800 	push	{fp, lr}
     ef8:	e28db004 	add	fp, sp, #4
     efc:	e24dd010 	sub	sp, sp, #16
     f00:	e50b0010 	str	r0, [fp, #-16]
  char *p;
  Header *hp;

  if(nu < 4096)
     f04:	e51b3010 	ldr	r3, [fp, #-16]
     f08:	e3530a01 	cmp	r3, #4096	@ 0x1000
     f0c:	2a000001 	bcs	f18 <morecore+0x24>
    nu = 4096;
     f10:	e3a03a01 	mov	r3, #4096	@ 0x1000
     f14:	e50b3010 	str	r3, [fp, #-16]
  p = sbrk(nu * sizeof(Header));
     f18:	e51b3010 	ldr	r3, [fp, #-16]
     f1c:	e1a03183 	lsl	r3, r3, #3
     f20:	e1a00003 	mov	r0, r3
     f24:	ebfffe50 	bl	86c <sbrk>
     f28:	e50b0008 	str	r0, [fp, #-8]
  if(p == (char*)-1)
     f2c:	e51b3008 	ldr	r3, [fp, #-8]
     f30:	e3730001 	cmn	r3, #1
     f34:	1a000001 	bne	f40 <morecore+0x4c>
    return 0;
     f38:	e3a03000 	mov	r3, #0
     f3c:	ea00000b 	b	f70 <morecore+0x7c>
  hp = (Header*)p;
     f40:	e51b3008 	ldr	r3, [fp, #-8]
     f44:	e50b300c 	str	r3, [fp, #-12]
  hp->s.size = nu;
     f48:	e51b300c 	ldr	r3, [fp, #-12]
     f4c:	e51b2010 	ldr	r2, [fp, #-16]
     f50:	e5832004 	str	r2, [r3, #4]
  free((void*)(hp + 1));
     f54:	e51b300c 	ldr	r3, [fp, #-12]
     f58:	e2833008 	add	r3, r3, #8
     f5c:	e1a00003 	mov	r0, r3
     f60:	ebffff83 	bl	d74 <free>
  return freep;
     f64:	e3013154 	movw	r3, #4436	@ 0x1154
     f68:	e3403000 	movt	r3, #0
     f6c:	e5933000 	ldr	r3, [r3]
}
     f70:	e1a00003 	mov	r0, r3
     f74:	e24bd004 	sub	sp, fp, #4
     f78:	e8bd8800 	pop	{fp, pc}

00000f7c <malloc>:

void*
malloc(uint nbytes)
{
     f7c:	e92d4800 	push	{fp, lr}
     f80:	e28db004 	add	fp, sp, #4
     f84:	e24dd018 	sub	sp, sp, #24
     f88:	e50b0018 	str	r0, [fp, #-24]	@ 0xffffffe8
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
     f8c:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
     f90:	e2833007 	add	r3, r3, #7
     f94:	e1a031a3 	lsr	r3, r3, #3
     f98:	e2833001 	add	r3, r3, #1
     f9c:	e50b3010 	str	r3, [fp, #-16]
  if((prevp = freep) == 0){
     fa0:	e3013154 	movw	r3, #4436	@ 0x1154
     fa4:	e3403000 	movt	r3, #0
     fa8:	e5933000 	ldr	r3, [r3]
     fac:	e50b300c 	str	r3, [fp, #-12]
     fb0:	e51b300c 	ldr	r3, [fp, #-12]
     fb4:	e3530000 	cmp	r3, #0
     fb8:	1a000010 	bne	1000 <malloc+0x84>
    base.s.ptr = freep = prevp = &base;
     fbc:	e301314c 	movw	r3, #4428	@ 0x114c
     fc0:	e3403000 	movt	r3, #0
     fc4:	e50b300c 	str	r3, [fp, #-12]
     fc8:	e3013154 	movw	r3, #4436	@ 0x1154
     fcc:	e3403000 	movt	r3, #0
     fd0:	e51b200c 	ldr	r2, [fp, #-12]
     fd4:	e5832000 	str	r2, [r3]
     fd8:	e3013154 	movw	r3, #4436	@ 0x1154
     fdc:	e3403000 	movt	r3, #0
     fe0:	e5932000 	ldr	r2, [r3]
     fe4:	e301314c 	movw	r3, #4428	@ 0x114c
     fe8:	e3403000 	movt	r3, #0
     fec:	e5832000 	str	r2, [r3]
    base.s.size = 0;
     ff0:	e301314c 	movw	r3, #4428	@ 0x114c
     ff4:	e3403000 	movt	r3, #0
     ff8:	e3a02000 	mov	r2, #0
     ffc:	e5832004 	str	r2, [r3, #4]
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1000:	e51b300c 	ldr	r3, [fp, #-12]
    1004:	e5933000 	ldr	r3, [r3]
    1008:	e50b3008 	str	r3, [fp, #-8]
    if(p->s.size >= nunits){
    100c:	e51b3008 	ldr	r3, [fp, #-8]
    1010:	e5933004 	ldr	r3, [r3, #4]
    1014:	e51b2010 	ldr	r2, [fp, #-16]
    1018:	e1520003 	cmp	r2, r3
    101c:	8a00001f 	bhi	10a0 <malloc+0x124>
      if(p->s.size == nunits)
    1020:	e51b3008 	ldr	r3, [fp, #-8]
    1024:	e5933004 	ldr	r3, [r3, #4]
    1028:	e51b2010 	ldr	r2, [fp, #-16]
    102c:	e1520003 	cmp	r2, r3
    1030:	1a000004 	bne	1048 <malloc+0xcc>
        prevp->s.ptr = p->s.ptr;
    1034:	e51b3008 	ldr	r3, [fp, #-8]
    1038:	e5932000 	ldr	r2, [r3]
    103c:	e51b300c 	ldr	r3, [fp, #-12]
    1040:	e5832000 	str	r2, [r3]
    1044:	ea00000e 	b	1084 <malloc+0x108>
      else {
        p->s.size -= nunits;
    1048:	e51b3008 	ldr	r3, [fp, #-8]
    104c:	e5932004 	ldr	r2, [r3, #4]
    1050:	e51b3010 	ldr	r3, [fp, #-16]
    1054:	e0422003 	sub	r2, r2, r3
    1058:	e51b3008 	ldr	r3, [fp, #-8]
    105c:	e5832004 	str	r2, [r3, #4]
        p += p->s.size;
    1060:	e51b3008 	ldr	r3, [fp, #-8]
    1064:	e5933004 	ldr	r3, [r3, #4]
    1068:	e1a03183 	lsl	r3, r3, #3
    106c:	e51b2008 	ldr	r2, [fp, #-8]
    1070:	e0823003 	add	r3, r2, r3
    1074:	e50b3008 	str	r3, [fp, #-8]
        p->s.size = nunits;
    1078:	e51b3008 	ldr	r3, [fp, #-8]
    107c:	e51b2010 	ldr	r2, [fp, #-16]
    1080:	e5832004 	str	r2, [r3, #4]
      }
      freep = prevp;
    1084:	e3013154 	movw	r3, #4436	@ 0x1154
    1088:	e3403000 	movt	r3, #0
    108c:	e51b200c 	ldr	r2, [fp, #-12]
    1090:	e5832000 	str	r2, [r3]
      return (void*)(p + 1);
    1094:	e51b3008 	ldr	r3, [fp, #-8]
    1098:	e2833008 	add	r3, r3, #8
    109c:	ea000013 	b	10f0 <malloc+0x174>
    }
    if(p == freep)
    10a0:	e3013154 	movw	r3, #4436	@ 0x1154
    10a4:	e3403000 	movt	r3, #0
    10a8:	e5933000 	ldr	r3, [r3]
    10ac:	e51b2008 	ldr	r2, [fp, #-8]
    10b0:	e1520003 	cmp	r2, r3
    10b4:	1a000007 	bne	10d8 <malloc+0x15c>
      if((p = morecore(nunits)) == 0)
    10b8:	e51b0010 	ldr	r0, [fp, #-16]
    10bc:	ebffff8c 	bl	ef4 <morecore>
    10c0:	e50b0008 	str	r0, [fp, #-8]
    10c4:	e51b3008 	ldr	r3, [fp, #-8]
    10c8:	e3530000 	cmp	r3, #0
    10cc:	1a000001 	bne	10d8 <malloc+0x15c>
        return 0;
    10d0:	e3a03000 	mov	r3, #0
    10d4:	ea000005 	b	10f0 <malloc+0x174>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    10d8:	e51b3008 	ldr	r3, [fp, #-8]
    10dc:	e50b300c 	str	r3, [fp, #-12]
    10e0:	e51b3008 	ldr	r3, [fp, #-8]
    10e4:	e5933000 	ldr	r3, [r3]
    10e8:	e50b3008 	str	r3, [fp, #-8]
    if(p->s.size >= nunits){
    10ec:	eaffffc6 	b	100c <malloc+0x90>
  }
}
    10f0:	e1a00003 	mov	r0, r3
    10f4:	e24bd004 	sub	sp, fp, #4
    10f8:	e8bd8800 	pop	{fp, pc}
