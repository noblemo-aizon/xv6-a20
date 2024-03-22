
_ls:     file format elf32-littlearm


Disassembly of section .text:

00000000 <fmtname>:
#include "user.h"
#include "fs.h"

char*
fmtname(char *path)
{
       0:	e92d4810 	push	{r4, fp, lr}
       4:	e28db008 	add	fp, sp, #8
       8:	e24dd014 	sub	sp, sp, #20
       c:	e50b0018 	str	r0, [fp, #-24]	@ 0xffffffe8
  static char buf[DIRSIZ+1];
  char *p;
  
  // Find first character after last slash.
  for(p=path+strlen(path); p >= path && *p != '/'; p--)
      10:	e51b0018 	ldr	r0, [fp, #-24]	@ 0xffffffe8
      14:	eb00011e 	bl	494 <strlen>
      18:	e1a02000 	mov	r2, r0
      1c:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
      20:	e0833002 	add	r3, r3, r2
      24:	e50b3010 	str	r3, [fp, #-16]
      28:	ea000002 	b	38 <fmtname+0x38>
      2c:	e51b3010 	ldr	r3, [fp, #-16]
      30:	e2433001 	sub	r3, r3, #1
      34:	e50b3010 	str	r3, [fp, #-16]
      38:	e51b2010 	ldr	r2, [fp, #-16]
      3c:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
      40:	e1520003 	cmp	r2, r3
      44:	3a000003 	bcc	58 <fmtname+0x58>
      48:	e51b3010 	ldr	r3, [fp, #-16]
      4c:	e5d33000 	ldrb	r3, [r3]
      50:	e353002f 	cmp	r3, #47	@ 0x2f
      54:	1afffff4 	bne	2c <fmtname+0x2c>
    ;
  p++;
      58:	e51b3010 	ldr	r3, [fp, #-16]
      5c:	e2833001 	add	r3, r3, #1
      60:	e50b3010 	str	r3, [fp, #-16]
  
  // Return blank-padded name.
  if(strlen(p) >= DIRSIZ)
      64:	e51b0010 	ldr	r0, [fp, #-16]
      68:	eb000109 	bl	494 <strlen>
      6c:	e1a03000 	mov	r3, r0
      70:	e353000d 	cmp	r3, #13
      74:	9a000001 	bls	80 <fmtname+0x80>
    return p;
      78:	e51b3010 	ldr	r3, [fp, #-16]
      7c:	ea000017 	b	e0 <fmtname+0xe0>
  memmove(buf, p, strlen(p));
      80:	e51b0010 	ldr	r0, [fp, #-16]
      84:	eb000102 	bl	494 <strlen>
      88:	e1a03000 	mov	r3, r0
      8c:	e1a02003 	mov	r2, r3
      90:	e51b1010 	ldr	r1, [fp, #-16]
      94:	e3010468 	movw	r0, #5224	@ 0x1468
      98:	e3400000 	movt	r0, #0
      9c:	eb0001ab 	bl	750 <memmove>
  memset(buf+strlen(p), ' ', DIRSIZ-strlen(p));
      a0:	e51b0010 	ldr	r0, [fp, #-16]
      a4:	eb0000fa 	bl	494 <strlen>
      a8:	e1a02000 	mov	r2, r0
      ac:	e3013468 	movw	r3, #5224	@ 0x1468
      b0:	e3403000 	movt	r3, #0
      b4:	e0824003 	add	r4, r2, r3
      b8:	e51b0010 	ldr	r0, [fp, #-16]
      bc:	eb0000f4 	bl	494 <strlen>
      c0:	e1a03000 	mov	r3, r0
      c4:	e263300e 	rsb	r3, r3, #14
      c8:	e1a02003 	mov	r2, r3
      cc:	e3a01020 	mov	r1, #32
      d0:	e1a00004 	mov	r0, r4
      d4:	eb000103 	bl	4e8 <memset>
  return buf;
      d8:	e3013468 	movw	r3, #5224	@ 0x1468
      dc:	e3403000 	movt	r3, #0
}
      e0:	e1a00003 	mov	r0, r3
      e4:	e24bd008 	sub	sp, fp, #8
      e8:	e8bd8810 	pop	{r4, fp, pc}

000000ec <ls>:

void
ls(char *path)
{
      ec:	e92d4800 	push	{fp, lr}
      f0:	e28db004 	add	fp, sp, #4
      f4:	e24ddd09 	sub	sp, sp, #576	@ 0x240
      f8:	e50b0238 	str	r0, [fp, #-568]	@ 0xfffffdc8
  char buf[512], *p;
  int fd;
  struct dirent de;
  struct stat st;
  
  if((fd = open(path, 0)) < 0){
      fc:	e3a01000 	mov	r1, #0
     100:	e51b0238 	ldr	r0, [fp, #-568]	@ 0xfffffdc8
     104:	eb000223 	bl	998 <open>
     108:	e50b0008 	str	r0, [fp, #-8]
     10c:	e51b3008 	ldr	r3, [fp, #-8]
     110:	e3530000 	cmp	r3, #0
     114:	aa000005 	bge	130 <ls+0x44>
    printf(2, "ls: cannot open %s\n", path);
     118:	e51b2238 	ldr	r2, [fp, #-568]	@ 0xfffffdc8
     11c:	e30113fc 	movw	r1, #5116	@ 0x13fc
     120:	e3401000 	movt	r1, #0
     124:	e3a00002 	mov	r0, #2
     128:	eb000343 	bl	e3c <printf>
    return;
     12c:	ea000080 	b	334 <ls+0x248>
  }
  
  if(fstat(fd, &st) < 0){
     130:	e24b3e23 	sub	r3, fp, #560	@ 0x230
     134:	e1a01003 	mov	r1, r3
     138:	e51b0008 	ldr	r0, [fp, #-8]
     13c:	eb00023c 	bl	a34 <fstat>
     140:	e1a03000 	mov	r3, r0
     144:	e3530000 	cmp	r3, #0
     148:	aa000007 	bge	16c <ls+0x80>
    printf(2, "ls: cannot stat %s\n", path);
     14c:	e51b2238 	ldr	r2, [fp, #-568]	@ 0xfffffdc8
     150:	e3011410 	movw	r1, #5136	@ 0x1410
     154:	e3401000 	movt	r1, #0
     158:	e3a00002 	mov	r0, #2
     15c:	eb000336 	bl	e3c <printf>
    close(fd);
     160:	e51b0008 	ldr	r0, [fp, #-8]
     164:	eb0001e4 	bl	8fc <close>
    return;
     168:	ea000071 	b	334 <ls+0x248>
  }
  
  switch(st.type){
     16c:	e24b3004 	sub	r3, fp, #4
     170:	e2433f8b 	sub	r3, r3, #556	@ 0x22c
     174:	e1d330f0 	ldrsh	r3, [r3]
     178:	e3530001 	cmp	r3, #1
     17c:	0a000013 	beq	1d0 <ls+0xe4>
     180:	e3530002 	cmp	r3, #2
     184:	1a000068 	bne	32c <ls+0x240>
  case T_FILE:
    printf(1, "%s %d %d %d\n", fmtname(path), st.type, st.ino, st.size);
     188:	e51b0238 	ldr	r0, [fp, #-568]	@ 0xfffffdc8
     18c:	ebffff9b 	bl	0 <fmtname>
     190:	e1a01000 	mov	r1, r0
     194:	e24b3004 	sub	r3, fp, #4
     198:	e2433f8b 	sub	r3, r3, #556	@ 0x22c
     19c:	e1d330f0 	ldrsh	r3, [r3]
     1a0:	e1a00003 	mov	r0, r3
     1a4:	e51b3228 	ldr	r3, [fp, #-552]	@ 0xfffffdd8
     1a8:	e51b2220 	ldr	r2, [fp, #-544]	@ 0xfffffde0
     1ac:	e58d2004 	str	r2, [sp, #4]
     1b0:	e58d3000 	str	r3, [sp]
     1b4:	e1a03000 	mov	r3, r0
     1b8:	e1a02001 	mov	r2, r1
     1bc:	e3011424 	movw	r1, #5156	@ 0x1424
     1c0:	e3401000 	movt	r1, #0
     1c4:	e3a00001 	mov	r0, #1
     1c8:	eb00031b 	bl	e3c <printf>
    break;
     1cc:	ea000056 	b	32c <ls+0x240>
  
  case T_DIR:
    if(strlen(path) + 1 + DIRSIZ + 1 > sizeof buf){
     1d0:	e51b0238 	ldr	r0, [fp, #-568]	@ 0xfffffdc8
     1d4:	eb0000ae 	bl	494 <strlen>
     1d8:	e1a03000 	mov	r3, r0
     1dc:	e2833010 	add	r3, r3, #16
     1e0:	e3530c02 	cmp	r3, #512	@ 0x200
     1e4:	9a000004 	bls	1fc <ls+0x110>
      printf(1, "ls: path too long\n");
     1e8:	e3011434 	movw	r1, #5172	@ 0x1434
     1ec:	e3401000 	movt	r1, #0
     1f0:	e3a00001 	mov	r0, #1
     1f4:	eb000310 	bl	e3c <printf>
      break;
     1f8:	ea00004b 	b	32c <ls+0x240>
    }
    strcpy(buf, path);
     1fc:	e24b3f83 	sub	r3, fp, #524	@ 0x20c
     200:	e51b1238 	ldr	r1, [fp, #-568]	@ 0xfffffdc8
     204:	e1a00003 	mov	r0, r3
     208:	eb000069 	bl	3b4 <strcpy>
    p = buf+strlen(buf);
     20c:	e24b3f83 	sub	r3, fp, #524	@ 0x20c
     210:	e1a00003 	mov	r0, r3
     214:	eb00009e 	bl	494 <strlen>
     218:	e1a02000 	mov	r2, r0
     21c:	e24b3f83 	sub	r3, fp, #524	@ 0x20c
     220:	e0833002 	add	r3, r3, r2
     224:	e50b300c 	str	r3, [fp, #-12]
    *p++ = '/';
     228:	e51b300c 	ldr	r3, [fp, #-12]
     22c:	e2832001 	add	r2, r3, #1
     230:	e50b200c 	str	r2, [fp, #-12]
     234:	e3a0202f 	mov	r2, #47	@ 0x2f
     238:	e5c32000 	strb	r2, [r3]
    while(read(fd, &de, sizeof(de)) == sizeof(de)){
     23c:	ea000031 	b	308 <ls+0x21c>
      if(de.inum == 0)
     240:	e24b3004 	sub	r3, fp, #4
     244:	e2433f86 	sub	r3, r3, #536	@ 0x218
     248:	e1d330b0 	ldrh	r3, [r3]
     24c:	e3530000 	cmp	r3, #0
     250:	0a00002b 	beq	304 <ls+0x218>
        continue;
      memmove(p, de.name, DIRSIZ);
     254:	e24b3f87 	sub	r3, fp, #540	@ 0x21c
     258:	e2833002 	add	r3, r3, #2
     25c:	e3a0200e 	mov	r2, #14
     260:	e1a01003 	mov	r1, r3
     264:	e51b000c 	ldr	r0, [fp, #-12]
     268:	eb000138 	bl	750 <memmove>
      p[DIRSIZ] = 0;
     26c:	e51b300c 	ldr	r3, [fp, #-12]
     270:	e283300e 	add	r3, r3, #14
     274:	e3a02000 	mov	r2, #0
     278:	e5c32000 	strb	r2, [r3]
      if(stat(buf, &st) < 0){
     27c:	e24b2e23 	sub	r2, fp, #560	@ 0x230
     280:	e24b3f83 	sub	r3, fp, #524	@ 0x20c
     284:	e1a01002 	mov	r1, r2
     288:	e1a00003 	mov	r0, r3
     28c:	eb0000f9 	bl	678 <stat>
     290:	e1a03000 	mov	r3, r0
     294:	e3530000 	cmp	r3, #0
     298:	aa000006 	bge	2b8 <ls+0x1cc>
        printf(1, "ls: cannot stat %s\n", buf);
     29c:	e24b3f83 	sub	r3, fp, #524	@ 0x20c
     2a0:	e1a02003 	mov	r2, r3
     2a4:	e3011410 	movw	r1, #5136	@ 0x1410
     2a8:	e3401000 	movt	r1, #0
     2ac:	e3a00001 	mov	r0, #1
     2b0:	eb0002e1 	bl	e3c <printf>
        continue;
     2b4:	ea000013 	b	308 <ls+0x21c>
      }
      printf(1, "%s %d %d %d\n", fmtname(buf), st.type, st.ino, st.size);
     2b8:	e24b3f83 	sub	r3, fp, #524	@ 0x20c
     2bc:	e1a00003 	mov	r0, r3
     2c0:	ebffff4e 	bl	0 <fmtname>
     2c4:	e1a01000 	mov	r1, r0
     2c8:	e24b3004 	sub	r3, fp, #4
     2cc:	e2433f8b 	sub	r3, r3, #556	@ 0x22c
     2d0:	e1d330f0 	ldrsh	r3, [r3]
     2d4:	e1a00003 	mov	r0, r3
     2d8:	e51b3228 	ldr	r3, [fp, #-552]	@ 0xfffffdd8
     2dc:	e51b2220 	ldr	r2, [fp, #-544]	@ 0xfffffde0
     2e0:	e58d2004 	str	r2, [sp, #4]
     2e4:	e58d3000 	str	r3, [sp]
     2e8:	e1a03000 	mov	r3, r0
     2ec:	e1a02001 	mov	r2, r1
     2f0:	e3011424 	movw	r1, #5156	@ 0x1424
     2f4:	e3401000 	movt	r1, #0
     2f8:	e3a00001 	mov	r0, #1
     2fc:	eb0002ce 	bl	e3c <printf>
     300:	ea000000 	b	308 <ls+0x21c>
        continue;
     304:	e320f000 	nop	{0}
    while(read(fd, &de, sizeof(de)) == sizeof(de)){
     308:	e24b3f87 	sub	r3, fp, #540	@ 0x21c
     30c:	e3a02010 	mov	r2, #16
     310:	e1a01003 	mov	r1, r3
     314:	e51b0008 	ldr	r0, [fp, #-8]
     318:	eb00015d 	bl	894 <read>
     31c:	e1a03000 	mov	r3, r0
     320:	e3530010 	cmp	r3, #16
     324:	0affffc5 	beq	240 <ls+0x154>
    }
    break;
     328:	e320f000 	nop	{0}
  }
  close(fd);
     32c:	e51b0008 	ldr	r0, [fp, #-8]
     330:	eb000171 	bl	8fc <close>
}
     334:	e24bd004 	sub	sp, fp, #4
     338:	e8bd8800 	pop	{fp, pc}

0000033c <main>:

int
main(int argc, char *argv[])
{
     33c:	e92d4800 	push	{fp, lr}
     340:	e28db004 	add	fp, sp, #4
     344:	e24dd010 	sub	sp, sp, #16
     348:	e50b0010 	str	r0, [fp, #-16]
     34c:	e50b1014 	str	r1, [fp, #-20]	@ 0xffffffec
  int i;

  if(argc < 2){
     350:	e51b3010 	ldr	r3, [fp, #-16]
     354:	e3530001 	cmp	r3, #1
     358:	ca000003 	bgt	36c <main+0x30>
    ls(".");
     35c:	e3010448 	movw	r0, #5192	@ 0x1448
     360:	e3400000 	movt	r0, #0
     364:	ebffff60 	bl	ec <ls>
    exit();
     368:	eb000122 	bl	7f8 <exit>
  }
  for(i=1; i<argc; i++)
     36c:	e3a03001 	mov	r3, #1
     370:	e50b3008 	str	r3, [fp, #-8]
     374:	ea000009 	b	3a0 <main+0x64>
    ls(argv[i]);
     378:	e51b3008 	ldr	r3, [fp, #-8]
     37c:	e1a03103 	lsl	r3, r3, #2
     380:	e51b2014 	ldr	r2, [fp, #-20]	@ 0xffffffec
     384:	e0823003 	add	r3, r2, r3
     388:	e5933000 	ldr	r3, [r3]
     38c:	e1a00003 	mov	r0, r3
     390:	ebffff55 	bl	ec <ls>
  for(i=1; i<argc; i++)
     394:	e51b3008 	ldr	r3, [fp, #-8]
     398:	e2833001 	add	r3, r3, #1
     39c:	e50b3008 	str	r3, [fp, #-8]
     3a0:	e51b2008 	ldr	r2, [fp, #-8]
     3a4:	e51b3010 	ldr	r3, [fp, #-16]
     3a8:	e1520003 	cmp	r2, r3
     3ac:	bafffff1 	blt	378 <main+0x3c>
  exit();
     3b0:	eb000110 	bl	7f8 <exit>

000003b4 <strcpy>:
#include "user.h"
#include "arm.h"

char*
strcpy(char *s, char *t)
{
     3b4:	e52db004 	push	{fp}		@ (str fp, [sp, #-4]!)
     3b8:	e28db000 	add	fp, sp, #0
     3bc:	e24dd014 	sub	sp, sp, #20
     3c0:	e50b0010 	str	r0, [fp, #-16]
     3c4:	e50b1014 	str	r1, [fp, #-20]	@ 0xffffffec
  char *os;

  os = s;
     3c8:	e51b3010 	ldr	r3, [fp, #-16]
     3cc:	e50b3008 	str	r3, [fp, #-8]
  while((*s++ = *t++) != 0)
     3d0:	e320f000 	nop	{0}
     3d4:	e51b2014 	ldr	r2, [fp, #-20]	@ 0xffffffec
     3d8:	e2823001 	add	r3, r2, #1
     3dc:	e50b3014 	str	r3, [fp, #-20]	@ 0xffffffec
     3e0:	e51b3010 	ldr	r3, [fp, #-16]
     3e4:	e2831001 	add	r1, r3, #1
     3e8:	e50b1010 	str	r1, [fp, #-16]
     3ec:	e5d22000 	ldrb	r2, [r2]
     3f0:	e5c32000 	strb	r2, [r3]
     3f4:	e5d33000 	ldrb	r3, [r3]
     3f8:	e3530000 	cmp	r3, #0
     3fc:	1afffff4 	bne	3d4 <strcpy+0x20>
    ;
  return os;
     400:	e51b3008 	ldr	r3, [fp, #-8]
}
     404:	e1a00003 	mov	r0, r3
     408:	e28bd000 	add	sp, fp, #0
     40c:	e49db004 	pop	{fp}		@ (ldr fp, [sp], #4)
     410:	e12fff1e 	bx	lr

00000414 <strcmp>:

int
strcmp(const char *p, const char *q)
{
     414:	e52db004 	push	{fp}		@ (str fp, [sp, #-4]!)
     418:	e28db000 	add	fp, sp, #0
     41c:	e24dd00c 	sub	sp, sp, #12
     420:	e50b0008 	str	r0, [fp, #-8]
     424:	e50b100c 	str	r1, [fp, #-12]
  while(*p && *p == *q)
     428:	ea000005 	b	444 <strcmp+0x30>
    p++, q++;
     42c:	e51b3008 	ldr	r3, [fp, #-8]
     430:	e2833001 	add	r3, r3, #1
     434:	e50b3008 	str	r3, [fp, #-8]
     438:	e51b300c 	ldr	r3, [fp, #-12]
     43c:	e2833001 	add	r3, r3, #1
     440:	e50b300c 	str	r3, [fp, #-12]
  while(*p && *p == *q)
     444:	e51b3008 	ldr	r3, [fp, #-8]
     448:	e5d33000 	ldrb	r3, [r3]
     44c:	e3530000 	cmp	r3, #0
     450:	0a000005 	beq	46c <strcmp+0x58>
     454:	e51b3008 	ldr	r3, [fp, #-8]
     458:	e5d32000 	ldrb	r2, [r3]
     45c:	e51b300c 	ldr	r3, [fp, #-12]
     460:	e5d33000 	ldrb	r3, [r3]
     464:	e1520003 	cmp	r2, r3
     468:	0affffef 	beq	42c <strcmp+0x18>
  return (uchar)*p - (uchar)*q;
     46c:	e51b3008 	ldr	r3, [fp, #-8]
     470:	e5d33000 	ldrb	r3, [r3]
     474:	e1a02003 	mov	r2, r3
     478:	e51b300c 	ldr	r3, [fp, #-12]
     47c:	e5d33000 	ldrb	r3, [r3]
     480:	e0423003 	sub	r3, r2, r3
}
     484:	e1a00003 	mov	r0, r3
     488:	e28bd000 	add	sp, fp, #0
     48c:	e49db004 	pop	{fp}		@ (ldr fp, [sp], #4)
     490:	e12fff1e 	bx	lr

00000494 <strlen>:

uint
strlen(char *s)
{
     494:	e52db004 	push	{fp}		@ (str fp, [sp, #-4]!)
     498:	e28db000 	add	fp, sp, #0
     49c:	e24dd014 	sub	sp, sp, #20
     4a0:	e50b0010 	str	r0, [fp, #-16]
  int n;

  for(n = 0; s[n]; n++)
     4a4:	e3a03000 	mov	r3, #0
     4a8:	e50b3008 	str	r3, [fp, #-8]
     4ac:	ea000002 	b	4bc <strlen+0x28>
     4b0:	e51b3008 	ldr	r3, [fp, #-8]
     4b4:	e2833001 	add	r3, r3, #1
     4b8:	e50b3008 	str	r3, [fp, #-8]
     4bc:	e51b3008 	ldr	r3, [fp, #-8]
     4c0:	e51b2010 	ldr	r2, [fp, #-16]
     4c4:	e0823003 	add	r3, r2, r3
     4c8:	e5d33000 	ldrb	r3, [r3]
     4cc:	e3530000 	cmp	r3, #0
     4d0:	1afffff6 	bne	4b0 <strlen+0x1c>
    ;
  return n;
     4d4:	e51b3008 	ldr	r3, [fp, #-8]
}
     4d8:	e1a00003 	mov	r0, r3
     4dc:	e28bd000 	add	sp, fp, #0
     4e0:	e49db004 	pop	{fp}		@ (ldr fp, [sp], #4)
     4e4:	e12fff1e 	bx	lr

000004e8 <memset>:

void*
memset(void *dst, int c, uint n)
{
     4e8:	e52db004 	push	{fp}		@ (str fp, [sp, #-4]!)
     4ec:	e28db000 	add	fp, sp, #0
     4f0:	e24dd01c 	sub	sp, sp, #28
     4f4:	e50b0010 	str	r0, [fp, #-16]
     4f8:	e50b1014 	str	r1, [fp, #-20]	@ 0xffffffec
     4fc:	e50b2018 	str	r2, [fp, #-24]	@ 0xffffffe8
  char *p=dst;
     500:	e51b3010 	ldr	r3, [fp, #-16]
     504:	e50b3008 	str	r3, [fp, #-8]
  u32 rc=n;
     508:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
     50c:	e50b300c 	str	r3, [fp, #-12]

  while (rc-- > 0) *p++ = c;
     510:	ea000005 	b	52c <memset+0x44>
     514:	e51b3008 	ldr	r3, [fp, #-8]
     518:	e2832001 	add	r2, r3, #1
     51c:	e50b2008 	str	r2, [fp, #-8]
     520:	e51b2014 	ldr	r2, [fp, #-20]	@ 0xffffffec
     524:	e6ef2072 	uxtb	r2, r2
     528:	e5c32000 	strb	r2, [r3]
     52c:	e51b300c 	ldr	r3, [fp, #-12]
     530:	e2432001 	sub	r2, r3, #1
     534:	e50b200c 	str	r2, [fp, #-12]
     538:	e3530000 	cmp	r3, #0
     53c:	1afffff4 	bne	514 <memset+0x2c>
  return (void *)p;
     540:	e51b3008 	ldr	r3, [fp, #-8]
}
     544:	e1a00003 	mov	r0, r3
     548:	e28bd000 	add	sp, fp, #0
     54c:	e49db004 	pop	{fp}		@ (ldr fp, [sp], #4)
     550:	e12fff1e 	bx	lr

00000554 <strchr>:

char*
strchr(const char *s, char c)
{
     554:	e52db004 	push	{fp}		@ (str fp, [sp, #-4]!)
     558:	e28db000 	add	fp, sp, #0
     55c:	e24dd00c 	sub	sp, sp, #12
     560:	e50b0008 	str	r0, [fp, #-8]
     564:	e1a03001 	mov	r3, r1
     568:	e54b3009 	strb	r3, [fp, #-9]
  for(; *s; s++)
     56c:	ea000009 	b	598 <strchr+0x44>
    if(*s == c)
     570:	e51b3008 	ldr	r3, [fp, #-8]
     574:	e5d33000 	ldrb	r3, [r3]
     578:	e55b2009 	ldrb	r2, [fp, #-9]
     57c:	e1520003 	cmp	r2, r3
     580:	1a000001 	bne	58c <strchr+0x38>
      return (char*)s;
     584:	e51b3008 	ldr	r3, [fp, #-8]
     588:	ea000007 	b	5ac <strchr+0x58>
  for(; *s; s++)
     58c:	e51b3008 	ldr	r3, [fp, #-8]
     590:	e2833001 	add	r3, r3, #1
     594:	e50b3008 	str	r3, [fp, #-8]
     598:	e51b3008 	ldr	r3, [fp, #-8]
     59c:	e5d33000 	ldrb	r3, [r3]
     5a0:	e3530000 	cmp	r3, #0
     5a4:	1afffff1 	bne	570 <strchr+0x1c>
  return 0;
     5a8:	e3a03000 	mov	r3, #0
}
     5ac:	e1a00003 	mov	r0, r3
     5b0:	e28bd000 	add	sp, fp, #0
     5b4:	e49db004 	pop	{fp}		@ (ldr fp, [sp], #4)
     5b8:	e12fff1e 	bx	lr

000005bc <gets>:

char*
gets(char *buf, int max)
{
     5bc:	e92d4800 	push	{fp, lr}
     5c0:	e28db004 	add	fp, sp, #4
     5c4:	e24dd018 	sub	sp, sp, #24
     5c8:	e50b0018 	str	r0, [fp, #-24]	@ 0xffffffe8
     5cc:	e50b101c 	str	r1, [fp, #-28]	@ 0xffffffe4
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
     5d0:	e3a03000 	mov	r3, #0
     5d4:	e50b3008 	str	r3, [fp, #-8]
     5d8:	ea000016 	b	638 <gets+0x7c>
    cc = read(0, &c, 1);
     5dc:	e24b300d 	sub	r3, fp, #13
     5e0:	e3a02001 	mov	r2, #1
     5e4:	e1a01003 	mov	r1, r3
     5e8:	e3a00000 	mov	r0, #0
     5ec:	eb0000a8 	bl	894 <read>
     5f0:	e50b000c 	str	r0, [fp, #-12]
    if(cc < 1)
     5f4:	e51b300c 	ldr	r3, [fp, #-12]
     5f8:	e3530000 	cmp	r3, #0
     5fc:	da000013 	ble	650 <gets+0x94>
      break;
    buf[i++] = c;
     600:	e51b3008 	ldr	r3, [fp, #-8]
     604:	e2832001 	add	r2, r3, #1
     608:	e50b2008 	str	r2, [fp, #-8]
     60c:	e1a02003 	mov	r2, r3
     610:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
     614:	e0833002 	add	r3, r3, r2
     618:	e55b200d 	ldrb	r2, [fp, #-13]
     61c:	e5c32000 	strb	r2, [r3]
    if(c == '\n' || c == '\r')
     620:	e55b300d 	ldrb	r3, [fp, #-13]
     624:	e353000a 	cmp	r3, #10
     628:	0a000009 	beq	654 <gets+0x98>
     62c:	e55b300d 	ldrb	r3, [fp, #-13]
     630:	e353000d 	cmp	r3, #13
     634:	0a000006 	beq	654 <gets+0x98>
  for(i=0; i+1 < max; ){
     638:	e51b3008 	ldr	r3, [fp, #-8]
     63c:	e2833001 	add	r3, r3, #1
     640:	e51b201c 	ldr	r2, [fp, #-28]	@ 0xffffffe4
     644:	e1520003 	cmp	r2, r3
     648:	caffffe3 	bgt	5dc <gets+0x20>
     64c:	ea000000 	b	654 <gets+0x98>
      break;
     650:	e320f000 	nop	{0}
      break;
  }
  buf[i] = '\0';
     654:	e51b3008 	ldr	r3, [fp, #-8]
     658:	e51b2018 	ldr	r2, [fp, #-24]	@ 0xffffffe8
     65c:	e0823003 	add	r3, r2, r3
     660:	e3a02000 	mov	r2, #0
     664:	e5c32000 	strb	r2, [r3]
  return buf;
     668:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
}
     66c:	e1a00003 	mov	r0, r3
     670:	e24bd004 	sub	sp, fp, #4
     674:	e8bd8800 	pop	{fp, pc}

00000678 <stat>:

int
stat(char *n, struct stat *st)
{
     678:	e92d4800 	push	{fp, lr}
     67c:	e28db004 	add	fp, sp, #4
     680:	e24dd010 	sub	sp, sp, #16
     684:	e50b0010 	str	r0, [fp, #-16]
     688:	e50b1014 	str	r1, [fp, #-20]	@ 0xffffffec
  int fd;
  int r;

  fd = open(n, O_RDONLY);
     68c:	e3a01000 	mov	r1, #0
     690:	e51b0010 	ldr	r0, [fp, #-16]
     694:	eb0000bf 	bl	998 <open>
     698:	e50b0008 	str	r0, [fp, #-8]
  if(fd < 0)
     69c:	e51b3008 	ldr	r3, [fp, #-8]
     6a0:	e3530000 	cmp	r3, #0
     6a4:	aa000001 	bge	6b0 <stat+0x38>
    return -1;
     6a8:	e3e03000 	mvn	r3, #0
     6ac:	ea000006 	b	6cc <stat+0x54>
  r = fstat(fd, st);
     6b0:	e51b1014 	ldr	r1, [fp, #-20]	@ 0xffffffec
     6b4:	e51b0008 	ldr	r0, [fp, #-8]
     6b8:	eb0000dd 	bl	a34 <fstat>
     6bc:	e50b000c 	str	r0, [fp, #-12]
  close(fd);
     6c0:	e51b0008 	ldr	r0, [fp, #-8]
     6c4:	eb00008c 	bl	8fc <close>
  return r;
     6c8:	e51b300c 	ldr	r3, [fp, #-12]
}
     6cc:	e1a00003 	mov	r0, r3
     6d0:	e24bd004 	sub	sp, fp, #4
     6d4:	e8bd8800 	pop	{fp, pc}

000006d8 <atoi>:

int
atoi(const char *s)
{
     6d8:	e52db004 	push	{fp}		@ (str fp, [sp, #-4]!)
     6dc:	e28db000 	add	fp, sp, #0
     6e0:	e24dd014 	sub	sp, sp, #20
     6e4:	e50b0010 	str	r0, [fp, #-16]
  int n;

  n = 0;
     6e8:	e3a03000 	mov	r3, #0
     6ec:	e50b3008 	str	r3, [fp, #-8]
  while('0' <= *s && *s <= '9')
     6f0:	ea000009 	b	71c <atoi+0x44>
    n = n*10 + *s++ - '0';
     6f4:	e51b3008 	ldr	r3, [fp, #-8]
     6f8:	e3a0200a 	mov	r2, #10
     6fc:	e0020392 	mul	r2, r2, r3
     700:	e51b3010 	ldr	r3, [fp, #-16]
     704:	e2831001 	add	r1, r3, #1
     708:	e50b1010 	str	r1, [fp, #-16]
     70c:	e5d33000 	ldrb	r3, [r3]
     710:	e0823003 	add	r3, r2, r3
     714:	e2433030 	sub	r3, r3, #48	@ 0x30
     718:	e50b3008 	str	r3, [fp, #-8]
  while('0' <= *s && *s <= '9')
     71c:	e51b3010 	ldr	r3, [fp, #-16]
     720:	e5d33000 	ldrb	r3, [r3]
     724:	e353002f 	cmp	r3, #47	@ 0x2f
     728:	9a000003 	bls	73c <atoi+0x64>
     72c:	e51b3010 	ldr	r3, [fp, #-16]
     730:	e5d33000 	ldrb	r3, [r3]
     734:	e3530039 	cmp	r3, #57	@ 0x39
     738:	9affffed 	bls	6f4 <atoi+0x1c>
  return n;
     73c:	e51b3008 	ldr	r3, [fp, #-8]
}
     740:	e1a00003 	mov	r0, r3
     744:	e28bd000 	add	sp, fp, #0
     748:	e49db004 	pop	{fp}		@ (ldr fp, [sp], #4)
     74c:	e12fff1e 	bx	lr

00000750 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
     750:	e52db004 	push	{fp}		@ (str fp, [sp, #-4]!)
     754:	e28db000 	add	fp, sp, #0
     758:	e24dd01c 	sub	sp, sp, #28
     75c:	e50b0010 	str	r0, [fp, #-16]
     760:	e50b1014 	str	r1, [fp, #-20]	@ 0xffffffec
     764:	e50b2018 	str	r2, [fp, #-24]	@ 0xffffffe8
  char *dst, *src;
  
  dst = vdst;
     768:	e51b3010 	ldr	r3, [fp, #-16]
     76c:	e50b3008 	str	r3, [fp, #-8]
  src = vsrc;
     770:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
     774:	e50b300c 	str	r3, [fp, #-12]
  while(n-- > 0)
     778:	ea000007 	b	79c <memmove+0x4c>
    *dst++ = *src++;
     77c:	e51b200c 	ldr	r2, [fp, #-12]
     780:	e2823001 	add	r3, r2, #1
     784:	e50b300c 	str	r3, [fp, #-12]
     788:	e51b3008 	ldr	r3, [fp, #-8]
     78c:	e2831001 	add	r1, r3, #1
     790:	e50b1008 	str	r1, [fp, #-8]
     794:	e5d22000 	ldrb	r2, [r2]
     798:	e5c32000 	strb	r2, [r3]
  while(n-- > 0)
     79c:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
     7a0:	e2432001 	sub	r2, r3, #1
     7a4:	e50b2018 	str	r2, [fp, #-24]	@ 0xffffffe8
     7a8:	e3530000 	cmp	r3, #0
     7ac:	cafffff2 	bgt	77c <memmove+0x2c>
  return vdst;
     7b0:	e51b3010 	ldr	r3, [fp, #-16]
}
     7b4:	e1a00003 	mov	r0, r3
     7b8:	e28bd000 	add	sp, fp, #0
     7bc:	e49db004 	pop	{fp}		@ (ldr fp, [sp], #4)
     7c0:	e12fff1e 	bx	lr

000007c4 <fork>:
     7c4:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
     7c8:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
     7cc:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
     7d0:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
     7d4:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
     7d8:	e3a00001 	mov	r0, #1
     7dc:	ef000040 	svc	0x00000040
     7e0:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     7e4:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     7e8:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
     7ec:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
     7f0:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
     7f4:	e12fff1e 	bx	lr

000007f8 <exit>:
     7f8:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
     7fc:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
     800:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
     804:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
     808:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
     80c:	e3a00002 	mov	r0, #2
     810:	ef000040 	svc	0x00000040
     814:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     818:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     81c:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
     820:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
     824:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
     828:	e12fff1e 	bx	lr

0000082c <wait>:
     82c:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
     830:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
     834:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
     838:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
     83c:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
     840:	e3a00003 	mov	r0, #3
     844:	ef000040 	svc	0x00000040
     848:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     84c:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     850:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
     854:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
     858:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
     85c:	e12fff1e 	bx	lr

00000860 <pipe>:
     860:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
     864:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
     868:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
     86c:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
     870:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
     874:	e3a00004 	mov	r0, #4
     878:	ef000040 	svc	0x00000040
     87c:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     880:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     884:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
     888:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
     88c:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
     890:	e12fff1e 	bx	lr

00000894 <read>:
     894:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
     898:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
     89c:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
     8a0:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
     8a4:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
     8a8:	e3a00005 	mov	r0, #5
     8ac:	ef000040 	svc	0x00000040
     8b0:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     8b4:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     8b8:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
     8bc:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
     8c0:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
     8c4:	e12fff1e 	bx	lr

000008c8 <write>:
     8c8:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
     8cc:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
     8d0:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
     8d4:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
     8d8:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
     8dc:	e3a00010 	mov	r0, #16
     8e0:	ef000040 	svc	0x00000040
     8e4:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     8e8:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     8ec:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
     8f0:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
     8f4:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
     8f8:	e12fff1e 	bx	lr

000008fc <close>:
     8fc:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
     900:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
     904:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
     908:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
     90c:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
     910:	e3a00015 	mov	r0, #21
     914:	ef000040 	svc	0x00000040
     918:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     91c:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     920:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
     924:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
     928:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
     92c:	e12fff1e 	bx	lr

00000930 <kill>:
     930:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
     934:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
     938:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
     93c:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
     940:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
     944:	e3a00006 	mov	r0, #6
     948:	ef000040 	svc	0x00000040
     94c:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     950:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     954:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
     958:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
     95c:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
     960:	e12fff1e 	bx	lr

00000964 <exec>:
     964:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
     968:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
     96c:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
     970:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
     974:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
     978:	e3a00007 	mov	r0, #7
     97c:	ef000040 	svc	0x00000040
     980:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     984:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     988:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
     98c:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
     990:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
     994:	e12fff1e 	bx	lr

00000998 <open>:
     998:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
     99c:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
     9a0:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
     9a4:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
     9a8:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
     9ac:	e3a0000f 	mov	r0, #15
     9b0:	ef000040 	svc	0x00000040
     9b4:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     9b8:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     9bc:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
     9c0:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
     9c4:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
     9c8:	e12fff1e 	bx	lr

000009cc <mknod>:
     9cc:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
     9d0:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
     9d4:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
     9d8:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
     9dc:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
     9e0:	e3a00011 	mov	r0, #17
     9e4:	ef000040 	svc	0x00000040
     9e8:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     9ec:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     9f0:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
     9f4:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
     9f8:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
     9fc:	e12fff1e 	bx	lr

00000a00 <unlink>:
     a00:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
     a04:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
     a08:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
     a0c:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
     a10:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
     a14:	e3a00012 	mov	r0, #18
     a18:	ef000040 	svc	0x00000040
     a1c:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     a20:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     a24:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
     a28:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
     a2c:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
     a30:	e12fff1e 	bx	lr

00000a34 <fstat>:
     a34:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
     a38:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
     a3c:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
     a40:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
     a44:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
     a48:	e3a00008 	mov	r0, #8
     a4c:	ef000040 	svc	0x00000040
     a50:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     a54:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     a58:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
     a5c:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
     a60:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
     a64:	e12fff1e 	bx	lr

00000a68 <link>:
     a68:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
     a6c:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
     a70:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
     a74:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
     a78:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
     a7c:	e3a00013 	mov	r0, #19
     a80:	ef000040 	svc	0x00000040
     a84:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     a88:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     a8c:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
     a90:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
     a94:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
     a98:	e12fff1e 	bx	lr

00000a9c <mkdir>:
     a9c:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
     aa0:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
     aa4:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
     aa8:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
     aac:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
     ab0:	e3a00014 	mov	r0, #20
     ab4:	ef000040 	svc	0x00000040
     ab8:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     abc:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     ac0:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
     ac4:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
     ac8:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
     acc:	e12fff1e 	bx	lr

00000ad0 <chdir>:
     ad0:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
     ad4:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
     ad8:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
     adc:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
     ae0:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
     ae4:	e3a00009 	mov	r0, #9
     ae8:	ef000040 	svc	0x00000040
     aec:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     af0:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     af4:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
     af8:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
     afc:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
     b00:	e12fff1e 	bx	lr

00000b04 <dup>:
     b04:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
     b08:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
     b0c:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
     b10:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
     b14:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
     b18:	e3a0000a 	mov	r0, #10
     b1c:	ef000040 	svc	0x00000040
     b20:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     b24:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     b28:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
     b2c:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
     b30:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
     b34:	e12fff1e 	bx	lr

00000b38 <getpid>:
     b38:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
     b3c:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
     b40:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
     b44:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
     b48:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
     b4c:	e3a0000b 	mov	r0, #11
     b50:	ef000040 	svc	0x00000040
     b54:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     b58:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     b5c:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
     b60:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
     b64:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
     b68:	e12fff1e 	bx	lr

00000b6c <sbrk>:
     b6c:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
     b70:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
     b74:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
     b78:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
     b7c:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
     b80:	e3a0000c 	mov	r0, #12
     b84:	ef000040 	svc	0x00000040
     b88:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     b8c:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     b90:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
     b94:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
     b98:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
     b9c:	e12fff1e 	bx	lr

00000ba0 <sleep>:
     ba0:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
     ba4:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
     ba8:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
     bac:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
     bb0:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
     bb4:	e3a0000d 	mov	r0, #13
     bb8:	ef000040 	svc	0x00000040
     bbc:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     bc0:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     bc4:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
     bc8:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
     bcc:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
     bd0:	e12fff1e 	bx	lr

00000bd4 <uptime>:
     bd4:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
     bd8:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
     bdc:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
     be0:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
     be4:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
     be8:	e3a0000e 	mov	r0, #14
     bec:	ef000040 	svc	0x00000040
     bf0:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     bf4:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
     bf8:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
     bfc:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
     c00:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
     c04:	e12fff1e 	bx	lr

00000c08 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
     c08:	e92d4800 	push	{fp, lr}
     c0c:	e28db004 	add	fp, sp, #4
     c10:	e24dd008 	sub	sp, sp, #8
     c14:	e50b0008 	str	r0, [fp, #-8]
     c18:	e1a03001 	mov	r3, r1
     c1c:	e54b3009 	strb	r3, [fp, #-9]
  write(fd, &c, 1);
     c20:	e24b3009 	sub	r3, fp, #9
     c24:	e3a02001 	mov	r2, #1
     c28:	e1a01003 	mov	r1, r3
     c2c:	e51b0008 	ldr	r0, [fp, #-8]
     c30:	ebffff24 	bl	8c8 <write>
}
     c34:	e320f000 	nop	{0}
     c38:	e24bd004 	sub	sp, fp, #4
     c3c:	e8bd8800 	pop	{fp, pc}

00000c40 <div>:

u32 div(u32 n, u32 d)  // long division
{
     c40:	e52db004 	push	{fp}		@ (str fp, [sp, #-4]!)
     c44:	e28db000 	add	fp, sp, #0
     c48:	e24dd01c 	sub	sp, sp, #28
     c4c:	e50b0018 	str	r0, [fp, #-24]	@ 0xffffffe8
     c50:	e50b101c 	str	r1, [fp, #-28]	@ 0xffffffe4
    u32 q=0, r=0;
     c54:	e3a03000 	mov	r3, #0
     c58:	e50b3008 	str	r3, [fp, #-8]
     c5c:	e3a03000 	mov	r3, #0
     c60:	e50b300c 	str	r3, [fp, #-12]
    int i;

    for(i=31;i>=0;i--){
     c64:	e3a0301f 	mov	r3, #31
     c68:	e50b3010 	str	r3, [fp, #-16]
     c6c:	ea00001b 	b	ce0 <div+0xa0>
        r = r << 1;
     c70:	e51b300c 	ldr	r3, [fp, #-12]
     c74:	e1a03083 	lsl	r3, r3, #1
     c78:	e50b300c 	str	r3, [fp, #-12]
        r = r | ((n >> i) & 1);
     c7c:	e51b2018 	ldr	r2, [fp, #-24]	@ 0xffffffe8
     c80:	e51b3010 	ldr	r3, [fp, #-16]
     c84:	e1a03332 	lsr	r3, r2, r3
     c88:	e2033001 	and	r3, r3, #1
     c8c:	e51b200c 	ldr	r2, [fp, #-12]
     c90:	e1823003 	orr	r3, r2, r3
     c94:	e50b300c 	str	r3, [fp, #-12]
        if(r >= d) {
     c98:	e51b200c 	ldr	r2, [fp, #-12]
     c9c:	e51b301c 	ldr	r3, [fp, #-28]	@ 0xffffffe4
     ca0:	e1520003 	cmp	r2, r3
     ca4:	3a00000a 	bcc	cd4 <div+0x94>
            r = r - d;
     ca8:	e51b200c 	ldr	r2, [fp, #-12]
     cac:	e51b301c 	ldr	r3, [fp, #-28]	@ 0xffffffe4
     cb0:	e0423003 	sub	r3, r2, r3
     cb4:	e50b300c 	str	r3, [fp, #-12]
            q = q | (1 << i);
     cb8:	e3a02001 	mov	r2, #1
     cbc:	e51b3010 	ldr	r3, [fp, #-16]
     cc0:	e1a03312 	lsl	r3, r2, r3
     cc4:	e1a02003 	mov	r2, r3
     cc8:	e51b3008 	ldr	r3, [fp, #-8]
     ccc:	e1833002 	orr	r3, r3, r2
     cd0:	e50b3008 	str	r3, [fp, #-8]
    for(i=31;i>=0;i--){
     cd4:	e51b3010 	ldr	r3, [fp, #-16]
     cd8:	e2433001 	sub	r3, r3, #1
     cdc:	e50b3010 	str	r3, [fp, #-16]
     ce0:	e51b3010 	ldr	r3, [fp, #-16]
     ce4:	e3530000 	cmp	r3, #0
     ce8:	aaffffe0 	bge	c70 <div+0x30>
        }
    }
    return q;
     cec:	e51b3008 	ldr	r3, [fp, #-8]
}
     cf0:	e1a00003 	mov	r0, r3
     cf4:	e28bd000 	add	sp, fp, #0
     cf8:	e49db004 	pop	{fp}		@ (ldr fp, [sp], #4)
     cfc:	e12fff1e 	bx	lr

00000d00 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
     d00:	e92d4800 	push	{fp, lr}
     d04:	e28db004 	add	fp, sp, #4
     d08:	e24dd038 	sub	sp, sp, #56	@ 0x38
     d0c:	e50b0030 	str	r0, [fp, #-48]	@ 0xffffffd0
     d10:	e50b1034 	str	r1, [fp, #-52]	@ 0xffffffcc
     d14:	e50b2038 	str	r2, [fp, #-56]	@ 0xffffffc8
     d18:	e50b303c 	str	r3, [fp, #-60]	@ 0xffffffc4
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x, y, b;

  neg = 0;
     d1c:	e3a03000 	mov	r3, #0
     d20:	e50b300c 	str	r3, [fp, #-12]
  if(sgn && xx < 0){
     d24:	e51b303c 	ldr	r3, [fp, #-60]	@ 0xffffffc4
     d28:	e3530000 	cmp	r3, #0
     d2c:	0a000008 	beq	d54 <printint+0x54>
     d30:	e51b3034 	ldr	r3, [fp, #-52]	@ 0xffffffcc
     d34:	e3530000 	cmp	r3, #0
     d38:	aa000005 	bge	d54 <printint+0x54>
    neg = 1;
     d3c:	e3a03001 	mov	r3, #1
     d40:	e50b300c 	str	r3, [fp, #-12]
    x = -xx;
     d44:	e51b3034 	ldr	r3, [fp, #-52]	@ 0xffffffcc
     d48:	e2633000 	rsb	r3, r3, #0
     d4c:	e50b3010 	str	r3, [fp, #-16]
     d50:	ea000001 	b	d5c <printint+0x5c>
  } else {
    x = xx;
     d54:	e51b3034 	ldr	r3, [fp, #-52]	@ 0xffffffcc
     d58:	e50b3010 	str	r3, [fp, #-16]
  }

  b = base;
     d5c:	e51b3038 	ldr	r3, [fp, #-56]	@ 0xffffffc8
     d60:	e50b3014 	str	r3, [fp, #-20]	@ 0xffffffec
  i = 0;
     d64:	e3a03000 	mov	r3, #0
     d68:	e50b3008 	str	r3, [fp, #-8]
  do{
    y = div(x, b);
     d6c:	e51b1014 	ldr	r1, [fp, #-20]	@ 0xffffffec
     d70:	e51b0010 	ldr	r0, [fp, #-16]
     d74:	ebffffb1 	bl	c40 <div>
     d78:	e50b0018 	str	r0, [fp, #-24]	@ 0xffffffe8
    buf[i++] = digits[x - y * b];
     d7c:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
     d80:	e51b2014 	ldr	r2, [fp, #-20]	@ 0xffffffec
     d84:	e0030392 	mul	r3, r2, r3
     d88:	e51b2010 	ldr	r2, [fp, #-16]
     d8c:	e0421003 	sub	r1, r2, r3
     d90:	e51b2008 	ldr	r2, [fp, #-8]
     d94:	e2823001 	add	r3, r2, #1
     d98:	e50b3008 	str	r3, [fp, #-8]
     d9c:	e3013454 	movw	r3, #5204	@ 0x1454
     da0:	e3403000 	movt	r3, #0
     da4:	e7d31001 	ldrb	r1, [r3, r1]
     da8:	e2423004 	sub	r3, r2, #4
     dac:	e083300b 	add	r3, r3, fp
     db0:	e1a02001 	mov	r2, r1
     db4:	e5432024 	strb	r2, [r3, #-36]	@ 0xffffffdc
  }while((x = y) != 0);
     db8:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
     dbc:	e50b3010 	str	r3, [fp, #-16]
     dc0:	e51b3010 	ldr	r3, [fp, #-16]
     dc4:	e3530000 	cmp	r3, #0
     dc8:	1affffe7 	bne	d6c <printint+0x6c>
  if(neg)
     dcc:	e51b300c 	ldr	r3, [fp, #-12]
     dd0:	e3530000 	cmp	r3, #0
     dd4:	0a00000e 	beq	e14 <printint+0x114>
    buf[i++] = '-';
     dd8:	e51b3008 	ldr	r3, [fp, #-8]
     ddc:	e2832001 	add	r2, r3, #1
     de0:	e50b2008 	str	r2, [fp, #-8]
     de4:	e2433004 	sub	r3, r3, #4
     de8:	e083300b 	add	r3, r3, fp
     dec:	e3a0202d 	mov	r2, #45	@ 0x2d
     df0:	e5432024 	strb	r2, [r3, #-36]	@ 0xffffffdc

  while(--i >= 0)
     df4:	ea000006 	b	e14 <printint+0x114>
    putc(fd, buf[i]);
     df8:	e24b2028 	sub	r2, fp, #40	@ 0x28
     dfc:	e51b3008 	ldr	r3, [fp, #-8]
     e00:	e0823003 	add	r3, r2, r3
     e04:	e5d33000 	ldrb	r3, [r3]
     e08:	e1a01003 	mov	r1, r3
     e0c:	e51b0030 	ldr	r0, [fp, #-48]	@ 0xffffffd0
     e10:	ebffff7c 	bl	c08 <putc>
  while(--i >= 0)
     e14:	e51b3008 	ldr	r3, [fp, #-8]
     e18:	e2433001 	sub	r3, r3, #1
     e1c:	e50b3008 	str	r3, [fp, #-8]
     e20:	e51b3008 	ldr	r3, [fp, #-8]
     e24:	e3530000 	cmp	r3, #0
     e28:	aafffff2 	bge	df8 <printint+0xf8>
}
     e2c:	e320f000 	nop	{0}
     e30:	e320f000 	nop	{0}
     e34:	e24bd004 	sub	sp, fp, #4
     e38:	e8bd8800 	pop	{fp, pc}

00000e3c <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
     e3c:	e92d000e 	push	{r1, r2, r3}
     e40:	e92d4800 	push	{fp, lr}
     e44:	e28db004 	add	fp, sp, #4
     e48:	e24dd024 	sub	sp, sp, #36	@ 0x24
     e4c:	e50b0024 	str	r0, [fp, #-36]	@ 0xffffffdc
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
     e50:	e3a03000 	mov	r3, #0
     e54:	e50b3014 	str	r3, [fp, #-20]	@ 0xffffffec
  ap = (uint*)(void*)&fmt + 1;
     e58:	e28b3008 	add	r3, fp, #8
     e5c:	e50b3018 	str	r3, [fp, #-24]	@ 0xffffffe8
  for(i = 0; fmt[i]; i++){
     e60:	e3a03000 	mov	r3, #0
     e64:	e50b3010 	str	r3, [fp, #-16]
     e68:	ea000075 	b	1044 <printf+0x208>
    c = fmt[i] & 0xff;
     e6c:	e59b2004 	ldr	r2, [fp, #4]
     e70:	e51b3010 	ldr	r3, [fp, #-16]
     e74:	e0823003 	add	r3, r2, r3
     e78:	e5d33000 	ldrb	r3, [r3]
     e7c:	e50b301c 	str	r3, [fp, #-28]	@ 0xffffffe4
    if(state == 0){
     e80:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
     e84:	e3530000 	cmp	r3, #0
     e88:	1a00000b 	bne	ebc <printf+0x80>
      if(c == '%'){
     e8c:	e51b301c 	ldr	r3, [fp, #-28]	@ 0xffffffe4
     e90:	e3530025 	cmp	r3, #37	@ 0x25
     e94:	1a000002 	bne	ea4 <printf+0x68>
        state = '%';
     e98:	e3a03025 	mov	r3, #37	@ 0x25
     e9c:	e50b3014 	str	r3, [fp, #-20]	@ 0xffffffec
     ea0:	ea000064 	b	1038 <printf+0x1fc>
      } else {
        putc(fd, c);
     ea4:	e51b301c 	ldr	r3, [fp, #-28]	@ 0xffffffe4
     ea8:	e6ef3073 	uxtb	r3, r3
     eac:	e1a01003 	mov	r1, r3
     eb0:	e51b0024 	ldr	r0, [fp, #-36]	@ 0xffffffdc
     eb4:	ebffff53 	bl	c08 <putc>
     eb8:	ea00005e 	b	1038 <printf+0x1fc>
      }
    } else if(state == '%'){
     ebc:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
     ec0:	e3530025 	cmp	r3, #37	@ 0x25
     ec4:	1a00005b 	bne	1038 <printf+0x1fc>
      if(c == 'd'){
     ec8:	e51b301c 	ldr	r3, [fp, #-28]	@ 0xffffffe4
     ecc:	e3530064 	cmp	r3, #100	@ 0x64
     ed0:	1a00000a 	bne	f00 <printf+0xc4>
        printint(fd, *ap, 10, 1);
     ed4:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
     ed8:	e5933000 	ldr	r3, [r3]
     edc:	e1a01003 	mov	r1, r3
     ee0:	e3a03001 	mov	r3, #1
     ee4:	e3a0200a 	mov	r2, #10
     ee8:	e51b0024 	ldr	r0, [fp, #-36]	@ 0xffffffdc
     eec:	ebffff83 	bl	d00 <printint>
        ap++;
     ef0:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
     ef4:	e2833004 	add	r3, r3, #4
     ef8:	e50b3018 	str	r3, [fp, #-24]	@ 0xffffffe8
     efc:	ea00004b 	b	1030 <printf+0x1f4>
      } else if(c == 'x' || c == 'p'){
     f00:	e51b301c 	ldr	r3, [fp, #-28]	@ 0xffffffe4
     f04:	e3530078 	cmp	r3, #120	@ 0x78
     f08:	0a000002 	beq	f18 <printf+0xdc>
     f0c:	e51b301c 	ldr	r3, [fp, #-28]	@ 0xffffffe4
     f10:	e3530070 	cmp	r3, #112	@ 0x70
     f14:	1a00000a 	bne	f44 <printf+0x108>
        printint(fd, *ap, 16, 0);
     f18:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
     f1c:	e5933000 	ldr	r3, [r3]
     f20:	e1a01003 	mov	r1, r3
     f24:	e3a03000 	mov	r3, #0
     f28:	e3a02010 	mov	r2, #16
     f2c:	e51b0024 	ldr	r0, [fp, #-36]	@ 0xffffffdc
     f30:	ebffff72 	bl	d00 <printint>
        ap++;
     f34:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
     f38:	e2833004 	add	r3, r3, #4
     f3c:	e50b3018 	str	r3, [fp, #-24]	@ 0xffffffe8
     f40:	ea00003a 	b	1030 <printf+0x1f4>
      } else if(c == 's'){
     f44:	e51b301c 	ldr	r3, [fp, #-28]	@ 0xffffffe4
     f48:	e3530073 	cmp	r3, #115	@ 0x73
     f4c:	1a000019 	bne	fb8 <printf+0x17c>
        s = (char*)*ap;
     f50:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
     f54:	e5933000 	ldr	r3, [r3]
     f58:	e50b300c 	str	r3, [fp, #-12]
        ap++;
     f5c:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
     f60:	e2833004 	add	r3, r3, #4
     f64:	e50b3018 	str	r3, [fp, #-24]	@ 0xffffffe8
        if(s == 0)
     f68:	e51b300c 	ldr	r3, [fp, #-12]
     f6c:	e3530000 	cmp	r3, #0
     f70:	1a00000b 	bne	fa4 <printf+0x168>
          s = "(null)";
     f74:	e301344c 	movw	r3, #5196	@ 0x144c
     f78:	e3403000 	movt	r3, #0
     f7c:	e50b300c 	str	r3, [fp, #-12]
        while(*s != 0){
     f80:	ea000007 	b	fa4 <printf+0x168>
          putc(fd, *s);
     f84:	e51b300c 	ldr	r3, [fp, #-12]
     f88:	e5d33000 	ldrb	r3, [r3]
     f8c:	e1a01003 	mov	r1, r3
     f90:	e51b0024 	ldr	r0, [fp, #-36]	@ 0xffffffdc
     f94:	ebffff1b 	bl	c08 <putc>
          s++;
     f98:	e51b300c 	ldr	r3, [fp, #-12]
     f9c:	e2833001 	add	r3, r3, #1
     fa0:	e50b300c 	str	r3, [fp, #-12]
        while(*s != 0){
     fa4:	e51b300c 	ldr	r3, [fp, #-12]
     fa8:	e5d33000 	ldrb	r3, [r3]
     fac:	e3530000 	cmp	r3, #0
     fb0:	1afffff3 	bne	f84 <printf+0x148>
     fb4:	ea00001d 	b	1030 <printf+0x1f4>
        }
      } else if(c == 'c'){
     fb8:	e51b301c 	ldr	r3, [fp, #-28]	@ 0xffffffe4
     fbc:	e3530063 	cmp	r3, #99	@ 0x63
     fc0:	1a000009 	bne	fec <printf+0x1b0>
        putc(fd, *ap);
     fc4:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
     fc8:	e5933000 	ldr	r3, [r3]
     fcc:	e6ef3073 	uxtb	r3, r3
     fd0:	e1a01003 	mov	r1, r3
     fd4:	e51b0024 	ldr	r0, [fp, #-36]	@ 0xffffffdc
     fd8:	ebffff0a 	bl	c08 <putc>
        ap++;
     fdc:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
     fe0:	e2833004 	add	r3, r3, #4
     fe4:	e50b3018 	str	r3, [fp, #-24]	@ 0xffffffe8
     fe8:	ea000010 	b	1030 <printf+0x1f4>
      } else if(c == '%'){
     fec:	e51b301c 	ldr	r3, [fp, #-28]	@ 0xffffffe4
     ff0:	e3530025 	cmp	r3, #37	@ 0x25
     ff4:	1a000005 	bne	1010 <printf+0x1d4>
        putc(fd, c);
     ff8:	e51b301c 	ldr	r3, [fp, #-28]	@ 0xffffffe4
     ffc:	e6ef3073 	uxtb	r3, r3
    1000:	e1a01003 	mov	r1, r3
    1004:	e51b0024 	ldr	r0, [fp, #-36]	@ 0xffffffdc
    1008:	ebfffefe 	bl	c08 <putc>
    100c:	ea000007 	b	1030 <printf+0x1f4>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
    1010:	e3a01025 	mov	r1, #37	@ 0x25
    1014:	e51b0024 	ldr	r0, [fp, #-36]	@ 0xffffffdc
    1018:	ebfffefa 	bl	c08 <putc>
        putc(fd, c);
    101c:	e51b301c 	ldr	r3, [fp, #-28]	@ 0xffffffe4
    1020:	e6ef3073 	uxtb	r3, r3
    1024:	e1a01003 	mov	r1, r3
    1028:	e51b0024 	ldr	r0, [fp, #-36]	@ 0xffffffdc
    102c:	ebfffef5 	bl	c08 <putc>
      }
      state = 0;
    1030:	e3a03000 	mov	r3, #0
    1034:	e50b3014 	str	r3, [fp, #-20]	@ 0xffffffec
  for(i = 0; fmt[i]; i++){
    1038:	e51b3010 	ldr	r3, [fp, #-16]
    103c:	e2833001 	add	r3, r3, #1
    1040:	e50b3010 	str	r3, [fp, #-16]
    1044:	e59b2004 	ldr	r2, [fp, #4]
    1048:	e51b3010 	ldr	r3, [fp, #-16]
    104c:	e0823003 	add	r3, r2, r3
    1050:	e5d33000 	ldrb	r3, [r3]
    1054:	e3530000 	cmp	r3, #0
    1058:	1affff83 	bne	e6c <printf+0x30>
    }
  }
}
    105c:	e320f000 	nop	{0}
    1060:	e320f000 	nop	{0}
    1064:	e24bd004 	sub	sp, fp, #4
    1068:	e8bd4800 	pop	{fp, lr}
    106c:	e28dd00c 	add	sp, sp, #12
    1070:	e12fff1e 	bx	lr

00001074 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    1074:	e52db004 	push	{fp}		@ (str fp, [sp, #-4]!)
    1078:	e28db000 	add	fp, sp, #0
    107c:	e24dd014 	sub	sp, sp, #20
    1080:	e50b0010 	str	r0, [fp, #-16]
  Header *bp, *p;

  bp = (Header*)ap - 1;
    1084:	e51b3010 	ldr	r3, [fp, #-16]
    1088:	e2433008 	sub	r3, r3, #8
    108c:	e50b300c 	str	r3, [fp, #-12]
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1090:	e3013480 	movw	r3, #5248	@ 0x1480
    1094:	e3403000 	movt	r3, #0
    1098:	e5933000 	ldr	r3, [r3]
    109c:	e50b3008 	str	r3, [fp, #-8]
    10a0:	ea000010 	b	10e8 <free+0x74>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    10a4:	e51b3008 	ldr	r3, [fp, #-8]
    10a8:	e5933000 	ldr	r3, [r3]
    10ac:	e51b2008 	ldr	r2, [fp, #-8]
    10b0:	e1520003 	cmp	r2, r3
    10b4:	3a000008 	bcc	10dc <free+0x68>
    10b8:	e51b200c 	ldr	r2, [fp, #-12]
    10bc:	e51b3008 	ldr	r3, [fp, #-8]
    10c0:	e1520003 	cmp	r2, r3
    10c4:	8a000010 	bhi	110c <free+0x98>
    10c8:	e51b3008 	ldr	r3, [fp, #-8]
    10cc:	e5933000 	ldr	r3, [r3]
    10d0:	e51b200c 	ldr	r2, [fp, #-12]
    10d4:	e1520003 	cmp	r2, r3
    10d8:	3a00000b 	bcc	110c <free+0x98>
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    10dc:	e51b3008 	ldr	r3, [fp, #-8]
    10e0:	e5933000 	ldr	r3, [r3]
    10e4:	e50b3008 	str	r3, [fp, #-8]
    10e8:	e51b200c 	ldr	r2, [fp, #-12]
    10ec:	e51b3008 	ldr	r3, [fp, #-8]
    10f0:	e1520003 	cmp	r2, r3
    10f4:	9affffea 	bls	10a4 <free+0x30>
    10f8:	e51b3008 	ldr	r3, [fp, #-8]
    10fc:	e5933000 	ldr	r3, [r3]
    1100:	e51b200c 	ldr	r2, [fp, #-12]
    1104:	e1520003 	cmp	r2, r3
    1108:	2affffe5 	bcs	10a4 <free+0x30>
      break;
  if(bp + bp->s.size == p->s.ptr){
    110c:	e51b300c 	ldr	r3, [fp, #-12]
    1110:	e5933004 	ldr	r3, [r3, #4]
    1114:	e1a03183 	lsl	r3, r3, #3
    1118:	e51b200c 	ldr	r2, [fp, #-12]
    111c:	e0822003 	add	r2, r2, r3
    1120:	e51b3008 	ldr	r3, [fp, #-8]
    1124:	e5933000 	ldr	r3, [r3]
    1128:	e1520003 	cmp	r2, r3
    112c:	1a00000d 	bne	1168 <free+0xf4>
    bp->s.size += p->s.ptr->s.size;
    1130:	e51b300c 	ldr	r3, [fp, #-12]
    1134:	e5932004 	ldr	r2, [r3, #4]
    1138:	e51b3008 	ldr	r3, [fp, #-8]
    113c:	e5933000 	ldr	r3, [r3]
    1140:	e5933004 	ldr	r3, [r3, #4]
    1144:	e0822003 	add	r2, r2, r3
    1148:	e51b300c 	ldr	r3, [fp, #-12]
    114c:	e5832004 	str	r2, [r3, #4]
    bp->s.ptr = p->s.ptr->s.ptr;
    1150:	e51b3008 	ldr	r3, [fp, #-8]
    1154:	e5933000 	ldr	r3, [r3]
    1158:	e5932000 	ldr	r2, [r3]
    115c:	e51b300c 	ldr	r3, [fp, #-12]
    1160:	e5832000 	str	r2, [r3]
    1164:	ea000003 	b	1178 <free+0x104>
  } else
    bp->s.ptr = p->s.ptr;
    1168:	e51b3008 	ldr	r3, [fp, #-8]
    116c:	e5932000 	ldr	r2, [r3]
    1170:	e51b300c 	ldr	r3, [fp, #-12]
    1174:	e5832000 	str	r2, [r3]
  if(p + p->s.size == bp){
    1178:	e51b3008 	ldr	r3, [fp, #-8]
    117c:	e5933004 	ldr	r3, [r3, #4]
    1180:	e1a03183 	lsl	r3, r3, #3
    1184:	e51b2008 	ldr	r2, [fp, #-8]
    1188:	e0823003 	add	r3, r2, r3
    118c:	e51b200c 	ldr	r2, [fp, #-12]
    1190:	e1520003 	cmp	r2, r3
    1194:	1a00000b 	bne	11c8 <free+0x154>
    p->s.size += bp->s.size;
    1198:	e51b3008 	ldr	r3, [fp, #-8]
    119c:	e5932004 	ldr	r2, [r3, #4]
    11a0:	e51b300c 	ldr	r3, [fp, #-12]
    11a4:	e5933004 	ldr	r3, [r3, #4]
    11a8:	e0822003 	add	r2, r2, r3
    11ac:	e51b3008 	ldr	r3, [fp, #-8]
    11b0:	e5832004 	str	r2, [r3, #4]
    p->s.ptr = bp->s.ptr;
    11b4:	e51b300c 	ldr	r3, [fp, #-12]
    11b8:	e5932000 	ldr	r2, [r3]
    11bc:	e51b3008 	ldr	r3, [fp, #-8]
    11c0:	e5832000 	str	r2, [r3]
    11c4:	ea000002 	b	11d4 <free+0x160>
  } else
    p->s.ptr = bp;
    11c8:	e51b3008 	ldr	r3, [fp, #-8]
    11cc:	e51b200c 	ldr	r2, [fp, #-12]
    11d0:	e5832000 	str	r2, [r3]
  freep = p;
    11d4:	e3013480 	movw	r3, #5248	@ 0x1480
    11d8:	e3403000 	movt	r3, #0
    11dc:	e51b2008 	ldr	r2, [fp, #-8]
    11e0:	e5832000 	str	r2, [r3]
}
    11e4:	e320f000 	nop	{0}
    11e8:	e28bd000 	add	sp, fp, #0
    11ec:	e49db004 	pop	{fp}		@ (ldr fp, [sp], #4)
    11f0:	e12fff1e 	bx	lr

000011f4 <morecore>:

static Header*
morecore(uint nu)
{
    11f4:	e92d4800 	push	{fp, lr}
    11f8:	e28db004 	add	fp, sp, #4
    11fc:	e24dd010 	sub	sp, sp, #16
    1200:	e50b0010 	str	r0, [fp, #-16]
  char *p;
  Header *hp;

  if(nu < 4096)
    1204:	e51b3010 	ldr	r3, [fp, #-16]
    1208:	e3530a01 	cmp	r3, #4096	@ 0x1000
    120c:	2a000001 	bcs	1218 <morecore+0x24>
    nu = 4096;
    1210:	e3a03a01 	mov	r3, #4096	@ 0x1000
    1214:	e50b3010 	str	r3, [fp, #-16]
  p = sbrk(nu * sizeof(Header));
    1218:	e51b3010 	ldr	r3, [fp, #-16]
    121c:	e1a03183 	lsl	r3, r3, #3
    1220:	e1a00003 	mov	r0, r3
    1224:	ebfffe50 	bl	b6c <sbrk>
    1228:	e50b0008 	str	r0, [fp, #-8]
  if(p == (char*)-1)
    122c:	e51b3008 	ldr	r3, [fp, #-8]
    1230:	e3730001 	cmn	r3, #1
    1234:	1a000001 	bne	1240 <morecore+0x4c>
    return 0;
    1238:	e3a03000 	mov	r3, #0
    123c:	ea00000b 	b	1270 <morecore+0x7c>
  hp = (Header*)p;
    1240:	e51b3008 	ldr	r3, [fp, #-8]
    1244:	e50b300c 	str	r3, [fp, #-12]
  hp->s.size = nu;
    1248:	e51b300c 	ldr	r3, [fp, #-12]
    124c:	e51b2010 	ldr	r2, [fp, #-16]
    1250:	e5832004 	str	r2, [r3, #4]
  free((void*)(hp + 1));
    1254:	e51b300c 	ldr	r3, [fp, #-12]
    1258:	e2833008 	add	r3, r3, #8
    125c:	e1a00003 	mov	r0, r3
    1260:	ebffff83 	bl	1074 <free>
  return freep;
    1264:	e3013480 	movw	r3, #5248	@ 0x1480
    1268:	e3403000 	movt	r3, #0
    126c:	e5933000 	ldr	r3, [r3]
}
    1270:	e1a00003 	mov	r0, r3
    1274:	e24bd004 	sub	sp, fp, #4
    1278:	e8bd8800 	pop	{fp, pc}

0000127c <malloc>:

void*
malloc(uint nbytes)
{
    127c:	e92d4800 	push	{fp, lr}
    1280:	e28db004 	add	fp, sp, #4
    1284:	e24dd018 	sub	sp, sp, #24
    1288:	e50b0018 	str	r0, [fp, #-24]	@ 0xffffffe8
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    128c:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
    1290:	e2833007 	add	r3, r3, #7
    1294:	e1a031a3 	lsr	r3, r3, #3
    1298:	e2833001 	add	r3, r3, #1
    129c:	e50b3010 	str	r3, [fp, #-16]
  if((prevp = freep) == 0){
    12a0:	e3013480 	movw	r3, #5248	@ 0x1480
    12a4:	e3403000 	movt	r3, #0
    12a8:	e5933000 	ldr	r3, [r3]
    12ac:	e50b300c 	str	r3, [fp, #-12]
    12b0:	e51b300c 	ldr	r3, [fp, #-12]
    12b4:	e3530000 	cmp	r3, #0
    12b8:	1a000010 	bne	1300 <malloc+0x84>
    base.s.ptr = freep = prevp = &base;
    12bc:	e3013478 	movw	r3, #5240	@ 0x1478
    12c0:	e3403000 	movt	r3, #0
    12c4:	e50b300c 	str	r3, [fp, #-12]
    12c8:	e3013480 	movw	r3, #5248	@ 0x1480
    12cc:	e3403000 	movt	r3, #0
    12d0:	e51b200c 	ldr	r2, [fp, #-12]
    12d4:	e5832000 	str	r2, [r3]
    12d8:	e3013480 	movw	r3, #5248	@ 0x1480
    12dc:	e3403000 	movt	r3, #0
    12e0:	e5932000 	ldr	r2, [r3]
    12e4:	e3013478 	movw	r3, #5240	@ 0x1478
    12e8:	e3403000 	movt	r3, #0
    12ec:	e5832000 	str	r2, [r3]
    base.s.size = 0;
    12f0:	e3013478 	movw	r3, #5240	@ 0x1478
    12f4:	e3403000 	movt	r3, #0
    12f8:	e3a02000 	mov	r2, #0
    12fc:	e5832004 	str	r2, [r3, #4]
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1300:	e51b300c 	ldr	r3, [fp, #-12]
    1304:	e5933000 	ldr	r3, [r3]
    1308:	e50b3008 	str	r3, [fp, #-8]
    if(p->s.size >= nunits){
    130c:	e51b3008 	ldr	r3, [fp, #-8]
    1310:	e5933004 	ldr	r3, [r3, #4]
    1314:	e51b2010 	ldr	r2, [fp, #-16]
    1318:	e1520003 	cmp	r2, r3
    131c:	8a00001f 	bhi	13a0 <malloc+0x124>
      if(p->s.size == nunits)
    1320:	e51b3008 	ldr	r3, [fp, #-8]
    1324:	e5933004 	ldr	r3, [r3, #4]
    1328:	e51b2010 	ldr	r2, [fp, #-16]
    132c:	e1520003 	cmp	r2, r3
    1330:	1a000004 	bne	1348 <malloc+0xcc>
        prevp->s.ptr = p->s.ptr;
    1334:	e51b3008 	ldr	r3, [fp, #-8]
    1338:	e5932000 	ldr	r2, [r3]
    133c:	e51b300c 	ldr	r3, [fp, #-12]
    1340:	e5832000 	str	r2, [r3]
    1344:	ea00000e 	b	1384 <malloc+0x108>
      else {
        p->s.size -= nunits;
    1348:	e51b3008 	ldr	r3, [fp, #-8]
    134c:	e5932004 	ldr	r2, [r3, #4]
    1350:	e51b3010 	ldr	r3, [fp, #-16]
    1354:	e0422003 	sub	r2, r2, r3
    1358:	e51b3008 	ldr	r3, [fp, #-8]
    135c:	e5832004 	str	r2, [r3, #4]
        p += p->s.size;
    1360:	e51b3008 	ldr	r3, [fp, #-8]
    1364:	e5933004 	ldr	r3, [r3, #4]
    1368:	e1a03183 	lsl	r3, r3, #3
    136c:	e51b2008 	ldr	r2, [fp, #-8]
    1370:	e0823003 	add	r3, r2, r3
    1374:	e50b3008 	str	r3, [fp, #-8]
        p->s.size = nunits;
    1378:	e51b3008 	ldr	r3, [fp, #-8]
    137c:	e51b2010 	ldr	r2, [fp, #-16]
    1380:	e5832004 	str	r2, [r3, #4]
      }
      freep = prevp;
    1384:	e3013480 	movw	r3, #5248	@ 0x1480
    1388:	e3403000 	movt	r3, #0
    138c:	e51b200c 	ldr	r2, [fp, #-12]
    1390:	e5832000 	str	r2, [r3]
      return (void*)(p + 1);
    1394:	e51b3008 	ldr	r3, [fp, #-8]
    1398:	e2833008 	add	r3, r3, #8
    139c:	ea000013 	b	13f0 <malloc+0x174>
    }
    if(p == freep)
    13a0:	e3013480 	movw	r3, #5248	@ 0x1480
    13a4:	e3403000 	movt	r3, #0
    13a8:	e5933000 	ldr	r3, [r3]
    13ac:	e51b2008 	ldr	r2, [fp, #-8]
    13b0:	e1520003 	cmp	r2, r3
    13b4:	1a000007 	bne	13d8 <malloc+0x15c>
      if((p = morecore(nunits)) == 0)
    13b8:	e51b0010 	ldr	r0, [fp, #-16]
    13bc:	ebffff8c 	bl	11f4 <morecore>
    13c0:	e50b0008 	str	r0, [fp, #-8]
    13c4:	e51b3008 	ldr	r3, [fp, #-8]
    13c8:	e3530000 	cmp	r3, #0
    13cc:	1a000001 	bne	13d8 <malloc+0x15c>
        return 0;
    13d0:	e3a03000 	mov	r3, #0
    13d4:	ea000005 	b	13f0 <malloc+0x174>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    13d8:	e51b3008 	ldr	r3, [fp, #-8]
    13dc:	e50b300c 	str	r3, [fp, #-12]
    13e0:	e51b3008 	ldr	r3, [fp, #-8]
    13e4:	e5933000 	ldr	r3, [r3]
    13e8:	e50b3008 	str	r3, [fp, #-8]
    if(p->s.size >= nunits){
    13ec:	eaffffc6 	b	130c <malloc+0x90>
  }
}
    13f0:	e1a00003 	mov	r0, r3
    13f4:	e24bd004 	sub	sp, fp, #4
    13f8:	e8bd8800 	pop	{fp, pc}
