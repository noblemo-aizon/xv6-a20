
_stressfs:     file format elf32-littlearm


Disassembly of section .text:

00000000 <main>:
#include "fs.h"
#include "fcntl.h"

int
main(int argc, char *argv[])
{
       0:	e92d4800 	push	{fp, lr}
       4:	e28db004 	add	fp, sp, #4
       8:	e24dde22 	sub	sp, sp, #544	@ 0x220
       c:	e50b0220 	str	r0, [fp, #-544]	@ 0xfffffde0
      10:	e50b1224 	str	r1, [fp, #-548]	@ 0xfffffddc
  int fd, i;
  char path[] = "stressfs0";
      14:	e30121e8 	movw	r2, #4584	@ 0x11e8
      18:	e3402000 	movt	r2, #0
      1c:	e24b3018 	sub	r3, fp, #24
      20:	e8920007 	ldm	r2, {r0, r1, r2}
      24:	e8a30003 	stmia	r3!, {r0, r1}
      28:	e1c320b0 	strh	r2, [r3]
  char data[512];

  printf(1, "stressfs starting\n");
      2c:	e30111c0 	movw	r1, #4544	@ 0x11c0
      30:	e3401000 	movt	r1, #0
      34:	e3a00001 	mov	r0, #1
      38:	eb0002f0 	bl	c00 <printf>
  memset(data, 'a', sizeof(data));
      3c:	e24b3f86 	sub	r3, fp, #536	@ 0x218
      40:	e3a02c02 	mov	r2, #512	@ 0x200
      44:	e3a01061 	mov	r1, #97	@ 0x61
      48:	e1a00003 	mov	r0, r3
      4c:	eb000096 	bl	2ac <memset>

  for(i = 0; i < 4; i++)
      50:	e3a03000 	mov	r3, #0
      54:	e50b3008 	str	r3, [fp, #-8]
      58:	ea000006 	b	78 <main+0x78>
    if(fork() > 0)
      5c:	eb000149 	bl	588 <fork>
      60:	e1a03000 	mov	r3, r0
      64:	e3530000 	cmp	r3, #0
      68:	ca000006 	bgt	88 <main+0x88>
  for(i = 0; i < 4; i++)
      6c:	e51b3008 	ldr	r3, [fp, #-8]
      70:	e2833001 	add	r3, r3, #1
      74:	e50b3008 	str	r3, [fp, #-8]
      78:	e51b3008 	ldr	r3, [fp, #-8]
      7c:	e3530003 	cmp	r3, #3
      80:	dafffff5 	ble	5c <main+0x5c>
      84:	ea000000 	b	8c <main+0x8c>
      break;
      88:	e320f000 	nop	{0}

  printf(1, "write %d\n", i);
      8c:	e51b2008 	ldr	r2, [fp, #-8]
      90:	e30111d4 	movw	r1, #4564	@ 0x11d4
      94:	e3401000 	movt	r1, #0
      98:	e3a00001 	mov	r0, #1
      9c:	eb0002d7 	bl	c00 <printf>

  path[8] += i;
      a0:	e55b2010 	ldrb	r2, [fp, #-16]
      a4:	e51b3008 	ldr	r3, [fp, #-8]
      a8:	e6ef3073 	uxtb	r3, r3
      ac:	e0823003 	add	r3, r2, r3
      b0:	e6ef3073 	uxtb	r3, r3
      b4:	e54b3010 	strb	r3, [fp, #-16]
  fd = open(path, O_CREATE | O_RDWR);
      b8:	e24b3018 	sub	r3, fp, #24
      bc:	e3001202 	movw	r1, #514	@ 0x202
      c0:	e1a00003 	mov	r0, r3
      c4:	eb0001a4 	bl	75c <open>
      c8:	e50b000c 	str	r0, [fp, #-12]
  for(i = 0; i < 20; i++)
      cc:	e3a03000 	mov	r3, #0
      d0:	e50b3008 	str	r3, [fp, #-8]
      d4:	ea000007 	b	f8 <main+0xf8>
//    printf(fd, "%d\n", i);
    write(fd, data, sizeof(data));
      d8:	e24b3f86 	sub	r3, fp, #536	@ 0x218
      dc:	e3a02c02 	mov	r2, #512	@ 0x200
      e0:	e1a01003 	mov	r1, r3
      e4:	e51b000c 	ldr	r0, [fp, #-12]
      e8:	eb000167 	bl	68c <write>
  for(i = 0; i < 20; i++)
      ec:	e51b3008 	ldr	r3, [fp, #-8]
      f0:	e2833001 	add	r3, r3, #1
      f4:	e50b3008 	str	r3, [fp, #-8]
      f8:	e51b3008 	ldr	r3, [fp, #-8]
      fc:	e3530013 	cmp	r3, #19
     100:	dafffff4 	ble	d8 <main+0xd8>
  close(fd);
     104:	e51b000c 	ldr	r0, [fp, #-12]
     108:	eb00016c 	bl	6c0 <close>

  printf(1, "read\n");
     10c:	e30111e0 	movw	r1, #4576	@ 0x11e0
     110:	e3401000 	movt	r1, #0
     114:	e3a00001 	mov	r0, #1
     118:	eb0002b8 	bl	c00 <printf>

  fd = open(path, O_RDONLY);
     11c:	e24b3018 	sub	r3, fp, #24
     120:	e3a01000 	mov	r1, #0
     124:	e1a00003 	mov	r0, r3
     128:	eb00018b 	bl	75c <open>
     12c:	e50b000c 	str	r0, [fp, #-12]
  for (i = 0; i < 20; i++)
     130:	e3a03000 	mov	r3, #0
     134:	e50b3008 	str	r3, [fp, #-8]
     138:	ea000007 	b	15c <main+0x15c>
    read(fd, data, sizeof(data));
     13c:	e24b3f86 	sub	r3, fp, #536	@ 0x218
     140:	e3a02c02 	mov	r2, #512	@ 0x200
     144:	e1a01003 	mov	r1, r3
     148:	e51b000c 	ldr	r0, [fp, #-12]
     14c:	eb000141 	bl	658 <read>
  for (i = 0; i < 20; i++)
     150:	e51b3008 	ldr	r3, [fp, #-8]
     154:	e2833001 	add	r3, r3, #1
     158:	e50b3008 	str	r3, [fp, #-8]
     15c:	e51b3008 	ldr	r3, [fp, #-8]
     160:	e3530013 	cmp	r3, #19
     164:	dafffff4 	ble	13c <main+0x13c>
  close(fd);
     168:	e51b000c 	ldr	r0, [fp, #-12]
     16c:	eb000153 	bl	6c0 <close>

  wait();
     170:	eb00011e 	bl	5f0 <wait>
  
  exit();
     174:	eb000110 	bl	5bc <exit>

00000178 <strcpy>:
#include "user.h"
#include "arm.h"

char*
strcpy(char *s, char *t)
{
     178:	e52db004 	push	{fp}		@ (str fp, [sp, #-4]!)
     17c:	e28db000 	add	fp, sp, #0
     180:	e24dd014 	sub	sp, sp, #20
     184:	e50b0010 	str	r0, [fp, #-16]
     188:	e50b1014 	str	r1, [fp, #-20]	@ 0xffffffec
  char *os;

  os = s;
     18c:	e51b3010 	ldr	r3, [fp, #-16]
     190:	e50b3008 	str	r3, [fp, #-8]
  while((*s++ = *t++) != 0)
     194:	e320f000 	nop	{0}
     198:	e51b2014 	ldr	r2, [fp, #-20]	@ 0xffffffec
     19c:	e2823001 	add	r3, r2, #1
     1a0:	e50b3014 	str	r3, [fp, #-20]	@ 0xffffffec
     1a4:	e51b3010 	ldr	r3, [fp, #-16]
     1a8:	e2831001 	add	r1, r3, #1
     1ac:	e50b1010 	str	r1, [fp, #-16]
     1b0:	e5d22000 	ldrb	r2, [r2]
     1b4:	e5c32000 	strb	r2, [r3]
     1b8:	e5d33000 	ldrb	r3, [r3]
     1bc:	e3530000 	cmp	r3, #0
     1c0:	1afffff4 	bne	198 <strcpy+0x20>
    ;
  return os;
     1c4:	e51b3008 	ldr	r3, [fp, #-8]
}
     1c8:	e1a00003 	mov	r0, r3
     1cc:	e28bd000 	add	sp, fp, #0
     1d0:	e49db004 	pop	{fp}		@ (ldr fp, [sp], #4)
     1d4:	e12fff1e 	bx	lr

000001d8 <strcmp>:

int
strcmp(const char *p, const char *q)
{
     1d8:	e52db004 	push	{fp}		@ (str fp, [sp, #-4]!)
     1dc:	e28db000 	add	fp, sp, #0
     1e0:	e24dd00c 	sub	sp, sp, #12
     1e4:	e50b0008 	str	r0, [fp, #-8]
     1e8:	e50b100c 	str	r1, [fp, #-12]
  while(*p && *p == *q)
     1ec:	ea000005 	b	208 <strcmp+0x30>
    p++, q++;
     1f0:	e51b3008 	ldr	r3, [fp, #-8]
     1f4:	e2833001 	add	r3, r3, #1
     1f8:	e50b3008 	str	r3, [fp, #-8]
     1fc:	e51b300c 	ldr	r3, [fp, #-12]
     200:	e2833001 	add	r3, r3, #1
     204:	e50b300c 	str	r3, [fp, #-12]
  while(*p && *p == *q)
     208:	e51b3008 	ldr	r3, [fp, #-8]
     20c:	e5d33000 	ldrb	r3, [r3]
     210:	e3530000 	cmp	r3, #0
     214:	0a000005 	beq	230 <strcmp+0x58>
     218:	e51b3008 	ldr	r3, [fp, #-8]
     21c:	e5d32000 	ldrb	r2, [r3]
     220:	e51b300c 	ldr	r3, [fp, #-12]
     224:	e5d33000 	ldrb	r3, [r3]
     228:	e1520003 	cmp	r2, r3
     22c:	0affffef 	beq	1f0 <strcmp+0x18>
  return (uchar)*p - (uchar)*q;
     230:	e51b3008 	ldr	r3, [fp, #-8]
     234:	e5d33000 	ldrb	r3, [r3]
     238:	e1a02003 	mov	r2, r3
     23c:	e51b300c 	ldr	r3, [fp, #-12]
     240:	e5d33000 	ldrb	r3, [r3]
     244:	e0423003 	sub	r3, r2, r3
}
     248:	e1a00003 	mov	r0, r3
     24c:	e28bd000 	add	sp, fp, #0
     250:	e49db004 	pop	{fp}		@ (ldr fp, [sp], #4)
     254:	e12fff1e 	bx	lr

00000258 <strlen>:

uint
strlen(char *s)
{
     258:	e52db004 	push	{fp}		@ (str fp, [sp, #-4]!)
     25c:	e28db000 	add	fp, sp, #0
     260:	e24dd014 	sub	sp, sp, #20
     264:	e50b0010 	str	r0, [fp, #-16]
  int n;

  for(n = 0; s[n]; n++)
     268:	e3a03000 	mov	r3, #0
     26c:	e50b3008 	str	r3, [fp, #-8]
     270:	ea000002 	b	280 <strlen+0x28>
     274:	e51b3008 	ldr	r3, [fp, #-8]
     278:	e2833001 	add	r3, r3, #1
     27c:	e50b3008 	str	r3, [fp, #-8]
     280:	e51b3008 	ldr	r3, [fp, #-8]
     284:	e51b2010 	ldr	r2, [fp, #-16]
     288:	e0823003 	add	r3, r2, r3
     28c:	e5d33000 	ldrb	r3, [r3]
     290:	e3530000 	cmp	r3, #0
     294:	1afffff6 	bne	274 <strlen+0x1c>
    ;
  return n;
     298:	e51b3008 	ldr	r3, [fp, #-8]
}
     29c:	e1a00003 	mov	r0, r3
     2a0:	e28bd000 	add	sp, fp, #0
     2a4:	e49db004 	pop	{fp}		@ (ldr fp, [sp], #4)
     2a8:	e12fff1e 	bx	lr

000002ac <memset>:

void*
memset(void *dst, int c, uint n)
{
     2ac:	e52db004 	push	{fp}		@ (str fp, [sp, #-4]!)
     2b0:	e28db000 	add	fp, sp, #0
     2b4:	e24dd01c 	sub	sp, sp, #28
     2b8:	e50b0010 	str	r0, [fp, #-16]
     2bc:	e50b1014 	str	r1, [fp, #-20]	@ 0xffffffec
     2c0:	e50b2018 	str	r2, [fp, #-24]	@ 0xffffffe8
  char *p=dst;
     2c4:	e51b3010 	ldr	r3, [fp, #-16]
     2c8:	e50b3008 	str	r3, [fp, #-8]
  u32 rc=n;
     2cc:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
     2d0:	e50b300c 	str	r3, [fp, #-12]

  while (rc-- > 0) *p++ = c;
     2d4:	ea000005 	b	2f0 <memset+0x44>
     2d8:	e51b3008 	ldr	r3, [fp, #-8]
     2dc:	e2832001 	add	r2, r3, #1
     2e0:	e50b2008 	str	r2, [fp, #-8]
     2e4:	e51b2014 	ldr	r2, [fp, #-20]	@ 0xffffffec
     2e8:	e6ef2072 	uxtb	r2, r2
     2ec:	e5c32000 	strb	r2, [r3]
     2f0:	e51b300c 	ldr	r3, [fp, #-12]
     2f4:	e2432001 	sub	r2, r3, #1
     2f8:	e50b200c 	str	r2, [fp, #-12]
     2fc:	e3530000 	cmp	r3, #0
     300:	1afffff4 	bne	2d8 <memset+0x2c>
  return (void *)p;
     304:	e51b3008 	ldr	r3, [fp, #-8]
}
     308:	e1a00003 	mov	r0, r3
     30c:	e28bd000 	add	sp, fp, #0
     310:	e49db004 	pop	{fp}		@ (ldr fp, [sp], #4)
     314:	e12fff1e 	bx	lr

00000318 <strchr>:

char*
strchr(const char *s, char c)
{
     318:	e52db004 	push	{fp}		@ (str fp, [sp, #-4]!)
     31c:	e28db000 	add	fp, sp, #0
     320:	e24dd00c 	sub	sp, sp, #12
     324:	e50b0008 	str	r0, [fp, #-8]
     328:	e1a03001 	mov	r3, r1
     32c:	e54b3009 	strb	r3, [fp, #-9]
  for(; *s; s++)
     330:	ea000009 	b	35c <strchr+0x44>
    if(*s == c)
     334:	e51b3008 	ldr	r3, [fp, #-8]
     338:	e5d33000 	ldrb	r3, [r3]
     33c:	e55b2009 	ldrb	r2, [fp, #-9]
     340:	e1520003 	cmp	r2, r3
     344:	1a000001 	bne	350 <strchr+0x38>
      return (char*)s;
     348:	e51b3008 	ldr	r3, [fp, #-8]
     34c:	ea000007 	b	370 <strchr+0x58>
  for(; *s; s++)
     350:	e51b3008 	ldr	r3, [fp, #-8]
     354:	e2833001 	add	r3, r3, #1
     358:	e50b3008 	str	r3, [fp, #-8]
     35c:	e51b3008 	ldr	r3, [fp, #-8]
     360:	e5d33000 	ldrb	r3, [r3]
     364:	e3530000 	cmp	r3, #0
     368:	1afffff1 	bne	334 <strchr+0x1c>
  return 0;
     36c:	e3a03000 	mov	r3, #0
}
     370:	e1a00003 	mov	r0, r3
     374:	e28bd000 	add	sp, fp, #0
     378:	e49db004 	pop	{fp}		@ (ldr fp, [sp], #4)
     37c:	e12fff1e 	bx	lr

00000380 <gets>:

char*
gets(char *buf, int max)
{
     380:	e92d4800 	push	{fp, lr}
     384:	e28db004 	add	fp, sp, #4
     388:	e24dd018 	sub	sp, sp, #24
     38c:	e50b0018 	str	r0, [fp, #-24]	@ 0xffffffe8
     390:	e50b101c 	str	r1, [fp, #-28]	@ 0xffffffe4
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
     394:	e3a03000 	mov	r3, #0
     398:	e50b3008 	str	r3, [fp, #-8]
     39c:	ea000016 	b	3fc <gets+0x7c>
    cc = read(0, &c, 1);
     3a0:	e24b300d 	sub	r3, fp, #13
     3a4:	e3a02001 	mov	r2, #1
     3a8:	e1a01003 	mov	r1, r3
     3ac:	e3a00000 	mov	r0, #0
     3b0:	eb0000a8 	bl	658 <read>
     3b4:	e50b000c 	str	r0, [fp, #-12]
    if(cc < 1)
     3b8:	e51b300c 	ldr	r3, [fp, #-12]
     3bc:	e3530000 	cmp	r3, #0
     3c0:	da000013 	ble	414 <gets+0x94>
      break;
    buf[i++] = c;
     3c4:	e51b3008 	ldr	r3, [fp, #-8]
     3c8:	e2832001 	add	r2, r3, #1
     3cc:	e50b2008 	str	r2, [fp, #-8]
     3d0:	e1a02003 	mov	r2, r3
     3d4:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
     3d8:	e0833002 	add	r3, r3, r2
     3dc:	e55b200d 	ldrb	r2, [fp, #-13]
     3e0:	e5c32000 	strb	r2, [r3]
    if(c == '\n' || c == '\r')
     3e4:	e55b300d 	ldrb	r3, [fp, #-13]
     3e8:	e353000a 	cmp	r3, #10
     3ec:	0a000009 	beq	418 <gets+0x98>
     3f0:	e55b300d 	ldrb	r3, [fp, #-13]
     3f4:	e353000d 	cmp	r3, #13
     3f8:	0a000006 	beq	418 <gets+0x98>
  for(i=0; i+1 < max; ){
     3fc:	e51b3008 	ldr	r3, [fp, #-8]
     400:	e2833001 	add	r3, r3, #1
     404:	e51b201c 	ldr	r2, [fp, #-28]	@ 0xffffffe4
     408:	e1520003 	cmp	r2, r3
     40c:	caffffe3 	bgt	3a0 <gets+0x20>
     410:	ea000000 	b	418 <gets+0x98>
      break;
     414:	e320f000 	nop	{0}
      break;
  }
  buf[i] = '\0';
     418:	e51b3008 	ldr	r3, [fp, #-8]
     41c:	e51b2018 	ldr	r2, [fp, #-24]	@ 0xffffffe8
     420:	e0823003 	add	r3, r2, r3
     424:	e3a02000 	mov	r2, #0
     428:	e5c32000 	strb	r2, [r3]
  return buf;
     42c:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
}
     430:	e1a00003 	mov	r0, r3
     434:	e24bd004 	sub	sp, fp, #4
     438:	e8bd8800 	pop	{fp, pc}

0000043c <stat>:

int
stat(char *n, struct stat *st)
{
     43c:	e92d4800 	push	{fp, lr}
     440:	e28db004 	add	fp, sp, #4
     444:	e24dd010 	sub	sp, sp, #16
     448:	e50b0010 	str	r0, [fp, #-16]
     44c:	e50b1014 	str	r1, [fp, #-20]	@ 0xffffffec
  int fd;
  int r;

  fd = open(n, O_RDONLY);
     450:	e3a01000 	mov	r1, #0
     454:	e51b0010 	ldr	r0, [fp, #-16]
     458:	eb0000bf 	bl	75c <open>
     45c:	e50b0008 	str	r0, [fp, #-8]
  if(fd < 0)
     460:	e51b3008 	ldr	r3, [fp, #-8]
     464:	e3530000 	cmp	r3, #0
     468:	aa000001 	bge	474 <stat+0x38>
    return -1;
     46c:	e3e03000 	mvn	r3, #0
     470:	ea000006 	b	490 <stat+0x54>
  r = fstat(fd, st);
     474:	e51b1014 	ldr	r1, [fp, #-20]	@ 0xffffffec
     478:	e51b0008 	ldr	r0, [fp, #-8]
     47c:	eb0000dd 	bl	7f8 <fstat>
     480:	e50b000c 	str	r0, [fp, #-12]
  close(fd);
     484:	e51b0008 	ldr	r0, [fp, #-8]
     488:	eb00008c 	bl	6c0 <close>
  return r;
     48c:	e51b300c 	ldr	r3, [fp, #-12]
}
     490:	e1a00003 	mov	r0, r3
     494:	e24bd004 	sub	sp, fp, #4
     498:	e8bd8800 	pop	{fp, pc}

0000049c <atoi>:

int
atoi(const char *s)
{
     49c:	e52db004 	push	{fp}		@ (str fp, [sp, #-4]!)
     4a0:	e28db000 	add	fp, sp, #0
     4a4:	e24dd014 	sub	sp, sp, #20
     4a8:	e50b0010 	str	r0, [fp, #-16]
  int n;

  n = 0;
     4ac:	e3a03000 	mov	r3, #0
     4b0:	e50b3008 	str	r3, [fp, #-8]
  while('0' <= *s && *s <= '9')
     4b4:	ea000009 	b	4e0 <atoi+0x44>
    n = n*10 + *s++ - '0';
     4b8:	e51b3008 	ldr	r3, [fp, #-8]
     4bc:	e3a0200a 	mov	r2, #10
     4c0:	e0020392 	mul	r2, r2, r3
     4c4:	e51b3010 	ldr	r3, [fp, #-16]
     4c8:	e2831001 	add	r1, r3, #1
     4cc:	e50b1010 	str	r1, [fp, #-16]
     4d0:	e5d33000 	ldrb	r3, [r3]
     4d4:	e0823003 	add	r3, r2, r3
     4d8:	e2433030 	sub	r3, r3, #48	@ 0x30
     4dc:	e50b3008 	str	r3, [fp, #-8]
  while('0' <= *s && *s <= '9')
     4e0:	e51b3010 	ldr	r3, [fp, #-16]
     4e4:	e5d33000 	ldrb	r3, [r3]
     4e8:	e353002f 	cmp	r3, #47	@ 0x2f
     4ec:	9a000003 	bls	500 <atoi+0x64>
     4f0:	e51b3010 	ldr	r3, [fp, #-16]
     4f4:	e5d33000 	ldrb	r3, [r3]
     4f8:	e3530039 	cmp	r3, #57	@ 0x39
     4fc:	9affffed 	bls	4b8 <atoi+0x1c>
  return n;
     500:	e51b3008 	ldr	r3, [fp, #-8]
}
     504:	e1a00003 	mov	r0, r3
     508:	e28bd000 	add	sp, fp, #0
     50c:	e49db004 	pop	{fp}		@ (ldr fp, [sp], #4)
     510:	e12fff1e 	bx	lr

00000514 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
     514:	e52db004 	push	{fp}		@ (str fp, [sp, #-4]!)
     518:	e28db000 	add	fp, sp, #0
     51c:	e24dd01c 	sub	sp, sp, #28
     520:	e50b0010 	str	r0, [fp, #-16]
     524:	e50b1014 	str	r1, [fp, #-20]	@ 0xffffffec
     528:	e50b2018 	str	r2, [fp, #-24]	@ 0xffffffe8
  char *dst, *src;
  
  dst = vdst;
     52c:	e51b3010 	ldr	r3, [fp, #-16]
     530:	e50b3008 	str	r3, [fp, #-8]
  src = vsrc;
     534:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
     538:	e50b300c 	str	r3, [fp, #-12]
  while(n-- > 0)
     53c:	ea000007 	b	560 <memmove+0x4c>
    *dst++ = *src++;
     540:	e51b200c 	ldr	r2, [fp, #-12]
     544:	e2823001 	add	r3, r2, #1
     548:	e50b300c 	str	r3, [fp, #-12]
     54c:	e51b3008 	ldr	r3, [fp, #-8]
     550:	e2831001 	add	r1, r3, #1
     554:	e50b1008 	str	r1, [fp, #-8]
     558:	e5d22000 	ldrb	r2, [r2]
     55c:	e5c32000 	strb	r2, [r3]
  while(n-- > 0)
     560:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
     564:	e2432001 	sub	r2, r3, #1
     568:	e50b2018 	str	r2, [fp, #-24]	@ 0xffffffe8
     56c:	e3530000 	cmp	r3, #0
     570:	cafffff2 	bgt	540 <memmove+0x2c>
  return vdst;
     574:	e51b3010 	ldr	r3, [fp, #-16]
}
     578:	e1a00003 	mov	r0, r3
     57c:	e28bd000 	add	sp, fp, #0
     580:	e49db004 	pop	{fp}		@ (ldr fp, [sp], #4)
     584:	e12fff1e 	bx	lr

00000588 <fork>:
     588:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
     58c:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
     590:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
     594:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
     598:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
     59c:	e3a00001 	mov	r0, #1
     5a0:	ef000040 	svc	0x00000040
     5a4:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     5a8:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     5ac:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
     5b0:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
     5b4:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
     5b8:	e12fff1e 	bx	lr

000005bc <exit>:
     5bc:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
     5c0:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
     5c4:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
     5c8:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
     5cc:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
     5d0:	e3a00002 	mov	r0, #2
     5d4:	ef000040 	svc	0x00000040
     5d8:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     5dc:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     5e0:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
     5e4:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
     5e8:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
     5ec:	e12fff1e 	bx	lr

000005f0 <wait>:
     5f0:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
     5f4:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
     5f8:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
     5fc:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
     600:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
     604:	e3a00003 	mov	r0, #3
     608:	ef000040 	svc	0x00000040
     60c:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     610:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     614:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
     618:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
     61c:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
     620:	e12fff1e 	bx	lr

00000624 <pipe>:
     624:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
     628:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
     62c:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
     630:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
     634:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
     638:	e3a00004 	mov	r0, #4
     63c:	ef000040 	svc	0x00000040
     640:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     644:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     648:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
     64c:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
     650:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
     654:	e12fff1e 	bx	lr

00000658 <read>:
     658:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
     65c:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
     660:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
     664:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
     668:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
     66c:	e3a00005 	mov	r0, #5
     670:	ef000040 	svc	0x00000040
     674:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     678:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     67c:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
     680:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
     684:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
     688:	e12fff1e 	bx	lr

0000068c <write>:
     68c:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
     690:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
     694:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
     698:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
     69c:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
     6a0:	e3a00010 	mov	r0, #16
     6a4:	ef000040 	svc	0x00000040
     6a8:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     6ac:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     6b0:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
     6b4:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
     6b8:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
     6bc:	e12fff1e 	bx	lr

000006c0 <close>:
     6c0:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
     6c4:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
     6c8:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
     6cc:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
     6d0:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
     6d4:	e3a00015 	mov	r0, #21
     6d8:	ef000040 	svc	0x00000040
     6dc:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     6e0:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     6e4:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
     6e8:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
     6ec:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
     6f0:	e12fff1e 	bx	lr

000006f4 <kill>:
     6f4:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
     6f8:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
     6fc:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
     700:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
     704:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
     708:	e3a00006 	mov	r0, #6
     70c:	ef000040 	svc	0x00000040
     710:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     714:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     718:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
     71c:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
     720:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
     724:	e12fff1e 	bx	lr

00000728 <exec>:
     728:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
     72c:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
     730:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
     734:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
     738:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
     73c:	e3a00007 	mov	r0, #7
     740:	ef000040 	svc	0x00000040
     744:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     748:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     74c:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
     750:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
     754:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
     758:	e12fff1e 	bx	lr

0000075c <open>:
     75c:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
     760:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
     764:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
     768:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
     76c:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
     770:	e3a0000f 	mov	r0, #15
     774:	ef000040 	svc	0x00000040
     778:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     77c:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     780:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
     784:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
     788:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
     78c:	e12fff1e 	bx	lr

00000790 <mknod>:
     790:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
     794:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
     798:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
     79c:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
     7a0:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
     7a4:	e3a00011 	mov	r0, #17
     7a8:	ef000040 	svc	0x00000040
     7ac:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     7b0:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     7b4:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
     7b8:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
     7bc:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
     7c0:	e12fff1e 	bx	lr

000007c4 <unlink>:
     7c4:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
     7c8:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
     7cc:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
     7d0:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
     7d4:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
     7d8:	e3a00012 	mov	r0, #18
     7dc:	ef000040 	svc	0x00000040
     7e0:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     7e4:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     7e8:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
     7ec:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
     7f0:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
     7f4:	e12fff1e 	bx	lr

000007f8 <fstat>:
     7f8:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
     7fc:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
     800:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
     804:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
     808:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
     80c:	e3a00008 	mov	r0, #8
     810:	ef000040 	svc	0x00000040
     814:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     818:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     81c:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
     820:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
     824:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
     828:	e12fff1e 	bx	lr

0000082c <link>:
     82c:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
     830:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
     834:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
     838:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
     83c:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
     840:	e3a00013 	mov	r0, #19
     844:	ef000040 	svc	0x00000040
     848:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     84c:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     850:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
     854:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
     858:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
     85c:	e12fff1e 	bx	lr

00000860 <mkdir>:
     860:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
     864:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
     868:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
     86c:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
     870:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
     874:	e3a00014 	mov	r0, #20
     878:	ef000040 	svc	0x00000040
     87c:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     880:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     884:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
     888:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
     88c:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
     890:	e12fff1e 	bx	lr

00000894 <chdir>:
     894:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
     898:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
     89c:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
     8a0:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
     8a4:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
     8a8:	e3a00009 	mov	r0, #9
     8ac:	ef000040 	svc	0x00000040
     8b0:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     8b4:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     8b8:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
     8bc:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
     8c0:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
     8c4:	e12fff1e 	bx	lr

000008c8 <dup>:
     8c8:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
     8cc:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
     8d0:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
     8d4:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
     8d8:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
     8dc:	e3a0000a 	mov	r0, #10
     8e0:	ef000040 	svc	0x00000040
     8e4:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     8e8:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     8ec:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
     8f0:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
     8f4:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
     8f8:	e12fff1e 	bx	lr

000008fc <getpid>:
     8fc:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
     900:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
     904:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
     908:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
     90c:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
     910:	e3a0000b 	mov	r0, #11
     914:	ef000040 	svc	0x00000040
     918:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     91c:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     920:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
     924:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
     928:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
     92c:	e12fff1e 	bx	lr

00000930 <sbrk>:
     930:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
     934:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
     938:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
     93c:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
     940:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
     944:	e3a0000c 	mov	r0, #12
     948:	ef000040 	svc	0x00000040
     94c:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     950:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     954:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
     958:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
     95c:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
     960:	e12fff1e 	bx	lr

00000964 <sleep>:
     964:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
     968:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
     96c:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
     970:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
     974:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
     978:	e3a0000d 	mov	r0, #13
     97c:	ef000040 	svc	0x00000040
     980:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     984:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     988:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
     98c:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
     990:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
     994:	e12fff1e 	bx	lr

00000998 <uptime>:
     998:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
     99c:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
     9a0:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
     9a4:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
     9a8:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
     9ac:	e3a0000e 	mov	r0, #14
     9b0:	ef000040 	svc	0x00000040
     9b4:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     9b8:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     9bc:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
     9c0:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
     9c4:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
     9c8:	e12fff1e 	bx	lr

000009cc <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
     9cc:	e92d4800 	push	{fp, lr}
     9d0:	e28db004 	add	fp, sp, #4
     9d4:	e24dd008 	sub	sp, sp, #8
     9d8:	e50b0008 	str	r0, [fp, #-8]
     9dc:	e1a03001 	mov	r3, r1
     9e0:	e54b3009 	strb	r3, [fp, #-9]
  write(fd, &c, 1);
     9e4:	e24b3009 	sub	r3, fp, #9
     9e8:	e3a02001 	mov	r2, #1
     9ec:	e1a01003 	mov	r1, r3
     9f0:	e51b0008 	ldr	r0, [fp, #-8]
     9f4:	ebffff24 	bl	68c <write>
}
     9f8:	e320f000 	nop	{0}
     9fc:	e24bd004 	sub	sp, fp, #4
     a00:	e8bd8800 	pop	{fp, pc}

00000a04 <div>:

u32 div(u32 n, u32 d)  // long division
{
     a04:	e52db004 	push	{fp}		@ (str fp, [sp, #-4]!)
     a08:	e28db000 	add	fp, sp, #0
     a0c:	e24dd01c 	sub	sp, sp, #28
     a10:	e50b0018 	str	r0, [fp, #-24]	@ 0xffffffe8
     a14:	e50b101c 	str	r1, [fp, #-28]	@ 0xffffffe4
    u32 q=0, r=0;
     a18:	e3a03000 	mov	r3, #0
     a1c:	e50b3008 	str	r3, [fp, #-8]
     a20:	e3a03000 	mov	r3, #0
     a24:	e50b300c 	str	r3, [fp, #-12]
    int i;

    for(i=31;i>=0;i--){
     a28:	e3a0301f 	mov	r3, #31
     a2c:	e50b3010 	str	r3, [fp, #-16]
     a30:	ea00001b 	b	aa4 <div+0xa0>
        r = r << 1;
     a34:	e51b300c 	ldr	r3, [fp, #-12]
     a38:	e1a03083 	lsl	r3, r3, #1
     a3c:	e50b300c 	str	r3, [fp, #-12]
        r = r | ((n >> i) & 1);
     a40:	e51b2018 	ldr	r2, [fp, #-24]	@ 0xffffffe8
     a44:	e51b3010 	ldr	r3, [fp, #-16]
     a48:	e1a03332 	lsr	r3, r2, r3
     a4c:	e2033001 	and	r3, r3, #1
     a50:	e51b200c 	ldr	r2, [fp, #-12]
     a54:	e1823003 	orr	r3, r2, r3
     a58:	e50b300c 	str	r3, [fp, #-12]
        if(r >= d) {
     a5c:	e51b200c 	ldr	r2, [fp, #-12]
     a60:	e51b301c 	ldr	r3, [fp, #-28]	@ 0xffffffe4
     a64:	e1520003 	cmp	r2, r3
     a68:	3a00000a 	bcc	a98 <div+0x94>
            r = r - d;
     a6c:	e51b200c 	ldr	r2, [fp, #-12]
     a70:	e51b301c 	ldr	r3, [fp, #-28]	@ 0xffffffe4
     a74:	e0423003 	sub	r3, r2, r3
     a78:	e50b300c 	str	r3, [fp, #-12]
            q = q | (1 << i);
     a7c:	e3a02001 	mov	r2, #1
     a80:	e51b3010 	ldr	r3, [fp, #-16]
     a84:	e1a03312 	lsl	r3, r2, r3
     a88:	e1a02003 	mov	r2, r3
     a8c:	e51b3008 	ldr	r3, [fp, #-8]
     a90:	e1833002 	orr	r3, r3, r2
     a94:	e50b3008 	str	r3, [fp, #-8]
    for(i=31;i>=0;i--){
     a98:	e51b3010 	ldr	r3, [fp, #-16]
     a9c:	e2433001 	sub	r3, r3, #1
     aa0:	e50b3010 	str	r3, [fp, #-16]
     aa4:	e51b3010 	ldr	r3, [fp, #-16]
     aa8:	e3530000 	cmp	r3, #0
     aac:	aaffffe0 	bge	a34 <div+0x30>
        }
    }
    return q;
     ab0:	e51b3008 	ldr	r3, [fp, #-8]
}
     ab4:	e1a00003 	mov	r0, r3
     ab8:	e28bd000 	add	sp, fp, #0
     abc:	e49db004 	pop	{fp}		@ (ldr fp, [sp], #4)
     ac0:	e12fff1e 	bx	lr

00000ac4 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
     ac4:	e92d4800 	push	{fp, lr}
     ac8:	e28db004 	add	fp, sp, #4
     acc:	e24dd038 	sub	sp, sp, #56	@ 0x38
     ad0:	e50b0030 	str	r0, [fp, #-48]	@ 0xffffffd0
     ad4:	e50b1034 	str	r1, [fp, #-52]	@ 0xffffffcc
     ad8:	e50b2038 	str	r2, [fp, #-56]	@ 0xffffffc8
     adc:	e50b303c 	str	r3, [fp, #-60]	@ 0xffffffc4
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x, y, b;

  neg = 0;
     ae0:	e3a03000 	mov	r3, #0
     ae4:	e50b300c 	str	r3, [fp, #-12]
  if(sgn && xx < 0){
     ae8:	e51b303c 	ldr	r3, [fp, #-60]	@ 0xffffffc4
     aec:	e3530000 	cmp	r3, #0
     af0:	0a000008 	beq	b18 <printint+0x54>
     af4:	e51b3034 	ldr	r3, [fp, #-52]	@ 0xffffffcc
     af8:	e3530000 	cmp	r3, #0
     afc:	aa000005 	bge	b18 <printint+0x54>
    neg = 1;
     b00:	e3a03001 	mov	r3, #1
     b04:	e50b300c 	str	r3, [fp, #-12]
    x = -xx;
     b08:	e51b3034 	ldr	r3, [fp, #-52]	@ 0xffffffcc
     b0c:	e2633000 	rsb	r3, r3, #0
     b10:	e50b3010 	str	r3, [fp, #-16]
     b14:	ea000001 	b	b20 <printint+0x5c>
  } else {
    x = xx;
     b18:	e51b3034 	ldr	r3, [fp, #-52]	@ 0xffffffcc
     b1c:	e50b3010 	str	r3, [fp, #-16]
  }

  b = base;
     b20:	e51b3038 	ldr	r3, [fp, #-56]	@ 0xffffffc8
     b24:	e50b3014 	str	r3, [fp, #-20]	@ 0xffffffec
  i = 0;
     b28:	e3a03000 	mov	r3, #0
     b2c:	e50b3008 	str	r3, [fp, #-8]
  do{
    y = div(x, b);
     b30:	e51b1014 	ldr	r1, [fp, #-20]	@ 0xffffffec
     b34:	e51b0010 	ldr	r0, [fp, #-16]
     b38:	ebffffb1 	bl	a04 <div>
     b3c:	e50b0018 	str	r0, [fp, #-24]	@ 0xffffffe8
    buf[i++] = digits[x - y * b];
     b40:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
     b44:	e51b2014 	ldr	r2, [fp, #-20]	@ 0xffffffec
     b48:	e0030392 	mul	r3, r2, r3
     b4c:	e51b2010 	ldr	r2, [fp, #-16]
     b50:	e0421003 	sub	r1, r2, r3
     b54:	e51b2008 	ldr	r2, [fp, #-8]
     b58:	e2823001 	add	r3, r2, #1
     b5c:	e50b3008 	str	r3, [fp, #-8]
     b60:	e30131fc 	movw	r3, #4604	@ 0x11fc
     b64:	e3403000 	movt	r3, #0
     b68:	e7d31001 	ldrb	r1, [r3, r1]
     b6c:	e2423004 	sub	r3, r2, #4
     b70:	e083300b 	add	r3, r3, fp
     b74:	e1a02001 	mov	r2, r1
     b78:	e5432024 	strb	r2, [r3, #-36]	@ 0xffffffdc
  }while((x = y) != 0);
     b7c:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
     b80:	e50b3010 	str	r3, [fp, #-16]
     b84:	e51b3010 	ldr	r3, [fp, #-16]
     b88:	e3530000 	cmp	r3, #0
     b8c:	1affffe7 	bne	b30 <printint+0x6c>
  if(neg)
     b90:	e51b300c 	ldr	r3, [fp, #-12]
     b94:	e3530000 	cmp	r3, #0
     b98:	0a00000e 	beq	bd8 <printint+0x114>
    buf[i++] = '-';
     b9c:	e51b3008 	ldr	r3, [fp, #-8]
     ba0:	e2832001 	add	r2, r3, #1
     ba4:	e50b2008 	str	r2, [fp, #-8]
     ba8:	e2433004 	sub	r3, r3, #4
     bac:	e083300b 	add	r3, r3, fp
     bb0:	e3a0202d 	mov	r2, #45	@ 0x2d
     bb4:	e5432024 	strb	r2, [r3, #-36]	@ 0xffffffdc

  while(--i >= 0)
     bb8:	ea000006 	b	bd8 <printint+0x114>
    putc(fd, buf[i]);
     bbc:	e24b2028 	sub	r2, fp, #40	@ 0x28
     bc0:	e51b3008 	ldr	r3, [fp, #-8]
     bc4:	e0823003 	add	r3, r2, r3
     bc8:	e5d33000 	ldrb	r3, [r3]
     bcc:	e1a01003 	mov	r1, r3
     bd0:	e51b0030 	ldr	r0, [fp, #-48]	@ 0xffffffd0
     bd4:	ebffff7c 	bl	9cc <putc>
  while(--i >= 0)
     bd8:	e51b3008 	ldr	r3, [fp, #-8]
     bdc:	e2433001 	sub	r3, r3, #1
     be0:	e50b3008 	str	r3, [fp, #-8]
     be4:	e51b3008 	ldr	r3, [fp, #-8]
     be8:	e3530000 	cmp	r3, #0
     bec:	aafffff2 	bge	bbc <printint+0xf8>
}
     bf0:	e320f000 	nop	{0}
     bf4:	e320f000 	nop	{0}
     bf8:	e24bd004 	sub	sp, fp, #4
     bfc:	e8bd8800 	pop	{fp, pc}

00000c00 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
     c00:	e92d000e 	push	{r1, r2, r3}
     c04:	e92d4800 	push	{fp, lr}
     c08:	e28db004 	add	fp, sp, #4
     c0c:	e24dd024 	sub	sp, sp, #36	@ 0x24
     c10:	e50b0024 	str	r0, [fp, #-36]	@ 0xffffffdc
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
     c14:	e3a03000 	mov	r3, #0
     c18:	e50b3014 	str	r3, [fp, #-20]	@ 0xffffffec
  ap = (uint*)(void*)&fmt + 1;
     c1c:	e28b3008 	add	r3, fp, #8
     c20:	e50b3018 	str	r3, [fp, #-24]	@ 0xffffffe8
  for(i = 0; fmt[i]; i++){
     c24:	e3a03000 	mov	r3, #0
     c28:	e50b3010 	str	r3, [fp, #-16]
     c2c:	ea000075 	b	e08 <printf+0x208>
    c = fmt[i] & 0xff;
     c30:	e59b2004 	ldr	r2, [fp, #4]
     c34:	e51b3010 	ldr	r3, [fp, #-16]
     c38:	e0823003 	add	r3, r2, r3
     c3c:	e5d33000 	ldrb	r3, [r3]
     c40:	e50b301c 	str	r3, [fp, #-28]	@ 0xffffffe4
    if(state == 0){
     c44:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
     c48:	e3530000 	cmp	r3, #0
     c4c:	1a00000b 	bne	c80 <printf+0x80>
      if(c == '%'){
     c50:	e51b301c 	ldr	r3, [fp, #-28]	@ 0xffffffe4
     c54:	e3530025 	cmp	r3, #37	@ 0x25
     c58:	1a000002 	bne	c68 <printf+0x68>
        state = '%';
     c5c:	e3a03025 	mov	r3, #37	@ 0x25
     c60:	e50b3014 	str	r3, [fp, #-20]	@ 0xffffffec
     c64:	ea000064 	b	dfc <printf+0x1fc>
      } else {
        putc(fd, c);
     c68:	e51b301c 	ldr	r3, [fp, #-28]	@ 0xffffffe4
     c6c:	e6ef3073 	uxtb	r3, r3
     c70:	e1a01003 	mov	r1, r3
     c74:	e51b0024 	ldr	r0, [fp, #-36]	@ 0xffffffdc
     c78:	ebffff53 	bl	9cc <putc>
     c7c:	ea00005e 	b	dfc <printf+0x1fc>
      }
    } else if(state == '%'){
     c80:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
     c84:	e3530025 	cmp	r3, #37	@ 0x25
     c88:	1a00005b 	bne	dfc <printf+0x1fc>
      if(c == 'd'){
     c8c:	e51b301c 	ldr	r3, [fp, #-28]	@ 0xffffffe4
     c90:	e3530064 	cmp	r3, #100	@ 0x64
     c94:	1a00000a 	bne	cc4 <printf+0xc4>
        printint(fd, *ap, 10, 1);
     c98:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
     c9c:	e5933000 	ldr	r3, [r3]
     ca0:	e1a01003 	mov	r1, r3
     ca4:	e3a03001 	mov	r3, #1
     ca8:	e3a0200a 	mov	r2, #10
     cac:	e51b0024 	ldr	r0, [fp, #-36]	@ 0xffffffdc
     cb0:	ebffff83 	bl	ac4 <printint>
        ap++;
     cb4:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
     cb8:	e2833004 	add	r3, r3, #4
     cbc:	e50b3018 	str	r3, [fp, #-24]	@ 0xffffffe8
     cc0:	ea00004b 	b	df4 <printf+0x1f4>
      } else if(c == 'x' || c == 'p'){
     cc4:	e51b301c 	ldr	r3, [fp, #-28]	@ 0xffffffe4
     cc8:	e3530078 	cmp	r3, #120	@ 0x78
     ccc:	0a000002 	beq	cdc <printf+0xdc>
     cd0:	e51b301c 	ldr	r3, [fp, #-28]	@ 0xffffffe4
     cd4:	e3530070 	cmp	r3, #112	@ 0x70
     cd8:	1a00000a 	bne	d08 <printf+0x108>
        printint(fd, *ap, 16, 0);
     cdc:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
     ce0:	e5933000 	ldr	r3, [r3]
     ce4:	e1a01003 	mov	r1, r3
     ce8:	e3a03000 	mov	r3, #0
     cec:	e3a02010 	mov	r2, #16
     cf0:	e51b0024 	ldr	r0, [fp, #-36]	@ 0xffffffdc
     cf4:	ebffff72 	bl	ac4 <printint>
        ap++;
     cf8:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
     cfc:	e2833004 	add	r3, r3, #4
     d00:	e50b3018 	str	r3, [fp, #-24]	@ 0xffffffe8
     d04:	ea00003a 	b	df4 <printf+0x1f4>
      } else if(c == 's'){
     d08:	e51b301c 	ldr	r3, [fp, #-28]	@ 0xffffffe4
     d0c:	e3530073 	cmp	r3, #115	@ 0x73
     d10:	1a000019 	bne	d7c <printf+0x17c>
        s = (char*)*ap;
     d14:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
     d18:	e5933000 	ldr	r3, [r3]
     d1c:	e50b300c 	str	r3, [fp, #-12]
        ap++;
     d20:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
     d24:	e2833004 	add	r3, r3, #4
     d28:	e50b3018 	str	r3, [fp, #-24]	@ 0xffffffe8
        if(s == 0)
     d2c:	e51b300c 	ldr	r3, [fp, #-12]
     d30:	e3530000 	cmp	r3, #0
     d34:	1a00000b 	bne	d68 <printf+0x168>
          s = "(null)";
     d38:	e30131f4 	movw	r3, #4596	@ 0x11f4
     d3c:	e3403000 	movt	r3, #0
     d40:	e50b300c 	str	r3, [fp, #-12]
        while(*s != 0){
     d44:	ea000007 	b	d68 <printf+0x168>
          putc(fd, *s);
     d48:	e51b300c 	ldr	r3, [fp, #-12]
     d4c:	e5d33000 	ldrb	r3, [r3]
     d50:	e1a01003 	mov	r1, r3
     d54:	e51b0024 	ldr	r0, [fp, #-36]	@ 0xffffffdc
     d58:	ebffff1b 	bl	9cc <putc>
          s++;
     d5c:	e51b300c 	ldr	r3, [fp, #-12]
     d60:	e2833001 	add	r3, r3, #1
     d64:	e50b300c 	str	r3, [fp, #-12]
        while(*s != 0){
     d68:	e51b300c 	ldr	r3, [fp, #-12]
     d6c:	e5d33000 	ldrb	r3, [r3]
     d70:	e3530000 	cmp	r3, #0
     d74:	1afffff3 	bne	d48 <printf+0x148>
     d78:	ea00001d 	b	df4 <printf+0x1f4>
        }
      } else if(c == 'c'){
     d7c:	e51b301c 	ldr	r3, [fp, #-28]	@ 0xffffffe4
     d80:	e3530063 	cmp	r3, #99	@ 0x63
     d84:	1a000009 	bne	db0 <printf+0x1b0>
        putc(fd, *ap);
     d88:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
     d8c:	e5933000 	ldr	r3, [r3]
     d90:	e6ef3073 	uxtb	r3, r3
     d94:	e1a01003 	mov	r1, r3
     d98:	e51b0024 	ldr	r0, [fp, #-36]	@ 0xffffffdc
     d9c:	ebffff0a 	bl	9cc <putc>
        ap++;
     da0:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
     da4:	e2833004 	add	r3, r3, #4
     da8:	e50b3018 	str	r3, [fp, #-24]	@ 0xffffffe8
     dac:	ea000010 	b	df4 <printf+0x1f4>
      } else if(c == '%'){
     db0:	e51b301c 	ldr	r3, [fp, #-28]	@ 0xffffffe4
     db4:	e3530025 	cmp	r3, #37	@ 0x25
     db8:	1a000005 	bne	dd4 <printf+0x1d4>
        putc(fd, c);
     dbc:	e51b301c 	ldr	r3, [fp, #-28]	@ 0xffffffe4
     dc0:	e6ef3073 	uxtb	r3, r3
     dc4:	e1a01003 	mov	r1, r3
     dc8:	e51b0024 	ldr	r0, [fp, #-36]	@ 0xffffffdc
     dcc:	ebfffefe 	bl	9cc <putc>
     dd0:	ea000007 	b	df4 <printf+0x1f4>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
     dd4:	e3a01025 	mov	r1, #37	@ 0x25
     dd8:	e51b0024 	ldr	r0, [fp, #-36]	@ 0xffffffdc
     ddc:	ebfffefa 	bl	9cc <putc>
        putc(fd, c);
     de0:	e51b301c 	ldr	r3, [fp, #-28]	@ 0xffffffe4
     de4:	e6ef3073 	uxtb	r3, r3
     de8:	e1a01003 	mov	r1, r3
     dec:	e51b0024 	ldr	r0, [fp, #-36]	@ 0xffffffdc
     df0:	ebfffef5 	bl	9cc <putc>
      }
      state = 0;
     df4:	e3a03000 	mov	r3, #0
     df8:	e50b3014 	str	r3, [fp, #-20]	@ 0xffffffec
  for(i = 0; fmt[i]; i++){
     dfc:	e51b3010 	ldr	r3, [fp, #-16]
     e00:	e2833001 	add	r3, r3, #1
     e04:	e50b3010 	str	r3, [fp, #-16]
     e08:	e59b2004 	ldr	r2, [fp, #4]
     e0c:	e51b3010 	ldr	r3, [fp, #-16]
     e10:	e0823003 	add	r3, r2, r3
     e14:	e5d33000 	ldrb	r3, [r3]
     e18:	e3530000 	cmp	r3, #0
     e1c:	1affff83 	bne	c30 <printf+0x30>
    }
  }
}
     e20:	e320f000 	nop	{0}
     e24:	e320f000 	nop	{0}
     e28:	e24bd004 	sub	sp, fp, #4
     e2c:	e8bd4800 	pop	{fp, lr}
     e30:	e28dd00c 	add	sp, sp, #12
     e34:	e12fff1e 	bx	lr

00000e38 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
     e38:	e52db004 	push	{fp}		@ (str fp, [sp, #-4]!)
     e3c:	e28db000 	add	fp, sp, #0
     e40:	e24dd014 	sub	sp, sp, #20
     e44:	e50b0010 	str	r0, [fp, #-16]
  Header *bp, *p;

  bp = (Header*)ap - 1;
     e48:	e51b3010 	ldr	r3, [fp, #-16]
     e4c:	e2433008 	sub	r3, r3, #8
     e50:	e50b300c 	str	r3, [fp, #-12]
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
     e54:	e3013218 	movw	r3, #4632	@ 0x1218
     e58:	e3403000 	movt	r3, #0
     e5c:	e5933000 	ldr	r3, [r3]
     e60:	e50b3008 	str	r3, [fp, #-8]
     e64:	ea000010 	b	eac <free+0x74>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
     e68:	e51b3008 	ldr	r3, [fp, #-8]
     e6c:	e5933000 	ldr	r3, [r3]
     e70:	e51b2008 	ldr	r2, [fp, #-8]
     e74:	e1520003 	cmp	r2, r3
     e78:	3a000008 	bcc	ea0 <free+0x68>
     e7c:	e51b200c 	ldr	r2, [fp, #-12]
     e80:	e51b3008 	ldr	r3, [fp, #-8]
     e84:	e1520003 	cmp	r2, r3
     e88:	8a000010 	bhi	ed0 <free+0x98>
     e8c:	e51b3008 	ldr	r3, [fp, #-8]
     e90:	e5933000 	ldr	r3, [r3]
     e94:	e51b200c 	ldr	r2, [fp, #-12]
     e98:	e1520003 	cmp	r2, r3
     e9c:	3a00000b 	bcc	ed0 <free+0x98>
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
     ea0:	e51b3008 	ldr	r3, [fp, #-8]
     ea4:	e5933000 	ldr	r3, [r3]
     ea8:	e50b3008 	str	r3, [fp, #-8]
     eac:	e51b200c 	ldr	r2, [fp, #-12]
     eb0:	e51b3008 	ldr	r3, [fp, #-8]
     eb4:	e1520003 	cmp	r2, r3
     eb8:	9affffea 	bls	e68 <free+0x30>
     ebc:	e51b3008 	ldr	r3, [fp, #-8]
     ec0:	e5933000 	ldr	r3, [r3]
     ec4:	e51b200c 	ldr	r2, [fp, #-12]
     ec8:	e1520003 	cmp	r2, r3
     ecc:	2affffe5 	bcs	e68 <free+0x30>
      break;
  if(bp + bp->s.size == p->s.ptr){
     ed0:	e51b300c 	ldr	r3, [fp, #-12]
     ed4:	e5933004 	ldr	r3, [r3, #4]
     ed8:	e1a03183 	lsl	r3, r3, #3
     edc:	e51b200c 	ldr	r2, [fp, #-12]
     ee0:	e0822003 	add	r2, r2, r3
     ee4:	e51b3008 	ldr	r3, [fp, #-8]
     ee8:	e5933000 	ldr	r3, [r3]
     eec:	e1520003 	cmp	r2, r3
     ef0:	1a00000d 	bne	f2c <free+0xf4>
    bp->s.size += p->s.ptr->s.size;
     ef4:	e51b300c 	ldr	r3, [fp, #-12]
     ef8:	e5932004 	ldr	r2, [r3, #4]
     efc:	e51b3008 	ldr	r3, [fp, #-8]
     f00:	e5933000 	ldr	r3, [r3]
     f04:	e5933004 	ldr	r3, [r3, #4]
     f08:	e0822003 	add	r2, r2, r3
     f0c:	e51b300c 	ldr	r3, [fp, #-12]
     f10:	e5832004 	str	r2, [r3, #4]
    bp->s.ptr = p->s.ptr->s.ptr;
     f14:	e51b3008 	ldr	r3, [fp, #-8]
     f18:	e5933000 	ldr	r3, [r3]
     f1c:	e5932000 	ldr	r2, [r3]
     f20:	e51b300c 	ldr	r3, [fp, #-12]
     f24:	e5832000 	str	r2, [r3]
     f28:	ea000003 	b	f3c <free+0x104>
  } else
    bp->s.ptr = p->s.ptr;
     f2c:	e51b3008 	ldr	r3, [fp, #-8]
     f30:	e5932000 	ldr	r2, [r3]
     f34:	e51b300c 	ldr	r3, [fp, #-12]
     f38:	e5832000 	str	r2, [r3]
  if(p + p->s.size == bp){
     f3c:	e51b3008 	ldr	r3, [fp, #-8]
     f40:	e5933004 	ldr	r3, [r3, #4]
     f44:	e1a03183 	lsl	r3, r3, #3
     f48:	e51b2008 	ldr	r2, [fp, #-8]
     f4c:	e0823003 	add	r3, r2, r3
     f50:	e51b200c 	ldr	r2, [fp, #-12]
     f54:	e1520003 	cmp	r2, r3
     f58:	1a00000b 	bne	f8c <free+0x154>
    p->s.size += bp->s.size;
     f5c:	e51b3008 	ldr	r3, [fp, #-8]
     f60:	e5932004 	ldr	r2, [r3, #4]
     f64:	e51b300c 	ldr	r3, [fp, #-12]
     f68:	e5933004 	ldr	r3, [r3, #4]
     f6c:	e0822003 	add	r2, r2, r3
     f70:	e51b3008 	ldr	r3, [fp, #-8]
     f74:	e5832004 	str	r2, [r3, #4]
    p->s.ptr = bp->s.ptr;
     f78:	e51b300c 	ldr	r3, [fp, #-12]
     f7c:	e5932000 	ldr	r2, [r3]
     f80:	e51b3008 	ldr	r3, [fp, #-8]
     f84:	e5832000 	str	r2, [r3]
     f88:	ea000002 	b	f98 <free+0x160>
  } else
    p->s.ptr = bp;
     f8c:	e51b3008 	ldr	r3, [fp, #-8]
     f90:	e51b200c 	ldr	r2, [fp, #-12]
     f94:	e5832000 	str	r2, [r3]
  freep = p;
     f98:	e3013218 	movw	r3, #4632	@ 0x1218
     f9c:	e3403000 	movt	r3, #0
     fa0:	e51b2008 	ldr	r2, [fp, #-8]
     fa4:	e5832000 	str	r2, [r3]
}
     fa8:	e320f000 	nop	{0}
     fac:	e28bd000 	add	sp, fp, #0
     fb0:	e49db004 	pop	{fp}		@ (ldr fp, [sp], #4)
     fb4:	e12fff1e 	bx	lr

00000fb8 <morecore>:

static Header*
morecore(uint nu)
{
     fb8:	e92d4800 	push	{fp, lr}
     fbc:	e28db004 	add	fp, sp, #4
     fc0:	e24dd010 	sub	sp, sp, #16
     fc4:	e50b0010 	str	r0, [fp, #-16]
  char *p;
  Header *hp;

  if(nu < 4096)
     fc8:	e51b3010 	ldr	r3, [fp, #-16]
     fcc:	e3530a01 	cmp	r3, #4096	@ 0x1000
     fd0:	2a000001 	bcs	fdc <morecore+0x24>
    nu = 4096;
     fd4:	e3a03a01 	mov	r3, #4096	@ 0x1000
     fd8:	e50b3010 	str	r3, [fp, #-16]
  p = sbrk(nu * sizeof(Header));
     fdc:	e51b3010 	ldr	r3, [fp, #-16]
     fe0:	e1a03183 	lsl	r3, r3, #3
     fe4:	e1a00003 	mov	r0, r3
     fe8:	ebfffe50 	bl	930 <sbrk>
     fec:	e50b0008 	str	r0, [fp, #-8]
  if(p == (char*)-1)
     ff0:	e51b3008 	ldr	r3, [fp, #-8]
     ff4:	e3730001 	cmn	r3, #1
     ff8:	1a000001 	bne	1004 <morecore+0x4c>
    return 0;
     ffc:	e3a03000 	mov	r3, #0
    1000:	ea00000b 	b	1034 <morecore+0x7c>
  hp = (Header*)p;
    1004:	e51b3008 	ldr	r3, [fp, #-8]
    1008:	e50b300c 	str	r3, [fp, #-12]
  hp->s.size = nu;
    100c:	e51b300c 	ldr	r3, [fp, #-12]
    1010:	e51b2010 	ldr	r2, [fp, #-16]
    1014:	e5832004 	str	r2, [r3, #4]
  free((void*)(hp + 1));
    1018:	e51b300c 	ldr	r3, [fp, #-12]
    101c:	e2833008 	add	r3, r3, #8
    1020:	e1a00003 	mov	r0, r3
    1024:	ebffff83 	bl	e38 <free>
  return freep;
    1028:	e3013218 	movw	r3, #4632	@ 0x1218
    102c:	e3403000 	movt	r3, #0
    1030:	e5933000 	ldr	r3, [r3]
}
    1034:	e1a00003 	mov	r0, r3
    1038:	e24bd004 	sub	sp, fp, #4
    103c:	e8bd8800 	pop	{fp, pc}

00001040 <malloc>:

void*
malloc(uint nbytes)
{
    1040:	e92d4800 	push	{fp, lr}
    1044:	e28db004 	add	fp, sp, #4
    1048:	e24dd018 	sub	sp, sp, #24
    104c:	e50b0018 	str	r0, [fp, #-24]	@ 0xffffffe8
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1050:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
    1054:	e2833007 	add	r3, r3, #7
    1058:	e1a031a3 	lsr	r3, r3, #3
    105c:	e2833001 	add	r3, r3, #1
    1060:	e50b3010 	str	r3, [fp, #-16]
  if((prevp = freep) == 0){
    1064:	e3013218 	movw	r3, #4632	@ 0x1218
    1068:	e3403000 	movt	r3, #0
    106c:	e5933000 	ldr	r3, [r3]
    1070:	e50b300c 	str	r3, [fp, #-12]
    1074:	e51b300c 	ldr	r3, [fp, #-12]
    1078:	e3530000 	cmp	r3, #0
    107c:	1a000010 	bne	10c4 <malloc+0x84>
    base.s.ptr = freep = prevp = &base;
    1080:	e3013210 	movw	r3, #4624	@ 0x1210
    1084:	e3403000 	movt	r3, #0
    1088:	e50b300c 	str	r3, [fp, #-12]
    108c:	e3013218 	movw	r3, #4632	@ 0x1218
    1090:	e3403000 	movt	r3, #0
    1094:	e51b200c 	ldr	r2, [fp, #-12]
    1098:	e5832000 	str	r2, [r3]
    109c:	e3013218 	movw	r3, #4632	@ 0x1218
    10a0:	e3403000 	movt	r3, #0
    10a4:	e5932000 	ldr	r2, [r3]
    10a8:	e3013210 	movw	r3, #4624	@ 0x1210
    10ac:	e3403000 	movt	r3, #0
    10b0:	e5832000 	str	r2, [r3]
    base.s.size = 0;
    10b4:	e3013210 	movw	r3, #4624	@ 0x1210
    10b8:	e3403000 	movt	r3, #0
    10bc:	e3a02000 	mov	r2, #0
    10c0:	e5832004 	str	r2, [r3, #4]
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    10c4:	e51b300c 	ldr	r3, [fp, #-12]
    10c8:	e5933000 	ldr	r3, [r3]
    10cc:	e50b3008 	str	r3, [fp, #-8]
    if(p->s.size >= nunits){
    10d0:	e51b3008 	ldr	r3, [fp, #-8]
    10d4:	e5933004 	ldr	r3, [r3, #4]
    10d8:	e51b2010 	ldr	r2, [fp, #-16]
    10dc:	e1520003 	cmp	r2, r3
    10e0:	8a00001f 	bhi	1164 <malloc+0x124>
      if(p->s.size == nunits)
    10e4:	e51b3008 	ldr	r3, [fp, #-8]
    10e8:	e5933004 	ldr	r3, [r3, #4]
    10ec:	e51b2010 	ldr	r2, [fp, #-16]
    10f0:	e1520003 	cmp	r2, r3
    10f4:	1a000004 	bne	110c <malloc+0xcc>
        prevp->s.ptr = p->s.ptr;
    10f8:	e51b3008 	ldr	r3, [fp, #-8]
    10fc:	e5932000 	ldr	r2, [r3]
    1100:	e51b300c 	ldr	r3, [fp, #-12]
    1104:	e5832000 	str	r2, [r3]
    1108:	ea00000e 	b	1148 <malloc+0x108>
      else {
        p->s.size -= nunits;
    110c:	e51b3008 	ldr	r3, [fp, #-8]
    1110:	e5932004 	ldr	r2, [r3, #4]
    1114:	e51b3010 	ldr	r3, [fp, #-16]
    1118:	e0422003 	sub	r2, r2, r3
    111c:	e51b3008 	ldr	r3, [fp, #-8]
    1120:	e5832004 	str	r2, [r3, #4]
        p += p->s.size;
    1124:	e51b3008 	ldr	r3, [fp, #-8]
    1128:	e5933004 	ldr	r3, [r3, #4]
    112c:	e1a03183 	lsl	r3, r3, #3
    1130:	e51b2008 	ldr	r2, [fp, #-8]
    1134:	e0823003 	add	r3, r2, r3
    1138:	e50b3008 	str	r3, [fp, #-8]
        p->s.size = nunits;
    113c:	e51b3008 	ldr	r3, [fp, #-8]
    1140:	e51b2010 	ldr	r2, [fp, #-16]
    1144:	e5832004 	str	r2, [r3, #4]
      }
      freep = prevp;
    1148:	e3013218 	movw	r3, #4632	@ 0x1218
    114c:	e3403000 	movt	r3, #0
    1150:	e51b200c 	ldr	r2, [fp, #-12]
    1154:	e5832000 	str	r2, [r3]
      return (void*)(p + 1);
    1158:	e51b3008 	ldr	r3, [fp, #-8]
    115c:	e2833008 	add	r3, r3, #8
    1160:	ea000013 	b	11b4 <malloc+0x174>
    }
    if(p == freep)
    1164:	e3013218 	movw	r3, #4632	@ 0x1218
    1168:	e3403000 	movt	r3, #0
    116c:	e5933000 	ldr	r3, [r3]
    1170:	e51b2008 	ldr	r2, [fp, #-8]
    1174:	e1520003 	cmp	r2, r3
    1178:	1a000007 	bne	119c <malloc+0x15c>
      if((p = morecore(nunits)) == 0)
    117c:	e51b0010 	ldr	r0, [fp, #-16]
    1180:	ebffff8c 	bl	fb8 <morecore>
    1184:	e50b0008 	str	r0, [fp, #-8]
    1188:	e51b3008 	ldr	r3, [fp, #-8]
    118c:	e3530000 	cmp	r3, #0
    1190:	1a000001 	bne	119c <malloc+0x15c>
        return 0;
    1194:	e3a03000 	mov	r3, #0
    1198:	ea000005 	b	11b4 <malloc+0x174>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    119c:	e51b3008 	ldr	r3, [fp, #-8]
    11a0:	e50b300c 	str	r3, [fp, #-12]
    11a4:	e51b3008 	ldr	r3, [fp, #-8]
    11a8:	e5933000 	ldr	r3, [r3]
    11ac:	e50b3008 	str	r3, [fp, #-8]
    if(p->s.size >= nunits){
    11b0:	eaffffc6 	b	10d0 <malloc+0x90>
  }
}
    11b4:	e1a00003 	mov	r0, r3
    11b8:	e24bd004 	sub	sp, fp, #4
    11bc:	e8bd8800 	pop	{fp, pc}
