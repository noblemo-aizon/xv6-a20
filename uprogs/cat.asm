
_cat:     file format elf32-littlearm


Disassembly of section .text:

00000000 <cat>:

char buf[512];

void
cat(int fd)
{
       0:	e92d4800 	push	{fp, lr}
       4:	e28db004 	add	fp, sp, #4
       8:	e24dd010 	sub	sp, sp, #16
       c:	e50b0010 	str	r0, [fp, #-16]
  int n;
  while((n = read(fd, buf, sizeof(buf))) > 0)
      10:	ea000004 	b	28 <cat+0x28>
    write(1, buf, n);
      14:	e51b2008 	ldr	r2, [fp, #-8]
      18:	e30111cc 	movw	r1, #4556	@ 0x11cc
      1c:	e3401000 	movt	r1, #0
      20:	e3a00001 	mov	r0, #1
      24:	eb000189 	bl	650 <write>
  while((n = read(fd, buf, sizeof(buf))) > 0)
      28:	e3a02c02 	mov	r2, #512	@ 0x200
      2c:	e30111cc 	movw	r1, #4556	@ 0x11cc
      30:	e3401000 	movt	r1, #0
      34:	e51b0010 	ldr	r0, [fp, #-16]
      38:	eb000177 	bl	61c <read>
      3c:	e50b0008 	str	r0, [fp, #-8]
      40:	e51b3008 	ldr	r3, [fp, #-8]
      44:	e3530000 	cmp	r3, #0
      48:	cafffff1 	bgt	14 <cat+0x14>
  if(n < 0){
      4c:	e51b3008 	ldr	r3, [fp, #-8]
      50:	e3530000 	cmp	r3, #0
      54:	aa000004 	bge	6c <cat+0x6c>
    printf(1, "cat: read error\n");
      58:	e3011184 	movw	r1, #4484	@ 0x1184
      5c:	e3401000 	movt	r1, #0
      60:	e3a00001 	mov	r0, #1
      64:	eb0002d6 	bl	bc4 <printf>
    exit();
      68:	eb000144 	bl	580 <exit>
  }
}
      6c:	e320f000 	nop	{0}
      70:	e24bd004 	sub	sp, fp, #4
      74:	e8bd8800 	pop	{fp, pc}

00000078 <main>:

int
main(int argc, char *argv[])
{
      78:	e92d4800 	push	{fp, lr}
      7c:	e28db004 	add	fp, sp, #4
      80:	e24dd010 	sub	sp, sp, #16
      84:	e50b0010 	str	r0, [fp, #-16]
      88:	e50b1014 	str	r1, [fp, #-20]	@ 0xffffffec
  int fd, i;

  if(argc <= 1){
      8c:	e51b3010 	ldr	r3, [fp, #-16]
      90:	e3530001 	cmp	r3, #1
      94:	ca000002 	bgt	a4 <main+0x2c>
    cat(0);
      98:	e3a00000 	mov	r0, #0
      9c:	ebffffd7 	bl	0 <cat>
    exit();
      a0:	eb000136 	bl	580 <exit>
  }

  for(i = 1; i < argc; i++){
      a4:	e3a03001 	mov	r3, #1
      a8:	e50b3008 	str	r3, [fp, #-8]
      ac:	ea00001d 	b	128 <main+0xb0>
    if((fd = open(argv[i], 0)) < 0){
      b0:	e51b3008 	ldr	r3, [fp, #-8]
      b4:	e1a03103 	lsl	r3, r3, #2
      b8:	e51b2014 	ldr	r2, [fp, #-20]	@ 0xffffffec
      bc:	e0823003 	add	r3, r2, r3
      c0:	e5933000 	ldr	r3, [r3]
      c4:	e3a01000 	mov	r1, #0
      c8:	e1a00003 	mov	r0, r3
      cc:	eb000193 	bl	720 <open>
      d0:	e50b000c 	str	r0, [fp, #-12]
      d4:	e51b300c 	ldr	r3, [fp, #-12]
      d8:	e3530000 	cmp	r3, #0
      dc:	aa00000a 	bge	10c <main+0x94>
      printf(1, "cat: cannot open %s\n", argv[i]);
      e0:	e51b3008 	ldr	r3, [fp, #-8]
      e4:	e1a03103 	lsl	r3, r3, #2
      e8:	e51b2014 	ldr	r2, [fp, #-20]	@ 0xffffffec
      ec:	e0823003 	add	r3, r2, r3
      f0:	e5933000 	ldr	r3, [r3]
      f4:	e1a02003 	mov	r2, r3
      f8:	e3011198 	movw	r1, #4504	@ 0x1198
      fc:	e3401000 	movt	r1, #0
     100:	e3a00001 	mov	r0, #1
     104:	eb0002ae 	bl	bc4 <printf>
      exit();
     108:	eb00011c 	bl	580 <exit>
    }
    cat(fd);
     10c:	e51b000c 	ldr	r0, [fp, #-12]
     110:	ebffffba 	bl	0 <cat>
    close(fd);
     114:	e51b000c 	ldr	r0, [fp, #-12]
     118:	eb000159 	bl	684 <close>
  for(i = 1; i < argc; i++){
     11c:	e51b3008 	ldr	r3, [fp, #-8]
     120:	e2833001 	add	r3, r3, #1
     124:	e50b3008 	str	r3, [fp, #-8]
     128:	e51b2008 	ldr	r2, [fp, #-8]
     12c:	e51b3010 	ldr	r3, [fp, #-16]
     130:	e1520003 	cmp	r2, r3
     134:	baffffdd 	blt	b0 <main+0x38>
  }
  exit();
     138:	eb000110 	bl	580 <exit>

0000013c <strcpy>:
#include "user.h"
#include "arm.h"

char*
strcpy(char *s, char *t)
{
     13c:	e52db004 	push	{fp}		@ (str fp, [sp, #-4]!)
     140:	e28db000 	add	fp, sp, #0
     144:	e24dd014 	sub	sp, sp, #20
     148:	e50b0010 	str	r0, [fp, #-16]
     14c:	e50b1014 	str	r1, [fp, #-20]	@ 0xffffffec
  char *os;

  os = s;
     150:	e51b3010 	ldr	r3, [fp, #-16]
     154:	e50b3008 	str	r3, [fp, #-8]
  while((*s++ = *t++) != 0)
     158:	e320f000 	nop	{0}
     15c:	e51b2014 	ldr	r2, [fp, #-20]	@ 0xffffffec
     160:	e2823001 	add	r3, r2, #1
     164:	e50b3014 	str	r3, [fp, #-20]	@ 0xffffffec
     168:	e51b3010 	ldr	r3, [fp, #-16]
     16c:	e2831001 	add	r1, r3, #1
     170:	e50b1010 	str	r1, [fp, #-16]
     174:	e5d22000 	ldrb	r2, [r2]
     178:	e5c32000 	strb	r2, [r3]
     17c:	e5d33000 	ldrb	r3, [r3]
     180:	e3530000 	cmp	r3, #0
     184:	1afffff4 	bne	15c <strcpy+0x20>
    ;
  return os;
     188:	e51b3008 	ldr	r3, [fp, #-8]
}
     18c:	e1a00003 	mov	r0, r3
     190:	e28bd000 	add	sp, fp, #0
     194:	e49db004 	pop	{fp}		@ (ldr fp, [sp], #4)
     198:	e12fff1e 	bx	lr

0000019c <strcmp>:

int
strcmp(const char *p, const char *q)
{
     19c:	e52db004 	push	{fp}		@ (str fp, [sp, #-4]!)
     1a0:	e28db000 	add	fp, sp, #0
     1a4:	e24dd00c 	sub	sp, sp, #12
     1a8:	e50b0008 	str	r0, [fp, #-8]
     1ac:	e50b100c 	str	r1, [fp, #-12]
  while(*p && *p == *q)
     1b0:	ea000005 	b	1cc <strcmp+0x30>
    p++, q++;
     1b4:	e51b3008 	ldr	r3, [fp, #-8]
     1b8:	e2833001 	add	r3, r3, #1
     1bc:	e50b3008 	str	r3, [fp, #-8]
     1c0:	e51b300c 	ldr	r3, [fp, #-12]
     1c4:	e2833001 	add	r3, r3, #1
     1c8:	e50b300c 	str	r3, [fp, #-12]
  while(*p && *p == *q)
     1cc:	e51b3008 	ldr	r3, [fp, #-8]
     1d0:	e5d33000 	ldrb	r3, [r3]
     1d4:	e3530000 	cmp	r3, #0
     1d8:	0a000005 	beq	1f4 <strcmp+0x58>
     1dc:	e51b3008 	ldr	r3, [fp, #-8]
     1e0:	e5d32000 	ldrb	r2, [r3]
     1e4:	e51b300c 	ldr	r3, [fp, #-12]
     1e8:	e5d33000 	ldrb	r3, [r3]
     1ec:	e1520003 	cmp	r2, r3
     1f0:	0affffef 	beq	1b4 <strcmp+0x18>
  return (uchar)*p - (uchar)*q;
     1f4:	e51b3008 	ldr	r3, [fp, #-8]
     1f8:	e5d33000 	ldrb	r3, [r3]
     1fc:	e1a02003 	mov	r2, r3
     200:	e51b300c 	ldr	r3, [fp, #-12]
     204:	e5d33000 	ldrb	r3, [r3]
     208:	e0423003 	sub	r3, r2, r3
}
     20c:	e1a00003 	mov	r0, r3
     210:	e28bd000 	add	sp, fp, #0
     214:	e49db004 	pop	{fp}		@ (ldr fp, [sp], #4)
     218:	e12fff1e 	bx	lr

0000021c <strlen>:

uint
strlen(char *s)
{
     21c:	e52db004 	push	{fp}		@ (str fp, [sp, #-4]!)
     220:	e28db000 	add	fp, sp, #0
     224:	e24dd014 	sub	sp, sp, #20
     228:	e50b0010 	str	r0, [fp, #-16]
  int n;

  for(n = 0; s[n]; n++)
     22c:	e3a03000 	mov	r3, #0
     230:	e50b3008 	str	r3, [fp, #-8]
     234:	ea000002 	b	244 <strlen+0x28>
     238:	e51b3008 	ldr	r3, [fp, #-8]
     23c:	e2833001 	add	r3, r3, #1
     240:	e50b3008 	str	r3, [fp, #-8]
     244:	e51b3008 	ldr	r3, [fp, #-8]
     248:	e51b2010 	ldr	r2, [fp, #-16]
     24c:	e0823003 	add	r3, r2, r3
     250:	e5d33000 	ldrb	r3, [r3]
     254:	e3530000 	cmp	r3, #0
     258:	1afffff6 	bne	238 <strlen+0x1c>
    ;
  return n;
     25c:	e51b3008 	ldr	r3, [fp, #-8]
}
     260:	e1a00003 	mov	r0, r3
     264:	e28bd000 	add	sp, fp, #0
     268:	e49db004 	pop	{fp}		@ (ldr fp, [sp], #4)
     26c:	e12fff1e 	bx	lr

00000270 <memset>:

void*
memset(void *dst, int c, uint n)
{
     270:	e52db004 	push	{fp}		@ (str fp, [sp, #-4]!)
     274:	e28db000 	add	fp, sp, #0
     278:	e24dd01c 	sub	sp, sp, #28
     27c:	e50b0010 	str	r0, [fp, #-16]
     280:	e50b1014 	str	r1, [fp, #-20]	@ 0xffffffec
     284:	e50b2018 	str	r2, [fp, #-24]	@ 0xffffffe8
  char *p=dst;
     288:	e51b3010 	ldr	r3, [fp, #-16]
     28c:	e50b3008 	str	r3, [fp, #-8]
  u32 rc=n;
     290:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
     294:	e50b300c 	str	r3, [fp, #-12]

  while (rc-- > 0) *p++ = c;
     298:	ea000005 	b	2b4 <memset+0x44>
     29c:	e51b3008 	ldr	r3, [fp, #-8]
     2a0:	e2832001 	add	r2, r3, #1
     2a4:	e50b2008 	str	r2, [fp, #-8]
     2a8:	e51b2014 	ldr	r2, [fp, #-20]	@ 0xffffffec
     2ac:	e6ef2072 	uxtb	r2, r2
     2b0:	e5c32000 	strb	r2, [r3]
     2b4:	e51b300c 	ldr	r3, [fp, #-12]
     2b8:	e2432001 	sub	r2, r3, #1
     2bc:	e50b200c 	str	r2, [fp, #-12]
     2c0:	e3530000 	cmp	r3, #0
     2c4:	1afffff4 	bne	29c <memset+0x2c>
  return (void *)p;
     2c8:	e51b3008 	ldr	r3, [fp, #-8]
}
     2cc:	e1a00003 	mov	r0, r3
     2d0:	e28bd000 	add	sp, fp, #0
     2d4:	e49db004 	pop	{fp}		@ (ldr fp, [sp], #4)
     2d8:	e12fff1e 	bx	lr

000002dc <strchr>:

char*
strchr(const char *s, char c)
{
     2dc:	e52db004 	push	{fp}		@ (str fp, [sp, #-4]!)
     2e0:	e28db000 	add	fp, sp, #0
     2e4:	e24dd00c 	sub	sp, sp, #12
     2e8:	e50b0008 	str	r0, [fp, #-8]
     2ec:	e1a03001 	mov	r3, r1
     2f0:	e54b3009 	strb	r3, [fp, #-9]
  for(; *s; s++)
     2f4:	ea000009 	b	320 <strchr+0x44>
    if(*s == c)
     2f8:	e51b3008 	ldr	r3, [fp, #-8]
     2fc:	e5d33000 	ldrb	r3, [r3]
     300:	e55b2009 	ldrb	r2, [fp, #-9]
     304:	e1520003 	cmp	r2, r3
     308:	1a000001 	bne	314 <strchr+0x38>
      return (char*)s;
     30c:	e51b3008 	ldr	r3, [fp, #-8]
     310:	ea000007 	b	334 <strchr+0x58>
  for(; *s; s++)
     314:	e51b3008 	ldr	r3, [fp, #-8]
     318:	e2833001 	add	r3, r3, #1
     31c:	e50b3008 	str	r3, [fp, #-8]
     320:	e51b3008 	ldr	r3, [fp, #-8]
     324:	e5d33000 	ldrb	r3, [r3]
     328:	e3530000 	cmp	r3, #0
     32c:	1afffff1 	bne	2f8 <strchr+0x1c>
  return 0;
     330:	e3a03000 	mov	r3, #0
}
     334:	e1a00003 	mov	r0, r3
     338:	e28bd000 	add	sp, fp, #0
     33c:	e49db004 	pop	{fp}		@ (ldr fp, [sp], #4)
     340:	e12fff1e 	bx	lr

00000344 <gets>:

char*
gets(char *buf, int max)
{
     344:	e92d4800 	push	{fp, lr}
     348:	e28db004 	add	fp, sp, #4
     34c:	e24dd018 	sub	sp, sp, #24
     350:	e50b0018 	str	r0, [fp, #-24]	@ 0xffffffe8
     354:	e50b101c 	str	r1, [fp, #-28]	@ 0xffffffe4
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
     358:	e3a03000 	mov	r3, #0
     35c:	e50b3008 	str	r3, [fp, #-8]
     360:	ea000016 	b	3c0 <gets+0x7c>
    cc = read(0, &c, 1);
     364:	e24b300d 	sub	r3, fp, #13
     368:	e3a02001 	mov	r2, #1
     36c:	e1a01003 	mov	r1, r3
     370:	e3a00000 	mov	r0, #0
     374:	eb0000a8 	bl	61c <read>
     378:	e50b000c 	str	r0, [fp, #-12]
    if(cc < 1)
     37c:	e51b300c 	ldr	r3, [fp, #-12]
     380:	e3530000 	cmp	r3, #0
     384:	da000013 	ble	3d8 <gets+0x94>
      break;
    buf[i++] = c;
     388:	e51b3008 	ldr	r3, [fp, #-8]
     38c:	e2832001 	add	r2, r3, #1
     390:	e50b2008 	str	r2, [fp, #-8]
     394:	e1a02003 	mov	r2, r3
     398:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
     39c:	e0833002 	add	r3, r3, r2
     3a0:	e55b200d 	ldrb	r2, [fp, #-13]
     3a4:	e5c32000 	strb	r2, [r3]
    if(c == '\n' || c == '\r')
     3a8:	e55b300d 	ldrb	r3, [fp, #-13]
     3ac:	e353000a 	cmp	r3, #10
     3b0:	0a000009 	beq	3dc <gets+0x98>
     3b4:	e55b300d 	ldrb	r3, [fp, #-13]
     3b8:	e353000d 	cmp	r3, #13
     3bc:	0a000006 	beq	3dc <gets+0x98>
  for(i=0; i+1 < max; ){
     3c0:	e51b3008 	ldr	r3, [fp, #-8]
     3c4:	e2833001 	add	r3, r3, #1
     3c8:	e51b201c 	ldr	r2, [fp, #-28]	@ 0xffffffe4
     3cc:	e1520003 	cmp	r2, r3
     3d0:	caffffe3 	bgt	364 <gets+0x20>
     3d4:	ea000000 	b	3dc <gets+0x98>
      break;
     3d8:	e320f000 	nop	{0}
      break;
  }
  buf[i] = '\0';
     3dc:	e51b3008 	ldr	r3, [fp, #-8]
     3e0:	e51b2018 	ldr	r2, [fp, #-24]	@ 0xffffffe8
     3e4:	e0823003 	add	r3, r2, r3
     3e8:	e3a02000 	mov	r2, #0
     3ec:	e5c32000 	strb	r2, [r3]
  return buf;
     3f0:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
}
     3f4:	e1a00003 	mov	r0, r3
     3f8:	e24bd004 	sub	sp, fp, #4
     3fc:	e8bd8800 	pop	{fp, pc}

00000400 <stat>:

int
stat(char *n, struct stat *st)
{
     400:	e92d4800 	push	{fp, lr}
     404:	e28db004 	add	fp, sp, #4
     408:	e24dd010 	sub	sp, sp, #16
     40c:	e50b0010 	str	r0, [fp, #-16]
     410:	e50b1014 	str	r1, [fp, #-20]	@ 0xffffffec
  int fd;
  int r;

  fd = open(n, O_RDONLY);
     414:	e3a01000 	mov	r1, #0
     418:	e51b0010 	ldr	r0, [fp, #-16]
     41c:	eb0000bf 	bl	720 <open>
     420:	e50b0008 	str	r0, [fp, #-8]
  if(fd < 0)
     424:	e51b3008 	ldr	r3, [fp, #-8]
     428:	e3530000 	cmp	r3, #0
     42c:	aa000001 	bge	438 <stat+0x38>
    return -1;
     430:	e3e03000 	mvn	r3, #0
     434:	ea000006 	b	454 <stat+0x54>
  r = fstat(fd, st);
     438:	e51b1014 	ldr	r1, [fp, #-20]	@ 0xffffffec
     43c:	e51b0008 	ldr	r0, [fp, #-8]
     440:	eb0000dd 	bl	7bc <fstat>
     444:	e50b000c 	str	r0, [fp, #-12]
  close(fd);
     448:	e51b0008 	ldr	r0, [fp, #-8]
     44c:	eb00008c 	bl	684 <close>
  return r;
     450:	e51b300c 	ldr	r3, [fp, #-12]
}
     454:	e1a00003 	mov	r0, r3
     458:	e24bd004 	sub	sp, fp, #4
     45c:	e8bd8800 	pop	{fp, pc}

00000460 <atoi>:

int
atoi(const char *s)
{
     460:	e52db004 	push	{fp}		@ (str fp, [sp, #-4]!)
     464:	e28db000 	add	fp, sp, #0
     468:	e24dd014 	sub	sp, sp, #20
     46c:	e50b0010 	str	r0, [fp, #-16]
  int n;

  n = 0;
     470:	e3a03000 	mov	r3, #0
     474:	e50b3008 	str	r3, [fp, #-8]
  while('0' <= *s && *s <= '9')
     478:	ea000009 	b	4a4 <atoi+0x44>
    n = n*10 + *s++ - '0';
     47c:	e51b3008 	ldr	r3, [fp, #-8]
     480:	e3a0200a 	mov	r2, #10
     484:	e0020392 	mul	r2, r2, r3
     488:	e51b3010 	ldr	r3, [fp, #-16]
     48c:	e2831001 	add	r1, r3, #1
     490:	e50b1010 	str	r1, [fp, #-16]
     494:	e5d33000 	ldrb	r3, [r3]
     498:	e0823003 	add	r3, r2, r3
     49c:	e2433030 	sub	r3, r3, #48	@ 0x30
     4a0:	e50b3008 	str	r3, [fp, #-8]
  while('0' <= *s && *s <= '9')
     4a4:	e51b3010 	ldr	r3, [fp, #-16]
     4a8:	e5d33000 	ldrb	r3, [r3]
     4ac:	e353002f 	cmp	r3, #47	@ 0x2f
     4b0:	9a000003 	bls	4c4 <atoi+0x64>
     4b4:	e51b3010 	ldr	r3, [fp, #-16]
     4b8:	e5d33000 	ldrb	r3, [r3]
     4bc:	e3530039 	cmp	r3, #57	@ 0x39
     4c0:	9affffed 	bls	47c <atoi+0x1c>
  return n;
     4c4:	e51b3008 	ldr	r3, [fp, #-8]
}
     4c8:	e1a00003 	mov	r0, r3
     4cc:	e28bd000 	add	sp, fp, #0
     4d0:	e49db004 	pop	{fp}		@ (ldr fp, [sp], #4)
     4d4:	e12fff1e 	bx	lr

000004d8 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
     4d8:	e52db004 	push	{fp}		@ (str fp, [sp, #-4]!)
     4dc:	e28db000 	add	fp, sp, #0
     4e0:	e24dd01c 	sub	sp, sp, #28
     4e4:	e50b0010 	str	r0, [fp, #-16]
     4e8:	e50b1014 	str	r1, [fp, #-20]	@ 0xffffffec
     4ec:	e50b2018 	str	r2, [fp, #-24]	@ 0xffffffe8
  char *dst, *src;
  
  dst = vdst;
     4f0:	e51b3010 	ldr	r3, [fp, #-16]
     4f4:	e50b3008 	str	r3, [fp, #-8]
  src = vsrc;
     4f8:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
     4fc:	e50b300c 	str	r3, [fp, #-12]
  while(n-- > 0)
     500:	ea000007 	b	524 <memmove+0x4c>
    *dst++ = *src++;
     504:	e51b200c 	ldr	r2, [fp, #-12]
     508:	e2823001 	add	r3, r2, #1
     50c:	e50b300c 	str	r3, [fp, #-12]
     510:	e51b3008 	ldr	r3, [fp, #-8]
     514:	e2831001 	add	r1, r3, #1
     518:	e50b1008 	str	r1, [fp, #-8]
     51c:	e5d22000 	ldrb	r2, [r2]
     520:	e5c32000 	strb	r2, [r3]
  while(n-- > 0)
     524:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
     528:	e2432001 	sub	r2, r3, #1
     52c:	e50b2018 	str	r2, [fp, #-24]	@ 0xffffffe8
     530:	e3530000 	cmp	r3, #0
     534:	cafffff2 	bgt	504 <memmove+0x2c>
  return vdst;
     538:	e51b3010 	ldr	r3, [fp, #-16]
}
     53c:	e1a00003 	mov	r0, r3
     540:	e28bd000 	add	sp, fp, #0
     544:	e49db004 	pop	{fp}		@ (ldr fp, [sp], #4)
     548:	e12fff1e 	bx	lr

0000054c <fork>:
     54c:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
     550:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
     554:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
     558:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
     55c:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
     560:	e3a00001 	mov	r0, #1
     564:	ef000040 	svc	0x00000040
     568:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     56c:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     570:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
     574:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
     578:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
     57c:	e12fff1e 	bx	lr

00000580 <exit>:
     580:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
     584:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
     588:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
     58c:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
     590:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
     594:	e3a00002 	mov	r0, #2
     598:	ef000040 	svc	0x00000040
     59c:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     5a0:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     5a4:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
     5a8:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
     5ac:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
     5b0:	e12fff1e 	bx	lr

000005b4 <wait>:
     5b4:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
     5b8:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
     5bc:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
     5c0:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
     5c4:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
     5c8:	e3a00003 	mov	r0, #3
     5cc:	ef000040 	svc	0x00000040
     5d0:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     5d4:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     5d8:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
     5dc:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
     5e0:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
     5e4:	e12fff1e 	bx	lr

000005e8 <pipe>:
     5e8:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
     5ec:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
     5f0:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
     5f4:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
     5f8:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
     5fc:	e3a00004 	mov	r0, #4
     600:	ef000040 	svc	0x00000040
     604:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     608:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     60c:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
     610:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
     614:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
     618:	e12fff1e 	bx	lr

0000061c <read>:
     61c:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
     620:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
     624:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
     628:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
     62c:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
     630:	e3a00005 	mov	r0, #5
     634:	ef000040 	svc	0x00000040
     638:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     63c:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     640:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
     644:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
     648:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
     64c:	e12fff1e 	bx	lr

00000650 <write>:
     650:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
     654:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
     658:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
     65c:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
     660:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
     664:	e3a00010 	mov	r0, #16
     668:	ef000040 	svc	0x00000040
     66c:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     670:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     674:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
     678:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
     67c:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
     680:	e12fff1e 	bx	lr

00000684 <close>:
     684:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
     688:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
     68c:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
     690:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
     694:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
     698:	e3a00015 	mov	r0, #21
     69c:	ef000040 	svc	0x00000040
     6a0:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     6a4:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     6a8:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
     6ac:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
     6b0:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
     6b4:	e12fff1e 	bx	lr

000006b8 <kill>:
     6b8:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
     6bc:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
     6c0:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
     6c4:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
     6c8:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
     6cc:	e3a00006 	mov	r0, #6
     6d0:	ef000040 	svc	0x00000040
     6d4:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     6d8:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     6dc:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
     6e0:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
     6e4:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
     6e8:	e12fff1e 	bx	lr

000006ec <exec>:
     6ec:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
     6f0:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
     6f4:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
     6f8:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
     6fc:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
     700:	e3a00007 	mov	r0, #7
     704:	ef000040 	svc	0x00000040
     708:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     70c:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     710:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
     714:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
     718:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
     71c:	e12fff1e 	bx	lr

00000720 <open>:
     720:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
     724:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
     728:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
     72c:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
     730:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
     734:	e3a0000f 	mov	r0, #15
     738:	ef000040 	svc	0x00000040
     73c:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     740:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     744:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
     748:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
     74c:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
     750:	e12fff1e 	bx	lr

00000754 <mknod>:
     754:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
     758:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
     75c:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
     760:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
     764:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
     768:	e3a00011 	mov	r0, #17
     76c:	ef000040 	svc	0x00000040
     770:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     774:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     778:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
     77c:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
     780:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
     784:	e12fff1e 	bx	lr

00000788 <unlink>:
     788:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
     78c:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
     790:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
     794:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
     798:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
     79c:	e3a00012 	mov	r0, #18
     7a0:	ef000040 	svc	0x00000040
     7a4:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     7a8:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     7ac:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
     7b0:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
     7b4:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
     7b8:	e12fff1e 	bx	lr

000007bc <fstat>:
     7bc:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
     7c0:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
     7c4:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
     7c8:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
     7cc:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
     7d0:	e3a00008 	mov	r0, #8
     7d4:	ef000040 	svc	0x00000040
     7d8:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     7dc:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     7e0:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
     7e4:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
     7e8:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
     7ec:	e12fff1e 	bx	lr

000007f0 <link>:
     7f0:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
     7f4:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
     7f8:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
     7fc:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
     800:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
     804:	e3a00013 	mov	r0, #19
     808:	ef000040 	svc	0x00000040
     80c:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     810:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     814:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
     818:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
     81c:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
     820:	e12fff1e 	bx	lr

00000824 <mkdir>:
     824:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
     828:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
     82c:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
     830:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
     834:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
     838:	e3a00014 	mov	r0, #20
     83c:	ef000040 	svc	0x00000040
     840:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     844:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     848:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
     84c:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
     850:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
     854:	e12fff1e 	bx	lr

00000858 <chdir>:
     858:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
     85c:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
     860:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
     864:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
     868:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
     86c:	e3a00009 	mov	r0, #9
     870:	ef000040 	svc	0x00000040
     874:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     878:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     87c:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
     880:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
     884:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
     888:	e12fff1e 	bx	lr

0000088c <dup>:
     88c:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
     890:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
     894:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
     898:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
     89c:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
     8a0:	e3a0000a 	mov	r0, #10
     8a4:	ef000040 	svc	0x00000040
     8a8:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     8ac:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     8b0:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
     8b4:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
     8b8:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
     8bc:	e12fff1e 	bx	lr

000008c0 <getpid>:
     8c0:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
     8c4:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
     8c8:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
     8cc:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
     8d0:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
     8d4:	e3a0000b 	mov	r0, #11
     8d8:	ef000040 	svc	0x00000040
     8dc:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     8e0:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     8e4:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
     8e8:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
     8ec:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
     8f0:	e12fff1e 	bx	lr

000008f4 <sbrk>:
     8f4:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
     8f8:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
     8fc:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
     900:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
     904:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
     908:	e3a0000c 	mov	r0, #12
     90c:	ef000040 	svc	0x00000040
     910:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     914:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     918:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
     91c:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
     920:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
     924:	e12fff1e 	bx	lr

00000928 <sleep>:
     928:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
     92c:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
     930:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
     934:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
     938:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
     93c:	e3a0000d 	mov	r0, #13
     940:	ef000040 	svc	0x00000040
     944:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     948:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     94c:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
     950:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
     954:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
     958:	e12fff1e 	bx	lr

0000095c <uptime>:
     95c:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
     960:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
     964:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
     968:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
     96c:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
     970:	e3a0000e 	mov	r0, #14
     974:	ef000040 	svc	0x00000040
     978:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     97c:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     980:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
     984:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
     988:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
     98c:	e12fff1e 	bx	lr

00000990 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
     990:	e92d4800 	push	{fp, lr}
     994:	e28db004 	add	fp, sp, #4
     998:	e24dd008 	sub	sp, sp, #8
     99c:	e50b0008 	str	r0, [fp, #-8]
     9a0:	e1a03001 	mov	r3, r1
     9a4:	e54b3009 	strb	r3, [fp, #-9]
  write(fd, &c, 1);
     9a8:	e24b3009 	sub	r3, fp, #9
     9ac:	e3a02001 	mov	r2, #1
     9b0:	e1a01003 	mov	r1, r3
     9b4:	e51b0008 	ldr	r0, [fp, #-8]
     9b8:	ebffff24 	bl	650 <write>
}
     9bc:	e320f000 	nop	{0}
     9c0:	e24bd004 	sub	sp, fp, #4
     9c4:	e8bd8800 	pop	{fp, pc}

000009c8 <div>:

u32 div(u32 n, u32 d)  // long division
{
     9c8:	e52db004 	push	{fp}		@ (str fp, [sp, #-4]!)
     9cc:	e28db000 	add	fp, sp, #0
     9d0:	e24dd01c 	sub	sp, sp, #28
     9d4:	e50b0018 	str	r0, [fp, #-24]	@ 0xffffffe8
     9d8:	e50b101c 	str	r1, [fp, #-28]	@ 0xffffffe4
    u32 q=0, r=0;
     9dc:	e3a03000 	mov	r3, #0
     9e0:	e50b3008 	str	r3, [fp, #-8]
     9e4:	e3a03000 	mov	r3, #0
     9e8:	e50b300c 	str	r3, [fp, #-12]
    int i;

    for(i=31;i>=0;i--){
     9ec:	e3a0301f 	mov	r3, #31
     9f0:	e50b3010 	str	r3, [fp, #-16]
     9f4:	ea00001b 	b	a68 <div+0xa0>
        r = r << 1;
     9f8:	e51b300c 	ldr	r3, [fp, #-12]
     9fc:	e1a03083 	lsl	r3, r3, #1
     a00:	e50b300c 	str	r3, [fp, #-12]
        r = r | ((n >> i) & 1);
     a04:	e51b2018 	ldr	r2, [fp, #-24]	@ 0xffffffe8
     a08:	e51b3010 	ldr	r3, [fp, #-16]
     a0c:	e1a03332 	lsr	r3, r2, r3
     a10:	e2033001 	and	r3, r3, #1
     a14:	e51b200c 	ldr	r2, [fp, #-12]
     a18:	e1823003 	orr	r3, r2, r3
     a1c:	e50b300c 	str	r3, [fp, #-12]
        if(r >= d) {
     a20:	e51b200c 	ldr	r2, [fp, #-12]
     a24:	e51b301c 	ldr	r3, [fp, #-28]	@ 0xffffffe4
     a28:	e1520003 	cmp	r2, r3
     a2c:	3a00000a 	bcc	a5c <div+0x94>
            r = r - d;
     a30:	e51b200c 	ldr	r2, [fp, #-12]
     a34:	e51b301c 	ldr	r3, [fp, #-28]	@ 0xffffffe4
     a38:	e0423003 	sub	r3, r2, r3
     a3c:	e50b300c 	str	r3, [fp, #-12]
            q = q | (1 << i);
     a40:	e3a02001 	mov	r2, #1
     a44:	e51b3010 	ldr	r3, [fp, #-16]
     a48:	e1a03312 	lsl	r3, r2, r3
     a4c:	e1a02003 	mov	r2, r3
     a50:	e51b3008 	ldr	r3, [fp, #-8]
     a54:	e1833002 	orr	r3, r3, r2
     a58:	e50b3008 	str	r3, [fp, #-8]
    for(i=31;i>=0;i--){
     a5c:	e51b3010 	ldr	r3, [fp, #-16]
     a60:	e2433001 	sub	r3, r3, #1
     a64:	e50b3010 	str	r3, [fp, #-16]
     a68:	e51b3010 	ldr	r3, [fp, #-16]
     a6c:	e3530000 	cmp	r3, #0
     a70:	aaffffe0 	bge	9f8 <div+0x30>
        }
    }
    return q;
     a74:	e51b3008 	ldr	r3, [fp, #-8]
}
     a78:	e1a00003 	mov	r0, r3
     a7c:	e28bd000 	add	sp, fp, #0
     a80:	e49db004 	pop	{fp}		@ (ldr fp, [sp], #4)
     a84:	e12fff1e 	bx	lr

00000a88 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
     a88:	e92d4800 	push	{fp, lr}
     a8c:	e28db004 	add	fp, sp, #4
     a90:	e24dd038 	sub	sp, sp, #56	@ 0x38
     a94:	e50b0030 	str	r0, [fp, #-48]	@ 0xffffffd0
     a98:	e50b1034 	str	r1, [fp, #-52]	@ 0xffffffcc
     a9c:	e50b2038 	str	r2, [fp, #-56]	@ 0xffffffc8
     aa0:	e50b303c 	str	r3, [fp, #-60]	@ 0xffffffc4
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x, y, b;

  neg = 0;
     aa4:	e3a03000 	mov	r3, #0
     aa8:	e50b300c 	str	r3, [fp, #-12]
  if(sgn && xx < 0){
     aac:	e51b303c 	ldr	r3, [fp, #-60]	@ 0xffffffc4
     ab0:	e3530000 	cmp	r3, #0
     ab4:	0a000008 	beq	adc <printint+0x54>
     ab8:	e51b3034 	ldr	r3, [fp, #-52]	@ 0xffffffcc
     abc:	e3530000 	cmp	r3, #0
     ac0:	aa000005 	bge	adc <printint+0x54>
    neg = 1;
     ac4:	e3a03001 	mov	r3, #1
     ac8:	e50b300c 	str	r3, [fp, #-12]
    x = -xx;
     acc:	e51b3034 	ldr	r3, [fp, #-52]	@ 0xffffffcc
     ad0:	e2633000 	rsb	r3, r3, #0
     ad4:	e50b3010 	str	r3, [fp, #-16]
     ad8:	ea000001 	b	ae4 <printint+0x5c>
  } else {
    x = xx;
     adc:	e51b3034 	ldr	r3, [fp, #-52]	@ 0xffffffcc
     ae0:	e50b3010 	str	r3, [fp, #-16]
  }

  b = base;
     ae4:	e51b3038 	ldr	r3, [fp, #-56]	@ 0xffffffc8
     ae8:	e50b3014 	str	r3, [fp, #-20]	@ 0xffffffec
  i = 0;
     aec:	e3a03000 	mov	r3, #0
     af0:	e50b3008 	str	r3, [fp, #-8]
  do{
    y = div(x, b);
     af4:	e51b1014 	ldr	r1, [fp, #-20]	@ 0xffffffec
     af8:	e51b0010 	ldr	r0, [fp, #-16]
     afc:	ebffffb1 	bl	9c8 <div>
     b00:	e50b0018 	str	r0, [fp, #-24]	@ 0xffffffe8
    buf[i++] = digits[x - y * b];
     b04:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
     b08:	e51b2014 	ldr	r2, [fp, #-20]	@ 0xffffffec
     b0c:	e0030392 	mul	r3, r2, r3
     b10:	e51b2010 	ldr	r2, [fp, #-16]
     b14:	e0421003 	sub	r1, r2, r3
     b18:	e51b2008 	ldr	r2, [fp, #-8]
     b1c:	e2823001 	add	r3, r2, #1
     b20:	e50b3008 	str	r3, [fp, #-8]
     b24:	e30131b8 	movw	r3, #4536	@ 0x11b8
     b28:	e3403000 	movt	r3, #0
     b2c:	e7d31001 	ldrb	r1, [r3, r1]
     b30:	e2423004 	sub	r3, r2, #4
     b34:	e083300b 	add	r3, r3, fp
     b38:	e1a02001 	mov	r2, r1
     b3c:	e5432024 	strb	r2, [r3, #-36]	@ 0xffffffdc
  }while((x = y) != 0);
     b40:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
     b44:	e50b3010 	str	r3, [fp, #-16]
     b48:	e51b3010 	ldr	r3, [fp, #-16]
     b4c:	e3530000 	cmp	r3, #0
     b50:	1affffe7 	bne	af4 <printint+0x6c>
  if(neg)
     b54:	e51b300c 	ldr	r3, [fp, #-12]
     b58:	e3530000 	cmp	r3, #0
     b5c:	0a00000e 	beq	b9c <printint+0x114>
    buf[i++] = '-';
     b60:	e51b3008 	ldr	r3, [fp, #-8]
     b64:	e2832001 	add	r2, r3, #1
     b68:	e50b2008 	str	r2, [fp, #-8]
     b6c:	e2433004 	sub	r3, r3, #4
     b70:	e083300b 	add	r3, r3, fp
     b74:	e3a0202d 	mov	r2, #45	@ 0x2d
     b78:	e5432024 	strb	r2, [r3, #-36]	@ 0xffffffdc

  while(--i >= 0)
     b7c:	ea000006 	b	b9c <printint+0x114>
    putc(fd, buf[i]);
     b80:	e24b2028 	sub	r2, fp, #40	@ 0x28
     b84:	e51b3008 	ldr	r3, [fp, #-8]
     b88:	e0823003 	add	r3, r2, r3
     b8c:	e5d33000 	ldrb	r3, [r3]
     b90:	e1a01003 	mov	r1, r3
     b94:	e51b0030 	ldr	r0, [fp, #-48]	@ 0xffffffd0
     b98:	ebffff7c 	bl	990 <putc>
  while(--i >= 0)
     b9c:	e51b3008 	ldr	r3, [fp, #-8]
     ba0:	e2433001 	sub	r3, r3, #1
     ba4:	e50b3008 	str	r3, [fp, #-8]
     ba8:	e51b3008 	ldr	r3, [fp, #-8]
     bac:	e3530000 	cmp	r3, #0
     bb0:	aafffff2 	bge	b80 <printint+0xf8>
}
     bb4:	e320f000 	nop	{0}
     bb8:	e320f000 	nop	{0}
     bbc:	e24bd004 	sub	sp, fp, #4
     bc0:	e8bd8800 	pop	{fp, pc}

00000bc4 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
     bc4:	e92d000e 	push	{r1, r2, r3}
     bc8:	e92d4800 	push	{fp, lr}
     bcc:	e28db004 	add	fp, sp, #4
     bd0:	e24dd024 	sub	sp, sp, #36	@ 0x24
     bd4:	e50b0024 	str	r0, [fp, #-36]	@ 0xffffffdc
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
     bd8:	e3a03000 	mov	r3, #0
     bdc:	e50b3014 	str	r3, [fp, #-20]	@ 0xffffffec
  ap = (uint*)(void*)&fmt + 1;
     be0:	e28b3008 	add	r3, fp, #8
     be4:	e50b3018 	str	r3, [fp, #-24]	@ 0xffffffe8
  for(i = 0; fmt[i]; i++){
     be8:	e3a03000 	mov	r3, #0
     bec:	e50b3010 	str	r3, [fp, #-16]
     bf0:	ea000075 	b	dcc <printf+0x208>
    c = fmt[i] & 0xff;
     bf4:	e59b2004 	ldr	r2, [fp, #4]
     bf8:	e51b3010 	ldr	r3, [fp, #-16]
     bfc:	e0823003 	add	r3, r2, r3
     c00:	e5d33000 	ldrb	r3, [r3]
     c04:	e50b301c 	str	r3, [fp, #-28]	@ 0xffffffe4
    if(state == 0){
     c08:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
     c0c:	e3530000 	cmp	r3, #0
     c10:	1a00000b 	bne	c44 <printf+0x80>
      if(c == '%'){
     c14:	e51b301c 	ldr	r3, [fp, #-28]	@ 0xffffffe4
     c18:	e3530025 	cmp	r3, #37	@ 0x25
     c1c:	1a000002 	bne	c2c <printf+0x68>
        state = '%';
     c20:	e3a03025 	mov	r3, #37	@ 0x25
     c24:	e50b3014 	str	r3, [fp, #-20]	@ 0xffffffec
     c28:	ea000064 	b	dc0 <printf+0x1fc>
      } else {
        putc(fd, c);
     c2c:	e51b301c 	ldr	r3, [fp, #-28]	@ 0xffffffe4
     c30:	e6ef3073 	uxtb	r3, r3
     c34:	e1a01003 	mov	r1, r3
     c38:	e51b0024 	ldr	r0, [fp, #-36]	@ 0xffffffdc
     c3c:	ebffff53 	bl	990 <putc>
     c40:	ea00005e 	b	dc0 <printf+0x1fc>
      }
    } else if(state == '%'){
     c44:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
     c48:	e3530025 	cmp	r3, #37	@ 0x25
     c4c:	1a00005b 	bne	dc0 <printf+0x1fc>
      if(c == 'd'){
     c50:	e51b301c 	ldr	r3, [fp, #-28]	@ 0xffffffe4
     c54:	e3530064 	cmp	r3, #100	@ 0x64
     c58:	1a00000a 	bne	c88 <printf+0xc4>
        printint(fd, *ap, 10, 1);
     c5c:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
     c60:	e5933000 	ldr	r3, [r3]
     c64:	e1a01003 	mov	r1, r3
     c68:	e3a03001 	mov	r3, #1
     c6c:	e3a0200a 	mov	r2, #10
     c70:	e51b0024 	ldr	r0, [fp, #-36]	@ 0xffffffdc
     c74:	ebffff83 	bl	a88 <printint>
        ap++;
     c78:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
     c7c:	e2833004 	add	r3, r3, #4
     c80:	e50b3018 	str	r3, [fp, #-24]	@ 0xffffffe8
     c84:	ea00004b 	b	db8 <printf+0x1f4>
      } else if(c == 'x' || c == 'p'){
     c88:	e51b301c 	ldr	r3, [fp, #-28]	@ 0xffffffe4
     c8c:	e3530078 	cmp	r3, #120	@ 0x78
     c90:	0a000002 	beq	ca0 <printf+0xdc>
     c94:	e51b301c 	ldr	r3, [fp, #-28]	@ 0xffffffe4
     c98:	e3530070 	cmp	r3, #112	@ 0x70
     c9c:	1a00000a 	bne	ccc <printf+0x108>
        printint(fd, *ap, 16, 0);
     ca0:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
     ca4:	e5933000 	ldr	r3, [r3]
     ca8:	e1a01003 	mov	r1, r3
     cac:	e3a03000 	mov	r3, #0
     cb0:	e3a02010 	mov	r2, #16
     cb4:	e51b0024 	ldr	r0, [fp, #-36]	@ 0xffffffdc
     cb8:	ebffff72 	bl	a88 <printint>
        ap++;
     cbc:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
     cc0:	e2833004 	add	r3, r3, #4
     cc4:	e50b3018 	str	r3, [fp, #-24]	@ 0xffffffe8
     cc8:	ea00003a 	b	db8 <printf+0x1f4>
      } else if(c == 's'){
     ccc:	e51b301c 	ldr	r3, [fp, #-28]	@ 0xffffffe4
     cd0:	e3530073 	cmp	r3, #115	@ 0x73
     cd4:	1a000019 	bne	d40 <printf+0x17c>
        s = (char*)*ap;
     cd8:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
     cdc:	e5933000 	ldr	r3, [r3]
     ce0:	e50b300c 	str	r3, [fp, #-12]
        ap++;
     ce4:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
     ce8:	e2833004 	add	r3, r3, #4
     cec:	e50b3018 	str	r3, [fp, #-24]	@ 0xffffffe8
        if(s == 0)
     cf0:	e51b300c 	ldr	r3, [fp, #-12]
     cf4:	e3530000 	cmp	r3, #0
     cf8:	1a00000b 	bne	d2c <printf+0x168>
          s = "(null)";
     cfc:	e30131b0 	movw	r3, #4528	@ 0x11b0
     d00:	e3403000 	movt	r3, #0
     d04:	e50b300c 	str	r3, [fp, #-12]
        while(*s != 0){
     d08:	ea000007 	b	d2c <printf+0x168>
          putc(fd, *s);
     d0c:	e51b300c 	ldr	r3, [fp, #-12]
     d10:	e5d33000 	ldrb	r3, [r3]
     d14:	e1a01003 	mov	r1, r3
     d18:	e51b0024 	ldr	r0, [fp, #-36]	@ 0xffffffdc
     d1c:	ebffff1b 	bl	990 <putc>
          s++;
     d20:	e51b300c 	ldr	r3, [fp, #-12]
     d24:	e2833001 	add	r3, r3, #1
     d28:	e50b300c 	str	r3, [fp, #-12]
        while(*s != 0){
     d2c:	e51b300c 	ldr	r3, [fp, #-12]
     d30:	e5d33000 	ldrb	r3, [r3]
     d34:	e3530000 	cmp	r3, #0
     d38:	1afffff3 	bne	d0c <printf+0x148>
     d3c:	ea00001d 	b	db8 <printf+0x1f4>
        }
      } else if(c == 'c'){
     d40:	e51b301c 	ldr	r3, [fp, #-28]	@ 0xffffffe4
     d44:	e3530063 	cmp	r3, #99	@ 0x63
     d48:	1a000009 	bne	d74 <printf+0x1b0>
        putc(fd, *ap);
     d4c:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
     d50:	e5933000 	ldr	r3, [r3]
     d54:	e6ef3073 	uxtb	r3, r3
     d58:	e1a01003 	mov	r1, r3
     d5c:	e51b0024 	ldr	r0, [fp, #-36]	@ 0xffffffdc
     d60:	ebffff0a 	bl	990 <putc>
        ap++;
     d64:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
     d68:	e2833004 	add	r3, r3, #4
     d6c:	e50b3018 	str	r3, [fp, #-24]	@ 0xffffffe8
     d70:	ea000010 	b	db8 <printf+0x1f4>
      } else if(c == '%'){
     d74:	e51b301c 	ldr	r3, [fp, #-28]	@ 0xffffffe4
     d78:	e3530025 	cmp	r3, #37	@ 0x25
     d7c:	1a000005 	bne	d98 <printf+0x1d4>
        putc(fd, c);
     d80:	e51b301c 	ldr	r3, [fp, #-28]	@ 0xffffffe4
     d84:	e6ef3073 	uxtb	r3, r3
     d88:	e1a01003 	mov	r1, r3
     d8c:	e51b0024 	ldr	r0, [fp, #-36]	@ 0xffffffdc
     d90:	ebfffefe 	bl	990 <putc>
     d94:	ea000007 	b	db8 <printf+0x1f4>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
     d98:	e3a01025 	mov	r1, #37	@ 0x25
     d9c:	e51b0024 	ldr	r0, [fp, #-36]	@ 0xffffffdc
     da0:	ebfffefa 	bl	990 <putc>
        putc(fd, c);
     da4:	e51b301c 	ldr	r3, [fp, #-28]	@ 0xffffffe4
     da8:	e6ef3073 	uxtb	r3, r3
     dac:	e1a01003 	mov	r1, r3
     db0:	e51b0024 	ldr	r0, [fp, #-36]	@ 0xffffffdc
     db4:	ebfffef5 	bl	990 <putc>
      }
      state = 0;
     db8:	e3a03000 	mov	r3, #0
     dbc:	e50b3014 	str	r3, [fp, #-20]	@ 0xffffffec
  for(i = 0; fmt[i]; i++){
     dc0:	e51b3010 	ldr	r3, [fp, #-16]
     dc4:	e2833001 	add	r3, r3, #1
     dc8:	e50b3010 	str	r3, [fp, #-16]
     dcc:	e59b2004 	ldr	r2, [fp, #4]
     dd0:	e51b3010 	ldr	r3, [fp, #-16]
     dd4:	e0823003 	add	r3, r2, r3
     dd8:	e5d33000 	ldrb	r3, [r3]
     ddc:	e3530000 	cmp	r3, #0
     de0:	1affff83 	bne	bf4 <printf+0x30>
    }
  }
}
     de4:	e320f000 	nop	{0}
     de8:	e320f000 	nop	{0}
     dec:	e24bd004 	sub	sp, fp, #4
     df0:	e8bd4800 	pop	{fp, lr}
     df4:	e28dd00c 	add	sp, sp, #12
     df8:	e12fff1e 	bx	lr

00000dfc <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
     dfc:	e52db004 	push	{fp}		@ (str fp, [sp, #-4]!)
     e00:	e28db000 	add	fp, sp, #0
     e04:	e24dd014 	sub	sp, sp, #20
     e08:	e50b0010 	str	r0, [fp, #-16]
  Header *bp, *p;

  bp = (Header*)ap - 1;
     e0c:	e51b3010 	ldr	r3, [fp, #-16]
     e10:	e2433008 	sub	r3, r3, #8
     e14:	e50b300c 	str	r3, [fp, #-12]
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
     e18:	e30133d4 	movw	r3, #5076	@ 0x13d4
     e1c:	e3403000 	movt	r3, #0
     e20:	e5933000 	ldr	r3, [r3]
     e24:	e50b3008 	str	r3, [fp, #-8]
     e28:	ea000010 	b	e70 <free+0x74>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
     e2c:	e51b3008 	ldr	r3, [fp, #-8]
     e30:	e5933000 	ldr	r3, [r3]
     e34:	e51b2008 	ldr	r2, [fp, #-8]
     e38:	e1520003 	cmp	r2, r3
     e3c:	3a000008 	bcc	e64 <free+0x68>
     e40:	e51b200c 	ldr	r2, [fp, #-12]
     e44:	e51b3008 	ldr	r3, [fp, #-8]
     e48:	e1520003 	cmp	r2, r3
     e4c:	8a000010 	bhi	e94 <free+0x98>
     e50:	e51b3008 	ldr	r3, [fp, #-8]
     e54:	e5933000 	ldr	r3, [r3]
     e58:	e51b200c 	ldr	r2, [fp, #-12]
     e5c:	e1520003 	cmp	r2, r3
     e60:	3a00000b 	bcc	e94 <free+0x98>
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
     e64:	e51b3008 	ldr	r3, [fp, #-8]
     e68:	e5933000 	ldr	r3, [r3]
     e6c:	e50b3008 	str	r3, [fp, #-8]
     e70:	e51b200c 	ldr	r2, [fp, #-12]
     e74:	e51b3008 	ldr	r3, [fp, #-8]
     e78:	e1520003 	cmp	r2, r3
     e7c:	9affffea 	bls	e2c <free+0x30>
     e80:	e51b3008 	ldr	r3, [fp, #-8]
     e84:	e5933000 	ldr	r3, [r3]
     e88:	e51b200c 	ldr	r2, [fp, #-12]
     e8c:	e1520003 	cmp	r2, r3
     e90:	2affffe5 	bcs	e2c <free+0x30>
      break;
  if(bp + bp->s.size == p->s.ptr){
     e94:	e51b300c 	ldr	r3, [fp, #-12]
     e98:	e5933004 	ldr	r3, [r3, #4]
     e9c:	e1a03183 	lsl	r3, r3, #3
     ea0:	e51b200c 	ldr	r2, [fp, #-12]
     ea4:	e0822003 	add	r2, r2, r3
     ea8:	e51b3008 	ldr	r3, [fp, #-8]
     eac:	e5933000 	ldr	r3, [r3]
     eb0:	e1520003 	cmp	r2, r3
     eb4:	1a00000d 	bne	ef0 <free+0xf4>
    bp->s.size += p->s.ptr->s.size;
     eb8:	e51b300c 	ldr	r3, [fp, #-12]
     ebc:	e5932004 	ldr	r2, [r3, #4]
     ec0:	e51b3008 	ldr	r3, [fp, #-8]
     ec4:	e5933000 	ldr	r3, [r3]
     ec8:	e5933004 	ldr	r3, [r3, #4]
     ecc:	e0822003 	add	r2, r2, r3
     ed0:	e51b300c 	ldr	r3, [fp, #-12]
     ed4:	e5832004 	str	r2, [r3, #4]
    bp->s.ptr = p->s.ptr->s.ptr;
     ed8:	e51b3008 	ldr	r3, [fp, #-8]
     edc:	e5933000 	ldr	r3, [r3]
     ee0:	e5932000 	ldr	r2, [r3]
     ee4:	e51b300c 	ldr	r3, [fp, #-12]
     ee8:	e5832000 	str	r2, [r3]
     eec:	ea000003 	b	f00 <free+0x104>
  } else
    bp->s.ptr = p->s.ptr;
     ef0:	e51b3008 	ldr	r3, [fp, #-8]
     ef4:	e5932000 	ldr	r2, [r3]
     ef8:	e51b300c 	ldr	r3, [fp, #-12]
     efc:	e5832000 	str	r2, [r3]
  if(p + p->s.size == bp){
     f00:	e51b3008 	ldr	r3, [fp, #-8]
     f04:	e5933004 	ldr	r3, [r3, #4]
     f08:	e1a03183 	lsl	r3, r3, #3
     f0c:	e51b2008 	ldr	r2, [fp, #-8]
     f10:	e0823003 	add	r3, r2, r3
     f14:	e51b200c 	ldr	r2, [fp, #-12]
     f18:	e1520003 	cmp	r2, r3
     f1c:	1a00000b 	bne	f50 <free+0x154>
    p->s.size += bp->s.size;
     f20:	e51b3008 	ldr	r3, [fp, #-8]
     f24:	e5932004 	ldr	r2, [r3, #4]
     f28:	e51b300c 	ldr	r3, [fp, #-12]
     f2c:	e5933004 	ldr	r3, [r3, #4]
     f30:	e0822003 	add	r2, r2, r3
     f34:	e51b3008 	ldr	r3, [fp, #-8]
     f38:	e5832004 	str	r2, [r3, #4]
    p->s.ptr = bp->s.ptr;
     f3c:	e51b300c 	ldr	r3, [fp, #-12]
     f40:	e5932000 	ldr	r2, [r3]
     f44:	e51b3008 	ldr	r3, [fp, #-8]
     f48:	e5832000 	str	r2, [r3]
     f4c:	ea000002 	b	f5c <free+0x160>
  } else
    p->s.ptr = bp;
     f50:	e51b3008 	ldr	r3, [fp, #-8]
     f54:	e51b200c 	ldr	r2, [fp, #-12]
     f58:	e5832000 	str	r2, [r3]
  freep = p;
     f5c:	e30133d4 	movw	r3, #5076	@ 0x13d4
     f60:	e3403000 	movt	r3, #0
     f64:	e51b2008 	ldr	r2, [fp, #-8]
     f68:	e5832000 	str	r2, [r3]
}
     f6c:	e320f000 	nop	{0}
     f70:	e28bd000 	add	sp, fp, #0
     f74:	e49db004 	pop	{fp}		@ (ldr fp, [sp], #4)
     f78:	e12fff1e 	bx	lr

00000f7c <morecore>:

static Header*
morecore(uint nu)
{
     f7c:	e92d4800 	push	{fp, lr}
     f80:	e28db004 	add	fp, sp, #4
     f84:	e24dd010 	sub	sp, sp, #16
     f88:	e50b0010 	str	r0, [fp, #-16]
  char *p;
  Header *hp;

  if(nu < 4096)
     f8c:	e51b3010 	ldr	r3, [fp, #-16]
     f90:	e3530a01 	cmp	r3, #4096	@ 0x1000
     f94:	2a000001 	bcs	fa0 <morecore+0x24>
    nu = 4096;
     f98:	e3a03a01 	mov	r3, #4096	@ 0x1000
     f9c:	e50b3010 	str	r3, [fp, #-16]
  p = sbrk(nu * sizeof(Header));
     fa0:	e51b3010 	ldr	r3, [fp, #-16]
     fa4:	e1a03183 	lsl	r3, r3, #3
     fa8:	e1a00003 	mov	r0, r3
     fac:	ebfffe50 	bl	8f4 <sbrk>
     fb0:	e50b0008 	str	r0, [fp, #-8]
  if(p == (char*)-1)
     fb4:	e51b3008 	ldr	r3, [fp, #-8]
     fb8:	e3730001 	cmn	r3, #1
     fbc:	1a000001 	bne	fc8 <morecore+0x4c>
    return 0;
     fc0:	e3a03000 	mov	r3, #0
     fc4:	ea00000b 	b	ff8 <morecore+0x7c>
  hp = (Header*)p;
     fc8:	e51b3008 	ldr	r3, [fp, #-8]
     fcc:	e50b300c 	str	r3, [fp, #-12]
  hp->s.size = nu;
     fd0:	e51b300c 	ldr	r3, [fp, #-12]
     fd4:	e51b2010 	ldr	r2, [fp, #-16]
     fd8:	e5832004 	str	r2, [r3, #4]
  free((void*)(hp + 1));
     fdc:	e51b300c 	ldr	r3, [fp, #-12]
     fe0:	e2833008 	add	r3, r3, #8
     fe4:	e1a00003 	mov	r0, r3
     fe8:	ebffff83 	bl	dfc <free>
  return freep;
     fec:	e30133d4 	movw	r3, #5076	@ 0x13d4
     ff0:	e3403000 	movt	r3, #0
     ff4:	e5933000 	ldr	r3, [r3]
}
     ff8:	e1a00003 	mov	r0, r3
     ffc:	e24bd004 	sub	sp, fp, #4
    1000:	e8bd8800 	pop	{fp, pc}

00001004 <malloc>:

void*
malloc(uint nbytes)
{
    1004:	e92d4800 	push	{fp, lr}
    1008:	e28db004 	add	fp, sp, #4
    100c:	e24dd018 	sub	sp, sp, #24
    1010:	e50b0018 	str	r0, [fp, #-24]	@ 0xffffffe8
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1014:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
    1018:	e2833007 	add	r3, r3, #7
    101c:	e1a031a3 	lsr	r3, r3, #3
    1020:	e2833001 	add	r3, r3, #1
    1024:	e50b3010 	str	r3, [fp, #-16]
  if((prevp = freep) == 0){
    1028:	e30133d4 	movw	r3, #5076	@ 0x13d4
    102c:	e3403000 	movt	r3, #0
    1030:	e5933000 	ldr	r3, [r3]
    1034:	e50b300c 	str	r3, [fp, #-12]
    1038:	e51b300c 	ldr	r3, [fp, #-12]
    103c:	e3530000 	cmp	r3, #0
    1040:	1a000010 	bne	1088 <malloc+0x84>
    base.s.ptr = freep = prevp = &base;
    1044:	e30133cc 	movw	r3, #5068	@ 0x13cc
    1048:	e3403000 	movt	r3, #0
    104c:	e50b300c 	str	r3, [fp, #-12]
    1050:	e30133d4 	movw	r3, #5076	@ 0x13d4
    1054:	e3403000 	movt	r3, #0
    1058:	e51b200c 	ldr	r2, [fp, #-12]
    105c:	e5832000 	str	r2, [r3]
    1060:	e30133d4 	movw	r3, #5076	@ 0x13d4
    1064:	e3403000 	movt	r3, #0
    1068:	e5932000 	ldr	r2, [r3]
    106c:	e30133cc 	movw	r3, #5068	@ 0x13cc
    1070:	e3403000 	movt	r3, #0
    1074:	e5832000 	str	r2, [r3]
    base.s.size = 0;
    1078:	e30133cc 	movw	r3, #5068	@ 0x13cc
    107c:	e3403000 	movt	r3, #0
    1080:	e3a02000 	mov	r2, #0
    1084:	e5832004 	str	r2, [r3, #4]
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1088:	e51b300c 	ldr	r3, [fp, #-12]
    108c:	e5933000 	ldr	r3, [r3]
    1090:	e50b3008 	str	r3, [fp, #-8]
    if(p->s.size >= nunits){
    1094:	e51b3008 	ldr	r3, [fp, #-8]
    1098:	e5933004 	ldr	r3, [r3, #4]
    109c:	e51b2010 	ldr	r2, [fp, #-16]
    10a0:	e1520003 	cmp	r2, r3
    10a4:	8a00001f 	bhi	1128 <malloc+0x124>
      if(p->s.size == nunits)
    10a8:	e51b3008 	ldr	r3, [fp, #-8]
    10ac:	e5933004 	ldr	r3, [r3, #4]
    10b0:	e51b2010 	ldr	r2, [fp, #-16]
    10b4:	e1520003 	cmp	r2, r3
    10b8:	1a000004 	bne	10d0 <malloc+0xcc>
        prevp->s.ptr = p->s.ptr;
    10bc:	e51b3008 	ldr	r3, [fp, #-8]
    10c0:	e5932000 	ldr	r2, [r3]
    10c4:	e51b300c 	ldr	r3, [fp, #-12]
    10c8:	e5832000 	str	r2, [r3]
    10cc:	ea00000e 	b	110c <malloc+0x108>
      else {
        p->s.size -= nunits;
    10d0:	e51b3008 	ldr	r3, [fp, #-8]
    10d4:	e5932004 	ldr	r2, [r3, #4]
    10d8:	e51b3010 	ldr	r3, [fp, #-16]
    10dc:	e0422003 	sub	r2, r2, r3
    10e0:	e51b3008 	ldr	r3, [fp, #-8]
    10e4:	e5832004 	str	r2, [r3, #4]
        p += p->s.size;
    10e8:	e51b3008 	ldr	r3, [fp, #-8]
    10ec:	e5933004 	ldr	r3, [r3, #4]
    10f0:	e1a03183 	lsl	r3, r3, #3
    10f4:	e51b2008 	ldr	r2, [fp, #-8]
    10f8:	e0823003 	add	r3, r2, r3
    10fc:	e50b3008 	str	r3, [fp, #-8]
        p->s.size = nunits;
    1100:	e51b3008 	ldr	r3, [fp, #-8]
    1104:	e51b2010 	ldr	r2, [fp, #-16]
    1108:	e5832004 	str	r2, [r3, #4]
      }
      freep = prevp;
    110c:	e30133d4 	movw	r3, #5076	@ 0x13d4
    1110:	e3403000 	movt	r3, #0
    1114:	e51b200c 	ldr	r2, [fp, #-12]
    1118:	e5832000 	str	r2, [r3]
      return (void*)(p + 1);
    111c:	e51b3008 	ldr	r3, [fp, #-8]
    1120:	e2833008 	add	r3, r3, #8
    1124:	ea000013 	b	1178 <malloc+0x174>
    }
    if(p == freep)
    1128:	e30133d4 	movw	r3, #5076	@ 0x13d4
    112c:	e3403000 	movt	r3, #0
    1130:	e5933000 	ldr	r3, [r3]
    1134:	e51b2008 	ldr	r2, [fp, #-8]
    1138:	e1520003 	cmp	r2, r3
    113c:	1a000007 	bne	1160 <malloc+0x15c>
      if((p = morecore(nunits)) == 0)
    1140:	e51b0010 	ldr	r0, [fp, #-16]
    1144:	ebffff8c 	bl	f7c <morecore>
    1148:	e50b0008 	str	r0, [fp, #-8]
    114c:	e51b3008 	ldr	r3, [fp, #-8]
    1150:	e3530000 	cmp	r3, #0
    1154:	1a000001 	bne	1160 <malloc+0x15c>
        return 0;
    1158:	e3a03000 	mov	r3, #0
    115c:	ea000005 	b	1178 <malloc+0x174>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1160:	e51b3008 	ldr	r3, [fp, #-8]
    1164:	e50b300c 	str	r3, [fp, #-12]
    1168:	e51b3008 	ldr	r3, [fp, #-8]
    116c:	e5933000 	ldr	r3, [r3]
    1170:	e50b3008 	str	r3, [fp, #-8]
    if(p->s.size >= nunits){
    1174:	eaffffc6 	b	1094 <malloc+0x90>
  }
}
    1178:	e1a00003 	mov	r0, r3
    117c:	e24bd004 	sub	sp, fp, #4
    1180:	e8bd8800 	pop	{fp, pc}
