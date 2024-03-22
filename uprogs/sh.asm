
_sh:     file format elf32-littlearm


Disassembly of section .text:

00000000 <runcmd>:
struct cmd *parsecmd(char*);

// Execute cmd.  Never returns.
void
runcmd(struct cmd *cmd)
{
       0:	e92d4800 	push	{fp, lr}
       4:	e28db004 	add	fp, sp, #4
       8:	e24dd028 	sub	sp, sp, #40	@ 0x28
       c:	e50b0028 	str	r0, [fp, #-40]	@ 0xffffffd8
  struct execcmd *ecmd;
  struct listcmd *lcmd;
  struct pipecmd *pcmd;
  struct redircmd *rcmd;

  if(cmd == 0)
      10:	e51b3028 	ldr	r3, [fp, #-40]	@ 0xffffffd8
      14:	e3530000 	cmp	r3, #0
      18:	1a000000 	bne	20 <runcmd+0x20>
    exit();
      1c:	eb00052a 	bl	14cc <exit>
  
  switch(cmd->type){
      20:	e51b3028 	ldr	r3, [fp, #-40]	@ 0xffffffd8
      24:	e5933000 	ldr	r3, [r3]
      28:	e2433001 	sub	r3, r3, #1
      2c:	e3530004 	cmp	r3, #4
      30:	979ff103 	ldrls	pc, [pc, r3, lsl #2]
      34:	ea000004 	b	4c <runcmd+0x4c>
      38:	00000058 	.word	0x00000058
      3c:	000000b0 	.word	0x000000b0
      40:	00000164 	.word	0x00000164
      44:	00000124 	.word	0x00000124
      48:	0000024c 	.word	0x0000024c
  default:
    panic("runcmd");
      4c:	e30200d0 	movw	r0, #8400	@ 0x20d0
      50:	e3400000 	movt	r0, #0
      54:	eb0000f1 	bl	420 <panic>

  case EXEC:
    ecmd = (struct execcmd*)cmd;
      58:	e51b3028 	ldr	r3, [fp, #-40]	@ 0xffffffd8
      5c:	e50b3018 	str	r3, [fp, #-24]	@ 0xffffffe8
    if(ecmd->argv[0] == 0)
      60:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
      64:	e5933004 	ldr	r3, [r3, #4]
      68:	e3530000 	cmp	r3, #0
      6c:	1a000000 	bne	74 <runcmd+0x74>
      exit();
      70:	eb000515 	bl	14cc <exit>
    exec(ecmd->argv[0], ecmd->argv);
      74:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
      78:	e5932004 	ldr	r2, [r3, #4]
      7c:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
      80:	e2833004 	add	r3, r3, #4
      84:	e1a01003 	mov	r1, r3
      88:	e1a00002 	mov	r0, r2
      8c:	eb000569 	bl	1638 <exec>
    printf(2, "exec %s failed\n", ecmd->argv[0]);
      90:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
      94:	e5933004 	ldr	r3, [r3, #4]
      98:	e1a02003 	mov	r2, r3
      9c:	e30210d8 	movw	r1, #8408	@ 0x20d8
      a0:	e3401000 	movt	r1, #0
      a4:	e3a00002 	mov	r0, #2
      a8:	eb000698 	bl	1b10 <printf>
    break;
      ac:	ea000071 	b	278 <runcmd+0x278>

  case REDIR:
    rcmd = (struct redircmd*)cmd;
      b0:	e51b3028 	ldr	r3, [fp, #-40]	@ 0xffffffd8
      b4:	e50b3014 	str	r3, [fp, #-20]	@ 0xffffffec
    close(rcmd->fd);
      b8:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
      bc:	e5933014 	ldr	r3, [r3, #20]
      c0:	e1a00003 	mov	r0, r3
      c4:	eb000541 	bl	15d0 <close>
    if(open(rcmd->file, rcmd->mode) < 0){
      c8:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
      cc:	e5932008 	ldr	r2, [r3, #8]
      d0:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
      d4:	e5933010 	ldr	r3, [r3, #16]
      d8:	e1a01003 	mov	r1, r3
      dc:	e1a00002 	mov	r0, r2
      e0:	eb000561 	bl	166c <open>
      e4:	e1a03000 	mov	r3, r0
      e8:	e3530000 	cmp	r3, #0
      ec:	aa000007 	bge	110 <runcmd+0x110>
      printf(2, "open %s failed\n", rcmd->file);
      f0:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
      f4:	e5933008 	ldr	r3, [r3, #8]
      f8:	e1a02003 	mov	r2, r3
      fc:	e30210e8 	movw	r1, #8424	@ 0x20e8
     100:	e3401000 	movt	r1, #0
     104:	e3a00002 	mov	r0, #2
     108:	eb000680 	bl	1b10 <printf>
      exit();
     10c:	eb0004ee 	bl	14cc <exit>
    }
    runcmd(rcmd->cmd);
     110:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
     114:	e5933004 	ldr	r3, [r3, #4]
     118:	e1a00003 	mov	r0, r3
     11c:	ebffffb7 	bl	0 <runcmd>
    break;
     120:	ea000054 	b	278 <runcmd+0x278>

  case LIST:
    lcmd = (struct listcmd*)cmd;
     124:	e51b3028 	ldr	r3, [fp, #-40]	@ 0xffffffd8
     128:	e50b300c 	str	r3, [fp, #-12]
    if(fork1() == 0)
     12c:	eb0000c5 	bl	448 <fork1>
     130:	e1a03000 	mov	r3, r0
     134:	e3530000 	cmp	r3, #0
     138:	1a000003 	bne	14c <runcmd+0x14c>
      runcmd(lcmd->left);
     13c:	e51b300c 	ldr	r3, [fp, #-12]
     140:	e5933004 	ldr	r3, [r3, #4]
     144:	e1a00003 	mov	r0, r3
     148:	ebffffac 	bl	0 <runcmd>
    wait();
     14c:	eb0004eb 	bl	1500 <wait>
    runcmd(lcmd->right);
     150:	e51b300c 	ldr	r3, [fp, #-12]
     154:	e5933008 	ldr	r3, [r3, #8]
     158:	e1a00003 	mov	r0, r3
     15c:	ebffffa7 	bl	0 <runcmd>
    break;
     160:	ea000044 	b	278 <runcmd+0x278>

  case PIPE:
    pcmd = (struct pipecmd*)cmd;
     164:	e51b3028 	ldr	r3, [fp, #-40]	@ 0xffffffd8
     168:	e50b3010 	str	r3, [fp, #-16]
    if(pipe(p) < 0)
     16c:	e24b3020 	sub	r3, fp, #32
     170:	e1a00003 	mov	r0, r3
     174:	eb0004ee 	bl	1534 <pipe>
     178:	e1a03000 	mov	r3, r0
     17c:	e3530000 	cmp	r3, #0
     180:	aa000002 	bge	190 <runcmd+0x190>
      panic("pipe");
     184:	e30200f8 	movw	r0, #8440	@ 0x20f8
     188:	e3400000 	movt	r0, #0
     18c:	eb0000a3 	bl	420 <panic>
    if(fork1() == 0){
     190:	eb0000ac 	bl	448 <fork1>
     194:	e1a03000 	mov	r3, r0
     198:	e3530000 	cmp	r3, #0
     19c:	1a00000e 	bne	1dc <runcmd+0x1dc>
      close(1);
     1a0:	e3a00001 	mov	r0, #1
     1a4:	eb000509 	bl	15d0 <close>
      dup(p[1]);
     1a8:	e51b301c 	ldr	r3, [fp, #-28]	@ 0xffffffe4
     1ac:	e1a00003 	mov	r0, r3
     1b0:	eb000588 	bl	17d8 <dup>
      close(p[0]);
     1b4:	e51b3020 	ldr	r3, [fp, #-32]	@ 0xffffffe0
     1b8:	e1a00003 	mov	r0, r3
     1bc:	eb000503 	bl	15d0 <close>
      close(p[1]);
     1c0:	e51b301c 	ldr	r3, [fp, #-28]	@ 0xffffffe4
     1c4:	e1a00003 	mov	r0, r3
     1c8:	eb000500 	bl	15d0 <close>
      runcmd(pcmd->left);
     1cc:	e51b3010 	ldr	r3, [fp, #-16]
     1d0:	e5933004 	ldr	r3, [r3, #4]
     1d4:	e1a00003 	mov	r0, r3
     1d8:	ebffff88 	bl	0 <runcmd>
    }
    if(fork1() == 0){
     1dc:	eb000099 	bl	448 <fork1>
     1e0:	e1a03000 	mov	r3, r0
     1e4:	e3530000 	cmp	r3, #0
     1e8:	1a00000e 	bne	228 <runcmd+0x228>
      close(0);
     1ec:	e3a00000 	mov	r0, #0
     1f0:	eb0004f6 	bl	15d0 <close>
      dup(p[0]);
     1f4:	e51b3020 	ldr	r3, [fp, #-32]	@ 0xffffffe0
     1f8:	e1a00003 	mov	r0, r3
     1fc:	eb000575 	bl	17d8 <dup>
      close(p[0]);
     200:	e51b3020 	ldr	r3, [fp, #-32]	@ 0xffffffe0
     204:	e1a00003 	mov	r0, r3
     208:	eb0004f0 	bl	15d0 <close>
      close(p[1]);
     20c:	e51b301c 	ldr	r3, [fp, #-28]	@ 0xffffffe4
     210:	e1a00003 	mov	r0, r3
     214:	eb0004ed 	bl	15d0 <close>
      runcmd(pcmd->right);
     218:	e51b3010 	ldr	r3, [fp, #-16]
     21c:	e5933008 	ldr	r3, [r3, #8]
     220:	e1a00003 	mov	r0, r3
     224:	ebffff75 	bl	0 <runcmd>
    }
    close(p[0]);
     228:	e51b3020 	ldr	r3, [fp, #-32]	@ 0xffffffe0
     22c:	e1a00003 	mov	r0, r3
     230:	eb0004e6 	bl	15d0 <close>
    close(p[1]);
     234:	e51b301c 	ldr	r3, [fp, #-28]	@ 0xffffffe4
     238:	e1a00003 	mov	r0, r3
     23c:	eb0004e3 	bl	15d0 <close>
    wait();
     240:	eb0004ae 	bl	1500 <wait>
    wait();
     244:	eb0004ad 	bl	1500 <wait>
    break;
     248:	ea00000a 	b	278 <runcmd+0x278>
    
  case BACK:
    bcmd = (struct backcmd*)cmd;
     24c:	e51b3028 	ldr	r3, [fp, #-40]	@ 0xffffffd8
     250:	e50b3008 	str	r3, [fp, #-8]
    if(fork1() == 0)
     254:	eb00007b 	bl	448 <fork1>
     258:	e1a03000 	mov	r3, r0
     25c:	e3530000 	cmp	r3, #0
     260:	1a000003 	bne	274 <runcmd+0x274>
      runcmd(bcmd->cmd);
     264:	e51b3008 	ldr	r3, [fp, #-8]
     268:	e5933004 	ldr	r3, [r3, #4]
     26c:	e1a00003 	mov	r0, r3
     270:	ebffff62 	bl	0 <runcmd>
    break;
     274:	e320f000 	nop	{0}
  }
  exit();
     278:	eb000493 	bl	14cc <exit>

0000027c <getcmd>:
}

int
getcmd(char *buf, int nbuf)
{
     27c:	e92d4800 	push	{fp, lr}
     280:	e28db004 	add	fp, sp, #4
     284:	e24dd008 	sub	sp, sp, #8
     288:	e50b0008 	str	r0, [fp, #-8]
     28c:	e50b100c 	str	r1, [fp, #-12]
  printf(2, "$ ");
     290:	e3021100 	movw	r1, #8448	@ 0x2100
     294:	e3401000 	movt	r1, #0
     298:	e3a00002 	mov	r0, #2
     29c:	eb00061b 	bl	1b10 <printf>
  memset(buf, 0, nbuf);
     2a0:	e51b300c 	ldr	r3, [fp, #-12]
     2a4:	e1a02003 	mov	r2, r3
     2a8:	e3a01000 	mov	r1, #0
     2ac:	e51b0008 	ldr	r0, [fp, #-8]
     2b0:	eb0003c1 	bl	11bc <memset>
  gets(buf, nbuf);
     2b4:	e51b100c 	ldr	r1, [fp, #-12]
     2b8:	e51b0008 	ldr	r0, [fp, #-8]
     2bc:	eb0003f3 	bl	1290 <gets>
  if(buf[0] == 0) // EOF
     2c0:	e51b3008 	ldr	r3, [fp, #-8]
     2c4:	e5d33000 	ldrb	r3, [r3]
     2c8:	e3530000 	cmp	r3, #0
     2cc:	1a000001 	bne	2d8 <getcmd+0x5c>
    return -1;
     2d0:	e3e03000 	mvn	r3, #0
     2d4:	ea000000 	b	2dc <getcmd+0x60>
  return 0;
     2d8:	e3a03000 	mov	r3, #0
}
     2dc:	e1a00003 	mov	r0, r3
     2e0:	e24bd004 	sub	sp, fp, #4
     2e4:	e8bd8800 	pop	{fp, pc}

000002e8 <main>:

int
main(void)
{
     2e8:	e92d4800 	push	{fp, lr}
     2ec:	e28db004 	add	fp, sp, #4
     2f0:	e24dd008 	sub	sp, sp, #8
  static char buf[100];
  int fd;
  
  // Assumes three file descriptors open.
  while((fd = open("console", O_RDWR)) >= 0){
     2f4:	ea000005 	b	310 <main+0x28>
    if(fd >= 3){
     2f8:	e51b3008 	ldr	r3, [fp, #-8]
     2fc:	e3530002 	cmp	r3, #2
     300:	da000002 	ble	310 <main+0x28>
      close(fd);
     304:	e51b0008 	ldr	r0, [fp, #-8]
     308:	eb0004b0 	bl	15d0 <close>
      break;
     30c:	ea000007 	b	330 <main+0x48>
  while((fd = open("console", O_RDWR)) >= 0){
     310:	e3a01002 	mov	r1, #2
     314:	e3020104 	movw	r0, #8452	@ 0x2104
     318:	e3400000 	movt	r0, #0
     31c:	eb0004d2 	bl	166c <open>
     320:	e50b0008 	str	r0, [fp, #-8]
     324:	e51b3008 	ldr	r3, [fp, #-8]
     328:	e3530000 	cmp	r3, #0
     32c:	aafffff1 	bge	2f8 <main+0x10>
    }
  }
  
  // Read and run input commands.
  while(getcmd(buf, sizeof(buf)) >= 0){
     330:	ea000031 	b	3fc <main+0x114>
    if(buf[0] == 'c' && buf[1] == 'd' && buf[2] == ' '){
     334:	e30231e0 	movw	r3, #8672	@ 0x21e0
     338:	e3403000 	movt	r3, #0
     33c:	e5d33000 	ldrb	r3, [r3]
     340:	e3530063 	cmp	r3, #99	@ 0x63
     344:	1a00001f 	bne	3c8 <main+0xe0>
     348:	e30231e0 	movw	r3, #8672	@ 0x21e0
     34c:	e3403000 	movt	r3, #0
     350:	e5d33001 	ldrb	r3, [r3, #1]
     354:	e3530064 	cmp	r3, #100	@ 0x64
     358:	1a00001a 	bne	3c8 <main+0xe0>
     35c:	e30231e0 	movw	r3, #8672	@ 0x21e0
     360:	e3403000 	movt	r3, #0
     364:	e5d33002 	ldrb	r3, [r3, #2]
     368:	e3530020 	cmp	r3, #32
     36c:	1a000015 	bne	3c8 <main+0xe0>
      // Clumsy but will have to do for now.
      // Chdir has no effect on the parent if run in the child.
      buf[strlen(buf)-1] = 0;  // chop \n
     370:	e30201e0 	movw	r0, #8672	@ 0x21e0
     374:	e3400000 	movt	r0, #0
     378:	eb00037a 	bl	1168 <strlen>
     37c:	e1a03000 	mov	r3, r0
     380:	e2432001 	sub	r2, r3, #1
     384:	e30231e0 	movw	r3, #8672	@ 0x21e0
     388:	e3403000 	movt	r3, #0
     38c:	e3a01000 	mov	r1, #0
     390:	e7c31002 	strb	r1, [r3, r2]
      if(chdir(buf+3) < 0)
     394:	e59f3080 	ldr	r3, [pc, #128]	@ 41c <main+0x134>
     398:	e1a00003 	mov	r0, r3
     39c:	eb000500 	bl	17a4 <chdir>
     3a0:	e1a03000 	mov	r3, r0
     3a4:	e3530000 	cmp	r3, #0
     3a8:	aa000012 	bge	3f8 <main+0x110>
        printf(2, "cannot cd %s\n", buf+3);
     3ac:	e59f3068 	ldr	r3, [pc, #104]	@ 41c <main+0x134>
     3b0:	e1a02003 	mov	r2, r3
     3b4:	e302110c 	movw	r1, #8460	@ 0x210c
     3b8:	e3401000 	movt	r1, #0
     3bc:	e3a00002 	mov	r0, #2
     3c0:	eb0005d2 	bl	1b10 <printf>
      continue;
     3c4:	ea00000b 	b	3f8 <main+0x110>
    }
    if(fork1() == 0)
     3c8:	eb00001e 	bl	448 <fork1>
     3cc:	e1a03000 	mov	r3, r0
     3d0:	e3530000 	cmp	r3, #0
     3d4:	1a000005 	bne	3f0 <main+0x108>
      runcmd(parsecmd(buf));
     3d8:	e30201e0 	movw	r0, #8672	@ 0x21e0
     3dc:	e3400000 	movt	r0, #0
     3e0:	eb000172 	bl	9b0 <parsecmd>
     3e4:	e1a03000 	mov	r3, r0
     3e8:	e1a00003 	mov	r0, r3
     3ec:	ebffff03 	bl	0 <runcmd>
    wait();
     3f0:	eb000442 	bl	1500 <wait>
     3f4:	ea000000 	b	3fc <main+0x114>
      continue;
     3f8:	e320f000 	nop	{0}
  while(getcmd(buf, sizeof(buf)) >= 0){
     3fc:	e3a01064 	mov	r1, #100	@ 0x64
     400:	e30201e0 	movw	r0, #8672	@ 0x21e0
     404:	e3400000 	movt	r0, #0
     408:	ebffff9b 	bl	27c <getcmd>
     40c:	e1a03000 	mov	r3, r0
     410:	e3530000 	cmp	r3, #0
     414:	aaffffc6 	bge	334 <main+0x4c>
  }
  exit();
     418:	eb00042b 	bl	14cc <exit>
     41c:	000021e3 	.word	0x000021e3

00000420 <panic>:
}

void
panic(char *s)
{
     420:	e92d4800 	push	{fp, lr}
     424:	e28db004 	add	fp, sp, #4
     428:	e24dd008 	sub	sp, sp, #8
     42c:	e50b0008 	str	r0, [fp, #-8]
  printf(2, "%s\n", s);
     430:	e51b2008 	ldr	r2, [fp, #-8]
     434:	e302111c 	movw	r1, #8476	@ 0x211c
     438:	e3401000 	movt	r1, #0
     43c:	e3a00002 	mov	r0, #2
     440:	eb0005b2 	bl	1b10 <printf>
  exit();
     444:	eb000420 	bl	14cc <exit>

00000448 <fork1>:
}

int
fork1(void)
{
     448:	e92d4800 	push	{fp, lr}
     44c:	e28db004 	add	fp, sp, #4
     450:	e24dd008 	sub	sp, sp, #8
  int pid;
  
  pid = fork();
     454:	eb00040f 	bl	1498 <fork>
     458:	e50b0008 	str	r0, [fp, #-8]
  if(pid == -1)
     45c:	e51b3008 	ldr	r3, [fp, #-8]
     460:	e3730001 	cmn	r3, #1
     464:	1a000002 	bne	474 <fork1+0x2c>
    panic("fork");
     468:	e3020120 	movw	r0, #8480	@ 0x2120
     46c:	e3400000 	movt	r0, #0
     470:	ebffffea 	bl	420 <panic>
  return pid;
     474:	e51b3008 	ldr	r3, [fp, #-8]
}
     478:	e1a00003 	mov	r0, r3
     47c:	e24bd004 	sub	sp, fp, #4
     480:	e8bd8800 	pop	{fp, pc}

00000484 <execcmd>:
//PAGEBREAK!
// Constructors

struct cmd*
execcmd(void)
{
     484:	e92d4800 	push	{fp, lr}
     488:	e28db004 	add	fp, sp, #4
     48c:	e24dd008 	sub	sp, sp, #8
  struct execcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     490:	e3a00054 	mov	r0, #84	@ 0x54
     494:	eb0006ad 	bl	1f50 <malloc>
     498:	e50b0008 	str	r0, [fp, #-8]
  memset(cmd, 0, sizeof(*cmd));
     49c:	e3a02054 	mov	r2, #84	@ 0x54
     4a0:	e3a01000 	mov	r1, #0
     4a4:	e51b0008 	ldr	r0, [fp, #-8]
     4a8:	eb000343 	bl	11bc <memset>
  cmd->type = EXEC;
     4ac:	e51b3008 	ldr	r3, [fp, #-8]
     4b0:	e3a02001 	mov	r2, #1
     4b4:	e5832000 	str	r2, [r3]
  return (struct cmd*)cmd;
     4b8:	e51b3008 	ldr	r3, [fp, #-8]
}
     4bc:	e1a00003 	mov	r0, r3
     4c0:	e24bd004 	sub	sp, fp, #4
     4c4:	e8bd8800 	pop	{fp, pc}

000004c8 <redircmd>:

struct cmd*
redircmd(struct cmd *subcmd, char *file, char *efile, int mode, int fd)
{
     4c8:	e92d4800 	push	{fp, lr}
     4cc:	e28db004 	add	fp, sp, #4
     4d0:	e24dd018 	sub	sp, sp, #24
     4d4:	e50b0010 	str	r0, [fp, #-16]
     4d8:	e50b1014 	str	r1, [fp, #-20]	@ 0xffffffec
     4dc:	e50b2018 	str	r2, [fp, #-24]	@ 0xffffffe8
     4e0:	e50b301c 	str	r3, [fp, #-28]	@ 0xffffffe4
  struct redircmd *cmd;

  cmd = malloc(sizeof(*cmd));
     4e4:	e3a00018 	mov	r0, #24
     4e8:	eb000698 	bl	1f50 <malloc>
     4ec:	e50b0008 	str	r0, [fp, #-8]
  memset(cmd, 0, sizeof(*cmd));
     4f0:	e3a02018 	mov	r2, #24
     4f4:	e3a01000 	mov	r1, #0
     4f8:	e51b0008 	ldr	r0, [fp, #-8]
     4fc:	eb00032e 	bl	11bc <memset>
  cmd->type = REDIR;
     500:	e51b3008 	ldr	r3, [fp, #-8]
     504:	e3a02002 	mov	r2, #2
     508:	e5832000 	str	r2, [r3]
  cmd->cmd = subcmd;
     50c:	e51b3008 	ldr	r3, [fp, #-8]
     510:	e51b2010 	ldr	r2, [fp, #-16]
     514:	e5832004 	str	r2, [r3, #4]
  cmd->file = file;
     518:	e51b3008 	ldr	r3, [fp, #-8]
     51c:	e51b2014 	ldr	r2, [fp, #-20]	@ 0xffffffec
     520:	e5832008 	str	r2, [r3, #8]
  cmd->efile = efile;
     524:	e51b3008 	ldr	r3, [fp, #-8]
     528:	e51b2018 	ldr	r2, [fp, #-24]	@ 0xffffffe8
     52c:	e583200c 	str	r2, [r3, #12]
  cmd->mode = mode;
     530:	e51b3008 	ldr	r3, [fp, #-8]
     534:	e51b201c 	ldr	r2, [fp, #-28]	@ 0xffffffe4
     538:	e5832010 	str	r2, [r3, #16]
  cmd->fd = fd;
     53c:	e51b3008 	ldr	r3, [fp, #-8]
     540:	e59b2004 	ldr	r2, [fp, #4]
     544:	e5832014 	str	r2, [r3, #20]
  return (struct cmd*)cmd;
     548:	e51b3008 	ldr	r3, [fp, #-8]
}
     54c:	e1a00003 	mov	r0, r3
     550:	e24bd004 	sub	sp, fp, #4
     554:	e8bd8800 	pop	{fp, pc}

00000558 <pipecmd>:

struct cmd*
pipecmd(struct cmd *left, struct cmd *right)
{
     558:	e92d4800 	push	{fp, lr}
     55c:	e28db004 	add	fp, sp, #4
     560:	e24dd010 	sub	sp, sp, #16
     564:	e50b0010 	str	r0, [fp, #-16]
     568:	e50b1014 	str	r1, [fp, #-20]	@ 0xffffffec
  struct pipecmd *cmd;

  cmd = malloc(sizeof(*cmd));
     56c:	e3a0000c 	mov	r0, #12
     570:	eb000676 	bl	1f50 <malloc>
     574:	e50b0008 	str	r0, [fp, #-8]
  memset(cmd, 0, sizeof(*cmd));
     578:	e3a0200c 	mov	r2, #12
     57c:	e3a01000 	mov	r1, #0
     580:	e51b0008 	ldr	r0, [fp, #-8]
     584:	eb00030c 	bl	11bc <memset>
  cmd->type = PIPE;
     588:	e51b3008 	ldr	r3, [fp, #-8]
     58c:	e3a02003 	mov	r2, #3
     590:	e5832000 	str	r2, [r3]
  cmd->left = left;
     594:	e51b3008 	ldr	r3, [fp, #-8]
     598:	e51b2010 	ldr	r2, [fp, #-16]
     59c:	e5832004 	str	r2, [r3, #4]
  cmd->right = right;
     5a0:	e51b3008 	ldr	r3, [fp, #-8]
     5a4:	e51b2014 	ldr	r2, [fp, #-20]	@ 0xffffffec
     5a8:	e5832008 	str	r2, [r3, #8]
  return (struct cmd*)cmd;
     5ac:	e51b3008 	ldr	r3, [fp, #-8]
}
     5b0:	e1a00003 	mov	r0, r3
     5b4:	e24bd004 	sub	sp, fp, #4
     5b8:	e8bd8800 	pop	{fp, pc}

000005bc <listcmd>:

struct cmd*
listcmd(struct cmd *left, struct cmd *right)
{
     5bc:	e92d4800 	push	{fp, lr}
     5c0:	e28db004 	add	fp, sp, #4
     5c4:	e24dd010 	sub	sp, sp, #16
     5c8:	e50b0010 	str	r0, [fp, #-16]
     5cc:	e50b1014 	str	r1, [fp, #-20]	@ 0xffffffec
  struct listcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     5d0:	e3a0000c 	mov	r0, #12
     5d4:	eb00065d 	bl	1f50 <malloc>
     5d8:	e50b0008 	str	r0, [fp, #-8]
  memset(cmd, 0, sizeof(*cmd));
     5dc:	e3a0200c 	mov	r2, #12
     5e0:	e3a01000 	mov	r1, #0
     5e4:	e51b0008 	ldr	r0, [fp, #-8]
     5e8:	eb0002f3 	bl	11bc <memset>
  cmd->type = LIST;
     5ec:	e51b3008 	ldr	r3, [fp, #-8]
     5f0:	e3a02004 	mov	r2, #4
     5f4:	e5832000 	str	r2, [r3]
  cmd->left = left;
     5f8:	e51b3008 	ldr	r3, [fp, #-8]
     5fc:	e51b2010 	ldr	r2, [fp, #-16]
     600:	e5832004 	str	r2, [r3, #4]
  cmd->right = right;
     604:	e51b3008 	ldr	r3, [fp, #-8]
     608:	e51b2014 	ldr	r2, [fp, #-20]	@ 0xffffffec
     60c:	e5832008 	str	r2, [r3, #8]
  return (struct cmd*)cmd;
     610:	e51b3008 	ldr	r3, [fp, #-8]
}
     614:	e1a00003 	mov	r0, r3
     618:	e24bd004 	sub	sp, fp, #4
     61c:	e8bd8800 	pop	{fp, pc}

00000620 <backcmd>:

struct cmd*
backcmd(struct cmd *subcmd)
{
     620:	e92d4800 	push	{fp, lr}
     624:	e28db004 	add	fp, sp, #4
     628:	e24dd010 	sub	sp, sp, #16
     62c:	e50b0010 	str	r0, [fp, #-16]
  struct backcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     630:	e3a00008 	mov	r0, #8
     634:	eb000645 	bl	1f50 <malloc>
     638:	e50b0008 	str	r0, [fp, #-8]
  memset(cmd, 0, sizeof(*cmd));
     63c:	e3a02008 	mov	r2, #8
     640:	e3a01000 	mov	r1, #0
     644:	e51b0008 	ldr	r0, [fp, #-8]
     648:	eb0002db 	bl	11bc <memset>
  cmd->type = BACK;
     64c:	e51b3008 	ldr	r3, [fp, #-8]
     650:	e3a02005 	mov	r2, #5
     654:	e5832000 	str	r2, [r3]
  cmd->cmd = subcmd;
     658:	e51b3008 	ldr	r3, [fp, #-8]
     65c:	e51b2010 	ldr	r2, [fp, #-16]
     660:	e5832004 	str	r2, [r3, #4]
  return (struct cmd*)cmd;
     664:	e51b3008 	ldr	r3, [fp, #-8]
}
     668:	e1a00003 	mov	r0, r3
     66c:	e24bd004 	sub	sp, fp, #4
     670:	e8bd8800 	pop	{fp, pc}

00000674 <gettoken>:
char whitespace[] = " \t\r\n\v";
char symbols[] = "<|>&;()";

int
gettoken(char **ps, char *es, char **q, char **eq)
{
     674:	e92d4800 	push	{fp, lr}
     678:	e28db004 	add	fp, sp, #4
     67c:	e24dd018 	sub	sp, sp, #24
     680:	e50b0010 	str	r0, [fp, #-16]
     684:	e50b1014 	str	r1, [fp, #-20]	@ 0xffffffec
     688:	e50b2018 	str	r2, [fp, #-24]	@ 0xffffffe8
     68c:	e50b301c 	str	r3, [fp, #-28]	@ 0xffffffe4
  char *s;
  int ret;
  
  s = *ps;
     690:	e51b3010 	ldr	r3, [fp, #-16]
     694:	e5933000 	ldr	r3, [r3]
     698:	e50b3008 	str	r3, [fp, #-8]
  while(s < es && strchr(whitespace, *s))
     69c:	ea000002 	b	6ac <gettoken+0x38>
    s++;
     6a0:	e51b3008 	ldr	r3, [fp, #-8]
     6a4:	e2833001 	add	r3, r3, #1
     6a8:	e50b3008 	str	r3, [fp, #-8]
  while(s < es && strchr(whitespace, *s))
     6ac:	e51b2008 	ldr	r2, [fp, #-8]
     6b0:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
     6b4:	e1520003 	cmp	r2, r3
     6b8:	2a000008 	bcs	6e0 <gettoken+0x6c>
     6bc:	e51b3008 	ldr	r3, [fp, #-8]
     6c0:	e5d33000 	ldrb	r3, [r3]
     6c4:	e1a01003 	mov	r1, r3
     6c8:	e30201bc 	movw	r0, #8636	@ 0x21bc
     6cc:	e3400000 	movt	r0, #0
     6d0:	eb0002d4 	bl	1228 <strchr>
     6d4:	e1a03000 	mov	r3, r0
     6d8:	e3530000 	cmp	r3, #0
     6dc:	1affffef 	bne	6a0 <gettoken+0x2c>
  if(q)
     6e0:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
     6e4:	e3530000 	cmp	r3, #0
     6e8:	0a000002 	beq	6f8 <gettoken+0x84>
    *q = s;
     6ec:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
     6f0:	e51b2008 	ldr	r2, [fp, #-8]
     6f4:	e5832000 	str	r2, [r3]
  ret = *s;
     6f8:	e51b3008 	ldr	r3, [fp, #-8]
     6fc:	e5d33000 	ldrb	r3, [r3]
     700:	e50b300c 	str	r3, [fp, #-12]
  switch(*s){
     704:	e51b3008 	ldr	r3, [fp, #-8]
     708:	e5d33000 	ldrb	r3, [r3]
     70c:	e353007c 	cmp	r3, #124	@ 0x7c
     710:	0a000026 	beq	7b0 <gettoken+0x13c>
     714:	e353007c 	cmp	r3, #124	@ 0x7c
     718:	ca000035 	bgt	7f4 <gettoken+0x180>
     71c:	e3530000 	cmp	r3, #0
     720:	0a000050 	beq	868 <gettoken+0x1f4>
     724:	e3530000 	cmp	r3, #0
     728:	ba000031 	blt	7f4 <gettoken+0x180>
     72c:	e353003e 	cmp	r3, #62	@ 0x3e
     730:	ca00002f 	bgt	7f4 <gettoken+0x180>
     734:	e3530026 	cmp	r3, #38	@ 0x26
     738:	ba00002d 	blt	7f4 <gettoken+0x180>
     73c:	e2433026 	sub	r3, r3, #38	@ 0x26
     740:	e3530018 	cmp	r3, #24
     744:	979ff103 	ldrls	pc, [pc, r3, lsl #2]
     748:	ea000029 	b	7f4 <gettoken+0x180>
     74c:	000007b0 	.word	0x000007b0
     750:	000007f4 	.word	0x000007f4
     754:	000007b0 	.word	0x000007b0
     758:	000007b0 	.word	0x000007b0
     75c:	000007f4 	.word	0x000007f4
     760:	000007f4 	.word	0x000007f4
     764:	000007f4 	.word	0x000007f4
     768:	000007f4 	.word	0x000007f4
     76c:	000007f4 	.word	0x000007f4
     770:	000007f4 	.word	0x000007f4
     774:	000007f4 	.word	0x000007f4
     778:	000007f4 	.word	0x000007f4
     77c:	000007f4 	.word	0x000007f4
     780:	000007f4 	.word	0x000007f4
     784:	000007f4 	.word	0x000007f4
     788:	000007f4 	.word	0x000007f4
     78c:	000007f4 	.word	0x000007f4
     790:	000007f4 	.word	0x000007f4
     794:	000007f4 	.word	0x000007f4
     798:	000007f4 	.word	0x000007f4
     79c:	000007f4 	.word	0x000007f4
     7a0:	000007b0 	.word	0x000007b0
     7a4:	000007b0 	.word	0x000007b0
     7a8:	000007f4 	.word	0x000007f4
     7ac:	000007c0 	.word	0x000007c0
  case '(':
  case ')':
  case ';':
  case '&':
  case '<':
    s++;
     7b0:	e51b3008 	ldr	r3, [fp, #-8]
     7b4:	e2833001 	add	r3, r3, #1
     7b8:	e50b3008 	str	r3, [fp, #-8]
    break;
     7bc:	ea00002e 	b	87c <gettoken+0x208>
  case '>':
    s++;
     7c0:	e51b3008 	ldr	r3, [fp, #-8]
     7c4:	e2833001 	add	r3, r3, #1
     7c8:	e50b3008 	str	r3, [fp, #-8]
    if(*s == '>'){
     7cc:	e51b3008 	ldr	r3, [fp, #-8]
     7d0:	e5d33000 	ldrb	r3, [r3]
     7d4:	e353003e 	cmp	r3, #62	@ 0x3e
     7d8:	1a000024 	bne	870 <gettoken+0x1fc>
      ret = '+';
     7dc:	e3a0302b 	mov	r3, #43	@ 0x2b
     7e0:	e50b300c 	str	r3, [fp, #-12]
      s++;
     7e4:	e51b3008 	ldr	r3, [fp, #-8]
     7e8:	e2833001 	add	r3, r3, #1
     7ec:	e50b3008 	str	r3, [fp, #-8]
    }
    break;
     7f0:	ea00001e 	b	870 <gettoken+0x1fc>
  default:
    ret = 'a';
     7f4:	e3a03061 	mov	r3, #97	@ 0x61
     7f8:	e50b300c 	str	r3, [fp, #-12]
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
     7fc:	ea000002 	b	80c <gettoken+0x198>
      s++;
     800:	e51b3008 	ldr	r3, [fp, #-8]
     804:	e2833001 	add	r3, r3, #1
     808:	e50b3008 	str	r3, [fp, #-8]
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
     80c:	e51b2008 	ldr	r2, [fp, #-8]
     810:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
     814:	e1520003 	cmp	r2, r3
     818:	2a000016 	bcs	878 <gettoken+0x204>
     81c:	e51b3008 	ldr	r3, [fp, #-8]
     820:	e5d33000 	ldrb	r3, [r3]
     824:	e1a01003 	mov	r1, r3
     828:	e30201bc 	movw	r0, #8636	@ 0x21bc
     82c:	e3400000 	movt	r0, #0
     830:	eb00027c 	bl	1228 <strchr>
     834:	e1a03000 	mov	r3, r0
     838:	e3530000 	cmp	r3, #0
     83c:	1a00000d 	bne	878 <gettoken+0x204>
     840:	e51b3008 	ldr	r3, [fp, #-8]
     844:	e5d33000 	ldrb	r3, [r3]
     848:	e1a01003 	mov	r1, r3
     84c:	e30201c4 	movw	r0, #8644	@ 0x21c4
     850:	e3400000 	movt	r0, #0
     854:	eb000273 	bl	1228 <strchr>
     858:	e1a03000 	mov	r3, r0
     85c:	e3530000 	cmp	r3, #0
     860:	0affffe6 	beq	800 <gettoken+0x18c>
    break;
     864:	ea000003 	b	878 <gettoken+0x204>
    break;
     868:	e320f000 	nop	{0}
     86c:	ea000002 	b	87c <gettoken+0x208>
    break;
     870:	e320f000 	nop	{0}
     874:	ea000000 	b	87c <gettoken+0x208>
    break;
     878:	e320f000 	nop	{0}
  }
  if(eq)
     87c:	e51b301c 	ldr	r3, [fp, #-28]	@ 0xffffffe4
     880:	e3530000 	cmp	r3, #0
     884:	0a000006 	beq	8a4 <gettoken+0x230>
    *eq = s;
     888:	e51b301c 	ldr	r3, [fp, #-28]	@ 0xffffffe4
     88c:	e51b2008 	ldr	r2, [fp, #-8]
     890:	e5832000 	str	r2, [r3]
  
  while(s < es && strchr(whitespace, *s))
     894:	ea000002 	b	8a4 <gettoken+0x230>
    s++;
     898:	e51b3008 	ldr	r3, [fp, #-8]
     89c:	e2833001 	add	r3, r3, #1
     8a0:	e50b3008 	str	r3, [fp, #-8]
  while(s < es && strchr(whitespace, *s))
     8a4:	e51b2008 	ldr	r2, [fp, #-8]
     8a8:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
     8ac:	e1520003 	cmp	r2, r3
     8b0:	2a000008 	bcs	8d8 <gettoken+0x264>
     8b4:	e51b3008 	ldr	r3, [fp, #-8]
     8b8:	e5d33000 	ldrb	r3, [r3]
     8bc:	e1a01003 	mov	r1, r3
     8c0:	e30201bc 	movw	r0, #8636	@ 0x21bc
     8c4:	e3400000 	movt	r0, #0
     8c8:	eb000256 	bl	1228 <strchr>
     8cc:	e1a03000 	mov	r3, r0
     8d0:	e3530000 	cmp	r3, #0
     8d4:	1affffef 	bne	898 <gettoken+0x224>
  *ps = s;
     8d8:	e51b3010 	ldr	r3, [fp, #-16]
     8dc:	e51b2008 	ldr	r2, [fp, #-8]
     8e0:	e5832000 	str	r2, [r3]
  return ret;
     8e4:	e51b300c 	ldr	r3, [fp, #-12]
}
     8e8:	e1a00003 	mov	r0, r3
     8ec:	e24bd004 	sub	sp, fp, #4
     8f0:	e8bd8800 	pop	{fp, pc}

000008f4 <peek>:

int
peek(char **ps, char *es, char *toks)
{
     8f4:	e92d4800 	push	{fp, lr}
     8f8:	e28db004 	add	fp, sp, #4
     8fc:	e24dd018 	sub	sp, sp, #24
     900:	e50b0010 	str	r0, [fp, #-16]
     904:	e50b1014 	str	r1, [fp, #-20]	@ 0xffffffec
     908:	e50b2018 	str	r2, [fp, #-24]	@ 0xffffffe8
  char *s;
  
  s = *ps;
     90c:	e51b3010 	ldr	r3, [fp, #-16]
     910:	e5933000 	ldr	r3, [r3]
     914:	e50b3008 	str	r3, [fp, #-8]
  while(s < es && strchr(whitespace, *s))
     918:	ea000002 	b	928 <peek+0x34>
    s++;
     91c:	e51b3008 	ldr	r3, [fp, #-8]
     920:	e2833001 	add	r3, r3, #1
     924:	e50b3008 	str	r3, [fp, #-8]
  while(s < es && strchr(whitespace, *s))
     928:	e51b2008 	ldr	r2, [fp, #-8]
     92c:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
     930:	e1520003 	cmp	r2, r3
     934:	2a000008 	bcs	95c <peek+0x68>
     938:	e51b3008 	ldr	r3, [fp, #-8]
     93c:	e5d33000 	ldrb	r3, [r3]
     940:	e1a01003 	mov	r1, r3
     944:	e30201bc 	movw	r0, #8636	@ 0x21bc
     948:	e3400000 	movt	r0, #0
     94c:	eb000235 	bl	1228 <strchr>
     950:	e1a03000 	mov	r3, r0
     954:	e3530000 	cmp	r3, #0
     958:	1affffef 	bne	91c <peek+0x28>
  *ps = s;
     95c:	e51b3010 	ldr	r3, [fp, #-16]
     960:	e51b2008 	ldr	r2, [fp, #-8]
     964:	e5832000 	str	r2, [r3]
  return *s && strchr(toks, *s);
     968:	e51b3008 	ldr	r3, [fp, #-8]
     96c:	e5d33000 	ldrb	r3, [r3]
     970:	e3530000 	cmp	r3, #0
     974:	0a000009 	beq	9a0 <peek+0xac>
     978:	e51b3008 	ldr	r3, [fp, #-8]
     97c:	e5d33000 	ldrb	r3, [r3]
     980:	e1a01003 	mov	r1, r3
     984:	e51b0018 	ldr	r0, [fp, #-24]	@ 0xffffffe8
     988:	eb000226 	bl	1228 <strchr>
     98c:	e1a03000 	mov	r3, r0
     990:	e3530000 	cmp	r3, #0
     994:	0a000001 	beq	9a0 <peek+0xac>
     998:	e3a03001 	mov	r3, #1
     99c:	ea000000 	b	9a4 <peek+0xb0>
     9a0:	e3a03000 	mov	r3, #0
}
     9a4:	e1a00003 	mov	r0, r3
     9a8:	e24bd004 	sub	sp, fp, #4
     9ac:	e8bd8800 	pop	{fp, pc}

000009b0 <parsecmd>:
struct cmd *parseexec(char**, char*);
struct cmd *nulterminate(struct cmd*);

struct cmd*
parsecmd(char *s)
{
     9b0:	e92d4810 	push	{r4, fp, lr}
     9b4:	e28db008 	add	fp, sp, #8
     9b8:	e24dd014 	sub	sp, sp, #20
     9bc:	e50b0018 	str	r0, [fp, #-24]	@ 0xffffffe8
  char *es;
  struct cmd *cmd;

  es = s + strlen(s);
     9c0:	e51b4018 	ldr	r4, [fp, #-24]	@ 0xffffffe8
     9c4:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
     9c8:	e1a00003 	mov	r0, r3
     9cc:	eb0001e5 	bl	1168 <strlen>
     9d0:	e1a03000 	mov	r3, r0
     9d4:	e0843003 	add	r3, r4, r3
     9d8:	e50b3010 	str	r3, [fp, #-16]
  cmd = parseline(&s, es);
     9dc:	e24b3018 	sub	r3, fp, #24
     9e0:	e51b1010 	ldr	r1, [fp, #-16]
     9e4:	e1a00003 	mov	r0, r3
     9e8:	eb000019 	bl	a54 <parseline>
     9ec:	e50b0014 	str	r0, [fp, #-20]	@ 0xffffffec
  peek(&s, es, "");
     9f0:	e24b3018 	sub	r3, fp, #24
     9f4:	e3022128 	movw	r2, #8488	@ 0x2128
     9f8:	e3402000 	movt	r2, #0
     9fc:	e51b1010 	ldr	r1, [fp, #-16]
     a00:	e1a00003 	mov	r0, r3
     a04:	ebffffba 	bl	8f4 <peek>
  if(s != es){
     a08:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
     a0c:	e51b2010 	ldr	r2, [fp, #-16]
     a10:	e1520003 	cmp	r2, r3
     a14:	0a000008 	beq	a3c <parsecmd+0x8c>
    printf(2, "leftovers: %s\n", s);
     a18:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
     a1c:	e1a02003 	mov	r2, r3
     a20:	e302112c 	movw	r1, #8492	@ 0x212c
     a24:	e3401000 	movt	r1, #0
     a28:	e3a00002 	mov	r0, #2
     a2c:	eb000437 	bl	1b10 <printf>
    panic("syntax");
     a30:	e302013c 	movw	r0, #8508	@ 0x213c
     a34:	e3400000 	movt	r0, #0
     a38:	ebfffe78 	bl	420 <panic>
  }
  nulterminate(cmd);
     a3c:	e51b0014 	ldr	r0, [fp, #-20]	@ 0xffffffec
     a40:	eb000138 	bl	f28 <nulterminate>
  return cmd;
     a44:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
}
     a48:	e1a00003 	mov	r0, r3
     a4c:	e24bd008 	sub	sp, fp, #8
     a50:	e8bd8810 	pop	{r4, fp, pc}

00000a54 <parseline>:

struct cmd*
parseline(char **ps, char *es)
{
     a54:	e92d4800 	push	{fp, lr}
     a58:	e28db004 	add	fp, sp, #4
     a5c:	e24dd010 	sub	sp, sp, #16
     a60:	e50b0010 	str	r0, [fp, #-16]
     a64:	e50b1014 	str	r1, [fp, #-20]	@ 0xffffffec
  struct cmd *cmd;

  cmd = parsepipe(ps, es);
     a68:	e51b1014 	ldr	r1, [fp, #-20]	@ 0xffffffec
     a6c:	e51b0010 	ldr	r0, [fp, #-16]
     a70:	eb00002a 	bl	b20 <parsepipe>
     a74:	e50b0008 	str	r0, [fp, #-8]
  while(peek(ps, es, "&")){
     a78:	ea000007 	b	a9c <parseline+0x48>
    gettoken(ps, es, 0, 0);
     a7c:	e3a03000 	mov	r3, #0
     a80:	e3a02000 	mov	r2, #0
     a84:	e51b1014 	ldr	r1, [fp, #-20]	@ 0xffffffec
     a88:	e51b0010 	ldr	r0, [fp, #-16]
     a8c:	ebfffef8 	bl	674 <gettoken>
    cmd = backcmd(cmd);
     a90:	e51b0008 	ldr	r0, [fp, #-8]
     a94:	ebfffee1 	bl	620 <backcmd>
     a98:	e50b0008 	str	r0, [fp, #-8]
  while(peek(ps, es, "&")){
     a9c:	e3022144 	movw	r2, #8516	@ 0x2144
     aa0:	e3402000 	movt	r2, #0
     aa4:	e51b1014 	ldr	r1, [fp, #-20]	@ 0xffffffec
     aa8:	e51b0010 	ldr	r0, [fp, #-16]
     aac:	ebffff90 	bl	8f4 <peek>
     ab0:	e1a03000 	mov	r3, r0
     ab4:	e3530000 	cmp	r3, #0
     ab8:	1affffef 	bne	a7c <parseline+0x28>
  }
  if(peek(ps, es, ";")){
     abc:	e3022148 	movw	r2, #8520	@ 0x2148
     ac0:	e3402000 	movt	r2, #0
     ac4:	e51b1014 	ldr	r1, [fp, #-20]	@ 0xffffffec
     ac8:	e51b0010 	ldr	r0, [fp, #-16]
     acc:	ebffff88 	bl	8f4 <peek>
     ad0:	e1a03000 	mov	r3, r0
     ad4:	e3530000 	cmp	r3, #0
     ad8:	0a00000c 	beq	b10 <parseline+0xbc>
    gettoken(ps, es, 0, 0);
     adc:	e3a03000 	mov	r3, #0
     ae0:	e3a02000 	mov	r2, #0
     ae4:	e51b1014 	ldr	r1, [fp, #-20]	@ 0xffffffec
     ae8:	e51b0010 	ldr	r0, [fp, #-16]
     aec:	ebfffee0 	bl	674 <gettoken>
    cmd = listcmd(cmd, parseline(ps, es));
     af0:	e51b1014 	ldr	r1, [fp, #-20]	@ 0xffffffec
     af4:	e51b0010 	ldr	r0, [fp, #-16]
     af8:	ebffffd5 	bl	a54 <parseline>
     afc:	e1a03000 	mov	r3, r0
     b00:	e1a01003 	mov	r1, r3
     b04:	e51b0008 	ldr	r0, [fp, #-8]
     b08:	ebfffeab 	bl	5bc <listcmd>
     b0c:	e50b0008 	str	r0, [fp, #-8]
  }
  return cmd;
     b10:	e51b3008 	ldr	r3, [fp, #-8]
}
     b14:	e1a00003 	mov	r0, r3
     b18:	e24bd004 	sub	sp, fp, #4
     b1c:	e8bd8800 	pop	{fp, pc}

00000b20 <parsepipe>:

struct cmd*
parsepipe(char **ps, char *es)
{
     b20:	e92d4800 	push	{fp, lr}
     b24:	e28db004 	add	fp, sp, #4
     b28:	e24dd010 	sub	sp, sp, #16
     b2c:	e50b0010 	str	r0, [fp, #-16]
     b30:	e50b1014 	str	r1, [fp, #-20]	@ 0xffffffec
  struct cmd *cmd;

  cmd = parseexec(ps, es);
     b34:	e51b1014 	ldr	r1, [fp, #-20]	@ 0xffffffec
     b38:	e51b0010 	ldr	r0, [fp, #-16]
     b3c:	eb000096 	bl	d9c <parseexec>
     b40:	e50b0008 	str	r0, [fp, #-8]
  if(peek(ps, es, "|")){
     b44:	e302214c 	movw	r2, #8524	@ 0x214c
     b48:	e3402000 	movt	r2, #0
     b4c:	e51b1014 	ldr	r1, [fp, #-20]	@ 0xffffffec
     b50:	e51b0010 	ldr	r0, [fp, #-16]
     b54:	ebffff66 	bl	8f4 <peek>
     b58:	e1a03000 	mov	r3, r0
     b5c:	e3530000 	cmp	r3, #0
     b60:	0a00000c 	beq	b98 <parsepipe+0x78>
    gettoken(ps, es, 0, 0);
     b64:	e3a03000 	mov	r3, #0
     b68:	e3a02000 	mov	r2, #0
     b6c:	e51b1014 	ldr	r1, [fp, #-20]	@ 0xffffffec
     b70:	e51b0010 	ldr	r0, [fp, #-16]
     b74:	ebfffebe 	bl	674 <gettoken>
    cmd = pipecmd(cmd, parsepipe(ps, es));
     b78:	e51b1014 	ldr	r1, [fp, #-20]	@ 0xffffffec
     b7c:	e51b0010 	ldr	r0, [fp, #-16]
     b80:	ebffffe6 	bl	b20 <parsepipe>
     b84:	e1a03000 	mov	r3, r0
     b88:	e1a01003 	mov	r1, r3
     b8c:	e51b0008 	ldr	r0, [fp, #-8]
     b90:	ebfffe70 	bl	558 <pipecmd>
     b94:	e50b0008 	str	r0, [fp, #-8]
  }
  return cmd;
     b98:	e51b3008 	ldr	r3, [fp, #-8]
}
     b9c:	e1a00003 	mov	r0, r3
     ba0:	e24bd004 	sub	sp, fp, #4
     ba4:	e8bd8800 	pop	{fp, pc}

00000ba8 <parseredirs>:

struct cmd*
parseredirs(struct cmd *cmd, char **ps, char *es)
{
     ba8:	e92d4800 	push	{fp, lr}
     bac:	e28db004 	add	fp, sp, #4
     bb0:	e24dd028 	sub	sp, sp, #40	@ 0x28
     bb4:	e50b0018 	str	r0, [fp, #-24]	@ 0xffffffe8
     bb8:	e50b101c 	str	r1, [fp, #-28]	@ 0xffffffe4
     bbc:	e50b2020 	str	r2, [fp, #-32]	@ 0xffffffe0
  int tok;
  char *q, *eq;

  while(peek(ps, es, "<>")){
     bc0:	ea000037 	b	ca4 <parseredirs+0xfc>
    tok = gettoken(ps, es, 0, 0);
     bc4:	e3a03000 	mov	r3, #0
     bc8:	e3a02000 	mov	r2, #0
     bcc:	e51b1020 	ldr	r1, [fp, #-32]	@ 0xffffffe0
     bd0:	e51b001c 	ldr	r0, [fp, #-28]	@ 0xffffffe4
     bd4:	ebfffea6 	bl	674 <gettoken>
     bd8:	e50b0008 	str	r0, [fp, #-8]
    if(gettoken(ps, es, &q, &eq) != 'a')
     bdc:	e24b3010 	sub	r3, fp, #16
     be0:	e24b200c 	sub	r2, fp, #12
     be4:	e51b1020 	ldr	r1, [fp, #-32]	@ 0xffffffe0
     be8:	e51b001c 	ldr	r0, [fp, #-28]	@ 0xffffffe4
     bec:	ebfffea0 	bl	674 <gettoken>
     bf0:	e1a03000 	mov	r3, r0
     bf4:	e3530061 	cmp	r3, #97	@ 0x61
     bf8:	0a000002 	beq	c08 <parseredirs+0x60>
      panic("missing file for redirection");
     bfc:	e3020150 	movw	r0, #8528	@ 0x2150
     c00:	e3400000 	movt	r0, #0
     c04:	ebfffe05 	bl	420 <panic>
    switch(tok){
     c08:	e51b3008 	ldr	r3, [fp, #-8]
     c0c:	e353003e 	cmp	r3, #62	@ 0x3e
     c10:	0a000011 	beq	c5c <parseredirs+0xb4>
     c14:	e51b3008 	ldr	r3, [fp, #-8]
     c18:	e353003e 	cmp	r3, #62	@ 0x3e
     c1c:	ca000020 	bgt	ca4 <parseredirs+0xfc>
     c20:	e51b3008 	ldr	r3, [fp, #-8]
     c24:	e353002b 	cmp	r3, #43	@ 0x2b
     c28:	0a000014 	beq	c80 <parseredirs+0xd8>
     c2c:	e51b3008 	ldr	r3, [fp, #-8]
     c30:	e353003c 	cmp	r3, #60	@ 0x3c
     c34:	1a00001a 	bne	ca4 <parseredirs+0xfc>
    case '<':
      cmd = redircmd(cmd, q, eq, O_RDONLY, 0);
     c38:	e51b100c 	ldr	r1, [fp, #-12]
     c3c:	e51b2010 	ldr	r2, [fp, #-16]
     c40:	e3a03000 	mov	r3, #0
     c44:	e58d3000 	str	r3, [sp]
     c48:	e3a03000 	mov	r3, #0
     c4c:	e51b0018 	ldr	r0, [fp, #-24]	@ 0xffffffe8
     c50:	ebfffe1c 	bl	4c8 <redircmd>
     c54:	e50b0018 	str	r0, [fp, #-24]	@ 0xffffffe8
      break;
     c58:	ea000011 	b	ca4 <parseredirs+0xfc>
    case '>':
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
     c5c:	e51b100c 	ldr	r1, [fp, #-12]
     c60:	e51b2010 	ldr	r2, [fp, #-16]
     c64:	e3a03001 	mov	r3, #1
     c68:	e58d3000 	str	r3, [sp]
     c6c:	e3003201 	movw	r3, #513	@ 0x201
     c70:	e51b0018 	ldr	r0, [fp, #-24]	@ 0xffffffe8
     c74:	ebfffe13 	bl	4c8 <redircmd>
     c78:	e50b0018 	str	r0, [fp, #-24]	@ 0xffffffe8
      break;
     c7c:	ea000008 	b	ca4 <parseredirs+0xfc>
    case '+':  // >>
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
     c80:	e51b100c 	ldr	r1, [fp, #-12]
     c84:	e51b2010 	ldr	r2, [fp, #-16]
     c88:	e3a03001 	mov	r3, #1
     c8c:	e58d3000 	str	r3, [sp]
     c90:	e3003201 	movw	r3, #513	@ 0x201
     c94:	e51b0018 	ldr	r0, [fp, #-24]	@ 0xffffffe8
     c98:	ebfffe0a 	bl	4c8 <redircmd>
     c9c:	e50b0018 	str	r0, [fp, #-24]	@ 0xffffffe8
      break;
     ca0:	e320f000 	nop	{0}
  while(peek(ps, es, "<>")){
     ca4:	e3022170 	movw	r2, #8560	@ 0x2170
     ca8:	e3402000 	movt	r2, #0
     cac:	e51b1020 	ldr	r1, [fp, #-32]	@ 0xffffffe0
     cb0:	e51b001c 	ldr	r0, [fp, #-28]	@ 0xffffffe4
     cb4:	ebffff0e 	bl	8f4 <peek>
     cb8:	e1a03000 	mov	r3, r0
     cbc:	e3530000 	cmp	r3, #0
     cc0:	1affffbf 	bne	bc4 <parseredirs+0x1c>
    }
  }
  return cmd;
     cc4:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
}
     cc8:	e1a00003 	mov	r0, r3
     ccc:	e24bd004 	sub	sp, fp, #4
     cd0:	e8bd8800 	pop	{fp, pc}

00000cd4 <parseblock>:

struct cmd*
parseblock(char **ps, char *es)
{
     cd4:	e92d4800 	push	{fp, lr}
     cd8:	e28db004 	add	fp, sp, #4
     cdc:	e24dd010 	sub	sp, sp, #16
     ce0:	e50b0010 	str	r0, [fp, #-16]
     ce4:	e50b1014 	str	r1, [fp, #-20]	@ 0xffffffec
  struct cmd *cmd;

  if(!peek(ps, es, "("))
     ce8:	e3022174 	movw	r2, #8564	@ 0x2174
     cec:	e3402000 	movt	r2, #0
     cf0:	e51b1014 	ldr	r1, [fp, #-20]	@ 0xffffffec
     cf4:	e51b0010 	ldr	r0, [fp, #-16]
     cf8:	ebfffefd 	bl	8f4 <peek>
     cfc:	e1a03000 	mov	r3, r0
     d00:	e3530000 	cmp	r3, #0
     d04:	1a000002 	bne	d14 <parseblock+0x40>
    panic("parseblock");
     d08:	e3020178 	movw	r0, #8568	@ 0x2178
     d0c:	e3400000 	movt	r0, #0
     d10:	ebfffdc2 	bl	420 <panic>
  gettoken(ps, es, 0, 0);
     d14:	e3a03000 	mov	r3, #0
     d18:	e3a02000 	mov	r2, #0
     d1c:	e51b1014 	ldr	r1, [fp, #-20]	@ 0xffffffec
     d20:	e51b0010 	ldr	r0, [fp, #-16]
     d24:	ebfffe52 	bl	674 <gettoken>
  cmd = parseline(ps, es);
     d28:	e51b1014 	ldr	r1, [fp, #-20]	@ 0xffffffec
     d2c:	e51b0010 	ldr	r0, [fp, #-16]
     d30:	ebffff47 	bl	a54 <parseline>
     d34:	e50b0008 	str	r0, [fp, #-8]
  if(!peek(ps, es, ")"))
     d38:	e3022184 	movw	r2, #8580	@ 0x2184
     d3c:	e3402000 	movt	r2, #0
     d40:	e51b1014 	ldr	r1, [fp, #-20]	@ 0xffffffec
     d44:	e51b0010 	ldr	r0, [fp, #-16]
     d48:	ebfffee9 	bl	8f4 <peek>
     d4c:	e1a03000 	mov	r3, r0
     d50:	e3530000 	cmp	r3, #0
     d54:	1a000002 	bne	d64 <parseblock+0x90>
    panic("syntax - missing )");
     d58:	e3020188 	movw	r0, #8584	@ 0x2188
     d5c:	e3400000 	movt	r0, #0
     d60:	ebfffdae 	bl	420 <panic>
  gettoken(ps, es, 0, 0);
     d64:	e3a03000 	mov	r3, #0
     d68:	e3a02000 	mov	r2, #0
     d6c:	e51b1014 	ldr	r1, [fp, #-20]	@ 0xffffffec
     d70:	e51b0010 	ldr	r0, [fp, #-16]
     d74:	ebfffe3e 	bl	674 <gettoken>
  cmd = parseredirs(cmd, ps, es);
     d78:	e51b2014 	ldr	r2, [fp, #-20]	@ 0xffffffec
     d7c:	e51b1010 	ldr	r1, [fp, #-16]
     d80:	e51b0008 	ldr	r0, [fp, #-8]
     d84:	ebffff87 	bl	ba8 <parseredirs>
     d88:	e50b0008 	str	r0, [fp, #-8]
  return cmd;
     d8c:	e51b3008 	ldr	r3, [fp, #-8]
}
     d90:	e1a00003 	mov	r0, r3
     d94:	e24bd004 	sub	sp, fp, #4
     d98:	e8bd8800 	pop	{fp, pc}

00000d9c <parseexec>:

struct cmd*
parseexec(char **ps, char *es)
{
     d9c:	e92d4800 	push	{fp, lr}
     da0:	e28db004 	add	fp, sp, #4
     da4:	e24dd020 	sub	sp, sp, #32
     da8:	e50b0020 	str	r0, [fp, #-32]	@ 0xffffffe0
     dac:	e50b1024 	str	r1, [fp, #-36]	@ 0xffffffdc
  char *q, *eq;
  int tok, argc;
  struct execcmd *cmd;
  struct cmd *ret;
  
  if(peek(ps, es, "("))
     db0:	e3022174 	movw	r2, #8564	@ 0x2174
     db4:	e3402000 	movt	r2, #0
     db8:	e51b1024 	ldr	r1, [fp, #-36]	@ 0xffffffdc
     dbc:	e51b0020 	ldr	r0, [fp, #-32]	@ 0xffffffe0
     dc0:	ebfffecb 	bl	8f4 <peek>
     dc4:	e1a03000 	mov	r3, r0
     dc8:	e3530000 	cmp	r3, #0
     dcc:	0a000004 	beq	de4 <parseexec+0x48>
    return parseblock(ps, es);
     dd0:	e51b1024 	ldr	r1, [fp, #-36]	@ 0xffffffdc
     dd4:	e51b0020 	ldr	r0, [fp, #-32]	@ 0xffffffe0
     dd8:	ebffffbd 	bl	cd4 <parseblock>
     ddc:	e1a03000 	mov	r3, r0
     de0:	ea00004d 	b	f1c <parseexec+0x180>

  ret = execcmd();
     de4:	ebfffda6 	bl	484 <execcmd>
     de8:	e50b000c 	str	r0, [fp, #-12]
  cmd = (struct execcmd*)ret;
     dec:	e51b300c 	ldr	r3, [fp, #-12]
     df0:	e50b3010 	str	r3, [fp, #-16]

  argc = 0;
     df4:	e3a03000 	mov	r3, #0
     df8:	e50b3008 	str	r3, [fp, #-8]
  ret = parseredirs(ret, ps, es);
     dfc:	e51b2024 	ldr	r2, [fp, #-36]	@ 0xffffffdc
     e00:	e51b1020 	ldr	r1, [fp, #-32]	@ 0xffffffe0
     e04:	e51b000c 	ldr	r0, [fp, #-12]
     e08:	ebffff66 	bl	ba8 <parseredirs>
     e0c:	e50b000c 	str	r0, [fp, #-12]
  while(!peek(ps, es, "|)&;")){
     e10:	ea000029 	b	ebc <parseexec+0x120>
    if((tok=gettoken(ps, es, &q, &eq)) == 0)
     e14:	e24b301c 	sub	r3, fp, #28
     e18:	e24b2018 	sub	r2, fp, #24
     e1c:	e51b1024 	ldr	r1, [fp, #-36]	@ 0xffffffdc
     e20:	e51b0020 	ldr	r0, [fp, #-32]	@ 0xffffffe0
     e24:	ebfffe12 	bl	674 <gettoken>
     e28:	e50b0014 	str	r0, [fp, #-20]	@ 0xffffffec
     e2c:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
     e30:	e3530000 	cmp	r3, #0
     e34:	0a000029 	beq	ee0 <parseexec+0x144>
      break;
    if(tok != 'a')
     e38:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
     e3c:	e3530061 	cmp	r3, #97	@ 0x61
     e40:	0a000002 	beq	e50 <parseexec+0xb4>
      panic("syntax");
     e44:	e302013c 	movw	r0, #8508	@ 0x213c
     e48:	e3400000 	movt	r0, #0
     e4c:	ebfffd73 	bl	420 <panic>
    cmd->argv[argc] = q;
     e50:	e51b2018 	ldr	r2, [fp, #-24]	@ 0xffffffe8
     e54:	e51b1010 	ldr	r1, [fp, #-16]
     e58:	e51b3008 	ldr	r3, [fp, #-8]
     e5c:	e1a03103 	lsl	r3, r3, #2
     e60:	e0813003 	add	r3, r1, r3
     e64:	e5832004 	str	r2, [r3, #4]
    cmd->eargv[argc] = eq;
     e68:	e51b201c 	ldr	r2, [fp, #-28]	@ 0xffffffe4
     e6c:	e51b1010 	ldr	r1, [fp, #-16]
     e70:	e51b3008 	ldr	r3, [fp, #-8]
     e74:	e283300a 	add	r3, r3, #10
     e78:	e1a03103 	lsl	r3, r3, #2
     e7c:	e0813003 	add	r3, r1, r3
     e80:	e5832004 	str	r2, [r3, #4]
    argc++;
     e84:	e51b3008 	ldr	r3, [fp, #-8]
     e88:	e2833001 	add	r3, r3, #1
     e8c:	e50b3008 	str	r3, [fp, #-8]
    if(argc >= MAXARGS)
     e90:	e51b3008 	ldr	r3, [fp, #-8]
     e94:	e3530009 	cmp	r3, #9
     e98:	da000002 	ble	ea8 <parseexec+0x10c>
      panic("too many args");
     e9c:	e302019c 	movw	r0, #8604	@ 0x219c
     ea0:	e3400000 	movt	r0, #0
     ea4:	ebfffd5d 	bl	420 <panic>
    ret = parseredirs(ret, ps, es);
     ea8:	e51b2024 	ldr	r2, [fp, #-36]	@ 0xffffffdc
     eac:	e51b1020 	ldr	r1, [fp, #-32]	@ 0xffffffe0
     eb0:	e51b000c 	ldr	r0, [fp, #-12]
     eb4:	ebffff3b 	bl	ba8 <parseredirs>
     eb8:	e50b000c 	str	r0, [fp, #-12]
  while(!peek(ps, es, "|)&;")){
     ebc:	e30221ac 	movw	r2, #8620	@ 0x21ac
     ec0:	e3402000 	movt	r2, #0
     ec4:	e51b1024 	ldr	r1, [fp, #-36]	@ 0xffffffdc
     ec8:	e51b0020 	ldr	r0, [fp, #-32]	@ 0xffffffe0
     ecc:	ebfffe88 	bl	8f4 <peek>
     ed0:	e1a03000 	mov	r3, r0
     ed4:	e3530000 	cmp	r3, #0
     ed8:	0affffcd 	beq	e14 <parseexec+0x78>
     edc:	ea000000 	b	ee4 <parseexec+0x148>
      break;
     ee0:	e320f000 	nop	{0}
  }
  cmd->argv[argc] = 0;
     ee4:	e51b2010 	ldr	r2, [fp, #-16]
     ee8:	e51b3008 	ldr	r3, [fp, #-8]
     eec:	e1a03103 	lsl	r3, r3, #2
     ef0:	e0823003 	add	r3, r2, r3
     ef4:	e3a02000 	mov	r2, #0
     ef8:	e5832004 	str	r2, [r3, #4]
  cmd->eargv[argc] = 0;
     efc:	e51b2010 	ldr	r2, [fp, #-16]
     f00:	e51b3008 	ldr	r3, [fp, #-8]
     f04:	e283300a 	add	r3, r3, #10
     f08:	e1a03103 	lsl	r3, r3, #2
     f0c:	e0823003 	add	r3, r2, r3
     f10:	e3a02000 	mov	r2, #0
     f14:	e5832004 	str	r2, [r3, #4]
  return ret;
     f18:	e51b300c 	ldr	r3, [fp, #-12]
}
     f1c:	e1a00003 	mov	r0, r3
     f20:	e24bd004 	sub	sp, fp, #4
     f24:	e8bd8800 	pop	{fp, pc}

00000f28 <nulterminate>:

// NUL-terminate all the counted strings.
struct cmd*
nulterminate(struct cmd *cmd)
{
     f28:	e92d4800 	push	{fp, lr}
     f2c:	e28db004 	add	fp, sp, #4
     f30:	e24dd020 	sub	sp, sp, #32
     f34:	e50b0020 	str	r0, [fp, #-32]	@ 0xffffffe0
  struct execcmd *ecmd;
  struct listcmd *lcmd;
  struct pipecmd *pcmd;
  struct redircmd *rcmd;

  if(cmd == 0)
     f38:	e51b3020 	ldr	r3, [fp, #-32]	@ 0xffffffe0
     f3c:	e3530000 	cmp	r3, #0
     f40:	1a000001 	bne	f4c <nulterminate+0x24>
    return 0;
     f44:	e3a03000 	mov	r3, #0
     f48:	ea00004b 	b	107c <nulterminate+0x154>
  
  switch(cmd->type){
     f4c:	e51b3020 	ldr	r3, [fp, #-32]	@ 0xffffffe0
     f50:	e5933000 	ldr	r3, [r3]
     f54:	e2433001 	sub	r3, r3, #1
     f58:	e3530004 	cmp	r3, #4
     f5c:	979ff103 	ldrls	pc, [pc, r3, lsl #2]
     f60:	ea000044 	b	1078 <nulterminate+0x150>
     f64:	00000f78 	.word	0x00000f78
     f68:	00000fd8 	.word	0x00000fd8
     f6c:	00001004 	.word	0x00001004
     f70:	00001030 	.word	0x00001030
     f74:	0000105c 	.word	0x0000105c
  case EXEC:
    ecmd = (struct execcmd*)cmd;
     f78:	e51b3020 	ldr	r3, [fp, #-32]	@ 0xffffffe0
     f7c:	e50b301c 	str	r3, [fp, #-28]	@ 0xffffffe4
    for(i=0; ecmd->argv[i]; i++)
     f80:	e3a03000 	mov	r3, #0
     f84:	e50b3008 	str	r3, [fp, #-8]
     f88:	ea00000a 	b	fb8 <nulterminate+0x90>
      *ecmd->eargv[i] = 0;
     f8c:	e51b201c 	ldr	r2, [fp, #-28]	@ 0xffffffe4
     f90:	e51b3008 	ldr	r3, [fp, #-8]
     f94:	e283300a 	add	r3, r3, #10
     f98:	e1a03103 	lsl	r3, r3, #2
     f9c:	e0823003 	add	r3, r2, r3
     fa0:	e5933004 	ldr	r3, [r3, #4]
     fa4:	e3a02000 	mov	r2, #0
     fa8:	e5c32000 	strb	r2, [r3]
    for(i=0; ecmd->argv[i]; i++)
     fac:	e51b3008 	ldr	r3, [fp, #-8]
     fb0:	e2833001 	add	r3, r3, #1
     fb4:	e50b3008 	str	r3, [fp, #-8]
     fb8:	e51b201c 	ldr	r2, [fp, #-28]	@ 0xffffffe4
     fbc:	e51b3008 	ldr	r3, [fp, #-8]
     fc0:	e1a03103 	lsl	r3, r3, #2
     fc4:	e0823003 	add	r3, r2, r3
     fc8:	e5933004 	ldr	r3, [r3, #4]
     fcc:	e3530000 	cmp	r3, #0
     fd0:	1affffed 	bne	f8c <nulterminate+0x64>
    break;
     fd4:	ea000027 	b	1078 <nulterminate+0x150>

  case REDIR:
    rcmd = (struct redircmd*)cmd;
     fd8:	e51b3020 	ldr	r3, [fp, #-32]	@ 0xffffffe0
     fdc:	e50b3018 	str	r3, [fp, #-24]	@ 0xffffffe8
    nulterminate(rcmd->cmd);
     fe0:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
     fe4:	e5933004 	ldr	r3, [r3, #4]
     fe8:	e1a00003 	mov	r0, r3
     fec:	ebffffcd 	bl	f28 <nulterminate>
    *rcmd->efile = 0;
     ff0:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
     ff4:	e593300c 	ldr	r3, [r3, #12]
     ff8:	e3a02000 	mov	r2, #0
     ffc:	e5c32000 	strb	r2, [r3]
    break;
    1000:	ea00001c 	b	1078 <nulterminate+0x150>

  case PIPE:
    pcmd = (struct pipecmd*)cmd;
    1004:	e51b3020 	ldr	r3, [fp, #-32]	@ 0xffffffe0
    1008:	e50b3014 	str	r3, [fp, #-20]	@ 0xffffffec
    nulterminate(pcmd->left);
    100c:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
    1010:	e5933004 	ldr	r3, [r3, #4]
    1014:	e1a00003 	mov	r0, r3
    1018:	ebffffc2 	bl	f28 <nulterminate>
    nulterminate(pcmd->right);
    101c:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
    1020:	e5933008 	ldr	r3, [r3, #8]
    1024:	e1a00003 	mov	r0, r3
    1028:	ebffffbe 	bl	f28 <nulterminate>
    break;
    102c:	ea000011 	b	1078 <nulterminate+0x150>
    
  case LIST:
    lcmd = (struct listcmd*)cmd;
    1030:	e51b3020 	ldr	r3, [fp, #-32]	@ 0xffffffe0
    1034:	e50b3010 	str	r3, [fp, #-16]
    nulterminate(lcmd->left);
    1038:	e51b3010 	ldr	r3, [fp, #-16]
    103c:	e5933004 	ldr	r3, [r3, #4]
    1040:	e1a00003 	mov	r0, r3
    1044:	ebffffb7 	bl	f28 <nulterminate>
    nulterminate(lcmd->right);
    1048:	e51b3010 	ldr	r3, [fp, #-16]
    104c:	e5933008 	ldr	r3, [r3, #8]
    1050:	e1a00003 	mov	r0, r3
    1054:	ebffffb3 	bl	f28 <nulterminate>
    break;
    1058:	ea000006 	b	1078 <nulterminate+0x150>

  case BACK:
    bcmd = (struct backcmd*)cmd;
    105c:	e51b3020 	ldr	r3, [fp, #-32]	@ 0xffffffe0
    1060:	e50b300c 	str	r3, [fp, #-12]
    nulterminate(bcmd->cmd);
    1064:	e51b300c 	ldr	r3, [fp, #-12]
    1068:	e5933004 	ldr	r3, [r3, #4]
    106c:	e1a00003 	mov	r0, r3
    1070:	ebffffac 	bl	f28 <nulterminate>
    break;
    1074:	e320f000 	nop	{0}
  }
  return cmd;
    1078:	e51b3020 	ldr	r3, [fp, #-32]	@ 0xffffffe0
}
    107c:	e1a00003 	mov	r0, r3
    1080:	e24bd004 	sub	sp, fp, #4
    1084:	e8bd8800 	pop	{fp, pc}

00001088 <strcpy>:
#include "user.h"
#include "arm.h"

char*
strcpy(char *s, char *t)
{
    1088:	e52db004 	push	{fp}		@ (str fp, [sp, #-4]!)
    108c:	e28db000 	add	fp, sp, #0
    1090:	e24dd014 	sub	sp, sp, #20
    1094:	e50b0010 	str	r0, [fp, #-16]
    1098:	e50b1014 	str	r1, [fp, #-20]	@ 0xffffffec
  char *os;

  os = s;
    109c:	e51b3010 	ldr	r3, [fp, #-16]
    10a0:	e50b3008 	str	r3, [fp, #-8]
  while((*s++ = *t++) != 0)
    10a4:	e320f000 	nop	{0}
    10a8:	e51b2014 	ldr	r2, [fp, #-20]	@ 0xffffffec
    10ac:	e2823001 	add	r3, r2, #1
    10b0:	e50b3014 	str	r3, [fp, #-20]	@ 0xffffffec
    10b4:	e51b3010 	ldr	r3, [fp, #-16]
    10b8:	e2831001 	add	r1, r3, #1
    10bc:	e50b1010 	str	r1, [fp, #-16]
    10c0:	e5d22000 	ldrb	r2, [r2]
    10c4:	e5c32000 	strb	r2, [r3]
    10c8:	e5d33000 	ldrb	r3, [r3]
    10cc:	e3530000 	cmp	r3, #0
    10d0:	1afffff4 	bne	10a8 <strcpy+0x20>
    ;
  return os;
    10d4:	e51b3008 	ldr	r3, [fp, #-8]
}
    10d8:	e1a00003 	mov	r0, r3
    10dc:	e28bd000 	add	sp, fp, #0
    10e0:	e49db004 	pop	{fp}		@ (ldr fp, [sp], #4)
    10e4:	e12fff1e 	bx	lr

000010e8 <strcmp>:

int
strcmp(const char *p, const char *q)
{
    10e8:	e52db004 	push	{fp}		@ (str fp, [sp, #-4]!)
    10ec:	e28db000 	add	fp, sp, #0
    10f0:	e24dd00c 	sub	sp, sp, #12
    10f4:	e50b0008 	str	r0, [fp, #-8]
    10f8:	e50b100c 	str	r1, [fp, #-12]
  while(*p && *p == *q)
    10fc:	ea000005 	b	1118 <strcmp+0x30>
    p++, q++;
    1100:	e51b3008 	ldr	r3, [fp, #-8]
    1104:	e2833001 	add	r3, r3, #1
    1108:	e50b3008 	str	r3, [fp, #-8]
    110c:	e51b300c 	ldr	r3, [fp, #-12]
    1110:	e2833001 	add	r3, r3, #1
    1114:	e50b300c 	str	r3, [fp, #-12]
  while(*p && *p == *q)
    1118:	e51b3008 	ldr	r3, [fp, #-8]
    111c:	e5d33000 	ldrb	r3, [r3]
    1120:	e3530000 	cmp	r3, #0
    1124:	0a000005 	beq	1140 <strcmp+0x58>
    1128:	e51b3008 	ldr	r3, [fp, #-8]
    112c:	e5d32000 	ldrb	r2, [r3]
    1130:	e51b300c 	ldr	r3, [fp, #-12]
    1134:	e5d33000 	ldrb	r3, [r3]
    1138:	e1520003 	cmp	r2, r3
    113c:	0affffef 	beq	1100 <strcmp+0x18>
  return (uchar)*p - (uchar)*q;
    1140:	e51b3008 	ldr	r3, [fp, #-8]
    1144:	e5d33000 	ldrb	r3, [r3]
    1148:	e1a02003 	mov	r2, r3
    114c:	e51b300c 	ldr	r3, [fp, #-12]
    1150:	e5d33000 	ldrb	r3, [r3]
    1154:	e0423003 	sub	r3, r2, r3
}
    1158:	e1a00003 	mov	r0, r3
    115c:	e28bd000 	add	sp, fp, #0
    1160:	e49db004 	pop	{fp}		@ (ldr fp, [sp], #4)
    1164:	e12fff1e 	bx	lr

00001168 <strlen>:

uint
strlen(char *s)
{
    1168:	e52db004 	push	{fp}		@ (str fp, [sp, #-4]!)
    116c:	e28db000 	add	fp, sp, #0
    1170:	e24dd014 	sub	sp, sp, #20
    1174:	e50b0010 	str	r0, [fp, #-16]
  int n;

  for(n = 0; s[n]; n++)
    1178:	e3a03000 	mov	r3, #0
    117c:	e50b3008 	str	r3, [fp, #-8]
    1180:	ea000002 	b	1190 <strlen+0x28>
    1184:	e51b3008 	ldr	r3, [fp, #-8]
    1188:	e2833001 	add	r3, r3, #1
    118c:	e50b3008 	str	r3, [fp, #-8]
    1190:	e51b3008 	ldr	r3, [fp, #-8]
    1194:	e51b2010 	ldr	r2, [fp, #-16]
    1198:	e0823003 	add	r3, r2, r3
    119c:	e5d33000 	ldrb	r3, [r3]
    11a0:	e3530000 	cmp	r3, #0
    11a4:	1afffff6 	bne	1184 <strlen+0x1c>
    ;
  return n;
    11a8:	e51b3008 	ldr	r3, [fp, #-8]
}
    11ac:	e1a00003 	mov	r0, r3
    11b0:	e28bd000 	add	sp, fp, #0
    11b4:	e49db004 	pop	{fp}		@ (ldr fp, [sp], #4)
    11b8:	e12fff1e 	bx	lr

000011bc <memset>:

void*
memset(void *dst, int c, uint n)
{
    11bc:	e52db004 	push	{fp}		@ (str fp, [sp, #-4]!)
    11c0:	e28db000 	add	fp, sp, #0
    11c4:	e24dd01c 	sub	sp, sp, #28
    11c8:	e50b0010 	str	r0, [fp, #-16]
    11cc:	e50b1014 	str	r1, [fp, #-20]	@ 0xffffffec
    11d0:	e50b2018 	str	r2, [fp, #-24]	@ 0xffffffe8
  char *p=dst;
    11d4:	e51b3010 	ldr	r3, [fp, #-16]
    11d8:	e50b3008 	str	r3, [fp, #-8]
  u32 rc=n;
    11dc:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
    11e0:	e50b300c 	str	r3, [fp, #-12]

  while (rc-- > 0) *p++ = c;
    11e4:	ea000005 	b	1200 <memset+0x44>
    11e8:	e51b3008 	ldr	r3, [fp, #-8]
    11ec:	e2832001 	add	r2, r3, #1
    11f0:	e50b2008 	str	r2, [fp, #-8]
    11f4:	e51b2014 	ldr	r2, [fp, #-20]	@ 0xffffffec
    11f8:	e6ef2072 	uxtb	r2, r2
    11fc:	e5c32000 	strb	r2, [r3]
    1200:	e51b300c 	ldr	r3, [fp, #-12]
    1204:	e2432001 	sub	r2, r3, #1
    1208:	e50b200c 	str	r2, [fp, #-12]
    120c:	e3530000 	cmp	r3, #0
    1210:	1afffff4 	bne	11e8 <memset+0x2c>
  return (void *)p;
    1214:	e51b3008 	ldr	r3, [fp, #-8]
}
    1218:	e1a00003 	mov	r0, r3
    121c:	e28bd000 	add	sp, fp, #0
    1220:	e49db004 	pop	{fp}		@ (ldr fp, [sp], #4)
    1224:	e12fff1e 	bx	lr

00001228 <strchr>:

char*
strchr(const char *s, char c)
{
    1228:	e52db004 	push	{fp}		@ (str fp, [sp, #-4]!)
    122c:	e28db000 	add	fp, sp, #0
    1230:	e24dd00c 	sub	sp, sp, #12
    1234:	e50b0008 	str	r0, [fp, #-8]
    1238:	e1a03001 	mov	r3, r1
    123c:	e54b3009 	strb	r3, [fp, #-9]
  for(; *s; s++)
    1240:	ea000009 	b	126c <strchr+0x44>
    if(*s == c)
    1244:	e51b3008 	ldr	r3, [fp, #-8]
    1248:	e5d33000 	ldrb	r3, [r3]
    124c:	e55b2009 	ldrb	r2, [fp, #-9]
    1250:	e1520003 	cmp	r2, r3
    1254:	1a000001 	bne	1260 <strchr+0x38>
      return (char*)s;
    1258:	e51b3008 	ldr	r3, [fp, #-8]
    125c:	ea000007 	b	1280 <strchr+0x58>
  for(; *s; s++)
    1260:	e51b3008 	ldr	r3, [fp, #-8]
    1264:	e2833001 	add	r3, r3, #1
    1268:	e50b3008 	str	r3, [fp, #-8]
    126c:	e51b3008 	ldr	r3, [fp, #-8]
    1270:	e5d33000 	ldrb	r3, [r3]
    1274:	e3530000 	cmp	r3, #0
    1278:	1afffff1 	bne	1244 <strchr+0x1c>
  return 0;
    127c:	e3a03000 	mov	r3, #0
}
    1280:	e1a00003 	mov	r0, r3
    1284:	e28bd000 	add	sp, fp, #0
    1288:	e49db004 	pop	{fp}		@ (ldr fp, [sp], #4)
    128c:	e12fff1e 	bx	lr

00001290 <gets>:

char*
gets(char *buf, int max)
{
    1290:	e92d4800 	push	{fp, lr}
    1294:	e28db004 	add	fp, sp, #4
    1298:	e24dd018 	sub	sp, sp, #24
    129c:	e50b0018 	str	r0, [fp, #-24]	@ 0xffffffe8
    12a0:	e50b101c 	str	r1, [fp, #-28]	@ 0xffffffe4
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    12a4:	e3a03000 	mov	r3, #0
    12a8:	e50b3008 	str	r3, [fp, #-8]
    12ac:	ea000016 	b	130c <gets+0x7c>
    cc = read(0, &c, 1);
    12b0:	e24b300d 	sub	r3, fp, #13
    12b4:	e3a02001 	mov	r2, #1
    12b8:	e1a01003 	mov	r1, r3
    12bc:	e3a00000 	mov	r0, #0
    12c0:	eb0000a8 	bl	1568 <read>
    12c4:	e50b000c 	str	r0, [fp, #-12]
    if(cc < 1)
    12c8:	e51b300c 	ldr	r3, [fp, #-12]
    12cc:	e3530000 	cmp	r3, #0
    12d0:	da000013 	ble	1324 <gets+0x94>
      break;
    buf[i++] = c;
    12d4:	e51b3008 	ldr	r3, [fp, #-8]
    12d8:	e2832001 	add	r2, r3, #1
    12dc:	e50b2008 	str	r2, [fp, #-8]
    12e0:	e1a02003 	mov	r2, r3
    12e4:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
    12e8:	e0833002 	add	r3, r3, r2
    12ec:	e55b200d 	ldrb	r2, [fp, #-13]
    12f0:	e5c32000 	strb	r2, [r3]
    if(c == '\n' || c == '\r')
    12f4:	e55b300d 	ldrb	r3, [fp, #-13]
    12f8:	e353000a 	cmp	r3, #10
    12fc:	0a000009 	beq	1328 <gets+0x98>
    1300:	e55b300d 	ldrb	r3, [fp, #-13]
    1304:	e353000d 	cmp	r3, #13
    1308:	0a000006 	beq	1328 <gets+0x98>
  for(i=0; i+1 < max; ){
    130c:	e51b3008 	ldr	r3, [fp, #-8]
    1310:	e2833001 	add	r3, r3, #1
    1314:	e51b201c 	ldr	r2, [fp, #-28]	@ 0xffffffe4
    1318:	e1520003 	cmp	r2, r3
    131c:	caffffe3 	bgt	12b0 <gets+0x20>
    1320:	ea000000 	b	1328 <gets+0x98>
      break;
    1324:	e320f000 	nop	{0}
      break;
  }
  buf[i] = '\0';
    1328:	e51b3008 	ldr	r3, [fp, #-8]
    132c:	e51b2018 	ldr	r2, [fp, #-24]	@ 0xffffffe8
    1330:	e0823003 	add	r3, r2, r3
    1334:	e3a02000 	mov	r2, #0
    1338:	e5c32000 	strb	r2, [r3]
  return buf;
    133c:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
}
    1340:	e1a00003 	mov	r0, r3
    1344:	e24bd004 	sub	sp, fp, #4
    1348:	e8bd8800 	pop	{fp, pc}

0000134c <stat>:

int
stat(char *n, struct stat *st)
{
    134c:	e92d4800 	push	{fp, lr}
    1350:	e28db004 	add	fp, sp, #4
    1354:	e24dd010 	sub	sp, sp, #16
    1358:	e50b0010 	str	r0, [fp, #-16]
    135c:	e50b1014 	str	r1, [fp, #-20]	@ 0xffffffec
  int fd;
  int r;

  fd = open(n, O_RDONLY);
    1360:	e3a01000 	mov	r1, #0
    1364:	e51b0010 	ldr	r0, [fp, #-16]
    1368:	eb0000bf 	bl	166c <open>
    136c:	e50b0008 	str	r0, [fp, #-8]
  if(fd < 0)
    1370:	e51b3008 	ldr	r3, [fp, #-8]
    1374:	e3530000 	cmp	r3, #0
    1378:	aa000001 	bge	1384 <stat+0x38>
    return -1;
    137c:	e3e03000 	mvn	r3, #0
    1380:	ea000006 	b	13a0 <stat+0x54>
  r = fstat(fd, st);
    1384:	e51b1014 	ldr	r1, [fp, #-20]	@ 0xffffffec
    1388:	e51b0008 	ldr	r0, [fp, #-8]
    138c:	eb0000dd 	bl	1708 <fstat>
    1390:	e50b000c 	str	r0, [fp, #-12]
  close(fd);
    1394:	e51b0008 	ldr	r0, [fp, #-8]
    1398:	eb00008c 	bl	15d0 <close>
  return r;
    139c:	e51b300c 	ldr	r3, [fp, #-12]
}
    13a0:	e1a00003 	mov	r0, r3
    13a4:	e24bd004 	sub	sp, fp, #4
    13a8:	e8bd8800 	pop	{fp, pc}

000013ac <atoi>:

int
atoi(const char *s)
{
    13ac:	e52db004 	push	{fp}		@ (str fp, [sp, #-4]!)
    13b0:	e28db000 	add	fp, sp, #0
    13b4:	e24dd014 	sub	sp, sp, #20
    13b8:	e50b0010 	str	r0, [fp, #-16]
  int n;

  n = 0;
    13bc:	e3a03000 	mov	r3, #0
    13c0:	e50b3008 	str	r3, [fp, #-8]
  while('0' <= *s && *s <= '9')
    13c4:	ea000009 	b	13f0 <atoi+0x44>
    n = n*10 + *s++ - '0';
    13c8:	e51b3008 	ldr	r3, [fp, #-8]
    13cc:	e3a0200a 	mov	r2, #10
    13d0:	e0020392 	mul	r2, r2, r3
    13d4:	e51b3010 	ldr	r3, [fp, #-16]
    13d8:	e2831001 	add	r1, r3, #1
    13dc:	e50b1010 	str	r1, [fp, #-16]
    13e0:	e5d33000 	ldrb	r3, [r3]
    13e4:	e0823003 	add	r3, r2, r3
    13e8:	e2433030 	sub	r3, r3, #48	@ 0x30
    13ec:	e50b3008 	str	r3, [fp, #-8]
  while('0' <= *s && *s <= '9')
    13f0:	e51b3010 	ldr	r3, [fp, #-16]
    13f4:	e5d33000 	ldrb	r3, [r3]
    13f8:	e353002f 	cmp	r3, #47	@ 0x2f
    13fc:	9a000003 	bls	1410 <atoi+0x64>
    1400:	e51b3010 	ldr	r3, [fp, #-16]
    1404:	e5d33000 	ldrb	r3, [r3]
    1408:	e3530039 	cmp	r3, #57	@ 0x39
    140c:	9affffed 	bls	13c8 <atoi+0x1c>
  return n;
    1410:	e51b3008 	ldr	r3, [fp, #-8]
}
    1414:	e1a00003 	mov	r0, r3
    1418:	e28bd000 	add	sp, fp, #0
    141c:	e49db004 	pop	{fp}		@ (ldr fp, [sp], #4)
    1420:	e12fff1e 	bx	lr

00001424 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
    1424:	e52db004 	push	{fp}		@ (str fp, [sp, #-4]!)
    1428:	e28db000 	add	fp, sp, #0
    142c:	e24dd01c 	sub	sp, sp, #28
    1430:	e50b0010 	str	r0, [fp, #-16]
    1434:	e50b1014 	str	r1, [fp, #-20]	@ 0xffffffec
    1438:	e50b2018 	str	r2, [fp, #-24]	@ 0xffffffe8
  char *dst, *src;
  
  dst = vdst;
    143c:	e51b3010 	ldr	r3, [fp, #-16]
    1440:	e50b3008 	str	r3, [fp, #-8]
  src = vsrc;
    1444:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
    1448:	e50b300c 	str	r3, [fp, #-12]
  while(n-- > 0)
    144c:	ea000007 	b	1470 <memmove+0x4c>
    *dst++ = *src++;
    1450:	e51b200c 	ldr	r2, [fp, #-12]
    1454:	e2823001 	add	r3, r2, #1
    1458:	e50b300c 	str	r3, [fp, #-12]
    145c:	e51b3008 	ldr	r3, [fp, #-8]
    1460:	e2831001 	add	r1, r3, #1
    1464:	e50b1008 	str	r1, [fp, #-8]
    1468:	e5d22000 	ldrb	r2, [r2]
    146c:	e5c32000 	strb	r2, [r3]
  while(n-- > 0)
    1470:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
    1474:	e2432001 	sub	r2, r3, #1
    1478:	e50b2018 	str	r2, [fp, #-24]	@ 0xffffffe8
    147c:	e3530000 	cmp	r3, #0
    1480:	cafffff2 	bgt	1450 <memmove+0x2c>
  return vdst;
    1484:	e51b3010 	ldr	r3, [fp, #-16]
}
    1488:	e1a00003 	mov	r0, r3
    148c:	e28bd000 	add	sp, fp, #0
    1490:	e49db004 	pop	{fp}		@ (ldr fp, [sp], #4)
    1494:	e12fff1e 	bx	lr

00001498 <fork>:
    1498:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
    149c:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
    14a0:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
    14a4:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
    14a8:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
    14ac:	e3a00001 	mov	r0, #1
    14b0:	ef000040 	svc	0x00000040
    14b4:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
    14b8:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
    14bc:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
    14c0:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
    14c4:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
    14c8:	e12fff1e 	bx	lr

000014cc <exit>:
    14cc:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
    14d0:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
    14d4:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
    14d8:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
    14dc:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
    14e0:	e3a00002 	mov	r0, #2
    14e4:	ef000040 	svc	0x00000040
    14e8:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
    14ec:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
    14f0:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
    14f4:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
    14f8:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
    14fc:	e12fff1e 	bx	lr

00001500 <wait>:
    1500:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
    1504:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
    1508:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
    150c:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
    1510:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
    1514:	e3a00003 	mov	r0, #3
    1518:	ef000040 	svc	0x00000040
    151c:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
    1520:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
    1524:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
    1528:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
    152c:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
    1530:	e12fff1e 	bx	lr

00001534 <pipe>:
    1534:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
    1538:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
    153c:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
    1540:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
    1544:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
    1548:	e3a00004 	mov	r0, #4
    154c:	ef000040 	svc	0x00000040
    1550:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
    1554:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
    1558:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
    155c:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
    1560:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
    1564:	e12fff1e 	bx	lr

00001568 <read>:
    1568:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
    156c:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
    1570:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
    1574:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
    1578:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
    157c:	e3a00005 	mov	r0, #5
    1580:	ef000040 	svc	0x00000040
    1584:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
    1588:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
    158c:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
    1590:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
    1594:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
    1598:	e12fff1e 	bx	lr

0000159c <write>:
    159c:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
    15a0:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
    15a4:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
    15a8:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
    15ac:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
    15b0:	e3a00010 	mov	r0, #16
    15b4:	ef000040 	svc	0x00000040
    15b8:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
    15bc:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
    15c0:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
    15c4:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
    15c8:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
    15cc:	e12fff1e 	bx	lr

000015d0 <close>:
    15d0:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
    15d4:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
    15d8:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
    15dc:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
    15e0:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
    15e4:	e3a00015 	mov	r0, #21
    15e8:	ef000040 	svc	0x00000040
    15ec:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
    15f0:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
    15f4:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
    15f8:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
    15fc:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
    1600:	e12fff1e 	bx	lr

00001604 <kill>:
    1604:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
    1608:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
    160c:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
    1610:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
    1614:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
    1618:	e3a00006 	mov	r0, #6
    161c:	ef000040 	svc	0x00000040
    1620:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
    1624:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
    1628:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
    162c:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
    1630:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
    1634:	e12fff1e 	bx	lr

00001638 <exec>:
    1638:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
    163c:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
    1640:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
    1644:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
    1648:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
    164c:	e3a00007 	mov	r0, #7
    1650:	ef000040 	svc	0x00000040
    1654:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
    1658:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
    165c:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
    1660:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
    1664:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
    1668:	e12fff1e 	bx	lr

0000166c <open>:
    166c:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
    1670:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
    1674:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
    1678:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
    167c:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
    1680:	e3a0000f 	mov	r0, #15
    1684:	ef000040 	svc	0x00000040
    1688:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
    168c:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
    1690:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
    1694:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
    1698:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
    169c:	e12fff1e 	bx	lr

000016a0 <mknod>:
    16a0:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
    16a4:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
    16a8:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
    16ac:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
    16b0:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
    16b4:	e3a00011 	mov	r0, #17
    16b8:	ef000040 	svc	0x00000040
    16bc:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
    16c0:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
    16c4:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
    16c8:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
    16cc:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
    16d0:	e12fff1e 	bx	lr

000016d4 <unlink>:
    16d4:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
    16d8:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
    16dc:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
    16e0:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
    16e4:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
    16e8:	e3a00012 	mov	r0, #18
    16ec:	ef000040 	svc	0x00000040
    16f0:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
    16f4:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
    16f8:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
    16fc:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
    1700:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
    1704:	e12fff1e 	bx	lr

00001708 <fstat>:
    1708:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
    170c:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
    1710:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
    1714:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
    1718:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
    171c:	e3a00008 	mov	r0, #8
    1720:	ef000040 	svc	0x00000040
    1724:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
    1728:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
    172c:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
    1730:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
    1734:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
    1738:	e12fff1e 	bx	lr

0000173c <link>:
    173c:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
    1740:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
    1744:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
    1748:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
    174c:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
    1750:	e3a00013 	mov	r0, #19
    1754:	ef000040 	svc	0x00000040
    1758:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
    175c:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
    1760:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
    1764:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
    1768:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
    176c:	e12fff1e 	bx	lr

00001770 <mkdir>:
    1770:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
    1774:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
    1778:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
    177c:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
    1780:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
    1784:	e3a00014 	mov	r0, #20
    1788:	ef000040 	svc	0x00000040
    178c:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
    1790:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
    1794:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
    1798:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
    179c:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
    17a0:	e12fff1e 	bx	lr

000017a4 <chdir>:
    17a4:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
    17a8:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
    17ac:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
    17b0:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
    17b4:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
    17b8:	e3a00009 	mov	r0, #9
    17bc:	ef000040 	svc	0x00000040
    17c0:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
    17c4:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
    17c8:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
    17cc:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
    17d0:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
    17d4:	e12fff1e 	bx	lr

000017d8 <dup>:
    17d8:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
    17dc:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
    17e0:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
    17e4:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
    17e8:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
    17ec:	e3a0000a 	mov	r0, #10
    17f0:	ef000040 	svc	0x00000040
    17f4:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
    17f8:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
    17fc:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
    1800:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
    1804:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
    1808:	e12fff1e 	bx	lr

0000180c <getpid>:
    180c:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
    1810:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
    1814:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
    1818:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
    181c:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
    1820:	e3a0000b 	mov	r0, #11
    1824:	ef000040 	svc	0x00000040
    1828:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
    182c:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
    1830:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
    1834:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
    1838:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
    183c:	e12fff1e 	bx	lr

00001840 <sbrk>:
    1840:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
    1844:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
    1848:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
    184c:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
    1850:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
    1854:	e3a0000c 	mov	r0, #12
    1858:	ef000040 	svc	0x00000040
    185c:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
    1860:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
    1864:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
    1868:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
    186c:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
    1870:	e12fff1e 	bx	lr

00001874 <sleep>:
    1874:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
    1878:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
    187c:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
    1880:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
    1884:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
    1888:	e3a0000d 	mov	r0, #13
    188c:	ef000040 	svc	0x00000040
    1890:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
    1894:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
    1898:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
    189c:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
    18a0:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
    18a4:	e12fff1e 	bx	lr

000018a8 <uptime>:
    18a8:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
    18ac:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
    18b0:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
    18b4:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
    18b8:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
    18bc:	e3a0000e 	mov	r0, #14
    18c0:	ef000040 	svc	0x00000040
    18c4:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
    18c8:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
    18cc:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
    18d0:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
    18d4:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
    18d8:	e12fff1e 	bx	lr

000018dc <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
    18dc:	e92d4800 	push	{fp, lr}
    18e0:	e28db004 	add	fp, sp, #4
    18e4:	e24dd008 	sub	sp, sp, #8
    18e8:	e50b0008 	str	r0, [fp, #-8]
    18ec:	e1a03001 	mov	r3, r1
    18f0:	e54b3009 	strb	r3, [fp, #-9]
  write(fd, &c, 1);
    18f4:	e24b3009 	sub	r3, fp, #9
    18f8:	e3a02001 	mov	r2, #1
    18fc:	e1a01003 	mov	r1, r3
    1900:	e51b0008 	ldr	r0, [fp, #-8]
    1904:	ebffff24 	bl	159c <write>
}
    1908:	e320f000 	nop	{0}
    190c:	e24bd004 	sub	sp, fp, #4
    1910:	e8bd8800 	pop	{fp, pc}

00001914 <div>:

u32 div(u32 n, u32 d)  // long division
{
    1914:	e52db004 	push	{fp}		@ (str fp, [sp, #-4]!)
    1918:	e28db000 	add	fp, sp, #0
    191c:	e24dd01c 	sub	sp, sp, #28
    1920:	e50b0018 	str	r0, [fp, #-24]	@ 0xffffffe8
    1924:	e50b101c 	str	r1, [fp, #-28]	@ 0xffffffe4
    u32 q=0, r=0;
    1928:	e3a03000 	mov	r3, #0
    192c:	e50b3008 	str	r3, [fp, #-8]
    1930:	e3a03000 	mov	r3, #0
    1934:	e50b300c 	str	r3, [fp, #-12]
    int i;

    for(i=31;i>=0;i--){
    1938:	e3a0301f 	mov	r3, #31
    193c:	e50b3010 	str	r3, [fp, #-16]
    1940:	ea00001b 	b	19b4 <div+0xa0>
        r = r << 1;
    1944:	e51b300c 	ldr	r3, [fp, #-12]
    1948:	e1a03083 	lsl	r3, r3, #1
    194c:	e50b300c 	str	r3, [fp, #-12]
        r = r | ((n >> i) & 1);
    1950:	e51b2018 	ldr	r2, [fp, #-24]	@ 0xffffffe8
    1954:	e51b3010 	ldr	r3, [fp, #-16]
    1958:	e1a03332 	lsr	r3, r2, r3
    195c:	e2033001 	and	r3, r3, #1
    1960:	e51b200c 	ldr	r2, [fp, #-12]
    1964:	e1823003 	orr	r3, r2, r3
    1968:	e50b300c 	str	r3, [fp, #-12]
        if(r >= d) {
    196c:	e51b200c 	ldr	r2, [fp, #-12]
    1970:	e51b301c 	ldr	r3, [fp, #-28]	@ 0xffffffe4
    1974:	e1520003 	cmp	r2, r3
    1978:	3a00000a 	bcc	19a8 <div+0x94>
            r = r - d;
    197c:	e51b200c 	ldr	r2, [fp, #-12]
    1980:	e51b301c 	ldr	r3, [fp, #-28]	@ 0xffffffe4
    1984:	e0423003 	sub	r3, r2, r3
    1988:	e50b300c 	str	r3, [fp, #-12]
            q = q | (1 << i);
    198c:	e3a02001 	mov	r2, #1
    1990:	e51b3010 	ldr	r3, [fp, #-16]
    1994:	e1a03312 	lsl	r3, r2, r3
    1998:	e1a02003 	mov	r2, r3
    199c:	e51b3008 	ldr	r3, [fp, #-8]
    19a0:	e1833002 	orr	r3, r3, r2
    19a4:	e50b3008 	str	r3, [fp, #-8]
    for(i=31;i>=0;i--){
    19a8:	e51b3010 	ldr	r3, [fp, #-16]
    19ac:	e2433001 	sub	r3, r3, #1
    19b0:	e50b3010 	str	r3, [fp, #-16]
    19b4:	e51b3010 	ldr	r3, [fp, #-16]
    19b8:	e3530000 	cmp	r3, #0
    19bc:	aaffffe0 	bge	1944 <div+0x30>
        }
    }
    return q;
    19c0:	e51b3008 	ldr	r3, [fp, #-8]
}
    19c4:	e1a00003 	mov	r0, r3
    19c8:	e28bd000 	add	sp, fp, #0
    19cc:	e49db004 	pop	{fp}		@ (ldr fp, [sp], #4)
    19d0:	e12fff1e 	bx	lr

000019d4 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
    19d4:	e92d4800 	push	{fp, lr}
    19d8:	e28db004 	add	fp, sp, #4
    19dc:	e24dd038 	sub	sp, sp, #56	@ 0x38
    19e0:	e50b0030 	str	r0, [fp, #-48]	@ 0xffffffd0
    19e4:	e50b1034 	str	r1, [fp, #-52]	@ 0xffffffcc
    19e8:	e50b2038 	str	r2, [fp, #-56]	@ 0xffffffc8
    19ec:	e50b303c 	str	r3, [fp, #-60]	@ 0xffffffc4
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x, y, b;

  neg = 0;
    19f0:	e3a03000 	mov	r3, #0
    19f4:	e50b300c 	str	r3, [fp, #-12]
  if(sgn && xx < 0){
    19f8:	e51b303c 	ldr	r3, [fp, #-60]	@ 0xffffffc4
    19fc:	e3530000 	cmp	r3, #0
    1a00:	0a000008 	beq	1a28 <printint+0x54>
    1a04:	e51b3034 	ldr	r3, [fp, #-52]	@ 0xffffffcc
    1a08:	e3530000 	cmp	r3, #0
    1a0c:	aa000005 	bge	1a28 <printint+0x54>
    neg = 1;
    1a10:	e3a03001 	mov	r3, #1
    1a14:	e50b300c 	str	r3, [fp, #-12]
    x = -xx;
    1a18:	e51b3034 	ldr	r3, [fp, #-52]	@ 0xffffffcc
    1a1c:	e2633000 	rsb	r3, r3, #0
    1a20:	e50b3010 	str	r3, [fp, #-16]
    1a24:	ea000001 	b	1a30 <printint+0x5c>
  } else {
    x = xx;
    1a28:	e51b3034 	ldr	r3, [fp, #-52]	@ 0xffffffcc
    1a2c:	e50b3010 	str	r3, [fp, #-16]
  }

  b = base;
    1a30:	e51b3038 	ldr	r3, [fp, #-56]	@ 0xffffffc8
    1a34:	e50b3014 	str	r3, [fp, #-20]	@ 0xffffffec
  i = 0;
    1a38:	e3a03000 	mov	r3, #0
    1a3c:	e50b3008 	str	r3, [fp, #-8]
  do{
    y = div(x, b);
    1a40:	e51b1014 	ldr	r1, [fp, #-20]	@ 0xffffffec
    1a44:	e51b0010 	ldr	r0, [fp, #-16]
    1a48:	ebffffb1 	bl	1914 <div>
    1a4c:	e50b0018 	str	r0, [fp, #-24]	@ 0xffffffe8
    buf[i++] = digits[x - y * b];
    1a50:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
    1a54:	e51b2014 	ldr	r2, [fp, #-20]	@ 0xffffffec
    1a58:	e0030392 	mul	r3, r2, r3
    1a5c:	e51b2010 	ldr	r2, [fp, #-16]
    1a60:	e0421003 	sub	r1, r2, r3
    1a64:	e51b2008 	ldr	r2, [fp, #-8]
    1a68:	e2823001 	add	r3, r2, #1
    1a6c:	e50b3008 	str	r3, [fp, #-8]
    1a70:	e30231cc 	movw	r3, #8652	@ 0x21cc
    1a74:	e3403000 	movt	r3, #0
    1a78:	e7d31001 	ldrb	r1, [r3, r1]
    1a7c:	e2423004 	sub	r3, r2, #4
    1a80:	e083300b 	add	r3, r3, fp
    1a84:	e1a02001 	mov	r2, r1
    1a88:	e5432024 	strb	r2, [r3, #-36]	@ 0xffffffdc
  }while((x = y) != 0);
    1a8c:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
    1a90:	e50b3010 	str	r3, [fp, #-16]
    1a94:	e51b3010 	ldr	r3, [fp, #-16]
    1a98:	e3530000 	cmp	r3, #0
    1a9c:	1affffe7 	bne	1a40 <printint+0x6c>
  if(neg)
    1aa0:	e51b300c 	ldr	r3, [fp, #-12]
    1aa4:	e3530000 	cmp	r3, #0
    1aa8:	0a00000e 	beq	1ae8 <printint+0x114>
    buf[i++] = '-';
    1aac:	e51b3008 	ldr	r3, [fp, #-8]
    1ab0:	e2832001 	add	r2, r3, #1
    1ab4:	e50b2008 	str	r2, [fp, #-8]
    1ab8:	e2433004 	sub	r3, r3, #4
    1abc:	e083300b 	add	r3, r3, fp
    1ac0:	e3a0202d 	mov	r2, #45	@ 0x2d
    1ac4:	e5432024 	strb	r2, [r3, #-36]	@ 0xffffffdc

  while(--i >= 0)
    1ac8:	ea000006 	b	1ae8 <printint+0x114>
    putc(fd, buf[i]);
    1acc:	e24b2028 	sub	r2, fp, #40	@ 0x28
    1ad0:	e51b3008 	ldr	r3, [fp, #-8]
    1ad4:	e0823003 	add	r3, r2, r3
    1ad8:	e5d33000 	ldrb	r3, [r3]
    1adc:	e1a01003 	mov	r1, r3
    1ae0:	e51b0030 	ldr	r0, [fp, #-48]	@ 0xffffffd0
    1ae4:	ebffff7c 	bl	18dc <putc>
  while(--i >= 0)
    1ae8:	e51b3008 	ldr	r3, [fp, #-8]
    1aec:	e2433001 	sub	r3, r3, #1
    1af0:	e50b3008 	str	r3, [fp, #-8]
    1af4:	e51b3008 	ldr	r3, [fp, #-8]
    1af8:	e3530000 	cmp	r3, #0
    1afc:	aafffff2 	bge	1acc <printint+0xf8>
}
    1b00:	e320f000 	nop	{0}
    1b04:	e320f000 	nop	{0}
    1b08:	e24bd004 	sub	sp, fp, #4
    1b0c:	e8bd8800 	pop	{fp, pc}

00001b10 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
    1b10:	e92d000e 	push	{r1, r2, r3}
    1b14:	e92d4800 	push	{fp, lr}
    1b18:	e28db004 	add	fp, sp, #4
    1b1c:	e24dd024 	sub	sp, sp, #36	@ 0x24
    1b20:	e50b0024 	str	r0, [fp, #-36]	@ 0xffffffdc
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
    1b24:	e3a03000 	mov	r3, #0
    1b28:	e50b3014 	str	r3, [fp, #-20]	@ 0xffffffec
  ap = (uint*)(void*)&fmt + 1;
    1b2c:	e28b3008 	add	r3, fp, #8
    1b30:	e50b3018 	str	r3, [fp, #-24]	@ 0xffffffe8
  for(i = 0; fmt[i]; i++){
    1b34:	e3a03000 	mov	r3, #0
    1b38:	e50b3010 	str	r3, [fp, #-16]
    1b3c:	ea000075 	b	1d18 <printf+0x208>
    c = fmt[i] & 0xff;
    1b40:	e59b2004 	ldr	r2, [fp, #4]
    1b44:	e51b3010 	ldr	r3, [fp, #-16]
    1b48:	e0823003 	add	r3, r2, r3
    1b4c:	e5d33000 	ldrb	r3, [r3]
    1b50:	e50b301c 	str	r3, [fp, #-28]	@ 0xffffffe4
    if(state == 0){
    1b54:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
    1b58:	e3530000 	cmp	r3, #0
    1b5c:	1a00000b 	bne	1b90 <printf+0x80>
      if(c == '%'){
    1b60:	e51b301c 	ldr	r3, [fp, #-28]	@ 0xffffffe4
    1b64:	e3530025 	cmp	r3, #37	@ 0x25
    1b68:	1a000002 	bne	1b78 <printf+0x68>
        state = '%';
    1b6c:	e3a03025 	mov	r3, #37	@ 0x25
    1b70:	e50b3014 	str	r3, [fp, #-20]	@ 0xffffffec
    1b74:	ea000064 	b	1d0c <printf+0x1fc>
      } else {
        putc(fd, c);
    1b78:	e51b301c 	ldr	r3, [fp, #-28]	@ 0xffffffe4
    1b7c:	e6ef3073 	uxtb	r3, r3
    1b80:	e1a01003 	mov	r1, r3
    1b84:	e51b0024 	ldr	r0, [fp, #-36]	@ 0xffffffdc
    1b88:	ebffff53 	bl	18dc <putc>
    1b8c:	ea00005e 	b	1d0c <printf+0x1fc>
      }
    } else if(state == '%'){
    1b90:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
    1b94:	e3530025 	cmp	r3, #37	@ 0x25
    1b98:	1a00005b 	bne	1d0c <printf+0x1fc>
      if(c == 'd'){
    1b9c:	e51b301c 	ldr	r3, [fp, #-28]	@ 0xffffffe4
    1ba0:	e3530064 	cmp	r3, #100	@ 0x64
    1ba4:	1a00000a 	bne	1bd4 <printf+0xc4>
        printint(fd, *ap, 10, 1);
    1ba8:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
    1bac:	e5933000 	ldr	r3, [r3]
    1bb0:	e1a01003 	mov	r1, r3
    1bb4:	e3a03001 	mov	r3, #1
    1bb8:	e3a0200a 	mov	r2, #10
    1bbc:	e51b0024 	ldr	r0, [fp, #-36]	@ 0xffffffdc
    1bc0:	ebffff83 	bl	19d4 <printint>
        ap++;
    1bc4:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
    1bc8:	e2833004 	add	r3, r3, #4
    1bcc:	e50b3018 	str	r3, [fp, #-24]	@ 0xffffffe8
    1bd0:	ea00004b 	b	1d04 <printf+0x1f4>
      } else if(c == 'x' || c == 'p'){
    1bd4:	e51b301c 	ldr	r3, [fp, #-28]	@ 0xffffffe4
    1bd8:	e3530078 	cmp	r3, #120	@ 0x78
    1bdc:	0a000002 	beq	1bec <printf+0xdc>
    1be0:	e51b301c 	ldr	r3, [fp, #-28]	@ 0xffffffe4
    1be4:	e3530070 	cmp	r3, #112	@ 0x70
    1be8:	1a00000a 	bne	1c18 <printf+0x108>
        printint(fd, *ap, 16, 0);
    1bec:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
    1bf0:	e5933000 	ldr	r3, [r3]
    1bf4:	e1a01003 	mov	r1, r3
    1bf8:	e3a03000 	mov	r3, #0
    1bfc:	e3a02010 	mov	r2, #16
    1c00:	e51b0024 	ldr	r0, [fp, #-36]	@ 0xffffffdc
    1c04:	ebffff72 	bl	19d4 <printint>
        ap++;
    1c08:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
    1c0c:	e2833004 	add	r3, r3, #4
    1c10:	e50b3018 	str	r3, [fp, #-24]	@ 0xffffffe8
    1c14:	ea00003a 	b	1d04 <printf+0x1f4>
      } else if(c == 's'){
    1c18:	e51b301c 	ldr	r3, [fp, #-28]	@ 0xffffffe4
    1c1c:	e3530073 	cmp	r3, #115	@ 0x73
    1c20:	1a000019 	bne	1c8c <printf+0x17c>
        s = (char*)*ap;
    1c24:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
    1c28:	e5933000 	ldr	r3, [r3]
    1c2c:	e50b300c 	str	r3, [fp, #-12]
        ap++;
    1c30:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
    1c34:	e2833004 	add	r3, r3, #4
    1c38:	e50b3018 	str	r3, [fp, #-24]	@ 0xffffffe8
        if(s == 0)
    1c3c:	e51b300c 	ldr	r3, [fp, #-12]
    1c40:	e3530000 	cmp	r3, #0
    1c44:	1a00000b 	bne	1c78 <printf+0x168>
          s = "(null)";
    1c48:	e30231b4 	movw	r3, #8628	@ 0x21b4
    1c4c:	e3403000 	movt	r3, #0
    1c50:	e50b300c 	str	r3, [fp, #-12]
        while(*s != 0){
    1c54:	ea000007 	b	1c78 <printf+0x168>
          putc(fd, *s);
    1c58:	e51b300c 	ldr	r3, [fp, #-12]
    1c5c:	e5d33000 	ldrb	r3, [r3]
    1c60:	e1a01003 	mov	r1, r3
    1c64:	e51b0024 	ldr	r0, [fp, #-36]	@ 0xffffffdc
    1c68:	ebffff1b 	bl	18dc <putc>
          s++;
    1c6c:	e51b300c 	ldr	r3, [fp, #-12]
    1c70:	e2833001 	add	r3, r3, #1
    1c74:	e50b300c 	str	r3, [fp, #-12]
        while(*s != 0){
    1c78:	e51b300c 	ldr	r3, [fp, #-12]
    1c7c:	e5d33000 	ldrb	r3, [r3]
    1c80:	e3530000 	cmp	r3, #0
    1c84:	1afffff3 	bne	1c58 <printf+0x148>
    1c88:	ea00001d 	b	1d04 <printf+0x1f4>
        }
      } else if(c == 'c'){
    1c8c:	e51b301c 	ldr	r3, [fp, #-28]	@ 0xffffffe4
    1c90:	e3530063 	cmp	r3, #99	@ 0x63
    1c94:	1a000009 	bne	1cc0 <printf+0x1b0>
        putc(fd, *ap);
    1c98:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
    1c9c:	e5933000 	ldr	r3, [r3]
    1ca0:	e6ef3073 	uxtb	r3, r3
    1ca4:	e1a01003 	mov	r1, r3
    1ca8:	e51b0024 	ldr	r0, [fp, #-36]	@ 0xffffffdc
    1cac:	ebffff0a 	bl	18dc <putc>
        ap++;
    1cb0:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
    1cb4:	e2833004 	add	r3, r3, #4
    1cb8:	e50b3018 	str	r3, [fp, #-24]	@ 0xffffffe8
    1cbc:	ea000010 	b	1d04 <printf+0x1f4>
      } else if(c == '%'){
    1cc0:	e51b301c 	ldr	r3, [fp, #-28]	@ 0xffffffe4
    1cc4:	e3530025 	cmp	r3, #37	@ 0x25
    1cc8:	1a000005 	bne	1ce4 <printf+0x1d4>
        putc(fd, c);
    1ccc:	e51b301c 	ldr	r3, [fp, #-28]	@ 0xffffffe4
    1cd0:	e6ef3073 	uxtb	r3, r3
    1cd4:	e1a01003 	mov	r1, r3
    1cd8:	e51b0024 	ldr	r0, [fp, #-36]	@ 0xffffffdc
    1cdc:	ebfffefe 	bl	18dc <putc>
    1ce0:	ea000007 	b	1d04 <printf+0x1f4>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
    1ce4:	e3a01025 	mov	r1, #37	@ 0x25
    1ce8:	e51b0024 	ldr	r0, [fp, #-36]	@ 0xffffffdc
    1cec:	ebfffefa 	bl	18dc <putc>
        putc(fd, c);
    1cf0:	e51b301c 	ldr	r3, [fp, #-28]	@ 0xffffffe4
    1cf4:	e6ef3073 	uxtb	r3, r3
    1cf8:	e1a01003 	mov	r1, r3
    1cfc:	e51b0024 	ldr	r0, [fp, #-36]	@ 0xffffffdc
    1d00:	ebfffef5 	bl	18dc <putc>
      }
      state = 0;
    1d04:	e3a03000 	mov	r3, #0
    1d08:	e50b3014 	str	r3, [fp, #-20]	@ 0xffffffec
  for(i = 0; fmt[i]; i++){
    1d0c:	e51b3010 	ldr	r3, [fp, #-16]
    1d10:	e2833001 	add	r3, r3, #1
    1d14:	e50b3010 	str	r3, [fp, #-16]
    1d18:	e59b2004 	ldr	r2, [fp, #4]
    1d1c:	e51b3010 	ldr	r3, [fp, #-16]
    1d20:	e0823003 	add	r3, r2, r3
    1d24:	e5d33000 	ldrb	r3, [r3]
    1d28:	e3530000 	cmp	r3, #0
    1d2c:	1affff83 	bne	1b40 <printf+0x30>
    }
  }
}
    1d30:	e320f000 	nop	{0}
    1d34:	e320f000 	nop	{0}
    1d38:	e24bd004 	sub	sp, fp, #4
    1d3c:	e8bd4800 	pop	{fp, lr}
    1d40:	e28dd00c 	add	sp, sp, #12
    1d44:	e12fff1e 	bx	lr

00001d48 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    1d48:	e52db004 	push	{fp}		@ (str fp, [sp, #-4]!)
    1d4c:	e28db000 	add	fp, sp, #0
    1d50:	e24dd014 	sub	sp, sp, #20
    1d54:	e50b0010 	str	r0, [fp, #-16]
  Header *bp, *p;

  bp = (Header*)ap - 1;
    1d58:	e51b3010 	ldr	r3, [fp, #-16]
    1d5c:	e2433008 	sub	r3, r3, #8
    1d60:	e50b300c 	str	r3, [fp, #-12]
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1d64:	e302324c 	movw	r3, #8780	@ 0x224c
    1d68:	e3403000 	movt	r3, #0
    1d6c:	e5933000 	ldr	r3, [r3]
    1d70:	e50b3008 	str	r3, [fp, #-8]
    1d74:	ea000010 	b	1dbc <free+0x74>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    1d78:	e51b3008 	ldr	r3, [fp, #-8]
    1d7c:	e5933000 	ldr	r3, [r3]
    1d80:	e51b2008 	ldr	r2, [fp, #-8]
    1d84:	e1520003 	cmp	r2, r3
    1d88:	3a000008 	bcc	1db0 <free+0x68>
    1d8c:	e51b200c 	ldr	r2, [fp, #-12]
    1d90:	e51b3008 	ldr	r3, [fp, #-8]
    1d94:	e1520003 	cmp	r2, r3
    1d98:	8a000010 	bhi	1de0 <free+0x98>
    1d9c:	e51b3008 	ldr	r3, [fp, #-8]
    1da0:	e5933000 	ldr	r3, [r3]
    1da4:	e51b200c 	ldr	r2, [fp, #-12]
    1da8:	e1520003 	cmp	r2, r3
    1dac:	3a00000b 	bcc	1de0 <free+0x98>
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1db0:	e51b3008 	ldr	r3, [fp, #-8]
    1db4:	e5933000 	ldr	r3, [r3]
    1db8:	e50b3008 	str	r3, [fp, #-8]
    1dbc:	e51b200c 	ldr	r2, [fp, #-12]
    1dc0:	e51b3008 	ldr	r3, [fp, #-8]
    1dc4:	e1520003 	cmp	r2, r3
    1dc8:	9affffea 	bls	1d78 <free+0x30>
    1dcc:	e51b3008 	ldr	r3, [fp, #-8]
    1dd0:	e5933000 	ldr	r3, [r3]
    1dd4:	e51b200c 	ldr	r2, [fp, #-12]
    1dd8:	e1520003 	cmp	r2, r3
    1ddc:	2affffe5 	bcs	1d78 <free+0x30>
      break;
  if(bp + bp->s.size == p->s.ptr){
    1de0:	e51b300c 	ldr	r3, [fp, #-12]
    1de4:	e5933004 	ldr	r3, [r3, #4]
    1de8:	e1a03183 	lsl	r3, r3, #3
    1dec:	e51b200c 	ldr	r2, [fp, #-12]
    1df0:	e0822003 	add	r2, r2, r3
    1df4:	e51b3008 	ldr	r3, [fp, #-8]
    1df8:	e5933000 	ldr	r3, [r3]
    1dfc:	e1520003 	cmp	r2, r3
    1e00:	1a00000d 	bne	1e3c <free+0xf4>
    bp->s.size += p->s.ptr->s.size;
    1e04:	e51b300c 	ldr	r3, [fp, #-12]
    1e08:	e5932004 	ldr	r2, [r3, #4]
    1e0c:	e51b3008 	ldr	r3, [fp, #-8]
    1e10:	e5933000 	ldr	r3, [r3]
    1e14:	e5933004 	ldr	r3, [r3, #4]
    1e18:	e0822003 	add	r2, r2, r3
    1e1c:	e51b300c 	ldr	r3, [fp, #-12]
    1e20:	e5832004 	str	r2, [r3, #4]
    bp->s.ptr = p->s.ptr->s.ptr;
    1e24:	e51b3008 	ldr	r3, [fp, #-8]
    1e28:	e5933000 	ldr	r3, [r3]
    1e2c:	e5932000 	ldr	r2, [r3]
    1e30:	e51b300c 	ldr	r3, [fp, #-12]
    1e34:	e5832000 	str	r2, [r3]
    1e38:	ea000003 	b	1e4c <free+0x104>
  } else
    bp->s.ptr = p->s.ptr;
    1e3c:	e51b3008 	ldr	r3, [fp, #-8]
    1e40:	e5932000 	ldr	r2, [r3]
    1e44:	e51b300c 	ldr	r3, [fp, #-12]
    1e48:	e5832000 	str	r2, [r3]
  if(p + p->s.size == bp){
    1e4c:	e51b3008 	ldr	r3, [fp, #-8]
    1e50:	e5933004 	ldr	r3, [r3, #4]
    1e54:	e1a03183 	lsl	r3, r3, #3
    1e58:	e51b2008 	ldr	r2, [fp, #-8]
    1e5c:	e0823003 	add	r3, r2, r3
    1e60:	e51b200c 	ldr	r2, [fp, #-12]
    1e64:	e1520003 	cmp	r2, r3
    1e68:	1a00000b 	bne	1e9c <free+0x154>
    p->s.size += bp->s.size;
    1e6c:	e51b3008 	ldr	r3, [fp, #-8]
    1e70:	e5932004 	ldr	r2, [r3, #4]
    1e74:	e51b300c 	ldr	r3, [fp, #-12]
    1e78:	e5933004 	ldr	r3, [r3, #4]
    1e7c:	e0822003 	add	r2, r2, r3
    1e80:	e51b3008 	ldr	r3, [fp, #-8]
    1e84:	e5832004 	str	r2, [r3, #4]
    p->s.ptr = bp->s.ptr;
    1e88:	e51b300c 	ldr	r3, [fp, #-12]
    1e8c:	e5932000 	ldr	r2, [r3]
    1e90:	e51b3008 	ldr	r3, [fp, #-8]
    1e94:	e5832000 	str	r2, [r3]
    1e98:	ea000002 	b	1ea8 <free+0x160>
  } else
    p->s.ptr = bp;
    1e9c:	e51b3008 	ldr	r3, [fp, #-8]
    1ea0:	e51b200c 	ldr	r2, [fp, #-12]
    1ea4:	e5832000 	str	r2, [r3]
  freep = p;
    1ea8:	e302324c 	movw	r3, #8780	@ 0x224c
    1eac:	e3403000 	movt	r3, #0
    1eb0:	e51b2008 	ldr	r2, [fp, #-8]
    1eb4:	e5832000 	str	r2, [r3]
}
    1eb8:	e320f000 	nop	{0}
    1ebc:	e28bd000 	add	sp, fp, #0
    1ec0:	e49db004 	pop	{fp}		@ (ldr fp, [sp], #4)
    1ec4:	e12fff1e 	bx	lr

00001ec8 <morecore>:

static Header*
morecore(uint nu)
{
    1ec8:	e92d4800 	push	{fp, lr}
    1ecc:	e28db004 	add	fp, sp, #4
    1ed0:	e24dd010 	sub	sp, sp, #16
    1ed4:	e50b0010 	str	r0, [fp, #-16]
  char *p;
  Header *hp;

  if(nu < 4096)
    1ed8:	e51b3010 	ldr	r3, [fp, #-16]
    1edc:	e3530a01 	cmp	r3, #4096	@ 0x1000
    1ee0:	2a000001 	bcs	1eec <morecore+0x24>
    nu = 4096;
    1ee4:	e3a03a01 	mov	r3, #4096	@ 0x1000
    1ee8:	e50b3010 	str	r3, [fp, #-16]
  p = sbrk(nu * sizeof(Header));
    1eec:	e51b3010 	ldr	r3, [fp, #-16]
    1ef0:	e1a03183 	lsl	r3, r3, #3
    1ef4:	e1a00003 	mov	r0, r3
    1ef8:	ebfffe50 	bl	1840 <sbrk>
    1efc:	e50b0008 	str	r0, [fp, #-8]
  if(p == (char*)-1)
    1f00:	e51b3008 	ldr	r3, [fp, #-8]
    1f04:	e3730001 	cmn	r3, #1
    1f08:	1a000001 	bne	1f14 <morecore+0x4c>
    return 0;
    1f0c:	e3a03000 	mov	r3, #0
    1f10:	ea00000b 	b	1f44 <morecore+0x7c>
  hp = (Header*)p;
    1f14:	e51b3008 	ldr	r3, [fp, #-8]
    1f18:	e50b300c 	str	r3, [fp, #-12]
  hp->s.size = nu;
    1f1c:	e51b300c 	ldr	r3, [fp, #-12]
    1f20:	e51b2010 	ldr	r2, [fp, #-16]
    1f24:	e5832004 	str	r2, [r3, #4]
  free((void*)(hp + 1));
    1f28:	e51b300c 	ldr	r3, [fp, #-12]
    1f2c:	e2833008 	add	r3, r3, #8
    1f30:	e1a00003 	mov	r0, r3
    1f34:	ebffff83 	bl	1d48 <free>
  return freep;
    1f38:	e302324c 	movw	r3, #8780	@ 0x224c
    1f3c:	e3403000 	movt	r3, #0
    1f40:	e5933000 	ldr	r3, [r3]
}
    1f44:	e1a00003 	mov	r0, r3
    1f48:	e24bd004 	sub	sp, fp, #4
    1f4c:	e8bd8800 	pop	{fp, pc}

00001f50 <malloc>:

void*
malloc(uint nbytes)
{
    1f50:	e92d4800 	push	{fp, lr}
    1f54:	e28db004 	add	fp, sp, #4
    1f58:	e24dd018 	sub	sp, sp, #24
    1f5c:	e50b0018 	str	r0, [fp, #-24]	@ 0xffffffe8
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1f60:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
    1f64:	e2833007 	add	r3, r3, #7
    1f68:	e1a031a3 	lsr	r3, r3, #3
    1f6c:	e2833001 	add	r3, r3, #1
    1f70:	e50b3010 	str	r3, [fp, #-16]
  if((prevp = freep) == 0){
    1f74:	e302324c 	movw	r3, #8780	@ 0x224c
    1f78:	e3403000 	movt	r3, #0
    1f7c:	e5933000 	ldr	r3, [r3]
    1f80:	e50b300c 	str	r3, [fp, #-12]
    1f84:	e51b300c 	ldr	r3, [fp, #-12]
    1f88:	e3530000 	cmp	r3, #0
    1f8c:	1a000010 	bne	1fd4 <malloc+0x84>
    base.s.ptr = freep = prevp = &base;
    1f90:	e3023244 	movw	r3, #8772	@ 0x2244
    1f94:	e3403000 	movt	r3, #0
    1f98:	e50b300c 	str	r3, [fp, #-12]
    1f9c:	e302324c 	movw	r3, #8780	@ 0x224c
    1fa0:	e3403000 	movt	r3, #0
    1fa4:	e51b200c 	ldr	r2, [fp, #-12]
    1fa8:	e5832000 	str	r2, [r3]
    1fac:	e302324c 	movw	r3, #8780	@ 0x224c
    1fb0:	e3403000 	movt	r3, #0
    1fb4:	e5932000 	ldr	r2, [r3]
    1fb8:	e3023244 	movw	r3, #8772	@ 0x2244
    1fbc:	e3403000 	movt	r3, #0
    1fc0:	e5832000 	str	r2, [r3]
    base.s.size = 0;
    1fc4:	e3023244 	movw	r3, #8772	@ 0x2244
    1fc8:	e3403000 	movt	r3, #0
    1fcc:	e3a02000 	mov	r2, #0
    1fd0:	e5832004 	str	r2, [r3, #4]
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1fd4:	e51b300c 	ldr	r3, [fp, #-12]
    1fd8:	e5933000 	ldr	r3, [r3]
    1fdc:	e50b3008 	str	r3, [fp, #-8]
    if(p->s.size >= nunits){
    1fe0:	e51b3008 	ldr	r3, [fp, #-8]
    1fe4:	e5933004 	ldr	r3, [r3, #4]
    1fe8:	e51b2010 	ldr	r2, [fp, #-16]
    1fec:	e1520003 	cmp	r2, r3
    1ff0:	8a00001f 	bhi	2074 <malloc+0x124>
      if(p->s.size == nunits)
    1ff4:	e51b3008 	ldr	r3, [fp, #-8]
    1ff8:	e5933004 	ldr	r3, [r3, #4]
    1ffc:	e51b2010 	ldr	r2, [fp, #-16]
    2000:	e1520003 	cmp	r2, r3
    2004:	1a000004 	bne	201c <malloc+0xcc>
        prevp->s.ptr = p->s.ptr;
    2008:	e51b3008 	ldr	r3, [fp, #-8]
    200c:	e5932000 	ldr	r2, [r3]
    2010:	e51b300c 	ldr	r3, [fp, #-12]
    2014:	e5832000 	str	r2, [r3]
    2018:	ea00000e 	b	2058 <malloc+0x108>
      else {
        p->s.size -= nunits;
    201c:	e51b3008 	ldr	r3, [fp, #-8]
    2020:	e5932004 	ldr	r2, [r3, #4]
    2024:	e51b3010 	ldr	r3, [fp, #-16]
    2028:	e0422003 	sub	r2, r2, r3
    202c:	e51b3008 	ldr	r3, [fp, #-8]
    2030:	e5832004 	str	r2, [r3, #4]
        p += p->s.size;
    2034:	e51b3008 	ldr	r3, [fp, #-8]
    2038:	e5933004 	ldr	r3, [r3, #4]
    203c:	e1a03183 	lsl	r3, r3, #3
    2040:	e51b2008 	ldr	r2, [fp, #-8]
    2044:	e0823003 	add	r3, r2, r3
    2048:	e50b3008 	str	r3, [fp, #-8]
        p->s.size = nunits;
    204c:	e51b3008 	ldr	r3, [fp, #-8]
    2050:	e51b2010 	ldr	r2, [fp, #-16]
    2054:	e5832004 	str	r2, [r3, #4]
      }
      freep = prevp;
    2058:	e302324c 	movw	r3, #8780	@ 0x224c
    205c:	e3403000 	movt	r3, #0
    2060:	e51b200c 	ldr	r2, [fp, #-12]
    2064:	e5832000 	str	r2, [r3]
      return (void*)(p + 1);
    2068:	e51b3008 	ldr	r3, [fp, #-8]
    206c:	e2833008 	add	r3, r3, #8
    2070:	ea000013 	b	20c4 <malloc+0x174>
    }
    if(p == freep)
    2074:	e302324c 	movw	r3, #8780	@ 0x224c
    2078:	e3403000 	movt	r3, #0
    207c:	e5933000 	ldr	r3, [r3]
    2080:	e51b2008 	ldr	r2, [fp, #-8]
    2084:	e1520003 	cmp	r2, r3
    2088:	1a000007 	bne	20ac <malloc+0x15c>
      if((p = morecore(nunits)) == 0)
    208c:	e51b0010 	ldr	r0, [fp, #-16]
    2090:	ebffff8c 	bl	1ec8 <morecore>
    2094:	e50b0008 	str	r0, [fp, #-8]
    2098:	e51b3008 	ldr	r3, [fp, #-8]
    209c:	e3530000 	cmp	r3, #0
    20a0:	1a000001 	bne	20ac <malloc+0x15c>
        return 0;
    20a4:	e3a03000 	mov	r3, #0
    20a8:	ea000005 	b	20c4 <malloc+0x174>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    20ac:	e51b3008 	ldr	r3, [fp, #-8]
    20b0:	e50b300c 	str	r3, [fp, #-12]
    20b4:	e51b3008 	ldr	r3, [fp, #-8]
    20b8:	e5933000 	ldr	r3, [r3]
    20bc:	e50b3008 	str	r3, [fp, #-8]
    if(p->s.size >= nunits){
    20c0:	eaffffc6 	b	1fe0 <malloc+0x90>
  }
}
    20c4:	e1a00003 	mov	r0, r3
    20c8:	e24bd004 	sub	sp, fp, #4
    20cc:	e8bd8800 	pop	{fp, pc}
