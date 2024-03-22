
_grep:     file format elf32-littlearm


Disassembly of section .text:

00000000 <grep>:
char buf[1024];
int match(char*, char*);

void
grep(char *pattern, int fd)
{
       0:	e92d4800 	push	{fp, lr}
       4:	e28db004 	add	fp, sp, #4
       8:	e24dd018 	sub	sp, sp, #24
       c:	e50b0018 	str	r0, [fp, #-24]	@ 0xffffffe8
      10:	e50b101c 	str	r1, [fp, #-28]	@ 0xffffffe4
  int n, m;
  char *p, *q;
  
  m = 0;
      14:	e3a03000 	mov	r3, #0
      18:	e50b3008 	str	r3, [fp, #-8]
  while((n = read(fd, buf+m, sizeof(buf)-m)) > 0){
      1c:	ea00003b 	b	110 <grep+0x110>
    m += n;
      20:	e51b2008 	ldr	r2, [fp, #-8]
      24:	e51b3010 	ldr	r3, [fp, #-16]
      28:	e0823003 	add	r3, r2, r3
      2c:	e50b3008 	str	r3, [fp, #-8]
    p = buf;
      30:	e3013508 	movw	r3, #5384	@ 0x1508
      34:	e3403000 	movt	r3, #0
      38:	e50b300c 	str	r3, [fp, #-12]
    while((q = strchr(p, '\n')) != 0){
      3c:	ea000016 	b	9c <grep+0x9c>
      *q = 0;
      40:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
      44:	e3a02000 	mov	r2, #0
      48:	e5c32000 	strb	r2, [r3]
      if(match(pattern, p)){
      4c:	e51b100c 	ldr	r1, [fp, #-12]
      50:	e51b0018 	ldr	r0, [fp, #-24]	@ 0xffffffe8
      54:	eb00007c 	bl	24c <match>
      58:	e1a03000 	mov	r3, r0
      5c:	e3530000 	cmp	r3, #0
      60:	0a00000a 	beq	90 <grep+0x90>
        *q = '\n';
      64:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
      68:	e3a0200a 	mov	r2, #10
      6c:	e5c32000 	strb	r2, [r3]
        write(1, p, q+1 - p);
      70:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
      74:	e2832001 	add	r2, r3, #1
      78:	e51b300c 	ldr	r3, [fp, #-12]
      7c:	e0423003 	sub	r3, r2, r3
      80:	e1a02003 	mov	r2, r3
      84:	e51b100c 	ldr	r1, [fp, #-12]
      88:	e3a00001 	mov	r0, #1
      8c:	eb00023b 	bl	980 <write>
      }
      p = q+1;
      90:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
      94:	e2833001 	add	r3, r3, #1
      98:	e50b300c 	str	r3, [fp, #-12]
    while((q = strchr(p, '\n')) != 0){
      9c:	e3a0100a 	mov	r1, #10
      a0:	e51b000c 	ldr	r0, [fp, #-12]
      a4:	eb000158 	bl	60c <strchr>
      a8:	e50b0014 	str	r0, [fp, #-20]	@ 0xffffffec
      ac:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
      b0:	e3530000 	cmp	r3, #0
      b4:	1affffe1 	bne	40 <grep+0x40>
    }
    if(p == buf)
      b8:	e51b200c 	ldr	r2, [fp, #-12]
      bc:	e3013508 	movw	r3, #5384	@ 0x1508
      c0:	e3403000 	movt	r3, #0
      c4:	e1520003 	cmp	r2, r3
      c8:	1a000001 	bne	d4 <grep+0xd4>
      m = 0;
      cc:	e3a03000 	mov	r3, #0
      d0:	e50b3008 	str	r3, [fp, #-8]
    if(m > 0){
      d4:	e51b3008 	ldr	r3, [fp, #-8]
      d8:	e3530000 	cmp	r3, #0
      dc:	da00000b 	ble	110 <grep+0x110>
      m -= p - buf;
      e0:	e51b200c 	ldr	r2, [fp, #-12]
      e4:	e3013508 	movw	r3, #5384	@ 0x1508
      e8:	e3403000 	movt	r3, #0
      ec:	e0423003 	sub	r3, r2, r3
      f0:	e51b2008 	ldr	r2, [fp, #-8]
      f4:	e0423003 	sub	r3, r2, r3
      f8:	e50b3008 	str	r3, [fp, #-8]
      memmove(buf, p, m);
      fc:	e51b2008 	ldr	r2, [fp, #-8]
     100:	e51b100c 	ldr	r1, [fp, #-12]
     104:	e3010508 	movw	r0, #5384	@ 0x1508
     108:	e3400000 	movt	r0, #0
     10c:	eb0001bd 	bl	808 <memmove>
  while((n = read(fd, buf+m, sizeof(buf)-m)) > 0){
     110:	e51b2008 	ldr	r2, [fp, #-8]
     114:	e3013508 	movw	r3, #5384	@ 0x1508
     118:	e3403000 	movt	r3, #0
     11c:	e0821003 	add	r1, r2, r3
     120:	e51b3008 	ldr	r3, [fp, #-8]
     124:	e2633b01 	rsb	r3, r3, #1024	@ 0x400
     128:	e1a02003 	mov	r2, r3
     12c:	e51b001c 	ldr	r0, [fp, #-28]	@ 0xffffffe4
     130:	eb000205 	bl	94c <read>
     134:	e50b0010 	str	r0, [fp, #-16]
     138:	e51b3010 	ldr	r3, [fp, #-16]
     13c:	e3530000 	cmp	r3, #0
     140:	caffffb6 	bgt	20 <grep+0x20>
    }
  }
}
     144:	e320f000 	nop	{0}
     148:	e320f000 	nop	{0}
     14c:	e24bd004 	sub	sp, fp, #4
     150:	e8bd8800 	pop	{fp, pc}

00000154 <main>:

int
main(int argc, char *argv[])
{
     154:	e92d4800 	push	{fp, lr}
     158:	e28db004 	add	fp, sp, #4
     15c:	e24dd018 	sub	sp, sp, #24
     160:	e50b0018 	str	r0, [fp, #-24]	@ 0xffffffe8
     164:	e50b101c 	str	r1, [fp, #-28]	@ 0xffffffe4
  int fd, i;
  char *pattern;
  
  if(argc <= 1){
     168:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
     16c:	e3530001 	cmp	r3, #1
     170:	ca000004 	bgt	188 <main+0x34>
    printf(2, "usage: grep pattern [file ...]\n");
     174:	e30114b4 	movw	r1, #5300	@ 0x14b4
     178:	e3401000 	movt	r1, #0
     17c:	e3a00002 	mov	r0, #2
     180:	eb00035b 	bl	ef4 <printf>
    exit();
     184:	eb0001c9 	bl	8b0 <exit>
  }
  pattern = argv[1];
     188:	e51b301c 	ldr	r3, [fp, #-28]	@ 0xffffffe4
     18c:	e5933004 	ldr	r3, [r3, #4]
     190:	e50b300c 	str	r3, [fp, #-12]
  
  if(argc <= 2){
     194:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
     198:	e3530002 	cmp	r3, #2
     19c:	ca000003 	bgt	1b0 <main+0x5c>
    grep(pattern, 0);
     1a0:	e3a01000 	mov	r1, #0
     1a4:	e51b000c 	ldr	r0, [fp, #-12]
     1a8:	ebffff94 	bl	0 <grep>
    exit();
     1ac:	eb0001bf 	bl	8b0 <exit>
  }

  for(i = 2; i < argc; i++){
     1b0:	e3a03002 	mov	r3, #2
     1b4:	e50b3008 	str	r3, [fp, #-8]
     1b8:	ea00001e 	b	238 <main+0xe4>
    if((fd = open(argv[i], 0)) < 0){
     1bc:	e51b3008 	ldr	r3, [fp, #-8]
     1c0:	e1a03103 	lsl	r3, r3, #2
     1c4:	e51b201c 	ldr	r2, [fp, #-28]	@ 0xffffffe4
     1c8:	e0823003 	add	r3, r2, r3
     1cc:	e5933000 	ldr	r3, [r3]
     1d0:	e3a01000 	mov	r1, #0
     1d4:	e1a00003 	mov	r0, r3
     1d8:	eb00021c 	bl	a50 <open>
     1dc:	e50b0010 	str	r0, [fp, #-16]
     1e0:	e51b3010 	ldr	r3, [fp, #-16]
     1e4:	e3530000 	cmp	r3, #0
     1e8:	aa00000a 	bge	218 <main+0xc4>
      printf(1, "grep: cannot open %s\n", argv[i]);
     1ec:	e51b3008 	ldr	r3, [fp, #-8]
     1f0:	e1a03103 	lsl	r3, r3, #2
     1f4:	e51b201c 	ldr	r2, [fp, #-28]	@ 0xffffffe4
     1f8:	e0823003 	add	r3, r2, r3
     1fc:	e5933000 	ldr	r3, [r3]
     200:	e1a02003 	mov	r2, r3
     204:	e30114d4 	movw	r1, #5332	@ 0x14d4
     208:	e3401000 	movt	r1, #0
     20c:	e3a00001 	mov	r0, #1
     210:	eb000337 	bl	ef4 <printf>
      exit();
     214:	eb0001a5 	bl	8b0 <exit>
    }
    grep(pattern, fd);
     218:	e51b1010 	ldr	r1, [fp, #-16]
     21c:	e51b000c 	ldr	r0, [fp, #-12]
     220:	ebffff76 	bl	0 <grep>
    close(fd);
     224:	e51b0010 	ldr	r0, [fp, #-16]
     228:	eb0001e1 	bl	9b4 <close>
  for(i = 2; i < argc; i++){
     22c:	e51b3008 	ldr	r3, [fp, #-8]
     230:	e2833001 	add	r3, r3, #1
     234:	e50b3008 	str	r3, [fp, #-8]
     238:	e51b2008 	ldr	r2, [fp, #-8]
     23c:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
     240:	e1520003 	cmp	r2, r3
     244:	baffffdc 	blt	1bc <main+0x68>
  }
  exit();
     248:	eb000198 	bl	8b0 <exit>

0000024c <match>:
int matchhere(char*, char*);
int matchstar(int, char*, char*);

int
match(char *re, char *text)
{
     24c:	e92d4800 	push	{fp, lr}
     250:	e28db004 	add	fp, sp, #4
     254:	e24dd008 	sub	sp, sp, #8
     258:	e50b0008 	str	r0, [fp, #-8]
     25c:	e50b100c 	str	r1, [fp, #-12]
  if(re[0] == '^')
     260:	e51b3008 	ldr	r3, [fp, #-8]
     264:	e5d33000 	ldrb	r3, [r3]
     268:	e353005e 	cmp	r3, #94	@ 0x5e
     26c:	1a000006 	bne	28c <match+0x40>
    return matchhere(re+1, text);
     270:	e51b3008 	ldr	r3, [fp, #-8]
     274:	e2833001 	add	r3, r3, #1
     278:	e51b100c 	ldr	r1, [fp, #-12]
     27c:	e1a00003 	mov	r0, r3
     280:	eb000013 	bl	2d4 <matchhere>
     284:	e1a03000 	mov	r3, r0
     288:	ea00000e 	b	2c8 <match+0x7c>
  do{  // must look at empty string
    if(matchhere(re, text))
     28c:	e51b100c 	ldr	r1, [fp, #-12]
     290:	e51b0008 	ldr	r0, [fp, #-8]
     294:	eb00000e 	bl	2d4 <matchhere>
     298:	e1a03000 	mov	r3, r0
     29c:	e3530000 	cmp	r3, #0
     2a0:	0a000001 	beq	2ac <match+0x60>
      return 1;
     2a4:	e3a03001 	mov	r3, #1
     2a8:	ea000006 	b	2c8 <match+0x7c>
  }while(*text++ != '\0');
     2ac:	e51b300c 	ldr	r3, [fp, #-12]
     2b0:	e2832001 	add	r2, r3, #1
     2b4:	e50b200c 	str	r2, [fp, #-12]
     2b8:	e5d33000 	ldrb	r3, [r3]
     2bc:	e3530000 	cmp	r3, #0
     2c0:	1afffff1 	bne	28c <match+0x40>
  return 0;
     2c4:	e3a03000 	mov	r3, #0
}
     2c8:	e1a00003 	mov	r0, r3
     2cc:	e24bd004 	sub	sp, fp, #4
     2d0:	e8bd8800 	pop	{fp, pc}

000002d4 <matchhere>:

// matchhere: search for re at beginning of text
int matchhere(char *re, char *text)
{
     2d4:	e92d4800 	push	{fp, lr}
     2d8:	e28db004 	add	fp, sp, #4
     2dc:	e24dd008 	sub	sp, sp, #8
     2e0:	e50b0008 	str	r0, [fp, #-8]
     2e4:	e50b100c 	str	r1, [fp, #-12]
  if(re[0] == '\0')
     2e8:	e51b3008 	ldr	r3, [fp, #-8]
     2ec:	e5d33000 	ldrb	r3, [r3]
     2f0:	e3530000 	cmp	r3, #0
     2f4:	1a000001 	bne	300 <matchhere+0x2c>
    return 1;
     2f8:	e3a03001 	mov	r3, #1
     2fc:	ea000036 	b	3dc <matchhere+0x108>
  if(re[1] == '*')
     300:	e51b3008 	ldr	r3, [fp, #-8]
     304:	e2833001 	add	r3, r3, #1
     308:	e5d33000 	ldrb	r3, [r3]
     30c:	e353002a 	cmp	r3, #42	@ 0x2a
     310:	1a000009 	bne	33c <matchhere+0x68>
    return matchstar(re[0], re+2, text);
     314:	e51b3008 	ldr	r3, [fp, #-8]
     318:	e5d33000 	ldrb	r3, [r3]
     31c:	e1a00003 	mov	r0, r3
     320:	e51b3008 	ldr	r3, [fp, #-8]
     324:	e2833002 	add	r3, r3, #2
     328:	e51b200c 	ldr	r2, [fp, #-12]
     32c:	e1a01003 	mov	r1, r3
     330:	eb00002c 	bl	3e8 <matchstar>
     334:	e1a03000 	mov	r3, r0
     338:	ea000027 	b	3dc <matchhere+0x108>
  if(re[0] == '$' && re[1] == '\0')
     33c:	e51b3008 	ldr	r3, [fp, #-8]
     340:	e5d33000 	ldrb	r3, [r3]
     344:	e3530024 	cmp	r3, #36	@ 0x24
     348:	1a00000b 	bne	37c <matchhere+0xa8>
     34c:	e51b3008 	ldr	r3, [fp, #-8]
     350:	e2833001 	add	r3, r3, #1
     354:	e5d33000 	ldrb	r3, [r3]
     358:	e3530000 	cmp	r3, #0
     35c:	1a000006 	bne	37c <matchhere+0xa8>
    return *text == '\0';
     360:	e51b300c 	ldr	r3, [fp, #-12]
     364:	e5d33000 	ldrb	r3, [r3]
     368:	e3530000 	cmp	r3, #0
     36c:	03a03001 	moveq	r3, #1
     370:	13a03000 	movne	r3, #0
     374:	e6ef3073 	uxtb	r3, r3
     378:	ea000017 	b	3dc <matchhere+0x108>
  if(*text!='\0' && (re[0]=='.' || re[0]==*text))
     37c:	e51b300c 	ldr	r3, [fp, #-12]
     380:	e5d33000 	ldrb	r3, [r3]
     384:	e3530000 	cmp	r3, #0
     388:	0a000012 	beq	3d8 <matchhere+0x104>
     38c:	e51b3008 	ldr	r3, [fp, #-8]
     390:	e5d33000 	ldrb	r3, [r3]
     394:	e353002e 	cmp	r3, #46	@ 0x2e
     398:	0a000005 	beq	3b4 <matchhere+0xe0>
     39c:	e51b3008 	ldr	r3, [fp, #-8]
     3a0:	e5d32000 	ldrb	r2, [r3]
     3a4:	e51b300c 	ldr	r3, [fp, #-12]
     3a8:	e5d33000 	ldrb	r3, [r3]
     3ac:	e1520003 	cmp	r2, r3
     3b0:	1a000008 	bne	3d8 <matchhere+0x104>
    return matchhere(re+1, text+1);
     3b4:	e51b3008 	ldr	r3, [fp, #-8]
     3b8:	e2832001 	add	r2, r3, #1
     3bc:	e51b300c 	ldr	r3, [fp, #-12]
     3c0:	e2833001 	add	r3, r3, #1
     3c4:	e1a01003 	mov	r1, r3
     3c8:	e1a00002 	mov	r0, r2
     3cc:	ebffffc0 	bl	2d4 <matchhere>
     3d0:	e1a03000 	mov	r3, r0
     3d4:	ea000000 	b	3dc <matchhere+0x108>
  return 0;
     3d8:	e3a03000 	mov	r3, #0
}
     3dc:	e1a00003 	mov	r0, r3
     3e0:	e24bd004 	sub	sp, fp, #4
     3e4:	e8bd8800 	pop	{fp, pc}

000003e8 <matchstar>:

// matchstar: search for c*re at beginning of text
int matchstar(int c, char *re, char *text)
{
     3e8:	e92d4800 	push	{fp, lr}
     3ec:	e28db004 	add	fp, sp, #4
     3f0:	e24dd010 	sub	sp, sp, #16
     3f4:	e50b0008 	str	r0, [fp, #-8]
     3f8:	e50b100c 	str	r1, [fp, #-12]
     3fc:	e50b2010 	str	r2, [fp, #-16]
  do{  // a * matches zero or more instances
    if(matchhere(re, text))
     400:	e51b1010 	ldr	r1, [fp, #-16]
     404:	e51b000c 	ldr	r0, [fp, #-12]
     408:	ebffffb1 	bl	2d4 <matchhere>
     40c:	e1a03000 	mov	r3, r0
     410:	e3530000 	cmp	r3, #0
     414:	0a000001 	beq	420 <matchstar+0x38>
      return 1;
     418:	e3a03001 	mov	r3, #1
     41c:	ea00000f 	b	460 <matchstar+0x78>
  }while(*text!='\0' && (*text++==c || c=='.'));
     420:	e51b3010 	ldr	r3, [fp, #-16]
     424:	e5d33000 	ldrb	r3, [r3]
     428:	e3530000 	cmp	r3, #0
     42c:	0a00000a 	beq	45c <matchstar+0x74>
     430:	e51b3010 	ldr	r3, [fp, #-16]
     434:	e2832001 	add	r2, r3, #1
     438:	e50b2010 	str	r2, [fp, #-16]
     43c:	e5d33000 	ldrb	r3, [r3]
     440:	e1a02003 	mov	r2, r3
     444:	e51b3008 	ldr	r3, [fp, #-8]
     448:	e1530002 	cmp	r3, r2
     44c:	0affffeb 	beq	400 <matchstar+0x18>
     450:	e51b3008 	ldr	r3, [fp, #-8]
     454:	e353002e 	cmp	r3, #46	@ 0x2e
     458:	0affffe8 	beq	400 <matchstar+0x18>
  return 0;
     45c:	e3a03000 	mov	r3, #0
}
     460:	e1a00003 	mov	r0, r3
     464:	e24bd004 	sub	sp, fp, #4
     468:	e8bd8800 	pop	{fp, pc}

0000046c <strcpy>:
#include "user.h"
#include "arm.h"

char*
strcpy(char *s, char *t)
{
     46c:	e52db004 	push	{fp}		@ (str fp, [sp, #-4]!)
     470:	e28db000 	add	fp, sp, #0
     474:	e24dd014 	sub	sp, sp, #20
     478:	e50b0010 	str	r0, [fp, #-16]
     47c:	e50b1014 	str	r1, [fp, #-20]	@ 0xffffffec
  char *os;

  os = s;
     480:	e51b3010 	ldr	r3, [fp, #-16]
     484:	e50b3008 	str	r3, [fp, #-8]
  while((*s++ = *t++) != 0)
     488:	e320f000 	nop	{0}
     48c:	e51b2014 	ldr	r2, [fp, #-20]	@ 0xffffffec
     490:	e2823001 	add	r3, r2, #1
     494:	e50b3014 	str	r3, [fp, #-20]	@ 0xffffffec
     498:	e51b3010 	ldr	r3, [fp, #-16]
     49c:	e2831001 	add	r1, r3, #1
     4a0:	e50b1010 	str	r1, [fp, #-16]
     4a4:	e5d22000 	ldrb	r2, [r2]
     4a8:	e5c32000 	strb	r2, [r3]
     4ac:	e5d33000 	ldrb	r3, [r3]
     4b0:	e3530000 	cmp	r3, #0
     4b4:	1afffff4 	bne	48c <strcpy+0x20>
    ;
  return os;
     4b8:	e51b3008 	ldr	r3, [fp, #-8]
}
     4bc:	e1a00003 	mov	r0, r3
     4c0:	e28bd000 	add	sp, fp, #0
     4c4:	e49db004 	pop	{fp}		@ (ldr fp, [sp], #4)
     4c8:	e12fff1e 	bx	lr

000004cc <strcmp>:

int
strcmp(const char *p, const char *q)
{
     4cc:	e52db004 	push	{fp}		@ (str fp, [sp, #-4]!)
     4d0:	e28db000 	add	fp, sp, #0
     4d4:	e24dd00c 	sub	sp, sp, #12
     4d8:	e50b0008 	str	r0, [fp, #-8]
     4dc:	e50b100c 	str	r1, [fp, #-12]
  while(*p && *p == *q)
     4e0:	ea000005 	b	4fc <strcmp+0x30>
    p++, q++;
     4e4:	e51b3008 	ldr	r3, [fp, #-8]
     4e8:	e2833001 	add	r3, r3, #1
     4ec:	e50b3008 	str	r3, [fp, #-8]
     4f0:	e51b300c 	ldr	r3, [fp, #-12]
     4f4:	e2833001 	add	r3, r3, #1
     4f8:	e50b300c 	str	r3, [fp, #-12]
  while(*p && *p == *q)
     4fc:	e51b3008 	ldr	r3, [fp, #-8]
     500:	e5d33000 	ldrb	r3, [r3]
     504:	e3530000 	cmp	r3, #0
     508:	0a000005 	beq	524 <strcmp+0x58>
     50c:	e51b3008 	ldr	r3, [fp, #-8]
     510:	e5d32000 	ldrb	r2, [r3]
     514:	e51b300c 	ldr	r3, [fp, #-12]
     518:	e5d33000 	ldrb	r3, [r3]
     51c:	e1520003 	cmp	r2, r3
     520:	0affffef 	beq	4e4 <strcmp+0x18>
  return (uchar)*p - (uchar)*q;
     524:	e51b3008 	ldr	r3, [fp, #-8]
     528:	e5d33000 	ldrb	r3, [r3]
     52c:	e1a02003 	mov	r2, r3
     530:	e51b300c 	ldr	r3, [fp, #-12]
     534:	e5d33000 	ldrb	r3, [r3]
     538:	e0423003 	sub	r3, r2, r3
}
     53c:	e1a00003 	mov	r0, r3
     540:	e28bd000 	add	sp, fp, #0
     544:	e49db004 	pop	{fp}		@ (ldr fp, [sp], #4)
     548:	e12fff1e 	bx	lr

0000054c <strlen>:

uint
strlen(char *s)
{
     54c:	e52db004 	push	{fp}		@ (str fp, [sp, #-4]!)
     550:	e28db000 	add	fp, sp, #0
     554:	e24dd014 	sub	sp, sp, #20
     558:	e50b0010 	str	r0, [fp, #-16]
  int n;

  for(n = 0; s[n]; n++)
     55c:	e3a03000 	mov	r3, #0
     560:	e50b3008 	str	r3, [fp, #-8]
     564:	ea000002 	b	574 <strlen+0x28>
     568:	e51b3008 	ldr	r3, [fp, #-8]
     56c:	e2833001 	add	r3, r3, #1
     570:	e50b3008 	str	r3, [fp, #-8]
     574:	e51b3008 	ldr	r3, [fp, #-8]
     578:	e51b2010 	ldr	r2, [fp, #-16]
     57c:	e0823003 	add	r3, r2, r3
     580:	e5d33000 	ldrb	r3, [r3]
     584:	e3530000 	cmp	r3, #0
     588:	1afffff6 	bne	568 <strlen+0x1c>
    ;
  return n;
     58c:	e51b3008 	ldr	r3, [fp, #-8]
}
     590:	e1a00003 	mov	r0, r3
     594:	e28bd000 	add	sp, fp, #0
     598:	e49db004 	pop	{fp}		@ (ldr fp, [sp], #4)
     59c:	e12fff1e 	bx	lr

000005a0 <memset>:

void*
memset(void *dst, int c, uint n)
{
     5a0:	e52db004 	push	{fp}		@ (str fp, [sp, #-4]!)
     5a4:	e28db000 	add	fp, sp, #0
     5a8:	e24dd01c 	sub	sp, sp, #28
     5ac:	e50b0010 	str	r0, [fp, #-16]
     5b0:	e50b1014 	str	r1, [fp, #-20]	@ 0xffffffec
     5b4:	e50b2018 	str	r2, [fp, #-24]	@ 0xffffffe8
  char *p=dst;
     5b8:	e51b3010 	ldr	r3, [fp, #-16]
     5bc:	e50b3008 	str	r3, [fp, #-8]
  u32 rc=n;
     5c0:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
     5c4:	e50b300c 	str	r3, [fp, #-12]

  while (rc-- > 0) *p++ = c;
     5c8:	ea000005 	b	5e4 <memset+0x44>
     5cc:	e51b3008 	ldr	r3, [fp, #-8]
     5d0:	e2832001 	add	r2, r3, #1
     5d4:	e50b2008 	str	r2, [fp, #-8]
     5d8:	e51b2014 	ldr	r2, [fp, #-20]	@ 0xffffffec
     5dc:	e6ef2072 	uxtb	r2, r2
     5e0:	e5c32000 	strb	r2, [r3]
     5e4:	e51b300c 	ldr	r3, [fp, #-12]
     5e8:	e2432001 	sub	r2, r3, #1
     5ec:	e50b200c 	str	r2, [fp, #-12]
     5f0:	e3530000 	cmp	r3, #0
     5f4:	1afffff4 	bne	5cc <memset+0x2c>
  return (void *)p;
     5f8:	e51b3008 	ldr	r3, [fp, #-8]
}
     5fc:	e1a00003 	mov	r0, r3
     600:	e28bd000 	add	sp, fp, #0
     604:	e49db004 	pop	{fp}		@ (ldr fp, [sp], #4)
     608:	e12fff1e 	bx	lr

0000060c <strchr>:

char*
strchr(const char *s, char c)
{
     60c:	e52db004 	push	{fp}		@ (str fp, [sp, #-4]!)
     610:	e28db000 	add	fp, sp, #0
     614:	e24dd00c 	sub	sp, sp, #12
     618:	e50b0008 	str	r0, [fp, #-8]
     61c:	e1a03001 	mov	r3, r1
     620:	e54b3009 	strb	r3, [fp, #-9]
  for(; *s; s++)
     624:	ea000009 	b	650 <strchr+0x44>
    if(*s == c)
     628:	e51b3008 	ldr	r3, [fp, #-8]
     62c:	e5d33000 	ldrb	r3, [r3]
     630:	e55b2009 	ldrb	r2, [fp, #-9]
     634:	e1520003 	cmp	r2, r3
     638:	1a000001 	bne	644 <strchr+0x38>
      return (char*)s;
     63c:	e51b3008 	ldr	r3, [fp, #-8]
     640:	ea000007 	b	664 <strchr+0x58>
  for(; *s; s++)
     644:	e51b3008 	ldr	r3, [fp, #-8]
     648:	e2833001 	add	r3, r3, #1
     64c:	e50b3008 	str	r3, [fp, #-8]
     650:	e51b3008 	ldr	r3, [fp, #-8]
     654:	e5d33000 	ldrb	r3, [r3]
     658:	e3530000 	cmp	r3, #0
     65c:	1afffff1 	bne	628 <strchr+0x1c>
  return 0;
     660:	e3a03000 	mov	r3, #0
}
     664:	e1a00003 	mov	r0, r3
     668:	e28bd000 	add	sp, fp, #0
     66c:	e49db004 	pop	{fp}		@ (ldr fp, [sp], #4)
     670:	e12fff1e 	bx	lr

00000674 <gets>:

char*
gets(char *buf, int max)
{
     674:	e92d4800 	push	{fp, lr}
     678:	e28db004 	add	fp, sp, #4
     67c:	e24dd018 	sub	sp, sp, #24
     680:	e50b0018 	str	r0, [fp, #-24]	@ 0xffffffe8
     684:	e50b101c 	str	r1, [fp, #-28]	@ 0xffffffe4
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
     688:	e3a03000 	mov	r3, #0
     68c:	e50b3008 	str	r3, [fp, #-8]
     690:	ea000016 	b	6f0 <gets+0x7c>
    cc = read(0, &c, 1);
     694:	e24b300d 	sub	r3, fp, #13
     698:	e3a02001 	mov	r2, #1
     69c:	e1a01003 	mov	r1, r3
     6a0:	e3a00000 	mov	r0, #0
     6a4:	eb0000a8 	bl	94c <read>
     6a8:	e50b000c 	str	r0, [fp, #-12]
    if(cc < 1)
     6ac:	e51b300c 	ldr	r3, [fp, #-12]
     6b0:	e3530000 	cmp	r3, #0
     6b4:	da000013 	ble	708 <gets+0x94>
      break;
    buf[i++] = c;
     6b8:	e51b3008 	ldr	r3, [fp, #-8]
     6bc:	e2832001 	add	r2, r3, #1
     6c0:	e50b2008 	str	r2, [fp, #-8]
     6c4:	e1a02003 	mov	r2, r3
     6c8:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
     6cc:	e0833002 	add	r3, r3, r2
     6d0:	e55b200d 	ldrb	r2, [fp, #-13]
     6d4:	e5c32000 	strb	r2, [r3]
    if(c == '\n' || c == '\r')
     6d8:	e55b300d 	ldrb	r3, [fp, #-13]
     6dc:	e353000a 	cmp	r3, #10
     6e0:	0a000009 	beq	70c <gets+0x98>
     6e4:	e55b300d 	ldrb	r3, [fp, #-13]
     6e8:	e353000d 	cmp	r3, #13
     6ec:	0a000006 	beq	70c <gets+0x98>
  for(i=0; i+1 < max; ){
     6f0:	e51b3008 	ldr	r3, [fp, #-8]
     6f4:	e2833001 	add	r3, r3, #1
     6f8:	e51b201c 	ldr	r2, [fp, #-28]	@ 0xffffffe4
     6fc:	e1520003 	cmp	r2, r3
     700:	caffffe3 	bgt	694 <gets+0x20>
     704:	ea000000 	b	70c <gets+0x98>
      break;
     708:	e320f000 	nop	{0}
      break;
  }
  buf[i] = '\0';
     70c:	e51b3008 	ldr	r3, [fp, #-8]
     710:	e51b2018 	ldr	r2, [fp, #-24]	@ 0xffffffe8
     714:	e0823003 	add	r3, r2, r3
     718:	e3a02000 	mov	r2, #0
     71c:	e5c32000 	strb	r2, [r3]
  return buf;
     720:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
}
     724:	e1a00003 	mov	r0, r3
     728:	e24bd004 	sub	sp, fp, #4
     72c:	e8bd8800 	pop	{fp, pc}

00000730 <stat>:

int
stat(char *n, struct stat *st)
{
     730:	e92d4800 	push	{fp, lr}
     734:	e28db004 	add	fp, sp, #4
     738:	e24dd010 	sub	sp, sp, #16
     73c:	e50b0010 	str	r0, [fp, #-16]
     740:	e50b1014 	str	r1, [fp, #-20]	@ 0xffffffec
  int fd;
  int r;

  fd = open(n, O_RDONLY);
     744:	e3a01000 	mov	r1, #0
     748:	e51b0010 	ldr	r0, [fp, #-16]
     74c:	eb0000bf 	bl	a50 <open>
     750:	e50b0008 	str	r0, [fp, #-8]
  if(fd < 0)
     754:	e51b3008 	ldr	r3, [fp, #-8]
     758:	e3530000 	cmp	r3, #0
     75c:	aa000001 	bge	768 <stat+0x38>
    return -1;
     760:	e3e03000 	mvn	r3, #0
     764:	ea000006 	b	784 <stat+0x54>
  r = fstat(fd, st);
     768:	e51b1014 	ldr	r1, [fp, #-20]	@ 0xffffffec
     76c:	e51b0008 	ldr	r0, [fp, #-8]
     770:	eb0000dd 	bl	aec <fstat>
     774:	e50b000c 	str	r0, [fp, #-12]
  close(fd);
     778:	e51b0008 	ldr	r0, [fp, #-8]
     77c:	eb00008c 	bl	9b4 <close>
  return r;
     780:	e51b300c 	ldr	r3, [fp, #-12]
}
     784:	e1a00003 	mov	r0, r3
     788:	e24bd004 	sub	sp, fp, #4
     78c:	e8bd8800 	pop	{fp, pc}

00000790 <atoi>:

int
atoi(const char *s)
{
     790:	e52db004 	push	{fp}		@ (str fp, [sp, #-4]!)
     794:	e28db000 	add	fp, sp, #0
     798:	e24dd014 	sub	sp, sp, #20
     79c:	e50b0010 	str	r0, [fp, #-16]
  int n;

  n = 0;
     7a0:	e3a03000 	mov	r3, #0
     7a4:	e50b3008 	str	r3, [fp, #-8]
  while('0' <= *s && *s <= '9')
     7a8:	ea000009 	b	7d4 <atoi+0x44>
    n = n*10 + *s++ - '0';
     7ac:	e51b3008 	ldr	r3, [fp, #-8]
     7b0:	e3a0200a 	mov	r2, #10
     7b4:	e0020392 	mul	r2, r2, r3
     7b8:	e51b3010 	ldr	r3, [fp, #-16]
     7bc:	e2831001 	add	r1, r3, #1
     7c0:	e50b1010 	str	r1, [fp, #-16]
     7c4:	e5d33000 	ldrb	r3, [r3]
     7c8:	e0823003 	add	r3, r2, r3
     7cc:	e2433030 	sub	r3, r3, #48	@ 0x30
     7d0:	e50b3008 	str	r3, [fp, #-8]
  while('0' <= *s && *s <= '9')
     7d4:	e51b3010 	ldr	r3, [fp, #-16]
     7d8:	e5d33000 	ldrb	r3, [r3]
     7dc:	e353002f 	cmp	r3, #47	@ 0x2f
     7e0:	9a000003 	bls	7f4 <atoi+0x64>
     7e4:	e51b3010 	ldr	r3, [fp, #-16]
     7e8:	e5d33000 	ldrb	r3, [r3]
     7ec:	e3530039 	cmp	r3, #57	@ 0x39
     7f0:	9affffed 	bls	7ac <atoi+0x1c>
  return n;
     7f4:	e51b3008 	ldr	r3, [fp, #-8]
}
     7f8:	e1a00003 	mov	r0, r3
     7fc:	e28bd000 	add	sp, fp, #0
     800:	e49db004 	pop	{fp}		@ (ldr fp, [sp], #4)
     804:	e12fff1e 	bx	lr

00000808 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
     808:	e52db004 	push	{fp}		@ (str fp, [sp, #-4]!)
     80c:	e28db000 	add	fp, sp, #0
     810:	e24dd01c 	sub	sp, sp, #28
     814:	e50b0010 	str	r0, [fp, #-16]
     818:	e50b1014 	str	r1, [fp, #-20]	@ 0xffffffec
     81c:	e50b2018 	str	r2, [fp, #-24]	@ 0xffffffe8
  char *dst, *src;
  
  dst = vdst;
     820:	e51b3010 	ldr	r3, [fp, #-16]
     824:	e50b3008 	str	r3, [fp, #-8]
  src = vsrc;
     828:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
     82c:	e50b300c 	str	r3, [fp, #-12]
  while(n-- > 0)
     830:	ea000007 	b	854 <memmove+0x4c>
    *dst++ = *src++;
     834:	e51b200c 	ldr	r2, [fp, #-12]
     838:	e2823001 	add	r3, r2, #1
     83c:	e50b300c 	str	r3, [fp, #-12]
     840:	e51b3008 	ldr	r3, [fp, #-8]
     844:	e2831001 	add	r1, r3, #1
     848:	e50b1008 	str	r1, [fp, #-8]
     84c:	e5d22000 	ldrb	r2, [r2]
     850:	e5c32000 	strb	r2, [r3]
  while(n-- > 0)
     854:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
     858:	e2432001 	sub	r2, r3, #1
     85c:	e50b2018 	str	r2, [fp, #-24]	@ 0xffffffe8
     860:	e3530000 	cmp	r3, #0
     864:	cafffff2 	bgt	834 <memmove+0x2c>
  return vdst;
     868:	e51b3010 	ldr	r3, [fp, #-16]
}
     86c:	e1a00003 	mov	r0, r3
     870:	e28bd000 	add	sp, fp, #0
     874:	e49db004 	pop	{fp}		@ (ldr fp, [sp], #4)
     878:	e12fff1e 	bx	lr

0000087c <fork>:
     87c:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
     880:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
     884:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
     888:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
     88c:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
     890:	e3a00001 	mov	r0, #1
     894:	ef000040 	svc	0x00000040
     898:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     89c:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     8a0:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
     8a4:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
     8a8:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
     8ac:	e12fff1e 	bx	lr

000008b0 <exit>:
     8b0:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
     8b4:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
     8b8:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
     8bc:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
     8c0:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
     8c4:	e3a00002 	mov	r0, #2
     8c8:	ef000040 	svc	0x00000040
     8cc:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     8d0:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     8d4:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
     8d8:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
     8dc:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
     8e0:	e12fff1e 	bx	lr

000008e4 <wait>:
     8e4:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
     8e8:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
     8ec:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
     8f0:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
     8f4:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
     8f8:	e3a00003 	mov	r0, #3
     8fc:	ef000040 	svc	0x00000040
     900:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     904:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     908:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
     90c:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
     910:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
     914:	e12fff1e 	bx	lr

00000918 <pipe>:
     918:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
     91c:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
     920:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
     924:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
     928:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
     92c:	e3a00004 	mov	r0, #4
     930:	ef000040 	svc	0x00000040
     934:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     938:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     93c:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
     940:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
     944:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
     948:	e12fff1e 	bx	lr

0000094c <read>:
     94c:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
     950:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
     954:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
     958:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
     95c:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
     960:	e3a00005 	mov	r0, #5
     964:	ef000040 	svc	0x00000040
     968:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     96c:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     970:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
     974:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
     978:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
     97c:	e12fff1e 	bx	lr

00000980 <write>:
     980:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
     984:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
     988:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
     98c:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
     990:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
     994:	e3a00010 	mov	r0, #16
     998:	ef000040 	svc	0x00000040
     99c:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     9a0:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     9a4:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
     9a8:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
     9ac:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
     9b0:	e12fff1e 	bx	lr

000009b4 <close>:
     9b4:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
     9b8:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
     9bc:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
     9c0:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
     9c4:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
     9c8:	e3a00015 	mov	r0, #21
     9cc:	ef000040 	svc	0x00000040
     9d0:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     9d4:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     9d8:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
     9dc:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
     9e0:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
     9e4:	e12fff1e 	bx	lr

000009e8 <kill>:
     9e8:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
     9ec:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
     9f0:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
     9f4:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
     9f8:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
     9fc:	e3a00006 	mov	r0, #6
     a00:	ef000040 	svc	0x00000040
     a04:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     a08:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     a0c:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
     a10:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
     a14:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
     a18:	e12fff1e 	bx	lr

00000a1c <exec>:
     a1c:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
     a20:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
     a24:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
     a28:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
     a2c:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
     a30:	e3a00007 	mov	r0, #7
     a34:	ef000040 	svc	0x00000040
     a38:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     a3c:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     a40:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
     a44:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
     a48:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
     a4c:	e12fff1e 	bx	lr

00000a50 <open>:
     a50:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
     a54:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
     a58:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
     a5c:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
     a60:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
     a64:	e3a0000f 	mov	r0, #15
     a68:	ef000040 	svc	0x00000040
     a6c:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     a70:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     a74:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
     a78:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
     a7c:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
     a80:	e12fff1e 	bx	lr

00000a84 <mknod>:
     a84:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
     a88:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
     a8c:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
     a90:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
     a94:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
     a98:	e3a00011 	mov	r0, #17
     a9c:	ef000040 	svc	0x00000040
     aa0:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     aa4:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     aa8:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
     aac:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
     ab0:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
     ab4:	e12fff1e 	bx	lr

00000ab8 <unlink>:
     ab8:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
     abc:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
     ac0:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
     ac4:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
     ac8:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
     acc:	e3a00012 	mov	r0, #18
     ad0:	ef000040 	svc	0x00000040
     ad4:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     ad8:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     adc:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
     ae0:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
     ae4:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
     ae8:	e12fff1e 	bx	lr

00000aec <fstat>:
     aec:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
     af0:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
     af4:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
     af8:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
     afc:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
     b00:	e3a00008 	mov	r0, #8
     b04:	ef000040 	svc	0x00000040
     b08:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     b0c:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     b10:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
     b14:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
     b18:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
     b1c:	e12fff1e 	bx	lr

00000b20 <link>:
     b20:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
     b24:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
     b28:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
     b2c:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
     b30:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
     b34:	e3a00013 	mov	r0, #19
     b38:	ef000040 	svc	0x00000040
     b3c:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     b40:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     b44:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
     b48:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
     b4c:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
     b50:	e12fff1e 	bx	lr

00000b54 <mkdir>:
     b54:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
     b58:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
     b5c:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
     b60:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
     b64:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
     b68:	e3a00014 	mov	r0, #20
     b6c:	ef000040 	svc	0x00000040
     b70:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     b74:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     b78:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
     b7c:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
     b80:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
     b84:	e12fff1e 	bx	lr

00000b88 <chdir>:
     b88:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
     b8c:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
     b90:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
     b94:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
     b98:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
     b9c:	e3a00009 	mov	r0, #9
     ba0:	ef000040 	svc	0x00000040
     ba4:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     ba8:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     bac:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
     bb0:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
     bb4:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
     bb8:	e12fff1e 	bx	lr

00000bbc <dup>:
     bbc:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
     bc0:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
     bc4:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
     bc8:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
     bcc:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
     bd0:	e3a0000a 	mov	r0, #10
     bd4:	ef000040 	svc	0x00000040
     bd8:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     bdc:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     be0:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
     be4:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
     be8:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
     bec:	e12fff1e 	bx	lr

00000bf0 <getpid>:
     bf0:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
     bf4:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
     bf8:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
     bfc:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
     c00:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
     c04:	e3a0000b 	mov	r0, #11
     c08:	ef000040 	svc	0x00000040
     c0c:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     c10:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     c14:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
     c18:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
     c1c:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
     c20:	e12fff1e 	bx	lr

00000c24 <sbrk>:
     c24:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
     c28:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
     c2c:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
     c30:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
     c34:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
     c38:	e3a0000c 	mov	r0, #12
     c3c:	ef000040 	svc	0x00000040
     c40:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     c44:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     c48:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
     c4c:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
     c50:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
     c54:	e12fff1e 	bx	lr

00000c58 <sleep>:
     c58:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
     c5c:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
     c60:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
     c64:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
     c68:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
     c6c:	e3a0000d 	mov	r0, #13
     c70:	ef000040 	svc	0x00000040
     c74:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     c78:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     c7c:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
     c80:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
     c84:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
     c88:	e12fff1e 	bx	lr

00000c8c <uptime>:
     c8c:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
     c90:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
     c94:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
     c98:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
     c9c:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
     ca0:	e3a0000e 	mov	r0, #14
     ca4:	ef000040 	svc	0x00000040
     ca8:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     cac:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     cb0:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
     cb4:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
     cb8:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
     cbc:	e12fff1e 	bx	lr

00000cc0 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
     cc0:	e92d4800 	push	{fp, lr}
     cc4:	e28db004 	add	fp, sp, #4
     cc8:	e24dd008 	sub	sp, sp, #8
     ccc:	e50b0008 	str	r0, [fp, #-8]
     cd0:	e1a03001 	mov	r3, r1
     cd4:	e54b3009 	strb	r3, [fp, #-9]
  write(fd, &c, 1);
     cd8:	e24b3009 	sub	r3, fp, #9
     cdc:	e3a02001 	mov	r2, #1
     ce0:	e1a01003 	mov	r1, r3
     ce4:	e51b0008 	ldr	r0, [fp, #-8]
     ce8:	ebffff24 	bl	980 <write>
}
     cec:	e320f000 	nop	{0}
     cf0:	e24bd004 	sub	sp, fp, #4
     cf4:	e8bd8800 	pop	{fp, pc}

00000cf8 <div>:

u32 div(u32 n, u32 d)  // long division
{
     cf8:	e52db004 	push	{fp}		@ (str fp, [sp, #-4]!)
     cfc:	e28db000 	add	fp, sp, #0
     d00:	e24dd01c 	sub	sp, sp, #28
     d04:	e50b0018 	str	r0, [fp, #-24]	@ 0xffffffe8
     d08:	e50b101c 	str	r1, [fp, #-28]	@ 0xffffffe4
    u32 q=0, r=0;
     d0c:	e3a03000 	mov	r3, #0
     d10:	e50b3008 	str	r3, [fp, #-8]
     d14:	e3a03000 	mov	r3, #0
     d18:	e50b300c 	str	r3, [fp, #-12]
    int i;

    for(i=31;i>=0;i--){
     d1c:	e3a0301f 	mov	r3, #31
     d20:	e50b3010 	str	r3, [fp, #-16]
     d24:	ea00001b 	b	d98 <div+0xa0>
        r = r << 1;
     d28:	e51b300c 	ldr	r3, [fp, #-12]
     d2c:	e1a03083 	lsl	r3, r3, #1
     d30:	e50b300c 	str	r3, [fp, #-12]
        r = r | ((n >> i) & 1);
     d34:	e51b2018 	ldr	r2, [fp, #-24]	@ 0xffffffe8
     d38:	e51b3010 	ldr	r3, [fp, #-16]
     d3c:	e1a03332 	lsr	r3, r2, r3
     d40:	e2033001 	and	r3, r3, #1
     d44:	e51b200c 	ldr	r2, [fp, #-12]
     d48:	e1823003 	orr	r3, r2, r3
     d4c:	e50b300c 	str	r3, [fp, #-12]
        if(r >= d) {
     d50:	e51b200c 	ldr	r2, [fp, #-12]
     d54:	e51b301c 	ldr	r3, [fp, #-28]	@ 0xffffffe4
     d58:	e1520003 	cmp	r2, r3
     d5c:	3a00000a 	bcc	d8c <div+0x94>
            r = r - d;
     d60:	e51b200c 	ldr	r2, [fp, #-12]
     d64:	e51b301c 	ldr	r3, [fp, #-28]	@ 0xffffffe4
     d68:	e0423003 	sub	r3, r2, r3
     d6c:	e50b300c 	str	r3, [fp, #-12]
            q = q | (1 << i);
     d70:	e3a02001 	mov	r2, #1
     d74:	e51b3010 	ldr	r3, [fp, #-16]
     d78:	e1a03312 	lsl	r3, r2, r3
     d7c:	e1a02003 	mov	r2, r3
     d80:	e51b3008 	ldr	r3, [fp, #-8]
     d84:	e1833002 	orr	r3, r3, r2
     d88:	e50b3008 	str	r3, [fp, #-8]
    for(i=31;i>=0;i--){
     d8c:	e51b3010 	ldr	r3, [fp, #-16]
     d90:	e2433001 	sub	r3, r3, #1
     d94:	e50b3010 	str	r3, [fp, #-16]
     d98:	e51b3010 	ldr	r3, [fp, #-16]
     d9c:	e3530000 	cmp	r3, #0
     da0:	aaffffe0 	bge	d28 <div+0x30>
        }
    }
    return q;
     da4:	e51b3008 	ldr	r3, [fp, #-8]
}
     da8:	e1a00003 	mov	r0, r3
     dac:	e28bd000 	add	sp, fp, #0
     db0:	e49db004 	pop	{fp}		@ (ldr fp, [sp], #4)
     db4:	e12fff1e 	bx	lr

00000db8 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
     db8:	e92d4800 	push	{fp, lr}
     dbc:	e28db004 	add	fp, sp, #4
     dc0:	e24dd038 	sub	sp, sp, #56	@ 0x38
     dc4:	e50b0030 	str	r0, [fp, #-48]	@ 0xffffffd0
     dc8:	e50b1034 	str	r1, [fp, #-52]	@ 0xffffffcc
     dcc:	e50b2038 	str	r2, [fp, #-56]	@ 0xffffffc8
     dd0:	e50b303c 	str	r3, [fp, #-60]	@ 0xffffffc4
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x, y, b;

  neg = 0;
     dd4:	e3a03000 	mov	r3, #0
     dd8:	e50b300c 	str	r3, [fp, #-12]
  if(sgn && xx < 0){
     ddc:	e51b303c 	ldr	r3, [fp, #-60]	@ 0xffffffc4
     de0:	e3530000 	cmp	r3, #0
     de4:	0a000008 	beq	e0c <printint+0x54>
     de8:	e51b3034 	ldr	r3, [fp, #-52]	@ 0xffffffcc
     dec:	e3530000 	cmp	r3, #0
     df0:	aa000005 	bge	e0c <printint+0x54>
    neg = 1;
     df4:	e3a03001 	mov	r3, #1
     df8:	e50b300c 	str	r3, [fp, #-12]
    x = -xx;
     dfc:	e51b3034 	ldr	r3, [fp, #-52]	@ 0xffffffcc
     e00:	e2633000 	rsb	r3, r3, #0
     e04:	e50b3010 	str	r3, [fp, #-16]
     e08:	ea000001 	b	e14 <printint+0x5c>
  } else {
    x = xx;
     e0c:	e51b3034 	ldr	r3, [fp, #-52]	@ 0xffffffcc
     e10:	e50b3010 	str	r3, [fp, #-16]
  }

  b = base;
     e14:	e51b3038 	ldr	r3, [fp, #-56]	@ 0xffffffc8
     e18:	e50b3014 	str	r3, [fp, #-20]	@ 0xffffffec
  i = 0;
     e1c:	e3a03000 	mov	r3, #0
     e20:	e50b3008 	str	r3, [fp, #-8]
  do{
    y = div(x, b);
     e24:	e51b1014 	ldr	r1, [fp, #-20]	@ 0xffffffec
     e28:	e51b0010 	ldr	r0, [fp, #-16]
     e2c:	ebffffb1 	bl	cf8 <div>
     e30:	e50b0018 	str	r0, [fp, #-24]	@ 0xffffffe8
    buf[i++] = digits[x - y * b];
     e34:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
     e38:	e51b2014 	ldr	r2, [fp, #-20]	@ 0xffffffec
     e3c:	e0030392 	mul	r3, r2, r3
     e40:	e51b2010 	ldr	r2, [fp, #-16]
     e44:	e0421003 	sub	r1, r2, r3
     e48:	e51b2008 	ldr	r2, [fp, #-8]
     e4c:	e2823001 	add	r3, r2, #1
     e50:	e50b3008 	str	r3, [fp, #-8]
     e54:	e30134f4 	movw	r3, #5364	@ 0x14f4
     e58:	e3403000 	movt	r3, #0
     e5c:	e7d31001 	ldrb	r1, [r3, r1]
     e60:	e2423004 	sub	r3, r2, #4
     e64:	e083300b 	add	r3, r3, fp
     e68:	e1a02001 	mov	r2, r1
     e6c:	e5432024 	strb	r2, [r3, #-36]	@ 0xffffffdc
  }while((x = y) != 0);
     e70:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
     e74:	e50b3010 	str	r3, [fp, #-16]
     e78:	e51b3010 	ldr	r3, [fp, #-16]
     e7c:	e3530000 	cmp	r3, #0
     e80:	1affffe7 	bne	e24 <printint+0x6c>
  if(neg)
     e84:	e51b300c 	ldr	r3, [fp, #-12]
     e88:	e3530000 	cmp	r3, #0
     e8c:	0a00000e 	beq	ecc <printint+0x114>
    buf[i++] = '-';
     e90:	e51b3008 	ldr	r3, [fp, #-8]
     e94:	e2832001 	add	r2, r3, #1
     e98:	e50b2008 	str	r2, [fp, #-8]
     e9c:	e2433004 	sub	r3, r3, #4
     ea0:	e083300b 	add	r3, r3, fp
     ea4:	e3a0202d 	mov	r2, #45	@ 0x2d
     ea8:	e5432024 	strb	r2, [r3, #-36]	@ 0xffffffdc

  while(--i >= 0)
     eac:	ea000006 	b	ecc <printint+0x114>
    putc(fd, buf[i]);
     eb0:	e24b2028 	sub	r2, fp, #40	@ 0x28
     eb4:	e51b3008 	ldr	r3, [fp, #-8]
     eb8:	e0823003 	add	r3, r2, r3
     ebc:	e5d33000 	ldrb	r3, [r3]
     ec0:	e1a01003 	mov	r1, r3
     ec4:	e51b0030 	ldr	r0, [fp, #-48]	@ 0xffffffd0
     ec8:	ebffff7c 	bl	cc0 <putc>
  while(--i >= 0)
     ecc:	e51b3008 	ldr	r3, [fp, #-8]
     ed0:	e2433001 	sub	r3, r3, #1
     ed4:	e50b3008 	str	r3, [fp, #-8]
     ed8:	e51b3008 	ldr	r3, [fp, #-8]
     edc:	e3530000 	cmp	r3, #0
     ee0:	aafffff2 	bge	eb0 <printint+0xf8>
}
     ee4:	e320f000 	nop	{0}
     ee8:	e320f000 	nop	{0}
     eec:	e24bd004 	sub	sp, fp, #4
     ef0:	e8bd8800 	pop	{fp, pc}

00000ef4 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
     ef4:	e92d000e 	push	{r1, r2, r3}
     ef8:	e92d4800 	push	{fp, lr}
     efc:	e28db004 	add	fp, sp, #4
     f00:	e24dd024 	sub	sp, sp, #36	@ 0x24
     f04:	e50b0024 	str	r0, [fp, #-36]	@ 0xffffffdc
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
     f08:	e3a03000 	mov	r3, #0
     f0c:	e50b3014 	str	r3, [fp, #-20]	@ 0xffffffec
  ap = (uint*)(void*)&fmt + 1;
     f10:	e28b3008 	add	r3, fp, #8
     f14:	e50b3018 	str	r3, [fp, #-24]	@ 0xffffffe8
  for(i = 0; fmt[i]; i++){
     f18:	e3a03000 	mov	r3, #0
     f1c:	e50b3010 	str	r3, [fp, #-16]
     f20:	ea000075 	b	10fc <printf+0x208>
    c = fmt[i] & 0xff;
     f24:	e59b2004 	ldr	r2, [fp, #4]
     f28:	e51b3010 	ldr	r3, [fp, #-16]
     f2c:	e0823003 	add	r3, r2, r3
     f30:	e5d33000 	ldrb	r3, [r3]
     f34:	e50b301c 	str	r3, [fp, #-28]	@ 0xffffffe4
    if(state == 0){
     f38:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
     f3c:	e3530000 	cmp	r3, #0
     f40:	1a00000b 	bne	f74 <printf+0x80>
      if(c == '%'){
     f44:	e51b301c 	ldr	r3, [fp, #-28]	@ 0xffffffe4
     f48:	e3530025 	cmp	r3, #37	@ 0x25
     f4c:	1a000002 	bne	f5c <printf+0x68>
        state = '%';
     f50:	e3a03025 	mov	r3, #37	@ 0x25
     f54:	e50b3014 	str	r3, [fp, #-20]	@ 0xffffffec
     f58:	ea000064 	b	10f0 <printf+0x1fc>
      } else {
        putc(fd, c);
     f5c:	e51b301c 	ldr	r3, [fp, #-28]	@ 0xffffffe4
     f60:	e6ef3073 	uxtb	r3, r3
     f64:	e1a01003 	mov	r1, r3
     f68:	e51b0024 	ldr	r0, [fp, #-36]	@ 0xffffffdc
     f6c:	ebffff53 	bl	cc0 <putc>
     f70:	ea00005e 	b	10f0 <printf+0x1fc>
      }
    } else if(state == '%'){
     f74:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
     f78:	e3530025 	cmp	r3, #37	@ 0x25
     f7c:	1a00005b 	bne	10f0 <printf+0x1fc>
      if(c == 'd'){
     f80:	e51b301c 	ldr	r3, [fp, #-28]	@ 0xffffffe4
     f84:	e3530064 	cmp	r3, #100	@ 0x64
     f88:	1a00000a 	bne	fb8 <printf+0xc4>
        printint(fd, *ap, 10, 1);
     f8c:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
     f90:	e5933000 	ldr	r3, [r3]
     f94:	e1a01003 	mov	r1, r3
     f98:	e3a03001 	mov	r3, #1
     f9c:	e3a0200a 	mov	r2, #10
     fa0:	e51b0024 	ldr	r0, [fp, #-36]	@ 0xffffffdc
     fa4:	ebffff83 	bl	db8 <printint>
        ap++;
     fa8:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
     fac:	e2833004 	add	r3, r3, #4
     fb0:	e50b3018 	str	r3, [fp, #-24]	@ 0xffffffe8
     fb4:	ea00004b 	b	10e8 <printf+0x1f4>
      } else if(c == 'x' || c == 'p'){
     fb8:	e51b301c 	ldr	r3, [fp, #-28]	@ 0xffffffe4
     fbc:	e3530078 	cmp	r3, #120	@ 0x78
     fc0:	0a000002 	beq	fd0 <printf+0xdc>
     fc4:	e51b301c 	ldr	r3, [fp, #-28]	@ 0xffffffe4
     fc8:	e3530070 	cmp	r3, #112	@ 0x70
     fcc:	1a00000a 	bne	ffc <printf+0x108>
        printint(fd, *ap, 16, 0);
     fd0:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
     fd4:	e5933000 	ldr	r3, [r3]
     fd8:	e1a01003 	mov	r1, r3
     fdc:	e3a03000 	mov	r3, #0
     fe0:	e3a02010 	mov	r2, #16
     fe4:	e51b0024 	ldr	r0, [fp, #-36]	@ 0xffffffdc
     fe8:	ebffff72 	bl	db8 <printint>
        ap++;
     fec:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
     ff0:	e2833004 	add	r3, r3, #4
     ff4:	e50b3018 	str	r3, [fp, #-24]	@ 0xffffffe8
     ff8:	ea00003a 	b	10e8 <printf+0x1f4>
      } else if(c == 's'){
     ffc:	e51b301c 	ldr	r3, [fp, #-28]	@ 0xffffffe4
    1000:	e3530073 	cmp	r3, #115	@ 0x73
    1004:	1a000019 	bne	1070 <printf+0x17c>
        s = (char*)*ap;
    1008:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
    100c:	e5933000 	ldr	r3, [r3]
    1010:	e50b300c 	str	r3, [fp, #-12]
        ap++;
    1014:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
    1018:	e2833004 	add	r3, r3, #4
    101c:	e50b3018 	str	r3, [fp, #-24]	@ 0xffffffe8
        if(s == 0)
    1020:	e51b300c 	ldr	r3, [fp, #-12]
    1024:	e3530000 	cmp	r3, #0
    1028:	1a00000b 	bne	105c <printf+0x168>
          s = "(null)";
    102c:	e30134ec 	movw	r3, #5356	@ 0x14ec
    1030:	e3403000 	movt	r3, #0
    1034:	e50b300c 	str	r3, [fp, #-12]
        while(*s != 0){
    1038:	ea000007 	b	105c <printf+0x168>
          putc(fd, *s);
    103c:	e51b300c 	ldr	r3, [fp, #-12]
    1040:	e5d33000 	ldrb	r3, [r3]
    1044:	e1a01003 	mov	r1, r3
    1048:	e51b0024 	ldr	r0, [fp, #-36]	@ 0xffffffdc
    104c:	ebffff1b 	bl	cc0 <putc>
          s++;
    1050:	e51b300c 	ldr	r3, [fp, #-12]
    1054:	e2833001 	add	r3, r3, #1
    1058:	e50b300c 	str	r3, [fp, #-12]
        while(*s != 0){
    105c:	e51b300c 	ldr	r3, [fp, #-12]
    1060:	e5d33000 	ldrb	r3, [r3]
    1064:	e3530000 	cmp	r3, #0
    1068:	1afffff3 	bne	103c <printf+0x148>
    106c:	ea00001d 	b	10e8 <printf+0x1f4>
        }
      } else if(c == 'c'){
    1070:	e51b301c 	ldr	r3, [fp, #-28]	@ 0xffffffe4
    1074:	e3530063 	cmp	r3, #99	@ 0x63
    1078:	1a000009 	bne	10a4 <printf+0x1b0>
        putc(fd, *ap);
    107c:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
    1080:	e5933000 	ldr	r3, [r3]
    1084:	e6ef3073 	uxtb	r3, r3
    1088:	e1a01003 	mov	r1, r3
    108c:	e51b0024 	ldr	r0, [fp, #-36]	@ 0xffffffdc
    1090:	ebffff0a 	bl	cc0 <putc>
        ap++;
    1094:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
    1098:	e2833004 	add	r3, r3, #4
    109c:	e50b3018 	str	r3, [fp, #-24]	@ 0xffffffe8
    10a0:	ea000010 	b	10e8 <printf+0x1f4>
      } else if(c == '%'){
    10a4:	e51b301c 	ldr	r3, [fp, #-28]	@ 0xffffffe4
    10a8:	e3530025 	cmp	r3, #37	@ 0x25
    10ac:	1a000005 	bne	10c8 <printf+0x1d4>
        putc(fd, c);
    10b0:	e51b301c 	ldr	r3, [fp, #-28]	@ 0xffffffe4
    10b4:	e6ef3073 	uxtb	r3, r3
    10b8:	e1a01003 	mov	r1, r3
    10bc:	e51b0024 	ldr	r0, [fp, #-36]	@ 0xffffffdc
    10c0:	ebfffefe 	bl	cc0 <putc>
    10c4:	ea000007 	b	10e8 <printf+0x1f4>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
    10c8:	e3a01025 	mov	r1, #37	@ 0x25
    10cc:	e51b0024 	ldr	r0, [fp, #-36]	@ 0xffffffdc
    10d0:	ebfffefa 	bl	cc0 <putc>
        putc(fd, c);
    10d4:	e51b301c 	ldr	r3, [fp, #-28]	@ 0xffffffe4
    10d8:	e6ef3073 	uxtb	r3, r3
    10dc:	e1a01003 	mov	r1, r3
    10e0:	e51b0024 	ldr	r0, [fp, #-36]	@ 0xffffffdc
    10e4:	ebfffef5 	bl	cc0 <putc>
      }
      state = 0;
    10e8:	e3a03000 	mov	r3, #0
    10ec:	e50b3014 	str	r3, [fp, #-20]	@ 0xffffffec
  for(i = 0; fmt[i]; i++){
    10f0:	e51b3010 	ldr	r3, [fp, #-16]
    10f4:	e2833001 	add	r3, r3, #1
    10f8:	e50b3010 	str	r3, [fp, #-16]
    10fc:	e59b2004 	ldr	r2, [fp, #4]
    1100:	e51b3010 	ldr	r3, [fp, #-16]
    1104:	e0823003 	add	r3, r2, r3
    1108:	e5d33000 	ldrb	r3, [r3]
    110c:	e3530000 	cmp	r3, #0
    1110:	1affff83 	bne	f24 <printf+0x30>
    }
  }
}
    1114:	e320f000 	nop	{0}
    1118:	e320f000 	nop	{0}
    111c:	e24bd004 	sub	sp, fp, #4
    1120:	e8bd4800 	pop	{fp, lr}
    1124:	e28dd00c 	add	sp, sp, #12
    1128:	e12fff1e 	bx	lr

0000112c <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    112c:	e52db004 	push	{fp}		@ (str fp, [sp, #-4]!)
    1130:	e28db000 	add	fp, sp, #0
    1134:	e24dd014 	sub	sp, sp, #20
    1138:	e50b0010 	str	r0, [fp, #-16]
  Header *bp, *p;

  bp = (Header*)ap - 1;
    113c:	e51b3010 	ldr	r3, [fp, #-16]
    1140:	e2433008 	sub	r3, r3, #8
    1144:	e50b300c 	str	r3, [fp, #-12]
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1148:	e3013910 	movw	r3, #6416	@ 0x1910
    114c:	e3403000 	movt	r3, #0
    1150:	e5933000 	ldr	r3, [r3]
    1154:	e50b3008 	str	r3, [fp, #-8]
    1158:	ea000010 	b	11a0 <free+0x74>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    115c:	e51b3008 	ldr	r3, [fp, #-8]
    1160:	e5933000 	ldr	r3, [r3]
    1164:	e51b2008 	ldr	r2, [fp, #-8]
    1168:	e1520003 	cmp	r2, r3
    116c:	3a000008 	bcc	1194 <free+0x68>
    1170:	e51b200c 	ldr	r2, [fp, #-12]
    1174:	e51b3008 	ldr	r3, [fp, #-8]
    1178:	e1520003 	cmp	r2, r3
    117c:	8a000010 	bhi	11c4 <free+0x98>
    1180:	e51b3008 	ldr	r3, [fp, #-8]
    1184:	e5933000 	ldr	r3, [r3]
    1188:	e51b200c 	ldr	r2, [fp, #-12]
    118c:	e1520003 	cmp	r2, r3
    1190:	3a00000b 	bcc	11c4 <free+0x98>
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1194:	e51b3008 	ldr	r3, [fp, #-8]
    1198:	e5933000 	ldr	r3, [r3]
    119c:	e50b3008 	str	r3, [fp, #-8]
    11a0:	e51b200c 	ldr	r2, [fp, #-12]
    11a4:	e51b3008 	ldr	r3, [fp, #-8]
    11a8:	e1520003 	cmp	r2, r3
    11ac:	9affffea 	bls	115c <free+0x30>
    11b0:	e51b3008 	ldr	r3, [fp, #-8]
    11b4:	e5933000 	ldr	r3, [r3]
    11b8:	e51b200c 	ldr	r2, [fp, #-12]
    11bc:	e1520003 	cmp	r2, r3
    11c0:	2affffe5 	bcs	115c <free+0x30>
      break;
  if(bp + bp->s.size == p->s.ptr){
    11c4:	e51b300c 	ldr	r3, [fp, #-12]
    11c8:	e5933004 	ldr	r3, [r3, #4]
    11cc:	e1a03183 	lsl	r3, r3, #3
    11d0:	e51b200c 	ldr	r2, [fp, #-12]
    11d4:	e0822003 	add	r2, r2, r3
    11d8:	e51b3008 	ldr	r3, [fp, #-8]
    11dc:	e5933000 	ldr	r3, [r3]
    11e0:	e1520003 	cmp	r2, r3
    11e4:	1a00000d 	bne	1220 <free+0xf4>
    bp->s.size += p->s.ptr->s.size;
    11e8:	e51b300c 	ldr	r3, [fp, #-12]
    11ec:	e5932004 	ldr	r2, [r3, #4]
    11f0:	e51b3008 	ldr	r3, [fp, #-8]
    11f4:	e5933000 	ldr	r3, [r3]
    11f8:	e5933004 	ldr	r3, [r3, #4]
    11fc:	e0822003 	add	r2, r2, r3
    1200:	e51b300c 	ldr	r3, [fp, #-12]
    1204:	e5832004 	str	r2, [r3, #4]
    bp->s.ptr = p->s.ptr->s.ptr;
    1208:	e51b3008 	ldr	r3, [fp, #-8]
    120c:	e5933000 	ldr	r3, [r3]
    1210:	e5932000 	ldr	r2, [r3]
    1214:	e51b300c 	ldr	r3, [fp, #-12]
    1218:	e5832000 	str	r2, [r3]
    121c:	ea000003 	b	1230 <free+0x104>
  } else
    bp->s.ptr = p->s.ptr;
    1220:	e51b3008 	ldr	r3, [fp, #-8]
    1224:	e5932000 	ldr	r2, [r3]
    1228:	e51b300c 	ldr	r3, [fp, #-12]
    122c:	e5832000 	str	r2, [r3]
  if(p + p->s.size == bp){
    1230:	e51b3008 	ldr	r3, [fp, #-8]
    1234:	e5933004 	ldr	r3, [r3, #4]
    1238:	e1a03183 	lsl	r3, r3, #3
    123c:	e51b2008 	ldr	r2, [fp, #-8]
    1240:	e0823003 	add	r3, r2, r3
    1244:	e51b200c 	ldr	r2, [fp, #-12]
    1248:	e1520003 	cmp	r2, r3
    124c:	1a00000b 	bne	1280 <free+0x154>
    p->s.size += bp->s.size;
    1250:	e51b3008 	ldr	r3, [fp, #-8]
    1254:	e5932004 	ldr	r2, [r3, #4]
    1258:	e51b300c 	ldr	r3, [fp, #-12]
    125c:	e5933004 	ldr	r3, [r3, #4]
    1260:	e0822003 	add	r2, r2, r3
    1264:	e51b3008 	ldr	r3, [fp, #-8]
    1268:	e5832004 	str	r2, [r3, #4]
    p->s.ptr = bp->s.ptr;
    126c:	e51b300c 	ldr	r3, [fp, #-12]
    1270:	e5932000 	ldr	r2, [r3]
    1274:	e51b3008 	ldr	r3, [fp, #-8]
    1278:	e5832000 	str	r2, [r3]
    127c:	ea000002 	b	128c <free+0x160>
  } else
    p->s.ptr = bp;
    1280:	e51b3008 	ldr	r3, [fp, #-8]
    1284:	e51b200c 	ldr	r2, [fp, #-12]
    1288:	e5832000 	str	r2, [r3]
  freep = p;
    128c:	e3013910 	movw	r3, #6416	@ 0x1910
    1290:	e3403000 	movt	r3, #0
    1294:	e51b2008 	ldr	r2, [fp, #-8]
    1298:	e5832000 	str	r2, [r3]
}
    129c:	e320f000 	nop	{0}
    12a0:	e28bd000 	add	sp, fp, #0
    12a4:	e49db004 	pop	{fp}		@ (ldr fp, [sp], #4)
    12a8:	e12fff1e 	bx	lr

000012ac <morecore>:

static Header*
morecore(uint nu)
{
    12ac:	e92d4800 	push	{fp, lr}
    12b0:	e28db004 	add	fp, sp, #4
    12b4:	e24dd010 	sub	sp, sp, #16
    12b8:	e50b0010 	str	r0, [fp, #-16]
  char *p;
  Header *hp;

  if(nu < 4096)
    12bc:	e51b3010 	ldr	r3, [fp, #-16]
    12c0:	e3530a01 	cmp	r3, #4096	@ 0x1000
    12c4:	2a000001 	bcs	12d0 <morecore+0x24>
    nu = 4096;
    12c8:	e3a03a01 	mov	r3, #4096	@ 0x1000
    12cc:	e50b3010 	str	r3, [fp, #-16]
  p = sbrk(nu * sizeof(Header));
    12d0:	e51b3010 	ldr	r3, [fp, #-16]
    12d4:	e1a03183 	lsl	r3, r3, #3
    12d8:	e1a00003 	mov	r0, r3
    12dc:	ebfffe50 	bl	c24 <sbrk>
    12e0:	e50b0008 	str	r0, [fp, #-8]
  if(p == (char*)-1)
    12e4:	e51b3008 	ldr	r3, [fp, #-8]
    12e8:	e3730001 	cmn	r3, #1
    12ec:	1a000001 	bne	12f8 <morecore+0x4c>
    return 0;
    12f0:	e3a03000 	mov	r3, #0
    12f4:	ea00000b 	b	1328 <morecore+0x7c>
  hp = (Header*)p;
    12f8:	e51b3008 	ldr	r3, [fp, #-8]
    12fc:	e50b300c 	str	r3, [fp, #-12]
  hp->s.size = nu;
    1300:	e51b300c 	ldr	r3, [fp, #-12]
    1304:	e51b2010 	ldr	r2, [fp, #-16]
    1308:	e5832004 	str	r2, [r3, #4]
  free((void*)(hp + 1));
    130c:	e51b300c 	ldr	r3, [fp, #-12]
    1310:	e2833008 	add	r3, r3, #8
    1314:	e1a00003 	mov	r0, r3
    1318:	ebffff83 	bl	112c <free>
  return freep;
    131c:	e3013910 	movw	r3, #6416	@ 0x1910
    1320:	e3403000 	movt	r3, #0
    1324:	e5933000 	ldr	r3, [r3]
}
    1328:	e1a00003 	mov	r0, r3
    132c:	e24bd004 	sub	sp, fp, #4
    1330:	e8bd8800 	pop	{fp, pc}

00001334 <malloc>:

void*
malloc(uint nbytes)
{
    1334:	e92d4800 	push	{fp, lr}
    1338:	e28db004 	add	fp, sp, #4
    133c:	e24dd018 	sub	sp, sp, #24
    1340:	e50b0018 	str	r0, [fp, #-24]	@ 0xffffffe8
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1344:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
    1348:	e2833007 	add	r3, r3, #7
    134c:	e1a031a3 	lsr	r3, r3, #3
    1350:	e2833001 	add	r3, r3, #1
    1354:	e50b3010 	str	r3, [fp, #-16]
  if((prevp = freep) == 0){
    1358:	e3013910 	movw	r3, #6416	@ 0x1910
    135c:	e3403000 	movt	r3, #0
    1360:	e5933000 	ldr	r3, [r3]
    1364:	e50b300c 	str	r3, [fp, #-12]
    1368:	e51b300c 	ldr	r3, [fp, #-12]
    136c:	e3530000 	cmp	r3, #0
    1370:	1a000010 	bne	13b8 <malloc+0x84>
    base.s.ptr = freep = prevp = &base;
    1374:	e3013908 	movw	r3, #6408	@ 0x1908
    1378:	e3403000 	movt	r3, #0
    137c:	e50b300c 	str	r3, [fp, #-12]
    1380:	e3013910 	movw	r3, #6416	@ 0x1910
    1384:	e3403000 	movt	r3, #0
    1388:	e51b200c 	ldr	r2, [fp, #-12]
    138c:	e5832000 	str	r2, [r3]
    1390:	e3013910 	movw	r3, #6416	@ 0x1910
    1394:	e3403000 	movt	r3, #0
    1398:	e5932000 	ldr	r2, [r3]
    139c:	e3013908 	movw	r3, #6408	@ 0x1908
    13a0:	e3403000 	movt	r3, #0
    13a4:	e5832000 	str	r2, [r3]
    base.s.size = 0;
    13a8:	e3013908 	movw	r3, #6408	@ 0x1908
    13ac:	e3403000 	movt	r3, #0
    13b0:	e3a02000 	mov	r2, #0
    13b4:	e5832004 	str	r2, [r3, #4]
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    13b8:	e51b300c 	ldr	r3, [fp, #-12]
    13bc:	e5933000 	ldr	r3, [r3]
    13c0:	e50b3008 	str	r3, [fp, #-8]
    if(p->s.size >= nunits){
    13c4:	e51b3008 	ldr	r3, [fp, #-8]
    13c8:	e5933004 	ldr	r3, [r3, #4]
    13cc:	e51b2010 	ldr	r2, [fp, #-16]
    13d0:	e1520003 	cmp	r2, r3
    13d4:	8a00001f 	bhi	1458 <malloc+0x124>
      if(p->s.size == nunits)
    13d8:	e51b3008 	ldr	r3, [fp, #-8]
    13dc:	e5933004 	ldr	r3, [r3, #4]
    13e0:	e51b2010 	ldr	r2, [fp, #-16]
    13e4:	e1520003 	cmp	r2, r3
    13e8:	1a000004 	bne	1400 <malloc+0xcc>
        prevp->s.ptr = p->s.ptr;
    13ec:	e51b3008 	ldr	r3, [fp, #-8]
    13f0:	e5932000 	ldr	r2, [r3]
    13f4:	e51b300c 	ldr	r3, [fp, #-12]
    13f8:	e5832000 	str	r2, [r3]
    13fc:	ea00000e 	b	143c <malloc+0x108>
      else {
        p->s.size -= nunits;
    1400:	e51b3008 	ldr	r3, [fp, #-8]
    1404:	e5932004 	ldr	r2, [r3, #4]
    1408:	e51b3010 	ldr	r3, [fp, #-16]
    140c:	e0422003 	sub	r2, r2, r3
    1410:	e51b3008 	ldr	r3, [fp, #-8]
    1414:	e5832004 	str	r2, [r3, #4]
        p += p->s.size;
    1418:	e51b3008 	ldr	r3, [fp, #-8]
    141c:	e5933004 	ldr	r3, [r3, #4]
    1420:	e1a03183 	lsl	r3, r3, #3
    1424:	e51b2008 	ldr	r2, [fp, #-8]
    1428:	e0823003 	add	r3, r2, r3
    142c:	e50b3008 	str	r3, [fp, #-8]
        p->s.size = nunits;
    1430:	e51b3008 	ldr	r3, [fp, #-8]
    1434:	e51b2010 	ldr	r2, [fp, #-16]
    1438:	e5832004 	str	r2, [r3, #4]
      }
      freep = prevp;
    143c:	e3013910 	movw	r3, #6416	@ 0x1910
    1440:	e3403000 	movt	r3, #0
    1444:	e51b200c 	ldr	r2, [fp, #-12]
    1448:	e5832000 	str	r2, [r3]
      return (void*)(p + 1);
    144c:	e51b3008 	ldr	r3, [fp, #-8]
    1450:	e2833008 	add	r3, r3, #8
    1454:	ea000013 	b	14a8 <malloc+0x174>
    }
    if(p == freep)
    1458:	e3013910 	movw	r3, #6416	@ 0x1910
    145c:	e3403000 	movt	r3, #0
    1460:	e5933000 	ldr	r3, [r3]
    1464:	e51b2008 	ldr	r2, [fp, #-8]
    1468:	e1520003 	cmp	r2, r3
    146c:	1a000007 	bne	1490 <malloc+0x15c>
      if((p = morecore(nunits)) == 0)
    1470:	e51b0010 	ldr	r0, [fp, #-16]
    1474:	ebffff8c 	bl	12ac <morecore>
    1478:	e50b0008 	str	r0, [fp, #-8]
    147c:	e51b3008 	ldr	r3, [fp, #-8]
    1480:	e3530000 	cmp	r3, #0
    1484:	1a000001 	bne	1490 <malloc+0x15c>
        return 0;
    1488:	e3a03000 	mov	r3, #0
    148c:	ea000005 	b	14a8 <malloc+0x174>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1490:	e51b3008 	ldr	r3, [fp, #-8]
    1494:	e50b300c 	str	r3, [fp, #-12]
    1498:	e51b3008 	ldr	r3, [fp, #-8]
    149c:	e5933000 	ldr	r3, [r3]
    14a0:	e50b3008 	str	r3, [fp, #-8]
    if(p->s.size >= nunits){
    14a4:	eaffffc6 	b	13c4 <malloc+0x90>
  }
}
    14a8:	e1a00003 	mov	r0, r3
    14ac:	e24bd004 	sub	sp, fp, #4
    14b0:	e8bd8800 	pop	{fp, pc}
