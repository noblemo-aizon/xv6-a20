
_init:     file format elf32-littlearm


Disassembly of section .text:

00000000 <main>:

char *argv[] = { "sh", 0 };

int
main(void)
{
       0:	e92d4800 	push	{fp, lr}
       4:	e28db004 	add	fp, sp, #4
       8:	e24dd008 	sub	sp, sp, #8
  int pid, wpid;

  if(open("console", O_RDWR) < 0){
       c:	e3a01002 	mov	r1, #2
      10:	e301014c 	movw	r0, #4428	@ 0x114c
      14:	e3400000 	movt	r0, #0
      18:	eb0001b1 	bl	6e4 <open>
      1c:	e1a03000 	mov	r3, r0
      20:	e3530000 	cmp	r3, #0
      24:	aa000008 	bge	4c <main+0x4c>
    mknod("console", 1, 1);
      28:	e3a02001 	mov	r2, #1
      2c:	e3a01001 	mov	r1, #1
      30:	e301014c 	movw	r0, #4428	@ 0x114c
      34:	e3400000 	movt	r0, #0
      38:	eb0001b6 	bl	718 <mknod>
    open("console", O_RDWR);
      3c:	e3a01002 	mov	r1, #2
      40:	e301014c 	movw	r0, #4428	@ 0x114c
      44:	e3400000 	movt	r0, #0
      48:	eb0001a5 	bl	6e4 <open>
  }
  dup(0);  // stdout
      4c:	e3a00000 	mov	r0, #0
      50:	eb0001fe 	bl	850 <dup>
  dup(0);  // stderr
      54:	e3a00000 	mov	r0, #0
      58:	eb0001fc 	bl	850 <dup>

  for(;;){
    printf(1, "init: starting sh\n");
      5c:	e3011154 	movw	r1, #4436	@ 0x1154
      60:	e3401000 	movt	r1, #0
      64:	e3a00001 	mov	r0, #1
      68:	eb0002c6 	bl	b88 <printf>
    pid = fork();
      6c:	eb000127 	bl	510 <fork>
      70:	e50b0008 	str	r0, [fp, #-8]
    if(pid < 0){
      74:	e51b3008 	ldr	r3, [fp, #-8]
      78:	e3530000 	cmp	r3, #0
      7c:	aa000004 	bge	94 <main+0x94>
      printf(1, "init: fork failed\n");
      80:	e3011168 	movw	r1, #4456	@ 0x1168
      84:	e3401000 	movt	r1, #0
      88:	e3a00001 	mov	r0, #1
      8c:	eb0002bd 	bl	b88 <printf>
      exit();
      90:	eb00012b 	bl	544 <exit>
    }
    if(pid == 0){
      94:	e51b3008 	ldr	r3, [fp, #-8]
      98:	e3530000 	cmp	r3, #0
      9c:	1a00000d 	bne	d8 <main+0xd8>
      exec("sh", argv);
      a0:	e30111a8 	movw	r1, #4520	@ 0x11a8
      a4:	e3401000 	movt	r1, #0
      a8:	e3010148 	movw	r0, #4424	@ 0x1148
      ac:	e3400000 	movt	r0, #0
      b0:	eb00017e 	bl	6b0 <exec>
      printf(1, "init: exec sh failed\n");
      b4:	e301117c 	movw	r1, #4476	@ 0x117c
      b8:	e3401000 	movt	r1, #0
      bc:	e3a00001 	mov	r0, #1
      c0:	eb0002b0 	bl	b88 <printf>
      exit();
      c4:	eb00011e 	bl	544 <exit>
    }
    while((wpid=wait()) >= 0 && wpid != pid)
      printf(1, "zombie!\n");
      c8:	e3011194 	movw	r1, #4500	@ 0x1194
      cc:	e3401000 	movt	r1, #0
      d0:	e3a00001 	mov	r0, #1
      d4:	eb0002ab 	bl	b88 <printf>
    while((wpid=wait()) >= 0 && wpid != pid)
      d8:	eb000126 	bl	578 <wait>
      dc:	e50b000c 	str	r0, [fp, #-12]
      e0:	e51b300c 	ldr	r3, [fp, #-12]
      e4:	e3530000 	cmp	r3, #0
      e8:	baffffdb 	blt	5c <main+0x5c>
      ec:	e51b200c 	ldr	r2, [fp, #-12]
      f0:	e51b3008 	ldr	r3, [fp, #-8]
      f4:	e1520003 	cmp	r2, r3
      f8:	1afffff2 	bne	c8 <main+0xc8>
    printf(1, "init: starting sh\n");
      fc:	eaffffd6 	b	5c <main+0x5c>

00000100 <strcpy>:
#include "user.h"
#include "arm.h"

char*
strcpy(char *s, char *t)
{
     100:	e52db004 	push	{fp}		@ (str fp, [sp, #-4]!)
     104:	e28db000 	add	fp, sp, #0
     108:	e24dd014 	sub	sp, sp, #20
     10c:	e50b0010 	str	r0, [fp, #-16]
     110:	e50b1014 	str	r1, [fp, #-20]	@ 0xffffffec
  char *os;

  os = s;
     114:	e51b3010 	ldr	r3, [fp, #-16]
     118:	e50b3008 	str	r3, [fp, #-8]
  while((*s++ = *t++) != 0)
     11c:	e320f000 	nop	{0}
     120:	e51b2014 	ldr	r2, [fp, #-20]	@ 0xffffffec
     124:	e2823001 	add	r3, r2, #1
     128:	e50b3014 	str	r3, [fp, #-20]	@ 0xffffffec
     12c:	e51b3010 	ldr	r3, [fp, #-16]
     130:	e2831001 	add	r1, r3, #1
     134:	e50b1010 	str	r1, [fp, #-16]
     138:	e5d22000 	ldrb	r2, [r2]
     13c:	e5c32000 	strb	r2, [r3]
     140:	e5d33000 	ldrb	r3, [r3]
     144:	e3530000 	cmp	r3, #0
     148:	1afffff4 	bne	120 <strcpy+0x20>
    ;
  return os;
     14c:	e51b3008 	ldr	r3, [fp, #-8]
}
     150:	e1a00003 	mov	r0, r3
     154:	e28bd000 	add	sp, fp, #0
     158:	e49db004 	pop	{fp}		@ (ldr fp, [sp], #4)
     15c:	e12fff1e 	bx	lr

00000160 <strcmp>:

int
strcmp(const char *p, const char *q)
{
     160:	e52db004 	push	{fp}		@ (str fp, [sp, #-4]!)
     164:	e28db000 	add	fp, sp, #0
     168:	e24dd00c 	sub	sp, sp, #12
     16c:	e50b0008 	str	r0, [fp, #-8]
     170:	e50b100c 	str	r1, [fp, #-12]
  while(*p && *p == *q)
     174:	ea000005 	b	190 <strcmp+0x30>
    p++, q++;
     178:	e51b3008 	ldr	r3, [fp, #-8]
     17c:	e2833001 	add	r3, r3, #1
     180:	e50b3008 	str	r3, [fp, #-8]
     184:	e51b300c 	ldr	r3, [fp, #-12]
     188:	e2833001 	add	r3, r3, #1
     18c:	e50b300c 	str	r3, [fp, #-12]
  while(*p && *p == *q)
     190:	e51b3008 	ldr	r3, [fp, #-8]
     194:	e5d33000 	ldrb	r3, [r3]
     198:	e3530000 	cmp	r3, #0
     19c:	0a000005 	beq	1b8 <strcmp+0x58>
     1a0:	e51b3008 	ldr	r3, [fp, #-8]
     1a4:	e5d32000 	ldrb	r2, [r3]
     1a8:	e51b300c 	ldr	r3, [fp, #-12]
     1ac:	e5d33000 	ldrb	r3, [r3]
     1b0:	e1520003 	cmp	r2, r3
     1b4:	0affffef 	beq	178 <strcmp+0x18>
  return (uchar)*p - (uchar)*q;
     1b8:	e51b3008 	ldr	r3, [fp, #-8]
     1bc:	e5d33000 	ldrb	r3, [r3]
     1c0:	e1a02003 	mov	r2, r3
     1c4:	e51b300c 	ldr	r3, [fp, #-12]
     1c8:	e5d33000 	ldrb	r3, [r3]
     1cc:	e0423003 	sub	r3, r2, r3
}
     1d0:	e1a00003 	mov	r0, r3
     1d4:	e28bd000 	add	sp, fp, #0
     1d8:	e49db004 	pop	{fp}		@ (ldr fp, [sp], #4)
     1dc:	e12fff1e 	bx	lr

000001e0 <strlen>:

uint
strlen(char *s)
{
     1e0:	e52db004 	push	{fp}		@ (str fp, [sp, #-4]!)
     1e4:	e28db000 	add	fp, sp, #0
     1e8:	e24dd014 	sub	sp, sp, #20
     1ec:	e50b0010 	str	r0, [fp, #-16]
  int n;

  for(n = 0; s[n]; n++)
     1f0:	e3a03000 	mov	r3, #0
     1f4:	e50b3008 	str	r3, [fp, #-8]
     1f8:	ea000002 	b	208 <strlen+0x28>
     1fc:	e51b3008 	ldr	r3, [fp, #-8]
     200:	e2833001 	add	r3, r3, #1
     204:	e50b3008 	str	r3, [fp, #-8]
     208:	e51b3008 	ldr	r3, [fp, #-8]
     20c:	e51b2010 	ldr	r2, [fp, #-16]
     210:	e0823003 	add	r3, r2, r3
     214:	e5d33000 	ldrb	r3, [r3]
     218:	e3530000 	cmp	r3, #0
     21c:	1afffff6 	bne	1fc <strlen+0x1c>
    ;
  return n;
     220:	e51b3008 	ldr	r3, [fp, #-8]
}
     224:	e1a00003 	mov	r0, r3
     228:	e28bd000 	add	sp, fp, #0
     22c:	e49db004 	pop	{fp}		@ (ldr fp, [sp], #4)
     230:	e12fff1e 	bx	lr

00000234 <memset>:

void*
memset(void *dst, int c, uint n)
{
     234:	e52db004 	push	{fp}		@ (str fp, [sp, #-4]!)
     238:	e28db000 	add	fp, sp, #0
     23c:	e24dd01c 	sub	sp, sp, #28
     240:	e50b0010 	str	r0, [fp, #-16]
     244:	e50b1014 	str	r1, [fp, #-20]	@ 0xffffffec
     248:	e50b2018 	str	r2, [fp, #-24]	@ 0xffffffe8
  char *p=dst;
     24c:	e51b3010 	ldr	r3, [fp, #-16]
     250:	e50b3008 	str	r3, [fp, #-8]
  u32 rc=n;
     254:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
     258:	e50b300c 	str	r3, [fp, #-12]

  while (rc-- > 0) *p++ = c;
     25c:	ea000005 	b	278 <memset+0x44>
     260:	e51b3008 	ldr	r3, [fp, #-8]
     264:	e2832001 	add	r2, r3, #1
     268:	e50b2008 	str	r2, [fp, #-8]
     26c:	e51b2014 	ldr	r2, [fp, #-20]	@ 0xffffffec
     270:	e6ef2072 	uxtb	r2, r2
     274:	e5c32000 	strb	r2, [r3]
     278:	e51b300c 	ldr	r3, [fp, #-12]
     27c:	e2432001 	sub	r2, r3, #1
     280:	e50b200c 	str	r2, [fp, #-12]
     284:	e3530000 	cmp	r3, #0
     288:	1afffff4 	bne	260 <memset+0x2c>
  return (void *)p;
     28c:	e51b3008 	ldr	r3, [fp, #-8]
}
     290:	e1a00003 	mov	r0, r3
     294:	e28bd000 	add	sp, fp, #0
     298:	e49db004 	pop	{fp}		@ (ldr fp, [sp], #4)
     29c:	e12fff1e 	bx	lr

000002a0 <strchr>:

char*
strchr(const char *s, char c)
{
     2a0:	e52db004 	push	{fp}		@ (str fp, [sp, #-4]!)
     2a4:	e28db000 	add	fp, sp, #0
     2a8:	e24dd00c 	sub	sp, sp, #12
     2ac:	e50b0008 	str	r0, [fp, #-8]
     2b0:	e1a03001 	mov	r3, r1
     2b4:	e54b3009 	strb	r3, [fp, #-9]
  for(; *s; s++)
     2b8:	ea000009 	b	2e4 <strchr+0x44>
    if(*s == c)
     2bc:	e51b3008 	ldr	r3, [fp, #-8]
     2c0:	e5d33000 	ldrb	r3, [r3]
     2c4:	e55b2009 	ldrb	r2, [fp, #-9]
     2c8:	e1520003 	cmp	r2, r3
     2cc:	1a000001 	bne	2d8 <strchr+0x38>
      return (char*)s;
     2d0:	e51b3008 	ldr	r3, [fp, #-8]
     2d4:	ea000007 	b	2f8 <strchr+0x58>
  for(; *s; s++)
     2d8:	e51b3008 	ldr	r3, [fp, #-8]
     2dc:	e2833001 	add	r3, r3, #1
     2e0:	e50b3008 	str	r3, [fp, #-8]
     2e4:	e51b3008 	ldr	r3, [fp, #-8]
     2e8:	e5d33000 	ldrb	r3, [r3]
     2ec:	e3530000 	cmp	r3, #0
     2f0:	1afffff1 	bne	2bc <strchr+0x1c>
  return 0;
     2f4:	e3a03000 	mov	r3, #0
}
     2f8:	e1a00003 	mov	r0, r3
     2fc:	e28bd000 	add	sp, fp, #0
     300:	e49db004 	pop	{fp}		@ (ldr fp, [sp], #4)
     304:	e12fff1e 	bx	lr

00000308 <gets>:

char*
gets(char *buf, int max)
{
     308:	e92d4800 	push	{fp, lr}
     30c:	e28db004 	add	fp, sp, #4
     310:	e24dd018 	sub	sp, sp, #24
     314:	e50b0018 	str	r0, [fp, #-24]	@ 0xffffffe8
     318:	e50b101c 	str	r1, [fp, #-28]	@ 0xffffffe4
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
     31c:	e3a03000 	mov	r3, #0
     320:	e50b3008 	str	r3, [fp, #-8]
     324:	ea000016 	b	384 <gets+0x7c>
    cc = read(0, &c, 1);
     328:	e24b300d 	sub	r3, fp, #13
     32c:	e3a02001 	mov	r2, #1
     330:	e1a01003 	mov	r1, r3
     334:	e3a00000 	mov	r0, #0
     338:	eb0000a8 	bl	5e0 <read>
     33c:	e50b000c 	str	r0, [fp, #-12]
    if(cc < 1)
     340:	e51b300c 	ldr	r3, [fp, #-12]
     344:	e3530000 	cmp	r3, #0
     348:	da000013 	ble	39c <gets+0x94>
      break;
    buf[i++] = c;
     34c:	e51b3008 	ldr	r3, [fp, #-8]
     350:	e2832001 	add	r2, r3, #1
     354:	e50b2008 	str	r2, [fp, #-8]
     358:	e1a02003 	mov	r2, r3
     35c:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
     360:	e0833002 	add	r3, r3, r2
     364:	e55b200d 	ldrb	r2, [fp, #-13]
     368:	e5c32000 	strb	r2, [r3]
    if(c == '\n' || c == '\r')
     36c:	e55b300d 	ldrb	r3, [fp, #-13]
     370:	e353000a 	cmp	r3, #10
     374:	0a000009 	beq	3a0 <gets+0x98>
     378:	e55b300d 	ldrb	r3, [fp, #-13]
     37c:	e353000d 	cmp	r3, #13
     380:	0a000006 	beq	3a0 <gets+0x98>
  for(i=0; i+1 < max; ){
     384:	e51b3008 	ldr	r3, [fp, #-8]
     388:	e2833001 	add	r3, r3, #1
     38c:	e51b201c 	ldr	r2, [fp, #-28]	@ 0xffffffe4
     390:	e1520003 	cmp	r2, r3
     394:	caffffe3 	bgt	328 <gets+0x20>
     398:	ea000000 	b	3a0 <gets+0x98>
      break;
     39c:	e320f000 	nop	{0}
      break;
  }
  buf[i] = '\0';
     3a0:	e51b3008 	ldr	r3, [fp, #-8]
     3a4:	e51b2018 	ldr	r2, [fp, #-24]	@ 0xffffffe8
     3a8:	e0823003 	add	r3, r2, r3
     3ac:	e3a02000 	mov	r2, #0
     3b0:	e5c32000 	strb	r2, [r3]
  return buf;
     3b4:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
}
     3b8:	e1a00003 	mov	r0, r3
     3bc:	e24bd004 	sub	sp, fp, #4
     3c0:	e8bd8800 	pop	{fp, pc}

000003c4 <stat>:

int
stat(char *n, struct stat *st)
{
     3c4:	e92d4800 	push	{fp, lr}
     3c8:	e28db004 	add	fp, sp, #4
     3cc:	e24dd010 	sub	sp, sp, #16
     3d0:	e50b0010 	str	r0, [fp, #-16]
     3d4:	e50b1014 	str	r1, [fp, #-20]	@ 0xffffffec
  int fd;
  int r;

  fd = open(n, O_RDONLY);
     3d8:	e3a01000 	mov	r1, #0
     3dc:	e51b0010 	ldr	r0, [fp, #-16]
     3e0:	eb0000bf 	bl	6e4 <open>
     3e4:	e50b0008 	str	r0, [fp, #-8]
  if(fd < 0)
     3e8:	e51b3008 	ldr	r3, [fp, #-8]
     3ec:	e3530000 	cmp	r3, #0
     3f0:	aa000001 	bge	3fc <stat+0x38>
    return -1;
     3f4:	e3e03000 	mvn	r3, #0
     3f8:	ea000006 	b	418 <stat+0x54>
  r = fstat(fd, st);
     3fc:	e51b1014 	ldr	r1, [fp, #-20]	@ 0xffffffec
     400:	e51b0008 	ldr	r0, [fp, #-8]
     404:	eb0000dd 	bl	780 <fstat>
     408:	e50b000c 	str	r0, [fp, #-12]
  close(fd);
     40c:	e51b0008 	ldr	r0, [fp, #-8]
     410:	eb00008c 	bl	648 <close>
  return r;
     414:	e51b300c 	ldr	r3, [fp, #-12]
}
     418:	e1a00003 	mov	r0, r3
     41c:	e24bd004 	sub	sp, fp, #4
     420:	e8bd8800 	pop	{fp, pc}

00000424 <atoi>:

int
atoi(const char *s)
{
     424:	e52db004 	push	{fp}		@ (str fp, [sp, #-4]!)
     428:	e28db000 	add	fp, sp, #0
     42c:	e24dd014 	sub	sp, sp, #20
     430:	e50b0010 	str	r0, [fp, #-16]
  int n;

  n = 0;
     434:	e3a03000 	mov	r3, #0
     438:	e50b3008 	str	r3, [fp, #-8]
  while('0' <= *s && *s <= '9')
     43c:	ea000009 	b	468 <atoi+0x44>
    n = n*10 + *s++ - '0';
     440:	e51b3008 	ldr	r3, [fp, #-8]
     444:	e3a0200a 	mov	r2, #10
     448:	e0020392 	mul	r2, r2, r3
     44c:	e51b3010 	ldr	r3, [fp, #-16]
     450:	e2831001 	add	r1, r3, #1
     454:	e50b1010 	str	r1, [fp, #-16]
     458:	e5d33000 	ldrb	r3, [r3]
     45c:	e0823003 	add	r3, r2, r3
     460:	e2433030 	sub	r3, r3, #48	@ 0x30
     464:	e50b3008 	str	r3, [fp, #-8]
  while('0' <= *s && *s <= '9')
     468:	e51b3010 	ldr	r3, [fp, #-16]
     46c:	e5d33000 	ldrb	r3, [r3]
     470:	e353002f 	cmp	r3, #47	@ 0x2f
     474:	9a000003 	bls	488 <atoi+0x64>
     478:	e51b3010 	ldr	r3, [fp, #-16]
     47c:	e5d33000 	ldrb	r3, [r3]
     480:	e3530039 	cmp	r3, #57	@ 0x39
     484:	9affffed 	bls	440 <atoi+0x1c>
  return n;
     488:	e51b3008 	ldr	r3, [fp, #-8]
}
     48c:	e1a00003 	mov	r0, r3
     490:	e28bd000 	add	sp, fp, #0
     494:	e49db004 	pop	{fp}		@ (ldr fp, [sp], #4)
     498:	e12fff1e 	bx	lr

0000049c <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
     49c:	e52db004 	push	{fp}		@ (str fp, [sp, #-4]!)
     4a0:	e28db000 	add	fp, sp, #0
     4a4:	e24dd01c 	sub	sp, sp, #28
     4a8:	e50b0010 	str	r0, [fp, #-16]
     4ac:	e50b1014 	str	r1, [fp, #-20]	@ 0xffffffec
     4b0:	e50b2018 	str	r2, [fp, #-24]	@ 0xffffffe8
  char *dst, *src;
  
  dst = vdst;
     4b4:	e51b3010 	ldr	r3, [fp, #-16]
     4b8:	e50b3008 	str	r3, [fp, #-8]
  src = vsrc;
     4bc:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
     4c0:	e50b300c 	str	r3, [fp, #-12]
  while(n-- > 0)
     4c4:	ea000007 	b	4e8 <memmove+0x4c>
    *dst++ = *src++;
     4c8:	e51b200c 	ldr	r2, [fp, #-12]
     4cc:	e2823001 	add	r3, r2, #1
     4d0:	e50b300c 	str	r3, [fp, #-12]
     4d4:	e51b3008 	ldr	r3, [fp, #-8]
     4d8:	e2831001 	add	r1, r3, #1
     4dc:	e50b1008 	str	r1, [fp, #-8]
     4e0:	e5d22000 	ldrb	r2, [r2]
     4e4:	e5c32000 	strb	r2, [r3]
  while(n-- > 0)
     4e8:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
     4ec:	e2432001 	sub	r2, r3, #1
     4f0:	e50b2018 	str	r2, [fp, #-24]	@ 0xffffffe8
     4f4:	e3530000 	cmp	r3, #0
     4f8:	cafffff2 	bgt	4c8 <memmove+0x2c>
  return vdst;
     4fc:	e51b3010 	ldr	r3, [fp, #-16]
}
     500:	e1a00003 	mov	r0, r3
     504:	e28bd000 	add	sp, fp, #0
     508:	e49db004 	pop	{fp}		@ (ldr fp, [sp], #4)
     50c:	e12fff1e 	bx	lr

00000510 <fork>:
     510:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
     514:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
     518:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
     51c:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
     520:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
     524:	e3a00001 	mov	r0, #1
     528:	ef000040 	svc	0x00000040
     52c:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     530:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     534:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
     538:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
     53c:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
     540:	e12fff1e 	bx	lr

00000544 <exit>:
     544:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
     548:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
     54c:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
     550:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
     554:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
     558:	e3a00002 	mov	r0, #2
     55c:	ef000040 	svc	0x00000040
     560:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     564:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     568:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
     56c:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
     570:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
     574:	e12fff1e 	bx	lr

00000578 <wait>:
     578:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
     57c:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
     580:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
     584:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
     588:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
     58c:	e3a00003 	mov	r0, #3
     590:	ef000040 	svc	0x00000040
     594:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     598:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     59c:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
     5a0:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
     5a4:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
     5a8:	e12fff1e 	bx	lr

000005ac <pipe>:
     5ac:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
     5b0:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
     5b4:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
     5b8:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
     5bc:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
     5c0:	e3a00004 	mov	r0, #4
     5c4:	ef000040 	svc	0x00000040
     5c8:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     5cc:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     5d0:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
     5d4:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
     5d8:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
     5dc:	e12fff1e 	bx	lr

000005e0 <read>:
     5e0:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
     5e4:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
     5e8:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
     5ec:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
     5f0:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
     5f4:	e3a00005 	mov	r0, #5
     5f8:	ef000040 	svc	0x00000040
     5fc:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     600:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     604:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
     608:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
     60c:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
     610:	e12fff1e 	bx	lr

00000614 <write>:
     614:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
     618:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
     61c:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
     620:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
     624:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
     628:	e3a00010 	mov	r0, #16
     62c:	ef000040 	svc	0x00000040
     630:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     634:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     638:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
     63c:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
     640:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
     644:	e12fff1e 	bx	lr

00000648 <close>:
     648:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
     64c:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
     650:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
     654:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
     658:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
     65c:	e3a00015 	mov	r0, #21
     660:	ef000040 	svc	0x00000040
     664:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     668:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     66c:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
     670:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
     674:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
     678:	e12fff1e 	bx	lr

0000067c <kill>:
     67c:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
     680:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
     684:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
     688:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
     68c:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
     690:	e3a00006 	mov	r0, #6
     694:	ef000040 	svc	0x00000040
     698:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     69c:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     6a0:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
     6a4:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
     6a8:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
     6ac:	e12fff1e 	bx	lr

000006b0 <exec>:
     6b0:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
     6b4:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
     6b8:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
     6bc:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
     6c0:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
     6c4:	e3a00007 	mov	r0, #7
     6c8:	ef000040 	svc	0x00000040
     6cc:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     6d0:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     6d4:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
     6d8:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
     6dc:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
     6e0:	e12fff1e 	bx	lr

000006e4 <open>:
     6e4:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
     6e8:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
     6ec:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
     6f0:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
     6f4:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
     6f8:	e3a0000f 	mov	r0, #15
     6fc:	ef000040 	svc	0x00000040
     700:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     704:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     708:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
     70c:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
     710:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
     714:	e12fff1e 	bx	lr

00000718 <mknod>:
     718:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
     71c:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
     720:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
     724:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
     728:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
     72c:	e3a00011 	mov	r0, #17
     730:	ef000040 	svc	0x00000040
     734:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     738:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     73c:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
     740:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
     744:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
     748:	e12fff1e 	bx	lr

0000074c <unlink>:
     74c:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
     750:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
     754:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
     758:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
     75c:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
     760:	e3a00012 	mov	r0, #18
     764:	ef000040 	svc	0x00000040
     768:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     76c:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     770:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
     774:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
     778:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
     77c:	e12fff1e 	bx	lr

00000780 <fstat>:
     780:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
     784:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
     788:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
     78c:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
     790:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
     794:	e3a00008 	mov	r0, #8
     798:	ef000040 	svc	0x00000040
     79c:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     7a0:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     7a4:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
     7a8:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
     7ac:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
     7b0:	e12fff1e 	bx	lr

000007b4 <link>:
     7b4:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
     7b8:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
     7bc:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
     7c0:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
     7c4:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
     7c8:	e3a00013 	mov	r0, #19
     7cc:	ef000040 	svc	0x00000040
     7d0:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     7d4:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     7d8:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
     7dc:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
     7e0:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
     7e4:	e12fff1e 	bx	lr

000007e8 <mkdir>:
     7e8:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
     7ec:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
     7f0:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
     7f4:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
     7f8:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
     7fc:	e3a00014 	mov	r0, #20
     800:	ef000040 	svc	0x00000040
     804:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     808:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     80c:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
     810:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
     814:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
     818:	e12fff1e 	bx	lr

0000081c <chdir>:
     81c:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
     820:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
     824:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
     828:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
     82c:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
     830:	e3a00009 	mov	r0, #9
     834:	ef000040 	svc	0x00000040
     838:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     83c:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     840:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
     844:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
     848:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
     84c:	e12fff1e 	bx	lr

00000850 <dup>:
     850:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
     854:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
     858:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
     85c:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
     860:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
     864:	e3a0000a 	mov	r0, #10
     868:	ef000040 	svc	0x00000040
     86c:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     870:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     874:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
     878:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
     87c:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
     880:	e12fff1e 	bx	lr

00000884 <getpid>:
     884:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
     888:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
     88c:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
     890:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
     894:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
     898:	e3a0000b 	mov	r0, #11
     89c:	ef000040 	svc	0x00000040
     8a0:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     8a4:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     8a8:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
     8ac:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
     8b0:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
     8b4:	e12fff1e 	bx	lr

000008b8 <sbrk>:
     8b8:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
     8bc:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
     8c0:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
     8c4:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
     8c8:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
     8cc:	e3a0000c 	mov	r0, #12
     8d0:	ef000040 	svc	0x00000040
     8d4:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     8d8:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     8dc:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
     8e0:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
     8e4:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
     8e8:	e12fff1e 	bx	lr

000008ec <sleep>:
     8ec:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
     8f0:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
     8f4:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
     8f8:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
     8fc:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
     900:	e3a0000d 	mov	r0, #13
     904:	ef000040 	svc	0x00000040
     908:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     90c:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     910:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
     914:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
     918:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
     91c:	e12fff1e 	bx	lr

00000920 <uptime>:
     920:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
     924:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
     928:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
     92c:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
     930:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
     934:	e3a0000e 	mov	r0, #14
     938:	ef000040 	svc	0x00000040
     93c:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     940:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     944:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
     948:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
     94c:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
     950:	e12fff1e 	bx	lr

00000954 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
     954:	e92d4800 	push	{fp, lr}
     958:	e28db004 	add	fp, sp, #4
     95c:	e24dd008 	sub	sp, sp, #8
     960:	e50b0008 	str	r0, [fp, #-8]
     964:	e1a03001 	mov	r3, r1
     968:	e54b3009 	strb	r3, [fp, #-9]
  write(fd, &c, 1);
     96c:	e24b3009 	sub	r3, fp, #9
     970:	e3a02001 	mov	r2, #1
     974:	e1a01003 	mov	r1, r3
     978:	e51b0008 	ldr	r0, [fp, #-8]
     97c:	ebffff24 	bl	614 <write>
}
     980:	e320f000 	nop	{0}
     984:	e24bd004 	sub	sp, fp, #4
     988:	e8bd8800 	pop	{fp, pc}

0000098c <div>:

u32 div(u32 n, u32 d)  // long division
{
     98c:	e52db004 	push	{fp}		@ (str fp, [sp, #-4]!)
     990:	e28db000 	add	fp, sp, #0
     994:	e24dd01c 	sub	sp, sp, #28
     998:	e50b0018 	str	r0, [fp, #-24]	@ 0xffffffe8
     99c:	e50b101c 	str	r1, [fp, #-28]	@ 0xffffffe4
    u32 q=0, r=0;
     9a0:	e3a03000 	mov	r3, #0
     9a4:	e50b3008 	str	r3, [fp, #-8]
     9a8:	e3a03000 	mov	r3, #0
     9ac:	e50b300c 	str	r3, [fp, #-12]
    int i;

    for(i=31;i>=0;i--){
     9b0:	e3a0301f 	mov	r3, #31
     9b4:	e50b3010 	str	r3, [fp, #-16]
     9b8:	ea00001b 	b	a2c <div+0xa0>
        r = r << 1;
     9bc:	e51b300c 	ldr	r3, [fp, #-12]
     9c0:	e1a03083 	lsl	r3, r3, #1
     9c4:	e50b300c 	str	r3, [fp, #-12]
        r = r | ((n >> i) & 1);
     9c8:	e51b2018 	ldr	r2, [fp, #-24]	@ 0xffffffe8
     9cc:	e51b3010 	ldr	r3, [fp, #-16]
     9d0:	e1a03332 	lsr	r3, r2, r3
     9d4:	e2033001 	and	r3, r3, #1
     9d8:	e51b200c 	ldr	r2, [fp, #-12]
     9dc:	e1823003 	orr	r3, r2, r3
     9e0:	e50b300c 	str	r3, [fp, #-12]
        if(r >= d) {
     9e4:	e51b200c 	ldr	r2, [fp, #-12]
     9e8:	e51b301c 	ldr	r3, [fp, #-28]	@ 0xffffffe4
     9ec:	e1520003 	cmp	r2, r3
     9f0:	3a00000a 	bcc	a20 <div+0x94>
            r = r - d;
     9f4:	e51b200c 	ldr	r2, [fp, #-12]
     9f8:	e51b301c 	ldr	r3, [fp, #-28]	@ 0xffffffe4
     9fc:	e0423003 	sub	r3, r2, r3
     a00:	e50b300c 	str	r3, [fp, #-12]
            q = q | (1 << i);
     a04:	e3a02001 	mov	r2, #1
     a08:	e51b3010 	ldr	r3, [fp, #-16]
     a0c:	e1a03312 	lsl	r3, r2, r3
     a10:	e1a02003 	mov	r2, r3
     a14:	e51b3008 	ldr	r3, [fp, #-8]
     a18:	e1833002 	orr	r3, r3, r2
     a1c:	e50b3008 	str	r3, [fp, #-8]
    for(i=31;i>=0;i--){
     a20:	e51b3010 	ldr	r3, [fp, #-16]
     a24:	e2433001 	sub	r3, r3, #1
     a28:	e50b3010 	str	r3, [fp, #-16]
     a2c:	e51b3010 	ldr	r3, [fp, #-16]
     a30:	e3530000 	cmp	r3, #0
     a34:	aaffffe0 	bge	9bc <div+0x30>
        }
    }
    return q;
     a38:	e51b3008 	ldr	r3, [fp, #-8]
}
     a3c:	e1a00003 	mov	r0, r3
     a40:	e28bd000 	add	sp, fp, #0
     a44:	e49db004 	pop	{fp}		@ (ldr fp, [sp], #4)
     a48:	e12fff1e 	bx	lr

00000a4c <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
     a4c:	e92d4800 	push	{fp, lr}
     a50:	e28db004 	add	fp, sp, #4
     a54:	e24dd038 	sub	sp, sp, #56	@ 0x38
     a58:	e50b0030 	str	r0, [fp, #-48]	@ 0xffffffd0
     a5c:	e50b1034 	str	r1, [fp, #-52]	@ 0xffffffcc
     a60:	e50b2038 	str	r2, [fp, #-56]	@ 0xffffffc8
     a64:	e50b303c 	str	r3, [fp, #-60]	@ 0xffffffc4
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x, y, b;

  neg = 0;
     a68:	e3a03000 	mov	r3, #0
     a6c:	e50b300c 	str	r3, [fp, #-12]
  if(sgn && xx < 0){
     a70:	e51b303c 	ldr	r3, [fp, #-60]	@ 0xffffffc4
     a74:	e3530000 	cmp	r3, #0
     a78:	0a000008 	beq	aa0 <printint+0x54>
     a7c:	e51b3034 	ldr	r3, [fp, #-52]	@ 0xffffffcc
     a80:	e3530000 	cmp	r3, #0
     a84:	aa000005 	bge	aa0 <printint+0x54>
    neg = 1;
     a88:	e3a03001 	mov	r3, #1
     a8c:	e50b300c 	str	r3, [fp, #-12]
    x = -xx;
     a90:	e51b3034 	ldr	r3, [fp, #-52]	@ 0xffffffcc
     a94:	e2633000 	rsb	r3, r3, #0
     a98:	e50b3010 	str	r3, [fp, #-16]
     a9c:	ea000001 	b	aa8 <printint+0x5c>
  } else {
    x = xx;
     aa0:	e51b3034 	ldr	r3, [fp, #-52]	@ 0xffffffcc
     aa4:	e50b3010 	str	r3, [fp, #-16]
  }

  b = base;
     aa8:	e51b3038 	ldr	r3, [fp, #-56]	@ 0xffffffc8
     aac:	e50b3014 	str	r3, [fp, #-20]	@ 0xffffffec
  i = 0;
     ab0:	e3a03000 	mov	r3, #0
     ab4:	e50b3008 	str	r3, [fp, #-8]
  do{
    y = div(x, b);
     ab8:	e51b1014 	ldr	r1, [fp, #-20]	@ 0xffffffec
     abc:	e51b0010 	ldr	r0, [fp, #-16]
     ac0:	ebffffb1 	bl	98c <div>
     ac4:	e50b0018 	str	r0, [fp, #-24]	@ 0xffffffe8
    buf[i++] = digits[x - y * b];
     ac8:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
     acc:	e51b2014 	ldr	r2, [fp, #-20]	@ 0xffffffec
     ad0:	e0030392 	mul	r3, r2, r3
     ad4:	e51b2010 	ldr	r2, [fp, #-16]
     ad8:	e0421003 	sub	r1, r2, r3
     adc:	e51b2008 	ldr	r2, [fp, #-8]
     ae0:	e2823001 	add	r3, r2, #1
     ae4:	e50b3008 	str	r3, [fp, #-8]
     ae8:	e30131b0 	movw	r3, #4528	@ 0x11b0
     aec:	e3403000 	movt	r3, #0
     af0:	e7d31001 	ldrb	r1, [r3, r1]
     af4:	e2423004 	sub	r3, r2, #4
     af8:	e083300b 	add	r3, r3, fp
     afc:	e1a02001 	mov	r2, r1
     b00:	e5432024 	strb	r2, [r3, #-36]	@ 0xffffffdc
  }while((x = y) != 0);
     b04:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
     b08:	e50b3010 	str	r3, [fp, #-16]
     b0c:	e51b3010 	ldr	r3, [fp, #-16]
     b10:	e3530000 	cmp	r3, #0
     b14:	1affffe7 	bne	ab8 <printint+0x6c>
  if(neg)
     b18:	e51b300c 	ldr	r3, [fp, #-12]
     b1c:	e3530000 	cmp	r3, #0
     b20:	0a00000e 	beq	b60 <printint+0x114>
    buf[i++] = '-';
     b24:	e51b3008 	ldr	r3, [fp, #-8]
     b28:	e2832001 	add	r2, r3, #1
     b2c:	e50b2008 	str	r2, [fp, #-8]
     b30:	e2433004 	sub	r3, r3, #4
     b34:	e083300b 	add	r3, r3, fp
     b38:	e3a0202d 	mov	r2, #45	@ 0x2d
     b3c:	e5432024 	strb	r2, [r3, #-36]	@ 0xffffffdc

  while(--i >= 0)
     b40:	ea000006 	b	b60 <printint+0x114>
    putc(fd, buf[i]);
     b44:	e24b2028 	sub	r2, fp, #40	@ 0x28
     b48:	e51b3008 	ldr	r3, [fp, #-8]
     b4c:	e0823003 	add	r3, r2, r3
     b50:	e5d33000 	ldrb	r3, [r3]
     b54:	e1a01003 	mov	r1, r3
     b58:	e51b0030 	ldr	r0, [fp, #-48]	@ 0xffffffd0
     b5c:	ebffff7c 	bl	954 <putc>
  while(--i >= 0)
     b60:	e51b3008 	ldr	r3, [fp, #-8]
     b64:	e2433001 	sub	r3, r3, #1
     b68:	e50b3008 	str	r3, [fp, #-8]
     b6c:	e51b3008 	ldr	r3, [fp, #-8]
     b70:	e3530000 	cmp	r3, #0
     b74:	aafffff2 	bge	b44 <printint+0xf8>
}
     b78:	e320f000 	nop	{0}
     b7c:	e320f000 	nop	{0}
     b80:	e24bd004 	sub	sp, fp, #4
     b84:	e8bd8800 	pop	{fp, pc}

00000b88 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
     b88:	e92d000e 	push	{r1, r2, r3}
     b8c:	e92d4800 	push	{fp, lr}
     b90:	e28db004 	add	fp, sp, #4
     b94:	e24dd024 	sub	sp, sp, #36	@ 0x24
     b98:	e50b0024 	str	r0, [fp, #-36]	@ 0xffffffdc
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
     b9c:	e3a03000 	mov	r3, #0
     ba0:	e50b3014 	str	r3, [fp, #-20]	@ 0xffffffec
  ap = (uint*)(void*)&fmt + 1;
     ba4:	e28b3008 	add	r3, fp, #8
     ba8:	e50b3018 	str	r3, [fp, #-24]	@ 0xffffffe8
  for(i = 0; fmt[i]; i++){
     bac:	e3a03000 	mov	r3, #0
     bb0:	e50b3010 	str	r3, [fp, #-16]
     bb4:	ea000075 	b	d90 <printf+0x208>
    c = fmt[i] & 0xff;
     bb8:	e59b2004 	ldr	r2, [fp, #4]
     bbc:	e51b3010 	ldr	r3, [fp, #-16]
     bc0:	e0823003 	add	r3, r2, r3
     bc4:	e5d33000 	ldrb	r3, [r3]
     bc8:	e50b301c 	str	r3, [fp, #-28]	@ 0xffffffe4
    if(state == 0){
     bcc:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
     bd0:	e3530000 	cmp	r3, #0
     bd4:	1a00000b 	bne	c08 <printf+0x80>
      if(c == '%'){
     bd8:	e51b301c 	ldr	r3, [fp, #-28]	@ 0xffffffe4
     bdc:	e3530025 	cmp	r3, #37	@ 0x25
     be0:	1a000002 	bne	bf0 <printf+0x68>
        state = '%';
     be4:	e3a03025 	mov	r3, #37	@ 0x25
     be8:	e50b3014 	str	r3, [fp, #-20]	@ 0xffffffec
     bec:	ea000064 	b	d84 <printf+0x1fc>
      } else {
        putc(fd, c);
     bf0:	e51b301c 	ldr	r3, [fp, #-28]	@ 0xffffffe4
     bf4:	e6ef3073 	uxtb	r3, r3
     bf8:	e1a01003 	mov	r1, r3
     bfc:	e51b0024 	ldr	r0, [fp, #-36]	@ 0xffffffdc
     c00:	ebffff53 	bl	954 <putc>
     c04:	ea00005e 	b	d84 <printf+0x1fc>
      }
    } else if(state == '%'){
     c08:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
     c0c:	e3530025 	cmp	r3, #37	@ 0x25
     c10:	1a00005b 	bne	d84 <printf+0x1fc>
      if(c == 'd'){
     c14:	e51b301c 	ldr	r3, [fp, #-28]	@ 0xffffffe4
     c18:	e3530064 	cmp	r3, #100	@ 0x64
     c1c:	1a00000a 	bne	c4c <printf+0xc4>
        printint(fd, *ap, 10, 1);
     c20:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
     c24:	e5933000 	ldr	r3, [r3]
     c28:	e1a01003 	mov	r1, r3
     c2c:	e3a03001 	mov	r3, #1
     c30:	e3a0200a 	mov	r2, #10
     c34:	e51b0024 	ldr	r0, [fp, #-36]	@ 0xffffffdc
     c38:	ebffff83 	bl	a4c <printint>
        ap++;
     c3c:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
     c40:	e2833004 	add	r3, r3, #4
     c44:	e50b3018 	str	r3, [fp, #-24]	@ 0xffffffe8
     c48:	ea00004b 	b	d7c <printf+0x1f4>
      } else if(c == 'x' || c == 'p'){
     c4c:	e51b301c 	ldr	r3, [fp, #-28]	@ 0xffffffe4
     c50:	e3530078 	cmp	r3, #120	@ 0x78
     c54:	0a000002 	beq	c64 <printf+0xdc>
     c58:	e51b301c 	ldr	r3, [fp, #-28]	@ 0xffffffe4
     c5c:	e3530070 	cmp	r3, #112	@ 0x70
     c60:	1a00000a 	bne	c90 <printf+0x108>
        printint(fd, *ap, 16, 0);
     c64:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
     c68:	e5933000 	ldr	r3, [r3]
     c6c:	e1a01003 	mov	r1, r3
     c70:	e3a03000 	mov	r3, #0
     c74:	e3a02010 	mov	r2, #16
     c78:	e51b0024 	ldr	r0, [fp, #-36]	@ 0xffffffdc
     c7c:	ebffff72 	bl	a4c <printint>
        ap++;
     c80:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
     c84:	e2833004 	add	r3, r3, #4
     c88:	e50b3018 	str	r3, [fp, #-24]	@ 0xffffffe8
     c8c:	ea00003a 	b	d7c <printf+0x1f4>
      } else if(c == 's'){
     c90:	e51b301c 	ldr	r3, [fp, #-28]	@ 0xffffffe4
     c94:	e3530073 	cmp	r3, #115	@ 0x73
     c98:	1a000019 	bne	d04 <printf+0x17c>
        s = (char*)*ap;
     c9c:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
     ca0:	e5933000 	ldr	r3, [r3]
     ca4:	e50b300c 	str	r3, [fp, #-12]
        ap++;
     ca8:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
     cac:	e2833004 	add	r3, r3, #4
     cb0:	e50b3018 	str	r3, [fp, #-24]	@ 0xffffffe8
        if(s == 0)
     cb4:	e51b300c 	ldr	r3, [fp, #-12]
     cb8:	e3530000 	cmp	r3, #0
     cbc:	1a00000b 	bne	cf0 <printf+0x168>
          s = "(null)";
     cc0:	e30131a0 	movw	r3, #4512	@ 0x11a0
     cc4:	e3403000 	movt	r3, #0
     cc8:	e50b300c 	str	r3, [fp, #-12]
        while(*s != 0){
     ccc:	ea000007 	b	cf0 <printf+0x168>
          putc(fd, *s);
     cd0:	e51b300c 	ldr	r3, [fp, #-12]
     cd4:	e5d33000 	ldrb	r3, [r3]
     cd8:	e1a01003 	mov	r1, r3
     cdc:	e51b0024 	ldr	r0, [fp, #-36]	@ 0xffffffdc
     ce0:	ebffff1b 	bl	954 <putc>
          s++;
     ce4:	e51b300c 	ldr	r3, [fp, #-12]
     ce8:	e2833001 	add	r3, r3, #1
     cec:	e50b300c 	str	r3, [fp, #-12]
        while(*s != 0){
     cf0:	e51b300c 	ldr	r3, [fp, #-12]
     cf4:	e5d33000 	ldrb	r3, [r3]
     cf8:	e3530000 	cmp	r3, #0
     cfc:	1afffff3 	bne	cd0 <printf+0x148>
     d00:	ea00001d 	b	d7c <printf+0x1f4>
        }
      } else if(c == 'c'){
     d04:	e51b301c 	ldr	r3, [fp, #-28]	@ 0xffffffe4
     d08:	e3530063 	cmp	r3, #99	@ 0x63
     d0c:	1a000009 	bne	d38 <printf+0x1b0>
        putc(fd, *ap);
     d10:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
     d14:	e5933000 	ldr	r3, [r3]
     d18:	e6ef3073 	uxtb	r3, r3
     d1c:	e1a01003 	mov	r1, r3
     d20:	e51b0024 	ldr	r0, [fp, #-36]	@ 0xffffffdc
     d24:	ebffff0a 	bl	954 <putc>
        ap++;
     d28:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
     d2c:	e2833004 	add	r3, r3, #4
     d30:	e50b3018 	str	r3, [fp, #-24]	@ 0xffffffe8
     d34:	ea000010 	b	d7c <printf+0x1f4>
      } else if(c == '%'){
     d38:	e51b301c 	ldr	r3, [fp, #-28]	@ 0xffffffe4
     d3c:	e3530025 	cmp	r3, #37	@ 0x25
     d40:	1a000005 	bne	d5c <printf+0x1d4>
        putc(fd, c);
     d44:	e51b301c 	ldr	r3, [fp, #-28]	@ 0xffffffe4
     d48:	e6ef3073 	uxtb	r3, r3
     d4c:	e1a01003 	mov	r1, r3
     d50:	e51b0024 	ldr	r0, [fp, #-36]	@ 0xffffffdc
     d54:	ebfffefe 	bl	954 <putc>
     d58:	ea000007 	b	d7c <printf+0x1f4>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
     d5c:	e3a01025 	mov	r1, #37	@ 0x25
     d60:	e51b0024 	ldr	r0, [fp, #-36]	@ 0xffffffdc
     d64:	ebfffefa 	bl	954 <putc>
        putc(fd, c);
     d68:	e51b301c 	ldr	r3, [fp, #-28]	@ 0xffffffe4
     d6c:	e6ef3073 	uxtb	r3, r3
     d70:	e1a01003 	mov	r1, r3
     d74:	e51b0024 	ldr	r0, [fp, #-36]	@ 0xffffffdc
     d78:	ebfffef5 	bl	954 <putc>
      }
      state = 0;
     d7c:	e3a03000 	mov	r3, #0
     d80:	e50b3014 	str	r3, [fp, #-20]	@ 0xffffffec
  for(i = 0; fmt[i]; i++){
     d84:	e51b3010 	ldr	r3, [fp, #-16]
     d88:	e2833001 	add	r3, r3, #1
     d8c:	e50b3010 	str	r3, [fp, #-16]
     d90:	e59b2004 	ldr	r2, [fp, #4]
     d94:	e51b3010 	ldr	r3, [fp, #-16]
     d98:	e0823003 	add	r3, r2, r3
     d9c:	e5d33000 	ldrb	r3, [r3]
     da0:	e3530000 	cmp	r3, #0
     da4:	1affff83 	bne	bb8 <printf+0x30>
    }
  }
}
     da8:	e320f000 	nop	{0}
     dac:	e320f000 	nop	{0}
     db0:	e24bd004 	sub	sp, fp, #4
     db4:	e8bd4800 	pop	{fp, lr}
     db8:	e28dd00c 	add	sp, sp, #12
     dbc:	e12fff1e 	bx	lr

00000dc0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
     dc0:	e52db004 	push	{fp}		@ (str fp, [sp, #-4]!)
     dc4:	e28db000 	add	fp, sp, #0
     dc8:	e24dd014 	sub	sp, sp, #20
     dcc:	e50b0010 	str	r0, [fp, #-16]
  Header *bp, *p;

  bp = (Header*)ap - 1;
     dd0:	e51b3010 	ldr	r3, [fp, #-16]
     dd4:	e2433008 	sub	r3, r3, #8
     dd8:	e50b300c 	str	r3, [fp, #-12]
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
     ddc:	e30131cc 	movw	r3, #4556	@ 0x11cc
     de0:	e3403000 	movt	r3, #0
     de4:	e5933000 	ldr	r3, [r3]
     de8:	e50b3008 	str	r3, [fp, #-8]
     dec:	ea000010 	b	e34 <free+0x74>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
     df0:	e51b3008 	ldr	r3, [fp, #-8]
     df4:	e5933000 	ldr	r3, [r3]
     df8:	e51b2008 	ldr	r2, [fp, #-8]
     dfc:	e1520003 	cmp	r2, r3
     e00:	3a000008 	bcc	e28 <free+0x68>
     e04:	e51b200c 	ldr	r2, [fp, #-12]
     e08:	e51b3008 	ldr	r3, [fp, #-8]
     e0c:	e1520003 	cmp	r2, r3
     e10:	8a000010 	bhi	e58 <free+0x98>
     e14:	e51b3008 	ldr	r3, [fp, #-8]
     e18:	e5933000 	ldr	r3, [r3]
     e1c:	e51b200c 	ldr	r2, [fp, #-12]
     e20:	e1520003 	cmp	r2, r3
     e24:	3a00000b 	bcc	e58 <free+0x98>
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
     e28:	e51b3008 	ldr	r3, [fp, #-8]
     e2c:	e5933000 	ldr	r3, [r3]
     e30:	e50b3008 	str	r3, [fp, #-8]
     e34:	e51b200c 	ldr	r2, [fp, #-12]
     e38:	e51b3008 	ldr	r3, [fp, #-8]
     e3c:	e1520003 	cmp	r2, r3
     e40:	9affffea 	bls	df0 <free+0x30>
     e44:	e51b3008 	ldr	r3, [fp, #-8]
     e48:	e5933000 	ldr	r3, [r3]
     e4c:	e51b200c 	ldr	r2, [fp, #-12]
     e50:	e1520003 	cmp	r2, r3
     e54:	2affffe5 	bcs	df0 <free+0x30>
      break;
  if(bp + bp->s.size == p->s.ptr){
     e58:	e51b300c 	ldr	r3, [fp, #-12]
     e5c:	e5933004 	ldr	r3, [r3, #4]
     e60:	e1a03183 	lsl	r3, r3, #3
     e64:	e51b200c 	ldr	r2, [fp, #-12]
     e68:	e0822003 	add	r2, r2, r3
     e6c:	e51b3008 	ldr	r3, [fp, #-8]
     e70:	e5933000 	ldr	r3, [r3]
     e74:	e1520003 	cmp	r2, r3
     e78:	1a00000d 	bne	eb4 <free+0xf4>
    bp->s.size += p->s.ptr->s.size;
     e7c:	e51b300c 	ldr	r3, [fp, #-12]
     e80:	e5932004 	ldr	r2, [r3, #4]
     e84:	e51b3008 	ldr	r3, [fp, #-8]
     e88:	e5933000 	ldr	r3, [r3]
     e8c:	e5933004 	ldr	r3, [r3, #4]
     e90:	e0822003 	add	r2, r2, r3
     e94:	e51b300c 	ldr	r3, [fp, #-12]
     e98:	e5832004 	str	r2, [r3, #4]
    bp->s.ptr = p->s.ptr->s.ptr;
     e9c:	e51b3008 	ldr	r3, [fp, #-8]
     ea0:	e5933000 	ldr	r3, [r3]
     ea4:	e5932000 	ldr	r2, [r3]
     ea8:	e51b300c 	ldr	r3, [fp, #-12]
     eac:	e5832000 	str	r2, [r3]
     eb0:	ea000003 	b	ec4 <free+0x104>
  } else
    bp->s.ptr = p->s.ptr;
     eb4:	e51b3008 	ldr	r3, [fp, #-8]
     eb8:	e5932000 	ldr	r2, [r3]
     ebc:	e51b300c 	ldr	r3, [fp, #-12]
     ec0:	e5832000 	str	r2, [r3]
  if(p + p->s.size == bp){
     ec4:	e51b3008 	ldr	r3, [fp, #-8]
     ec8:	e5933004 	ldr	r3, [r3, #4]
     ecc:	e1a03183 	lsl	r3, r3, #3
     ed0:	e51b2008 	ldr	r2, [fp, #-8]
     ed4:	e0823003 	add	r3, r2, r3
     ed8:	e51b200c 	ldr	r2, [fp, #-12]
     edc:	e1520003 	cmp	r2, r3
     ee0:	1a00000b 	bne	f14 <free+0x154>
    p->s.size += bp->s.size;
     ee4:	e51b3008 	ldr	r3, [fp, #-8]
     ee8:	e5932004 	ldr	r2, [r3, #4]
     eec:	e51b300c 	ldr	r3, [fp, #-12]
     ef0:	e5933004 	ldr	r3, [r3, #4]
     ef4:	e0822003 	add	r2, r2, r3
     ef8:	e51b3008 	ldr	r3, [fp, #-8]
     efc:	e5832004 	str	r2, [r3, #4]
    p->s.ptr = bp->s.ptr;
     f00:	e51b300c 	ldr	r3, [fp, #-12]
     f04:	e5932000 	ldr	r2, [r3]
     f08:	e51b3008 	ldr	r3, [fp, #-8]
     f0c:	e5832000 	str	r2, [r3]
     f10:	ea000002 	b	f20 <free+0x160>
  } else
    p->s.ptr = bp;
     f14:	e51b3008 	ldr	r3, [fp, #-8]
     f18:	e51b200c 	ldr	r2, [fp, #-12]
     f1c:	e5832000 	str	r2, [r3]
  freep = p;
     f20:	e30131cc 	movw	r3, #4556	@ 0x11cc
     f24:	e3403000 	movt	r3, #0
     f28:	e51b2008 	ldr	r2, [fp, #-8]
     f2c:	e5832000 	str	r2, [r3]
}
     f30:	e320f000 	nop	{0}
     f34:	e28bd000 	add	sp, fp, #0
     f38:	e49db004 	pop	{fp}		@ (ldr fp, [sp], #4)
     f3c:	e12fff1e 	bx	lr

00000f40 <morecore>:

static Header*
morecore(uint nu)
{
     f40:	e92d4800 	push	{fp, lr}
     f44:	e28db004 	add	fp, sp, #4
     f48:	e24dd010 	sub	sp, sp, #16
     f4c:	e50b0010 	str	r0, [fp, #-16]
  char *p;
  Header *hp;

  if(nu < 4096)
     f50:	e51b3010 	ldr	r3, [fp, #-16]
     f54:	e3530a01 	cmp	r3, #4096	@ 0x1000
     f58:	2a000001 	bcs	f64 <morecore+0x24>
    nu = 4096;
     f5c:	e3a03a01 	mov	r3, #4096	@ 0x1000
     f60:	e50b3010 	str	r3, [fp, #-16]
  p = sbrk(nu * sizeof(Header));
     f64:	e51b3010 	ldr	r3, [fp, #-16]
     f68:	e1a03183 	lsl	r3, r3, #3
     f6c:	e1a00003 	mov	r0, r3
     f70:	ebfffe50 	bl	8b8 <sbrk>
     f74:	e50b0008 	str	r0, [fp, #-8]
  if(p == (char*)-1)
     f78:	e51b3008 	ldr	r3, [fp, #-8]
     f7c:	e3730001 	cmn	r3, #1
     f80:	1a000001 	bne	f8c <morecore+0x4c>
    return 0;
     f84:	e3a03000 	mov	r3, #0
     f88:	ea00000b 	b	fbc <morecore+0x7c>
  hp = (Header*)p;
     f8c:	e51b3008 	ldr	r3, [fp, #-8]
     f90:	e50b300c 	str	r3, [fp, #-12]
  hp->s.size = nu;
     f94:	e51b300c 	ldr	r3, [fp, #-12]
     f98:	e51b2010 	ldr	r2, [fp, #-16]
     f9c:	e5832004 	str	r2, [r3, #4]
  free((void*)(hp + 1));
     fa0:	e51b300c 	ldr	r3, [fp, #-12]
     fa4:	e2833008 	add	r3, r3, #8
     fa8:	e1a00003 	mov	r0, r3
     fac:	ebffff83 	bl	dc0 <free>
  return freep;
     fb0:	e30131cc 	movw	r3, #4556	@ 0x11cc
     fb4:	e3403000 	movt	r3, #0
     fb8:	e5933000 	ldr	r3, [r3]
}
     fbc:	e1a00003 	mov	r0, r3
     fc0:	e24bd004 	sub	sp, fp, #4
     fc4:	e8bd8800 	pop	{fp, pc}

00000fc8 <malloc>:

void*
malloc(uint nbytes)
{
     fc8:	e92d4800 	push	{fp, lr}
     fcc:	e28db004 	add	fp, sp, #4
     fd0:	e24dd018 	sub	sp, sp, #24
     fd4:	e50b0018 	str	r0, [fp, #-24]	@ 0xffffffe8
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
     fd8:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
     fdc:	e2833007 	add	r3, r3, #7
     fe0:	e1a031a3 	lsr	r3, r3, #3
     fe4:	e2833001 	add	r3, r3, #1
     fe8:	e50b3010 	str	r3, [fp, #-16]
  if((prevp = freep) == 0){
     fec:	e30131cc 	movw	r3, #4556	@ 0x11cc
     ff0:	e3403000 	movt	r3, #0
     ff4:	e5933000 	ldr	r3, [r3]
     ff8:	e50b300c 	str	r3, [fp, #-12]
     ffc:	e51b300c 	ldr	r3, [fp, #-12]
    1000:	e3530000 	cmp	r3, #0
    1004:	1a000010 	bne	104c <malloc+0x84>
    base.s.ptr = freep = prevp = &base;
    1008:	e30131c4 	movw	r3, #4548	@ 0x11c4
    100c:	e3403000 	movt	r3, #0
    1010:	e50b300c 	str	r3, [fp, #-12]
    1014:	e30131cc 	movw	r3, #4556	@ 0x11cc
    1018:	e3403000 	movt	r3, #0
    101c:	e51b200c 	ldr	r2, [fp, #-12]
    1020:	e5832000 	str	r2, [r3]
    1024:	e30131cc 	movw	r3, #4556	@ 0x11cc
    1028:	e3403000 	movt	r3, #0
    102c:	e5932000 	ldr	r2, [r3]
    1030:	e30131c4 	movw	r3, #4548	@ 0x11c4
    1034:	e3403000 	movt	r3, #0
    1038:	e5832000 	str	r2, [r3]
    base.s.size = 0;
    103c:	e30131c4 	movw	r3, #4548	@ 0x11c4
    1040:	e3403000 	movt	r3, #0
    1044:	e3a02000 	mov	r2, #0
    1048:	e5832004 	str	r2, [r3, #4]
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    104c:	e51b300c 	ldr	r3, [fp, #-12]
    1050:	e5933000 	ldr	r3, [r3]
    1054:	e50b3008 	str	r3, [fp, #-8]
    if(p->s.size >= nunits){
    1058:	e51b3008 	ldr	r3, [fp, #-8]
    105c:	e5933004 	ldr	r3, [r3, #4]
    1060:	e51b2010 	ldr	r2, [fp, #-16]
    1064:	e1520003 	cmp	r2, r3
    1068:	8a00001f 	bhi	10ec <malloc+0x124>
      if(p->s.size == nunits)
    106c:	e51b3008 	ldr	r3, [fp, #-8]
    1070:	e5933004 	ldr	r3, [r3, #4]
    1074:	e51b2010 	ldr	r2, [fp, #-16]
    1078:	e1520003 	cmp	r2, r3
    107c:	1a000004 	bne	1094 <malloc+0xcc>
        prevp->s.ptr = p->s.ptr;
    1080:	e51b3008 	ldr	r3, [fp, #-8]
    1084:	e5932000 	ldr	r2, [r3]
    1088:	e51b300c 	ldr	r3, [fp, #-12]
    108c:	e5832000 	str	r2, [r3]
    1090:	ea00000e 	b	10d0 <malloc+0x108>
      else {
        p->s.size -= nunits;
    1094:	e51b3008 	ldr	r3, [fp, #-8]
    1098:	e5932004 	ldr	r2, [r3, #4]
    109c:	e51b3010 	ldr	r3, [fp, #-16]
    10a0:	e0422003 	sub	r2, r2, r3
    10a4:	e51b3008 	ldr	r3, [fp, #-8]
    10a8:	e5832004 	str	r2, [r3, #4]
        p += p->s.size;
    10ac:	e51b3008 	ldr	r3, [fp, #-8]
    10b0:	e5933004 	ldr	r3, [r3, #4]
    10b4:	e1a03183 	lsl	r3, r3, #3
    10b8:	e51b2008 	ldr	r2, [fp, #-8]
    10bc:	e0823003 	add	r3, r2, r3
    10c0:	e50b3008 	str	r3, [fp, #-8]
        p->s.size = nunits;
    10c4:	e51b3008 	ldr	r3, [fp, #-8]
    10c8:	e51b2010 	ldr	r2, [fp, #-16]
    10cc:	e5832004 	str	r2, [r3, #4]
      }
      freep = prevp;
    10d0:	e30131cc 	movw	r3, #4556	@ 0x11cc
    10d4:	e3403000 	movt	r3, #0
    10d8:	e51b200c 	ldr	r2, [fp, #-12]
    10dc:	e5832000 	str	r2, [r3]
      return (void*)(p + 1);
    10e0:	e51b3008 	ldr	r3, [fp, #-8]
    10e4:	e2833008 	add	r3, r3, #8
    10e8:	ea000013 	b	113c <malloc+0x174>
    }
    if(p == freep)
    10ec:	e30131cc 	movw	r3, #4556	@ 0x11cc
    10f0:	e3403000 	movt	r3, #0
    10f4:	e5933000 	ldr	r3, [r3]
    10f8:	e51b2008 	ldr	r2, [fp, #-8]
    10fc:	e1520003 	cmp	r2, r3
    1100:	1a000007 	bne	1124 <malloc+0x15c>
      if((p = morecore(nunits)) == 0)
    1104:	e51b0010 	ldr	r0, [fp, #-16]
    1108:	ebffff8c 	bl	f40 <morecore>
    110c:	e50b0008 	str	r0, [fp, #-8]
    1110:	e51b3008 	ldr	r3, [fp, #-8]
    1114:	e3530000 	cmp	r3, #0
    1118:	1a000001 	bne	1124 <malloc+0x15c>
        return 0;
    111c:	e3a03000 	mov	r3, #0
    1120:	ea000005 	b	113c <malloc+0x174>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1124:	e51b3008 	ldr	r3, [fp, #-8]
    1128:	e50b300c 	str	r3, [fp, #-12]
    112c:	e51b3008 	ldr	r3, [fp, #-8]
    1130:	e5933000 	ldr	r3, [r3]
    1134:	e50b3008 	str	r3, [fp, #-8]
    if(p->s.size >= nunits){
    1138:	eaffffc6 	b	1058 <malloc+0x90>
  }
}
    113c:	e1a00003 	mov	r0, r3
    1140:	e24bd004 	sub	sp, fp, #4
    1144:	e8bd8800 	pop	{fp, pc}
