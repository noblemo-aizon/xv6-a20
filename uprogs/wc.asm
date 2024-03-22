
_wc:     file format elf32-littlearm


Disassembly of section .text:

00000000 <wc>:

char buf[512];

void
wc(int fd, char *name)
{
       0:	e92d4800 	push	{fp, lr}
       4:	e28db004 	add	fp, sp, #4
       8:	e24dd028 	sub	sp, sp, #40	@ 0x28
       c:	e50b0020 	str	r0, [fp, #-32]	@ 0xffffffe0
      10:	e50b1024 	str	r1, [fp, #-36]	@ 0xffffffdc
  int i, n;
  int l, w, c, inword;

  l = w = c = 0;
      14:	e3a03000 	mov	r3, #0
      18:	e50b3014 	str	r3, [fp, #-20]	@ 0xffffffec
      1c:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
      20:	e50b3010 	str	r3, [fp, #-16]
      24:	e51b3010 	ldr	r3, [fp, #-16]
      28:	e50b300c 	str	r3, [fp, #-12]
  inword = 0;
      2c:	e3a03000 	mov	r3, #0
      30:	e50b3018 	str	r3, [fp, #-24]	@ 0xffffffe8
  while((n = read(fd, buf, sizeof(buf))) > 0){
      34:	ea00002d 	b	f0 <wc+0xf0>
    for(i=0; i<n; i++){
      38:	e3a03000 	mov	r3, #0
      3c:	e50b3008 	str	r3, [fp, #-8]
      40:	ea000026 	b	e0 <wc+0xe0>
      c++;
      44:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
      48:	e2833001 	add	r3, r3, #1
      4c:	e50b3014 	str	r3, [fp, #-20]	@ 0xffffffec
      if(buf[i] == '\n')
      50:	e30132f0 	movw	r3, #4848	@ 0x12f0
      54:	e3403000 	movt	r3, #0
      58:	e51b2008 	ldr	r2, [fp, #-8]
      5c:	e0833002 	add	r3, r3, r2
      60:	e5d33000 	ldrb	r3, [r3]
      64:	e353000a 	cmp	r3, #10
      68:	1a000002 	bne	78 <wc+0x78>
        l++;
      6c:	e51b300c 	ldr	r3, [fp, #-12]
      70:	e2833001 	add	r3, r3, #1
      74:	e50b300c 	str	r3, [fp, #-12]
      if(strchr(" \r\t\n\v", buf[i]))
      78:	e30132f0 	movw	r3, #4848	@ 0x12f0
      7c:	e3403000 	movt	r3, #0
      80:	e51b2008 	ldr	r2, [fp, #-8]
      84:	e0833002 	add	r3, r3, r2
      88:	e5d33000 	ldrb	r3, [r3]
      8c:	e1a01003 	mov	r1, r3
      90:	e3010294 	movw	r0, #4756	@ 0x1294
      94:	e3400000 	movt	r0, #0
      98:	eb0000d3 	bl	3ec <strchr>
      9c:	e1a03000 	mov	r3, r0
      a0:	e3530000 	cmp	r3, #0
      a4:	0a000002 	beq	b4 <wc+0xb4>
        inword = 0;
      a8:	e3a03000 	mov	r3, #0
      ac:	e50b3018 	str	r3, [fp, #-24]	@ 0xffffffe8
      b0:	ea000007 	b	d4 <wc+0xd4>
      else if(!inword){
      b4:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
      b8:	e3530000 	cmp	r3, #0
      bc:	1a000004 	bne	d4 <wc+0xd4>
        w++;
      c0:	e51b3010 	ldr	r3, [fp, #-16]
      c4:	e2833001 	add	r3, r3, #1
      c8:	e50b3010 	str	r3, [fp, #-16]
        inword = 1;
      cc:	e3a03001 	mov	r3, #1
      d0:	e50b3018 	str	r3, [fp, #-24]	@ 0xffffffe8
    for(i=0; i<n; i++){
      d4:	e51b3008 	ldr	r3, [fp, #-8]
      d8:	e2833001 	add	r3, r3, #1
      dc:	e50b3008 	str	r3, [fp, #-8]
      e0:	e51b2008 	ldr	r2, [fp, #-8]
      e4:	e51b301c 	ldr	r3, [fp, #-28]	@ 0xffffffe4
      e8:	e1520003 	cmp	r2, r3
      ec:	baffffd4 	blt	44 <wc+0x44>
  while((n = read(fd, buf, sizeof(buf))) > 0){
      f0:	e3a02c02 	mov	r2, #512	@ 0x200
      f4:	e30112f0 	movw	r1, #4848	@ 0x12f0
      f8:	e3401000 	movt	r1, #0
      fc:	e51b0020 	ldr	r0, [fp, #-32]	@ 0xffffffe0
     100:	eb000189 	bl	72c <read>
     104:	e50b001c 	str	r0, [fp, #-28]	@ 0xffffffe4
     108:	e51b301c 	ldr	r3, [fp, #-28]	@ 0xffffffe4
     10c:	e3530000 	cmp	r3, #0
     110:	caffffc8 	bgt	38 <wc+0x38>
      }
    }
  }
  if(n < 0){
     114:	e51b301c 	ldr	r3, [fp, #-28]	@ 0xffffffe4
     118:	e3530000 	cmp	r3, #0
     11c:	aa000004 	bge	134 <wc+0x134>
    printf(1, "wc: read error\n");
     120:	e301129c 	movw	r1, #4764	@ 0x129c
     124:	e3401000 	movt	r1, #0
     128:	e3a00001 	mov	r0, #1
     12c:	eb0002e8 	bl	cd4 <printf>
    exit();
     130:	eb000156 	bl	690 <exit>
  }
  printf(1, "%d %d %d %s\n", l, w, c, name);
     134:	e51b3024 	ldr	r3, [fp, #-36]	@ 0xffffffdc
     138:	e58d3004 	str	r3, [sp, #4]
     13c:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
     140:	e58d3000 	str	r3, [sp]
     144:	e51b3010 	ldr	r3, [fp, #-16]
     148:	e51b200c 	ldr	r2, [fp, #-12]
     14c:	e30112ac 	movw	r1, #4780	@ 0x12ac
     150:	e3401000 	movt	r1, #0
     154:	e3a00001 	mov	r0, #1
     158:	eb0002dd 	bl	cd4 <printf>
}
     15c:	e320f000 	nop	{0}
     160:	e24bd004 	sub	sp, fp, #4
     164:	e8bd8800 	pop	{fp, pc}

00000168 <main>:

int
main(int argc, char *argv[])
{
     168:	e92d4800 	push	{fp, lr}
     16c:	e28db004 	add	fp, sp, #4
     170:	e24dd010 	sub	sp, sp, #16
     174:	e50b0010 	str	r0, [fp, #-16]
     178:	e50b1014 	str	r1, [fp, #-20]	@ 0xffffffec
  int fd, i;

  if(argc <= 1){
     17c:	e51b3010 	ldr	r3, [fp, #-16]
     180:	e3530001 	cmp	r3, #1
     184:	ca000004 	bgt	19c <main+0x34>
    wc(0, "");
     188:	e30112bc 	movw	r1, #4796	@ 0x12bc
     18c:	e3401000 	movt	r1, #0
     190:	e3a00000 	mov	r0, #0
     194:	ebffff99 	bl	0 <wc>
    exit();
     198:	eb00013c 	bl	690 <exit>
  }

  for(i = 1; i < argc; i++){
     19c:	e3a03001 	mov	r3, #1
     1a0:	e50b3008 	str	r3, [fp, #-8]
     1a4:	ea000023 	b	238 <main+0xd0>
    if((fd = open(argv[i], 0)) < 0){
     1a8:	e51b3008 	ldr	r3, [fp, #-8]
     1ac:	e1a03103 	lsl	r3, r3, #2
     1b0:	e51b2014 	ldr	r2, [fp, #-20]	@ 0xffffffec
     1b4:	e0823003 	add	r3, r2, r3
     1b8:	e5933000 	ldr	r3, [r3]
     1bc:	e3a01000 	mov	r1, #0
     1c0:	e1a00003 	mov	r0, r3
     1c4:	eb000199 	bl	830 <open>
     1c8:	e50b000c 	str	r0, [fp, #-12]
     1cc:	e51b300c 	ldr	r3, [fp, #-12]
     1d0:	e3530000 	cmp	r3, #0
     1d4:	aa00000a 	bge	204 <main+0x9c>
      printf(1, "wc: cannot open %s\n", argv[i]);
     1d8:	e51b3008 	ldr	r3, [fp, #-8]
     1dc:	e1a03103 	lsl	r3, r3, #2
     1e0:	e51b2014 	ldr	r2, [fp, #-20]	@ 0xffffffec
     1e4:	e0823003 	add	r3, r2, r3
     1e8:	e5933000 	ldr	r3, [r3]
     1ec:	e1a02003 	mov	r2, r3
     1f0:	e30112c0 	movw	r1, #4800	@ 0x12c0
     1f4:	e3401000 	movt	r1, #0
     1f8:	e3a00001 	mov	r0, #1
     1fc:	eb0002b4 	bl	cd4 <printf>
      exit();
     200:	eb000122 	bl	690 <exit>
    }
    wc(fd, argv[i]);
     204:	e51b3008 	ldr	r3, [fp, #-8]
     208:	e1a03103 	lsl	r3, r3, #2
     20c:	e51b2014 	ldr	r2, [fp, #-20]	@ 0xffffffec
     210:	e0823003 	add	r3, r2, r3
     214:	e5933000 	ldr	r3, [r3]
     218:	e1a01003 	mov	r1, r3
     21c:	e51b000c 	ldr	r0, [fp, #-12]
     220:	ebffff76 	bl	0 <wc>
    close(fd);
     224:	e51b000c 	ldr	r0, [fp, #-12]
     228:	eb000159 	bl	794 <close>
  for(i = 1; i < argc; i++){
     22c:	e51b3008 	ldr	r3, [fp, #-8]
     230:	e2833001 	add	r3, r3, #1
     234:	e50b3008 	str	r3, [fp, #-8]
     238:	e51b2008 	ldr	r2, [fp, #-8]
     23c:	e51b3010 	ldr	r3, [fp, #-16]
     240:	e1520003 	cmp	r2, r3
     244:	baffffd7 	blt	1a8 <main+0x40>
  }
  exit();
     248:	eb000110 	bl	690 <exit>

0000024c <strcpy>:
#include "user.h"
#include "arm.h"

char*
strcpy(char *s, char *t)
{
     24c:	e52db004 	push	{fp}		@ (str fp, [sp, #-4]!)
     250:	e28db000 	add	fp, sp, #0
     254:	e24dd014 	sub	sp, sp, #20
     258:	e50b0010 	str	r0, [fp, #-16]
     25c:	e50b1014 	str	r1, [fp, #-20]	@ 0xffffffec
  char *os;

  os = s;
     260:	e51b3010 	ldr	r3, [fp, #-16]
     264:	e50b3008 	str	r3, [fp, #-8]
  while((*s++ = *t++) != 0)
     268:	e320f000 	nop	{0}
     26c:	e51b2014 	ldr	r2, [fp, #-20]	@ 0xffffffec
     270:	e2823001 	add	r3, r2, #1
     274:	e50b3014 	str	r3, [fp, #-20]	@ 0xffffffec
     278:	e51b3010 	ldr	r3, [fp, #-16]
     27c:	e2831001 	add	r1, r3, #1
     280:	e50b1010 	str	r1, [fp, #-16]
     284:	e5d22000 	ldrb	r2, [r2]
     288:	e5c32000 	strb	r2, [r3]
     28c:	e5d33000 	ldrb	r3, [r3]
     290:	e3530000 	cmp	r3, #0
     294:	1afffff4 	bne	26c <strcpy+0x20>
    ;
  return os;
     298:	e51b3008 	ldr	r3, [fp, #-8]
}
     29c:	e1a00003 	mov	r0, r3
     2a0:	e28bd000 	add	sp, fp, #0
     2a4:	e49db004 	pop	{fp}		@ (ldr fp, [sp], #4)
     2a8:	e12fff1e 	bx	lr

000002ac <strcmp>:

int
strcmp(const char *p, const char *q)
{
     2ac:	e52db004 	push	{fp}		@ (str fp, [sp, #-4]!)
     2b0:	e28db000 	add	fp, sp, #0
     2b4:	e24dd00c 	sub	sp, sp, #12
     2b8:	e50b0008 	str	r0, [fp, #-8]
     2bc:	e50b100c 	str	r1, [fp, #-12]
  while(*p && *p == *q)
     2c0:	ea000005 	b	2dc <strcmp+0x30>
    p++, q++;
     2c4:	e51b3008 	ldr	r3, [fp, #-8]
     2c8:	e2833001 	add	r3, r3, #1
     2cc:	e50b3008 	str	r3, [fp, #-8]
     2d0:	e51b300c 	ldr	r3, [fp, #-12]
     2d4:	e2833001 	add	r3, r3, #1
     2d8:	e50b300c 	str	r3, [fp, #-12]
  while(*p && *p == *q)
     2dc:	e51b3008 	ldr	r3, [fp, #-8]
     2e0:	e5d33000 	ldrb	r3, [r3]
     2e4:	e3530000 	cmp	r3, #0
     2e8:	0a000005 	beq	304 <strcmp+0x58>
     2ec:	e51b3008 	ldr	r3, [fp, #-8]
     2f0:	e5d32000 	ldrb	r2, [r3]
     2f4:	e51b300c 	ldr	r3, [fp, #-12]
     2f8:	e5d33000 	ldrb	r3, [r3]
     2fc:	e1520003 	cmp	r2, r3
     300:	0affffef 	beq	2c4 <strcmp+0x18>
  return (uchar)*p - (uchar)*q;
     304:	e51b3008 	ldr	r3, [fp, #-8]
     308:	e5d33000 	ldrb	r3, [r3]
     30c:	e1a02003 	mov	r2, r3
     310:	e51b300c 	ldr	r3, [fp, #-12]
     314:	e5d33000 	ldrb	r3, [r3]
     318:	e0423003 	sub	r3, r2, r3
}
     31c:	e1a00003 	mov	r0, r3
     320:	e28bd000 	add	sp, fp, #0
     324:	e49db004 	pop	{fp}		@ (ldr fp, [sp], #4)
     328:	e12fff1e 	bx	lr

0000032c <strlen>:

uint
strlen(char *s)
{
     32c:	e52db004 	push	{fp}		@ (str fp, [sp, #-4]!)
     330:	e28db000 	add	fp, sp, #0
     334:	e24dd014 	sub	sp, sp, #20
     338:	e50b0010 	str	r0, [fp, #-16]
  int n;

  for(n = 0; s[n]; n++)
     33c:	e3a03000 	mov	r3, #0
     340:	e50b3008 	str	r3, [fp, #-8]
     344:	ea000002 	b	354 <strlen+0x28>
     348:	e51b3008 	ldr	r3, [fp, #-8]
     34c:	e2833001 	add	r3, r3, #1
     350:	e50b3008 	str	r3, [fp, #-8]
     354:	e51b3008 	ldr	r3, [fp, #-8]
     358:	e51b2010 	ldr	r2, [fp, #-16]
     35c:	e0823003 	add	r3, r2, r3
     360:	e5d33000 	ldrb	r3, [r3]
     364:	e3530000 	cmp	r3, #0
     368:	1afffff6 	bne	348 <strlen+0x1c>
    ;
  return n;
     36c:	e51b3008 	ldr	r3, [fp, #-8]
}
     370:	e1a00003 	mov	r0, r3
     374:	e28bd000 	add	sp, fp, #0
     378:	e49db004 	pop	{fp}		@ (ldr fp, [sp], #4)
     37c:	e12fff1e 	bx	lr

00000380 <memset>:

void*
memset(void *dst, int c, uint n)
{
     380:	e52db004 	push	{fp}		@ (str fp, [sp, #-4]!)
     384:	e28db000 	add	fp, sp, #0
     388:	e24dd01c 	sub	sp, sp, #28
     38c:	e50b0010 	str	r0, [fp, #-16]
     390:	e50b1014 	str	r1, [fp, #-20]	@ 0xffffffec
     394:	e50b2018 	str	r2, [fp, #-24]	@ 0xffffffe8
  char *p=dst;
     398:	e51b3010 	ldr	r3, [fp, #-16]
     39c:	e50b3008 	str	r3, [fp, #-8]
  u32 rc=n;
     3a0:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
     3a4:	e50b300c 	str	r3, [fp, #-12]

  while (rc-- > 0) *p++ = c;
     3a8:	ea000005 	b	3c4 <memset+0x44>
     3ac:	e51b3008 	ldr	r3, [fp, #-8]
     3b0:	e2832001 	add	r2, r3, #1
     3b4:	e50b2008 	str	r2, [fp, #-8]
     3b8:	e51b2014 	ldr	r2, [fp, #-20]	@ 0xffffffec
     3bc:	e6ef2072 	uxtb	r2, r2
     3c0:	e5c32000 	strb	r2, [r3]
     3c4:	e51b300c 	ldr	r3, [fp, #-12]
     3c8:	e2432001 	sub	r2, r3, #1
     3cc:	e50b200c 	str	r2, [fp, #-12]
     3d0:	e3530000 	cmp	r3, #0
     3d4:	1afffff4 	bne	3ac <memset+0x2c>
  return (void *)p;
     3d8:	e51b3008 	ldr	r3, [fp, #-8]
}
     3dc:	e1a00003 	mov	r0, r3
     3e0:	e28bd000 	add	sp, fp, #0
     3e4:	e49db004 	pop	{fp}		@ (ldr fp, [sp], #4)
     3e8:	e12fff1e 	bx	lr

000003ec <strchr>:

char*
strchr(const char *s, char c)
{
     3ec:	e52db004 	push	{fp}		@ (str fp, [sp, #-4]!)
     3f0:	e28db000 	add	fp, sp, #0
     3f4:	e24dd00c 	sub	sp, sp, #12
     3f8:	e50b0008 	str	r0, [fp, #-8]
     3fc:	e1a03001 	mov	r3, r1
     400:	e54b3009 	strb	r3, [fp, #-9]
  for(; *s; s++)
     404:	ea000009 	b	430 <strchr+0x44>
    if(*s == c)
     408:	e51b3008 	ldr	r3, [fp, #-8]
     40c:	e5d33000 	ldrb	r3, [r3]
     410:	e55b2009 	ldrb	r2, [fp, #-9]
     414:	e1520003 	cmp	r2, r3
     418:	1a000001 	bne	424 <strchr+0x38>
      return (char*)s;
     41c:	e51b3008 	ldr	r3, [fp, #-8]
     420:	ea000007 	b	444 <strchr+0x58>
  for(; *s; s++)
     424:	e51b3008 	ldr	r3, [fp, #-8]
     428:	e2833001 	add	r3, r3, #1
     42c:	e50b3008 	str	r3, [fp, #-8]
     430:	e51b3008 	ldr	r3, [fp, #-8]
     434:	e5d33000 	ldrb	r3, [r3]
     438:	e3530000 	cmp	r3, #0
     43c:	1afffff1 	bne	408 <strchr+0x1c>
  return 0;
     440:	e3a03000 	mov	r3, #0
}
     444:	e1a00003 	mov	r0, r3
     448:	e28bd000 	add	sp, fp, #0
     44c:	e49db004 	pop	{fp}		@ (ldr fp, [sp], #4)
     450:	e12fff1e 	bx	lr

00000454 <gets>:

char*
gets(char *buf, int max)
{
     454:	e92d4800 	push	{fp, lr}
     458:	e28db004 	add	fp, sp, #4
     45c:	e24dd018 	sub	sp, sp, #24
     460:	e50b0018 	str	r0, [fp, #-24]	@ 0xffffffe8
     464:	e50b101c 	str	r1, [fp, #-28]	@ 0xffffffe4
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
     468:	e3a03000 	mov	r3, #0
     46c:	e50b3008 	str	r3, [fp, #-8]
     470:	ea000016 	b	4d0 <gets+0x7c>
    cc = read(0, &c, 1);
     474:	e24b300d 	sub	r3, fp, #13
     478:	e3a02001 	mov	r2, #1
     47c:	e1a01003 	mov	r1, r3
     480:	e3a00000 	mov	r0, #0
     484:	eb0000a8 	bl	72c <read>
     488:	e50b000c 	str	r0, [fp, #-12]
    if(cc < 1)
     48c:	e51b300c 	ldr	r3, [fp, #-12]
     490:	e3530000 	cmp	r3, #0
     494:	da000013 	ble	4e8 <gets+0x94>
      break;
    buf[i++] = c;
     498:	e51b3008 	ldr	r3, [fp, #-8]
     49c:	e2832001 	add	r2, r3, #1
     4a0:	e50b2008 	str	r2, [fp, #-8]
     4a4:	e1a02003 	mov	r2, r3
     4a8:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
     4ac:	e0833002 	add	r3, r3, r2
     4b0:	e55b200d 	ldrb	r2, [fp, #-13]
     4b4:	e5c32000 	strb	r2, [r3]
    if(c == '\n' || c == '\r')
     4b8:	e55b300d 	ldrb	r3, [fp, #-13]
     4bc:	e353000a 	cmp	r3, #10
     4c0:	0a000009 	beq	4ec <gets+0x98>
     4c4:	e55b300d 	ldrb	r3, [fp, #-13]
     4c8:	e353000d 	cmp	r3, #13
     4cc:	0a000006 	beq	4ec <gets+0x98>
  for(i=0; i+1 < max; ){
     4d0:	e51b3008 	ldr	r3, [fp, #-8]
     4d4:	e2833001 	add	r3, r3, #1
     4d8:	e51b201c 	ldr	r2, [fp, #-28]	@ 0xffffffe4
     4dc:	e1520003 	cmp	r2, r3
     4e0:	caffffe3 	bgt	474 <gets+0x20>
     4e4:	ea000000 	b	4ec <gets+0x98>
      break;
     4e8:	e320f000 	nop	{0}
      break;
  }
  buf[i] = '\0';
     4ec:	e51b3008 	ldr	r3, [fp, #-8]
     4f0:	e51b2018 	ldr	r2, [fp, #-24]	@ 0xffffffe8
     4f4:	e0823003 	add	r3, r2, r3
     4f8:	e3a02000 	mov	r2, #0
     4fc:	e5c32000 	strb	r2, [r3]
  return buf;
     500:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
}
     504:	e1a00003 	mov	r0, r3
     508:	e24bd004 	sub	sp, fp, #4
     50c:	e8bd8800 	pop	{fp, pc}

00000510 <stat>:

int
stat(char *n, struct stat *st)
{
     510:	e92d4800 	push	{fp, lr}
     514:	e28db004 	add	fp, sp, #4
     518:	e24dd010 	sub	sp, sp, #16
     51c:	e50b0010 	str	r0, [fp, #-16]
     520:	e50b1014 	str	r1, [fp, #-20]	@ 0xffffffec
  int fd;
  int r;

  fd = open(n, O_RDONLY);
     524:	e3a01000 	mov	r1, #0
     528:	e51b0010 	ldr	r0, [fp, #-16]
     52c:	eb0000bf 	bl	830 <open>
     530:	e50b0008 	str	r0, [fp, #-8]
  if(fd < 0)
     534:	e51b3008 	ldr	r3, [fp, #-8]
     538:	e3530000 	cmp	r3, #0
     53c:	aa000001 	bge	548 <stat+0x38>
    return -1;
     540:	e3e03000 	mvn	r3, #0
     544:	ea000006 	b	564 <stat+0x54>
  r = fstat(fd, st);
     548:	e51b1014 	ldr	r1, [fp, #-20]	@ 0xffffffec
     54c:	e51b0008 	ldr	r0, [fp, #-8]
     550:	eb0000dd 	bl	8cc <fstat>
     554:	e50b000c 	str	r0, [fp, #-12]
  close(fd);
     558:	e51b0008 	ldr	r0, [fp, #-8]
     55c:	eb00008c 	bl	794 <close>
  return r;
     560:	e51b300c 	ldr	r3, [fp, #-12]
}
     564:	e1a00003 	mov	r0, r3
     568:	e24bd004 	sub	sp, fp, #4
     56c:	e8bd8800 	pop	{fp, pc}

00000570 <atoi>:

int
atoi(const char *s)
{
     570:	e52db004 	push	{fp}		@ (str fp, [sp, #-4]!)
     574:	e28db000 	add	fp, sp, #0
     578:	e24dd014 	sub	sp, sp, #20
     57c:	e50b0010 	str	r0, [fp, #-16]
  int n;

  n = 0;
     580:	e3a03000 	mov	r3, #0
     584:	e50b3008 	str	r3, [fp, #-8]
  while('0' <= *s && *s <= '9')
     588:	ea000009 	b	5b4 <atoi+0x44>
    n = n*10 + *s++ - '0';
     58c:	e51b3008 	ldr	r3, [fp, #-8]
     590:	e3a0200a 	mov	r2, #10
     594:	e0020392 	mul	r2, r2, r3
     598:	e51b3010 	ldr	r3, [fp, #-16]
     59c:	e2831001 	add	r1, r3, #1
     5a0:	e50b1010 	str	r1, [fp, #-16]
     5a4:	e5d33000 	ldrb	r3, [r3]
     5a8:	e0823003 	add	r3, r2, r3
     5ac:	e2433030 	sub	r3, r3, #48	@ 0x30
     5b0:	e50b3008 	str	r3, [fp, #-8]
  while('0' <= *s && *s <= '9')
     5b4:	e51b3010 	ldr	r3, [fp, #-16]
     5b8:	e5d33000 	ldrb	r3, [r3]
     5bc:	e353002f 	cmp	r3, #47	@ 0x2f
     5c0:	9a000003 	bls	5d4 <atoi+0x64>
     5c4:	e51b3010 	ldr	r3, [fp, #-16]
     5c8:	e5d33000 	ldrb	r3, [r3]
     5cc:	e3530039 	cmp	r3, #57	@ 0x39
     5d0:	9affffed 	bls	58c <atoi+0x1c>
  return n;
     5d4:	e51b3008 	ldr	r3, [fp, #-8]
}
     5d8:	e1a00003 	mov	r0, r3
     5dc:	e28bd000 	add	sp, fp, #0
     5e0:	e49db004 	pop	{fp}		@ (ldr fp, [sp], #4)
     5e4:	e12fff1e 	bx	lr

000005e8 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
     5e8:	e52db004 	push	{fp}		@ (str fp, [sp, #-4]!)
     5ec:	e28db000 	add	fp, sp, #0
     5f0:	e24dd01c 	sub	sp, sp, #28
     5f4:	e50b0010 	str	r0, [fp, #-16]
     5f8:	e50b1014 	str	r1, [fp, #-20]	@ 0xffffffec
     5fc:	e50b2018 	str	r2, [fp, #-24]	@ 0xffffffe8
  char *dst, *src;
  
  dst = vdst;
     600:	e51b3010 	ldr	r3, [fp, #-16]
     604:	e50b3008 	str	r3, [fp, #-8]
  src = vsrc;
     608:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
     60c:	e50b300c 	str	r3, [fp, #-12]
  while(n-- > 0)
     610:	ea000007 	b	634 <memmove+0x4c>
    *dst++ = *src++;
     614:	e51b200c 	ldr	r2, [fp, #-12]
     618:	e2823001 	add	r3, r2, #1
     61c:	e50b300c 	str	r3, [fp, #-12]
     620:	e51b3008 	ldr	r3, [fp, #-8]
     624:	e2831001 	add	r1, r3, #1
     628:	e50b1008 	str	r1, [fp, #-8]
     62c:	e5d22000 	ldrb	r2, [r2]
     630:	e5c32000 	strb	r2, [r3]
  while(n-- > 0)
     634:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
     638:	e2432001 	sub	r2, r3, #1
     63c:	e50b2018 	str	r2, [fp, #-24]	@ 0xffffffe8
     640:	e3530000 	cmp	r3, #0
     644:	cafffff2 	bgt	614 <memmove+0x2c>
  return vdst;
     648:	e51b3010 	ldr	r3, [fp, #-16]
}
     64c:	e1a00003 	mov	r0, r3
     650:	e28bd000 	add	sp, fp, #0
     654:	e49db004 	pop	{fp}		@ (ldr fp, [sp], #4)
     658:	e12fff1e 	bx	lr

0000065c <fork>:
     65c:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
     660:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
     664:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
     668:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
     66c:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
     670:	e3a00001 	mov	r0, #1
     674:	ef000040 	svc	0x00000040
     678:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     67c:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     680:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
     684:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
     688:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
     68c:	e12fff1e 	bx	lr

00000690 <exit>:
     690:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
     694:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
     698:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
     69c:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
     6a0:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
     6a4:	e3a00002 	mov	r0, #2
     6a8:	ef000040 	svc	0x00000040
     6ac:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     6b0:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     6b4:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
     6b8:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
     6bc:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
     6c0:	e12fff1e 	bx	lr

000006c4 <wait>:
     6c4:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
     6c8:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
     6cc:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
     6d0:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
     6d4:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
     6d8:	e3a00003 	mov	r0, #3
     6dc:	ef000040 	svc	0x00000040
     6e0:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     6e4:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     6e8:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
     6ec:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
     6f0:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
     6f4:	e12fff1e 	bx	lr

000006f8 <pipe>:
     6f8:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
     6fc:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
     700:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
     704:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
     708:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
     70c:	e3a00004 	mov	r0, #4
     710:	ef000040 	svc	0x00000040
     714:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     718:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     71c:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
     720:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
     724:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
     728:	e12fff1e 	bx	lr

0000072c <read>:
     72c:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
     730:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
     734:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
     738:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
     73c:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
     740:	e3a00005 	mov	r0, #5
     744:	ef000040 	svc	0x00000040
     748:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     74c:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     750:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
     754:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
     758:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
     75c:	e12fff1e 	bx	lr

00000760 <write>:
     760:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
     764:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
     768:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
     76c:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
     770:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
     774:	e3a00010 	mov	r0, #16
     778:	ef000040 	svc	0x00000040
     77c:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     780:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     784:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
     788:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
     78c:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
     790:	e12fff1e 	bx	lr

00000794 <close>:
     794:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
     798:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
     79c:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
     7a0:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
     7a4:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
     7a8:	e3a00015 	mov	r0, #21
     7ac:	ef000040 	svc	0x00000040
     7b0:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     7b4:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     7b8:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
     7bc:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
     7c0:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
     7c4:	e12fff1e 	bx	lr

000007c8 <kill>:
     7c8:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
     7cc:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
     7d0:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
     7d4:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
     7d8:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
     7dc:	e3a00006 	mov	r0, #6
     7e0:	ef000040 	svc	0x00000040
     7e4:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     7e8:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     7ec:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
     7f0:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
     7f4:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
     7f8:	e12fff1e 	bx	lr

000007fc <exec>:
     7fc:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
     800:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
     804:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
     808:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
     80c:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
     810:	e3a00007 	mov	r0, #7
     814:	ef000040 	svc	0x00000040
     818:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     81c:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     820:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
     824:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
     828:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
     82c:	e12fff1e 	bx	lr

00000830 <open>:
     830:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
     834:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
     838:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
     83c:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
     840:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
     844:	e3a0000f 	mov	r0, #15
     848:	ef000040 	svc	0x00000040
     84c:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     850:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     854:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
     858:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
     85c:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
     860:	e12fff1e 	bx	lr

00000864 <mknod>:
     864:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
     868:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
     86c:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
     870:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
     874:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
     878:	e3a00011 	mov	r0, #17
     87c:	ef000040 	svc	0x00000040
     880:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     884:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     888:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
     88c:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
     890:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
     894:	e12fff1e 	bx	lr

00000898 <unlink>:
     898:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
     89c:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
     8a0:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
     8a4:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
     8a8:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
     8ac:	e3a00012 	mov	r0, #18
     8b0:	ef000040 	svc	0x00000040
     8b4:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     8b8:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     8bc:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
     8c0:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
     8c4:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
     8c8:	e12fff1e 	bx	lr

000008cc <fstat>:
     8cc:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
     8d0:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
     8d4:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
     8d8:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
     8dc:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
     8e0:	e3a00008 	mov	r0, #8
     8e4:	ef000040 	svc	0x00000040
     8e8:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     8ec:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     8f0:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
     8f4:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
     8f8:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
     8fc:	e12fff1e 	bx	lr

00000900 <link>:
     900:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
     904:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
     908:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
     90c:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
     910:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
     914:	e3a00013 	mov	r0, #19
     918:	ef000040 	svc	0x00000040
     91c:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     920:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     924:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
     928:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
     92c:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
     930:	e12fff1e 	bx	lr

00000934 <mkdir>:
     934:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
     938:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
     93c:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
     940:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
     944:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
     948:	e3a00014 	mov	r0, #20
     94c:	ef000040 	svc	0x00000040
     950:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     954:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     958:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
     95c:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
     960:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
     964:	e12fff1e 	bx	lr

00000968 <chdir>:
     968:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
     96c:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
     970:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
     974:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
     978:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
     97c:	e3a00009 	mov	r0, #9
     980:	ef000040 	svc	0x00000040
     984:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     988:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     98c:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
     990:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
     994:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
     998:	e12fff1e 	bx	lr

0000099c <dup>:
     99c:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
     9a0:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
     9a4:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
     9a8:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
     9ac:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
     9b0:	e3a0000a 	mov	r0, #10
     9b4:	ef000040 	svc	0x00000040
     9b8:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     9bc:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     9c0:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
     9c4:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
     9c8:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
     9cc:	e12fff1e 	bx	lr

000009d0 <getpid>:
     9d0:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
     9d4:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
     9d8:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
     9dc:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
     9e0:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
     9e4:	e3a0000b 	mov	r0, #11
     9e8:	ef000040 	svc	0x00000040
     9ec:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     9f0:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     9f4:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
     9f8:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
     9fc:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
     a00:	e12fff1e 	bx	lr

00000a04 <sbrk>:
     a04:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
     a08:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
     a0c:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
     a10:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
     a14:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
     a18:	e3a0000c 	mov	r0, #12
     a1c:	ef000040 	svc	0x00000040
     a20:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     a24:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     a28:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
     a2c:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
     a30:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
     a34:	e12fff1e 	bx	lr

00000a38 <sleep>:
     a38:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
     a3c:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
     a40:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
     a44:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
     a48:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
     a4c:	e3a0000d 	mov	r0, #13
     a50:	ef000040 	svc	0x00000040
     a54:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     a58:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     a5c:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
     a60:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
     a64:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
     a68:	e12fff1e 	bx	lr

00000a6c <uptime>:
     a6c:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
     a70:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
     a74:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
     a78:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
     a7c:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
     a80:	e3a0000e 	mov	r0, #14
     a84:	ef000040 	svc	0x00000040
     a88:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     a8c:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     a90:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
     a94:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
     a98:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
     a9c:	e12fff1e 	bx	lr

00000aa0 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
     aa0:	e92d4800 	push	{fp, lr}
     aa4:	e28db004 	add	fp, sp, #4
     aa8:	e24dd008 	sub	sp, sp, #8
     aac:	e50b0008 	str	r0, [fp, #-8]
     ab0:	e1a03001 	mov	r3, r1
     ab4:	e54b3009 	strb	r3, [fp, #-9]
  write(fd, &c, 1);
     ab8:	e24b3009 	sub	r3, fp, #9
     abc:	e3a02001 	mov	r2, #1
     ac0:	e1a01003 	mov	r1, r3
     ac4:	e51b0008 	ldr	r0, [fp, #-8]
     ac8:	ebffff24 	bl	760 <write>
}
     acc:	e320f000 	nop	{0}
     ad0:	e24bd004 	sub	sp, fp, #4
     ad4:	e8bd8800 	pop	{fp, pc}

00000ad8 <div>:

u32 div(u32 n, u32 d)  // long division
{
     ad8:	e52db004 	push	{fp}		@ (str fp, [sp, #-4]!)
     adc:	e28db000 	add	fp, sp, #0
     ae0:	e24dd01c 	sub	sp, sp, #28
     ae4:	e50b0018 	str	r0, [fp, #-24]	@ 0xffffffe8
     ae8:	e50b101c 	str	r1, [fp, #-28]	@ 0xffffffe4
    u32 q=0, r=0;
     aec:	e3a03000 	mov	r3, #0
     af0:	e50b3008 	str	r3, [fp, #-8]
     af4:	e3a03000 	mov	r3, #0
     af8:	e50b300c 	str	r3, [fp, #-12]
    int i;

    for(i=31;i>=0;i--){
     afc:	e3a0301f 	mov	r3, #31
     b00:	e50b3010 	str	r3, [fp, #-16]
     b04:	ea00001b 	b	b78 <div+0xa0>
        r = r << 1;
     b08:	e51b300c 	ldr	r3, [fp, #-12]
     b0c:	e1a03083 	lsl	r3, r3, #1
     b10:	e50b300c 	str	r3, [fp, #-12]
        r = r | ((n >> i) & 1);
     b14:	e51b2018 	ldr	r2, [fp, #-24]	@ 0xffffffe8
     b18:	e51b3010 	ldr	r3, [fp, #-16]
     b1c:	e1a03332 	lsr	r3, r2, r3
     b20:	e2033001 	and	r3, r3, #1
     b24:	e51b200c 	ldr	r2, [fp, #-12]
     b28:	e1823003 	orr	r3, r2, r3
     b2c:	e50b300c 	str	r3, [fp, #-12]
        if(r >= d) {
     b30:	e51b200c 	ldr	r2, [fp, #-12]
     b34:	e51b301c 	ldr	r3, [fp, #-28]	@ 0xffffffe4
     b38:	e1520003 	cmp	r2, r3
     b3c:	3a00000a 	bcc	b6c <div+0x94>
            r = r - d;
     b40:	e51b200c 	ldr	r2, [fp, #-12]
     b44:	e51b301c 	ldr	r3, [fp, #-28]	@ 0xffffffe4
     b48:	e0423003 	sub	r3, r2, r3
     b4c:	e50b300c 	str	r3, [fp, #-12]
            q = q | (1 << i);
     b50:	e3a02001 	mov	r2, #1
     b54:	e51b3010 	ldr	r3, [fp, #-16]
     b58:	e1a03312 	lsl	r3, r2, r3
     b5c:	e1a02003 	mov	r2, r3
     b60:	e51b3008 	ldr	r3, [fp, #-8]
     b64:	e1833002 	orr	r3, r3, r2
     b68:	e50b3008 	str	r3, [fp, #-8]
    for(i=31;i>=0;i--){
     b6c:	e51b3010 	ldr	r3, [fp, #-16]
     b70:	e2433001 	sub	r3, r3, #1
     b74:	e50b3010 	str	r3, [fp, #-16]
     b78:	e51b3010 	ldr	r3, [fp, #-16]
     b7c:	e3530000 	cmp	r3, #0
     b80:	aaffffe0 	bge	b08 <div+0x30>
        }
    }
    return q;
     b84:	e51b3008 	ldr	r3, [fp, #-8]
}
     b88:	e1a00003 	mov	r0, r3
     b8c:	e28bd000 	add	sp, fp, #0
     b90:	e49db004 	pop	{fp}		@ (ldr fp, [sp], #4)
     b94:	e12fff1e 	bx	lr

00000b98 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
     b98:	e92d4800 	push	{fp, lr}
     b9c:	e28db004 	add	fp, sp, #4
     ba0:	e24dd038 	sub	sp, sp, #56	@ 0x38
     ba4:	e50b0030 	str	r0, [fp, #-48]	@ 0xffffffd0
     ba8:	e50b1034 	str	r1, [fp, #-52]	@ 0xffffffcc
     bac:	e50b2038 	str	r2, [fp, #-56]	@ 0xffffffc8
     bb0:	e50b303c 	str	r3, [fp, #-60]	@ 0xffffffc4
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x, y, b;

  neg = 0;
     bb4:	e3a03000 	mov	r3, #0
     bb8:	e50b300c 	str	r3, [fp, #-12]
  if(sgn && xx < 0){
     bbc:	e51b303c 	ldr	r3, [fp, #-60]	@ 0xffffffc4
     bc0:	e3530000 	cmp	r3, #0
     bc4:	0a000008 	beq	bec <printint+0x54>
     bc8:	e51b3034 	ldr	r3, [fp, #-52]	@ 0xffffffcc
     bcc:	e3530000 	cmp	r3, #0
     bd0:	aa000005 	bge	bec <printint+0x54>
    neg = 1;
     bd4:	e3a03001 	mov	r3, #1
     bd8:	e50b300c 	str	r3, [fp, #-12]
    x = -xx;
     bdc:	e51b3034 	ldr	r3, [fp, #-52]	@ 0xffffffcc
     be0:	e2633000 	rsb	r3, r3, #0
     be4:	e50b3010 	str	r3, [fp, #-16]
     be8:	ea000001 	b	bf4 <printint+0x5c>
  } else {
    x = xx;
     bec:	e51b3034 	ldr	r3, [fp, #-52]	@ 0xffffffcc
     bf0:	e50b3010 	str	r3, [fp, #-16]
  }

  b = base;
     bf4:	e51b3038 	ldr	r3, [fp, #-56]	@ 0xffffffc8
     bf8:	e50b3014 	str	r3, [fp, #-20]	@ 0xffffffec
  i = 0;
     bfc:	e3a03000 	mov	r3, #0
     c00:	e50b3008 	str	r3, [fp, #-8]
  do{
    y = div(x, b);
     c04:	e51b1014 	ldr	r1, [fp, #-20]	@ 0xffffffec
     c08:	e51b0010 	ldr	r0, [fp, #-16]
     c0c:	ebffffb1 	bl	ad8 <div>
     c10:	e50b0018 	str	r0, [fp, #-24]	@ 0xffffffe8
    buf[i++] = digits[x - y * b];
     c14:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
     c18:	e51b2014 	ldr	r2, [fp, #-20]	@ 0xffffffec
     c1c:	e0030392 	mul	r3, r2, r3
     c20:	e51b2010 	ldr	r2, [fp, #-16]
     c24:	e0421003 	sub	r1, r2, r3
     c28:	e51b2008 	ldr	r2, [fp, #-8]
     c2c:	e2823001 	add	r3, r2, #1
     c30:	e50b3008 	str	r3, [fp, #-8]
     c34:	e30132dc 	movw	r3, #4828	@ 0x12dc
     c38:	e3403000 	movt	r3, #0
     c3c:	e7d31001 	ldrb	r1, [r3, r1]
     c40:	e2423004 	sub	r3, r2, #4
     c44:	e083300b 	add	r3, r3, fp
     c48:	e1a02001 	mov	r2, r1
     c4c:	e5432024 	strb	r2, [r3, #-36]	@ 0xffffffdc
  }while((x = y) != 0);
     c50:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
     c54:	e50b3010 	str	r3, [fp, #-16]
     c58:	e51b3010 	ldr	r3, [fp, #-16]
     c5c:	e3530000 	cmp	r3, #0
     c60:	1affffe7 	bne	c04 <printint+0x6c>
  if(neg)
     c64:	e51b300c 	ldr	r3, [fp, #-12]
     c68:	e3530000 	cmp	r3, #0
     c6c:	0a00000e 	beq	cac <printint+0x114>
    buf[i++] = '-';
     c70:	e51b3008 	ldr	r3, [fp, #-8]
     c74:	e2832001 	add	r2, r3, #1
     c78:	e50b2008 	str	r2, [fp, #-8]
     c7c:	e2433004 	sub	r3, r3, #4
     c80:	e083300b 	add	r3, r3, fp
     c84:	e3a0202d 	mov	r2, #45	@ 0x2d
     c88:	e5432024 	strb	r2, [r3, #-36]	@ 0xffffffdc

  while(--i >= 0)
     c8c:	ea000006 	b	cac <printint+0x114>
    putc(fd, buf[i]);
     c90:	e24b2028 	sub	r2, fp, #40	@ 0x28
     c94:	e51b3008 	ldr	r3, [fp, #-8]
     c98:	e0823003 	add	r3, r2, r3
     c9c:	e5d33000 	ldrb	r3, [r3]
     ca0:	e1a01003 	mov	r1, r3
     ca4:	e51b0030 	ldr	r0, [fp, #-48]	@ 0xffffffd0
     ca8:	ebffff7c 	bl	aa0 <putc>
  while(--i >= 0)
     cac:	e51b3008 	ldr	r3, [fp, #-8]
     cb0:	e2433001 	sub	r3, r3, #1
     cb4:	e50b3008 	str	r3, [fp, #-8]
     cb8:	e51b3008 	ldr	r3, [fp, #-8]
     cbc:	e3530000 	cmp	r3, #0
     cc0:	aafffff2 	bge	c90 <printint+0xf8>
}
     cc4:	e320f000 	nop	{0}
     cc8:	e320f000 	nop	{0}
     ccc:	e24bd004 	sub	sp, fp, #4
     cd0:	e8bd8800 	pop	{fp, pc}

00000cd4 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
     cd4:	e92d000e 	push	{r1, r2, r3}
     cd8:	e92d4800 	push	{fp, lr}
     cdc:	e28db004 	add	fp, sp, #4
     ce0:	e24dd024 	sub	sp, sp, #36	@ 0x24
     ce4:	e50b0024 	str	r0, [fp, #-36]	@ 0xffffffdc
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
     ce8:	e3a03000 	mov	r3, #0
     cec:	e50b3014 	str	r3, [fp, #-20]	@ 0xffffffec
  ap = (uint*)(void*)&fmt + 1;
     cf0:	e28b3008 	add	r3, fp, #8
     cf4:	e50b3018 	str	r3, [fp, #-24]	@ 0xffffffe8
  for(i = 0; fmt[i]; i++){
     cf8:	e3a03000 	mov	r3, #0
     cfc:	e50b3010 	str	r3, [fp, #-16]
     d00:	ea000075 	b	edc <printf+0x208>
    c = fmt[i] & 0xff;
     d04:	e59b2004 	ldr	r2, [fp, #4]
     d08:	e51b3010 	ldr	r3, [fp, #-16]
     d0c:	e0823003 	add	r3, r2, r3
     d10:	e5d33000 	ldrb	r3, [r3]
     d14:	e50b301c 	str	r3, [fp, #-28]	@ 0xffffffe4
    if(state == 0){
     d18:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
     d1c:	e3530000 	cmp	r3, #0
     d20:	1a00000b 	bne	d54 <printf+0x80>
      if(c == '%'){
     d24:	e51b301c 	ldr	r3, [fp, #-28]	@ 0xffffffe4
     d28:	e3530025 	cmp	r3, #37	@ 0x25
     d2c:	1a000002 	bne	d3c <printf+0x68>
        state = '%';
     d30:	e3a03025 	mov	r3, #37	@ 0x25
     d34:	e50b3014 	str	r3, [fp, #-20]	@ 0xffffffec
     d38:	ea000064 	b	ed0 <printf+0x1fc>
      } else {
        putc(fd, c);
     d3c:	e51b301c 	ldr	r3, [fp, #-28]	@ 0xffffffe4
     d40:	e6ef3073 	uxtb	r3, r3
     d44:	e1a01003 	mov	r1, r3
     d48:	e51b0024 	ldr	r0, [fp, #-36]	@ 0xffffffdc
     d4c:	ebffff53 	bl	aa0 <putc>
     d50:	ea00005e 	b	ed0 <printf+0x1fc>
      }
    } else if(state == '%'){
     d54:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
     d58:	e3530025 	cmp	r3, #37	@ 0x25
     d5c:	1a00005b 	bne	ed0 <printf+0x1fc>
      if(c == 'd'){
     d60:	e51b301c 	ldr	r3, [fp, #-28]	@ 0xffffffe4
     d64:	e3530064 	cmp	r3, #100	@ 0x64
     d68:	1a00000a 	bne	d98 <printf+0xc4>
        printint(fd, *ap, 10, 1);
     d6c:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
     d70:	e5933000 	ldr	r3, [r3]
     d74:	e1a01003 	mov	r1, r3
     d78:	e3a03001 	mov	r3, #1
     d7c:	e3a0200a 	mov	r2, #10
     d80:	e51b0024 	ldr	r0, [fp, #-36]	@ 0xffffffdc
     d84:	ebffff83 	bl	b98 <printint>
        ap++;
     d88:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
     d8c:	e2833004 	add	r3, r3, #4
     d90:	e50b3018 	str	r3, [fp, #-24]	@ 0xffffffe8
     d94:	ea00004b 	b	ec8 <printf+0x1f4>
      } else if(c == 'x' || c == 'p'){
     d98:	e51b301c 	ldr	r3, [fp, #-28]	@ 0xffffffe4
     d9c:	e3530078 	cmp	r3, #120	@ 0x78
     da0:	0a000002 	beq	db0 <printf+0xdc>
     da4:	e51b301c 	ldr	r3, [fp, #-28]	@ 0xffffffe4
     da8:	e3530070 	cmp	r3, #112	@ 0x70
     dac:	1a00000a 	bne	ddc <printf+0x108>
        printint(fd, *ap, 16, 0);
     db0:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
     db4:	e5933000 	ldr	r3, [r3]
     db8:	e1a01003 	mov	r1, r3
     dbc:	e3a03000 	mov	r3, #0
     dc0:	e3a02010 	mov	r2, #16
     dc4:	e51b0024 	ldr	r0, [fp, #-36]	@ 0xffffffdc
     dc8:	ebffff72 	bl	b98 <printint>
        ap++;
     dcc:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
     dd0:	e2833004 	add	r3, r3, #4
     dd4:	e50b3018 	str	r3, [fp, #-24]	@ 0xffffffe8
     dd8:	ea00003a 	b	ec8 <printf+0x1f4>
      } else if(c == 's'){
     ddc:	e51b301c 	ldr	r3, [fp, #-28]	@ 0xffffffe4
     de0:	e3530073 	cmp	r3, #115	@ 0x73
     de4:	1a000019 	bne	e50 <printf+0x17c>
        s = (char*)*ap;
     de8:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
     dec:	e5933000 	ldr	r3, [r3]
     df0:	e50b300c 	str	r3, [fp, #-12]
        ap++;
     df4:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
     df8:	e2833004 	add	r3, r3, #4
     dfc:	e50b3018 	str	r3, [fp, #-24]	@ 0xffffffe8
        if(s == 0)
     e00:	e51b300c 	ldr	r3, [fp, #-12]
     e04:	e3530000 	cmp	r3, #0
     e08:	1a00000b 	bne	e3c <printf+0x168>
          s = "(null)";
     e0c:	e30132d4 	movw	r3, #4820	@ 0x12d4
     e10:	e3403000 	movt	r3, #0
     e14:	e50b300c 	str	r3, [fp, #-12]
        while(*s != 0){
     e18:	ea000007 	b	e3c <printf+0x168>
          putc(fd, *s);
     e1c:	e51b300c 	ldr	r3, [fp, #-12]
     e20:	e5d33000 	ldrb	r3, [r3]
     e24:	e1a01003 	mov	r1, r3
     e28:	e51b0024 	ldr	r0, [fp, #-36]	@ 0xffffffdc
     e2c:	ebffff1b 	bl	aa0 <putc>
          s++;
     e30:	e51b300c 	ldr	r3, [fp, #-12]
     e34:	e2833001 	add	r3, r3, #1
     e38:	e50b300c 	str	r3, [fp, #-12]
        while(*s != 0){
     e3c:	e51b300c 	ldr	r3, [fp, #-12]
     e40:	e5d33000 	ldrb	r3, [r3]
     e44:	e3530000 	cmp	r3, #0
     e48:	1afffff3 	bne	e1c <printf+0x148>
     e4c:	ea00001d 	b	ec8 <printf+0x1f4>
        }
      } else if(c == 'c'){
     e50:	e51b301c 	ldr	r3, [fp, #-28]	@ 0xffffffe4
     e54:	e3530063 	cmp	r3, #99	@ 0x63
     e58:	1a000009 	bne	e84 <printf+0x1b0>
        putc(fd, *ap);
     e5c:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
     e60:	e5933000 	ldr	r3, [r3]
     e64:	e6ef3073 	uxtb	r3, r3
     e68:	e1a01003 	mov	r1, r3
     e6c:	e51b0024 	ldr	r0, [fp, #-36]	@ 0xffffffdc
     e70:	ebffff0a 	bl	aa0 <putc>
        ap++;
     e74:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
     e78:	e2833004 	add	r3, r3, #4
     e7c:	e50b3018 	str	r3, [fp, #-24]	@ 0xffffffe8
     e80:	ea000010 	b	ec8 <printf+0x1f4>
      } else if(c == '%'){
     e84:	e51b301c 	ldr	r3, [fp, #-28]	@ 0xffffffe4
     e88:	e3530025 	cmp	r3, #37	@ 0x25
     e8c:	1a000005 	bne	ea8 <printf+0x1d4>
        putc(fd, c);
     e90:	e51b301c 	ldr	r3, [fp, #-28]	@ 0xffffffe4
     e94:	e6ef3073 	uxtb	r3, r3
     e98:	e1a01003 	mov	r1, r3
     e9c:	e51b0024 	ldr	r0, [fp, #-36]	@ 0xffffffdc
     ea0:	ebfffefe 	bl	aa0 <putc>
     ea4:	ea000007 	b	ec8 <printf+0x1f4>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
     ea8:	e3a01025 	mov	r1, #37	@ 0x25
     eac:	e51b0024 	ldr	r0, [fp, #-36]	@ 0xffffffdc
     eb0:	ebfffefa 	bl	aa0 <putc>
        putc(fd, c);
     eb4:	e51b301c 	ldr	r3, [fp, #-28]	@ 0xffffffe4
     eb8:	e6ef3073 	uxtb	r3, r3
     ebc:	e1a01003 	mov	r1, r3
     ec0:	e51b0024 	ldr	r0, [fp, #-36]	@ 0xffffffdc
     ec4:	ebfffef5 	bl	aa0 <putc>
      }
      state = 0;
     ec8:	e3a03000 	mov	r3, #0
     ecc:	e50b3014 	str	r3, [fp, #-20]	@ 0xffffffec
  for(i = 0; fmt[i]; i++){
     ed0:	e51b3010 	ldr	r3, [fp, #-16]
     ed4:	e2833001 	add	r3, r3, #1
     ed8:	e50b3010 	str	r3, [fp, #-16]
     edc:	e59b2004 	ldr	r2, [fp, #4]
     ee0:	e51b3010 	ldr	r3, [fp, #-16]
     ee4:	e0823003 	add	r3, r2, r3
     ee8:	e5d33000 	ldrb	r3, [r3]
     eec:	e3530000 	cmp	r3, #0
     ef0:	1affff83 	bne	d04 <printf+0x30>
    }
  }
}
     ef4:	e320f000 	nop	{0}
     ef8:	e320f000 	nop	{0}
     efc:	e24bd004 	sub	sp, fp, #4
     f00:	e8bd4800 	pop	{fp, lr}
     f04:	e28dd00c 	add	sp, sp, #12
     f08:	e12fff1e 	bx	lr

00000f0c <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
     f0c:	e52db004 	push	{fp}		@ (str fp, [sp, #-4]!)
     f10:	e28db000 	add	fp, sp, #0
     f14:	e24dd014 	sub	sp, sp, #20
     f18:	e50b0010 	str	r0, [fp, #-16]
  Header *bp, *p;

  bp = (Header*)ap - 1;
     f1c:	e51b3010 	ldr	r3, [fp, #-16]
     f20:	e2433008 	sub	r3, r3, #8
     f24:	e50b300c 	str	r3, [fp, #-12]
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
     f28:	e30134f8 	movw	r3, #5368	@ 0x14f8
     f2c:	e3403000 	movt	r3, #0
     f30:	e5933000 	ldr	r3, [r3]
     f34:	e50b3008 	str	r3, [fp, #-8]
     f38:	ea000010 	b	f80 <free+0x74>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
     f3c:	e51b3008 	ldr	r3, [fp, #-8]
     f40:	e5933000 	ldr	r3, [r3]
     f44:	e51b2008 	ldr	r2, [fp, #-8]
     f48:	e1520003 	cmp	r2, r3
     f4c:	3a000008 	bcc	f74 <free+0x68>
     f50:	e51b200c 	ldr	r2, [fp, #-12]
     f54:	e51b3008 	ldr	r3, [fp, #-8]
     f58:	e1520003 	cmp	r2, r3
     f5c:	8a000010 	bhi	fa4 <free+0x98>
     f60:	e51b3008 	ldr	r3, [fp, #-8]
     f64:	e5933000 	ldr	r3, [r3]
     f68:	e51b200c 	ldr	r2, [fp, #-12]
     f6c:	e1520003 	cmp	r2, r3
     f70:	3a00000b 	bcc	fa4 <free+0x98>
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
     f74:	e51b3008 	ldr	r3, [fp, #-8]
     f78:	e5933000 	ldr	r3, [r3]
     f7c:	e50b3008 	str	r3, [fp, #-8]
     f80:	e51b200c 	ldr	r2, [fp, #-12]
     f84:	e51b3008 	ldr	r3, [fp, #-8]
     f88:	e1520003 	cmp	r2, r3
     f8c:	9affffea 	bls	f3c <free+0x30>
     f90:	e51b3008 	ldr	r3, [fp, #-8]
     f94:	e5933000 	ldr	r3, [r3]
     f98:	e51b200c 	ldr	r2, [fp, #-12]
     f9c:	e1520003 	cmp	r2, r3
     fa0:	2affffe5 	bcs	f3c <free+0x30>
      break;
  if(bp + bp->s.size == p->s.ptr){
     fa4:	e51b300c 	ldr	r3, [fp, #-12]
     fa8:	e5933004 	ldr	r3, [r3, #4]
     fac:	e1a03183 	lsl	r3, r3, #3
     fb0:	e51b200c 	ldr	r2, [fp, #-12]
     fb4:	e0822003 	add	r2, r2, r3
     fb8:	e51b3008 	ldr	r3, [fp, #-8]
     fbc:	e5933000 	ldr	r3, [r3]
     fc0:	e1520003 	cmp	r2, r3
     fc4:	1a00000d 	bne	1000 <free+0xf4>
    bp->s.size += p->s.ptr->s.size;
     fc8:	e51b300c 	ldr	r3, [fp, #-12]
     fcc:	e5932004 	ldr	r2, [r3, #4]
     fd0:	e51b3008 	ldr	r3, [fp, #-8]
     fd4:	e5933000 	ldr	r3, [r3]
     fd8:	e5933004 	ldr	r3, [r3, #4]
     fdc:	e0822003 	add	r2, r2, r3
     fe0:	e51b300c 	ldr	r3, [fp, #-12]
     fe4:	e5832004 	str	r2, [r3, #4]
    bp->s.ptr = p->s.ptr->s.ptr;
     fe8:	e51b3008 	ldr	r3, [fp, #-8]
     fec:	e5933000 	ldr	r3, [r3]
     ff0:	e5932000 	ldr	r2, [r3]
     ff4:	e51b300c 	ldr	r3, [fp, #-12]
     ff8:	e5832000 	str	r2, [r3]
     ffc:	ea000003 	b	1010 <free+0x104>
  } else
    bp->s.ptr = p->s.ptr;
    1000:	e51b3008 	ldr	r3, [fp, #-8]
    1004:	e5932000 	ldr	r2, [r3]
    1008:	e51b300c 	ldr	r3, [fp, #-12]
    100c:	e5832000 	str	r2, [r3]
  if(p + p->s.size == bp){
    1010:	e51b3008 	ldr	r3, [fp, #-8]
    1014:	e5933004 	ldr	r3, [r3, #4]
    1018:	e1a03183 	lsl	r3, r3, #3
    101c:	e51b2008 	ldr	r2, [fp, #-8]
    1020:	e0823003 	add	r3, r2, r3
    1024:	e51b200c 	ldr	r2, [fp, #-12]
    1028:	e1520003 	cmp	r2, r3
    102c:	1a00000b 	bne	1060 <free+0x154>
    p->s.size += bp->s.size;
    1030:	e51b3008 	ldr	r3, [fp, #-8]
    1034:	e5932004 	ldr	r2, [r3, #4]
    1038:	e51b300c 	ldr	r3, [fp, #-12]
    103c:	e5933004 	ldr	r3, [r3, #4]
    1040:	e0822003 	add	r2, r2, r3
    1044:	e51b3008 	ldr	r3, [fp, #-8]
    1048:	e5832004 	str	r2, [r3, #4]
    p->s.ptr = bp->s.ptr;
    104c:	e51b300c 	ldr	r3, [fp, #-12]
    1050:	e5932000 	ldr	r2, [r3]
    1054:	e51b3008 	ldr	r3, [fp, #-8]
    1058:	e5832000 	str	r2, [r3]
    105c:	ea000002 	b	106c <free+0x160>
  } else
    p->s.ptr = bp;
    1060:	e51b3008 	ldr	r3, [fp, #-8]
    1064:	e51b200c 	ldr	r2, [fp, #-12]
    1068:	e5832000 	str	r2, [r3]
  freep = p;
    106c:	e30134f8 	movw	r3, #5368	@ 0x14f8
    1070:	e3403000 	movt	r3, #0
    1074:	e51b2008 	ldr	r2, [fp, #-8]
    1078:	e5832000 	str	r2, [r3]
}
    107c:	e320f000 	nop	{0}
    1080:	e28bd000 	add	sp, fp, #0
    1084:	e49db004 	pop	{fp}		@ (ldr fp, [sp], #4)
    1088:	e12fff1e 	bx	lr

0000108c <morecore>:

static Header*
morecore(uint nu)
{
    108c:	e92d4800 	push	{fp, lr}
    1090:	e28db004 	add	fp, sp, #4
    1094:	e24dd010 	sub	sp, sp, #16
    1098:	e50b0010 	str	r0, [fp, #-16]
  char *p;
  Header *hp;

  if(nu < 4096)
    109c:	e51b3010 	ldr	r3, [fp, #-16]
    10a0:	e3530a01 	cmp	r3, #4096	@ 0x1000
    10a4:	2a000001 	bcs	10b0 <morecore+0x24>
    nu = 4096;
    10a8:	e3a03a01 	mov	r3, #4096	@ 0x1000
    10ac:	e50b3010 	str	r3, [fp, #-16]
  p = sbrk(nu * sizeof(Header));
    10b0:	e51b3010 	ldr	r3, [fp, #-16]
    10b4:	e1a03183 	lsl	r3, r3, #3
    10b8:	e1a00003 	mov	r0, r3
    10bc:	ebfffe50 	bl	a04 <sbrk>
    10c0:	e50b0008 	str	r0, [fp, #-8]
  if(p == (char*)-1)
    10c4:	e51b3008 	ldr	r3, [fp, #-8]
    10c8:	e3730001 	cmn	r3, #1
    10cc:	1a000001 	bne	10d8 <morecore+0x4c>
    return 0;
    10d0:	e3a03000 	mov	r3, #0
    10d4:	ea00000b 	b	1108 <morecore+0x7c>
  hp = (Header*)p;
    10d8:	e51b3008 	ldr	r3, [fp, #-8]
    10dc:	e50b300c 	str	r3, [fp, #-12]
  hp->s.size = nu;
    10e0:	e51b300c 	ldr	r3, [fp, #-12]
    10e4:	e51b2010 	ldr	r2, [fp, #-16]
    10e8:	e5832004 	str	r2, [r3, #4]
  free((void*)(hp + 1));
    10ec:	e51b300c 	ldr	r3, [fp, #-12]
    10f0:	e2833008 	add	r3, r3, #8
    10f4:	e1a00003 	mov	r0, r3
    10f8:	ebffff83 	bl	f0c <free>
  return freep;
    10fc:	e30134f8 	movw	r3, #5368	@ 0x14f8
    1100:	e3403000 	movt	r3, #0
    1104:	e5933000 	ldr	r3, [r3]
}
    1108:	e1a00003 	mov	r0, r3
    110c:	e24bd004 	sub	sp, fp, #4
    1110:	e8bd8800 	pop	{fp, pc}

00001114 <malloc>:

void*
malloc(uint nbytes)
{
    1114:	e92d4800 	push	{fp, lr}
    1118:	e28db004 	add	fp, sp, #4
    111c:	e24dd018 	sub	sp, sp, #24
    1120:	e50b0018 	str	r0, [fp, #-24]	@ 0xffffffe8
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1124:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
    1128:	e2833007 	add	r3, r3, #7
    112c:	e1a031a3 	lsr	r3, r3, #3
    1130:	e2833001 	add	r3, r3, #1
    1134:	e50b3010 	str	r3, [fp, #-16]
  if((prevp = freep) == 0){
    1138:	e30134f8 	movw	r3, #5368	@ 0x14f8
    113c:	e3403000 	movt	r3, #0
    1140:	e5933000 	ldr	r3, [r3]
    1144:	e50b300c 	str	r3, [fp, #-12]
    1148:	e51b300c 	ldr	r3, [fp, #-12]
    114c:	e3530000 	cmp	r3, #0
    1150:	1a000010 	bne	1198 <malloc+0x84>
    base.s.ptr = freep = prevp = &base;
    1154:	e30134f0 	movw	r3, #5360	@ 0x14f0
    1158:	e3403000 	movt	r3, #0
    115c:	e50b300c 	str	r3, [fp, #-12]
    1160:	e30134f8 	movw	r3, #5368	@ 0x14f8
    1164:	e3403000 	movt	r3, #0
    1168:	e51b200c 	ldr	r2, [fp, #-12]
    116c:	e5832000 	str	r2, [r3]
    1170:	e30134f8 	movw	r3, #5368	@ 0x14f8
    1174:	e3403000 	movt	r3, #0
    1178:	e5932000 	ldr	r2, [r3]
    117c:	e30134f0 	movw	r3, #5360	@ 0x14f0
    1180:	e3403000 	movt	r3, #0
    1184:	e5832000 	str	r2, [r3]
    base.s.size = 0;
    1188:	e30134f0 	movw	r3, #5360	@ 0x14f0
    118c:	e3403000 	movt	r3, #0
    1190:	e3a02000 	mov	r2, #0
    1194:	e5832004 	str	r2, [r3, #4]
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1198:	e51b300c 	ldr	r3, [fp, #-12]
    119c:	e5933000 	ldr	r3, [r3]
    11a0:	e50b3008 	str	r3, [fp, #-8]
    if(p->s.size >= nunits){
    11a4:	e51b3008 	ldr	r3, [fp, #-8]
    11a8:	e5933004 	ldr	r3, [r3, #4]
    11ac:	e51b2010 	ldr	r2, [fp, #-16]
    11b0:	e1520003 	cmp	r2, r3
    11b4:	8a00001f 	bhi	1238 <malloc+0x124>
      if(p->s.size == nunits)
    11b8:	e51b3008 	ldr	r3, [fp, #-8]
    11bc:	e5933004 	ldr	r3, [r3, #4]
    11c0:	e51b2010 	ldr	r2, [fp, #-16]
    11c4:	e1520003 	cmp	r2, r3
    11c8:	1a000004 	bne	11e0 <malloc+0xcc>
        prevp->s.ptr = p->s.ptr;
    11cc:	e51b3008 	ldr	r3, [fp, #-8]
    11d0:	e5932000 	ldr	r2, [r3]
    11d4:	e51b300c 	ldr	r3, [fp, #-12]
    11d8:	e5832000 	str	r2, [r3]
    11dc:	ea00000e 	b	121c <malloc+0x108>
      else {
        p->s.size -= nunits;
    11e0:	e51b3008 	ldr	r3, [fp, #-8]
    11e4:	e5932004 	ldr	r2, [r3, #4]
    11e8:	e51b3010 	ldr	r3, [fp, #-16]
    11ec:	e0422003 	sub	r2, r2, r3
    11f0:	e51b3008 	ldr	r3, [fp, #-8]
    11f4:	e5832004 	str	r2, [r3, #4]
        p += p->s.size;
    11f8:	e51b3008 	ldr	r3, [fp, #-8]
    11fc:	e5933004 	ldr	r3, [r3, #4]
    1200:	e1a03183 	lsl	r3, r3, #3
    1204:	e51b2008 	ldr	r2, [fp, #-8]
    1208:	e0823003 	add	r3, r2, r3
    120c:	e50b3008 	str	r3, [fp, #-8]
        p->s.size = nunits;
    1210:	e51b3008 	ldr	r3, [fp, #-8]
    1214:	e51b2010 	ldr	r2, [fp, #-16]
    1218:	e5832004 	str	r2, [r3, #4]
      }
      freep = prevp;
    121c:	e30134f8 	movw	r3, #5368	@ 0x14f8
    1220:	e3403000 	movt	r3, #0
    1224:	e51b200c 	ldr	r2, [fp, #-12]
    1228:	e5832000 	str	r2, [r3]
      return (void*)(p + 1);
    122c:	e51b3008 	ldr	r3, [fp, #-8]
    1230:	e2833008 	add	r3, r3, #8
    1234:	ea000013 	b	1288 <malloc+0x174>
    }
    if(p == freep)
    1238:	e30134f8 	movw	r3, #5368	@ 0x14f8
    123c:	e3403000 	movt	r3, #0
    1240:	e5933000 	ldr	r3, [r3]
    1244:	e51b2008 	ldr	r2, [fp, #-8]
    1248:	e1520003 	cmp	r2, r3
    124c:	1a000007 	bne	1270 <malloc+0x15c>
      if((p = morecore(nunits)) == 0)
    1250:	e51b0010 	ldr	r0, [fp, #-16]
    1254:	ebffff8c 	bl	108c <morecore>
    1258:	e50b0008 	str	r0, [fp, #-8]
    125c:	e51b3008 	ldr	r3, [fp, #-8]
    1260:	e3530000 	cmp	r3, #0
    1264:	1a000001 	bne	1270 <malloc+0x15c>
        return 0;
    1268:	e3a03000 	mov	r3, #0
    126c:	ea000005 	b	1288 <malloc+0x174>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1270:	e51b3008 	ldr	r3, [fp, #-8]
    1274:	e50b300c 	str	r3, [fp, #-12]
    1278:	e51b3008 	ldr	r3, [fp, #-8]
    127c:	e5933000 	ldr	r3, [r3]
    1280:	e50b3008 	str	r3, [fp, #-8]
    if(p->s.size >= nunits){
    1284:	eaffffc6 	b	11a4 <malloc+0x90>
  }
}
    1288:	e1a00003 	mov	r0, r3
    128c:	e24bd004 	sub	sp, fp, #4
    1290:	e8bd8800 	pop	{fp, pc}
