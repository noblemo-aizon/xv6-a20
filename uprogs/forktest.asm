
_forktest:     file format elf32-littlearm


Disassembly of section .text:

00000000 <printf>:

#define N  1000

void
printf(int fd, char *s, ...)
{
   0:	e92d000e 	push	{r1, r2, r3}
   4:	e92d4800 	push	{fp, lr}
   8:	e28db004 	add	fp, sp, #4
   c:	e24dd00c 	sub	sp, sp, #12
  10:	e50b000c 	str	r0, [fp, #-12]
  write(fd, s, strlen(s));
  14:	e59b0004 	ldr	r0, [fp, #4]
  18:	eb000088 	bl	240 <strlen>
  1c:	e1a03000 	mov	r3, r0
  20:	e1a02003 	mov	r2, r3
  24:	e59b1004 	ldr	r1, [fp, #4]
  28:	e51b000c 	ldr	r0, [fp, #-12]
  2c:	eb000190 	bl	674 <write>
}
  30:	e320f000 	nop	{0}
  34:	e24bd004 	sub	sp, fp, #4
  38:	e8bd4800 	pop	{fp, lr}
  3c:	e28dd00c 	add	sp, sp, #12
  40:	e12fff1e 	bx	lr

00000044 <forktest>:

void
forktest(void)
{
  44:	e92d4800 	push	{fp, lr}
  48:	e28db004 	add	fp, sp, #4
  4c:	e24dd008 	sub	sp, sp, #8
  int n, pid;

  printf(1, "fork test\n");
  50:	e30019b4 	movw	r1, #2484	@ 0x9b4
  54:	e3401000 	movt	r1, #0
  58:	e3a00001 	mov	r0, #1
  5c:	ebffffe7 	bl	0 <printf>

  for(n=0; n<N; n++){
  60:	e3a03000 	mov	r3, #0
  64:	e50b3008 	str	r3, [fp, #-8]
  68:	ea00000b 	b	9c <forktest+0x58>
    pid = fork();
  6c:	eb00013f 	bl	570 <fork>
  70:	e50b000c 	str	r0, [fp, #-12]
    if(pid < 0)
  74:	e51b300c 	ldr	r3, [fp, #-12]
  78:	e3530000 	cmp	r3, #0
  7c:	ba00000a 	blt	ac <forktest+0x68>
      break;
    if(pid == 0)
  80:	e51b300c 	ldr	r3, [fp, #-12]
  84:	e3530000 	cmp	r3, #0
  88:	1a000000 	bne	90 <forktest+0x4c>
      exit();
  8c:	eb000144 	bl	5a4 <exit>
  for(n=0; n<N; n++){
  90:	e51b3008 	ldr	r3, [fp, #-8]
  94:	e2833001 	add	r3, r3, #1
  98:	e50b3008 	str	r3, [fp, #-8]
  9c:	e51b3008 	ldr	r3, [fp, #-8]
  a0:	e3530ffa 	cmp	r3, #1000	@ 0x3e8
  a4:	bafffff0 	blt	6c <forktest+0x28>
  a8:	ea000000 	b	b0 <forktest+0x6c>
      break;
  ac:	e320f000 	nop	{0}
  }
  
  if(n == N){
  b0:	e51b3008 	ldr	r3, [fp, #-8]
  b4:	e3530ffa 	cmp	r3, #1000	@ 0x3e8
  b8:	1a000011 	bne	104 <forktest+0xc0>
    printf(1, "fork claimed to work N times!\n", N);
  bc:	e3a02ffa 	mov	r2, #1000	@ 0x3e8
  c0:	e30019c0 	movw	r1, #2496	@ 0x9c0
  c4:	e3401000 	movt	r1, #0
  c8:	e3a00001 	mov	r0, #1
  cc:	ebffffcb 	bl	0 <printf>
    exit();
  d0:	eb000133 	bl	5a4 <exit>
  }
  
  for(; n > 0; n--){
    if(wait() < 0){
  d4:	eb00013f 	bl	5d8 <wait>
  d8:	e1a03000 	mov	r3, r0
  dc:	e3530000 	cmp	r3, #0
  e0:	aa000004 	bge	f8 <forktest+0xb4>
      printf(1, "wait stopped early\n");
  e4:	e30019e0 	movw	r1, #2528	@ 0x9e0
  e8:	e3401000 	movt	r1, #0
  ec:	e3a00001 	mov	r0, #1
  f0:	ebffffc2 	bl	0 <printf>
      exit();
  f4:	eb00012a 	bl	5a4 <exit>
  for(; n > 0; n--){
  f8:	e51b3008 	ldr	r3, [fp, #-8]
  fc:	e2433001 	sub	r3, r3, #1
 100:	e50b3008 	str	r3, [fp, #-8]
 104:	e51b3008 	ldr	r3, [fp, #-8]
 108:	e3530000 	cmp	r3, #0
 10c:	cafffff0 	bgt	d4 <forktest+0x90>
    }
  }
  
  if(wait() != -1){
 110:	eb000130 	bl	5d8 <wait>
 114:	e1a03000 	mov	r3, r0
 118:	e3730001 	cmn	r3, #1
 11c:	0a000004 	beq	134 <forktest+0xf0>
    printf(1, "wait got too many\n");
 120:	e30019f4 	movw	r1, #2548	@ 0x9f4
 124:	e3401000 	movt	r1, #0
 128:	e3a00001 	mov	r0, #1
 12c:	ebffffb3 	bl	0 <printf>
    exit();
 130:	eb00011b 	bl	5a4 <exit>
  }
  
  printf(1, "fork test OK\n");
 134:	e3001a08 	movw	r1, #2568	@ 0xa08
 138:	e3401000 	movt	r1, #0
 13c:	e3a00001 	mov	r0, #1
 140:	ebffffae 	bl	0 <printf>
}
 144:	e320f000 	nop	{0}
 148:	e24bd004 	sub	sp, fp, #4
 14c:	e8bd8800 	pop	{fp, pc}

00000150 <main>:

int
main(void)
{
 150:	e92d4800 	push	{fp, lr}
 154:	e28db004 	add	fp, sp, #4
  forktest();
 158:	ebffffb9 	bl	44 <forktest>
  exit();
 15c:	eb000110 	bl	5a4 <exit>

00000160 <strcpy>:
#include "user.h"
#include "arm.h"

char*
strcpy(char *s, char *t)
{
 160:	e52db004 	push	{fp}		@ (str fp, [sp, #-4]!)
 164:	e28db000 	add	fp, sp, #0
 168:	e24dd014 	sub	sp, sp, #20
 16c:	e50b0010 	str	r0, [fp, #-16]
 170:	e50b1014 	str	r1, [fp, #-20]	@ 0xffffffec
  char *os;

  os = s;
 174:	e51b3010 	ldr	r3, [fp, #-16]
 178:	e50b3008 	str	r3, [fp, #-8]
  while((*s++ = *t++) != 0)
 17c:	e320f000 	nop	{0}
 180:	e51b2014 	ldr	r2, [fp, #-20]	@ 0xffffffec
 184:	e2823001 	add	r3, r2, #1
 188:	e50b3014 	str	r3, [fp, #-20]	@ 0xffffffec
 18c:	e51b3010 	ldr	r3, [fp, #-16]
 190:	e2831001 	add	r1, r3, #1
 194:	e50b1010 	str	r1, [fp, #-16]
 198:	e5d22000 	ldrb	r2, [r2]
 19c:	e5c32000 	strb	r2, [r3]
 1a0:	e5d33000 	ldrb	r3, [r3]
 1a4:	e3530000 	cmp	r3, #0
 1a8:	1afffff4 	bne	180 <strcpy+0x20>
    ;
  return os;
 1ac:	e51b3008 	ldr	r3, [fp, #-8]
}
 1b0:	e1a00003 	mov	r0, r3
 1b4:	e28bd000 	add	sp, fp, #0
 1b8:	e49db004 	pop	{fp}		@ (ldr fp, [sp], #4)
 1bc:	e12fff1e 	bx	lr

000001c0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 1c0:	e52db004 	push	{fp}		@ (str fp, [sp, #-4]!)
 1c4:	e28db000 	add	fp, sp, #0
 1c8:	e24dd00c 	sub	sp, sp, #12
 1cc:	e50b0008 	str	r0, [fp, #-8]
 1d0:	e50b100c 	str	r1, [fp, #-12]
  while(*p && *p == *q)
 1d4:	ea000005 	b	1f0 <strcmp+0x30>
    p++, q++;
 1d8:	e51b3008 	ldr	r3, [fp, #-8]
 1dc:	e2833001 	add	r3, r3, #1
 1e0:	e50b3008 	str	r3, [fp, #-8]
 1e4:	e51b300c 	ldr	r3, [fp, #-12]
 1e8:	e2833001 	add	r3, r3, #1
 1ec:	e50b300c 	str	r3, [fp, #-12]
  while(*p && *p == *q)
 1f0:	e51b3008 	ldr	r3, [fp, #-8]
 1f4:	e5d33000 	ldrb	r3, [r3]
 1f8:	e3530000 	cmp	r3, #0
 1fc:	0a000005 	beq	218 <strcmp+0x58>
 200:	e51b3008 	ldr	r3, [fp, #-8]
 204:	e5d32000 	ldrb	r2, [r3]
 208:	e51b300c 	ldr	r3, [fp, #-12]
 20c:	e5d33000 	ldrb	r3, [r3]
 210:	e1520003 	cmp	r2, r3
 214:	0affffef 	beq	1d8 <strcmp+0x18>
  return (uchar)*p - (uchar)*q;
 218:	e51b3008 	ldr	r3, [fp, #-8]
 21c:	e5d33000 	ldrb	r3, [r3]
 220:	e1a02003 	mov	r2, r3
 224:	e51b300c 	ldr	r3, [fp, #-12]
 228:	e5d33000 	ldrb	r3, [r3]
 22c:	e0423003 	sub	r3, r2, r3
}
 230:	e1a00003 	mov	r0, r3
 234:	e28bd000 	add	sp, fp, #0
 238:	e49db004 	pop	{fp}		@ (ldr fp, [sp], #4)
 23c:	e12fff1e 	bx	lr

00000240 <strlen>:

uint
strlen(char *s)
{
 240:	e52db004 	push	{fp}		@ (str fp, [sp, #-4]!)
 244:	e28db000 	add	fp, sp, #0
 248:	e24dd014 	sub	sp, sp, #20
 24c:	e50b0010 	str	r0, [fp, #-16]
  int n;

  for(n = 0; s[n]; n++)
 250:	e3a03000 	mov	r3, #0
 254:	e50b3008 	str	r3, [fp, #-8]
 258:	ea000002 	b	268 <strlen+0x28>
 25c:	e51b3008 	ldr	r3, [fp, #-8]
 260:	e2833001 	add	r3, r3, #1
 264:	e50b3008 	str	r3, [fp, #-8]
 268:	e51b3008 	ldr	r3, [fp, #-8]
 26c:	e51b2010 	ldr	r2, [fp, #-16]
 270:	e0823003 	add	r3, r2, r3
 274:	e5d33000 	ldrb	r3, [r3]
 278:	e3530000 	cmp	r3, #0
 27c:	1afffff6 	bne	25c <strlen+0x1c>
    ;
  return n;
 280:	e51b3008 	ldr	r3, [fp, #-8]
}
 284:	e1a00003 	mov	r0, r3
 288:	e28bd000 	add	sp, fp, #0
 28c:	e49db004 	pop	{fp}		@ (ldr fp, [sp], #4)
 290:	e12fff1e 	bx	lr

00000294 <memset>:

void*
memset(void *dst, int c, uint n)
{
 294:	e52db004 	push	{fp}		@ (str fp, [sp, #-4]!)
 298:	e28db000 	add	fp, sp, #0
 29c:	e24dd01c 	sub	sp, sp, #28
 2a0:	e50b0010 	str	r0, [fp, #-16]
 2a4:	e50b1014 	str	r1, [fp, #-20]	@ 0xffffffec
 2a8:	e50b2018 	str	r2, [fp, #-24]	@ 0xffffffe8
  char *p=dst;
 2ac:	e51b3010 	ldr	r3, [fp, #-16]
 2b0:	e50b3008 	str	r3, [fp, #-8]
  u32 rc=n;
 2b4:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
 2b8:	e50b300c 	str	r3, [fp, #-12]

  while (rc-- > 0) *p++ = c;
 2bc:	ea000005 	b	2d8 <memset+0x44>
 2c0:	e51b3008 	ldr	r3, [fp, #-8]
 2c4:	e2832001 	add	r2, r3, #1
 2c8:	e50b2008 	str	r2, [fp, #-8]
 2cc:	e51b2014 	ldr	r2, [fp, #-20]	@ 0xffffffec
 2d0:	e6ef2072 	uxtb	r2, r2
 2d4:	e5c32000 	strb	r2, [r3]
 2d8:	e51b300c 	ldr	r3, [fp, #-12]
 2dc:	e2432001 	sub	r2, r3, #1
 2e0:	e50b200c 	str	r2, [fp, #-12]
 2e4:	e3530000 	cmp	r3, #0
 2e8:	1afffff4 	bne	2c0 <memset+0x2c>
  return (void *)p;
 2ec:	e51b3008 	ldr	r3, [fp, #-8]
}
 2f0:	e1a00003 	mov	r0, r3
 2f4:	e28bd000 	add	sp, fp, #0
 2f8:	e49db004 	pop	{fp}		@ (ldr fp, [sp], #4)
 2fc:	e12fff1e 	bx	lr

00000300 <strchr>:

char*
strchr(const char *s, char c)
{
 300:	e52db004 	push	{fp}		@ (str fp, [sp, #-4]!)
 304:	e28db000 	add	fp, sp, #0
 308:	e24dd00c 	sub	sp, sp, #12
 30c:	e50b0008 	str	r0, [fp, #-8]
 310:	e1a03001 	mov	r3, r1
 314:	e54b3009 	strb	r3, [fp, #-9]
  for(; *s; s++)
 318:	ea000009 	b	344 <strchr+0x44>
    if(*s == c)
 31c:	e51b3008 	ldr	r3, [fp, #-8]
 320:	e5d33000 	ldrb	r3, [r3]
 324:	e55b2009 	ldrb	r2, [fp, #-9]
 328:	e1520003 	cmp	r2, r3
 32c:	1a000001 	bne	338 <strchr+0x38>
      return (char*)s;
 330:	e51b3008 	ldr	r3, [fp, #-8]
 334:	ea000007 	b	358 <strchr+0x58>
  for(; *s; s++)
 338:	e51b3008 	ldr	r3, [fp, #-8]
 33c:	e2833001 	add	r3, r3, #1
 340:	e50b3008 	str	r3, [fp, #-8]
 344:	e51b3008 	ldr	r3, [fp, #-8]
 348:	e5d33000 	ldrb	r3, [r3]
 34c:	e3530000 	cmp	r3, #0
 350:	1afffff1 	bne	31c <strchr+0x1c>
  return 0;
 354:	e3a03000 	mov	r3, #0
}
 358:	e1a00003 	mov	r0, r3
 35c:	e28bd000 	add	sp, fp, #0
 360:	e49db004 	pop	{fp}		@ (ldr fp, [sp], #4)
 364:	e12fff1e 	bx	lr

00000368 <gets>:

char*
gets(char *buf, int max)
{
 368:	e92d4800 	push	{fp, lr}
 36c:	e28db004 	add	fp, sp, #4
 370:	e24dd018 	sub	sp, sp, #24
 374:	e50b0018 	str	r0, [fp, #-24]	@ 0xffffffe8
 378:	e50b101c 	str	r1, [fp, #-28]	@ 0xffffffe4
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 37c:	e3a03000 	mov	r3, #0
 380:	e50b3008 	str	r3, [fp, #-8]
 384:	ea000016 	b	3e4 <gets+0x7c>
    cc = read(0, &c, 1);
 388:	e24b300d 	sub	r3, fp, #13
 38c:	e3a02001 	mov	r2, #1
 390:	e1a01003 	mov	r1, r3
 394:	e3a00000 	mov	r0, #0
 398:	eb0000a8 	bl	640 <read>
 39c:	e50b000c 	str	r0, [fp, #-12]
    if(cc < 1)
 3a0:	e51b300c 	ldr	r3, [fp, #-12]
 3a4:	e3530000 	cmp	r3, #0
 3a8:	da000013 	ble	3fc <gets+0x94>
      break;
    buf[i++] = c;
 3ac:	e51b3008 	ldr	r3, [fp, #-8]
 3b0:	e2832001 	add	r2, r3, #1
 3b4:	e50b2008 	str	r2, [fp, #-8]
 3b8:	e1a02003 	mov	r2, r3
 3bc:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
 3c0:	e0833002 	add	r3, r3, r2
 3c4:	e55b200d 	ldrb	r2, [fp, #-13]
 3c8:	e5c32000 	strb	r2, [r3]
    if(c == '\n' || c == '\r')
 3cc:	e55b300d 	ldrb	r3, [fp, #-13]
 3d0:	e353000a 	cmp	r3, #10
 3d4:	0a000009 	beq	400 <gets+0x98>
 3d8:	e55b300d 	ldrb	r3, [fp, #-13]
 3dc:	e353000d 	cmp	r3, #13
 3e0:	0a000006 	beq	400 <gets+0x98>
  for(i=0; i+1 < max; ){
 3e4:	e51b3008 	ldr	r3, [fp, #-8]
 3e8:	e2833001 	add	r3, r3, #1
 3ec:	e51b201c 	ldr	r2, [fp, #-28]	@ 0xffffffe4
 3f0:	e1520003 	cmp	r2, r3
 3f4:	caffffe3 	bgt	388 <gets+0x20>
 3f8:	ea000000 	b	400 <gets+0x98>
      break;
 3fc:	e320f000 	nop	{0}
      break;
  }
  buf[i] = '\0';
 400:	e51b3008 	ldr	r3, [fp, #-8]
 404:	e51b2018 	ldr	r2, [fp, #-24]	@ 0xffffffe8
 408:	e0823003 	add	r3, r2, r3
 40c:	e3a02000 	mov	r2, #0
 410:	e5c32000 	strb	r2, [r3]
  return buf;
 414:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
}
 418:	e1a00003 	mov	r0, r3
 41c:	e24bd004 	sub	sp, fp, #4
 420:	e8bd8800 	pop	{fp, pc}

00000424 <stat>:

int
stat(char *n, struct stat *st)
{
 424:	e92d4800 	push	{fp, lr}
 428:	e28db004 	add	fp, sp, #4
 42c:	e24dd010 	sub	sp, sp, #16
 430:	e50b0010 	str	r0, [fp, #-16]
 434:	e50b1014 	str	r1, [fp, #-20]	@ 0xffffffec
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 438:	e3a01000 	mov	r1, #0
 43c:	e51b0010 	ldr	r0, [fp, #-16]
 440:	eb0000bf 	bl	744 <open>
 444:	e50b0008 	str	r0, [fp, #-8]
  if(fd < 0)
 448:	e51b3008 	ldr	r3, [fp, #-8]
 44c:	e3530000 	cmp	r3, #0
 450:	aa000001 	bge	45c <stat+0x38>
    return -1;
 454:	e3e03000 	mvn	r3, #0
 458:	ea000006 	b	478 <stat+0x54>
  r = fstat(fd, st);
 45c:	e51b1014 	ldr	r1, [fp, #-20]	@ 0xffffffec
 460:	e51b0008 	ldr	r0, [fp, #-8]
 464:	eb0000dd 	bl	7e0 <fstat>
 468:	e50b000c 	str	r0, [fp, #-12]
  close(fd);
 46c:	e51b0008 	ldr	r0, [fp, #-8]
 470:	eb00008c 	bl	6a8 <close>
  return r;
 474:	e51b300c 	ldr	r3, [fp, #-12]
}
 478:	e1a00003 	mov	r0, r3
 47c:	e24bd004 	sub	sp, fp, #4
 480:	e8bd8800 	pop	{fp, pc}

00000484 <atoi>:

int
atoi(const char *s)
{
 484:	e52db004 	push	{fp}		@ (str fp, [sp, #-4]!)
 488:	e28db000 	add	fp, sp, #0
 48c:	e24dd014 	sub	sp, sp, #20
 490:	e50b0010 	str	r0, [fp, #-16]
  int n;

  n = 0;
 494:	e3a03000 	mov	r3, #0
 498:	e50b3008 	str	r3, [fp, #-8]
  while('0' <= *s && *s <= '9')
 49c:	ea000009 	b	4c8 <atoi+0x44>
    n = n*10 + *s++ - '0';
 4a0:	e51b3008 	ldr	r3, [fp, #-8]
 4a4:	e3a0200a 	mov	r2, #10
 4a8:	e0020392 	mul	r2, r2, r3
 4ac:	e51b3010 	ldr	r3, [fp, #-16]
 4b0:	e2831001 	add	r1, r3, #1
 4b4:	e50b1010 	str	r1, [fp, #-16]
 4b8:	e5d33000 	ldrb	r3, [r3]
 4bc:	e0823003 	add	r3, r2, r3
 4c0:	e2433030 	sub	r3, r3, #48	@ 0x30
 4c4:	e50b3008 	str	r3, [fp, #-8]
  while('0' <= *s && *s <= '9')
 4c8:	e51b3010 	ldr	r3, [fp, #-16]
 4cc:	e5d33000 	ldrb	r3, [r3]
 4d0:	e353002f 	cmp	r3, #47	@ 0x2f
 4d4:	9a000003 	bls	4e8 <atoi+0x64>
 4d8:	e51b3010 	ldr	r3, [fp, #-16]
 4dc:	e5d33000 	ldrb	r3, [r3]
 4e0:	e3530039 	cmp	r3, #57	@ 0x39
 4e4:	9affffed 	bls	4a0 <atoi+0x1c>
  return n;
 4e8:	e51b3008 	ldr	r3, [fp, #-8]
}
 4ec:	e1a00003 	mov	r0, r3
 4f0:	e28bd000 	add	sp, fp, #0
 4f4:	e49db004 	pop	{fp}		@ (ldr fp, [sp], #4)
 4f8:	e12fff1e 	bx	lr

000004fc <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
 4fc:	e52db004 	push	{fp}		@ (str fp, [sp, #-4]!)
 500:	e28db000 	add	fp, sp, #0
 504:	e24dd01c 	sub	sp, sp, #28
 508:	e50b0010 	str	r0, [fp, #-16]
 50c:	e50b1014 	str	r1, [fp, #-20]	@ 0xffffffec
 510:	e50b2018 	str	r2, [fp, #-24]	@ 0xffffffe8
  char *dst, *src;
  
  dst = vdst;
 514:	e51b3010 	ldr	r3, [fp, #-16]
 518:	e50b3008 	str	r3, [fp, #-8]
  src = vsrc;
 51c:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
 520:	e50b300c 	str	r3, [fp, #-12]
  while(n-- > 0)
 524:	ea000007 	b	548 <memmove+0x4c>
    *dst++ = *src++;
 528:	e51b200c 	ldr	r2, [fp, #-12]
 52c:	e2823001 	add	r3, r2, #1
 530:	e50b300c 	str	r3, [fp, #-12]
 534:	e51b3008 	ldr	r3, [fp, #-8]
 538:	e2831001 	add	r1, r3, #1
 53c:	e50b1008 	str	r1, [fp, #-8]
 540:	e5d22000 	ldrb	r2, [r2]
 544:	e5c32000 	strb	r2, [r3]
  while(n-- > 0)
 548:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
 54c:	e2432001 	sub	r2, r3, #1
 550:	e50b2018 	str	r2, [fp, #-24]	@ 0xffffffe8
 554:	e3530000 	cmp	r3, #0
 558:	cafffff2 	bgt	528 <memmove+0x2c>
  return vdst;
 55c:	e51b3010 	ldr	r3, [fp, #-16]
}
 560:	e1a00003 	mov	r0, r3
 564:	e28bd000 	add	sp, fp, #0
 568:	e49db004 	pop	{fp}		@ (ldr fp, [sp], #4)
 56c:	e12fff1e 	bx	lr

00000570 <fork>:
 570:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
 574:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
 578:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
 57c:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
 580:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
 584:	e3a00001 	mov	r0, #1
 588:	ef000040 	svc	0x00000040
 58c:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
 590:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
 594:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
 598:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
 59c:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
 5a0:	e12fff1e 	bx	lr

000005a4 <exit>:
 5a4:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
 5a8:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
 5ac:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
 5b0:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
 5b4:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
 5b8:	e3a00002 	mov	r0, #2
 5bc:	ef000040 	svc	0x00000040
 5c0:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
 5c4:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
 5c8:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
 5cc:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
 5d0:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
 5d4:	e12fff1e 	bx	lr

000005d8 <wait>:
 5d8:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
 5dc:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
 5e0:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
 5e4:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
 5e8:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
 5ec:	e3a00003 	mov	r0, #3
 5f0:	ef000040 	svc	0x00000040
 5f4:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
 5f8:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
 5fc:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
 600:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
 604:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
 608:	e12fff1e 	bx	lr

0000060c <pipe>:
 60c:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
 610:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
 614:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
 618:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
 61c:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
 620:	e3a00004 	mov	r0, #4
 624:	ef000040 	svc	0x00000040
 628:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
 62c:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
 630:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
 634:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
 638:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
 63c:	e12fff1e 	bx	lr

00000640 <read>:
 640:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
 644:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
 648:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
 64c:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
 650:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
 654:	e3a00005 	mov	r0, #5
 658:	ef000040 	svc	0x00000040
 65c:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
 660:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
 664:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
 668:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
 66c:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
 670:	e12fff1e 	bx	lr

00000674 <write>:
 674:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
 678:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
 67c:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
 680:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
 684:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
 688:	e3a00010 	mov	r0, #16
 68c:	ef000040 	svc	0x00000040
 690:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
 694:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
 698:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
 69c:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
 6a0:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
 6a4:	e12fff1e 	bx	lr

000006a8 <close>:
 6a8:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
 6ac:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
 6b0:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
 6b4:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
 6b8:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
 6bc:	e3a00015 	mov	r0, #21
 6c0:	ef000040 	svc	0x00000040
 6c4:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
 6c8:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
 6cc:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
 6d0:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
 6d4:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
 6d8:	e12fff1e 	bx	lr

000006dc <kill>:
 6dc:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
 6e0:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
 6e4:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
 6e8:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
 6ec:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
 6f0:	e3a00006 	mov	r0, #6
 6f4:	ef000040 	svc	0x00000040
 6f8:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
 6fc:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
 700:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
 704:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
 708:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
 70c:	e12fff1e 	bx	lr

00000710 <exec>:
 710:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
 714:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
 718:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
 71c:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
 720:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
 724:	e3a00007 	mov	r0, #7
 728:	ef000040 	svc	0x00000040
 72c:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
 730:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
 734:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
 738:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
 73c:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
 740:	e12fff1e 	bx	lr

00000744 <open>:
 744:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
 748:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
 74c:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
 750:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
 754:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
 758:	e3a0000f 	mov	r0, #15
 75c:	ef000040 	svc	0x00000040
 760:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
 764:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
 768:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
 76c:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
 770:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
 774:	e12fff1e 	bx	lr

00000778 <mknod>:
 778:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
 77c:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
 780:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
 784:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
 788:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
 78c:	e3a00011 	mov	r0, #17
 790:	ef000040 	svc	0x00000040
 794:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
 798:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
 79c:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
 7a0:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
 7a4:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
 7a8:	e12fff1e 	bx	lr

000007ac <unlink>:
 7ac:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
 7b0:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
 7b4:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
 7b8:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
 7bc:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
 7c0:	e3a00012 	mov	r0, #18
 7c4:	ef000040 	svc	0x00000040
 7c8:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
 7cc:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
 7d0:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
 7d4:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
 7d8:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
 7dc:	e12fff1e 	bx	lr

000007e0 <fstat>:
 7e0:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
 7e4:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
 7e8:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
 7ec:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
 7f0:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
 7f4:	e3a00008 	mov	r0, #8
 7f8:	ef000040 	svc	0x00000040
 7fc:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
 800:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
 804:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
 808:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
 80c:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
 810:	e12fff1e 	bx	lr

00000814 <link>:
 814:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
 818:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
 81c:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
 820:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
 824:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
 828:	e3a00013 	mov	r0, #19
 82c:	ef000040 	svc	0x00000040
 830:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
 834:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
 838:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
 83c:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
 840:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
 844:	e12fff1e 	bx	lr

00000848 <mkdir>:
 848:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
 84c:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
 850:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
 854:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
 858:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
 85c:	e3a00014 	mov	r0, #20
 860:	ef000040 	svc	0x00000040
 864:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
 868:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
 86c:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
 870:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
 874:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
 878:	e12fff1e 	bx	lr

0000087c <chdir>:
 87c:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
 880:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
 884:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
 888:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
 88c:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
 890:	e3a00009 	mov	r0, #9
 894:	ef000040 	svc	0x00000040
 898:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
 89c:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
 8a0:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
 8a4:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
 8a8:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
 8ac:	e12fff1e 	bx	lr

000008b0 <dup>:
 8b0:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
 8b4:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
 8b8:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
 8bc:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
 8c0:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
 8c4:	e3a0000a 	mov	r0, #10
 8c8:	ef000040 	svc	0x00000040
 8cc:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
 8d0:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
 8d4:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
 8d8:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
 8dc:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
 8e0:	e12fff1e 	bx	lr

000008e4 <getpid>:
 8e4:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
 8e8:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
 8ec:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
 8f0:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
 8f4:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
 8f8:	e3a0000b 	mov	r0, #11
 8fc:	ef000040 	svc	0x00000040
 900:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
 904:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
 908:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
 90c:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
 910:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
 914:	e12fff1e 	bx	lr

00000918 <sbrk>:
 918:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
 91c:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
 920:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
 924:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
 928:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
 92c:	e3a0000c 	mov	r0, #12
 930:	ef000040 	svc	0x00000040
 934:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
 938:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
 93c:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
 940:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
 944:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
 948:	e12fff1e 	bx	lr

0000094c <sleep>:
 94c:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
 950:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
 954:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
 958:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
 95c:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
 960:	e3a0000d 	mov	r0, #13
 964:	ef000040 	svc	0x00000040
 968:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
 96c:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
 970:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
 974:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
 978:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
 97c:	e12fff1e 	bx	lr

00000980 <uptime>:
 980:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
 984:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
 988:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
 98c:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
 990:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
 994:	e3a0000e 	mov	r0, #14
 998:	ef000040 	svc	0x00000040
 99c:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
 9a0:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
 9a4:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
 9a8:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
 9ac:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
 9b0:	e12fff1e 	bx	lr
