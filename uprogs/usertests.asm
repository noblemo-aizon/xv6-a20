
_usertests:     file format elf32-littlearm


Disassembly of section .text:

00000000 <opentest>:

// simple file system tests

void
opentest(void)
{
       0:	e92d4800 	push	{fp, lr}
       4:	e28db004 	add	fp, sp, #4
       8:	e24dd008 	sub	sp, sp, #8
  int fd;

  printf(stdout, "open test\n");
       c:	e3073064 	movw	r3, #28772	@ 0x7064
      10:	e3403000 	movt	r3, #0
      14:	e5933000 	ldr	r3, [r3]
      18:	e30515f0 	movw	r1, #22000	@ 0x55f0
      1c:	e3401000 	movt	r1, #0
      20:	e1a00003 	mov	r0, r3
      24:	eb0013fa 	bl	5014 <printf>
  fd = open("echo", 0);
      28:	e3a01000 	mov	r1, #0
      2c:	e30505d4 	movw	r0, #21972	@ 0x55d4
      30:	e3400000 	movt	r0, #0
      34:	eb0012cd 	bl	4b70 <open>
      38:	e50b0008 	str	r0, [fp, #-8]
  if(fd < 0){
      3c:	e51b3008 	ldr	r3, [fp, #-8]
      40:	e3530000 	cmp	r3, #0
      44:	aa000007 	bge	68 <opentest+0x68>
    printf(stdout, "open echo failed!\n");
      48:	e3073064 	movw	r3, #28772	@ 0x7064
      4c:	e3403000 	movt	r3, #0
      50:	e5933000 	ldr	r3, [r3]
      54:	e30515fc 	movw	r1, #22012	@ 0x55fc
      58:	e3401000 	movt	r1, #0
      5c:	e1a00003 	mov	r0, r3
      60:	eb0013eb 	bl	5014 <printf>
    exit();
      64:	eb001259 	bl	49d0 <exit>
  }
  close(fd);
      68:	e51b0008 	ldr	r0, [fp, #-8]
      6c:	eb001298 	bl	4ad4 <close>
  fd = open("doesnotexist", 0);
      70:	e3a01000 	mov	r1, #0
      74:	e3050610 	movw	r0, #22032	@ 0x5610
      78:	e3400000 	movt	r0, #0
      7c:	eb0012bb 	bl	4b70 <open>
      80:	e50b0008 	str	r0, [fp, #-8]
  if(fd >= 0){
      84:	e51b3008 	ldr	r3, [fp, #-8]
      88:	e3530000 	cmp	r3, #0
      8c:	ba000007 	blt	b0 <opentest+0xb0>
    printf(stdout, "open doesnotexist succeeded!\n");
      90:	e3073064 	movw	r3, #28772	@ 0x7064
      94:	e3403000 	movt	r3, #0
      98:	e5933000 	ldr	r3, [r3]
      9c:	e3051620 	movw	r1, #22048	@ 0x5620
      a0:	e3401000 	movt	r1, #0
      a4:	e1a00003 	mov	r0, r3
      a8:	eb0013d9 	bl	5014 <printf>
    exit();
      ac:	eb001247 	bl	49d0 <exit>
  }
  printf(stdout, "open test ok\n");
      b0:	e3073064 	movw	r3, #28772	@ 0x7064
      b4:	e3403000 	movt	r3, #0
      b8:	e5933000 	ldr	r3, [r3]
      bc:	e3051640 	movw	r1, #22080	@ 0x5640
      c0:	e3401000 	movt	r1, #0
      c4:	e1a00003 	mov	r0, r3
      c8:	eb0013d1 	bl	5014 <printf>
}
      cc:	e320f000 	nop	{0}
      d0:	e24bd004 	sub	sp, fp, #4
      d4:	e8bd8800 	pop	{fp, pc}

000000d8 <writetest>:

void
writetest(void)
{
      d8:	e92d4800 	push	{fp, lr}
      dc:	e28db004 	add	fp, sp, #4
      e0:	e24dd008 	sub	sp, sp, #8
  int fd;
  int i;

  printf(stdout, "small file test\n");
      e4:	e3073064 	movw	r3, #28772	@ 0x7064
      e8:	e3403000 	movt	r3, #0
      ec:	e5933000 	ldr	r3, [r3]
      f0:	e3051650 	movw	r1, #22096	@ 0x5650
      f4:	e3401000 	movt	r1, #0
      f8:	e1a00003 	mov	r0, r3
      fc:	eb0013c4 	bl	5014 <printf>
  fd = open("small", O_CREATE|O_RDWR);
     100:	e3001202 	movw	r1, #514	@ 0x202
     104:	e3050664 	movw	r0, #22116	@ 0x5664
     108:	e3400000 	movt	r0, #0
     10c:	eb001297 	bl	4b70 <open>
     110:	e50b000c 	str	r0, [fp, #-12]
  if(fd >= 0){
     114:	e51b300c 	ldr	r3, [fp, #-12]
     118:	e3530000 	cmp	r3, #0
     11c:	ba000009 	blt	148 <writetest+0x70>
    printf(stdout, "creat small succeeded; ok\n");
     120:	e3073064 	movw	r3, #28772	@ 0x7064
     124:	e3403000 	movt	r3, #0
     128:	e5933000 	ldr	r3, [r3]
     12c:	e305166c 	movw	r1, #22124	@ 0x566c
     130:	e3401000 	movt	r1, #0
     134:	e1a00003 	mov	r0, r3
     138:	eb0013b5 	bl	5014 <printf>
  } else {
    printf(stdout, "error: creat small failed!\n");
    exit();
  }
  for(i = 0; i < 100; i++){
     13c:	e3a03000 	mov	r3, #0
     140:	e50b3008 	str	r3, [fp, #-8]
     144:	ea00002c 	b	1fc <writetest+0x124>
    printf(stdout, "error: creat small failed!\n");
     148:	e3073064 	movw	r3, #28772	@ 0x7064
     14c:	e3403000 	movt	r3, #0
     150:	e5933000 	ldr	r3, [r3]
     154:	e3051688 	movw	r1, #22152	@ 0x5688
     158:	e3401000 	movt	r1, #0
     15c:	e1a00003 	mov	r0, r3
     160:	eb0013ab 	bl	5014 <printf>
    exit();
     164:	eb001219 	bl	49d0 <exit>
    if(write(fd, "aaaaaaaaaa", 10) != 10){
     168:	e3a0200a 	mov	r2, #10
     16c:	e30516a4 	movw	r1, #22180	@ 0x56a4
     170:	e3401000 	movt	r1, #0
     174:	e51b000c 	ldr	r0, [fp, #-12]
     178:	eb001248 	bl	4aa0 <write>
     17c:	e1a03000 	mov	r3, r0
     180:	e353000a 	cmp	r3, #10
     184:	0a000008 	beq	1ac <writetest+0xd4>
      printf(stdout, "error: write aa %d new file failed\n", i);
     188:	e3073064 	movw	r3, #28772	@ 0x7064
     18c:	e3403000 	movt	r3, #0
     190:	e5933000 	ldr	r3, [r3]
     194:	e51b2008 	ldr	r2, [fp, #-8]
     198:	e30516b0 	movw	r1, #22192	@ 0x56b0
     19c:	e3401000 	movt	r1, #0
     1a0:	e1a00003 	mov	r0, r3
     1a4:	eb00139a 	bl	5014 <printf>
      exit();
     1a8:	eb001208 	bl	49d0 <exit>
    }
    if(write(fd, "bbbbbbbbbb", 10) != 10){
     1ac:	e3a0200a 	mov	r2, #10
     1b0:	e30516d4 	movw	r1, #22228	@ 0x56d4
     1b4:	e3401000 	movt	r1, #0
     1b8:	e51b000c 	ldr	r0, [fp, #-12]
     1bc:	eb001237 	bl	4aa0 <write>
     1c0:	e1a03000 	mov	r3, r0
     1c4:	e353000a 	cmp	r3, #10
     1c8:	0a000008 	beq	1f0 <writetest+0x118>
      printf(stdout, "error: write bb %d new file failed\n", i);
     1cc:	e3073064 	movw	r3, #28772	@ 0x7064
     1d0:	e3403000 	movt	r3, #0
     1d4:	e5933000 	ldr	r3, [r3]
     1d8:	e51b2008 	ldr	r2, [fp, #-8]
     1dc:	e30516e0 	movw	r1, #22240	@ 0x56e0
     1e0:	e3401000 	movt	r1, #0
     1e4:	e1a00003 	mov	r0, r3
     1e8:	eb001389 	bl	5014 <printf>
      exit();
     1ec:	eb0011f7 	bl	49d0 <exit>
  for(i = 0; i < 100; i++){
     1f0:	e51b3008 	ldr	r3, [fp, #-8]
     1f4:	e2833001 	add	r3, r3, #1
     1f8:	e50b3008 	str	r3, [fp, #-8]
     1fc:	e51b3008 	ldr	r3, [fp, #-8]
     200:	e3530063 	cmp	r3, #99	@ 0x63
     204:	daffffd7 	ble	168 <writetest+0x90>
    }
  }
  printf(stdout, "writes ok\n");
     208:	e3073064 	movw	r3, #28772	@ 0x7064
     20c:	e3403000 	movt	r3, #0
     210:	e5933000 	ldr	r3, [r3]
     214:	e3051704 	movw	r1, #22276	@ 0x5704
     218:	e3401000 	movt	r1, #0
     21c:	e1a00003 	mov	r0, r3
     220:	eb00137b 	bl	5014 <printf>
  close(fd);
     224:	e51b000c 	ldr	r0, [fp, #-12]
     228:	eb001229 	bl	4ad4 <close>
  fd = open("small", O_RDONLY);
     22c:	e3a01000 	mov	r1, #0
     230:	e3050664 	movw	r0, #22116	@ 0x5664
     234:	e3400000 	movt	r0, #0
     238:	eb00124c 	bl	4b70 <open>
     23c:	e50b000c 	str	r0, [fp, #-12]
  if(fd >= 0){
     240:	e51b300c 	ldr	r3, [fp, #-12]
     244:	e3530000 	cmp	r3, #0
     248:	ba000010 	blt	290 <writetest+0x1b8>
    printf(stdout, "open small succeeded ok\n");
     24c:	e3073064 	movw	r3, #28772	@ 0x7064
     250:	e3403000 	movt	r3, #0
     254:	e5933000 	ldr	r3, [r3]
     258:	e3051710 	movw	r1, #22288	@ 0x5710
     25c:	e3401000 	movt	r1, #0
     260:	e1a00003 	mov	r0, r3
     264:	eb00136a 	bl	5014 <printf>
  } else {
    printf(stdout, "error: open small failed!\n");
    exit();
  }
  i = read(fd, buf, 2000);
     268:	e3a02e7d 	mov	r2, #2000	@ 0x7d0
     26c:	e3071080 	movw	r1, #28800	@ 0x7080
     270:	e3401000 	movt	r1, #0
     274:	e51b000c 	ldr	r0, [fp, #-12]
     278:	eb0011fb 	bl	4a6c <read>
     27c:	e50b0008 	str	r0, [fp, #-8]
  if(i == 2000){
     280:	e51b3008 	ldr	r3, [fp, #-8]
     284:	e3530e7d 	cmp	r3, #2000	@ 0x7d0
     288:	1a000018 	bne	2f0 <writetest+0x218>
     28c:	ea000007 	b	2b0 <writetest+0x1d8>
    printf(stdout, "error: open small failed!\n");
     290:	e3073064 	movw	r3, #28772	@ 0x7064
     294:	e3403000 	movt	r3, #0
     298:	e5933000 	ldr	r3, [r3]
     29c:	e305172c 	movw	r1, #22316	@ 0x572c
     2a0:	e3401000 	movt	r1, #0
     2a4:	e1a00003 	mov	r0, r3
     2a8:	eb001359 	bl	5014 <printf>
    exit();
     2ac:	eb0011c7 	bl	49d0 <exit>
    printf(stdout, "read succeeded ok\n");
     2b0:	e3073064 	movw	r3, #28772	@ 0x7064
     2b4:	e3403000 	movt	r3, #0
     2b8:	e5933000 	ldr	r3, [r3]
     2bc:	e3051748 	movw	r1, #22344	@ 0x5748
     2c0:	e3401000 	movt	r1, #0
     2c4:	e1a00003 	mov	r0, r3
     2c8:	eb001351 	bl	5014 <printf>
  } else {
    printf(stdout, "read failed\n");
    exit();
  }
  close(fd);
     2cc:	e51b000c 	ldr	r0, [fp, #-12]
     2d0:	eb0011ff 	bl	4ad4 <close>

  if(unlink("small") < 0){
     2d4:	e3050664 	movw	r0, #22116	@ 0x5664
     2d8:	e3400000 	movt	r0, #0
     2dc:	eb00123d 	bl	4bd8 <unlink>
     2e0:	e1a03000 	mov	r3, r0
     2e4:	e3530000 	cmp	r3, #0
     2e8:	aa000010 	bge	330 <writetest+0x258>
     2ec:	ea000007 	b	310 <writetest+0x238>
    printf(stdout, "read failed\n");
     2f0:	e3073064 	movw	r3, #28772	@ 0x7064
     2f4:	e3403000 	movt	r3, #0
     2f8:	e5933000 	ldr	r3, [r3]
     2fc:	e305175c 	movw	r1, #22364	@ 0x575c
     300:	e3401000 	movt	r1, #0
     304:	e1a00003 	mov	r0, r3
     308:	eb001341 	bl	5014 <printf>
    exit();
     30c:	eb0011af 	bl	49d0 <exit>
    printf(stdout, "unlink small failed\n");
     310:	e3073064 	movw	r3, #28772	@ 0x7064
     314:	e3403000 	movt	r3, #0
     318:	e5933000 	ldr	r3, [r3]
     31c:	e305176c 	movw	r1, #22380	@ 0x576c
     320:	e3401000 	movt	r1, #0
     324:	e1a00003 	mov	r0, r3
     328:	eb001339 	bl	5014 <printf>
    exit();
     32c:	eb0011a7 	bl	49d0 <exit>
  }
  printf(stdout, "small file test ok\n");
     330:	e3073064 	movw	r3, #28772	@ 0x7064
     334:	e3403000 	movt	r3, #0
     338:	e5933000 	ldr	r3, [r3]
     33c:	e3051784 	movw	r1, #22404	@ 0x5784
     340:	e3401000 	movt	r1, #0
     344:	e1a00003 	mov	r0, r3
     348:	eb001331 	bl	5014 <printf>
}
     34c:	e320f000 	nop	{0}
     350:	e24bd004 	sub	sp, fp, #4
     354:	e8bd8800 	pop	{fp, pc}

00000358 <writetest1>:

void
writetest1(void)
{
     358:	e92d4800 	push	{fp, lr}
     35c:	e28db004 	add	fp, sp, #4
     360:	e24dd010 	sub	sp, sp, #16
  int i, fd, n;

  printf(stdout, "big files test\n");
     364:	e3073064 	movw	r3, #28772	@ 0x7064
     368:	e3403000 	movt	r3, #0
     36c:	e5933000 	ldr	r3, [r3]
     370:	e3051798 	movw	r1, #22424	@ 0x5798
     374:	e3401000 	movt	r1, #0
     378:	e1a00003 	mov	r0, r3
     37c:	eb001324 	bl	5014 <printf>

  fd = open("big", O_CREATE|O_RDWR);
     380:	e3001202 	movw	r1, #514	@ 0x202
     384:	e30507a8 	movw	r0, #22440	@ 0x57a8
     388:	e3400000 	movt	r0, #0
     38c:	eb0011f7 	bl	4b70 <open>
     390:	e50b0010 	str	r0, [fp, #-16]
  if(fd < 0){
     394:	e51b3010 	ldr	r3, [fp, #-16]
     398:	e3530000 	cmp	r3, #0
     39c:	aa000007 	bge	3c0 <writetest1+0x68>
    printf(stdout, "error: creat big failed!\n");
     3a0:	e3073064 	movw	r3, #28772	@ 0x7064
     3a4:	e3403000 	movt	r3, #0
     3a8:	e5933000 	ldr	r3, [r3]
     3ac:	e30517ac 	movw	r1, #22444	@ 0x57ac
     3b0:	e3401000 	movt	r1, #0
     3b4:	e1a00003 	mov	r0, r3
     3b8:	eb001315 	bl	5014 <printf>
    exit();
     3bc:	eb001183 	bl	49d0 <exit>
  }

  for(i = 0; i < MAXFILE; i++){
     3c0:	e3a03000 	mov	r3, #0
     3c4:	e50b3008 	str	r3, [fp, #-8]
     3c8:	ea000017 	b	42c <writetest1+0xd4>
    ((int*)buf)[0] = i;
     3cc:	e3073080 	movw	r3, #28800	@ 0x7080
     3d0:	e3403000 	movt	r3, #0
     3d4:	e51b2008 	ldr	r2, [fp, #-8]
     3d8:	e5832000 	str	r2, [r3]
    if(write(fd, buf, 512) != 512){
     3dc:	e3a02c02 	mov	r2, #512	@ 0x200
     3e0:	e3071080 	movw	r1, #28800	@ 0x7080
     3e4:	e3401000 	movt	r1, #0
     3e8:	e51b0010 	ldr	r0, [fp, #-16]
     3ec:	eb0011ab 	bl	4aa0 <write>
     3f0:	e1a03000 	mov	r3, r0
     3f4:	e3530c02 	cmp	r3, #512	@ 0x200
     3f8:	0a000008 	beq	420 <writetest1+0xc8>
      printf(stdout, "error: write big file failed\n", i);
     3fc:	e3073064 	movw	r3, #28772	@ 0x7064
     400:	e3403000 	movt	r3, #0
     404:	e5933000 	ldr	r3, [r3]
     408:	e51b2008 	ldr	r2, [fp, #-8]
     40c:	e30517c8 	movw	r1, #22472	@ 0x57c8
     410:	e3401000 	movt	r1, #0
     414:	e1a00003 	mov	r0, r3
     418:	eb0012fd 	bl	5014 <printf>
      exit();
     41c:	eb00116b 	bl	49d0 <exit>
  for(i = 0; i < MAXFILE; i++){
     420:	e51b3008 	ldr	r3, [fp, #-8]
     424:	e2833001 	add	r3, r3, #1
     428:	e50b3008 	str	r3, [fp, #-8]
     42c:	e51b3008 	ldr	r3, [fp, #-8]
     430:	e353008b 	cmp	r3, #139	@ 0x8b
     434:	9affffe4 	bls	3cc <writetest1+0x74>
    }
  }

  close(fd);
     438:	e51b0010 	ldr	r0, [fp, #-16]
     43c:	eb0011a4 	bl	4ad4 <close>

  fd = open("big", O_RDONLY);
     440:	e3a01000 	mov	r1, #0
     444:	e30507a8 	movw	r0, #22440	@ 0x57a8
     448:	e3400000 	movt	r0, #0
     44c:	eb0011c7 	bl	4b70 <open>
     450:	e50b0010 	str	r0, [fp, #-16]
  if(fd < 0){
     454:	e51b3010 	ldr	r3, [fp, #-16]
     458:	e3530000 	cmp	r3, #0
     45c:	aa000007 	bge	480 <writetest1+0x128>
    printf(stdout, "error: open big failed!\n");
     460:	e3073064 	movw	r3, #28772	@ 0x7064
     464:	e3403000 	movt	r3, #0
     468:	e5933000 	ldr	r3, [r3]
     46c:	e30517e8 	movw	r1, #22504	@ 0x57e8
     470:	e3401000 	movt	r1, #0
     474:	e1a00003 	mov	r0, r3
     478:	eb0012e5 	bl	5014 <printf>
    exit();
     47c:	eb001153 	bl	49d0 <exit>
  }

  n = 0;
     480:	e3a03000 	mov	r3, #0
     484:	e50b300c 	str	r3, [fp, #-12]
  for(;;){
    i = read(fd, buf, 512);
     488:	e3a02c02 	mov	r2, #512	@ 0x200
     48c:	e3071080 	movw	r1, #28800	@ 0x7080
     490:	e3401000 	movt	r1, #0
     494:	e51b0010 	ldr	r0, [fp, #-16]
     498:	eb001173 	bl	4a6c <read>
     49c:	e50b0008 	str	r0, [fp, #-8]
    if(i == 0){
     4a0:	e51b3008 	ldr	r3, [fp, #-8]
     4a4:	e3530000 	cmp	r3, #0
     4a8:	1a00000b 	bne	4dc <writetest1+0x184>
      if(n == MAXFILE - 1){
     4ac:	e51b300c 	ldr	r3, [fp, #-12]
     4b0:	e353008b 	cmp	r3, #139	@ 0x8b
     4b4:	1a000029 	bne	560 <writetest1+0x208>
        printf(stdout, "read only %d blocks from big", n);
     4b8:	e3073064 	movw	r3, #28772	@ 0x7064
     4bc:	e3403000 	movt	r3, #0
     4c0:	e5933000 	ldr	r3, [r3]
     4c4:	e51b200c 	ldr	r2, [fp, #-12]
     4c8:	e3051804 	movw	r1, #22532	@ 0x5804
     4cc:	e3401000 	movt	r1, #0
     4d0:	e1a00003 	mov	r0, r3
     4d4:	eb0012ce 	bl	5014 <printf>
        exit();
     4d8:	eb00113c 	bl	49d0 <exit>
      }
      break;
    } else if(i != 512){
     4dc:	e51b3008 	ldr	r3, [fp, #-8]
     4e0:	e3530c02 	cmp	r3, #512	@ 0x200
     4e4:	0a000008 	beq	50c <writetest1+0x1b4>
      printf(stdout, "read failed %d\n", i);
     4e8:	e3073064 	movw	r3, #28772	@ 0x7064
     4ec:	e3403000 	movt	r3, #0
     4f0:	e5933000 	ldr	r3, [r3]
     4f4:	e51b2008 	ldr	r2, [fp, #-8]
     4f8:	e3051824 	movw	r1, #22564	@ 0x5824
     4fc:	e3401000 	movt	r1, #0
     500:	e1a00003 	mov	r0, r3
     504:	eb0012c2 	bl	5014 <printf>
      exit();
     508:	eb001130 	bl	49d0 <exit>
    }
    if(((int*)buf)[0] != n){
     50c:	e3073080 	movw	r3, #28800	@ 0x7080
     510:	e3403000 	movt	r3, #0
     514:	e5933000 	ldr	r3, [r3]
     518:	e51b200c 	ldr	r2, [fp, #-12]
     51c:	e1520003 	cmp	r2, r3
     520:	0a00000a 	beq	550 <writetest1+0x1f8>
      printf(stdout, "read content of block %d is %d\n",
     524:	e3073064 	movw	r3, #28772	@ 0x7064
     528:	e3403000 	movt	r3, #0
     52c:	e5930000 	ldr	r0, [r3]
             n, ((int*)buf)[0]);
     530:	e3073080 	movw	r3, #28800	@ 0x7080
     534:	e3403000 	movt	r3, #0
      printf(stdout, "read content of block %d is %d\n",
     538:	e5933000 	ldr	r3, [r3]
     53c:	e51b200c 	ldr	r2, [fp, #-12]
     540:	e3051834 	movw	r1, #22580	@ 0x5834
     544:	e3401000 	movt	r1, #0
     548:	eb0012b1 	bl	5014 <printf>
      exit();
     54c:	eb00111f 	bl	49d0 <exit>
    }
    n++;
     550:	e51b300c 	ldr	r3, [fp, #-12]
     554:	e2833001 	add	r3, r3, #1
     558:	e50b300c 	str	r3, [fp, #-12]
    i = read(fd, buf, 512);
     55c:	eaffffc9 	b	488 <writetest1+0x130>
      break;
     560:	e320f000 	nop	{0}
  }
  close(fd);
     564:	e51b0010 	ldr	r0, [fp, #-16]
     568:	eb001159 	bl	4ad4 <close>
  if(unlink("big") < 0){
     56c:	e30507a8 	movw	r0, #22440	@ 0x57a8
     570:	e3400000 	movt	r0, #0
     574:	eb001197 	bl	4bd8 <unlink>
     578:	e1a03000 	mov	r3, r0
     57c:	e3530000 	cmp	r3, #0
     580:	aa000007 	bge	5a4 <writetest1+0x24c>
    printf(stdout, "unlink big failed\n");
     584:	e3073064 	movw	r3, #28772	@ 0x7064
     588:	e3403000 	movt	r3, #0
     58c:	e5933000 	ldr	r3, [r3]
     590:	e3051854 	movw	r1, #22612	@ 0x5854
     594:	e3401000 	movt	r1, #0
     598:	e1a00003 	mov	r0, r3
     59c:	eb00129c 	bl	5014 <printf>
    exit();
     5a0:	eb00110a 	bl	49d0 <exit>
  }
  printf(stdout, "big files ok\n");
     5a4:	e3073064 	movw	r3, #28772	@ 0x7064
     5a8:	e3403000 	movt	r3, #0
     5ac:	e5933000 	ldr	r3, [r3]
     5b0:	e3051868 	movw	r1, #22632	@ 0x5868
     5b4:	e3401000 	movt	r1, #0
     5b8:	e1a00003 	mov	r0, r3
     5bc:	eb001294 	bl	5014 <printf>
}
     5c0:	e320f000 	nop	{0}
     5c4:	e24bd004 	sub	sp, fp, #4
     5c8:	e8bd8800 	pop	{fp, pc}

000005cc <createtest>:

void
createtest(void)
{
     5cc:	e92d4800 	push	{fp, lr}
     5d0:	e28db004 	add	fp, sp, #4
     5d4:	e24dd008 	sub	sp, sp, #8
  int i, fd;

  printf(stdout, "many creates, followed by unlink test\n");
     5d8:	e3073064 	movw	r3, #28772	@ 0x7064
     5dc:	e3403000 	movt	r3, #0
     5e0:	e5933000 	ldr	r3, [r3]
     5e4:	e3051878 	movw	r1, #22648	@ 0x5878
     5e8:	e3401000 	movt	r1, #0
     5ec:	e1a00003 	mov	r0, r3
     5f0:	eb001287 	bl	5014 <printf>

  name[0] = 'a';
     5f4:	e3093080 	movw	r3, #36992	@ 0x9080
     5f8:	e3403000 	movt	r3, #0
     5fc:	e3a02061 	mov	r2, #97	@ 0x61
     600:	e5c32000 	strb	r2, [r3]
  name[2] = '\0';
     604:	e3093080 	movw	r3, #36992	@ 0x9080
     608:	e3403000 	movt	r3, #0
     60c:	e3a02000 	mov	r2, #0
     610:	e5c32002 	strb	r2, [r3, #2]
  for(i = 0; i < 52; i++){
     614:	e3a03000 	mov	r3, #0
     618:	e50b3008 	str	r3, [fp, #-8]
     61c:	ea000010 	b	664 <createtest+0x98>
    name[1] = '0' + i;
     620:	e51b3008 	ldr	r3, [fp, #-8]
     624:	e6ef3073 	uxtb	r3, r3
     628:	e2833030 	add	r3, r3, #48	@ 0x30
     62c:	e6ef2073 	uxtb	r2, r3
     630:	e3093080 	movw	r3, #36992	@ 0x9080
     634:	e3403000 	movt	r3, #0
     638:	e5c32001 	strb	r2, [r3, #1]
    fd = open(name, O_CREATE|O_RDWR);
     63c:	e3001202 	movw	r1, #514	@ 0x202
     640:	e3090080 	movw	r0, #36992	@ 0x9080
     644:	e3400000 	movt	r0, #0
     648:	eb001148 	bl	4b70 <open>
     64c:	e50b000c 	str	r0, [fp, #-12]
    close(fd);
     650:	e51b000c 	ldr	r0, [fp, #-12]
     654:	eb00111e 	bl	4ad4 <close>
  for(i = 0; i < 52; i++){
     658:	e51b3008 	ldr	r3, [fp, #-8]
     65c:	e2833001 	add	r3, r3, #1
     660:	e50b3008 	str	r3, [fp, #-8]
     664:	e51b3008 	ldr	r3, [fp, #-8]
     668:	e3530033 	cmp	r3, #51	@ 0x33
     66c:	daffffeb 	ble	620 <createtest+0x54>
  }
  name[0] = 'a';
     670:	e3093080 	movw	r3, #36992	@ 0x9080
     674:	e3403000 	movt	r3, #0
     678:	e3a02061 	mov	r2, #97	@ 0x61
     67c:	e5c32000 	strb	r2, [r3]
  name[2] = '\0';
     680:	e3093080 	movw	r3, #36992	@ 0x9080
     684:	e3403000 	movt	r3, #0
     688:	e3a02000 	mov	r2, #0
     68c:	e5c32002 	strb	r2, [r3, #2]
  for(i = 0; i < 52; i++){
     690:	e3a03000 	mov	r3, #0
     694:	e50b3008 	str	r3, [fp, #-8]
     698:	ea00000c 	b	6d0 <createtest+0x104>
    name[1] = '0' + i;
     69c:	e51b3008 	ldr	r3, [fp, #-8]
     6a0:	e6ef3073 	uxtb	r3, r3
     6a4:	e2833030 	add	r3, r3, #48	@ 0x30
     6a8:	e6ef2073 	uxtb	r2, r3
     6ac:	e3093080 	movw	r3, #36992	@ 0x9080
     6b0:	e3403000 	movt	r3, #0
     6b4:	e5c32001 	strb	r2, [r3, #1]
    unlink(name);
     6b8:	e3090080 	movw	r0, #36992	@ 0x9080
     6bc:	e3400000 	movt	r0, #0
     6c0:	eb001144 	bl	4bd8 <unlink>
  for(i = 0; i < 52; i++){
     6c4:	e51b3008 	ldr	r3, [fp, #-8]
     6c8:	e2833001 	add	r3, r3, #1
     6cc:	e50b3008 	str	r3, [fp, #-8]
     6d0:	e51b3008 	ldr	r3, [fp, #-8]
     6d4:	e3530033 	cmp	r3, #51	@ 0x33
     6d8:	daffffef 	ble	69c <createtest+0xd0>
  }
  printf(stdout, "many creates, followed by unlink; ok\n");
     6dc:	e3073064 	movw	r3, #28772	@ 0x7064
     6e0:	e3403000 	movt	r3, #0
     6e4:	e5933000 	ldr	r3, [r3]
     6e8:	e30518a0 	movw	r1, #22688	@ 0x58a0
     6ec:	e3401000 	movt	r1, #0
     6f0:	e1a00003 	mov	r0, r3
     6f4:	eb001246 	bl	5014 <printf>
}
     6f8:	e320f000 	nop	{0}
     6fc:	e24bd004 	sub	sp, fp, #4
     700:	e8bd8800 	pop	{fp, pc}

00000704 <dirtest>:

void dirtest(void)
{
     704:	e92d4800 	push	{fp, lr}
     708:	e28db004 	add	fp, sp, #4
  printf(stdout, "mkdir test\n");
     70c:	e3073064 	movw	r3, #28772	@ 0x7064
     710:	e3403000 	movt	r3, #0
     714:	e5933000 	ldr	r3, [r3]
     718:	e30518c8 	movw	r1, #22728	@ 0x58c8
     71c:	e3401000 	movt	r1, #0
     720:	e1a00003 	mov	r0, r3
     724:	eb00123a 	bl	5014 <printf>

  if(mkdir("dir0") < 0){
     728:	e30508d4 	movw	r0, #22740	@ 0x58d4
     72c:	e3400000 	movt	r0, #0
     730:	eb00114f 	bl	4c74 <mkdir>
     734:	e1a03000 	mov	r3, r0
     738:	e3530000 	cmp	r3, #0
     73c:	aa000007 	bge	760 <dirtest+0x5c>
    printf(stdout, "mkdir failed\n");
     740:	e3073064 	movw	r3, #28772	@ 0x7064
     744:	e3403000 	movt	r3, #0
     748:	e5933000 	ldr	r3, [r3]
     74c:	e30518dc 	movw	r1, #22748	@ 0x58dc
     750:	e3401000 	movt	r1, #0
     754:	e1a00003 	mov	r0, r3
     758:	eb00122d 	bl	5014 <printf>
    exit();
     75c:	eb00109b 	bl	49d0 <exit>
  }

  if(chdir("dir0") < 0){
     760:	e30508d4 	movw	r0, #22740	@ 0x58d4
     764:	e3400000 	movt	r0, #0
     768:	eb00114e 	bl	4ca8 <chdir>
     76c:	e1a03000 	mov	r3, r0
     770:	e3530000 	cmp	r3, #0
     774:	aa000007 	bge	798 <dirtest+0x94>
    printf(stdout, "chdir dir0 failed\n");
     778:	e3073064 	movw	r3, #28772	@ 0x7064
     77c:	e3403000 	movt	r3, #0
     780:	e5933000 	ldr	r3, [r3]
     784:	e30518ec 	movw	r1, #22764	@ 0x58ec
     788:	e3401000 	movt	r1, #0
     78c:	e1a00003 	mov	r0, r3
     790:	eb00121f 	bl	5014 <printf>
    exit();
     794:	eb00108d 	bl	49d0 <exit>
  }

  if(chdir("..") < 0){
     798:	e3050900 	movw	r0, #22784	@ 0x5900
     79c:	e3400000 	movt	r0, #0
     7a0:	eb001140 	bl	4ca8 <chdir>
     7a4:	e1a03000 	mov	r3, r0
     7a8:	e3530000 	cmp	r3, #0
     7ac:	aa000007 	bge	7d0 <dirtest+0xcc>
    printf(stdout, "chdir .. failed\n");
     7b0:	e3073064 	movw	r3, #28772	@ 0x7064
     7b4:	e3403000 	movt	r3, #0
     7b8:	e5933000 	ldr	r3, [r3]
     7bc:	e3051904 	movw	r1, #22788	@ 0x5904
     7c0:	e3401000 	movt	r1, #0
     7c4:	e1a00003 	mov	r0, r3
     7c8:	eb001211 	bl	5014 <printf>
    exit();
     7cc:	eb00107f 	bl	49d0 <exit>
  }

  if(unlink("dir0") < 0){
     7d0:	e30508d4 	movw	r0, #22740	@ 0x58d4
     7d4:	e3400000 	movt	r0, #0
     7d8:	eb0010fe 	bl	4bd8 <unlink>
     7dc:	e1a03000 	mov	r3, r0
     7e0:	e3530000 	cmp	r3, #0
     7e4:	aa000007 	bge	808 <dirtest+0x104>
    printf(stdout, "unlink dir0 failed\n");
     7e8:	e3073064 	movw	r3, #28772	@ 0x7064
     7ec:	e3403000 	movt	r3, #0
     7f0:	e5933000 	ldr	r3, [r3]
     7f4:	e3051918 	movw	r1, #22808	@ 0x5918
     7f8:	e3401000 	movt	r1, #0
     7fc:	e1a00003 	mov	r0, r3
     800:	eb001203 	bl	5014 <printf>
    exit();
     804:	eb001071 	bl	49d0 <exit>
  }
  printf(stdout, "mkdir test\n");
     808:	e3073064 	movw	r3, #28772	@ 0x7064
     80c:	e3403000 	movt	r3, #0
     810:	e5933000 	ldr	r3, [r3]
     814:	e30518c8 	movw	r1, #22728	@ 0x58c8
     818:	e3401000 	movt	r1, #0
     81c:	e1a00003 	mov	r0, r3
     820:	eb0011fb 	bl	5014 <printf>
}
     824:	e320f000 	nop	{0}
     828:	e8bd8800 	pop	{fp, pc}

0000082c <exectest>:

void
exectest(void)
{
     82c:	e92d4800 	push	{fp, lr}
     830:	e28db004 	add	fp, sp, #4
  printf(stdout, "exec test\n");
     834:	e3073064 	movw	r3, #28772	@ 0x7064
     838:	e3403000 	movt	r3, #0
     83c:	e5933000 	ldr	r3, [r3]
     840:	e305192c 	movw	r1, #22828	@ 0x592c
     844:	e3401000 	movt	r1, #0
     848:	e1a00003 	mov	r0, r3
     84c:	eb0011f0 	bl	5014 <printf>
  if(exec("echo", echoargv) < 0){
     850:	e3071050 	movw	r1, #28752	@ 0x7050
     854:	e3401000 	movt	r1, #0
     858:	e30505d4 	movw	r0, #21972	@ 0x55d4
     85c:	e3400000 	movt	r0, #0
     860:	eb0010b5 	bl	4b3c <exec>
     864:	e1a03000 	mov	r3, r0
     868:	e3530000 	cmp	r3, #0
     86c:	aa000007 	bge	890 <exectest+0x64>
    printf(stdout, "exec echo failed\n");
     870:	e3073064 	movw	r3, #28772	@ 0x7064
     874:	e3403000 	movt	r3, #0
     878:	e5933000 	ldr	r3, [r3]
     87c:	e3051938 	movw	r1, #22840	@ 0x5938
     880:	e3401000 	movt	r1, #0
     884:	e1a00003 	mov	r0, r3
     888:	eb0011e1 	bl	5014 <printf>
    exit();
     88c:	eb00104f 	bl	49d0 <exit>
  }
}
     890:	e320f000 	nop	{0}
     894:	e8bd8800 	pop	{fp, pc}

00000898 <pipe1>:

// simple fork and pipe read/write

void
pipe1(void)
{
     898:	e92d4800 	push	{fp, lr}
     89c:	e28db004 	add	fp, sp, #4
     8a0:	e24dd020 	sub	sp, sp, #32
  int fds[2], pid;
  int seq, i, n, cc, total;

  if(pipe(fds) != 0){
     8a4:	e24b3024 	sub	r3, fp, #36	@ 0x24
     8a8:	e1a00003 	mov	r0, r3
     8ac:	eb001061 	bl	4a38 <pipe>
     8b0:	e1a03000 	mov	r3, r0
     8b4:	e3530000 	cmp	r3, #0
     8b8:	0a000004 	beq	8d0 <pipe1+0x38>
    printf(1, "pipe() failed\n");
     8bc:	e305194c 	movw	r1, #22860	@ 0x594c
     8c0:	e3401000 	movt	r1, #0
     8c4:	e3a00001 	mov	r0, #1
     8c8:	eb0011d1 	bl	5014 <printf>
    exit();
     8cc:	eb00103f 	bl	49d0 <exit>
  }
  pid = fork();
     8d0:	eb001031 	bl	499c <fork>
     8d4:	e50b001c 	str	r0, [fp, #-28]	@ 0xffffffe4
  seq = 0;
     8d8:	e3a03000 	mov	r3, #0
     8dc:	e50b3008 	str	r3, [fp, #-8]
  if(pid == 0){
     8e0:	e51b301c 	ldr	r3, [fp, #-28]	@ 0xffffffe4
     8e4:	e3530000 	cmp	r3, #0
     8e8:	1a00002f 	bne	9ac <pipe1+0x114>
    close(fds[0]);
     8ec:	e51b3024 	ldr	r3, [fp, #-36]	@ 0xffffffdc
     8f0:	e1a00003 	mov	r0, r3
     8f4:	eb001076 	bl	4ad4 <close>
    for(n = 0; n < 5; n++){
     8f8:	e3a03000 	mov	r3, #0
     8fc:	e50b3010 	str	r3, [fp, #-16]
     900:	ea000025 	b	99c <pipe1+0x104>
      for(i = 0; i < 1033; i++)
     904:	e3a03000 	mov	r3, #0
     908:	e50b300c 	str	r3, [fp, #-12]
     90c:	ea00000c 	b	944 <pipe1+0xac>
        buf[i] = seq++;
     910:	e51b3008 	ldr	r3, [fp, #-8]
     914:	e2832001 	add	r2, r3, #1
     918:	e50b2008 	str	r2, [fp, #-8]
     91c:	e6ef1073 	uxtb	r1, r3
     920:	e3073080 	movw	r3, #28800	@ 0x7080
     924:	e3403000 	movt	r3, #0
     928:	e51b200c 	ldr	r2, [fp, #-12]
     92c:	e0833002 	add	r3, r3, r2
     930:	e1a02001 	mov	r2, r1
     934:	e5c32000 	strb	r2, [r3]
      for(i = 0; i < 1033; i++)
     938:	e51b300c 	ldr	r3, [fp, #-12]
     93c:	e2833001 	add	r3, r3, #1
     940:	e50b300c 	str	r3, [fp, #-12]
     944:	e51b300c 	ldr	r3, [fp, #-12]
     948:	e3002408 	movw	r2, #1032	@ 0x408
     94c:	e1530002 	cmp	r3, r2
     950:	daffffee 	ble	910 <pipe1+0x78>
      if(write(fds[1], buf, 1033) != 1033){
     954:	e51b3020 	ldr	r3, [fp, #-32]	@ 0xffffffe0
     958:	e3002409 	movw	r2, #1033	@ 0x409
     95c:	e3071080 	movw	r1, #28800	@ 0x7080
     960:	e3401000 	movt	r1, #0
     964:	e1a00003 	mov	r0, r3
     968:	eb00104c 	bl	4aa0 <write>
     96c:	e1a03000 	mov	r3, r0
     970:	e3002409 	movw	r2, #1033	@ 0x409
     974:	e1530002 	cmp	r3, r2
     978:	0a000004 	beq	990 <pipe1+0xf8>
        printf(1, "pipe1 oops 1\n");
     97c:	e305195c 	movw	r1, #22876	@ 0x595c
     980:	e3401000 	movt	r1, #0
     984:	e3a00001 	mov	r0, #1
     988:	eb0011a1 	bl	5014 <printf>
        exit();
     98c:	eb00100f 	bl	49d0 <exit>
    for(n = 0; n < 5; n++){
     990:	e51b3010 	ldr	r3, [fp, #-16]
     994:	e2833001 	add	r3, r3, #1
     998:	e50b3010 	str	r3, [fp, #-16]
     99c:	e51b3010 	ldr	r3, [fp, #-16]
     9a0:	e3530004 	cmp	r3, #4
     9a4:	daffffd6 	ble	904 <pipe1+0x6c>
      }
    }
    exit();
     9a8:	eb001008 	bl	49d0 <exit>
  } else if(pid > 0){
     9ac:	e51b301c 	ldr	r3, [fp, #-28]	@ 0xffffffe4
     9b0:	e3530000 	cmp	r3, #0
     9b4:	da00004b 	ble	ae8 <pipe1+0x250>
    close(fds[1]);
     9b8:	e51b3020 	ldr	r3, [fp, #-32]	@ 0xffffffe0
     9bc:	e1a00003 	mov	r0, r3
     9c0:	eb001043 	bl	4ad4 <close>
    total = 0;
     9c4:	e3a03000 	mov	r3, #0
     9c8:	e50b3018 	str	r3, [fp, #-24]	@ 0xffffffe8
    cc = 1;
     9cc:	e3a03001 	mov	r3, #1
     9d0:	e50b3014 	str	r3, [fp, #-20]	@ 0xffffffec
    while((n = read(fds[0], buf, cc)) > 0){
     9d4:	ea000026 	b	a74 <pipe1+0x1dc>
      for(i = 0; i < n; i++){
     9d8:	e3a03000 	mov	r3, #0
     9dc:	e50b300c 	str	r3, [fp, #-12]
     9e0:	ea000013 	b	a34 <pipe1+0x19c>
        if((buf[i] & 0xff) != (seq++ & 0xff)){
     9e4:	e3073080 	movw	r3, #28800	@ 0x7080
     9e8:	e3403000 	movt	r3, #0
     9ec:	e51b200c 	ldr	r2, [fp, #-12]
     9f0:	e0833002 	add	r3, r3, r2
     9f4:	e5d33000 	ldrb	r3, [r3]
     9f8:	e1a01003 	mov	r1, r3
     9fc:	e51b3008 	ldr	r3, [fp, #-8]
     a00:	e2832001 	add	r2, r3, #1
     a04:	e50b2008 	str	r2, [fp, #-8]
     a08:	e6ef3073 	uxtb	r3, r3
     a0c:	e1510003 	cmp	r1, r3
     a10:	0a000004 	beq	a28 <pipe1+0x190>
          printf(1, "pipe1 oops 2\n");
     a14:	e305196c 	movw	r1, #22892	@ 0x596c
     a18:	e3401000 	movt	r1, #0
     a1c:	e3a00001 	mov	r0, #1
     a20:	eb00117b 	bl	5014 <printf>
     a24:	ea000034 	b	afc <pipe1+0x264>
      for(i = 0; i < n; i++){
     a28:	e51b300c 	ldr	r3, [fp, #-12]
     a2c:	e2833001 	add	r3, r3, #1
     a30:	e50b300c 	str	r3, [fp, #-12]
     a34:	e51b200c 	ldr	r2, [fp, #-12]
     a38:	e51b3010 	ldr	r3, [fp, #-16]
     a3c:	e1520003 	cmp	r2, r3
     a40:	baffffe7 	blt	9e4 <pipe1+0x14c>
          return;
        }
      }
      total += n;
     a44:	e51b2018 	ldr	r2, [fp, #-24]	@ 0xffffffe8
     a48:	e51b3010 	ldr	r3, [fp, #-16]
     a4c:	e0823003 	add	r3, r2, r3
     a50:	e50b3018 	str	r3, [fp, #-24]	@ 0xffffffe8
      cc = cc * 2;
     a54:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
     a58:	e1a03083 	lsl	r3, r3, #1
     a5c:	e50b3014 	str	r3, [fp, #-20]	@ 0xffffffec
      if(cc > sizeof(buf))
     a60:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
     a64:	e3530a02 	cmp	r3, #8192	@ 0x2000
     a68:	9a000001 	bls	a74 <pipe1+0x1dc>
        cc = sizeof(buf);
     a6c:	e3a03a02 	mov	r3, #8192	@ 0x2000
     a70:	e50b3014 	str	r3, [fp, #-20]	@ 0xffffffec
    while((n = read(fds[0], buf, cc)) > 0){
     a74:	e51b3024 	ldr	r3, [fp, #-36]	@ 0xffffffdc
     a78:	e51b2014 	ldr	r2, [fp, #-20]	@ 0xffffffec
     a7c:	e3071080 	movw	r1, #28800	@ 0x7080
     a80:	e3401000 	movt	r1, #0
     a84:	e1a00003 	mov	r0, r3
     a88:	eb000ff7 	bl	4a6c <read>
     a8c:	e50b0010 	str	r0, [fp, #-16]
     a90:	e51b3010 	ldr	r3, [fp, #-16]
     a94:	e3530000 	cmp	r3, #0
     a98:	caffffce 	bgt	9d8 <pipe1+0x140>
    }
    if(total != 5 * 1033){
     a9c:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
     aa0:	e301242d 	movw	r2, #5165	@ 0x142d
     aa4:	e1530002 	cmp	r3, r2
     aa8:	0a000005 	beq	ac4 <pipe1+0x22c>
      printf(1, "pipe1 oops 3 total %d\n", total);
     aac:	e51b2018 	ldr	r2, [fp, #-24]	@ 0xffffffe8
     ab0:	e305197c 	movw	r1, #22908	@ 0x597c
     ab4:	e3401000 	movt	r1, #0
     ab8:	e3a00001 	mov	r0, #1
     abc:	eb001154 	bl	5014 <printf>
      exit();
     ac0:	eb000fc2 	bl	49d0 <exit>
    }
    close(fds[0]);
     ac4:	e51b3024 	ldr	r3, [fp, #-36]	@ 0xffffffdc
     ac8:	e1a00003 	mov	r0, r3
     acc:	eb001000 	bl	4ad4 <close>
    wait();
     ad0:	eb000fcb 	bl	4a04 <wait>
  } else {
    printf(1, "fork() failed\n");
    exit();
  }
  printf(1, "pipe1 ok\n");
     ad4:	e30519a4 	movw	r1, #22948	@ 0x59a4
     ad8:	e3401000 	movt	r1, #0
     adc:	e3a00001 	mov	r0, #1
     ae0:	eb00114b 	bl	5014 <printf>
     ae4:	ea000004 	b	afc <pipe1+0x264>
    printf(1, "fork() failed\n");
     ae8:	e3051994 	movw	r1, #22932	@ 0x5994
     aec:	e3401000 	movt	r1, #0
     af0:	e3a00001 	mov	r0, #1
     af4:	eb001146 	bl	5014 <printf>
    exit();
     af8:	eb000fb4 	bl	49d0 <exit>
}
     afc:	e24bd004 	sub	sp, fp, #4
     b00:	e8bd8800 	pop	{fp, pc}

00000b04 <preempt>:

// meant to be run w/ at most two CPUs
void
preempt(void)
{
     b04:	e92d4800 	push	{fp, lr}
     b08:	e28db004 	add	fp, sp, #4
     b0c:	e24dd018 	sub	sp, sp, #24
  int pid1, pid2, pid3;
  int pfds[2];

  printf(1, "preempt: ");
     b10:	e30519b0 	movw	r1, #22960	@ 0x59b0
     b14:	e3401000 	movt	r1, #0
     b18:	e3a00001 	mov	r0, #1
     b1c:	eb00113c 	bl	5014 <printf>
  pid1 = fork();
     b20:	eb000f9d 	bl	499c <fork>
     b24:	e50b0008 	str	r0, [fp, #-8]
  if(pid1 == 0)
     b28:	e51b3008 	ldr	r3, [fp, #-8]
     b2c:	e3530000 	cmp	r3, #0
     b30:	1a000001 	bne	b3c <preempt+0x38>
    for(;;)
     b34:	e320f000 	nop	{0}
     b38:	eafffffd 	b	b34 <preempt+0x30>
      ;

  pid2 = fork();
     b3c:	eb000f96 	bl	499c <fork>
     b40:	e50b000c 	str	r0, [fp, #-12]
  if(pid2 == 0)
     b44:	e51b300c 	ldr	r3, [fp, #-12]
     b48:	e3530000 	cmp	r3, #0
     b4c:	1a000001 	bne	b58 <preempt+0x54>
    for(;;)
     b50:	e320f000 	nop	{0}
     b54:	eafffffd 	b	b50 <preempt+0x4c>
      ;

  pipe(pfds);
     b58:	e24b3018 	sub	r3, fp, #24
     b5c:	e1a00003 	mov	r0, r3
     b60:	eb000fb4 	bl	4a38 <pipe>
  pid3 = fork();
     b64:	eb000f8c 	bl	499c <fork>
     b68:	e50b0010 	str	r0, [fp, #-16]
  if(pid3 == 0){
     b6c:	e51b3010 	ldr	r3, [fp, #-16]
     b70:	e3530000 	cmp	r3, #0
     b74:	1a000014 	bne	bcc <preempt+0xc8>
    close(pfds[0]);
     b78:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
     b7c:	e1a00003 	mov	r0, r3
     b80:	eb000fd3 	bl	4ad4 <close>
    if(write(pfds[1], "x", 1) != 1)
     b84:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
     b88:	e3a02001 	mov	r2, #1
     b8c:	e30519bc 	movw	r1, #22972	@ 0x59bc
     b90:	e3401000 	movt	r1, #0
     b94:	e1a00003 	mov	r0, r3
     b98:	eb000fc0 	bl	4aa0 <write>
     b9c:	e1a03000 	mov	r3, r0
     ba0:	e3530001 	cmp	r3, #1
     ba4:	0a000003 	beq	bb8 <preempt+0xb4>
      printf(1, "preempt write error");
     ba8:	e30519c0 	movw	r1, #22976	@ 0x59c0
     bac:	e3401000 	movt	r1, #0
     bb0:	e3a00001 	mov	r0, #1
     bb4:	eb001116 	bl	5014 <printf>
    close(pfds[1]);
     bb8:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
     bbc:	e1a00003 	mov	r0, r3
     bc0:	eb000fc3 	bl	4ad4 <close>
    for(;;)
     bc4:	e320f000 	nop	{0}
     bc8:	eafffffd 	b	bc4 <preempt+0xc0>
      ;
  }

  close(pfds[1]);
     bcc:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
     bd0:	e1a00003 	mov	r0, r3
     bd4:	eb000fbe 	bl	4ad4 <close>
  if(read(pfds[0], buf, sizeof(buf)) != 1){
     bd8:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
     bdc:	e3a02a02 	mov	r2, #8192	@ 0x2000
     be0:	e3071080 	movw	r1, #28800	@ 0x7080
     be4:	e3401000 	movt	r1, #0
     be8:	e1a00003 	mov	r0, r3
     bec:	eb000f9e 	bl	4a6c <read>
     bf0:	e1a03000 	mov	r3, r0
     bf4:	e3530001 	cmp	r3, #1
     bf8:	0a000004 	beq	c10 <preempt+0x10c>
    printf(1, "preempt read error");
     bfc:	e30519d4 	movw	r1, #22996	@ 0x59d4
     c00:	e3401000 	movt	r1, #0
     c04:	e3a00001 	mov	r0, #1
     c08:	eb001101 	bl	5014 <printf>
     c0c:	ea000017 	b	c70 <preempt+0x16c>
    return;
  }
  close(pfds[0]);
     c10:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
     c14:	e1a00003 	mov	r0, r3
     c18:	eb000fad 	bl	4ad4 <close>
  printf(1, "kill... ");
     c1c:	e30519e8 	movw	r1, #23016	@ 0x59e8
     c20:	e3401000 	movt	r1, #0
     c24:	e3a00001 	mov	r0, #1
     c28:	eb0010f9 	bl	5014 <printf>
  kill(pid1);
     c2c:	e51b0008 	ldr	r0, [fp, #-8]
     c30:	eb000fb4 	bl	4b08 <kill>
  kill(pid2);
     c34:	e51b000c 	ldr	r0, [fp, #-12]
     c38:	eb000fb2 	bl	4b08 <kill>
  kill(pid3);
     c3c:	e51b0010 	ldr	r0, [fp, #-16]
     c40:	eb000fb0 	bl	4b08 <kill>
  printf(1, "wait... ");
     c44:	e30519f4 	movw	r1, #23028	@ 0x59f4
     c48:	e3401000 	movt	r1, #0
     c4c:	e3a00001 	mov	r0, #1
     c50:	eb0010ef 	bl	5014 <printf>
  wait();
     c54:	eb000f6a 	bl	4a04 <wait>
  wait();
     c58:	eb000f69 	bl	4a04 <wait>
  wait();
     c5c:	eb000f68 	bl	4a04 <wait>
  printf(1, "preempt ok\n");
     c60:	e3051a00 	movw	r1, #23040	@ 0x5a00
     c64:	e3401000 	movt	r1, #0
     c68:	e3a00001 	mov	r0, #1
     c6c:	eb0010e8 	bl	5014 <printf>
}
     c70:	e24bd004 	sub	sp, fp, #4
     c74:	e8bd8800 	pop	{fp, pc}

00000c78 <exitwait>:

// try to find any races between exit and wait
void
exitwait(void)
{
     c78:	e92d4800 	push	{fp, lr}
     c7c:	e28db004 	add	fp, sp, #4
     c80:	e24dd008 	sub	sp, sp, #8
  int i, pid;

  for(i = 0; i < 100; i++){
     c84:	e3a03000 	mov	r3, #0
     c88:	e50b3008 	str	r3, [fp, #-8]
     c8c:	ea00001a 	b	cfc <exitwait+0x84>
    pid = fork();
     c90:	eb000f41 	bl	499c <fork>
     c94:	e50b000c 	str	r0, [fp, #-12]
    if(pid < 0){
     c98:	e51b300c 	ldr	r3, [fp, #-12]
     c9c:	e3530000 	cmp	r3, #0
     ca0:	aa000004 	bge	cb8 <exitwait+0x40>
      printf(1, "fork failed\n");
     ca4:	e3051a0c 	movw	r1, #23052	@ 0x5a0c
     ca8:	e3401000 	movt	r1, #0
     cac:	e3a00001 	mov	r0, #1
     cb0:	eb0010d7 	bl	5014 <printf>
      return;
     cb4:	ea000017 	b	d18 <exitwait+0xa0>
    }
    if(pid){
     cb8:	e51b300c 	ldr	r3, [fp, #-12]
     cbc:	e3530000 	cmp	r3, #0
     cc0:	0a000009 	beq	cec <exitwait+0x74>
      if(wait() != pid){
     cc4:	eb000f4e 	bl	4a04 <wait>
     cc8:	e1a02000 	mov	r2, r0
     ccc:	e51b300c 	ldr	r3, [fp, #-12]
     cd0:	e1530002 	cmp	r3, r2
     cd4:	0a000005 	beq	cf0 <exitwait+0x78>
        printf(1, "wait wrong pid\n");
     cd8:	e3051a1c 	movw	r1, #23068	@ 0x5a1c
     cdc:	e3401000 	movt	r1, #0
     ce0:	e3a00001 	mov	r0, #1
     ce4:	eb0010ca 	bl	5014 <printf>
        return;
     ce8:	ea00000a 	b	d18 <exitwait+0xa0>
      }
    } else {
      exit();
     cec:	eb000f37 	bl	49d0 <exit>
  for(i = 0; i < 100; i++){
     cf0:	e51b3008 	ldr	r3, [fp, #-8]
     cf4:	e2833001 	add	r3, r3, #1
     cf8:	e50b3008 	str	r3, [fp, #-8]
     cfc:	e51b3008 	ldr	r3, [fp, #-8]
     d00:	e3530063 	cmp	r3, #99	@ 0x63
     d04:	daffffe1 	ble	c90 <exitwait+0x18>
    }
  }
  printf(1, "exitwait ok\n");
     d08:	e3051a2c 	movw	r1, #23084	@ 0x5a2c
     d0c:	e3401000 	movt	r1, #0
     d10:	e3a00001 	mov	r0, #1
     d14:	eb0010be 	bl	5014 <printf>
}
     d18:	e24bd004 	sub	sp, fp, #4
     d1c:	e8bd8800 	pop	{fp, pc}

00000d20 <mem>:

void
mem(void)
{
     d20:	e92d4800 	push	{fp, lr}
     d24:	e28db004 	add	fp, sp, #4
     d28:	e24dd010 	sub	sp, sp, #16
  void *m1, *m2;
  int pid, ppid;

  printf(1, "mem test\n");
     d2c:	e3051a3c 	movw	r1, #23100	@ 0x5a3c
     d30:	e3401000 	movt	r1, #0
     d34:	e3a00001 	mov	r0, #1
     d38:	eb0010b5 	bl	5014 <printf>
  ppid = getpid();
     d3c:	eb000ff3 	bl	4d10 <getpid>
     d40:	e50b000c 	str	r0, [fp, #-12]
  if((pid = fork()) == 0){
     d44:	eb000f14 	bl	499c <fork>
     d48:	e50b0010 	str	r0, [fp, #-16]
     d4c:	e51b3010 	ldr	r3, [fp, #-16]
     d50:	e3530000 	cmp	r3, #0
     d54:	1a00002c 	bne	e0c <mem+0xec>
    m1 = 0;
     d58:	e3a03000 	mov	r3, #0
     d5c:	e50b3008 	str	r3, [fp, #-8]
    while((m2 = malloc(10001)) != 0){
     d60:	ea000004 	b	d78 <mem+0x58>
      *(char**)m2 = m1;
     d64:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
     d68:	e51b2008 	ldr	r2, [fp, #-8]
     d6c:	e5832000 	str	r2, [r3]
      m1 = m2;
     d70:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
     d74:	e50b3008 	str	r3, [fp, #-8]
    while((m2 = malloc(10001)) != 0){
     d78:	e3020711 	movw	r0, #10001	@ 0x2711
     d7c:	eb0011b4 	bl	5454 <malloc>
     d80:	e50b0014 	str	r0, [fp, #-20]	@ 0xffffffec
     d84:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
     d88:	e3530000 	cmp	r3, #0
     d8c:	1afffff4 	bne	d64 <mem+0x44>
    }
    while(m1){
     d90:	ea000006 	b	db0 <mem+0x90>
      m2 = *(char**)m1;
     d94:	e51b3008 	ldr	r3, [fp, #-8]
     d98:	e5933000 	ldr	r3, [r3]
     d9c:	e50b3014 	str	r3, [fp, #-20]	@ 0xffffffec
      free(m1);
     da0:	e51b0008 	ldr	r0, [fp, #-8]
     da4:	eb001128 	bl	524c <free>
      m1 = m2;
     da8:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
     dac:	e50b3008 	str	r3, [fp, #-8]
    while(m1){
     db0:	e51b3008 	ldr	r3, [fp, #-8]
     db4:	e3530000 	cmp	r3, #0
     db8:	1afffff5 	bne	d94 <mem+0x74>
    }
    m1 = malloc(1024*20);
     dbc:	e3a00a05 	mov	r0, #20480	@ 0x5000
     dc0:	eb0011a3 	bl	5454 <malloc>
     dc4:	e50b0008 	str	r0, [fp, #-8]
    if(m1 == 0){
     dc8:	e51b3008 	ldr	r3, [fp, #-8]
     dcc:	e3530000 	cmp	r3, #0
     dd0:	1a000006 	bne	df0 <mem+0xd0>
      printf(1, "couldn't allocate mem?!!\n");
     dd4:	e3051a48 	movw	r1, #23112	@ 0x5a48
     dd8:	e3401000 	movt	r1, #0
     ddc:	e3a00001 	mov	r0, #1
     de0:	eb00108b 	bl	5014 <printf>
      kill(ppid);
     de4:	e51b000c 	ldr	r0, [fp, #-12]
     de8:	eb000f46 	bl	4b08 <kill>
      exit();
     dec:	eb000ef7 	bl	49d0 <exit>
    }
    free(m1);
     df0:	e51b0008 	ldr	r0, [fp, #-8]
     df4:	eb001114 	bl	524c <free>
    printf(1, "mem ok\n");
     df8:	e3051a64 	movw	r1, #23140	@ 0x5a64
     dfc:	e3401000 	movt	r1, #0
     e00:	e3a00001 	mov	r0, #1
     e04:	eb001082 	bl	5014 <printf>
    exit();
     e08:	eb000ef0 	bl	49d0 <exit>
  } else {
    wait();
     e0c:	eb000efc 	bl	4a04 <wait>
  }
}
     e10:	e320f000 	nop	{0}
     e14:	e24bd004 	sub	sp, fp, #4
     e18:	e8bd8800 	pop	{fp, pc}

00000e1c <sharedfd>:

// two processes write to the same file descriptor
// is the offset shared? does inode locking work?
void
sharedfd(void)
{
     e1c:	e92d4800 	push	{fp, lr}
     e20:	e28db004 	add	fp, sp, #4
     e24:	e24dd028 	sub	sp, sp, #40	@ 0x28
  int fd, pid, i, n, nc, np;
  char buf[10];

  printf(1, "sharedfd test\n");
     e28:	e3051a6c 	movw	r1, #23148	@ 0x5a6c
     e2c:	e3401000 	movt	r1, #0
     e30:	e3a00001 	mov	r0, #1
     e34:	eb001076 	bl	5014 <printf>

  unlink("sharedfd");
     e38:	e3050a7c 	movw	r0, #23164	@ 0x5a7c
     e3c:	e3400000 	movt	r0, #0
     e40:	eb000f64 	bl	4bd8 <unlink>
  fd = open("sharedfd", O_CREATE|O_RDWR);
     e44:	e3001202 	movw	r1, #514	@ 0x202
     e48:	e3050a7c 	movw	r0, #23164	@ 0x5a7c
     e4c:	e3400000 	movt	r0, #0
     e50:	eb000f46 	bl	4b70 <open>
     e54:	e50b0014 	str	r0, [fp, #-20]	@ 0xffffffec
  if(fd < 0){
     e58:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
     e5c:	e3530000 	cmp	r3, #0
     e60:	aa000004 	bge	e78 <sharedfd+0x5c>
    printf(1, "fstests: cannot open sharedfd for writing");
     e64:	e3051a88 	movw	r1, #23176	@ 0x5a88
     e68:	e3401000 	movt	r1, #0
     e6c:	e3a00001 	mov	r0, #1
     e70:	eb001067 	bl	5014 <printf>
    return;
     e74:	ea000077 	b	1058 <sharedfd+0x23c>
  }
  pid = fork();
     e78:	eb000ec7 	bl	499c <fork>
     e7c:	e50b0018 	str	r0, [fp, #-24]	@ 0xffffffe8
  memset(buf, pid==0?'c':'p', sizeof(buf));
     e80:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
     e84:	e3530000 	cmp	r3, #0
     e88:	1a000001 	bne	e94 <sharedfd+0x78>
     e8c:	e3a01063 	mov	r1, #99	@ 0x63
     e90:	ea000000 	b	e98 <sharedfd+0x7c>
     e94:	e3a01070 	mov	r1, #112	@ 0x70
     e98:	e24b3028 	sub	r3, fp, #40	@ 0x28
     e9c:	e3a0200a 	mov	r2, #10
     ea0:	e1a00003 	mov	r0, r3
     ea4:	eb000e05 	bl	46c0 <memset>
  for(i = 0; i < 1000; i++){
     ea8:	e3a03000 	mov	r3, #0
     eac:	e50b3008 	str	r3, [fp, #-8]
     eb0:	ea00000f 	b	ef4 <sharedfd+0xd8>
    if(write(fd, buf, sizeof(buf)) != sizeof(buf)){
     eb4:	e24b3028 	sub	r3, fp, #40	@ 0x28
     eb8:	e3a0200a 	mov	r2, #10
     ebc:	e1a01003 	mov	r1, r3
     ec0:	e51b0014 	ldr	r0, [fp, #-20]	@ 0xffffffec
     ec4:	eb000ef5 	bl	4aa0 <write>
     ec8:	e1a03000 	mov	r3, r0
     ecc:	e353000a 	cmp	r3, #10
     ed0:	0a000004 	beq	ee8 <sharedfd+0xcc>
      printf(1, "fstests: write sharedfd failed\n");
     ed4:	e3051ab4 	movw	r1, #23220	@ 0x5ab4
     ed8:	e3401000 	movt	r1, #0
     edc:	e3a00001 	mov	r0, #1
     ee0:	eb00104b 	bl	5014 <printf>
      break;
     ee4:	ea000005 	b	f00 <sharedfd+0xe4>
  for(i = 0; i < 1000; i++){
     ee8:	e51b3008 	ldr	r3, [fp, #-8]
     eec:	e2833001 	add	r3, r3, #1
     ef0:	e50b3008 	str	r3, [fp, #-8]
     ef4:	e51b3008 	ldr	r3, [fp, #-8]
     ef8:	e3530ffa 	cmp	r3, #1000	@ 0x3e8
     efc:	baffffec 	blt	eb4 <sharedfd+0x98>
    }
  }
  if(pid == 0)
     f00:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
     f04:	e3530000 	cmp	r3, #0
     f08:	1a000000 	bne	f10 <sharedfd+0xf4>
    exit();
     f0c:	eb000eaf 	bl	49d0 <exit>
  else
    wait();
     f10:	eb000ebb 	bl	4a04 <wait>
  close(fd);
     f14:	e51b0014 	ldr	r0, [fp, #-20]	@ 0xffffffec
     f18:	eb000eed 	bl	4ad4 <close>
  fd = open("sharedfd", 0);
     f1c:	e3a01000 	mov	r1, #0
     f20:	e3050a7c 	movw	r0, #23164	@ 0x5a7c
     f24:	e3400000 	movt	r0, #0
     f28:	eb000f10 	bl	4b70 <open>
     f2c:	e50b0014 	str	r0, [fp, #-20]	@ 0xffffffec
  if(fd < 0){
     f30:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
     f34:	e3530000 	cmp	r3, #0
     f38:	aa000004 	bge	f50 <sharedfd+0x134>
    printf(1, "fstests: cannot open sharedfd for reading\n");
     f3c:	e3051ad4 	movw	r1, #23252	@ 0x5ad4
     f40:	e3401000 	movt	r1, #0
     f44:	e3a00001 	mov	r0, #1
     f48:	eb001031 	bl	5014 <printf>
    return;
     f4c:	ea000041 	b	1058 <sharedfd+0x23c>
  }
  nc = np = 0;
     f50:	e3a03000 	mov	r3, #0
     f54:	e50b3010 	str	r3, [fp, #-16]
     f58:	e51b3010 	ldr	r3, [fp, #-16]
     f5c:	e50b300c 	str	r3, [fp, #-12]
  while((n = read(fd, buf, sizeof(buf))) > 0){
     f60:	ea00001a 	b	fd0 <sharedfd+0x1b4>
    for(i = 0; i < sizeof(buf); i++){
     f64:	e3a03000 	mov	r3, #0
     f68:	e50b3008 	str	r3, [fp, #-8]
     f6c:	ea000014 	b	fc4 <sharedfd+0x1a8>
      if(buf[i] == 'c')
     f70:	e24b2028 	sub	r2, fp, #40	@ 0x28
     f74:	e51b3008 	ldr	r3, [fp, #-8]
     f78:	e0823003 	add	r3, r2, r3
     f7c:	e5d33000 	ldrb	r3, [r3]
     f80:	e3530063 	cmp	r3, #99	@ 0x63
     f84:	1a000002 	bne	f94 <sharedfd+0x178>
        nc++;
     f88:	e51b300c 	ldr	r3, [fp, #-12]
     f8c:	e2833001 	add	r3, r3, #1
     f90:	e50b300c 	str	r3, [fp, #-12]
      if(buf[i] == 'p')
     f94:	e24b2028 	sub	r2, fp, #40	@ 0x28
     f98:	e51b3008 	ldr	r3, [fp, #-8]
     f9c:	e0823003 	add	r3, r2, r3
     fa0:	e5d33000 	ldrb	r3, [r3]
     fa4:	e3530070 	cmp	r3, #112	@ 0x70
     fa8:	1a000002 	bne	fb8 <sharedfd+0x19c>
        np++;
     fac:	e51b3010 	ldr	r3, [fp, #-16]
     fb0:	e2833001 	add	r3, r3, #1
     fb4:	e50b3010 	str	r3, [fp, #-16]
    for(i = 0; i < sizeof(buf); i++){
     fb8:	e51b3008 	ldr	r3, [fp, #-8]
     fbc:	e2833001 	add	r3, r3, #1
     fc0:	e50b3008 	str	r3, [fp, #-8]
     fc4:	e51b3008 	ldr	r3, [fp, #-8]
     fc8:	e3530009 	cmp	r3, #9
     fcc:	9affffe7 	bls	f70 <sharedfd+0x154>
  while((n = read(fd, buf, sizeof(buf))) > 0){
     fd0:	e24b3028 	sub	r3, fp, #40	@ 0x28
     fd4:	e3a0200a 	mov	r2, #10
     fd8:	e1a01003 	mov	r1, r3
     fdc:	e51b0014 	ldr	r0, [fp, #-20]	@ 0xffffffec
     fe0:	eb000ea1 	bl	4a6c <read>
     fe4:	e50b001c 	str	r0, [fp, #-28]	@ 0xffffffe4
     fe8:	e51b301c 	ldr	r3, [fp, #-28]	@ 0xffffffe4
     fec:	e3530000 	cmp	r3, #0
     ff0:	caffffdb 	bgt	f64 <sharedfd+0x148>
    }
  }
  close(fd);
     ff4:	e51b0014 	ldr	r0, [fp, #-20]	@ 0xffffffec
     ff8:	eb000eb5 	bl	4ad4 <close>
  unlink("sharedfd");
     ffc:	e3050a7c 	movw	r0, #23164	@ 0x5a7c
    1000:	e3400000 	movt	r0, #0
    1004:	eb000ef3 	bl	4bd8 <unlink>
  if(nc == 10000 && np == 10000){
    1008:	e51b300c 	ldr	r3, [fp, #-12]
    100c:	e3022710 	movw	r2, #10000	@ 0x2710
    1010:	e1530002 	cmp	r3, r2
    1014:	1a000008 	bne	103c <sharedfd+0x220>
    1018:	e51b3010 	ldr	r3, [fp, #-16]
    101c:	e3022710 	movw	r2, #10000	@ 0x2710
    1020:	e1530002 	cmp	r3, r2
    1024:	1a000004 	bne	103c <sharedfd+0x220>
    printf(1, "sharedfd ok\n");
    1028:	e3051b00 	movw	r1, #23296	@ 0x5b00
    102c:	e3401000 	movt	r1, #0
    1030:	e3a00001 	mov	r0, #1
    1034:	eb000ff6 	bl	5014 <printf>
    1038:	ea000006 	b	1058 <sharedfd+0x23c>
  } else {
    printf(1, "sharedfd oops %d %d\n", nc, np);
    103c:	e51b3010 	ldr	r3, [fp, #-16]
    1040:	e51b200c 	ldr	r2, [fp, #-12]
    1044:	e3051b10 	movw	r1, #23312	@ 0x5b10
    1048:	e3401000 	movt	r1, #0
    104c:	e3a00001 	mov	r0, #1
    1050:	eb000fef 	bl	5014 <printf>
    exit();
    1054:	eb000e5d 	bl	49d0 <exit>
  }
}
    1058:	e24bd004 	sub	sp, fp, #4
    105c:	e8bd8800 	pop	{fp, pc}

00001060 <twofiles>:

// two processes write two different files at the same
// time, to test block allocation.
void
twofiles(void)
{
    1060:	e92d4800 	push	{fp, lr}
    1064:	e28db004 	add	fp, sp, #4
    1068:	e24dd020 	sub	sp, sp, #32
  int fd, pid, i, j, n, total;
  char *fname;

  printf(1, "twofiles test\n");
    106c:	e3051b28 	movw	r1, #23336	@ 0x5b28
    1070:	e3401000 	movt	r1, #0
    1074:	e3a00001 	mov	r0, #1
    1078:	eb000fe5 	bl	5014 <printf>

  unlink("f1");
    107c:	e3050b38 	movw	r0, #23352	@ 0x5b38
    1080:	e3400000 	movt	r0, #0
    1084:	eb000ed3 	bl	4bd8 <unlink>
  unlink("f2");
    1088:	e3050b3c 	movw	r0, #23356	@ 0x5b3c
    108c:	e3400000 	movt	r0, #0
    1090:	eb000ed0 	bl	4bd8 <unlink>

  pid = fork();
    1094:	eb000e40 	bl	499c <fork>
    1098:	e50b0014 	str	r0, [fp, #-20]	@ 0xffffffec
  if(pid < 0){
    109c:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
    10a0:	e3530000 	cmp	r3, #0
    10a4:	aa000004 	bge	10bc <twofiles+0x5c>
    printf(1, "fork failed\n");
    10a8:	e3051a0c 	movw	r1, #23052	@ 0x5a0c
    10ac:	e3401000 	movt	r1, #0
    10b0:	e3a00001 	mov	r0, #1
    10b4:	eb000fd6 	bl	5014 <printf>
    exit();
    10b8:	eb000e44 	bl	49d0 <exit>
  }

  fname = pid ? "f1" : "f2";
    10bc:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
    10c0:	e3530000 	cmp	r3, #0
    10c4:	0a000002 	beq	10d4 <twofiles+0x74>
    10c8:	e3053b38 	movw	r3, #23352	@ 0x5b38
    10cc:	e3403000 	movt	r3, #0
    10d0:	ea000001 	b	10dc <twofiles+0x7c>
    10d4:	e3053b3c 	movw	r3, #23356	@ 0x5b3c
    10d8:	e3403000 	movt	r3, #0
    10dc:	e50b3018 	str	r3, [fp, #-24]	@ 0xffffffe8
  fd = open(fname, O_CREATE | O_RDWR);
    10e0:	e3001202 	movw	r1, #514	@ 0x202
    10e4:	e51b0018 	ldr	r0, [fp, #-24]	@ 0xffffffe8
    10e8:	eb000ea0 	bl	4b70 <open>
    10ec:	e50b001c 	str	r0, [fp, #-28]	@ 0xffffffe4
  if(fd < 0){
    10f0:	e51b301c 	ldr	r3, [fp, #-28]	@ 0xffffffe4
    10f4:	e3530000 	cmp	r3, #0
    10f8:	aa000004 	bge	1110 <twofiles+0xb0>
    printf(1, "create failed\n");
    10fc:	e3051b40 	movw	r1, #23360	@ 0x5b40
    1100:	e3401000 	movt	r1, #0
    1104:	e3a00001 	mov	r0, #1
    1108:	eb000fc1 	bl	5014 <printf>
    exit();
    110c:	eb000e2f 	bl	49d0 <exit>
  }

  memset(buf, pid?'p':'c', 512);
    1110:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
    1114:	e3530000 	cmp	r3, #0
    1118:	0a000001 	beq	1124 <twofiles+0xc4>
    111c:	e3a03070 	mov	r3, #112	@ 0x70
    1120:	ea000000 	b	1128 <twofiles+0xc8>
    1124:	e3a03063 	mov	r3, #99	@ 0x63
    1128:	e3a02c02 	mov	r2, #512	@ 0x200
    112c:	e1a01003 	mov	r1, r3
    1130:	e3070080 	movw	r0, #28800	@ 0x7080
    1134:	e3400000 	movt	r0, #0
    1138:	eb000d60 	bl	46c0 <memset>
  for(i = 0; i < 12; i++){
    113c:	e3a03000 	mov	r3, #0
    1140:	e50b3008 	str	r3, [fp, #-8]
    1144:	ea000011 	b	1190 <twofiles+0x130>
    if((n = write(fd, buf, 500)) != 500){
    1148:	e3a02f7d 	mov	r2, #500	@ 0x1f4
    114c:	e3071080 	movw	r1, #28800	@ 0x7080
    1150:	e3401000 	movt	r1, #0
    1154:	e51b001c 	ldr	r0, [fp, #-28]	@ 0xffffffe4
    1158:	eb000e50 	bl	4aa0 <write>
    115c:	e50b0020 	str	r0, [fp, #-32]	@ 0xffffffe0
    1160:	e51b3020 	ldr	r3, [fp, #-32]	@ 0xffffffe0
    1164:	e3530f7d 	cmp	r3, #500	@ 0x1f4
    1168:	0a000005 	beq	1184 <twofiles+0x124>
      printf(1, "write failed %d\n", n);
    116c:	e51b2020 	ldr	r2, [fp, #-32]	@ 0xffffffe0
    1170:	e3051b50 	movw	r1, #23376	@ 0x5b50
    1174:	e3401000 	movt	r1, #0
    1178:	e3a00001 	mov	r0, #1
    117c:	eb000fa4 	bl	5014 <printf>
      exit();
    1180:	eb000e12 	bl	49d0 <exit>
  for(i = 0; i < 12; i++){
    1184:	e51b3008 	ldr	r3, [fp, #-8]
    1188:	e2833001 	add	r3, r3, #1
    118c:	e50b3008 	str	r3, [fp, #-8]
    1190:	e51b3008 	ldr	r3, [fp, #-8]
    1194:	e353000b 	cmp	r3, #11
    1198:	daffffea 	ble	1148 <twofiles+0xe8>
    }
  }
  close(fd);
    119c:	e51b001c 	ldr	r0, [fp, #-28]	@ 0xffffffe4
    11a0:	eb000e4b 	bl	4ad4 <close>
  if(pid)
    11a4:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
    11a8:	e3530000 	cmp	r3, #0
    11ac:	0a000003 	beq	11c0 <twofiles+0x160>
    wait();
    11b0:	eb000e13 	bl	4a04 <wait>
  else
    exit();

  for(i = 0; i < 2; i++){
    11b4:	e3a03000 	mov	r3, #0
    11b8:	e50b3008 	str	r3, [fp, #-8]
    11bc:	ea000048 	b	12e4 <twofiles+0x284>
    exit();
    11c0:	eb000e02 	bl	49d0 <exit>
    fd = open(i?"f1":"f2", 0);
    11c4:	e51b3008 	ldr	r3, [fp, #-8]
    11c8:	e3530000 	cmp	r3, #0
    11cc:	0a000002 	beq	11dc <twofiles+0x17c>
    11d0:	e3053b38 	movw	r3, #23352	@ 0x5b38
    11d4:	e3403000 	movt	r3, #0
    11d8:	ea000001 	b	11e4 <twofiles+0x184>
    11dc:	e3053b3c 	movw	r3, #23356	@ 0x5b3c
    11e0:	e3403000 	movt	r3, #0
    11e4:	e3a01000 	mov	r1, #0
    11e8:	e1a00003 	mov	r0, r3
    11ec:	eb000e5f 	bl	4b70 <open>
    11f0:	e50b001c 	str	r0, [fp, #-28]	@ 0xffffffe4
    total = 0;
    11f4:	e3a03000 	mov	r3, #0
    11f8:	e50b3010 	str	r3, [fp, #-16]
    while((n = read(fd, buf, sizeof(buf))) > 0){
    11fc:	ea000020 	b	1284 <twofiles+0x224>
      for(j = 0; j < n; j++){
    1200:	e3a03000 	mov	r3, #0
    1204:	e50b300c 	str	r3, [fp, #-12]
    1208:	ea000015 	b	1264 <twofiles+0x204>
        if(buf[j] != (i?'p':'c')){
    120c:	e3073080 	movw	r3, #28800	@ 0x7080
    1210:	e3403000 	movt	r3, #0
    1214:	e51b200c 	ldr	r2, [fp, #-12]
    1218:	e0833002 	add	r3, r3, r2
    121c:	e5d33000 	ldrb	r3, [r3]
    1220:	e1a02003 	mov	r2, r3
    1224:	e51b3008 	ldr	r3, [fp, #-8]
    1228:	e3530000 	cmp	r3, #0
    122c:	0a000001 	beq	1238 <twofiles+0x1d8>
    1230:	e3a03070 	mov	r3, #112	@ 0x70
    1234:	ea000000 	b	123c <twofiles+0x1dc>
    1238:	e3a03063 	mov	r3, #99	@ 0x63
    123c:	e1530002 	cmp	r3, r2
    1240:	0a000004 	beq	1258 <twofiles+0x1f8>
          printf(1, "wrong char\n");
    1244:	e3051b64 	movw	r1, #23396	@ 0x5b64
    1248:	e3401000 	movt	r1, #0
    124c:	e3a00001 	mov	r0, #1
    1250:	eb000f6f 	bl	5014 <printf>
          exit();
    1254:	eb000ddd 	bl	49d0 <exit>
      for(j = 0; j < n; j++){
    1258:	e51b300c 	ldr	r3, [fp, #-12]
    125c:	e2833001 	add	r3, r3, #1
    1260:	e50b300c 	str	r3, [fp, #-12]
    1264:	e51b200c 	ldr	r2, [fp, #-12]
    1268:	e51b3020 	ldr	r3, [fp, #-32]	@ 0xffffffe0
    126c:	e1520003 	cmp	r2, r3
    1270:	baffffe5 	blt	120c <twofiles+0x1ac>
        }
      }
      total += n;
    1274:	e51b2010 	ldr	r2, [fp, #-16]
    1278:	e51b3020 	ldr	r3, [fp, #-32]	@ 0xffffffe0
    127c:	e0823003 	add	r3, r2, r3
    1280:	e50b3010 	str	r3, [fp, #-16]
    while((n = read(fd, buf, sizeof(buf))) > 0){
    1284:	e3a02a02 	mov	r2, #8192	@ 0x2000
    1288:	e3071080 	movw	r1, #28800	@ 0x7080
    128c:	e3401000 	movt	r1, #0
    1290:	e51b001c 	ldr	r0, [fp, #-28]	@ 0xffffffe4
    1294:	eb000df4 	bl	4a6c <read>
    1298:	e50b0020 	str	r0, [fp, #-32]	@ 0xffffffe0
    129c:	e51b3020 	ldr	r3, [fp, #-32]	@ 0xffffffe0
    12a0:	e3530000 	cmp	r3, #0
    12a4:	caffffd5 	bgt	1200 <twofiles+0x1a0>
    }
    close(fd);
    12a8:	e51b001c 	ldr	r0, [fp, #-28]	@ 0xffffffe4
    12ac:	eb000e08 	bl	4ad4 <close>
    if(total != 12*500){
    12b0:	e51b3010 	ldr	r3, [fp, #-16]
    12b4:	e3012770 	movw	r2, #6000	@ 0x1770
    12b8:	e1530002 	cmp	r3, r2
    12bc:	0a000005 	beq	12d8 <twofiles+0x278>
      printf(1, "wrong length %d\n", total);
    12c0:	e51b2010 	ldr	r2, [fp, #-16]
    12c4:	e3051b70 	movw	r1, #23408	@ 0x5b70
    12c8:	e3401000 	movt	r1, #0
    12cc:	e3a00001 	mov	r0, #1
    12d0:	eb000f4f 	bl	5014 <printf>
      exit();
    12d4:	eb000dbd 	bl	49d0 <exit>
  for(i = 0; i < 2; i++){
    12d8:	e51b3008 	ldr	r3, [fp, #-8]
    12dc:	e2833001 	add	r3, r3, #1
    12e0:	e50b3008 	str	r3, [fp, #-8]
    12e4:	e51b3008 	ldr	r3, [fp, #-8]
    12e8:	e3530001 	cmp	r3, #1
    12ec:	daffffb4 	ble	11c4 <twofiles+0x164>
    }
  }

  unlink("f1");
    12f0:	e3050b38 	movw	r0, #23352	@ 0x5b38
    12f4:	e3400000 	movt	r0, #0
    12f8:	eb000e36 	bl	4bd8 <unlink>
  unlink("f2");
    12fc:	e3050b3c 	movw	r0, #23356	@ 0x5b3c
    1300:	e3400000 	movt	r0, #0
    1304:	eb000e33 	bl	4bd8 <unlink>

  printf(1, "twofiles ok\n");
    1308:	e3051b84 	movw	r1, #23428	@ 0x5b84
    130c:	e3401000 	movt	r1, #0
    1310:	e3a00001 	mov	r0, #1
    1314:	eb000f3e 	bl	5014 <printf>
}
    1318:	e320f000 	nop	{0}
    131c:	e24bd004 	sub	sp, fp, #4
    1320:	e8bd8800 	pop	{fp, pc}

00001324 <createdelete>:

// two processes create and delete different files in same directory
void
createdelete(void)
{
    1324:	e92d4800 	push	{fp, lr}
    1328:	e28db004 	add	fp, sp, #4
    132c:	e24dd030 	sub	sp, sp, #48	@ 0x30
  enum { N = 20 };
  int pid, i, fd;
  char name[32];

  printf(1, "createdelete test\n");
    1330:	e3051b94 	movw	r1, #23444	@ 0x5b94
    1334:	e3401000 	movt	r1, #0
    1338:	e3a00001 	mov	r0, #1
    133c:	eb000f34 	bl	5014 <printf>
  pid = fork();
    1340:	eb000d95 	bl	499c <fork>
    1344:	e50b000c 	str	r0, [fp, #-12]
  if(pid < 0){
    1348:	e51b300c 	ldr	r3, [fp, #-12]
    134c:	e3530000 	cmp	r3, #0
    1350:	aa000004 	bge	1368 <createdelete+0x44>
    printf(1, "fork failed\n");
    1354:	e3051a0c 	movw	r1, #23052	@ 0x5a0c
    1358:	e3401000 	movt	r1, #0
    135c:	e3a00001 	mov	r0, #1
    1360:	eb000f2b 	bl	5014 <printf>
    exit();
    1364:	eb000d99 	bl	49d0 <exit>
  }

  name[0] = pid ? 'p' : 'c';
    1368:	e51b300c 	ldr	r3, [fp, #-12]
    136c:	e3530000 	cmp	r3, #0
    1370:	0a000001 	beq	137c <createdelete+0x58>
    1374:	e3a03070 	mov	r3, #112	@ 0x70
    1378:	ea000000 	b	1380 <createdelete+0x5c>
    137c:	e3a03063 	mov	r3, #99	@ 0x63
    1380:	e54b3030 	strb	r3, [fp, #-48]	@ 0xffffffd0
  name[2] = '\0';
    1384:	e3a03000 	mov	r3, #0
    1388:	e54b302e 	strb	r3, [fp, #-46]	@ 0xffffffd2
  for(i = 0; i < N; i++){
    138c:	e3a03000 	mov	r3, #0
    1390:	e50b3008 	str	r3, [fp, #-8]
    1394:	ea000030 	b	145c <createdelete+0x138>
    name[1] = '0' + i;
    1398:	e51b3008 	ldr	r3, [fp, #-8]
    139c:	e6ef3073 	uxtb	r3, r3
    13a0:	e2833030 	add	r3, r3, #48	@ 0x30
    13a4:	e6ef3073 	uxtb	r3, r3
    13a8:	e54b302f 	strb	r3, [fp, #-47]	@ 0xffffffd1
    fd = open(name, O_CREATE | O_RDWR);
    13ac:	e24b3030 	sub	r3, fp, #48	@ 0x30
    13b0:	e3001202 	movw	r1, #514	@ 0x202
    13b4:	e1a00003 	mov	r0, r3
    13b8:	eb000dec 	bl	4b70 <open>
    13bc:	e50b0010 	str	r0, [fp, #-16]
    if(fd < 0){
    13c0:	e51b3010 	ldr	r3, [fp, #-16]
    13c4:	e3530000 	cmp	r3, #0
    13c8:	aa000004 	bge	13e0 <createdelete+0xbc>
      printf(1, "create failed\n");
    13cc:	e3051b40 	movw	r1, #23360	@ 0x5b40
    13d0:	e3401000 	movt	r1, #0
    13d4:	e3a00001 	mov	r0, #1
    13d8:	eb000f0d 	bl	5014 <printf>
      exit();
    13dc:	eb000d7b 	bl	49d0 <exit>
    }
    close(fd);
    13e0:	e51b0010 	ldr	r0, [fp, #-16]
    13e4:	eb000dba 	bl	4ad4 <close>
    if(i > 0 && (i % 2 ) == 0){
    13e8:	e51b3008 	ldr	r3, [fp, #-8]
    13ec:	e3530000 	cmp	r3, #0
    13f0:	da000016 	ble	1450 <createdelete+0x12c>
    13f4:	e51b3008 	ldr	r3, [fp, #-8]
    13f8:	e2033001 	and	r3, r3, #1
    13fc:	e3530000 	cmp	r3, #0
    1400:	1a000012 	bne	1450 <createdelete+0x12c>
      name[1] = '0' + (i / 2);
    1404:	e51b3008 	ldr	r3, [fp, #-8]
    1408:	e1a02fa3 	lsr	r2, r3, #31
    140c:	e0823003 	add	r3, r2, r3
    1410:	e1a030c3 	asr	r3, r3, #1
    1414:	e6ef3073 	uxtb	r3, r3
    1418:	e2833030 	add	r3, r3, #48	@ 0x30
    141c:	e6ef3073 	uxtb	r3, r3
    1420:	e54b302f 	strb	r3, [fp, #-47]	@ 0xffffffd1
      if(unlink(name) < 0){
    1424:	e24b3030 	sub	r3, fp, #48	@ 0x30
    1428:	e1a00003 	mov	r0, r3
    142c:	eb000de9 	bl	4bd8 <unlink>
    1430:	e1a03000 	mov	r3, r0
    1434:	e3530000 	cmp	r3, #0
    1438:	aa000004 	bge	1450 <createdelete+0x12c>
        printf(1, "unlink failed\n");
    143c:	e3051ba8 	movw	r1, #23464	@ 0x5ba8
    1440:	e3401000 	movt	r1, #0
    1444:	e3a00001 	mov	r0, #1
    1448:	eb000ef1 	bl	5014 <printf>
        exit();
    144c:	eb000d5f 	bl	49d0 <exit>
  for(i = 0; i < N; i++){
    1450:	e51b3008 	ldr	r3, [fp, #-8]
    1454:	e2833001 	add	r3, r3, #1
    1458:	e50b3008 	str	r3, [fp, #-8]
    145c:	e51b3008 	ldr	r3, [fp, #-8]
    1460:	e3530013 	cmp	r3, #19
    1464:	daffffcb 	ble	1398 <createdelete+0x74>
      }
    }
  }

  if(pid==0)
    1468:	e51b300c 	ldr	r3, [fp, #-12]
    146c:	e3530000 	cmp	r3, #0
    1470:	1a000000 	bne	1478 <createdelete+0x154>
    exit();
    1474:	eb000d55 	bl	49d0 <exit>
  else
    wait();
    1478:	eb000d61 	bl	4a04 <wait>

  for(i = 0; i < N; i++){
    147c:	e3a03000 	mov	r3, #0
    1480:	e50b3008 	str	r3, [fp, #-8]
    1484:	ea000064 	b	161c <createdelete+0x2f8>
    name[0] = 'p';
    1488:	e3a03070 	mov	r3, #112	@ 0x70
    148c:	e54b3030 	strb	r3, [fp, #-48]	@ 0xffffffd0
    name[1] = '0' + i;
    1490:	e51b3008 	ldr	r3, [fp, #-8]
    1494:	e6ef3073 	uxtb	r3, r3
    1498:	e2833030 	add	r3, r3, #48	@ 0x30
    149c:	e6ef3073 	uxtb	r3, r3
    14a0:	e54b302f 	strb	r3, [fp, #-47]	@ 0xffffffd1
    fd = open(name, 0);
    14a4:	e24b3030 	sub	r3, fp, #48	@ 0x30
    14a8:	e3a01000 	mov	r1, #0
    14ac:	e1a00003 	mov	r0, r3
    14b0:	eb000dae 	bl	4b70 <open>
    14b4:	e50b0010 	str	r0, [fp, #-16]
    if((i == 0 || i >= N/2) && fd < 0){
    14b8:	e51b3008 	ldr	r3, [fp, #-8]
    14bc:	e3530000 	cmp	r3, #0
    14c0:	0a000002 	beq	14d0 <createdelete+0x1ac>
    14c4:	e51b3008 	ldr	r3, [fp, #-8]
    14c8:	e3530009 	cmp	r3, #9
    14cc:	da000009 	ble	14f8 <createdelete+0x1d4>
    14d0:	e51b3010 	ldr	r3, [fp, #-16]
    14d4:	e3530000 	cmp	r3, #0
    14d8:	aa000006 	bge	14f8 <createdelete+0x1d4>
      printf(1, "oops createdelete %s didn't exist\n", name);
    14dc:	e24b3030 	sub	r3, fp, #48	@ 0x30
    14e0:	e1a02003 	mov	r2, r3
    14e4:	e3051bb8 	movw	r1, #23480	@ 0x5bb8
    14e8:	e3401000 	movt	r1, #0
    14ec:	e3a00001 	mov	r0, #1
    14f0:	eb000ec7 	bl	5014 <printf>
      exit();
    14f4:	eb000d35 	bl	49d0 <exit>
    } else if((i >= 1 && i < N/2) && fd >= 0){
    14f8:	e51b3008 	ldr	r3, [fp, #-8]
    14fc:	e3530000 	cmp	r3, #0
    1500:	da00000c 	ble	1538 <createdelete+0x214>
    1504:	e51b3008 	ldr	r3, [fp, #-8]
    1508:	e3530009 	cmp	r3, #9
    150c:	ca000009 	bgt	1538 <createdelete+0x214>
    1510:	e51b3010 	ldr	r3, [fp, #-16]
    1514:	e3530000 	cmp	r3, #0
    1518:	ba000006 	blt	1538 <createdelete+0x214>
      printf(1, "oops createdelete %s did exist\n", name);
    151c:	e24b3030 	sub	r3, fp, #48	@ 0x30
    1520:	e1a02003 	mov	r2, r3
    1524:	e3051bdc 	movw	r1, #23516	@ 0x5bdc
    1528:	e3401000 	movt	r1, #0
    152c:	e3a00001 	mov	r0, #1
    1530:	eb000eb7 	bl	5014 <printf>
      exit();
    1534:	eb000d25 	bl	49d0 <exit>
    }
    if(fd >= 0)
    1538:	e51b3010 	ldr	r3, [fp, #-16]
    153c:	e3530000 	cmp	r3, #0
    1540:	ba000001 	blt	154c <createdelete+0x228>
      close(fd);
    1544:	e51b0010 	ldr	r0, [fp, #-16]
    1548:	eb000d61 	bl	4ad4 <close>

    name[0] = 'c';
    154c:	e3a03063 	mov	r3, #99	@ 0x63
    1550:	e54b3030 	strb	r3, [fp, #-48]	@ 0xffffffd0
    name[1] = '0' + i;
    1554:	e51b3008 	ldr	r3, [fp, #-8]
    1558:	e6ef3073 	uxtb	r3, r3
    155c:	e2833030 	add	r3, r3, #48	@ 0x30
    1560:	e6ef3073 	uxtb	r3, r3
    1564:	e54b302f 	strb	r3, [fp, #-47]	@ 0xffffffd1
    fd = open(name, 0);
    1568:	e24b3030 	sub	r3, fp, #48	@ 0x30
    156c:	e3a01000 	mov	r1, #0
    1570:	e1a00003 	mov	r0, r3
    1574:	eb000d7d 	bl	4b70 <open>
    1578:	e50b0010 	str	r0, [fp, #-16]
    if((i == 0 || i >= N/2) && fd < 0){
    157c:	e51b3008 	ldr	r3, [fp, #-8]
    1580:	e3530000 	cmp	r3, #0
    1584:	0a000002 	beq	1594 <createdelete+0x270>
    1588:	e51b3008 	ldr	r3, [fp, #-8]
    158c:	e3530009 	cmp	r3, #9
    1590:	da000009 	ble	15bc <createdelete+0x298>
    1594:	e51b3010 	ldr	r3, [fp, #-16]
    1598:	e3530000 	cmp	r3, #0
    159c:	aa000006 	bge	15bc <createdelete+0x298>
      printf(1, "oops createdelete %s didn't exist\n", name);
    15a0:	e24b3030 	sub	r3, fp, #48	@ 0x30
    15a4:	e1a02003 	mov	r2, r3
    15a8:	e3051bb8 	movw	r1, #23480	@ 0x5bb8
    15ac:	e3401000 	movt	r1, #0
    15b0:	e3a00001 	mov	r0, #1
    15b4:	eb000e96 	bl	5014 <printf>
      exit();
    15b8:	eb000d04 	bl	49d0 <exit>
    } else if((i >= 1 && i < N/2) && fd >= 0){
    15bc:	e51b3008 	ldr	r3, [fp, #-8]
    15c0:	e3530000 	cmp	r3, #0
    15c4:	da00000c 	ble	15fc <createdelete+0x2d8>
    15c8:	e51b3008 	ldr	r3, [fp, #-8]
    15cc:	e3530009 	cmp	r3, #9
    15d0:	ca000009 	bgt	15fc <createdelete+0x2d8>
    15d4:	e51b3010 	ldr	r3, [fp, #-16]
    15d8:	e3530000 	cmp	r3, #0
    15dc:	ba000006 	blt	15fc <createdelete+0x2d8>
      printf(1, "oops createdelete %s did exist\n", name);
    15e0:	e24b3030 	sub	r3, fp, #48	@ 0x30
    15e4:	e1a02003 	mov	r2, r3
    15e8:	e3051bdc 	movw	r1, #23516	@ 0x5bdc
    15ec:	e3401000 	movt	r1, #0
    15f0:	e3a00001 	mov	r0, #1
    15f4:	eb000e86 	bl	5014 <printf>
      exit();
    15f8:	eb000cf4 	bl	49d0 <exit>
    }
    if(fd >= 0)
    15fc:	e51b3010 	ldr	r3, [fp, #-16]
    1600:	e3530000 	cmp	r3, #0
    1604:	ba000001 	blt	1610 <createdelete+0x2ec>
      close(fd);
    1608:	e51b0010 	ldr	r0, [fp, #-16]
    160c:	eb000d30 	bl	4ad4 <close>
  for(i = 0; i < N; i++){
    1610:	e51b3008 	ldr	r3, [fp, #-8]
    1614:	e2833001 	add	r3, r3, #1
    1618:	e50b3008 	str	r3, [fp, #-8]
    161c:	e51b3008 	ldr	r3, [fp, #-8]
    1620:	e3530013 	cmp	r3, #19
    1624:	daffff97 	ble	1488 <createdelete+0x164>
  }

  for(i = 0; i < N; i++){
    1628:	e3a03000 	mov	r3, #0
    162c:	e50b3008 	str	r3, [fp, #-8]
    1630:	ea000011 	b	167c <createdelete+0x358>
    name[0] = 'p';
    1634:	e3a03070 	mov	r3, #112	@ 0x70
    1638:	e54b3030 	strb	r3, [fp, #-48]	@ 0xffffffd0
    name[1] = '0' + i;
    163c:	e51b3008 	ldr	r3, [fp, #-8]
    1640:	e6ef3073 	uxtb	r3, r3
    1644:	e2833030 	add	r3, r3, #48	@ 0x30
    1648:	e6ef3073 	uxtb	r3, r3
    164c:	e54b302f 	strb	r3, [fp, #-47]	@ 0xffffffd1
    unlink(name);
    1650:	e24b3030 	sub	r3, fp, #48	@ 0x30
    1654:	e1a00003 	mov	r0, r3
    1658:	eb000d5e 	bl	4bd8 <unlink>
    name[0] = 'c';
    165c:	e3a03063 	mov	r3, #99	@ 0x63
    1660:	e54b3030 	strb	r3, [fp, #-48]	@ 0xffffffd0
    unlink(name);
    1664:	e24b3030 	sub	r3, fp, #48	@ 0x30
    1668:	e1a00003 	mov	r0, r3
    166c:	eb000d59 	bl	4bd8 <unlink>
  for(i = 0; i < N; i++){
    1670:	e51b3008 	ldr	r3, [fp, #-8]
    1674:	e2833001 	add	r3, r3, #1
    1678:	e50b3008 	str	r3, [fp, #-8]
    167c:	e51b3008 	ldr	r3, [fp, #-8]
    1680:	e3530013 	cmp	r3, #19
    1684:	daffffea 	ble	1634 <createdelete+0x310>
  }

  printf(1, "createdelete ok\n");
    1688:	e3051bfc 	movw	r1, #23548	@ 0x5bfc
    168c:	e3401000 	movt	r1, #0
    1690:	e3a00001 	mov	r0, #1
    1694:	eb000e5e 	bl	5014 <printf>
}
    1698:	e320f000 	nop	{0}
    169c:	e24bd004 	sub	sp, fp, #4
    16a0:	e8bd8800 	pop	{fp, pc}

000016a4 <unlinkread>:

// can I unlink a file and still read it?
void
unlinkread(void)
{
    16a4:	e92d4800 	push	{fp, lr}
    16a8:	e28db004 	add	fp, sp, #4
    16ac:	e24dd008 	sub	sp, sp, #8
  int fd, fd1;

  printf(1, "unlinkread test\n");
    16b0:	e3051c10 	movw	r1, #23568	@ 0x5c10
    16b4:	e3401000 	movt	r1, #0
    16b8:	e3a00001 	mov	r0, #1
    16bc:	eb000e54 	bl	5014 <printf>
  fd = open("unlinkread", O_CREATE | O_RDWR);
    16c0:	e3001202 	movw	r1, #514	@ 0x202
    16c4:	e3050c24 	movw	r0, #23588	@ 0x5c24
    16c8:	e3400000 	movt	r0, #0
    16cc:	eb000d27 	bl	4b70 <open>
    16d0:	e50b0008 	str	r0, [fp, #-8]
  if(fd < 0){
    16d4:	e51b3008 	ldr	r3, [fp, #-8]
    16d8:	e3530000 	cmp	r3, #0
    16dc:	aa000004 	bge	16f4 <unlinkread+0x50>
    printf(1, "create unlinkread failed\n");
    16e0:	e3051c30 	movw	r1, #23600	@ 0x5c30
    16e4:	e3401000 	movt	r1, #0
    16e8:	e3a00001 	mov	r0, #1
    16ec:	eb000e48 	bl	5014 <printf>
    exit();
    16f0:	eb000cb6 	bl	49d0 <exit>
  }
  write(fd, "hello", 5);
    16f4:	e3a02005 	mov	r2, #5
    16f8:	e3051c4c 	movw	r1, #23628	@ 0x5c4c
    16fc:	e3401000 	movt	r1, #0
    1700:	e51b0008 	ldr	r0, [fp, #-8]
    1704:	eb000ce5 	bl	4aa0 <write>
  close(fd);
    1708:	e51b0008 	ldr	r0, [fp, #-8]
    170c:	eb000cf0 	bl	4ad4 <close>

  fd = open("unlinkread", O_RDWR);
    1710:	e3a01002 	mov	r1, #2
    1714:	e3050c24 	movw	r0, #23588	@ 0x5c24
    1718:	e3400000 	movt	r0, #0
    171c:	eb000d13 	bl	4b70 <open>
    1720:	e50b0008 	str	r0, [fp, #-8]
  if(fd < 0){
    1724:	e51b3008 	ldr	r3, [fp, #-8]
    1728:	e3530000 	cmp	r3, #0
    172c:	aa000004 	bge	1744 <unlinkread+0xa0>
    printf(1, "open unlinkread failed\n");
    1730:	e3051c54 	movw	r1, #23636	@ 0x5c54
    1734:	e3401000 	movt	r1, #0
    1738:	e3a00001 	mov	r0, #1
    173c:	eb000e34 	bl	5014 <printf>
    exit();
    1740:	eb000ca2 	bl	49d0 <exit>
  }
  if(unlink("unlinkread") != 0){
    1744:	e3050c24 	movw	r0, #23588	@ 0x5c24
    1748:	e3400000 	movt	r0, #0
    174c:	eb000d21 	bl	4bd8 <unlink>
    1750:	e1a03000 	mov	r3, r0
    1754:	e3530000 	cmp	r3, #0
    1758:	0a000004 	beq	1770 <unlinkread+0xcc>
    printf(1, "unlink unlinkread failed\n");
    175c:	e3051c6c 	movw	r1, #23660	@ 0x5c6c
    1760:	e3401000 	movt	r1, #0
    1764:	e3a00001 	mov	r0, #1
    1768:	eb000e29 	bl	5014 <printf>
    exit();
    176c:	eb000c97 	bl	49d0 <exit>
  }

  fd1 = open("unlinkread", O_CREATE | O_RDWR);
    1770:	e3001202 	movw	r1, #514	@ 0x202
    1774:	e3050c24 	movw	r0, #23588	@ 0x5c24
    1778:	e3400000 	movt	r0, #0
    177c:	eb000cfb 	bl	4b70 <open>
    1780:	e50b000c 	str	r0, [fp, #-12]
  write(fd1, "yyy", 3);
    1784:	e3a02003 	mov	r2, #3
    1788:	e3051c88 	movw	r1, #23688	@ 0x5c88
    178c:	e3401000 	movt	r1, #0
    1790:	e51b000c 	ldr	r0, [fp, #-12]
    1794:	eb000cc1 	bl	4aa0 <write>
  close(fd1);
    1798:	e51b000c 	ldr	r0, [fp, #-12]
    179c:	eb000ccc 	bl	4ad4 <close>

  if(read(fd, buf, sizeof(buf)) != 5){
    17a0:	e3a02a02 	mov	r2, #8192	@ 0x2000
    17a4:	e3071080 	movw	r1, #28800	@ 0x7080
    17a8:	e3401000 	movt	r1, #0
    17ac:	e51b0008 	ldr	r0, [fp, #-8]
    17b0:	eb000cad 	bl	4a6c <read>
    17b4:	e1a03000 	mov	r3, r0
    17b8:	e3530005 	cmp	r3, #5
    17bc:	0a000004 	beq	17d4 <unlinkread+0x130>
    printf(1, "unlinkread read failed");
    17c0:	e3051c8c 	movw	r1, #23692	@ 0x5c8c
    17c4:	e3401000 	movt	r1, #0
    17c8:	e3a00001 	mov	r0, #1
    17cc:	eb000e10 	bl	5014 <printf>
    exit();
    17d0:	eb000c7e 	bl	49d0 <exit>
  }
  if(buf[0] != 'h'){
    17d4:	e3073080 	movw	r3, #28800	@ 0x7080
    17d8:	e3403000 	movt	r3, #0
    17dc:	e5d33000 	ldrb	r3, [r3]
    17e0:	e3530068 	cmp	r3, #104	@ 0x68
    17e4:	0a000004 	beq	17fc <unlinkread+0x158>
    printf(1, "unlinkread wrong data\n");
    17e8:	e3051ca4 	movw	r1, #23716	@ 0x5ca4
    17ec:	e3401000 	movt	r1, #0
    17f0:	e3a00001 	mov	r0, #1
    17f4:	eb000e06 	bl	5014 <printf>
    exit();
    17f8:	eb000c74 	bl	49d0 <exit>
  }
  if(write(fd, buf, 10) != 10){
    17fc:	e3a0200a 	mov	r2, #10
    1800:	e3071080 	movw	r1, #28800	@ 0x7080
    1804:	e3401000 	movt	r1, #0
    1808:	e51b0008 	ldr	r0, [fp, #-8]
    180c:	eb000ca3 	bl	4aa0 <write>
    1810:	e1a03000 	mov	r3, r0
    1814:	e353000a 	cmp	r3, #10
    1818:	0a000004 	beq	1830 <unlinkread+0x18c>
    printf(1, "unlinkread write failed\n");
    181c:	e3051cbc 	movw	r1, #23740	@ 0x5cbc
    1820:	e3401000 	movt	r1, #0
    1824:	e3a00001 	mov	r0, #1
    1828:	eb000df9 	bl	5014 <printf>
    exit();
    182c:	eb000c67 	bl	49d0 <exit>
  }
  close(fd);
    1830:	e51b0008 	ldr	r0, [fp, #-8]
    1834:	eb000ca6 	bl	4ad4 <close>
  unlink("unlinkread");
    1838:	e3050c24 	movw	r0, #23588	@ 0x5c24
    183c:	e3400000 	movt	r0, #0
    1840:	eb000ce4 	bl	4bd8 <unlink>
  printf(1, "unlinkread ok\n");
    1844:	e3051cd8 	movw	r1, #23768	@ 0x5cd8
    1848:	e3401000 	movt	r1, #0
    184c:	e3a00001 	mov	r0, #1
    1850:	eb000def 	bl	5014 <printf>
}
    1854:	e320f000 	nop	{0}
    1858:	e24bd004 	sub	sp, fp, #4
    185c:	e8bd8800 	pop	{fp, pc}

00001860 <linktest>:

void
linktest(void)
{
    1860:	e92d4800 	push	{fp, lr}
    1864:	e28db004 	add	fp, sp, #4
    1868:	e24dd008 	sub	sp, sp, #8
  int fd;

  printf(1, "linktest\n");
    186c:	e3051ce8 	movw	r1, #23784	@ 0x5ce8
    1870:	e3401000 	movt	r1, #0
    1874:	e3a00001 	mov	r0, #1
    1878:	eb000de5 	bl	5014 <printf>

  unlink("lf1");
    187c:	e3050cf4 	movw	r0, #23796	@ 0x5cf4
    1880:	e3400000 	movt	r0, #0
    1884:	eb000cd3 	bl	4bd8 <unlink>
  unlink("lf2");
    1888:	e3050cf8 	movw	r0, #23800	@ 0x5cf8
    188c:	e3400000 	movt	r0, #0
    1890:	eb000cd0 	bl	4bd8 <unlink>

  fd = open("lf1", O_CREATE|O_RDWR);
    1894:	e3001202 	movw	r1, #514	@ 0x202
    1898:	e3050cf4 	movw	r0, #23796	@ 0x5cf4
    189c:	e3400000 	movt	r0, #0
    18a0:	eb000cb2 	bl	4b70 <open>
    18a4:	e50b0008 	str	r0, [fp, #-8]
  if(fd < 0){
    18a8:	e51b3008 	ldr	r3, [fp, #-8]
    18ac:	e3530000 	cmp	r3, #0
    18b0:	aa000004 	bge	18c8 <linktest+0x68>
    printf(1, "create lf1 failed\n");
    18b4:	e3051cfc 	movw	r1, #23804	@ 0x5cfc
    18b8:	e3401000 	movt	r1, #0
    18bc:	e3a00001 	mov	r0, #1
    18c0:	eb000dd3 	bl	5014 <printf>
    exit();
    18c4:	eb000c41 	bl	49d0 <exit>
  }
  if(write(fd, "hello", 5) != 5){
    18c8:	e3a02005 	mov	r2, #5
    18cc:	e3051c4c 	movw	r1, #23628	@ 0x5c4c
    18d0:	e3401000 	movt	r1, #0
    18d4:	e51b0008 	ldr	r0, [fp, #-8]
    18d8:	eb000c70 	bl	4aa0 <write>
    18dc:	e1a03000 	mov	r3, r0
    18e0:	e3530005 	cmp	r3, #5
    18e4:	0a000004 	beq	18fc <linktest+0x9c>
    printf(1, "write lf1 failed\n");
    18e8:	e3051d10 	movw	r1, #23824	@ 0x5d10
    18ec:	e3401000 	movt	r1, #0
    18f0:	e3a00001 	mov	r0, #1
    18f4:	eb000dc6 	bl	5014 <printf>
    exit();
    18f8:	eb000c34 	bl	49d0 <exit>
  }
  close(fd);
    18fc:	e51b0008 	ldr	r0, [fp, #-8]
    1900:	eb000c73 	bl	4ad4 <close>

  if(link("lf1", "lf2") < 0){
    1904:	e3051cf8 	movw	r1, #23800	@ 0x5cf8
    1908:	e3401000 	movt	r1, #0
    190c:	e3050cf4 	movw	r0, #23796	@ 0x5cf4
    1910:	e3400000 	movt	r0, #0
    1914:	eb000cc9 	bl	4c40 <link>
    1918:	e1a03000 	mov	r3, r0
    191c:	e3530000 	cmp	r3, #0
    1920:	aa000004 	bge	1938 <linktest+0xd8>
    printf(1, "link lf1 lf2 failed\n");
    1924:	e3051d24 	movw	r1, #23844	@ 0x5d24
    1928:	e3401000 	movt	r1, #0
    192c:	e3a00001 	mov	r0, #1
    1930:	eb000db7 	bl	5014 <printf>
    exit();
    1934:	eb000c25 	bl	49d0 <exit>
  }
  unlink("lf1");
    1938:	e3050cf4 	movw	r0, #23796	@ 0x5cf4
    193c:	e3400000 	movt	r0, #0
    1940:	eb000ca4 	bl	4bd8 <unlink>

  if(open("lf1", 0) >= 0){
    1944:	e3a01000 	mov	r1, #0
    1948:	e3050cf4 	movw	r0, #23796	@ 0x5cf4
    194c:	e3400000 	movt	r0, #0
    1950:	eb000c86 	bl	4b70 <open>
    1954:	e1a03000 	mov	r3, r0
    1958:	e3530000 	cmp	r3, #0
    195c:	ba000004 	blt	1974 <linktest+0x114>
    printf(1, "unlinked lf1 but it is still there!\n");
    1960:	e3051d3c 	movw	r1, #23868	@ 0x5d3c
    1964:	e3401000 	movt	r1, #0
    1968:	e3a00001 	mov	r0, #1
    196c:	eb000da8 	bl	5014 <printf>
    exit();
    1970:	eb000c16 	bl	49d0 <exit>
  }

  fd = open("lf2", 0);
    1974:	e3a01000 	mov	r1, #0
    1978:	e3050cf8 	movw	r0, #23800	@ 0x5cf8
    197c:	e3400000 	movt	r0, #0
    1980:	eb000c7a 	bl	4b70 <open>
    1984:	e50b0008 	str	r0, [fp, #-8]
  if(fd < 0){
    1988:	e51b3008 	ldr	r3, [fp, #-8]
    198c:	e3530000 	cmp	r3, #0
    1990:	aa000004 	bge	19a8 <linktest+0x148>
    printf(1, "open lf2 failed\n");
    1994:	e3051d64 	movw	r1, #23908	@ 0x5d64
    1998:	e3401000 	movt	r1, #0
    199c:	e3a00001 	mov	r0, #1
    19a0:	eb000d9b 	bl	5014 <printf>
    exit();
    19a4:	eb000c09 	bl	49d0 <exit>
  }
  if(read(fd, buf, sizeof(buf)) != 5){
    19a8:	e3a02a02 	mov	r2, #8192	@ 0x2000
    19ac:	e3071080 	movw	r1, #28800	@ 0x7080
    19b0:	e3401000 	movt	r1, #0
    19b4:	e51b0008 	ldr	r0, [fp, #-8]
    19b8:	eb000c2b 	bl	4a6c <read>
    19bc:	e1a03000 	mov	r3, r0
    19c0:	e3530005 	cmp	r3, #5
    19c4:	0a000004 	beq	19dc <linktest+0x17c>
    printf(1, "read lf2 failed\n");
    19c8:	e3051d78 	movw	r1, #23928	@ 0x5d78
    19cc:	e3401000 	movt	r1, #0
    19d0:	e3a00001 	mov	r0, #1
    19d4:	eb000d8e 	bl	5014 <printf>
    exit();
    19d8:	eb000bfc 	bl	49d0 <exit>
  }
  close(fd);
    19dc:	e51b0008 	ldr	r0, [fp, #-8]
    19e0:	eb000c3b 	bl	4ad4 <close>

  if(link("lf2", "lf2") >= 0){
    19e4:	e3051cf8 	movw	r1, #23800	@ 0x5cf8
    19e8:	e3401000 	movt	r1, #0
    19ec:	e3050cf8 	movw	r0, #23800	@ 0x5cf8
    19f0:	e3400000 	movt	r0, #0
    19f4:	eb000c91 	bl	4c40 <link>
    19f8:	e1a03000 	mov	r3, r0
    19fc:	e3530000 	cmp	r3, #0
    1a00:	ba000004 	blt	1a18 <linktest+0x1b8>
    printf(1, "link lf2 lf2 succeeded! oops\n");
    1a04:	e3051d8c 	movw	r1, #23948	@ 0x5d8c
    1a08:	e3401000 	movt	r1, #0
    1a0c:	e3a00001 	mov	r0, #1
    1a10:	eb000d7f 	bl	5014 <printf>
    exit();
    1a14:	eb000bed 	bl	49d0 <exit>
  }

  unlink("lf2");
    1a18:	e3050cf8 	movw	r0, #23800	@ 0x5cf8
    1a1c:	e3400000 	movt	r0, #0
    1a20:	eb000c6c 	bl	4bd8 <unlink>
  if(link("lf2", "lf1") >= 0){
    1a24:	e3051cf4 	movw	r1, #23796	@ 0x5cf4
    1a28:	e3401000 	movt	r1, #0
    1a2c:	e3050cf8 	movw	r0, #23800	@ 0x5cf8
    1a30:	e3400000 	movt	r0, #0
    1a34:	eb000c81 	bl	4c40 <link>
    1a38:	e1a03000 	mov	r3, r0
    1a3c:	e3530000 	cmp	r3, #0
    1a40:	ba000004 	blt	1a58 <linktest+0x1f8>
    printf(1, "link non-existant succeeded! oops\n");
    1a44:	e3051dac 	movw	r1, #23980	@ 0x5dac
    1a48:	e3401000 	movt	r1, #0
    1a4c:	e3a00001 	mov	r0, #1
    1a50:	eb000d6f 	bl	5014 <printf>
    exit();
    1a54:	eb000bdd 	bl	49d0 <exit>
  }

  if(link(".", "lf1") >= 0){
    1a58:	e3051cf4 	movw	r1, #23796	@ 0x5cf4
    1a5c:	e3401000 	movt	r1, #0
    1a60:	e3050dd0 	movw	r0, #24016	@ 0x5dd0
    1a64:	e3400000 	movt	r0, #0
    1a68:	eb000c74 	bl	4c40 <link>
    1a6c:	e1a03000 	mov	r3, r0
    1a70:	e3530000 	cmp	r3, #0
    1a74:	ba000004 	blt	1a8c <linktest+0x22c>
    printf(1, "link . lf1 succeeded! oops\n");
    1a78:	e3051dd4 	movw	r1, #24020	@ 0x5dd4
    1a7c:	e3401000 	movt	r1, #0
    1a80:	e3a00001 	mov	r0, #1
    1a84:	eb000d62 	bl	5014 <printf>
    exit();
    1a88:	eb000bd0 	bl	49d0 <exit>
  }

  printf(1, "linktest ok\n");
    1a8c:	e3051df0 	movw	r1, #24048	@ 0x5df0
    1a90:	e3401000 	movt	r1, #0
    1a94:	e3a00001 	mov	r0, #1
    1a98:	eb000d5d 	bl	5014 <printf>
}
    1a9c:	e320f000 	nop	{0}
    1aa0:	e24bd004 	sub	sp, fp, #4
    1aa4:	e8bd8800 	pop	{fp, pc}

00001aa8 <concreate>:

// test concurrent create/link/unlink of the same file
void
concreate(void)
{
    1aa8:	e92d4800 	push	{fp, lr}
    1aac:	e28db004 	add	fp, sp, #4
    1ab0:	e24dd050 	sub	sp, sp, #80	@ 0x50
  struct {
    ushort inum;
    char name[14];
  } de;

  printf(1, "concreate test\n");
    1ab4:	e3051e00 	movw	r1, #24064	@ 0x5e00
    1ab8:	e3401000 	movt	r1, #0
    1abc:	e3a00001 	mov	r0, #1
    1ac0:	eb000d53 	bl	5014 <printf>
  file[0] = 'C';
    1ac4:	e3a03043 	mov	r3, #67	@ 0x43
    1ac8:	e54b3018 	strb	r3, [fp, #-24]	@ 0xffffffe8
  file[2] = '\0';
    1acc:	e3a03000 	mov	r3, #0
    1ad0:	e54b3016 	strb	r3, [fp, #-22]	@ 0xffffffea
  for(i = 0; i < 40; i++){
    1ad4:	e3a03000 	mov	r3, #0
    1ad8:	e50b3008 	str	r3, [fp, #-8]
    1adc:	ea00004d 	b	1c18 <concreate+0x170>
    file[1] = '0' + i;
    1ae0:	e51b3008 	ldr	r3, [fp, #-8]
    1ae4:	e6ef3073 	uxtb	r3, r3
    1ae8:	e2833030 	add	r3, r3, #48	@ 0x30
    1aec:	e6ef3073 	uxtb	r3, r3
    1af0:	e54b3017 	strb	r3, [fp, #-23]	@ 0xffffffe9
    unlink(file);
    1af4:	e24b3018 	sub	r3, fp, #24
    1af8:	e1a00003 	mov	r0, r3
    1afc:	eb000c35 	bl	4bd8 <unlink>
    pid = fork();
    1b00:	eb000ba5 	bl	499c <fork>
    1b04:	e50b0014 	str	r0, [fp, #-20]	@ 0xffffffec
    if(pid && (i % 3) == 1){
    1b08:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
    1b0c:	e3530000 	cmp	r3, #0
    1b10:	0a000011 	beq	1b5c <concreate+0xb4>
    1b14:	e51b1008 	ldr	r1, [fp, #-8]
    1b18:	e3053556 	movw	r3, #21846	@ 0x5556
    1b1c:	e3453555 	movt	r3, #21845	@ 0x5555
    1b20:	e0c23193 	smull	r3, r2, r3, r1
    1b24:	e1a03fc1 	asr	r3, r1, #31
    1b28:	e0422003 	sub	r2, r2, r3
    1b2c:	e1a03002 	mov	r3, r2
    1b30:	e1a03083 	lsl	r3, r3, #1
    1b34:	e0833002 	add	r3, r3, r2
    1b38:	e0412003 	sub	r2, r1, r3
    1b3c:	e3520001 	cmp	r2, #1
    1b40:	1a000005 	bne	1b5c <concreate+0xb4>
      link("C0", file);
    1b44:	e24b3018 	sub	r3, fp, #24
    1b48:	e1a01003 	mov	r1, r3
    1b4c:	e3050e10 	movw	r0, #24080	@ 0x5e10
    1b50:	e3400000 	movt	r0, #0
    1b54:	eb000c39 	bl	4c40 <link>
    1b58:	ea000026 	b	1bf8 <concreate+0x150>
    } else if(pid == 0 && (i % 5) == 1){
    1b5c:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
    1b60:	e3530000 	cmp	r3, #0
    1b64:	1a000012 	bne	1bb4 <concreate+0x10c>
    1b68:	e51b1008 	ldr	r1, [fp, #-8]
    1b6c:	e3063667 	movw	r3, #26215	@ 0x6667
    1b70:	e3463666 	movt	r3, #26214	@ 0x6666
    1b74:	e0c32193 	smull	r2, r3, r3, r1
    1b78:	e1a020c3 	asr	r2, r3, #1
    1b7c:	e1a03fc1 	asr	r3, r1, #31
    1b80:	e0422003 	sub	r2, r2, r3
    1b84:	e1a03002 	mov	r3, r2
    1b88:	e1a03103 	lsl	r3, r3, #2
    1b8c:	e0833002 	add	r3, r3, r2
    1b90:	e0412003 	sub	r2, r1, r3
    1b94:	e3520001 	cmp	r2, #1
    1b98:	1a000005 	bne	1bb4 <concreate+0x10c>
      link("C0", file);
    1b9c:	e24b3018 	sub	r3, fp, #24
    1ba0:	e1a01003 	mov	r1, r3
    1ba4:	e3050e10 	movw	r0, #24080	@ 0x5e10
    1ba8:	e3400000 	movt	r0, #0
    1bac:	eb000c23 	bl	4c40 <link>
    1bb0:	ea000010 	b	1bf8 <concreate+0x150>
    } else {
      fd = open(file, O_CREATE | O_RDWR);
    1bb4:	e24b3018 	sub	r3, fp, #24
    1bb8:	e3001202 	movw	r1, #514	@ 0x202
    1bbc:	e1a00003 	mov	r0, r3
    1bc0:	eb000bea 	bl	4b70 <open>
    1bc4:	e50b0010 	str	r0, [fp, #-16]
      if(fd < 0){
    1bc8:	e51b3010 	ldr	r3, [fp, #-16]
    1bcc:	e3530000 	cmp	r3, #0
    1bd0:	aa000006 	bge	1bf0 <concreate+0x148>
        printf(1, "concreate create %s failed\n", file);
    1bd4:	e24b3018 	sub	r3, fp, #24
    1bd8:	e1a02003 	mov	r2, r3
    1bdc:	e3051e14 	movw	r1, #24084	@ 0x5e14
    1be0:	e3401000 	movt	r1, #0
    1be4:	e3a00001 	mov	r0, #1
    1be8:	eb000d09 	bl	5014 <printf>
        exit();
    1bec:	eb000b77 	bl	49d0 <exit>
      }
      close(fd);
    1bf0:	e51b0010 	ldr	r0, [fp, #-16]
    1bf4:	eb000bb6 	bl	4ad4 <close>
    }
    if(pid == 0)
    1bf8:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
    1bfc:	e3530000 	cmp	r3, #0
    1c00:	1a000000 	bne	1c08 <concreate+0x160>
      exit();
    1c04:	eb000b71 	bl	49d0 <exit>
    else
      wait();
    1c08:	eb000b7d 	bl	4a04 <wait>
  for(i = 0; i < 40; i++){
    1c0c:	e51b3008 	ldr	r3, [fp, #-8]
    1c10:	e2833001 	add	r3, r3, #1
    1c14:	e50b3008 	str	r3, [fp, #-8]
    1c18:	e51b3008 	ldr	r3, [fp, #-8]
    1c1c:	e3530027 	cmp	r3, #39	@ 0x27
    1c20:	daffffae 	ble	1ae0 <concreate+0x38>
  }

  memset(fa, 0, sizeof(fa));
    1c24:	e24b3040 	sub	r3, fp, #64	@ 0x40
    1c28:	e3a02028 	mov	r2, #40	@ 0x28
    1c2c:	e3a01000 	mov	r1, #0
    1c30:	e1a00003 	mov	r0, r3
    1c34:	eb000aa1 	bl	46c0 <memset>
  fd = open(".", 0);
    1c38:	e3a01000 	mov	r1, #0
    1c3c:	e3050dd0 	movw	r0, #24016	@ 0x5dd0
    1c40:	e3400000 	movt	r0, #0
    1c44:	eb000bc9 	bl	4b70 <open>
    1c48:	e50b0010 	str	r0, [fp, #-16]
  n = 0;
    1c4c:	e3a03000 	mov	r3, #0
    1c50:	e50b300c 	str	r3, [fp, #-12]
  while(read(fd, &de, sizeof(de)) > 0){
    1c54:	ea000031 	b	1d20 <concreate+0x278>
    if(de.inum == 0)
    1c58:	e15b35b0 	ldrh	r3, [fp, #-80]	@ 0xffffffb0
    1c5c:	e3530000 	cmp	r3, #0
    1c60:	0a00002d 	beq	1d1c <concreate+0x274>
      continue;
    if(de.name[0] == 'C' && de.name[2] == '\0'){
    1c64:	e55b304e 	ldrb	r3, [fp, #-78]	@ 0xffffffb2
    1c68:	e3530043 	cmp	r3, #67	@ 0x43
    1c6c:	1a00002b 	bne	1d20 <concreate+0x278>
    1c70:	e55b304c 	ldrb	r3, [fp, #-76]	@ 0xffffffb4
    1c74:	e3530000 	cmp	r3, #0
    1c78:	1a000028 	bne	1d20 <concreate+0x278>
      i = de.name[1] - '0';
    1c7c:	e55b304d 	ldrb	r3, [fp, #-77]	@ 0xffffffb3
    1c80:	e2433030 	sub	r3, r3, #48	@ 0x30
    1c84:	e50b3008 	str	r3, [fp, #-8]
      if(i < 0 || i >= sizeof(fa)){
    1c88:	e51b3008 	ldr	r3, [fp, #-8]
    1c8c:	e3530000 	cmp	r3, #0
    1c90:	ba000002 	blt	1ca0 <concreate+0x1f8>
    1c94:	e51b3008 	ldr	r3, [fp, #-8]
    1c98:	e3530027 	cmp	r3, #39	@ 0x27
    1c9c:	9a000007 	bls	1cc0 <concreate+0x218>
        printf(1, "concreate weird file %s\n", de.name);
    1ca0:	e24b3050 	sub	r3, fp, #80	@ 0x50
    1ca4:	e2833002 	add	r3, r3, #2
    1ca8:	e1a02003 	mov	r2, r3
    1cac:	e3051e30 	movw	r1, #24112	@ 0x5e30
    1cb0:	e3401000 	movt	r1, #0
    1cb4:	e3a00001 	mov	r0, #1
    1cb8:	eb000cd5 	bl	5014 <printf>
        exit();
    1cbc:	eb000b43 	bl	49d0 <exit>
      }
      if(fa[i]){
    1cc0:	e24b2040 	sub	r2, fp, #64	@ 0x40
    1cc4:	e51b3008 	ldr	r3, [fp, #-8]
    1cc8:	e0823003 	add	r3, r2, r3
    1ccc:	e5d33000 	ldrb	r3, [r3]
    1cd0:	e3530000 	cmp	r3, #0
    1cd4:	0a000007 	beq	1cf8 <concreate+0x250>
        printf(1, "concreate duplicate file %s\n", de.name);
    1cd8:	e24b3050 	sub	r3, fp, #80	@ 0x50
    1cdc:	e2833002 	add	r3, r3, #2
    1ce0:	e1a02003 	mov	r2, r3
    1ce4:	e3051e4c 	movw	r1, #24140	@ 0x5e4c
    1ce8:	e3401000 	movt	r1, #0
    1cec:	e3a00001 	mov	r0, #1
    1cf0:	eb000cc7 	bl	5014 <printf>
        exit();
    1cf4:	eb000b35 	bl	49d0 <exit>
      }
      fa[i] = 1;
    1cf8:	e24b2040 	sub	r2, fp, #64	@ 0x40
    1cfc:	e51b3008 	ldr	r3, [fp, #-8]
    1d00:	e0823003 	add	r3, r2, r3
    1d04:	e3a02001 	mov	r2, #1
    1d08:	e5c32000 	strb	r2, [r3]
      n++;
    1d0c:	e51b300c 	ldr	r3, [fp, #-12]
    1d10:	e2833001 	add	r3, r3, #1
    1d14:	e50b300c 	str	r3, [fp, #-12]
    1d18:	ea000000 	b	1d20 <concreate+0x278>
      continue;
    1d1c:	e320f000 	nop	{0}
  while(read(fd, &de, sizeof(de)) > 0){
    1d20:	e24b3050 	sub	r3, fp, #80	@ 0x50
    1d24:	e3a02010 	mov	r2, #16
    1d28:	e1a01003 	mov	r1, r3
    1d2c:	e51b0010 	ldr	r0, [fp, #-16]
    1d30:	eb000b4d 	bl	4a6c <read>
    1d34:	e1a03000 	mov	r3, r0
    1d38:	e3530000 	cmp	r3, #0
    1d3c:	caffffc5 	bgt	1c58 <concreate+0x1b0>
    }
  }
  close(fd);
    1d40:	e51b0010 	ldr	r0, [fp, #-16]
    1d44:	eb000b62 	bl	4ad4 <close>

  if(n != 40){
    1d48:	e51b300c 	ldr	r3, [fp, #-12]
    1d4c:	e3530028 	cmp	r3, #40	@ 0x28
    1d50:	0a000004 	beq	1d68 <concreate+0x2c0>
    printf(1, "concreate not enough files in directory listing\n");
    1d54:	e3051e6c 	movw	r1, #24172	@ 0x5e6c
    1d58:	e3401000 	movt	r1, #0
    1d5c:	e3a00001 	mov	r0, #1
    1d60:	eb000cab 	bl	5014 <printf>
    exit();
    1d64:	eb000b19 	bl	49d0 <exit>
  }

  for(i = 0; i < 40; i++){
    1d68:	e3a03000 	mov	r3, #0
    1d6c:	e50b3008 	str	r3, [fp, #-8]
    1d70:	ea00005d 	b	1eec <concreate+0x444>
    file[1] = '0' + i;
    1d74:	e51b3008 	ldr	r3, [fp, #-8]
    1d78:	e6ef3073 	uxtb	r3, r3
    1d7c:	e2833030 	add	r3, r3, #48	@ 0x30
    1d80:	e6ef3073 	uxtb	r3, r3
    1d84:	e54b3017 	strb	r3, [fp, #-23]	@ 0xffffffe9
    pid = fork();
    1d88:	eb000b03 	bl	499c <fork>
    1d8c:	e50b0014 	str	r0, [fp, #-20]	@ 0xffffffec
    if(pid < 0){
    1d90:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
    1d94:	e3530000 	cmp	r3, #0
    1d98:	aa000004 	bge	1db0 <concreate+0x308>
      printf(1, "fork failed\n");
    1d9c:	e3051a0c 	movw	r1, #23052	@ 0x5a0c
    1da0:	e3401000 	movt	r1, #0
    1da4:	e3a00001 	mov	r0, #1
    1da8:	eb000c99 	bl	5014 <printf>
      exit();
    1dac:	eb000b07 	bl	49d0 <exit>
    }
    if(((i % 3) == 0 && pid == 0) ||
    1db0:	e51b1008 	ldr	r1, [fp, #-8]
    1db4:	e3053556 	movw	r3, #21846	@ 0x5556
    1db8:	e3453555 	movt	r3, #21845	@ 0x5555
    1dbc:	e0c23193 	smull	r3, r2, r3, r1
    1dc0:	e1a03fc1 	asr	r3, r1, #31
    1dc4:	e0422003 	sub	r2, r2, r3
    1dc8:	e1a03002 	mov	r3, r2
    1dcc:	e1a03083 	lsl	r3, r3, #1
    1dd0:	e0833002 	add	r3, r3, r2
    1dd4:	e0412003 	sub	r2, r1, r3
    1dd8:	e3520000 	cmp	r2, #0
    1ddc:	1a000002 	bne	1dec <concreate+0x344>
    1de0:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
    1de4:	e3530000 	cmp	r3, #0
    1de8:	0a00000e 	beq	1e28 <concreate+0x380>
       ((i % 3) == 1 && pid != 0)){
    1dec:	e51b1008 	ldr	r1, [fp, #-8]
    1df0:	e3053556 	movw	r3, #21846	@ 0x5556
    1df4:	e3453555 	movt	r3, #21845	@ 0x5555
    1df8:	e0c23193 	smull	r3, r2, r3, r1
    1dfc:	e1a03fc1 	asr	r3, r1, #31
    1e00:	e0422003 	sub	r2, r2, r3
    1e04:	e1a03002 	mov	r3, r2
    1e08:	e1a03083 	lsl	r3, r3, #1
    1e0c:	e0833002 	add	r3, r3, r2
    1e10:	e0412003 	sub	r2, r1, r3
    if(((i % 3) == 0 && pid == 0) ||
    1e14:	e3520001 	cmp	r2, #1
    1e18:	1a00001f 	bne	1e9c <concreate+0x3f4>
       ((i % 3) == 1 && pid != 0)){
    1e1c:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
    1e20:	e3530000 	cmp	r3, #0
    1e24:	0a00001c 	beq	1e9c <concreate+0x3f4>
      close(open(file, 0));
    1e28:	e24b3018 	sub	r3, fp, #24
    1e2c:	e3a01000 	mov	r1, #0
    1e30:	e1a00003 	mov	r0, r3
    1e34:	eb000b4d 	bl	4b70 <open>
    1e38:	e1a03000 	mov	r3, r0
    1e3c:	e1a00003 	mov	r0, r3
    1e40:	eb000b23 	bl	4ad4 <close>
      close(open(file, 0));
    1e44:	e24b3018 	sub	r3, fp, #24
    1e48:	e3a01000 	mov	r1, #0
    1e4c:	e1a00003 	mov	r0, r3
    1e50:	eb000b46 	bl	4b70 <open>
    1e54:	e1a03000 	mov	r3, r0
    1e58:	e1a00003 	mov	r0, r3
    1e5c:	eb000b1c 	bl	4ad4 <close>
      close(open(file, 0));
    1e60:	e24b3018 	sub	r3, fp, #24
    1e64:	e3a01000 	mov	r1, #0
    1e68:	e1a00003 	mov	r0, r3
    1e6c:	eb000b3f 	bl	4b70 <open>
    1e70:	e1a03000 	mov	r3, r0
    1e74:	e1a00003 	mov	r0, r3
    1e78:	eb000b15 	bl	4ad4 <close>
      close(open(file, 0));
    1e7c:	e24b3018 	sub	r3, fp, #24
    1e80:	e3a01000 	mov	r1, #0
    1e84:	e1a00003 	mov	r0, r3
    1e88:	eb000b38 	bl	4b70 <open>
    1e8c:	e1a03000 	mov	r3, r0
    1e90:	e1a00003 	mov	r0, r3
    1e94:	eb000b0e 	bl	4ad4 <close>
    1e98:	ea00000b 	b	1ecc <concreate+0x424>
    } else {
      unlink(file);
    1e9c:	e24b3018 	sub	r3, fp, #24
    1ea0:	e1a00003 	mov	r0, r3
    1ea4:	eb000b4b 	bl	4bd8 <unlink>
      unlink(file);
    1ea8:	e24b3018 	sub	r3, fp, #24
    1eac:	e1a00003 	mov	r0, r3
    1eb0:	eb000b48 	bl	4bd8 <unlink>
      unlink(file);
    1eb4:	e24b3018 	sub	r3, fp, #24
    1eb8:	e1a00003 	mov	r0, r3
    1ebc:	eb000b45 	bl	4bd8 <unlink>
      unlink(file);
    1ec0:	e24b3018 	sub	r3, fp, #24
    1ec4:	e1a00003 	mov	r0, r3
    1ec8:	eb000b42 	bl	4bd8 <unlink>
    }
    if(pid == 0)
    1ecc:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
    1ed0:	e3530000 	cmp	r3, #0
    1ed4:	1a000000 	bne	1edc <concreate+0x434>
      exit();
    1ed8:	eb000abc 	bl	49d0 <exit>
    else
      wait();
    1edc:	eb000ac8 	bl	4a04 <wait>
  for(i = 0; i < 40; i++){
    1ee0:	e51b3008 	ldr	r3, [fp, #-8]
    1ee4:	e2833001 	add	r3, r3, #1
    1ee8:	e50b3008 	str	r3, [fp, #-8]
    1eec:	e51b3008 	ldr	r3, [fp, #-8]
    1ef0:	e3530027 	cmp	r3, #39	@ 0x27
    1ef4:	daffff9e 	ble	1d74 <concreate+0x2cc>
  }

  printf(1, "concreate ok\n");
    1ef8:	e3051ea0 	movw	r1, #24224	@ 0x5ea0
    1efc:	e3401000 	movt	r1, #0
    1f00:	e3a00001 	mov	r0, #1
    1f04:	eb000c42 	bl	5014 <printf>
}
    1f08:	e320f000 	nop	{0}
    1f0c:	e24bd004 	sub	sp, fp, #4
    1f10:	e8bd8800 	pop	{fp, pc}

00001f14 <linkunlink>:

// another concurrent link/unlink/create test,
// to look for deadlocks.
void
linkunlink()
{
    1f14:	e92d4800 	push	{fp, lr}
    1f18:	e28db004 	add	fp, sp, #4
    1f1c:	e24dd010 	sub	sp, sp, #16
  int pid, i;

  printf(1, "linkunlink test\n");
    1f20:	e3051eb0 	movw	r1, #24240	@ 0x5eb0
    1f24:	e3401000 	movt	r1, #0
    1f28:	e3a00001 	mov	r0, #1
    1f2c:	eb000c38 	bl	5014 <printf>

  unlink("x");
    1f30:	e30509bc 	movw	r0, #22972	@ 0x59bc
    1f34:	e3400000 	movt	r0, #0
    1f38:	eb000b26 	bl	4bd8 <unlink>
  pid = fork();
    1f3c:	eb000a96 	bl	499c <fork>
    1f40:	e50b0010 	str	r0, [fp, #-16]
  if(pid < 0){
    1f44:	e51b3010 	ldr	r3, [fp, #-16]
    1f48:	e3530000 	cmp	r3, #0
    1f4c:	aa000004 	bge	1f64 <linkunlink+0x50>
    printf(1, "fork failed\n");
    1f50:	e3051a0c 	movw	r1, #23052	@ 0x5a0c
    1f54:	e3401000 	movt	r1, #0
    1f58:	e3a00001 	mov	r0, #1
    1f5c:	eb000c2c 	bl	5014 <printf>
    exit();
    1f60:	eb000a9a 	bl	49d0 <exit>
  }

  unsigned int x = (pid ? 1 : 97);
    1f64:	e51b3010 	ldr	r3, [fp, #-16]
    1f68:	e3530000 	cmp	r3, #0
    1f6c:	0a000001 	beq	1f78 <linkunlink+0x64>
    1f70:	e3a03001 	mov	r3, #1
    1f74:	ea000000 	b	1f7c <linkunlink+0x68>
    1f78:	e3a03061 	mov	r3, #97	@ 0x61
    1f7c:	e50b300c 	str	r3, [fp, #-12]
  for(i = 0; i < 100; i++){
    1f80:	e3a03000 	mov	r3, #0
    1f84:	e50b3008 	str	r3, [fp, #-8]
    1f88:	ea000030 	b	2050 <linkunlink+0x13c>
    x = x * 1103515245 + 12345;
    1f8c:	e51b200c 	ldr	r2, [fp, #-12]
    1f90:	e3043e6d 	movw	r3, #20077	@ 0x4e6d
    1f94:	e34431c6 	movt	r3, #16838	@ 0x41c6
    1f98:	e0030293 	mul	r3, r3, r2
    1f9c:	e2833a03 	add	r3, r3, #12288	@ 0x3000
    1fa0:	e2833039 	add	r3, r3, #57	@ 0x39
    1fa4:	e50b300c 	str	r3, [fp, #-12]
    if((x % 3) == 0){
    1fa8:	e51b100c 	ldr	r1, [fp, #-12]
    1fac:	e30a3aab 	movw	r3, #43691	@ 0xaaab
    1fb0:	e34a3aaa 	movt	r3, #43690	@ 0xaaaa
    1fb4:	e0832193 	umull	r2, r3, r3, r1
    1fb8:	e1a020a3 	lsr	r2, r3, #1
    1fbc:	e1a03002 	mov	r3, r2
    1fc0:	e1a03083 	lsl	r3, r3, #1
    1fc4:	e0833002 	add	r3, r3, r2
    1fc8:	e0412003 	sub	r2, r1, r3
    1fcc:	e3520000 	cmp	r2, #0
    1fd0:	1a000007 	bne	1ff4 <linkunlink+0xe0>
      close(open("x", O_RDWR | O_CREATE));
    1fd4:	e3001202 	movw	r1, #514	@ 0x202
    1fd8:	e30509bc 	movw	r0, #22972	@ 0x59bc
    1fdc:	e3400000 	movt	r0, #0
    1fe0:	eb000ae2 	bl	4b70 <open>
    1fe4:	e1a03000 	mov	r3, r0
    1fe8:	e1a00003 	mov	r0, r3
    1fec:	eb000ab8 	bl	4ad4 <close>
    1ff0:	ea000013 	b	2044 <linkunlink+0x130>
    } else if((x % 3) == 1){
    1ff4:	e51b100c 	ldr	r1, [fp, #-12]
    1ff8:	e30a3aab 	movw	r3, #43691	@ 0xaaab
    1ffc:	e34a3aaa 	movt	r3, #43690	@ 0xaaaa
    2000:	e0832193 	umull	r2, r3, r3, r1
    2004:	e1a020a3 	lsr	r2, r3, #1
    2008:	e1a03002 	mov	r3, r2
    200c:	e1a03083 	lsl	r3, r3, #1
    2010:	e0833002 	add	r3, r3, r2
    2014:	e0412003 	sub	r2, r1, r3
    2018:	e3520001 	cmp	r2, #1
    201c:	1a000005 	bne	2038 <linkunlink+0x124>
      link("cat", "x");
    2020:	e30519bc 	movw	r1, #22972	@ 0x59bc
    2024:	e3401000 	movt	r1, #0
    2028:	e3050ec4 	movw	r0, #24260	@ 0x5ec4
    202c:	e3400000 	movt	r0, #0
    2030:	eb000b02 	bl	4c40 <link>
    2034:	ea000002 	b	2044 <linkunlink+0x130>
    } else {
      unlink("x");
    2038:	e30509bc 	movw	r0, #22972	@ 0x59bc
    203c:	e3400000 	movt	r0, #0
    2040:	eb000ae4 	bl	4bd8 <unlink>
  for(i = 0; i < 100; i++){
    2044:	e51b3008 	ldr	r3, [fp, #-8]
    2048:	e2833001 	add	r3, r3, #1
    204c:	e50b3008 	str	r3, [fp, #-8]
    2050:	e51b3008 	ldr	r3, [fp, #-8]
    2054:	e3530063 	cmp	r3, #99	@ 0x63
    2058:	daffffcb 	ble	1f8c <linkunlink+0x78>
    }
  }

  if(pid)
    205c:	e51b3010 	ldr	r3, [fp, #-16]
    2060:	e3530000 	cmp	r3, #0
    2064:	0a000001 	beq	2070 <linkunlink+0x15c>
    wait();
    2068:	eb000a65 	bl	4a04 <wait>
    206c:	ea000000 	b	2074 <linkunlink+0x160>
  else 
    exit();
    2070:	eb000a56 	bl	49d0 <exit>

  printf(1, "linkunlink ok\n");
    2074:	e3051ec8 	movw	r1, #24264	@ 0x5ec8
    2078:	e3401000 	movt	r1, #0
    207c:	e3a00001 	mov	r0, #1
    2080:	eb000be3 	bl	5014 <printf>
}
    2084:	e320f000 	nop	{0}
    2088:	e24bd004 	sub	sp, fp, #4
    208c:	e8bd8800 	pop	{fp, pc}

00002090 <bigdir>:

// directory that uses indirect blocks
void
bigdir(void)
{
    2090:	e92d4800 	push	{fp, lr}
    2094:	e28db004 	add	fp, sp, #4
    2098:	e24dd018 	sub	sp, sp, #24
  int i, fd;
  char name[10];

  printf(1, "bigdir test\n");
    209c:	e3051ed8 	movw	r1, #24280	@ 0x5ed8
    20a0:	e3401000 	movt	r1, #0
    20a4:	e3a00001 	mov	r0, #1
    20a8:	eb000bd9 	bl	5014 <printf>
  unlink("bd");
    20ac:	e3050ee8 	movw	r0, #24296	@ 0x5ee8
    20b0:	e3400000 	movt	r0, #0
    20b4:	eb000ac7 	bl	4bd8 <unlink>

  fd = open("bd", O_CREATE);
    20b8:	e3a01c02 	mov	r1, #512	@ 0x200
    20bc:	e3050ee8 	movw	r0, #24296	@ 0x5ee8
    20c0:	e3400000 	movt	r0, #0
    20c4:	eb000aa9 	bl	4b70 <open>
    20c8:	e50b000c 	str	r0, [fp, #-12]
  if(fd < 0){
    20cc:	e51b300c 	ldr	r3, [fp, #-12]
    20d0:	e3530000 	cmp	r3, #0
    20d4:	aa000004 	bge	20ec <bigdir+0x5c>
    printf(1, "bigdir create failed\n");
    20d8:	e3051eec 	movw	r1, #24300	@ 0x5eec
    20dc:	e3401000 	movt	r1, #0
    20e0:	e3a00001 	mov	r0, #1
    20e4:	eb000bca 	bl	5014 <printf>
    exit();
    20e8:	eb000a38 	bl	49d0 <exit>
  }
  close(fd);
    20ec:	e51b000c 	ldr	r0, [fp, #-12]
    20f0:	eb000a77 	bl	4ad4 <close>

  for(i = 0; i < 500; i++){
    20f4:	e3a03000 	mov	r3, #0
    20f8:	e50b3008 	str	r3, [fp, #-8]
    20fc:	ea000026 	b	219c <bigdir+0x10c>
    name[0] = 'x';
    2100:	e3a03078 	mov	r3, #120	@ 0x78
    2104:	e54b3018 	strb	r3, [fp, #-24]	@ 0xffffffe8
    name[1] = '0' + (i / 64);
    2108:	e51b3008 	ldr	r3, [fp, #-8]
    210c:	e283203f 	add	r2, r3, #63	@ 0x3f
    2110:	e3530000 	cmp	r3, #0
    2114:	b1a03002 	movlt	r3, r2
    2118:	a1a03003 	movge	r3, r3
    211c:	e1a03343 	asr	r3, r3, #6
    2120:	e6ef3073 	uxtb	r3, r3
    2124:	e2833030 	add	r3, r3, #48	@ 0x30
    2128:	e6ef3073 	uxtb	r3, r3
    212c:	e54b3017 	strb	r3, [fp, #-23]	@ 0xffffffe9
    name[2] = '0' + (i % 64);
    2130:	e51b3008 	ldr	r3, [fp, #-8]
    2134:	e2732000 	rsbs	r2, r3, #0
    2138:	e203303f 	and	r3, r3, #63	@ 0x3f
    213c:	e202203f 	and	r2, r2, #63	@ 0x3f
    2140:	52623000 	rsbpl	r3, r2, #0
    2144:	e6ef3073 	uxtb	r3, r3
    2148:	e2833030 	add	r3, r3, #48	@ 0x30
    214c:	e6ef3073 	uxtb	r3, r3
    2150:	e54b3016 	strb	r3, [fp, #-22]	@ 0xffffffea
    name[3] = '\0';
    2154:	e3a03000 	mov	r3, #0
    2158:	e54b3015 	strb	r3, [fp, #-21]	@ 0xffffffeb
    if(link("bd", name) != 0){
    215c:	e24b3018 	sub	r3, fp, #24
    2160:	e1a01003 	mov	r1, r3
    2164:	e3050ee8 	movw	r0, #24296	@ 0x5ee8
    2168:	e3400000 	movt	r0, #0
    216c:	eb000ab3 	bl	4c40 <link>
    2170:	e1a03000 	mov	r3, r0
    2174:	e3530000 	cmp	r3, #0
    2178:	0a000004 	beq	2190 <bigdir+0x100>
      printf(1, "bigdir link failed\n");
    217c:	e3051f04 	movw	r1, #24324	@ 0x5f04
    2180:	e3401000 	movt	r1, #0
    2184:	e3a00001 	mov	r0, #1
    2188:	eb000ba1 	bl	5014 <printf>
      exit();
    218c:	eb000a0f 	bl	49d0 <exit>
  for(i = 0; i < 500; i++){
    2190:	e51b3008 	ldr	r3, [fp, #-8]
    2194:	e2833001 	add	r3, r3, #1
    2198:	e50b3008 	str	r3, [fp, #-8]
    219c:	e51b3008 	ldr	r3, [fp, #-8]
    21a0:	e3530f7d 	cmp	r3, #500	@ 0x1f4
    21a4:	baffffd5 	blt	2100 <bigdir+0x70>
    }
  }

  unlink("bd");
    21a8:	e3050ee8 	movw	r0, #24296	@ 0x5ee8
    21ac:	e3400000 	movt	r0, #0
    21b0:	eb000a88 	bl	4bd8 <unlink>
  for(i = 0; i < 500; i++){
    21b4:	e3a03000 	mov	r3, #0
    21b8:	e50b3008 	str	r3, [fp, #-8]
    21bc:	ea000024 	b	2254 <bigdir+0x1c4>
    name[0] = 'x';
    21c0:	e3a03078 	mov	r3, #120	@ 0x78
    21c4:	e54b3018 	strb	r3, [fp, #-24]	@ 0xffffffe8
    name[1] = '0' + (i / 64);
    21c8:	e51b3008 	ldr	r3, [fp, #-8]
    21cc:	e283203f 	add	r2, r3, #63	@ 0x3f
    21d0:	e3530000 	cmp	r3, #0
    21d4:	b1a03002 	movlt	r3, r2
    21d8:	a1a03003 	movge	r3, r3
    21dc:	e1a03343 	asr	r3, r3, #6
    21e0:	e6ef3073 	uxtb	r3, r3
    21e4:	e2833030 	add	r3, r3, #48	@ 0x30
    21e8:	e6ef3073 	uxtb	r3, r3
    21ec:	e54b3017 	strb	r3, [fp, #-23]	@ 0xffffffe9
    name[2] = '0' + (i % 64);
    21f0:	e51b3008 	ldr	r3, [fp, #-8]
    21f4:	e2732000 	rsbs	r2, r3, #0
    21f8:	e203303f 	and	r3, r3, #63	@ 0x3f
    21fc:	e202203f 	and	r2, r2, #63	@ 0x3f
    2200:	52623000 	rsbpl	r3, r2, #0
    2204:	e6ef3073 	uxtb	r3, r3
    2208:	e2833030 	add	r3, r3, #48	@ 0x30
    220c:	e6ef3073 	uxtb	r3, r3
    2210:	e54b3016 	strb	r3, [fp, #-22]	@ 0xffffffea
    name[3] = '\0';
    2214:	e3a03000 	mov	r3, #0
    2218:	e54b3015 	strb	r3, [fp, #-21]	@ 0xffffffeb
    if(unlink(name) != 0){
    221c:	e24b3018 	sub	r3, fp, #24
    2220:	e1a00003 	mov	r0, r3
    2224:	eb000a6b 	bl	4bd8 <unlink>
    2228:	e1a03000 	mov	r3, r0
    222c:	e3530000 	cmp	r3, #0
    2230:	0a000004 	beq	2248 <bigdir+0x1b8>
      printf(1, "bigdir unlink failed");
    2234:	e3051f18 	movw	r1, #24344	@ 0x5f18
    2238:	e3401000 	movt	r1, #0
    223c:	e3a00001 	mov	r0, #1
    2240:	eb000b73 	bl	5014 <printf>
      exit();
    2244:	eb0009e1 	bl	49d0 <exit>
  for(i = 0; i < 500; i++){
    2248:	e51b3008 	ldr	r3, [fp, #-8]
    224c:	e2833001 	add	r3, r3, #1
    2250:	e50b3008 	str	r3, [fp, #-8]
    2254:	e51b3008 	ldr	r3, [fp, #-8]
    2258:	e3530f7d 	cmp	r3, #500	@ 0x1f4
    225c:	baffffd7 	blt	21c0 <bigdir+0x130>
    }
  }

  printf(1, "bigdir ok\n");
    2260:	e3051f30 	movw	r1, #24368	@ 0x5f30
    2264:	e3401000 	movt	r1, #0
    2268:	e3a00001 	mov	r0, #1
    226c:	eb000b68 	bl	5014 <printf>
}
    2270:	e320f000 	nop	{0}
    2274:	e24bd004 	sub	sp, fp, #4
    2278:	e8bd8800 	pop	{fp, pc}

0000227c <subdir>:

void
subdir(void)
{
    227c:	e92d4800 	push	{fp, lr}
    2280:	e28db004 	add	fp, sp, #4
    2284:	e24dd008 	sub	sp, sp, #8
  int fd, cc;

  printf(1, "subdir test\n");
    2288:	e3051f3c 	movw	r1, #24380	@ 0x5f3c
    228c:	e3401000 	movt	r1, #0
    2290:	e3a00001 	mov	r0, #1
    2294:	eb000b5e 	bl	5014 <printf>

  unlink("ff");
    2298:	e3050f4c 	movw	r0, #24396	@ 0x5f4c
    229c:	e3400000 	movt	r0, #0
    22a0:	eb000a4c 	bl	4bd8 <unlink>
  if(mkdir("dd") != 0){
    22a4:	e3050f50 	movw	r0, #24400	@ 0x5f50
    22a8:	e3400000 	movt	r0, #0
    22ac:	eb000a70 	bl	4c74 <mkdir>
    22b0:	e1a03000 	mov	r3, r0
    22b4:	e3530000 	cmp	r3, #0
    22b8:	0a000004 	beq	22d0 <subdir+0x54>
    printf(1, "subdir mkdir dd failed\n");
    22bc:	e3051f54 	movw	r1, #24404	@ 0x5f54
    22c0:	e3401000 	movt	r1, #0
    22c4:	e3a00001 	mov	r0, #1
    22c8:	eb000b51 	bl	5014 <printf>
    exit();
    22cc:	eb0009bf 	bl	49d0 <exit>
  }

  fd = open("dd/ff", O_CREATE | O_RDWR);
    22d0:	e3001202 	movw	r1, #514	@ 0x202
    22d4:	e3050f6c 	movw	r0, #24428	@ 0x5f6c
    22d8:	e3400000 	movt	r0, #0
    22dc:	eb000a23 	bl	4b70 <open>
    22e0:	e50b0008 	str	r0, [fp, #-8]
  if(fd < 0){
    22e4:	e51b3008 	ldr	r3, [fp, #-8]
    22e8:	e3530000 	cmp	r3, #0
    22ec:	aa000004 	bge	2304 <subdir+0x88>
    printf(1, "create dd/ff failed\n");
    22f0:	e3051f74 	movw	r1, #24436	@ 0x5f74
    22f4:	e3401000 	movt	r1, #0
    22f8:	e3a00001 	mov	r0, #1
    22fc:	eb000b44 	bl	5014 <printf>
    exit();
    2300:	eb0009b2 	bl	49d0 <exit>
  }
  write(fd, "ff", 2);
    2304:	e3a02002 	mov	r2, #2
    2308:	e3051f4c 	movw	r1, #24396	@ 0x5f4c
    230c:	e3401000 	movt	r1, #0
    2310:	e51b0008 	ldr	r0, [fp, #-8]
    2314:	eb0009e1 	bl	4aa0 <write>
  close(fd);
    2318:	e51b0008 	ldr	r0, [fp, #-8]
    231c:	eb0009ec 	bl	4ad4 <close>
  
  if(unlink("dd") >= 0){
    2320:	e3050f50 	movw	r0, #24400	@ 0x5f50
    2324:	e3400000 	movt	r0, #0
    2328:	eb000a2a 	bl	4bd8 <unlink>
    232c:	e1a03000 	mov	r3, r0
    2330:	e3530000 	cmp	r3, #0
    2334:	ba000004 	blt	234c <subdir+0xd0>
    printf(1, "unlink dd (non-empty dir) succeeded!\n");
    2338:	e3051f8c 	movw	r1, #24460	@ 0x5f8c
    233c:	e3401000 	movt	r1, #0
    2340:	e3a00001 	mov	r0, #1
    2344:	eb000b32 	bl	5014 <printf>
    exit();
    2348:	eb0009a0 	bl	49d0 <exit>
  }

  if(mkdir("/dd/dd") != 0){
    234c:	e3050fb4 	movw	r0, #24500	@ 0x5fb4
    2350:	e3400000 	movt	r0, #0
    2354:	eb000a46 	bl	4c74 <mkdir>
    2358:	e1a03000 	mov	r3, r0
    235c:	e3530000 	cmp	r3, #0
    2360:	0a000004 	beq	2378 <subdir+0xfc>
    printf(1, "subdir mkdir dd/dd failed\n");
    2364:	e3051fbc 	movw	r1, #24508	@ 0x5fbc
    2368:	e3401000 	movt	r1, #0
    236c:	e3a00001 	mov	r0, #1
    2370:	eb000b27 	bl	5014 <printf>
    exit();
    2374:	eb000995 	bl	49d0 <exit>
  }

  fd = open("dd/dd/ff", O_CREATE | O_RDWR);
    2378:	e3001202 	movw	r1, #514	@ 0x202
    237c:	e3050fd8 	movw	r0, #24536	@ 0x5fd8
    2380:	e3400000 	movt	r0, #0
    2384:	eb0009f9 	bl	4b70 <open>
    2388:	e50b0008 	str	r0, [fp, #-8]
  if(fd < 0){
    238c:	e51b3008 	ldr	r3, [fp, #-8]
    2390:	e3530000 	cmp	r3, #0
    2394:	aa000004 	bge	23ac <subdir+0x130>
    printf(1, "create dd/dd/ff failed\n");
    2398:	e3051fe4 	movw	r1, #24548	@ 0x5fe4
    239c:	e3401000 	movt	r1, #0
    23a0:	e3a00001 	mov	r0, #1
    23a4:	eb000b1a 	bl	5014 <printf>
    exit();
    23a8:	eb000988 	bl	49d0 <exit>
  }
  write(fd, "FF", 2);
    23ac:	e3a02002 	mov	r2, #2
    23b0:	e3051ffc 	movw	r1, #24572	@ 0x5ffc
    23b4:	e3401000 	movt	r1, #0
    23b8:	e51b0008 	ldr	r0, [fp, #-8]
    23bc:	eb0009b7 	bl	4aa0 <write>
  close(fd);
    23c0:	e51b0008 	ldr	r0, [fp, #-8]
    23c4:	eb0009c2 	bl	4ad4 <close>

  fd = open("dd/dd/../ff", 0);
    23c8:	e3a01000 	mov	r1, #0
    23cc:	e3060000 	movw	r0, #24576	@ 0x6000
    23d0:	e3400000 	movt	r0, #0
    23d4:	eb0009e5 	bl	4b70 <open>
    23d8:	e50b0008 	str	r0, [fp, #-8]
  if(fd < 0){
    23dc:	e51b3008 	ldr	r3, [fp, #-8]
    23e0:	e3530000 	cmp	r3, #0
    23e4:	aa000004 	bge	23fc <subdir+0x180>
    printf(1, "open dd/dd/../ff failed\n");
    23e8:	e306100c 	movw	r1, #24588	@ 0x600c
    23ec:	e3401000 	movt	r1, #0
    23f0:	e3a00001 	mov	r0, #1
    23f4:	eb000b06 	bl	5014 <printf>
    exit();
    23f8:	eb000974 	bl	49d0 <exit>
  }
  cc = read(fd, buf, sizeof(buf));
    23fc:	e3a02a02 	mov	r2, #8192	@ 0x2000
    2400:	e3071080 	movw	r1, #28800	@ 0x7080
    2404:	e3401000 	movt	r1, #0
    2408:	e51b0008 	ldr	r0, [fp, #-8]
    240c:	eb000996 	bl	4a6c <read>
    2410:	e50b000c 	str	r0, [fp, #-12]
  if(cc != 2 || buf[0] != 'f'){
    2414:	e51b300c 	ldr	r3, [fp, #-12]
    2418:	e3530002 	cmp	r3, #2
    241c:	1a000004 	bne	2434 <subdir+0x1b8>
    2420:	e3073080 	movw	r3, #28800	@ 0x7080
    2424:	e3403000 	movt	r3, #0
    2428:	e5d33000 	ldrb	r3, [r3]
    242c:	e3530066 	cmp	r3, #102	@ 0x66
    2430:	0a000004 	beq	2448 <subdir+0x1cc>
    printf(1, "dd/dd/../ff wrong content\n");
    2434:	e3061028 	movw	r1, #24616	@ 0x6028
    2438:	e3401000 	movt	r1, #0
    243c:	e3a00001 	mov	r0, #1
    2440:	eb000af3 	bl	5014 <printf>
    exit();
    2444:	eb000961 	bl	49d0 <exit>
  }
  close(fd);
    2448:	e51b0008 	ldr	r0, [fp, #-8]
    244c:	eb0009a0 	bl	4ad4 <close>

  if(link("dd/dd/ff", "dd/dd/ffff") != 0){
    2450:	e3061044 	movw	r1, #24644	@ 0x6044
    2454:	e3401000 	movt	r1, #0
    2458:	e3050fd8 	movw	r0, #24536	@ 0x5fd8
    245c:	e3400000 	movt	r0, #0
    2460:	eb0009f6 	bl	4c40 <link>
    2464:	e1a03000 	mov	r3, r0
    2468:	e3530000 	cmp	r3, #0
    246c:	0a000004 	beq	2484 <subdir+0x208>
    printf(1, "link dd/dd/ff dd/dd/ffff failed\n");
    2470:	e3061050 	movw	r1, #24656	@ 0x6050
    2474:	e3401000 	movt	r1, #0
    2478:	e3a00001 	mov	r0, #1
    247c:	eb000ae4 	bl	5014 <printf>
    exit();
    2480:	eb000952 	bl	49d0 <exit>
  }

  if(unlink("dd/dd/ff") != 0){
    2484:	e3050fd8 	movw	r0, #24536	@ 0x5fd8
    2488:	e3400000 	movt	r0, #0
    248c:	eb0009d1 	bl	4bd8 <unlink>
    2490:	e1a03000 	mov	r3, r0
    2494:	e3530000 	cmp	r3, #0
    2498:	0a000004 	beq	24b0 <subdir+0x234>
    printf(1, "unlink dd/dd/ff failed\n");
    249c:	e3061074 	movw	r1, #24692	@ 0x6074
    24a0:	e3401000 	movt	r1, #0
    24a4:	e3a00001 	mov	r0, #1
    24a8:	eb000ad9 	bl	5014 <printf>
    exit();
    24ac:	eb000947 	bl	49d0 <exit>
  }
  if(open("dd/dd/ff", O_RDONLY) >= 0){
    24b0:	e3a01000 	mov	r1, #0
    24b4:	e3050fd8 	movw	r0, #24536	@ 0x5fd8
    24b8:	e3400000 	movt	r0, #0
    24bc:	eb0009ab 	bl	4b70 <open>
    24c0:	e1a03000 	mov	r3, r0
    24c4:	e3530000 	cmp	r3, #0
    24c8:	ba000004 	blt	24e0 <subdir+0x264>
    printf(1, "open (unlinked) dd/dd/ff succeeded\n");
    24cc:	e306108c 	movw	r1, #24716	@ 0x608c
    24d0:	e3401000 	movt	r1, #0
    24d4:	e3a00001 	mov	r0, #1
    24d8:	eb000acd 	bl	5014 <printf>
    exit();
    24dc:	eb00093b 	bl	49d0 <exit>
  }

  if(chdir("dd") != 0){
    24e0:	e3050f50 	movw	r0, #24400	@ 0x5f50
    24e4:	e3400000 	movt	r0, #0
    24e8:	eb0009ee 	bl	4ca8 <chdir>
    24ec:	e1a03000 	mov	r3, r0
    24f0:	e3530000 	cmp	r3, #0
    24f4:	0a000004 	beq	250c <subdir+0x290>
    printf(1, "chdir dd failed\n");
    24f8:	e30610b0 	movw	r1, #24752	@ 0x60b0
    24fc:	e3401000 	movt	r1, #0
    2500:	e3a00001 	mov	r0, #1
    2504:	eb000ac2 	bl	5014 <printf>
    exit();
    2508:	eb000930 	bl	49d0 <exit>
  }
  if(chdir("dd/../../dd") != 0){
    250c:	e30600c4 	movw	r0, #24772	@ 0x60c4
    2510:	e3400000 	movt	r0, #0
    2514:	eb0009e3 	bl	4ca8 <chdir>
    2518:	e1a03000 	mov	r3, r0
    251c:	e3530000 	cmp	r3, #0
    2520:	0a000004 	beq	2538 <subdir+0x2bc>
    printf(1, "chdir dd/../../dd failed\n");
    2524:	e30610d0 	movw	r1, #24784	@ 0x60d0
    2528:	e3401000 	movt	r1, #0
    252c:	e3a00001 	mov	r0, #1
    2530:	eb000ab7 	bl	5014 <printf>
    exit();
    2534:	eb000925 	bl	49d0 <exit>
  }
  if(chdir("dd/../../../dd") != 0){
    2538:	e30600ec 	movw	r0, #24812	@ 0x60ec
    253c:	e3400000 	movt	r0, #0
    2540:	eb0009d8 	bl	4ca8 <chdir>
    2544:	e1a03000 	mov	r3, r0
    2548:	e3530000 	cmp	r3, #0
    254c:	0a000004 	beq	2564 <subdir+0x2e8>
    printf(1, "chdir dd/../../dd failed\n");
    2550:	e30610d0 	movw	r1, #24784	@ 0x60d0
    2554:	e3401000 	movt	r1, #0
    2558:	e3a00001 	mov	r0, #1
    255c:	eb000aac 	bl	5014 <printf>
    exit();
    2560:	eb00091a 	bl	49d0 <exit>
  }
  if(chdir("./..") != 0){
    2564:	e30600fc 	movw	r0, #24828	@ 0x60fc
    2568:	e3400000 	movt	r0, #0
    256c:	eb0009cd 	bl	4ca8 <chdir>
    2570:	e1a03000 	mov	r3, r0
    2574:	e3530000 	cmp	r3, #0
    2578:	0a000004 	beq	2590 <subdir+0x314>
    printf(1, "chdir ./.. failed\n");
    257c:	e3061104 	movw	r1, #24836	@ 0x6104
    2580:	e3401000 	movt	r1, #0
    2584:	e3a00001 	mov	r0, #1
    2588:	eb000aa1 	bl	5014 <printf>
    exit();
    258c:	eb00090f 	bl	49d0 <exit>
  }

  fd = open("dd/dd/ffff", 0);
    2590:	e3a01000 	mov	r1, #0
    2594:	e3060044 	movw	r0, #24644	@ 0x6044
    2598:	e3400000 	movt	r0, #0
    259c:	eb000973 	bl	4b70 <open>
    25a0:	e50b0008 	str	r0, [fp, #-8]
  if(fd < 0){
    25a4:	e51b3008 	ldr	r3, [fp, #-8]
    25a8:	e3530000 	cmp	r3, #0
    25ac:	aa000004 	bge	25c4 <subdir+0x348>
    printf(1, "open dd/dd/ffff failed\n");
    25b0:	e3061118 	movw	r1, #24856	@ 0x6118
    25b4:	e3401000 	movt	r1, #0
    25b8:	e3a00001 	mov	r0, #1
    25bc:	eb000a94 	bl	5014 <printf>
    exit();
    25c0:	eb000902 	bl	49d0 <exit>
  }
  if(read(fd, buf, sizeof(buf)) != 2){
    25c4:	e3a02a02 	mov	r2, #8192	@ 0x2000
    25c8:	e3071080 	movw	r1, #28800	@ 0x7080
    25cc:	e3401000 	movt	r1, #0
    25d0:	e51b0008 	ldr	r0, [fp, #-8]
    25d4:	eb000924 	bl	4a6c <read>
    25d8:	e1a03000 	mov	r3, r0
    25dc:	e3530002 	cmp	r3, #2
    25e0:	0a000004 	beq	25f8 <subdir+0x37c>
    printf(1, "read dd/dd/ffff wrong len\n");
    25e4:	e3061130 	movw	r1, #24880	@ 0x6130
    25e8:	e3401000 	movt	r1, #0
    25ec:	e3a00001 	mov	r0, #1
    25f0:	eb000a87 	bl	5014 <printf>
    exit();
    25f4:	eb0008f5 	bl	49d0 <exit>
  }
  close(fd);
    25f8:	e51b0008 	ldr	r0, [fp, #-8]
    25fc:	eb000934 	bl	4ad4 <close>

  if(open("dd/dd/ff", O_RDONLY) >= 0){
    2600:	e3a01000 	mov	r1, #0
    2604:	e3050fd8 	movw	r0, #24536	@ 0x5fd8
    2608:	e3400000 	movt	r0, #0
    260c:	eb000957 	bl	4b70 <open>
    2610:	e1a03000 	mov	r3, r0
    2614:	e3530000 	cmp	r3, #0
    2618:	ba000004 	blt	2630 <subdir+0x3b4>
    printf(1, "open (unlinked) dd/dd/ff succeeded!\n");
    261c:	e306114c 	movw	r1, #24908	@ 0x614c
    2620:	e3401000 	movt	r1, #0
    2624:	e3a00001 	mov	r0, #1
    2628:	eb000a79 	bl	5014 <printf>
    exit();
    262c:	eb0008e7 	bl	49d0 <exit>
  }

  if(open("dd/ff/ff", O_CREATE|O_RDWR) >= 0){
    2630:	e3001202 	movw	r1, #514	@ 0x202
    2634:	e3060174 	movw	r0, #24948	@ 0x6174
    2638:	e3400000 	movt	r0, #0
    263c:	eb00094b 	bl	4b70 <open>
    2640:	e1a03000 	mov	r3, r0
    2644:	e3530000 	cmp	r3, #0
    2648:	ba000004 	blt	2660 <subdir+0x3e4>
    printf(1, "create dd/ff/ff succeeded!\n");
    264c:	e3061180 	movw	r1, #24960	@ 0x6180
    2650:	e3401000 	movt	r1, #0
    2654:	e3a00001 	mov	r0, #1
    2658:	eb000a6d 	bl	5014 <printf>
    exit();
    265c:	eb0008db 	bl	49d0 <exit>
  }
  if(open("dd/xx/ff", O_CREATE|O_RDWR) >= 0){
    2660:	e3001202 	movw	r1, #514	@ 0x202
    2664:	e306019c 	movw	r0, #24988	@ 0x619c
    2668:	e3400000 	movt	r0, #0
    266c:	eb00093f 	bl	4b70 <open>
    2670:	e1a03000 	mov	r3, r0
    2674:	e3530000 	cmp	r3, #0
    2678:	ba000004 	blt	2690 <subdir+0x414>
    printf(1, "create dd/xx/ff succeeded!\n");
    267c:	e30611a8 	movw	r1, #25000	@ 0x61a8
    2680:	e3401000 	movt	r1, #0
    2684:	e3a00001 	mov	r0, #1
    2688:	eb000a61 	bl	5014 <printf>
    exit();
    268c:	eb0008cf 	bl	49d0 <exit>
  }
  if(open("dd", O_CREATE) >= 0){
    2690:	e3a01c02 	mov	r1, #512	@ 0x200
    2694:	e3050f50 	movw	r0, #24400	@ 0x5f50
    2698:	e3400000 	movt	r0, #0
    269c:	eb000933 	bl	4b70 <open>
    26a0:	e1a03000 	mov	r3, r0
    26a4:	e3530000 	cmp	r3, #0
    26a8:	ba000004 	blt	26c0 <subdir+0x444>
    printf(1, "create dd succeeded!\n");
    26ac:	e30611c4 	movw	r1, #25028	@ 0x61c4
    26b0:	e3401000 	movt	r1, #0
    26b4:	e3a00001 	mov	r0, #1
    26b8:	eb000a55 	bl	5014 <printf>
    exit();
    26bc:	eb0008c3 	bl	49d0 <exit>
  }
  if(open("dd", O_RDWR) >= 0){
    26c0:	e3a01002 	mov	r1, #2
    26c4:	e3050f50 	movw	r0, #24400	@ 0x5f50
    26c8:	e3400000 	movt	r0, #0
    26cc:	eb000927 	bl	4b70 <open>
    26d0:	e1a03000 	mov	r3, r0
    26d4:	e3530000 	cmp	r3, #0
    26d8:	ba000004 	blt	26f0 <subdir+0x474>
    printf(1, "open dd rdwr succeeded!\n");
    26dc:	e30611dc 	movw	r1, #25052	@ 0x61dc
    26e0:	e3401000 	movt	r1, #0
    26e4:	e3a00001 	mov	r0, #1
    26e8:	eb000a49 	bl	5014 <printf>
    exit();
    26ec:	eb0008b7 	bl	49d0 <exit>
  }
  if(open("dd", O_WRONLY) >= 0){
    26f0:	e3a01001 	mov	r1, #1
    26f4:	e3050f50 	movw	r0, #24400	@ 0x5f50
    26f8:	e3400000 	movt	r0, #0
    26fc:	eb00091b 	bl	4b70 <open>
    2700:	e1a03000 	mov	r3, r0
    2704:	e3530000 	cmp	r3, #0
    2708:	ba000004 	blt	2720 <subdir+0x4a4>
    printf(1, "open dd wronly succeeded!\n");
    270c:	e30611f8 	movw	r1, #25080	@ 0x61f8
    2710:	e3401000 	movt	r1, #0
    2714:	e3a00001 	mov	r0, #1
    2718:	eb000a3d 	bl	5014 <printf>
    exit();
    271c:	eb0008ab 	bl	49d0 <exit>
  }
  if(link("dd/ff/ff", "dd/dd/xx") == 0){
    2720:	e3061214 	movw	r1, #25108	@ 0x6214
    2724:	e3401000 	movt	r1, #0
    2728:	e3060174 	movw	r0, #24948	@ 0x6174
    272c:	e3400000 	movt	r0, #0
    2730:	eb000942 	bl	4c40 <link>
    2734:	e1a03000 	mov	r3, r0
    2738:	e3530000 	cmp	r3, #0
    273c:	1a000004 	bne	2754 <subdir+0x4d8>
    printf(1, "link dd/ff/ff dd/dd/xx succeeded!\n");
    2740:	e3061220 	movw	r1, #25120	@ 0x6220
    2744:	e3401000 	movt	r1, #0
    2748:	e3a00001 	mov	r0, #1
    274c:	eb000a30 	bl	5014 <printf>
    exit();
    2750:	eb00089e 	bl	49d0 <exit>
  }
  if(link("dd/xx/ff", "dd/dd/xx") == 0){
    2754:	e3061214 	movw	r1, #25108	@ 0x6214
    2758:	e3401000 	movt	r1, #0
    275c:	e306019c 	movw	r0, #24988	@ 0x619c
    2760:	e3400000 	movt	r0, #0
    2764:	eb000935 	bl	4c40 <link>
    2768:	e1a03000 	mov	r3, r0
    276c:	e3530000 	cmp	r3, #0
    2770:	1a000004 	bne	2788 <subdir+0x50c>
    printf(1, "link dd/xx/ff dd/dd/xx succeeded!\n");
    2774:	e3061244 	movw	r1, #25156	@ 0x6244
    2778:	e3401000 	movt	r1, #0
    277c:	e3a00001 	mov	r0, #1
    2780:	eb000a23 	bl	5014 <printf>
    exit();
    2784:	eb000891 	bl	49d0 <exit>
  }
  if(link("dd/ff", "dd/dd/ffff") == 0){
    2788:	e3061044 	movw	r1, #24644	@ 0x6044
    278c:	e3401000 	movt	r1, #0
    2790:	e3050f6c 	movw	r0, #24428	@ 0x5f6c
    2794:	e3400000 	movt	r0, #0
    2798:	eb000928 	bl	4c40 <link>
    279c:	e1a03000 	mov	r3, r0
    27a0:	e3530000 	cmp	r3, #0
    27a4:	1a000004 	bne	27bc <subdir+0x540>
    printf(1, "link dd/ff dd/dd/ffff succeeded!\n");
    27a8:	e3061268 	movw	r1, #25192	@ 0x6268
    27ac:	e3401000 	movt	r1, #0
    27b0:	e3a00001 	mov	r0, #1
    27b4:	eb000a16 	bl	5014 <printf>
    exit();
    27b8:	eb000884 	bl	49d0 <exit>
  }
  if(mkdir("dd/ff/ff") == 0){
    27bc:	e3060174 	movw	r0, #24948	@ 0x6174
    27c0:	e3400000 	movt	r0, #0
    27c4:	eb00092a 	bl	4c74 <mkdir>
    27c8:	e1a03000 	mov	r3, r0
    27cc:	e3530000 	cmp	r3, #0
    27d0:	1a000004 	bne	27e8 <subdir+0x56c>
    printf(1, "mkdir dd/ff/ff succeeded!\n");
    27d4:	e306128c 	movw	r1, #25228	@ 0x628c
    27d8:	e3401000 	movt	r1, #0
    27dc:	e3a00001 	mov	r0, #1
    27e0:	eb000a0b 	bl	5014 <printf>
    exit();
    27e4:	eb000879 	bl	49d0 <exit>
  }
  if(mkdir("dd/xx/ff") == 0){
    27e8:	e306019c 	movw	r0, #24988	@ 0x619c
    27ec:	e3400000 	movt	r0, #0
    27f0:	eb00091f 	bl	4c74 <mkdir>
    27f4:	e1a03000 	mov	r3, r0
    27f8:	e3530000 	cmp	r3, #0
    27fc:	1a000004 	bne	2814 <subdir+0x598>
    printf(1, "mkdir dd/xx/ff succeeded!\n");
    2800:	e30612a8 	movw	r1, #25256	@ 0x62a8
    2804:	e3401000 	movt	r1, #0
    2808:	e3a00001 	mov	r0, #1
    280c:	eb000a00 	bl	5014 <printf>
    exit();
    2810:	eb00086e 	bl	49d0 <exit>
  }
  if(mkdir("dd/dd/ffff") == 0){
    2814:	e3060044 	movw	r0, #24644	@ 0x6044
    2818:	e3400000 	movt	r0, #0
    281c:	eb000914 	bl	4c74 <mkdir>
    2820:	e1a03000 	mov	r3, r0
    2824:	e3530000 	cmp	r3, #0
    2828:	1a000004 	bne	2840 <subdir+0x5c4>
    printf(1, "mkdir dd/dd/ffff succeeded!\n");
    282c:	e30612c4 	movw	r1, #25284	@ 0x62c4
    2830:	e3401000 	movt	r1, #0
    2834:	e3a00001 	mov	r0, #1
    2838:	eb0009f5 	bl	5014 <printf>
    exit();
    283c:	eb000863 	bl	49d0 <exit>
  }
  if(unlink("dd/xx/ff") == 0){
    2840:	e306019c 	movw	r0, #24988	@ 0x619c
    2844:	e3400000 	movt	r0, #0
    2848:	eb0008e2 	bl	4bd8 <unlink>
    284c:	e1a03000 	mov	r3, r0
    2850:	e3530000 	cmp	r3, #0
    2854:	1a000004 	bne	286c <subdir+0x5f0>
    printf(1, "unlink dd/xx/ff succeeded!\n");
    2858:	e30612e4 	movw	r1, #25316	@ 0x62e4
    285c:	e3401000 	movt	r1, #0
    2860:	e3a00001 	mov	r0, #1
    2864:	eb0009ea 	bl	5014 <printf>
    exit();
    2868:	eb000858 	bl	49d0 <exit>
  }
  if(unlink("dd/ff/ff") == 0){
    286c:	e3060174 	movw	r0, #24948	@ 0x6174
    2870:	e3400000 	movt	r0, #0
    2874:	eb0008d7 	bl	4bd8 <unlink>
    2878:	e1a03000 	mov	r3, r0
    287c:	e3530000 	cmp	r3, #0
    2880:	1a000004 	bne	2898 <subdir+0x61c>
    printf(1, "unlink dd/ff/ff succeeded!\n");
    2884:	e3061300 	movw	r1, #25344	@ 0x6300
    2888:	e3401000 	movt	r1, #0
    288c:	e3a00001 	mov	r0, #1
    2890:	eb0009df 	bl	5014 <printf>
    exit();
    2894:	eb00084d 	bl	49d0 <exit>
  }
  if(chdir("dd/ff") == 0){
    2898:	e3050f6c 	movw	r0, #24428	@ 0x5f6c
    289c:	e3400000 	movt	r0, #0
    28a0:	eb000900 	bl	4ca8 <chdir>
    28a4:	e1a03000 	mov	r3, r0
    28a8:	e3530000 	cmp	r3, #0
    28ac:	1a000004 	bne	28c4 <subdir+0x648>
    printf(1, "chdir dd/ff succeeded!\n");
    28b0:	e306131c 	movw	r1, #25372	@ 0x631c
    28b4:	e3401000 	movt	r1, #0
    28b8:	e3a00001 	mov	r0, #1
    28bc:	eb0009d4 	bl	5014 <printf>
    exit();
    28c0:	eb000842 	bl	49d0 <exit>
  }
  if(chdir("dd/xx") == 0){
    28c4:	e3060334 	movw	r0, #25396	@ 0x6334
    28c8:	e3400000 	movt	r0, #0
    28cc:	eb0008f5 	bl	4ca8 <chdir>
    28d0:	e1a03000 	mov	r3, r0
    28d4:	e3530000 	cmp	r3, #0
    28d8:	1a000004 	bne	28f0 <subdir+0x674>
    printf(1, "chdir dd/xx succeeded!\n");
    28dc:	e306133c 	movw	r1, #25404	@ 0x633c
    28e0:	e3401000 	movt	r1, #0
    28e4:	e3a00001 	mov	r0, #1
    28e8:	eb0009c9 	bl	5014 <printf>
    exit();
    28ec:	eb000837 	bl	49d0 <exit>
  }

  if(unlink("dd/dd/ffff") != 0){
    28f0:	e3060044 	movw	r0, #24644	@ 0x6044
    28f4:	e3400000 	movt	r0, #0
    28f8:	eb0008b6 	bl	4bd8 <unlink>
    28fc:	e1a03000 	mov	r3, r0
    2900:	e3530000 	cmp	r3, #0
    2904:	0a000004 	beq	291c <subdir+0x6a0>
    printf(1, "unlink dd/dd/ff failed\n");
    2908:	e3061074 	movw	r1, #24692	@ 0x6074
    290c:	e3401000 	movt	r1, #0
    2910:	e3a00001 	mov	r0, #1
    2914:	eb0009be 	bl	5014 <printf>
    exit();
    2918:	eb00082c 	bl	49d0 <exit>
  }
  if(unlink("dd/ff") != 0){
    291c:	e3050f6c 	movw	r0, #24428	@ 0x5f6c
    2920:	e3400000 	movt	r0, #0
    2924:	eb0008ab 	bl	4bd8 <unlink>
    2928:	e1a03000 	mov	r3, r0
    292c:	e3530000 	cmp	r3, #0
    2930:	0a000004 	beq	2948 <subdir+0x6cc>
    printf(1, "unlink dd/ff failed\n");
    2934:	e3061354 	movw	r1, #25428	@ 0x6354
    2938:	e3401000 	movt	r1, #0
    293c:	e3a00001 	mov	r0, #1
    2940:	eb0009b3 	bl	5014 <printf>
    exit();
    2944:	eb000821 	bl	49d0 <exit>
  }
  if(unlink("dd") == 0){
    2948:	e3050f50 	movw	r0, #24400	@ 0x5f50
    294c:	e3400000 	movt	r0, #0
    2950:	eb0008a0 	bl	4bd8 <unlink>
    2954:	e1a03000 	mov	r3, r0
    2958:	e3530000 	cmp	r3, #0
    295c:	1a000004 	bne	2974 <subdir+0x6f8>
    printf(1, "unlink non-empty dd succeeded!\n");
    2960:	e306136c 	movw	r1, #25452	@ 0x636c
    2964:	e3401000 	movt	r1, #0
    2968:	e3a00001 	mov	r0, #1
    296c:	eb0009a8 	bl	5014 <printf>
    exit();
    2970:	eb000816 	bl	49d0 <exit>
  }
  if(unlink("dd/dd") < 0){
    2974:	e306038c 	movw	r0, #25484	@ 0x638c
    2978:	e3400000 	movt	r0, #0
    297c:	eb000895 	bl	4bd8 <unlink>
    2980:	e1a03000 	mov	r3, r0
    2984:	e3530000 	cmp	r3, #0
    2988:	aa000004 	bge	29a0 <subdir+0x724>
    printf(1, "unlink dd/dd failed\n");
    298c:	e3061394 	movw	r1, #25492	@ 0x6394
    2990:	e3401000 	movt	r1, #0
    2994:	e3a00001 	mov	r0, #1
    2998:	eb00099d 	bl	5014 <printf>
    exit();
    299c:	eb00080b 	bl	49d0 <exit>
  }
  if(unlink("dd") < 0){
    29a0:	e3050f50 	movw	r0, #24400	@ 0x5f50
    29a4:	e3400000 	movt	r0, #0
    29a8:	eb00088a 	bl	4bd8 <unlink>
    29ac:	e1a03000 	mov	r3, r0
    29b0:	e3530000 	cmp	r3, #0
    29b4:	aa000004 	bge	29cc <subdir+0x750>
    printf(1, "unlink dd failed\n");
    29b8:	e30613ac 	movw	r1, #25516	@ 0x63ac
    29bc:	e3401000 	movt	r1, #0
    29c0:	e3a00001 	mov	r0, #1
    29c4:	eb000992 	bl	5014 <printf>
    exit();
    29c8:	eb000800 	bl	49d0 <exit>
  }

  printf(1, "subdir ok\n");
    29cc:	e30613c0 	movw	r1, #25536	@ 0x63c0
    29d0:	e3401000 	movt	r1, #0
    29d4:	e3a00001 	mov	r0, #1
    29d8:	eb00098d 	bl	5014 <printf>
}
    29dc:	e320f000 	nop	{0}
    29e0:	e24bd004 	sub	sp, fp, #4
    29e4:	e8bd8800 	pop	{fp, pc}

000029e8 <bigwrite>:

// test writes that are larger than the log.
void
bigwrite(void)
{
    29e8:	e92d4800 	push	{fp, lr}
    29ec:	e28db004 	add	fp, sp, #4
    29f0:	e24dd010 	sub	sp, sp, #16
  int fd, sz;

  printf(1, "bigwrite test\n");
    29f4:	e30613cc 	movw	r1, #25548	@ 0x63cc
    29f8:	e3401000 	movt	r1, #0
    29fc:	e3a00001 	mov	r0, #1
    2a00:	eb000983 	bl	5014 <printf>

  unlink("bigwrite");
    2a04:	e30603dc 	movw	r0, #25564	@ 0x63dc
    2a08:	e3400000 	movt	r0, #0
    2a0c:	eb000871 	bl	4bd8 <unlink>
  for(sz = 499; sz < 12*512; sz += 471){
    2a10:	e30031f3 	movw	r3, #499	@ 0x1f3
    2a14:	e50b3008 	str	r3, [fp, #-8]
    2a18:	ea00002f 	b	2adc <bigwrite+0xf4>
    fd = open("bigwrite", O_CREATE | O_RDWR);
    2a1c:	e3001202 	movw	r1, #514	@ 0x202
    2a20:	e30603dc 	movw	r0, #25564	@ 0x63dc
    2a24:	e3400000 	movt	r0, #0
    2a28:	eb000850 	bl	4b70 <open>
    2a2c:	e50b0010 	str	r0, [fp, #-16]
    if(fd < 0){
    2a30:	e51b3010 	ldr	r3, [fp, #-16]
    2a34:	e3530000 	cmp	r3, #0
    2a38:	aa000004 	bge	2a50 <bigwrite+0x68>
      printf(1, "cannot create bigwrite\n");
    2a3c:	e30613e8 	movw	r1, #25576	@ 0x63e8
    2a40:	e3401000 	movt	r1, #0
    2a44:	e3a00001 	mov	r0, #1
    2a48:	eb000971 	bl	5014 <printf>
      exit();
    2a4c:	eb0007df 	bl	49d0 <exit>
    }
    int i;
    for(i = 0; i < 2; i++){
    2a50:	e3a03000 	mov	r3, #0
    2a54:	e50b300c 	str	r3, [fp, #-12]
    2a58:	ea000013 	b	2aac <bigwrite+0xc4>
      int cc = write(fd, buf, sz);
    2a5c:	e51b2008 	ldr	r2, [fp, #-8]
    2a60:	e3071080 	movw	r1, #28800	@ 0x7080
    2a64:	e3401000 	movt	r1, #0
    2a68:	e51b0010 	ldr	r0, [fp, #-16]
    2a6c:	eb00080b 	bl	4aa0 <write>
    2a70:	e50b0014 	str	r0, [fp, #-20]	@ 0xffffffec
      if(cc != sz){
    2a74:	e51b2014 	ldr	r2, [fp, #-20]	@ 0xffffffec
    2a78:	e51b3008 	ldr	r3, [fp, #-8]
    2a7c:	e1520003 	cmp	r2, r3
    2a80:	0a000006 	beq	2aa0 <bigwrite+0xb8>
        printf(1, "write(%d) ret %d\n", sz, cc);
    2a84:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
    2a88:	e51b2008 	ldr	r2, [fp, #-8]
    2a8c:	e3061400 	movw	r1, #25600	@ 0x6400
    2a90:	e3401000 	movt	r1, #0
    2a94:	e3a00001 	mov	r0, #1
    2a98:	eb00095d 	bl	5014 <printf>
        exit();
    2a9c:	eb0007cb 	bl	49d0 <exit>
    for(i = 0; i < 2; i++){
    2aa0:	e51b300c 	ldr	r3, [fp, #-12]
    2aa4:	e2833001 	add	r3, r3, #1
    2aa8:	e50b300c 	str	r3, [fp, #-12]
    2aac:	e51b300c 	ldr	r3, [fp, #-12]
    2ab0:	e3530001 	cmp	r3, #1
    2ab4:	daffffe8 	ble	2a5c <bigwrite+0x74>
      }
    }
    close(fd);
    2ab8:	e51b0010 	ldr	r0, [fp, #-16]
    2abc:	eb000804 	bl	4ad4 <close>
    unlink("bigwrite");
    2ac0:	e30603dc 	movw	r0, #25564	@ 0x63dc
    2ac4:	e3400000 	movt	r0, #0
    2ac8:	eb000842 	bl	4bd8 <unlink>
  for(sz = 499; sz < 12*512; sz += 471){
    2acc:	e51b3008 	ldr	r3, [fp, #-8]
    2ad0:	e2833f75 	add	r3, r3, #468	@ 0x1d4
    2ad4:	e2833003 	add	r3, r3, #3
    2ad8:	e50b3008 	str	r3, [fp, #-8]
    2adc:	e51b3008 	ldr	r3, [fp, #-8]
    2ae0:	e3530b06 	cmp	r3, #6144	@ 0x1800
    2ae4:	baffffcc 	blt	2a1c <bigwrite+0x34>
  }

  printf(1, "bigwrite ok\n");
    2ae8:	e3061414 	movw	r1, #25620	@ 0x6414
    2aec:	e3401000 	movt	r1, #0
    2af0:	e3a00001 	mov	r0, #1
    2af4:	eb000946 	bl	5014 <printf>
}
    2af8:	e320f000 	nop	{0}
    2afc:	e24bd004 	sub	sp, fp, #4
    2b00:	e8bd8800 	pop	{fp, pc}

00002b04 <bigfile>:

void
bigfile(void)
{
    2b04:	e92d4800 	push	{fp, lr}
    2b08:	e28db004 	add	fp, sp, #4
    2b0c:	e24dd010 	sub	sp, sp, #16
  int fd, i, total, cc;

  printf(1, "bigfile test\n");
    2b10:	e3061424 	movw	r1, #25636	@ 0x6424
    2b14:	e3401000 	movt	r1, #0
    2b18:	e3a00001 	mov	r0, #1
    2b1c:	eb00093c 	bl	5014 <printf>

  unlink("bigfile");
    2b20:	e3060434 	movw	r0, #25652	@ 0x6434
    2b24:	e3400000 	movt	r0, #0
    2b28:	eb00082a 	bl	4bd8 <unlink>
  fd = open("bigfile", O_CREATE | O_RDWR);
    2b2c:	e3001202 	movw	r1, #514	@ 0x202
    2b30:	e3060434 	movw	r0, #25652	@ 0x6434
    2b34:	e3400000 	movt	r0, #0
    2b38:	eb00080c 	bl	4b70 <open>
    2b3c:	e50b0010 	str	r0, [fp, #-16]
  if(fd < 0){
    2b40:	e51b3010 	ldr	r3, [fp, #-16]
    2b44:	e3530000 	cmp	r3, #0
    2b48:	aa000004 	bge	2b60 <bigfile+0x5c>
    printf(1, "cannot create bigfile");
    2b4c:	e306143c 	movw	r1, #25660	@ 0x643c
    2b50:	e3401000 	movt	r1, #0
    2b54:	e3a00001 	mov	r0, #1
    2b58:	eb00092d 	bl	5014 <printf>
    exit();
    2b5c:	eb00079b 	bl	49d0 <exit>
  }
  for(i = 0; i < 20; i++){
    2b60:	e3a03000 	mov	r3, #0
    2b64:	e50b3008 	str	r3, [fp, #-8]
    2b68:	ea000014 	b	2bc0 <bigfile+0xbc>
    memset(buf, i, 600);
    2b6c:	e3a02f96 	mov	r2, #600	@ 0x258
    2b70:	e51b1008 	ldr	r1, [fp, #-8]
    2b74:	e3070080 	movw	r0, #28800	@ 0x7080
    2b78:	e3400000 	movt	r0, #0
    2b7c:	eb0006cf 	bl	46c0 <memset>
    if(write(fd, buf, 600) != 600){
    2b80:	e3a02f96 	mov	r2, #600	@ 0x258
    2b84:	e3071080 	movw	r1, #28800	@ 0x7080
    2b88:	e3401000 	movt	r1, #0
    2b8c:	e51b0010 	ldr	r0, [fp, #-16]
    2b90:	eb0007c2 	bl	4aa0 <write>
    2b94:	e1a03000 	mov	r3, r0
    2b98:	e3530f96 	cmp	r3, #600	@ 0x258
    2b9c:	0a000004 	beq	2bb4 <bigfile+0xb0>
      printf(1, "write bigfile failed\n");
    2ba0:	e3061454 	movw	r1, #25684	@ 0x6454
    2ba4:	e3401000 	movt	r1, #0
    2ba8:	e3a00001 	mov	r0, #1
    2bac:	eb000918 	bl	5014 <printf>
      exit();
    2bb0:	eb000786 	bl	49d0 <exit>
  for(i = 0; i < 20; i++){
    2bb4:	e51b3008 	ldr	r3, [fp, #-8]
    2bb8:	e2833001 	add	r3, r3, #1
    2bbc:	e50b3008 	str	r3, [fp, #-8]
    2bc0:	e51b3008 	ldr	r3, [fp, #-8]
    2bc4:	e3530013 	cmp	r3, #19
    2bc8:	daffffe7 	ble	2b6c <bigfile+0x68>
    }
  }
  close(fd);
    2bcc:	e51b0010 	ldr	r0, [fp, #-16]
    2bd0:	eb0007bf 	bl	4ad4 <close>

  fd = open("bigfile", 0);
    2bd4:	e3a01000 	mov	r1, #0
    2bd8:	e3060434 	movw	r0, #25652	@ 0x6434
    2bdc:	e3400000 	movt	r0, #0
    2be0:	eb0007e2 	bl	4b70 <open>
    2be4:	e50b0010 	str	r0, [fp, #-16]
  if(fd < 0){
    2be8:	e51b3010 	ldr	r3, [fp, #-16]
    2bec:	e3530000 	cmp	r3, #0
    2bf0:	aa000004 	bge	2c08 <bigfile+0x104>
    printf(1, "cannot open bigfile\n");
    2bf4:	e306146c 	movw	r1, #25708	@ 0x646c
    2bf8:	e3401000 	movt	r1, #0
    2bfc:	e3a00001 	mov	r0, #1
    2c00:	eb000903 	bl	5014 <printf>
    exit();
    2c04:	eb000771 	bl	49d0 <exit>
  }
  total = 0;
    2c08:	e3a03000 	mov	r3, #0
    2c0c:	e50b300c 	str	r3, [fp, #-12]
  for(i = 0; ; i++){
    2c10:	e3a03000 	mov	r3, #0
    2c14:	e50b3008 	str	r3, [fp, #-8]
    cc = read(fd, buf, 300);
    2c18:	e3a02f4b 	mov	r2, #300	@ 0x12c
    2c1c:	e3071080 	movw	r1, #28800	@ 0x7080
    2c20:	e3401000 	movt	r1, #0
    2c24:	e51b0010 	ldr	r0, [fp, #-16]
    2c28:	eb00078f 	bl	4a6c <read>
    2c2c:	e50b0014 	str	r0, [fp, #-20]	@ 0xffffffec
    if(cc < 0){
    2c30:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
    2c34:	e3530000 	cmp	r3, #0
    2c38:	aa000004 	bge	2c50 <bigfile+0x14c>
      printf(1, "read bigfile failed\n");
    2c3c:	e3061484 	movw	r1, #25732	@ 0x6484
    2c40:	e3401000 	movt	r1, #0
    2c44:	e3a00001 	mov	r0, #1
    2c48:	eb0008f1 	bl	5014 <printf>
      exit();
    2c4c:	eb00075f 	bl	49d0 <exit>
    }
    if(cc == 0)
    2c50:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
    2c54:	e3530000 	cmp	r3, #0
    2c58:	0a000028 	beq	2d00 <bigfile+0x1fc>
      break;
    if(cc != 300){
    2c5c:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
    2c60:	e3530f4b 	cmp	r3, #300	@ 0x12c
    2c64:	0a000004 	beq	2c7c <bigfile+0x178>
      printf(1, "short read bigfile\n");
    2c68:	e306149c 	movw	r1, #25756	@ 0x649c
    2c6c:	e3401000 	movt	r1, #0
    2c70:	e3a00001 	mov	r0, #1
    2c74:	eb0008e6 	bl	5014 <printf>
      exit();
    2c78:	eb000754 	bl	49d0 <exit>
    }
    if(buf[0] != i/2 || buf[299] != i/2){
    2c7c:	e3073080 	movw	r3, #28800	@ 0x7080
    2c80:	e3403000 	movt	r3, #0
    2c84:	e5d33000 	ldrb	r3, [r3]
    2c88:	e1a01003 	mov	r1, r3
    2c8c:	e51b3008 	ldr	r3, [fp, #-8]
    2c90:	e1a02fa3 	lsr	r2, r3, #31
    2c94:	e0823003 	add	r3, r2, r3
    2c98:	e1a030c3 	asr	r3, r3, #1
    2c9c:	e1510003 	cmp	r1, r3
    2ca0:	1a000009 	bne	2ccc <bigfile+0x1c8>
    2ca4:	e3073080 	movw	r3, #28800	@ 0x7080
    2ca8:	e3403000 	movt	r3, #0
    2cac:	e5d3312b 	ldrb	r3, [r3, #299]	@ 0x12b
    2cb0:	e1a01003 	mov	r1, r3
    2cb4:	e51b3008 	ldr	r3, [fp, #-8]
    2cb8:	e1a02fa3 	lsr	r2, r3, #31
    2cbc:	e0823003 	add	r3, r2, r3
    2cc0:	e1a030c3 	asr	r3, r3, #1
    2cc4:	e1510003 	cmp	r1, r3
    2cc8:	0a000004 	beq	2ce0 <bigfile+0x1dc>
      printf(1, "read bigfile wrong data\n");
    2ccc:	e30614b0 	movw	r1, #25776	@ 0x64b0
    2cd0:	e3401000 	movt	r1, #0
    2cd4:	e3a00001 	mov	r0, #1
    2cd8:	eb0008cd 	bl	5014 <printf>
      exit();
    2cdc:	eb00073b 	bl	49d0 <exit>
    }
    total += cc;
    2ce0:	e51b200c 	ldr	r2, [fp, #-12]
    2ce4:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
    2ce8:	e0823003 	add	r3, r2, r3
    2cec:	e50b300c 	str	r3, [fp, #-12]
  for(i = 0; ; i++){
    2cf0:	e51b3008 	ldr	r3, [fp, #-8]
    2cf4:	e2833001 	add	r3, r3, #1
    2cf8:	e50b3008 	str	r3, [fp, #-8]
    cc = read(fd, buf, 300);
    2cfc:	eaffffc5 	b	2c18 <bigfile+0x114>
      break;
    2d00:	e320f000 	nop	{0}
  }
  close(fd);
    2d04:	e51b0010 	ldr	r0, [fp, #-16]
    2d08:	eb000771 	bl	4ad4 <close>
  if(total != 20*600){
    2d0c:	e51b300c 	ldr	r3, [fp, #-12]
    2d10:	e3022ee0 	movw	r2, #12000	@ 0x2ee0
    2d14:	e1530002 	cmp	r3, r2
    2d18:	0a000004 	beq	2d30 <bigfile+0x22c>
    printf(1, "read bigfile wrong total\n");
    2d1c:	e30614cc 	movw	r1, #25804	@ 0x64cc
    2d20:	e3401000 	movt	r1, #0
    2d24:	e3a00001 	mov	r0, #1
    2d28:	eb0008b9 	bl	5014 <printf>
    exit();
    2d2c:	eb000727 	bl	49d0 <exit>
  }
  unlink("bigfile");
    2d30:	e3060434 	movw	r0, #25652	@ 0x6434
    2d34:	e3400000 	movt	r0, #0
    2d38:	eb0007a6 	bl	4bd8 <unlink>

  printf(1, "bigfile test ok\n");
    2d3c:	e30614e8 	movw	r1, #25832	@ 0x64e8
    2d40:	e3401000 	movt	r1, #0
    2d44:	e3a00001 	mov	r0, #1
    2d48:	eb0008b1 	bl	5014 <printf>
}
    2d4c:	e320f000 	nop	{0}
    2d50:	e24bd004 	sub	sp, fp, #4
    2d54:	e8bd8800 	pop	{fp, pc}

00002d58 <fourteen>:

void
fourteen(void)
{
    2d58:	e92d4800 	push	{fp, lr}
    2d5c:	e28db004 	add	fp, sp, #4
    2d60:	e24dd008 	sub	sp, sp, #8
  int fd;

  // DIRSIZ is 14.
  printf(1, "fourteen test\n");
    2d64:	e30614fc 	movw	r1, #25852	@ 0x64fc
    2d68:	e3401000 	movt	r1, #0
    2d6c:	e3a00001 	mov	r0, #1
    2d70:	eb0008a7 	bl	5014 <printf>

  if(mkdir("12345678901234") != 0){
    2d74:	e306050c 	movw	r0, #25868	@ 0x650c
    2d78:	e3400000 	movt	r0, #0
    2d7c:	eb0007bc 	bl	4c74 <mkdir>
    2d80:	e1a03000 	mov	r3, r0
    2d84:	e3530000 	cmp	r3, #0
    2d88:	0a000004 	beq	2da0 <fourteen+0x48>
    printf(1, "mkdir 12345678901234 failed\n");
    2d8c:	e306151c 	movw	r1, #25884	@ 0x651c
    2d90:	e3401000 	movt	r1, #0
    2d94:	e3a00001 	mov	r0, #1
    2d98:	eb00089d 	bl	5014 <printf>
    exit();
    2d9c:	eb00070b 	bl	49d0 <exit>
  }
  if(mkdir("12345678901234/123456789012345") != 0){
    2da0:	e306053c 	movw	r0, #25916	@ 0x653c
    2da4:	e3400000 	movt	r0, #0
    2da8:	eb0007b1 	bl	4c74 <mkdir>
    2dac:	e1a03000 	mov	r3, r0
    2db0:	e3530000 	cmp	r3, #0
    2db4:	0a000004 	beq	2dcc <fourteen+0x74>
    printf(1, "mkdir 12345678901234/123456789012345 failed\n");
    2db8:	e306155c 	movw	r1, #25948	@ 0x655c
    2dbc:	e3401000 	movt	r1, #0
    2dc0:	e3a00001 	mov	r0, #1
    2dc4:	eb000892 	bl	5014 <printf>
    exit();
    2dc8:	eb000700 	bl	49d0 <exit>
  }
  fd = open("123456789012345/123456789012345/123456789012345", O_CREATE);
    2dcc:	e3a01c02 	mov	r1, #512	@ 0x200
    2dd0:	e306058c 	movw	r0, #25996	@ 0x658c
    2dd4:	e3400000 	movt	r0, #0
    2dd8:	eb000764 	bl	4b70 <open>
    2ddc:	e50b0008 	str	r0, [fp, #-8]
  if(fd < 0){
    2de0:	e51b3008 	ldr	r3, [fp, #-8]
    2de4:	e3530000 	cmp	r3, #0
    2de8:	aa000004 	bge	2e00 <fourteen+0xa8>
    printf(1, "create 123456789012345/123456789012345/123456789012345 failed\n");
    2dec:	e30615bc 	movw	r1, #26044	@ 0x65bc
    2df0:	e3401000 	movt	r1, #0
    2df4:	e3a00001 	mov	r0, #1
    2df8:	eb000885 	bl	5014 <printf>
    exit();
    2dfc:	eb0006f3 	bl	49d0 <exit>
  }
  close(fd);
    2e00:	e51b0008 	ldr	r0, [fp, #-8]
    2e04:	eb000732 	bl	4ad4 <close>
  fd = open("12345678901234/12345678901234/12345678901234", 0);
    2e08:	e3a01000 	mov	r1, #0
    2e0c:	e30605fc 	movw	r0, #26108	@ 0x65fc
    2e10:	e3400000 	movt	r0, #0
    2e14:	eb000755 	bl	4b70 <open>
    2e18:	e50b0008 	str	r0, [fp, #-8]
  if(fd < 0){
    2e1c:	e51b3008 	ldr	r3, [fp, #-8]
    2e20:	e3530000 	cmp	r3, #0
    2e24:	aa000004 	bge	2e3c <fourteen+0xe4>
    printf(1, "open 12345678901234/12345678901234/12345678901234 failed\n");
    2e28:	e306162c 	movw	r1, #26156	@ 0x662c
    2e2c:	e3401000 	movt	r1, #0
    2e30:	e3a00001 	mov	r0, #1
    2e34:	eb000876 	bl	5014 <printf>
    exit();
    2e38:	eb0006e4 	bl	49d0 <exit>
  }
  close(fd);
    2e3c:	e51b0008 	ldr	r0, [fp, #-8]
    2e40:	eb000723 	bl	4ad4 <close>

  if(mkdir("12345678901234/12345678901234") == 0){
    2e44:	e3060668 	movw	r0, #26216	@ 0x6668
    2e48:	e3400000 	movt	r0, #0
    2e4c:	eb000788 	bl	4c74 <mkdir>
    2e50:	e1a03000 	mov	r3, r0
    2e54:	e3530000 	cmp	r3, #0
    2e58:	1a000004 	bne	2e70 <fourteen+0x118>
    printf(1, "mkdir 12345678901234/12345678901234 succeeded!\n");
    2e5c:	e3061688 	movw	r1, #26248	@ 0x6688
    2e60:	e3401000 	movt	r1, #0
    2e64:	e3a00001 	mov	r0, #1
    2e68:	eb000869 	bl	5014 <printf>
    exit();
    2e6c:	eb0006d7 	bl	49d0 <exit>
  }
  if(mkdir("123456789012345/12345678901234") == 0){
    2e70:	e30606b8 	movw	r0, #26296	@ 0x66b8
    2e74:	e3400000 	movt	r0, #0
    2e78:	eb00077d 	bl	4c74 <mkdir>
    2e7c:	e1a03000 	mov	r3, r0
    2e80:	e3530000 	cmp	r3, #0
    2e84:	1a000004 	bne	2e9c <fourteen+0x144>
    printf(1, "mkdir 12345678901234/123456789012345 succeeded!\n");
    2e88:	e30616d8 	movw	r1, #26328	@ 0x66d8
    2e8c:	e3401000 	movt	r1, #0
    2e90:	e3a00001 	mov	r0, #1
    2e94:	eb00085e 	bl	5014 <printf>
    exit();
    2e98:	eb0006cc 	bl	49d0 <exit>
  }

  printf(1, "fourteen ok\n");
    2e9c:	e306170c 	movw	r1, #26380	@ 0x670c
    2ea0:	e3401000 	movt	r1, #0
    2ea4:	e3a00001 	mov	r0, #1
    2ea8:	eb000859 	bl	5014 <printf>
}
    2eac:	e320f000 	nop	{0}
    2eb0:	e24bd004 	sub	sp, fp, #4
    2eb4:	e8bd8800 	pop	{fp, pc}

00002eb8 <rmdot>:

void
rmdot(void)
{
    2eb8:	e92d4800 	push	{fp, lr}
    2ebc:	e28db004 	add	fp, sp, #4
  printf(1, "rmdot test\n");
    2ec0:	e306171c 	movw	r1, #26396	@ 0x671c
    2ec4:	e3401000 	movt	r1, #0
    2ec8:	e3a00001 	mov	r0, #1
    2ecc:	eb000850 	bl	5014 <printf>
  if(mkdir("dots") != 0){
    2ed0:	e3060728 	movw	r0, #26408	@ 0x6728
    2ed4:	e3400000 	movt	r0, #0
    2ed8:	eb000765 	bl	4c74 <mkdir>
    2edc:	e1a03000 	mov	r3, r0
    2ee0:	e3530000 	cmp	r3, #0
    2ee4:	0a000004 	beq	2efc <rmdot+0x44>
    printf(1, "mkdir dots failed\n");
    2ee8:	e3061730 	movw	r1, #26416	@ 0x6730
    2eec:	e3401000 	movt	r1, #0
    2ef0:	e3a00001 	mov	r0, #1
    2ef4:	eb000846 	bl	5014 <printf>
    exit();
    2ef8:	eb0006b4 	bl	49d0 <exit>
  }
  if(chdir("dots") != 0){
    2efc:	e3060728 	movw	r0, #26408	@ 0x6728
    2f00:	e3400000 	movt	r0, #0
    2f04:	eb000767 	bl	4ca8 <chdir>
    2f08:	e1a03000 	mov	r3, r0
    2f0c:	e3530000 	cmp	r3, #0
    2f10:	0a000004 	beq	2f28 <rmdot+0x70>
    printf(1, "chdir dots failed\n");
    2f14:	e3061744 	movw	r1, #26436	@ 0x6744
    2f18:	e3401000 	movt	r1, #0
    2f1c:	e3a00001 	mov	r0, #1
    2f20:	eb00083b 	bl	5014 <printf>
    exit();
    2f24:	eb0006a9 	bl	49d0 <exit>
  }
  if(unlink(".") == 0){
    2f28:	e3050dd0 	movw	r0, #24016	@ 0x5dd0
    2f2c:	e3400000 	movt	r0, #0
    2f30:	eb000728 	bl	4bd8 <unlink>
    2f34:	e1a03000 	mov	r3, r0
    2f38:	e3530000 	cmp	r3, #0
    2f3c:	1a000004 	bne	2f54 <rmdot+0x9c>
    printf(1, "rm . worked!\n");
    2f40:	e3061758 	movw	r1, #26456	@ 0x6758
    2f44:	e3401000 	movt	r1, #0
    2f48:	e3a00001 	mov	r0, #1
    2f4c:	eb000830 	bl	5014 <printf>
    exit();
    2f50:	eb00069e 	bl	49d0 <exit>
  }
  if(unlink("..") == 0){
    2f54:	e3050900 	movw	r0, #22784	@ 0x5900
    2f58:	e3400000 	movt	r0, #0
    2f5c:	eb00071d 	bl	4bd8 <unlink>
    2f60:	e1a03000 	mov	r3, r0
    2f64:	e3530000 	cmp	r3, #0
    2f68:	1a000004 	bne	2f80 <rmdot+0xc8>
    printf(1, "rm .. worked!\n");
    2f6c:	e3061768 	movw	r1, #26472	@ 0x6768
    2f70:	e3401000 	movt	r1, #0
    2f74:	e3a00001 	mov	r0, #1
    2f78:	eb000825 	bl	5014 <printf>
    exit();
    2f7c:	eb000693 	bl	49d0 <exit>
  }
  if(chdir("/") != 0){
    2f80:	e3060778 	movw	r0, #26488	@ 0x6778
    2f84:	e3400000 	movt	r0, #0
    2f88:	eb000746 	bl	4ca8 <chdir>
    2f8c:	e1a03000 	mov	r3, r0
    2f90:	e3530000 	cmp	r3, #0
    2f94:	0a000004 	beq	2fac <rmdot+0xf4>
    printf(1, "chdir / failed\n");
    2f98:	e306177c 	movw	r1, #26492	@ 0x677c
    2f9c:	e3401000 	movt	r1, #0
    2fa0:	e3a00001 	mov	r0, #1
    2fa4:	eb00081a 	bl	5014 <printf>
    exit();
    2fa8:	eb000688 	bl	49d0 <exit>
  }
  if(unlink("dots/.") == 0){
    2fac:	e306078c 	movw	r0, #26508	@ 0x678c
    2fb0:	e3400000 	movt	r0, #0
    2fb4:	eb000707 	bl	4bd8 <unlink>
    2fb8:	e1a03000 	mov	r3, r0
    2fbc:	e3530000 	cmp	r3, #0
    2fc0:	1a000004 	bne	2fd8 <rmdot+0x120>
    printf(1, "unlink dots/. worked!\n");
    2fc4:	e3061794 	movw	r1, #26516	@ 0x6794
    2fc8:	e3401000 	movt	r1, #0
    2fcc:	e3a00001 	mov	r0, #1
    2fd0:	eb00080f 	bl	5014 <printf>
    exit();
    2fd4:	eb00067d 	bl	49d0 <exit>
  }
  if(unlink("dots/..") == 0){
    2fd8:	e30607ac 	movw	r0, #26540	@ 0x67ac
    2fdc:	e3400000 	movt	r0, #0
    2fe0:	eb0006fc 	bl	4bd8 <unlink>
    2fe4:	e1a03000 	mov	r3, r0
    2fe8:	e3530000 	cmp	r3, #0
    2fec:	1a000004 	bne	3004 <rmdot+0x14c>
    printf(1, "unlink dots/.. worked!\n");
    2ff0:	e30617b4 	movw	r1, #26548	@ 0x67b4
    2ff4:	e3401000 	movt	r1, #0
    2ff8:	e3a00001 	mov	r0, #1
    2ffc:	eb000804 	bl	5014 <printf>
    exit();
    3000:	eb000672 	bl	49d0 <exit>
  }
  if(unlink("dots") != 0){
    3004:	e3060728 	movw	r0, #26408	@ 0x6728
    3008:	e3400000 	movt	r0, #0
    300c:	eb0006f1 	bl	4bd8 <unlink>
    3010:	e1a03000 	mov	r3, r0
    3014:	e3530000 	cmp	r3, #0
    3018:	0a000004 	beq	3030 <rmdot+0x178>
    printf(1, "unlink dots failed!\n");
    301c:	e30617cc 	movw	r1, #26572	@ 0x67cc
    3020:	e3401000 	movt	r1, #0
    3024:	e3a00001 	mov	r0, #1
    3028:	eb0007f9 	bl	5014 <printf>
    exit();
    302c:	eb000667 	bl	49d0 <exit>
  }
  printf(1, "rmdot ok\n");
    3030:	e30617e4 	movw	r1, #26596	@ 0x67e4
    3034:	e3401000 	movt	r1, #0
    3038:	e3a00001 	mov	r0, #1
    303c:	eb0007f4 	bl	5014 <printf>
}
    3040:	e320f000 	nop	{0}
    3044:	e8bd8800 	pop	{fp, pc}

00003048 <dirfile>:

void
dirfile(void)
{
    3048:	e92d4800 	push	{fp, lr}
    304c:	e28db004 	add	fp, sp, #4
    3050:	e24dd008 	sub	sp, sp, #8
  int fd;

  printf(1, "dir vs file\n");
    3054:	e30617f0 	movw	r1, #26608	@ 0x67f0
    3058:	e3401000 	movt	r1, #0
    305c:	e3a00001 	mov	r0, #1
    3060:	eb0007eb 	bl	5014 <printf>

  fd = open("dirfile", O_CREATE);
    3064:	e3a01c02 	mov	r1, #512	@ 0x200
    3068:	e3060800 	movw	r0, #26624	@ 0x6800
    306c:	e3400000 	movt	r0, #0
    3070:	eb0006be 	bl	4b70 <open>
    3074:	e50b0008 	str	r0, [fp, #-8]
  if(fd < 0){
    3078:	e51b3008 	ldr	r3, [fp, #-8]
    307c:	e3530000 	cmp	r3, #0
    3080:	aa000004 	bge	3098 <dirfile+0x50>
    printf(1, "create dirfile failed\n");
    3084:	e3061808 	movw	r1, #26632	@ 0x6808
    3088:	e3401000 	movt	r1, #0
    308c:	e3a00001 	mov	r0, #1
    3090:	eb0007df 	bl	5014 <printf>
    exit();
    3094:	eb00064d 	bl	49d0 <exit>
  }
  close(fd);
    3098:	e51b0008 	ldr	r0, [fp, #-8]
    309c:	eb00068c 	bl	4ad4 <close>
  if(chdir("dirfile") == 0){
    30a0:	e3060800 	movw	r0, #26624	@ 0x6800
    30a4:	e3400000 	movt	r0, #0
    30a8:	eb0006fe 	bl	4ca8 <chdir>
    30ac:	e1a03000 	mov	r3, r0
    30b0:	e3530000 	cmp	r3, #0
    30b4:	1a000004 	bne	30cc <dirfile+0x84>
    printf(1, "chdir dirfile succeeded!\n");
    30b8:	e3061820 	movw	r1, #26656	@ 0x6820
    30bc:	e3401000 	movt	r1, #0
    30c0:	e3a00001 	mov	r0, #1
    30c4:	eb0007d2 	bl	5014 <printf>
    exit();
    30c8:	eb000640 	bl	49d0 <exit>
  }
  fd = open("dirfile/xx", 0);
    30cc:	e3a01000 	mov	r1, #0
    30d0:	e306083c 	movw	r0, #26684	@ 0x683c
    30d4:	e3400000 	movt	r0, #0
    30d8:	eb0006a4 	bl	4b70 <open>
    30dc:	e50b0008 	str	r0, [fp, #-8]
  if(fd >= 0){
    30e0:	e51b3008 	ldr	r3, [fp, #-8]
    30e4:	e3530000 	cmp	r3, #0
    30e8:	ba000004 	blt	3100 <dirfile+0xb8>
    printf(1, "create dirfile/xx succeeded!\n");
    30ec:	e3061848 	movw	r1, #26696	@ 0x6848
    30f0:	e3401000 	movt	r1, #0
    30f4:	e3a00001 	mov	r0, #1
    30f8:	eb0007c5 	bl	5014 <printf>
    exit();
    30fc:	eb000633 	bl	49d0 <exit>
  }
  fd = open("dirfile/xx", O_CREATE);
    3100:	e3a01c02 	mov	r1, #512	@ 0x200
    3104:	e306083c 	movw	r0, #26684	@ 0x683c
    3108:	e3400000 	movt	r0, #0
    310c:	eb000697 	bl	4b70 <open>
    3110:	e50b0008 	str	r0, [fp, #-8]
  if(fd >= 0){
    3114:	e51b3008 	ldr	r3, [fp, #-8]
    3118:	e3530000 	cmp	r3, #0
    311c:	ba000004 	blt	3134 <dirfile+0xec>
    printf(1, "create dirfile/xx succeeded!\n");
    3120:	e3061848 	movw	r1, #26696	@ 0x6848
    3124:	e3401000 	movt	r1, #0
    3128:	e3a00001 	mov	r0, #1
    312c:	eb0007b8 	bl	5014 <printf>
    exit();
    3130:	eb000626 	bl	49d0 <exit>
  }
  if(mkdir("dirfile/xx") == 0){
    3134:	e306083c 	movw	r0, #26684	@ 0x683c
    3138:	e3400000 	movt	r0, #0
    313c:	eb0006cc 	bl	4c74 <mkdir>
    3140:	e1a03000 	mov	r3, r0
    3144:	e3530000 	cmp	r3, #0
    3148:	1a000004 	bne	3160 <dirfile+0x118>
    printf(1, "mkdir dirfile/xx succeeded!\n");
    314c:	e3061868 	movw	r1, #26728	@ 0x6868
    3150:	e3401000 	movt	r1, #0
    3154:	e3a00001 	mov	r0, #1
    3158:	eb0007ad 	bl	5014 <printf>
    exit();
    315c:	eb00061b 	bl	49d0 <exit>
  }
  if(unlink("dirfile/xx") == 0){
    3160:	e306083c 	movw	r0, #26684	@ 0x683c
    3164:	e3400000 	movt	r0, #0
    3168:	eb00069a 	bl	4bd8 <unlink>
    316c:	e1a03000 	mov	r3, r0
    3170:	e3530000 	cmp	r3, #0
    3174:	1a000004 	bne	318c <dirfile+0x144>
    printf(1, "unlink dirfile/xx succeeded!\n");
    3178:	e3061888 	movw	r1, #26760	@ 0x6888
    317c:	e3401000 	movt	r1, #0
    3180:	e3a00001 	mov	r0, #1
    3184:	eb0007a2 	bl	5014 <printf>
    exit();
    3188:	eb000610 	bl	49d0 <exit>
  }
  if(link("README", "dirfile/xx") == 0){
    318c:	e306183c 	movw	r1, #26684	@ 0x683c
    3190:	e3401000 	movt	r1, #0
    3194:	e30608a8 	movw	r0, #26792	@ 0x68a8
    3198:	e3400000 	movt	r0, #0
    319c:	eb0006a7 	bl	4c40 <link>
    31a0:	e1a03000 	mov	r3, r0
    31a4:	e3530000 	cmp	r3, #0
    31a8:	1a000004 	bne	31c0 <dirfile+0x178>
    printf(1, "link to dirfile/xx succeeded!\n");
    31ac:	e30618b0 	movw	r1, #26800	@ 0x68b0
    31b0:	e3401000 	movt	r1, #0
    31b4:	e3a00001 	mov	r0, #1
    31b8:	eb000795 	bl	5014 <printf>
    exit();
    31bc:	eb000603 	bl	49d0 <exit>
  }
  if(unlink("dirfile") != 0){
    31c0:	e3060800 	movw	r0, #26624	@ 0x6800
    31c4:	e3400000 	movt	r0, #0
    31c8:	eb000682 	bl	4bd8 <unlink>
    31cc:	e1a03000 	mov	r3, r0
    31d0:	e3530000 	cmp	r3, #0
    31d4:	0a000004 	beq	31ec <dirfile+0x1a4>
    printf(1, "unlink dirfile failed!\n");
    31d8:	e30618d0 	movw	r1, #26832	@ 0x68d0
    31dc:	e3401000 	movt	r1, #0
    31e0:	e3a00001 	mov	r0, #1
    31e4:	eb00078a 	bl	5014 <printf>
    exit();
    31e8:	eb0005f8 	bl	49d0 <exit>
  }

  fd = open(".", O_RDWR);
    31ec:	e3a01002 	mov	r1, #2
    31f0:	e3050dd0 	movw	r0, #24016	@ 0x5dd0
    31f4:	e3400000 	movt	r0, #0
    31f8:	eb00065c 	bl	4b70 <open>
    31fc:	e50b0008 	str	r0, [fp, #-8]
  if(fd >= 0){
    3200:	e51b3008 	ldr	r3, [fp, #-8]
    3204:	e3530000 	cmp	r3, #0
    3208:	ba000004 	blt	3220 <dirfile+0x1d8>
    printf(1, "open . for writing succeeded!\n");
    320c:	e30618e8 	movw	r1, #26856	@ 0x68e8
    3210:	e3401000 	movt	r1, #0
    3214:	e3a00001 	mov	r0, #1
    3218:	eb00077d 	bl	5014 <printf>
    exit();
    321c:	eb0005eb 	bl	49d0 <exit>
  }
  fd = open(".", 0);
    3220:	e3a01000 	mov	r1, #0
    3224:	e3050dd0 	movw	r0, #24016	@ 0x5dd0
    3228:	e3400000 	movt	r0, #0
    322c:	eb00064f 	bl	4b70 <open>
    3230:	e50b0008 	str	r0, [fp, #-8]
  if(write(fd, "x", 1) > 0){
    3234:	e3a02001 	mov	r2, #1
    3238:	e30519bc 	movw	r1, #22972	@ 0x59bc
    323c:	e3401000 	movt	r1, #0
    3240:	e51b0008 	ldr	r0, [fp, #-8]
    3244:	eb000615 	bl	4aa0 <write>
    3248:	e1a03000 	mov	r3, r0
    324c:	e3530000 	cmp	r3, #0
    3250:	da000004 	ble	3268 <dirfile+0x220>
    printf(1, "write . succeeded!\n");
    3254:	e3061908 	movw	r1, #26888	@ 0x6908
    3258:	e3401000 	movt	r1, #0
    325c:	e3a00001 	mov	r0, #1
    3260:	eb00076b 	bl	5014 <printf>
    exit();
    3264:	eb0005d9 	bl	49d0 <exit>
  }
  close(fd);
    3268:	e51b0008 	ldr	r0, [fp, #-8]
    326c:	eb000618 	bl	4ad4 <close>

  printf(1, "dir vs file OK\n");
    3270:	e306191c 	movw	r1, #26908	@ 0x691c
    3274:	e3401000 	movt	r1, #0
    3278:	e3a00001 	mov	r0, #1
    327c:	eb000764 	bl	5014 <printf>
}
    3280:	e320f000 	nop	{0}
    3284:	e24bd004 	sub	sp, fp, #4
    3288:	e8bd8800 	pop	{fp, pc}

0000328c <iref>:

// test that iput() is called at the end of _namei()
void
iref(void)
{
    328c:	e92d4800 	push	{fp, lr}
    3290:	e28db004 	add	fp, sp, #4
    3294:	e24dd008 	sub	sp, sp, #8
  int i, fd;

  printf(1, "empty file name\n");
    3298:	e306192c 	movw	r1, #26924	@ 0x692c
    329c:	e3401000 	movt	r1, #0
    32a0:	e3a00001 	mov	r0, #1
    32a4:	eb00075a 	bl	5014 <printf>

  // the 50 is NINODE
  for(i = 0; i < 50 + 1; i++){
    32a8:	e3a03000 	mov	r3, #0
    32ac:	e50b3008 	str	r3, [fp, #-8]
    32b0:	ea000037 	b	3394 <iref+0x108>
    if(mkdir("irefd") != 0){
    32b4:	e3060940 	movw	r0, #26944	@ 0x6940
    32b8:	e3400000 	movt	r0, #0
    32bc:	eb00066c 	bl	4c74 <mkdir>
    32c0:	e1a03000 	mov	r3, r0
    32c4:	e3530000 	cmp	r3, #0
    32c8:	0a000004 	beq	32e0 <iref+0x54>
      printf(1, "mkdir irefd failed\n");
    32cc:	e3061948 	movw	r1, #26952	@ 0x6948
    32d0:	e3401000 	movt	r1, #0
    32d4:	e3a00001 	mov	r0, #1
    32d8:	eb00074d 	bl	5014 <printf>
      exit();
    32dc:	eb0005bb 	bl	49d0 <exit>
    }
    if(chdir("irefd") != 0){
    32e0:	e3060940 	movw	r0, #26944	@ 0x6940
    32e4:	e3400000 	movt	r0, #0
    32e8:	eb00066e 	bl	4ca8 <chdir>
    32ec:	e1a03000 	mov	r3, r0
    32f0:	e3530000 	cmp	r3, #0
    32f4:	0a000004 	beq	330c <iref+0x80>
      printf(1, "chdir irefd failed\n");
    32f8:	e306195c 	movw	r1, #26972	@ 0x695c
    32fc:	e3401000 	movt	r1, #0
    3300:	e3a00001 	mov	r0, #1
    3304:	eb000742 	bl	5014 <printf>
      exit();
    3308:	eb0005b0 	bl	49d0 <exit>
    }

    mkdir("");
    330c:	e3060970 	movw	r0, #26992	@ 0x6970
    3310:	e3400000 	movt	r0, #0
    3314:	eb000656 	bl	4c74 <mkdir>
    link("README", "");
    3318:	e3061970 	movw	r1, #26992	@ 0x6970
    331c:	e3401000 	movt	r1, #0
    3320:	e30608a8 	movw	r0, #26792	@ 0x68a8
    3324:	e3400000 	movt	r0, #0
    3328:	eb000644 	bl	4c40 <link>
    fd = open("", O_CREATE);
    332c:	e3a01c02 	mov	r1, #512	@ 0x200
    3330:	e3060970 	movw	r0, #26992	@ 0x6970
    3334:	e3400000 	movt	r0, #0
    3338:	eb00060c 	bl	4b70 <open>
    333c:	e50b000c 	str	r0, [fp, #-12]
    if(fd >= 0)
    3340:	e51b300c 	ldr	r3, [fp, #-12]
    3344:	e3530000 	cmp	r3, #0
    3348:	ba000001 	blt	3354 <iref+0xc8>
      close(fd);
    334c:	e51b000c 	ldr	r0, [fp, #-12]
    3350:	eb0005df 	bl	4ad4 <close>
    fd = open("xx", O_CREATE);
    3354:	e3a01c02 	mov	r1, #512	@ 0x200
    3358:	e3060974 	movw	r0, #26996	@ 0x6974
    335c:	e3400000 	movt	r0, #0
    3360:	eb000602 	bl	4b70 <open>
    3364:	e50b000c 	str	r0, [fp, #-12]
    if(fd >= 0)
    3368:	e51b300c 	ldr	r3, [fp, #-12]
    336c:	e3530000 	cmp	r3, #0
    3370:	ba000001 	blt	337c <iref+0xf0>
      close(fd);
    3374:	e51b000c 	ldr	r0, [fp, #-12]
    3378:	eb0005d5 	bl	4ad4 <close>
    unlink("xx");
    337c:	e3060974 	movw	r0, #26996	@ 0x6974
    3380:	e3400000 	movt	r0, #0
    3384:	eb000613 	bl	4bd8 <unlink>
  for(i = 0; i < 50 + 1; i++){
    3388:	e51b3008 	ldr	r3, [fp, #-8]
    338c:	e2833001 	add	r3, r3, #1
    3390:	e50b3008 	str	r3, [fp, #-8]
    3394:	e51b3008 	ldr	r3, [fp, #-8]
    3398:	e3530032 	cmp	r3, #50	@ 0x32
    339c:	daffffc4 	ble	32b4 <iref+0x28>
  }

  chdir("/");
    33a0:	e3060778 	movw	r0, #26488	@ 0x6778
    33a4:	e3400000 	movt	r0, #0
    33a8:	eb00063e 	bl	4ca8 <chdir>
  printf(1, "empty file name OK\n");
    33ac:	e3061978 	movw	r1, #27000	@ 0x6978
    33b0:	e3401000 	movt	r1, #0
    33b4:	e3a00001 	mov	r0, #1
    33b8:	eb000715 	bl	5014 <printf>
}
    33bc:	e320f000 	nop	{0}
    33c0:	e24bd004 	sub	sp, fp, #4
    33c4:	e8bd8800 	pop	{fp, pc}

000033c8 <forktest>:
// test that fork fails gracefully
// the forktest binary also does this, but it runs out of proc entries first.
// inside the bigger usertests binary, we run out of memory first.
void
forktest(void)
{
    33c8:	e92d4800 	push	{fp, lr}
    33cc:	e28db004 	add	fp, sp, #4
    33d0:	e24dd008 	sub	sp, sp, #8
  int n, pid;

  printf(1, "fork test\n");
    33d4:	e306198c 	movw	r1, #27020	@ 0x698c
    33d8:	e3401000 	movt	r1, #0
    33dc:	e3a00001 	mov	r0, #1
    33e0:	eb00070b 	bl	5014 <printf>

  for(n=0; n<1000; n++){
    33e4:	e3a03000 	mov	r3, #0
    33e8:	e50b3008 	str	r3, [fp, #-8]
    33ec:	ea00000b 	b	3420 <forktest+0x58>
    pid = fork();
    33f0:	eb000569 	bl	499c <fork>
    33f4:	e50b000c 	str	r0, [fp, #-12]
    if(pid < 0)
    33f8:	e51b300c 	ldr	r3, [fp, #-12]
    33fc:	e3530000 	cmp	r3, #0
    3400:	ba00000a 	blt	3430 <forktest+0x68>
      break;
    if(pid == 0)
    3404:	e51b300c 	ldr	r3, [fp, #-12]
    3408:	e3530000 	cmp	r3, #0
    340c:	1a000000 	bne	3414 <forktest+0x4c>
      exit();
    3410:	eb00056e 	bl	49d0 <exit>
  for(n=0; n<1000; n++){
    3414:	e51b3008 	ldr	r3, [fp, #-8]
    3418:	e2833001 	add	r3, r3, #1
    341c:	e50b3008 	str	r3, [fp, #-8]
    3420:	e51b3008 	ldr	r3, [fp, #-8]
    3424:	e3530ffa 	cmp	r3, #1000	@ 0x3e8
    3428:	bafffff0 	blt	33f0 <forktest+0x28>
    342c:	ea000000 	b	3434 <forktest+0x6c>
      break;
    3430:	e320f000 	nop	{0}
  }
  
  if(n == 1000){
    3434:	e51b3008 	ldr	r3, [fp, #-8]
    3438:	e3530ffa 	cmp	r3, #1000	@ 0x3e8
    343c:	1a000010 	bne	3484 <forktest+0xbc>
    printf(1, "fork claimed to work 1000 times!\n");
    3440:	e3061998 	movw	r1, #27032	@ 0x6998
    3444:	e3401000 	movt	r1, #0
    3448:	e3a00001 	mov	r0, #1
    344c:	eb0006f0 	bl	5014 <printf>
    exit();
    3450:	eb00055e 	bl	49d0 <exit>
  }
  
  for(; n > 0; n--){
    if(wait() < 0){
    3454:	eb00056a 	bl	4a04 <wait>
    3458:	e1a03000 	mov	r3, r0
    345c:	e3530000 	cmp	r3, #0
    3460:	aa000004 	bge	3478 <forktest+0xb0>
      printf(1, "wait stopped early\n");
    3464:	e30619bc 	movw	r1, #27068	@ 0x69bc
    3468:	e3401000 	movt	r1, #0
    346c:	e3a00001 	mov	r0, #1
    3470:	eb0006e7 	bl	5014 <printf>
      exit();
    3474:	eb000555 	bl	49d0 <exit>
  for(; n > 0; n--){
    3478:	e51b3008 	ldr	r3, [fp, #-8]
    347c:	e2433001 	sub	r3, r3, #1
    3480:	e50b3008 	str	r3, [fp, #-8]
    3484:	e51b3008 	ldr	r3, [fp, #-8]
    3488:	e3530000 	cmp	r3, #0
    348c:	cafffff0 	bgt	3454 <forktest+0x8c>
    }
  }
  
  if(wait() != -1){
    3490:	eb00055b 	bl	4a04 <wait>
    3494:	e1a03000 	mov	r3, r0
    3498:	e3730001 	cmn	r3, #1
    349c:	0a000004 	beq	34b4 <forktest+0xec>
    printf(1, "wait got too many\n");
    34a0:	e30619d0 	movw	r1, #27088	@ 0x69d0
    34a4:	e3401000 	movt	r1, #0
    34a8:	e3a00001 	mov	r0, #1
    34ac:	eb0006d8 	bl	5014 <printf>
    exit();
    34b0:	eb000546 	bl	49d0 <exit>
  }
  
  printf(1, "fork test OK\n");
    34b4:	e30619e4 	movw	r1, #27108	@ 0x69e4
    34b8:	e3401000 	movt	r1, #0
    34bc:	e3a00001 	mov	r0, #1
    34c0:	eb0006d3 	bl	5014 <printf>
}
    34c4:	e320f000 	nop	{0}
    34c8:	e24bd004 	sub	sp, fp, #4
    34cc:	e8bd8800 	pop	{fp, pc}

000034d0 <sbrktest>:

void
sbrktest(void)
{
    34d0:	e92d4800 	push	{fp, lr}
    34d4:	e28db004 	add	fp, sp, #4
    34d8:	e24dd050 	sub	sp, sp, #80	@ 0x50
  int fds[2], pid, pids[5], ppid;
  char *a, *b, *c, *lastaddr, *oldbrk, *p, scratch;
  uint amt;

  printf(stdout, "sbrk test\n");
    34dc:	e3073064 	movw	r3, #28772	@ 0x7064
    34e0:	e3403000 	movt	r3, #0
    34e4:	e5933000 	ldr	r3, [r3]
    34e8:	e30619f4 	movw	r1, #27124	@ 0x69f4
    34ec:	e3401000 	movt	r1, #0
    34f0:	e1a00003 	mov	r0, r3
    34f4:	eb0006c6 	bl	5014 <printf>
  oldbrk = sbrk(0);
    34f8:	e3a00000 	mov	r0, #0
    34fc:	eb000610 	bl	4d44 <sbrk>
    3500:	e50b0010 	str	r0, [fp, #-16]

  // can one sbrk() less than a page?
  printf(stdout, "test #1 sbrk() less than a page?\n");
    3504:	e3073064 	movw	r3, #28772	@ 0x7064
    3508:	e3403000 	movt	r3, #0
    350c:	e5933000 	ldr	r3, [r3]
    3510:	e3061a00 	movw	r1, #27136	@ 0x6a00
    3514:	e3401000 	movt	r1, #0
    3518:	e1a00003 	mov	r0, r3
    351c:	eb0006bc 	bl	5014 <printf>
  a = sbrk(0);
    3520:	e3a00000 	mov	r0, #0
    3524:	eb000606 	bl	4d44 <sbrk>
    3528:	e50b0008 	str	r0, [fp, #-8]
  int i;
  for(i = 0; i < 5000; i++){ 
    352c:	e3a03000 	mov	r3, #0
    3530:	e50b300c 	str	r3, [fp, #-12]
    3534:	ea00001a 	b	35a4 <sbrktest+0xd4>
    b = sbrk(1);
    3538:	e3a00001 	mov	r0, #1
    353c:	eb000600 	bl	4d44 <sbrk>
    3540:	e50b002c 	str	r0, [fp, #-44]	@ 0xffffffd4
    if(b != a){
    3544:	e51b202c 	ldr	r2, [fp, #-44]	@ 0xffffffd4
    3548:	e51b3008 	ldr	r3, [fp, #-8]
    354c:	e1520003 	cmp	r2, r3
    3550:	0a00000a 	beq	3580 <sbrktest+0xb0>
      printf(stdout, "sbrk test failed %d %x %x\n", i, a, b);
    3554:	e3073064 	movw	r3, #28772	@ 0x7064
    3558:	e3403000 	movt	r3, #0
    355c:	e5930000 	ldr	r0, [r3]
    3560:	e51b302c 	ldr	r3, [fp, #-44]	@ 0xffffffd4
    3564:	e58d3000 	str	r3, [sp]
    3568:	e51b3008 	ldr	r3, [fp, #-8]
    356c:	e51b200c 	ldr	r2, [fp, #-12]
    3570:	e3061a24 	movw	r1, #27172	@ 0x6a24
    3574:	e3401000 	movt	r1, #0
    3578:	eb0006a5 	bl	5014 <printf>
      exit();
    357c:	eb000513 	bl	49d0 <exit>
    }
    *b = 1;
    3580:	e51b302c 	ldr	r3, [fp, #-44]	@ 0xffffffd4
    3584:	e3a02001 	mov	r2, #1
    3588:	e5c32000 	strb	r2, [r3]
    a = b + 1;
    358c:	e51b302c 	ldr	r3, [fp, #-44]	@ 0xffffffd4
    3590:	e2833001 	add	r3, r3, #1
    3594:	e50b3008 	str	r3, [fp, #-8]
  for(i = 0; i < 5000; i++){ 
    3598:	e51b300c 	ldr	r3, [fp, #-12]
    359c:	e2833001 	add	r3, r3, #1
    35a0:	e50b300c 	str	r3, [fp, #-12]
    35a4:	e51b300c 	ldr	r3, [fp, #-12]
    35a8:	e3012387 	movw	r2, #4999	@ 0x1387
    35ac:	e1530002 	cmp	r3, r2
    35b0:	daffffe0 	ble	3538 <sbrktest+0x68>
  }
  printf(stdout, "test #1 done.\n");
    35b4:	e3073064 	movw	r3, #28772	@ 0x7064
    35b8:	e3403000 	movt	r3, #0
    35bc:	e5933000 	ldr	r3, [r3]
    35c0:	e3061a40 	movw	r1, #27200	@ 0x6a40
    35c4:	e3401000 	movt	r1, #0
    35c8:	e1a00003 	mov	r0, r3
    35cc:	eb000690 	bl	5014 <printf>

  printf(stdout, "test #2 test fork?\n");
    35d0:	e3073064 	movw	r3, #28772	@ 0x7064
    35d4:	e3403000 	movt	r3, #0
    35d8:	e5933000 	ldr	r3, [r3]
    35dc:	e3061a50 	movw	r1, #27216	@ 0x6a50
    35e0:	e3401000 	movt	r1, #0
    35e4:	e1a00003 	mov	r0, r3
    35e8:	eb000689 	bl	5014 <printf>
  pid = fork();
    35ec:	eb0004ea 	bl	499c <fork>
    35f0:	e50b0014 	str	r0, [fp, #-20]	@ 0xffffffec
  if(pid < 0){
    35f4:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
    35f8:	e3530000 	cmp	r3, #0
    35fc:	aa000007 	bge	3620 <sbrktest+0x150>
    printf(stdout, "sbrk test fork failed\n");
    3600:	e3073064 	movw	r3, #28772	@ 0x7064
    3604:	e3403000 	movt	r3, #0
    3608:	e5933000 	ldr	r3, [r3]
    360c:	e3061a64 	movw	r1, #27236	@ 0x6a64
    3610:	e3401000 	movt	r1, #0
    3614:	e1a00003 	mov	r0, r3
    3618:	eb00067d 	bl	5014 <printf>
    exit();
    361c:	eb0004eb 	bl	49d0 <exit>
  }
  printf(stdout, "test #2 done.\n");
    3620:	e3073064 	movw	r3, #28772	@ 0x7064
    3624:	e3403000 	movt	r3, #0
    3628:	e5933000 	ldr	r3, [r3]
    362c:	e3061a7c 	movw	r1, #27260	@ 0x6a7c
    3630:	e3401000 	movt	r1, #0
    3634:	e1a00003 	mov	r0, r3
    3638:	eb000675 	bl	5014 <printf>

  printf(stdout, "test #3 post-fork.\n");
    363c:	e3073064 	movw	r3, #28772	@ 0x7064
    3640:	e3403000 	movt	r3, #0
    3644:	e5933000 	ldr	r3, [r3]
    3648:	e3061a8c 	movw	r1, #27276	@ 0x6a8c
    364c:	e3401000 	movt	r1, #0
    3650:	e1a00003 	mov	r0, r3
    3654:	eb00066e 	bl	5014 <printf>
  c = sbrk(1);
    3658:	e3a00001 	mov	r0, #1
    365c:	eb0005b8 	bl	4d44 <sbrk>
    3660:	e50b0018 	str	r0, [fp, #-24]	@ 0xffffffe8
  c = sbrk(1);
    3664:	e3a00001 	mov	r0, #1
    3668:	eb0005b5 	bl	4d44 <sbrk>
    366c:	e50b0018 	str	r0, [fp, #-24]	@ 0xffffffe8
  if(c != a + 1){
    3670:	e51b3008 	ldr	r3, [fp, #-8]
    3674:	e2833001 	add	r3, r3, #1
    3678:	e51b2018 	ldr	r2, [fp, #-24]	@ 0xffffffe8
    367c:	e1520003 	cmp	r2, r3
    3680:	0a000007 	beq	36a4 <sbrktest+0x1d4>
    printf(stdout, "sbrk test failed post-fork\n");
    3684:	e3073064 	movw	r3, #28772	@ 0x7064
    3688:	e3403000 	movt	r3, #0
    368c:	e5933000 	ldr	r3, [r3]
    3690:	e3061aa0 	movw	r1, #27296	@ 0x6aa0
    3694:	e3401000 	movt	r1, #0
    3698:	e1a00003 	mov	r0, r3
    369c:	eb00065c 	bl	5014 <printf>
    exit();
    36a0:	eb0004ca 	bl	49d0 <exit>
  }
  if(pid == 0)
    36a4:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
    36a8:	e3530000 	cmp	r3, #0
    36ac:	1a000000 	bne	36b4 <sbrktest+0x1e4>
    exit();
    36b0:	eb0004c6 	bl	49d0 <exit>
  wait();
    36b4:	eb0004d2 	bl	4a04 <wait>
  printf(stdout, "test #3 done.\n");
    36b8:	e3073064 	movw	r3, #28772	@ 0x7064
    36bc:	e3403000 	movt	r3, #0
    36c0:	e5933000 	ldr	r3, [r3]
    36c4:	e3061abc 	movw	r1, #27324	@ 0x6abc
    36c8:	e3401000 	movt	r1, #0
    36cc:	e1a00003 	mov	r0, r3
    36d0:	eb00064f 	bl	5014 <printf>

  printf(stdout, "test #4 grow address space to something big.\n");
    36d4:	e3073064 	movw	r3, #28772	@ 0x7064
    36d8:	e3403000 	movt	r3, #0
    36dc:	e5933000 	ldr	r3, [r3]
    36e0:	e3061acc 	movw	r1, #27340	@ 0x6acc
    36e4:	e3401000 	movt	r1, #0
    36e8:	e1a00003 	mov	r0, r3
    36ec:	eb000648 	bl	5014 <printf>
  // can one grow address space to something big?
  #define BIG (100*1024*1024)
  a = sbrk(0);
    36f0:	e3a00000 	mov	r0, #0
    36f4:	eb000592 	bl	4d44 <sbrk>
    36f8:	e50b0008 	str	r0, [fp, #-8]
  amt = (BIG) - (uint)a;
    36fc:	e51b3008 	ldr	r3, [fp, #-8]
    3700:	e2633519 	rsb	r3, r3, #104857600	@ 0x6400000
    3704:	e50b301c 	str	r3, [fp, #-28]	@ 0xffffffe4
  p = sbrk(amt);
    3708:	e51b301c 	ldr	r3, [fp, #-28]	@ 0xffffffe4
    370c:	e1a00003 	mov	r0, r3
    3710:	eb00058b 	bl	4d44 <sbrk>
    3714:	e50b0020 	str	r0, [fp, #-32]	@ 0xffffffe0
  if (p != a) { 
    3718:	e51b2020 	ldr	r2, [fp, #-32]	@ 0xffffffe0
    371c:	e51b3008 	ldr	r3, [fp, #-8]
    3720:	e1520003 	cmp	r2, r3
    3724:	0a000007 	beq	3748 <sbrktest+0x278>
    printf(stdout, "sbrk test failed to grow big address space; enough phys mem?\n");
    3728:	e3073064 	movw	r3, #28772	@ 0x7064
    372c:	e3403000 	movt	r3, #0
    3730:	e5933000 	ldr	r3, [r3]
    3734:	e3061afc 	movw	r1, #27388	@ 0x6afc
    3738:	e3401000 	movt	r1, #0
    373c:	e1a00003 	mov	r0, r3
    3740:	eb000633 	bl	5014 <printf>
    exit();
    3744:	eb0004a1 	bl	49d0 <exit>
  }
  lastaddr = (char*) (BIG-1);
    3748:	e30f3fff 	movw	r3, #65535	@ 0xffff
    374c:	e340363f 	movt	r3, #1599	@ 0x63f
    3750:	e50b3024 	str	r3, [fp, #-36]	@ 0xffffffdc
  *lastaddr = 99;
    3754:	e51b3024 	ldr	r3, [fp, #-36]	@ 0xffffffdc
    3758:	e3a02063 	mov	r2, #99	@ 0x63
    375c:	e5c32000 	strb	r2, [r3]
  printf(stdout, "test #4 done.\n");
    3760:	e3073064 	movw	r3, #28772	@ 0x7064
    3764:	e3403000 	movt	r3, #0
    3768:	e5933000 	ldr	r3, [r3]
    376c:	e3061b3c 	movw	r1, #27452	@ 0x6b3c
    3770:	e3401000 	movt	r1, #0
    3774:	e1a00003 	mov	r0, r3
    3778:	eb000625 	bl	5014 <printf>

  printf(stdout, "test #5 de-allocate\n");
    377c:	e3073064 	movw	r3, #28772	@ 0x7064
    3780:	e3403000 	movt	r3, #0
    3784:	e5933000 	ldr	r3, [r3]
    3788:	e3061b4c 	movw	r1, #27468	@ 0x6b4c
    378c:	e3401000 	movt	r1, #0
    3790:	e1a00003 	mov	r0, r3
    3794:	eb00061e 	bl	5014 <printf>
  // can one de-allocate?
  a = sbrk(0);
    3798:	e3a00000 	mov	r0, #0
    379c:	eb000568 	bl	4d44 <sbrk>
    37a0:	e50b0008 	str	r0, [fp, #-8]
  c = sbrk(-4096);
    37a4:	e3a00a0f 	mov	r0, #61440	@ 0xf000
    37a8:	e34f0fff 	movt	r0, #65535	@ 0xffff
    37ac:	eb000564 	bl	4d44 <sbrk>
    37b0:	e50b0018 	str	r0, [fp, #-24]	@ 0xffffffe8
  if(c == (char*)0xffffffff){
    37b4:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
    37b8:	e3730001 	cmn	r3, #1
    37bc:	1a000007 	bne	37e0 <sbrktest+0x310>
    printf(stdout, "sbrk could not deallocate\n");
    37c0:	e3073064 	movw	r3, #28772	@ 0x7064
    37c4:	e3403000 	movt	r3, #0
    37c8:	e5933000 	ldr	r3, [r3]
    37cc:	e3061b64 	movw	r1, #27492	@ 0x6b64
    37d0:	e3401000 	movt	r1, #0
    37d4:	e1a00003 	mov	r0, r3
    37d8:	eb00060d 	bl	5014 <printf>
    exit();
    37dc:	eb00047b 	bl	49d0 <exit>
  }
  c = sbrk(0);
    37e0:	e3a00000 	mov	r0, #0
    37e4:	eb000556 	bl	4d44 <sbrk>
    37e8:	e50b0018 	str	r0, [fp, #-24]	@ 0xffffffe8
  if(c != a - 4096){
    37ec:	e51b3008 	ldr	r3, [fp, #-8]
    37f0:	e2433a01 	sub	r3, r3, #4096	@ 0x1000
    37f4:	e51b2018 	ldr	r2, [fp, #-24]	@ 0xffffffe8
    37f8:	e1520003 	cmp	r2, r3
    37fc:	0a000008 	beq	3824 <sbrktest+0x354>
    printf(stdout, "sbrk deallocation produced wrong address, a %x c %x\n", a, c);
    3800:	e3073064 	movw	r3, #28772	@ 0x7064
    3804:	e3403000 	movt	r3, #0
    3808:	e5930000 	ldr	r0, [r3]
    380c:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
    3810:	e51b2008 	ldr	r2, [fp, #-8]
    3814:	e3061b80 	movw	r1, #27520	@ 0x6b80
    3818:	e3401000 	movt	r1, #0
    381c:	eb0005fc 	bl	5014 <printf>
    exit();
    3820:	eb00046a 	bl	49d0 <exit>
  }
  printf(stdout, "test #5 done.\n");
    3824:	e3073064 	movw	r3, #28772	@ 0x7064
    3828:	e3403000 	movt	r3, #0
    382c:	e5933000 	ldr	r3, [r3]
    3830:	e3061bb8 	movw	r1, #27576	@ 0x6bb8
    3834:	e3401000 	movt	r1, #0
    3838:	e1a00003 	mov	r0, r3
    383c:	eb0005f4 	bl	5014 <printf>

  printf(stdout, "test #6 re-allocate page.\n");
    3840:	e3073064 	movw	r3, #28772	@ 0x7064
    3844:	e3403000 	movt	r3, #0
    3848:	e5933000 	ldr	r3, [r3]
    384c:	e3061bc8 	movw	r1, #27592	@ 0x6bc8
    3850:	e3401000 	movt	r1, #0
    3854:	e1a00003 	mov	r0, r3
    3858:	eb0005ed 	bl	5014 <printf>
  // can one re-allocate that page?
  a = sbrk(0);
    385c:	e3a00000 	mov	r0, #0
    3860:	eb000537 	bl	4d44 <sbrk>
    3864:	e50b0008 	str	r0, [fp, #-8]
  c = sbrk(4096);
    3868:	e3a00a01 	mov	r0, #4096	@ 0x1000
    386c:	eb000534 	bl	4d44 <sbrk>
    3870:	e50b0018 	str	r0, [fp, #-24]	@ 0xffffffe8
  if(c != a || sbrk(0) != a + 4096){
    3874:	e51b2018 	ldr	r2, [fp, #-24]	@ 0xffffffe8
    3878:	e51b3008 	ldr	r3, [fp, #-8]
    387c:	e1520003 	cmp	r2, r3
    3880:	1a000006 	bne	38a0 <sbrktest+0x3d0>
    3884:	e3a00000 	mov	r0, #0
    3888:	eb00052d 	bl	4d44 <sbrk>
    388c:	e1a02000 	mov	r2, r0
    3890:	e51b3008 	ldr	r3, [fp, #-8]
    3894:	e2833a01 	add	r3, r3, #4096	@ 0x1000
    3898:	e1520003 	cmp	r2, r3
    389c:	0a000008 	beq	38c4 <sbrktest+0x3f4>
    printf(stdout, "sbrk re-allocation failed, a %x c %x\n", a, c);
    38a0:	e3073064 	movw	r3, #28772	@ 0x7064
    38a4:	e3403000 	movt	r3, #0
    38a8:	e5930000 	ldr	r0, [r3]
    38ac:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
    38b0:	e51b2008 	ldr	r2, [fp, #-8]
    38b4:	e3061be4 	movw	r1, #27620	@ 0x6be4
    38b8:	e3401000 	movt	r1, #0
    38bc:	eb0005d4 	bl	5014 <printf>
    exit();
    38c0:	eb000442 	bl	49d0 <exit>
  }
  if(*lastaddr == 99){
    38c4:	e51b3024 	ldr	r3, [fp, #-36]	@ 0xffffffdc
    38c8:	e5d33000 	ldrb	r3, [r3]
    38cc:	e3530063 	cmp	r3, #99	@ 0x63
    38d0:	1a000007 	bne	38f4 <sbrktest+0x424>
    // should be zero
    printf(stdout, "sbrk de-allocation didn't really deallocate\n");
    38d4:	e3073064 	movw	r3, #28772	@ 0x7064
    38d8:	e3403000 	movt	r3, #0
    38dc:	e5933000 	ldr	r3, [r3]
    38e0:	e3061c0c 	movw	r1, #27660	@ 0x6c0c
    38e4:	e3401000 	movt	r1, #0
    38e8:	e1a00003 	mov	r0, r3
    38ec:	eb0005c8 	bl	5014 <printf>
    exit();
    38f0:	eb000436 	bl	49d0 <exit>
  }
  printf(stdout, "test #6 done.\n");
    38f4:	e3073064 	movw	r3, #28772	@ 0x7064
    38f8:	e3403000 	movt	r3, #0
    38fc:	e5933000 	ldr	r3, [r3]
    3900:	e3061c3c 	movw	r1, #27708	@ 0x6c3c
    3904:	e3401000 	movt	r1, #0
    3908:	e1a00003 	mov	r0, r3
    390c:	eb0005c0 	bl	5014 <printf>

  printf(stdout, "test #7 downsize.\n");
    3910:	e3073064 	movw	r3, #28772	@ 0x7064
    3914:	e3403000 	movt	r3, #0
    3918:	e5933000 	ldr	r3, [r3]
    391c:	e3061c4c 	movw	r1, #27724	@ 0x6c4c
    3920:	e3401000 	movt	r1, #0
    3924:	e1a00003 	mov	r0, r3
    3928:	eb0005b9 	bl	5014 <printf>
  a = sbrk(0);
    392c:	e3a00000 	mov	r0, #0
    3930:	eb000503 	bl	4d44 <sbrk>
    3934:	e50b0008 	str	r0, [fp, #-8]
  c = sbrk(-(sbrk(0) - oldbrk));
    3938:	e3a00000 	mov	r0, #0
    393c:	eb000500 	bl	4d44 <sbrk>
    3940:	e1a02000 	mov	r2, r0
    3944:	e51b3010 	ldr	r3, [fp, #-16]
    3948:	e0433002 	sub	r3, r3, r2
    394c:	e1a00003 	mov	r0, r3
    3950:	eb0004fb 	bl	4d44 <sbrk>
    3954:	e50b0018 	str	r0, [fp, #-24]	@ 0xffffffe8
  if(c != a){
    3958:	e51b2018 	ldr	r2, [fp, #-24]	@ 0xffffffe8
    395c:	e51b3008 	ldr	r3, [fp, #-8]
    3960:	e1520003 	cmp	r2, r3
    3964:	0a000008 	beq	398c <sbrktest+0x4bc>
    printf(stdout, "sbrk downsize failed, a %x c %x\n", a, c);
    3968:	e3073064 	movw	r3, #28772	@ 0x7064
    396c:	e3403000 	movt	r3, #0
    3970:	e5930000 	ldr	r0, [r3]
    3974:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
    3978:	e51b2008 	ldr	r2, [fp, #-8]
    397c:	e3061c60 	movw	r1, #27744	@ 0x6c60
    3980:	e3401000 	movt	r1, #0
    3984:	eb0005a2 	bl	5014 <printf>
    exit();
    3988:	eb000410 	bl	49d0 <exit>
  }
  printf(stdout, "test #7 done.\n");
    398c:	e3073064 	movw	r3, #28772	@ 0x7064
    3990:	e3403000 	movt	r3, #0
    3994:	e5933000 	ldr	r3, [r3]
    3998:	e3061c84 	movw	r1, #27780	@ 0x6c84
    399c:	e3401000 	movt	r1, #0
    39a0:	e1a00003 	mov	r0, r3
    39a4:	eb00059a 	bl	5014 <printf>

  printf(stdout, "test #8 read the kernel's memory.\n");
    39a8:	e3073064 	movw	r3, #28772	@ 0x7064
    39ac:	e3403000 	movt	r3, #0
    39b0:	e5933000 	ldr	r3, [r3]
    39b4:	e3061c94 	movw	r1, #27796	@ 0x6c94
    39b8:	e3401000 	movt	r1, #0
    39bc:	e1a00003 	mov	r0, r3
    39c0:	eb000593 	bl	5014 <printf>
  // can we read the kernel's memory?
  for(a = (char*)(KERNBASE); a < (char*) (KERNBASE+2000000); a += 50000){
    39c4:	e3a03103 	mov	r3, #-1073741824	@ 0xc0000000
    39c8:	e50b3008 	str	r3, [fp, #-8]
    39cc:	ea000022 	b	3a5c <sbrktest+0x58c>
    ppid = getpid();
    39d0:	eb0004ce 	bl	4d10 <getpid>
    39d4:	e50b0028 	str	r0, [fp, #-40]	@ 0xffffffd8
    pid = fork();
    39d8:	eb0003ef 	bl	499c <fork>
    39dc:	e50b0014 	str	r0, [fp, #-20]	@ 0xffffffec
    if(pid < 0){
    39e0:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
    39e4:	e3530000 	cmp	r3, #0
    39e8:	aa000007 	bge	3a0c <sbrktest+0x53c>
      printf(stdout, "fork failed\n");
    39ec:	e3073064 	movw	r3, #28772	@ 0x7064
    39f0:	e3403000 	movt	r3, #0
    39f4:	e5933000 	ldr	r3, [r3]
    39f8:	e3051a0c 	movw	r1, #23052	@ 0x5a0c
    39fc:	e3401000 	movt	r1, #0
    3a00:	e1a00003 	mov	r0, r3
    3a04:	eb000582 	bl	5014 <printf>
      exit();
    3a08:	eb0003f0 	bl	49d0 <exit>
    }
    if(pid == 0){
    3a0c:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
    3a10:	e3530000 	cmp	r3, #0
    3a14:	1a00000b 	bne	3a48 <sbrktest+0x578>
      printf(stdout, "oops could read %x = %x\n", a, *a);
    3a18:	e3073064 	movw	r3, #28772	@ 0x7064
    3a1c:	e3403000 	movt	r3, #0
    3a20:	e5930000 	ldr	r0, [r3]
    3a24:	e51b3008 	ldr	r3, [fp, #-8]
    3a28:	e5d33000 	ldrb	r3, [r3]
    3a2c:	e51b2008 	ldr	r2, [fp, #-8]
    3a30:	e3061cb8 	movw	r1, #27832	@ 0x6cb8
    3a34:	e3401000 	movt	r1, #0
    3a38:	eb000575 	bl	5014 <printf>
      kill(ppid);
    3a3c:	e51b0028 	ldr	r0, [fp, #-40]	@ 0xffffffd8
    3a40:	eb000430 	bl	4b08 <kill>
      exit();
    3a44:	eb0003e1 	bl	49d0 <exit>
    }
    wait();
    3a48:	eb0003ed 	bl	4a04 <wait>
  for(a = (char*)(KERNBASE); a < (char*) (KERNBASE+2000000); a += 50000){
    3a4c:	e51b3008 	ldr	r3, [fp, #-8]
    3a50:	e2833cc3 	add	r3, r3, #49920	@ 0xc300
    3a54:	e2833050 	add	r3, r3, #80	@ 0x50
    3a58:	e50b3008 	str	r3, [fp, #-8]
    3a5c:	e51b2008 	ldr	r2, [fp, #-8]
    3a60:	e308347f 	movw	r3, #33919	@ 0x847f
    3a64:	e34c301e 	movt	r3, #49182	@ 0xc01e
    3a68:	e1520003 	cmp	r2, r3
    3a6c:	9affffd7 	bls	39d0 <sbrktest+0x500>
  }
  printf(stdout, "test #8 done.\n");
    3a70:	e3073064 	movw	r3, #28772	@ 0x7064
    3a74:	e3403000 	movt	r3, #0
    3a78:	e5933000 	ldr	r3, [r3]
    3a7c:	e3061cd4 	movw	r1, #27860	@ 0x6cd4
    3a80:	e3401000 	movt	r1, #0
    3a84:	e1a00003 	mov	r0, r3
    3a88:	eb000561 	bl	5014 <printf>

  printf(stdout, "test #9 clean up the last failed allocation\n");
    3a8c:	e3073064 	movw	r3, #28772	@ 0x7064
    3a90:	e3403000 	movt	r3, #0
    3a94:	e5933000 	ldr	r3, [r3]
    3a98:	e3061ce4 	movw	r1, #27876	@ 0x6ce4
    3a9c:	e3401000 	movt	r1, #0
    3aa0:	e1a00003 	mov	r0, r3
    3aa4:	eb00055a 	bl	5014 <printf>
  // if we run the system out of memory, does it clean up the last
  // failed allocation?
  if(pipe(fds) != 0){
    3aa8:	e24b3034 	sub	r3, fp, #52	@ 0x34
    3aac:	e1a00003 	mov	r0, r3
    3ab0:	eb0003e0 	bl	4a38 <pipe>
    3ab4:	e1a03000 	mov	r3, r0
    3ab8:	e3530000 	cmp	r3, #0
    3abc:	0a000004 	beq	3ad4 <sbrktest+0x604>
    printf(1, "pipe() failed\n");
    3ac0:	e305194c 	movw	r1, #22860	@ 0x594c
    3ac4:	e3401000 	movt	r1, #0
    3ac8:	e3a00001 	mov	r0, #1
    3acc:	eb000550 	bl	5014 <printf>
    exit();
    3ad0:	eb0003be 	bl	49d0 <exit>
  }
  printf(stdout, "test #9 done.\n");
    3ad4:	e3073064 	movw	r3, #28772	@ 0x7064
    3ad8:	e3403000 	movt	r3, #0
    3adc:	e5933000 	ldr	r3, [r3]
    3ae0:	e3061d14 	movw	r1, #27924	@ 0x6d14
    3ae4:	e3401000 	movt	r1, #0
    3ae8:	e1a00003 	mov	r0, r3
    3aec:	eb000548 	bl	5014 <printf>

  printf(stdout, "test #10 memory utilization 1.\n");
    3af0:	e3073064 	movw	r3, #28772	@ 0x7064
    3af4:	e3403000 	movt	r3, #0
    3af8:	e5933000 	ldr	r3, [r3]
    3afc:	e3061d24 	movw	r1, #27940	@ 0x6d24
    3b00:	e3401000 	movt	r1, #0
    3b04:	e1a00003 	mov	r0, r3
    3b08:	eb000541 	bl	5014 <printf>
  for(i = 0; i < sizeof(pids)/sizeof(pids[0]); i++){
    3b0c:	e3a03000 	mov	r3, #0
    3b10:	e50b300c 	str	r3, [fp, #-12]
    3b14:	ea000033 	b	3be8 <sbrktest+0x718>
    if((pids[i] = fork()) == 0){
    3b18:	eb00039f 	bl	499c <fork>
    3b1c:	e1a02000 	mov	r2, r0
    3b20:	e51b300c 	ldr	r3, [fp, #-12]
    3b24:	e1a03103 	lsl	r3, r3, #2
    3b28:	e2433004 	sub	r3, r3, #4
    3b2c:	e083300b 	add	r3, r3, fp
    3b30:	e5032044 	str	r2, [r3, #-68]	@ 0xffffffbc
    3b34:	e51b300c 	ldr	r3, [fp, #-12]
    3b38:	e1a03103 	lsl	r3, r3, #2
    3b3c:	e2433004 	sub	r3, r3, #4
    3b40:	e083300b 	add	r3, r3, fp
    3b44:	e5133044 	ldr	r3, [r3, #-68]	@ 0xffffffbc
    3b48:	e3530000 	cmp	r3, #0
    3b4c:	1a000016 	bne	3bac <sbrktest+0x6dc>
      printf(stdout, "create pid:%d.\n",i);
    3b50:	e3073064 	movw	r3, #28772	@ 0x7064
    3b54:	e3403000 	movt	r3, #0
    3b58:	e5933000 	ldr	r3, [r3]
    3b5c:	e51b200c 	ldr	r2, [fp, #-12]
    3b60:	e3061d44 	movw	r1, #27972	@ 0x6d44
    3b64:	e3401000 	movt	r1, #0
    3b68:	e1a00003 	mov	r0, r3
    3b6c:	eb000528 	bl	5014 <printf>
      // allocate a lot of memory
      sbrk(BIG - (uint)sbrk(0));
    3b70:	e3a00000 	mov	r0, #0
    3b74:	eb000472 	bl	4d44 <sbrk>
    3b78:	e1a03000 	mov	r3, r0
    3b7c:	e2633519 	rsb	r3, r3, #104857600	@ 0x6400000
    3b80:	e1a00003 	mov	r0, r3
    3b84:	eb00046e 	bl	4d44 <sbrk>
      write(fds[1], "x", 1);
    3b88:	e51b3030 	ldr	r3, [fp, #-48]	@ 0xffffffd0
    3b8c:	e3a02001 	mov	r2, #1
    3b90:	e30519bc 	movw	r1, #22972	@ 0x59bc
    3b94:	e3401000 	movt	r1, #0
    3b98:	e1a00003 	mov	r0, r3
    3b9c:	eb0003bf 	bl	4aa0 <write>
      // sit around until killed
      for(;;) sleep(1000);
    3ba0:	e3a00ffa 	mov	r0, #1000	@ 0x3e8
    3ba4:	eb000473 	bl	4d78 <sleep>
    3ba8:	eafffffc 	b	3ba0 <sbrktest+0x6d0>
    }
    if(pids[i] != -1)
    3bac:	e51b300c 	ldr	r3, [fp, #-12]
    3bb0:	e1a03103 	lsl	r3, r3, #2
    3bb4:	e2433004 	sub	r3, r3, #4
    3bb8:	e083300b 	add	r3, r3, fp
    3bbc:	e5133044 	ldr	r3, [r3, #-68]	@ 0xffffffbc
    3bc0:	e3730001 	cmn	r3, #1
    3bc4:	0a000004 	beq	3bdc <sbrktest+0x70c>
      read(fds[0], &scratch, 1);
    3bc8:	e51b3034 	ldr	r3, [fp, #-52]	@ 0xffffffcc
    3bcc:	e24b1049 	sub	r1, fp, #73	@ 0x49
    3bd0:	e3a02001 	mov	r2, #1
    3bd4:	e1a00003 	mov	r0, r3
    3bd8:	eb0003a3 	bl	4a6c <read>
  for(i = 0; i < sizeof(pids)/sizeof(pids[0]); i++){
    3bdc:	e51b300c 	ldr	r3, [fp, #-12]
    3be0:	e2833001 	add	r3, r3, #1
    3be4:	e50b300c 	str	r3, [fp, #-12]
    3be8:	e51b300c 	ldr	r3, [fp, #-12]
    3bec:	e3530004 	cmp	r3, #4
    3bf0:	9affffc8 	bls	3b18 <sbrktest+0x648>
  }
  printf(stdout, "test #10 done.\n");
    3bf4:	e3073064 	movw	r3, #28772	@ 0x7064
    3bf8:	e3403000 	movt	r3, #0
    3bfc:	e5933000 	ldr	r3, [r3]
    3c00:	e3061d54 	movw	r1, #27988	@ 0x6d54
    3c04:	e3401000 	movt	r1, #0
    3c08:	e1a00003 	mov	r0, r3
    3c0c:	eb000500 	bl	5014 <printf>

  printf(stdout, "test #11 memory utilization 2.\n");
    3c10:	e3073064 	movw	r3, #28772	@ 0x7064
    3c14:	e3403000 	movt	r3, #0
    3c18:	e5933000 	ldr	r3, [r3]
    3c1c:	e3061d64 	movw	r1, #28004	@ 0x6d64
    3c20:	e3401000 	movt	r1, #0
    3c24:	e1a00003 	mov	r0, r3
    3c28:	eb0004f9 	bl	5014 <printf>
  // if those failed allocations freed up the pages they did allocate,
  // we'll be able to allocate here
  c = sbrk(4096);
    3c2c:	e3a00a01 	mov	r0, #4096	@ 0x1000
    3c30:	eb000443 	bl	4d44 <sbrk>
    3c34:	e50b0018 	str	r0, [fp, #-24]	@ 0xffffffe8
  for(i = 0; i < sizeof(pids)/sizeof(pids[0]); i++){
    3c38:	e3a03000 	mov	r3, #0
    3c3c:	e50b300c 	str	r3, [fp, #-12]
    3c40:	ea000013 	b	3c94 <sbrktest+0x7c4>
    if(pids[i] == -1)
    3c44:	e51b300c 	ldr	r3, [fp, #-12]
    3c48:	e1a03103 	lsl	r3, r3, #2
    3c4c:	e2433004 	sub	r3, r3, #4
    3c50:	e083300b 	add	r3, r3, fp
    3c54:	e5133044 	ldr	r3, [r3, #-68]	@ 0xffffffbc
    3c58:	e3730001 	cmn	r3, #1
    3c5c:	0a000008 	beq	3c84 <sbrktest+0x7b4>
      continue;
    kill(pids[i]);
    3c60:	e51b300c 	ldr	r3, [fp, #-12]
    3c64:	e1a03103 	lsl	r3, r3, #2
    3c68:	e2433004 	sub	r3, r3, #4
    3c6c:	e083300b 	add	r3, r3, fp
    3c70:	e5133044 	ldr	r3, [r3, #-68]	@ 0xffffffbc
    3c74:	e1a00003 	mov	r0, r3
    3c78:	eb0003a2 	bl	4b08 <kill>
    wait();
    3c7c:	eb000360 	bl	4a04 <wait>
    3c80:	ea000000 	b	3c88 <sbrktest+0x7b8>
      continue;
    3c84:	e320f000 	nop	{0}
  for(i = 0; i < sizeof(pids)/sizeof(pids[0]); i++){
    3c88:	e51b300c 	ldr	r3, [fp, #-12]
    3c8c:	e2833001 	add	r3, r3, #1
    3c90:	e50b300c 	str	r3, [fp, #-12]
    3c94:	e51b300c 	ldr	r3, [fp, #-12]
    3c98:	e3530004 	cmp	r3, #4
    3c9c:	9affffe8 	bls	3c44 <sbrktest+0x774>
  }
  printf(stdout, "test #11 done.\n");
    3ca0:	e3073064 	movw	r3, #28772	@ 0x7064
    3ca4:	e3403000 	movt	r3, #0
    3ca8:	e5933000 	ldr	r3, [r3]
    3cac:	e3061d84 	movw	r1, #28036	@ 0x6d84
    3cb0:	e3401000 	movt	r1, #0
    3cb4:	e1a00003 	mov	r0, r3
    3cb8:	eb0004d5 	bl	5014 <printf>

  printf(stdout, "test #12 leaked memory.\n");
    3cbc:	e3073064 	movw	r3, #28772	@ 0x7064
    3cc0:	e3403000 	movt	r3, #0
    3cc4:	e5933000 	ldr	r3, [r3]
    3cc8:	e3061d94 	movw	r1, #28052	@ 0x6d94
    3ccc:	e3401000 	movt	r1, #0
    3cd0:	e1a00003 	mov	r0, r3
    3cd4:	eb0004ce 	bl	5014 <printf>
  if(c == (char*)0xffffffff){
    3cd8:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
    3cdc:	e3730001 	cmn	r3, #1
    3ce0:	1a000007 	bne	3d04 <sbrktest+0x834>
    printf(stdout, "failed sbrk leaked memory\n");
    3ce4:	e3073064 	movw	r3, #28772	@ 0x7064
    3ce8:	e3403000 	movt	r3, #0
    3cec:	e5933000 	ldr	r3, [r3]
    3cf0:	e3061db0 	movw	r1, #28080	@ 0x6db0
    3cf4:	e3401000 	movt	r1, #0
    3cf8:	e1a00003 	mov	r0, r3
    3cfc:	eb0004c4 	bl	5014 <printf>
    exit();
    3d00:	eb000332 	bl	49d0 <exit>
  }
  printf(stdout, "test #12 done.\n");
    3d04:	e3073064 	movw	r3, #28772	@ 0x7064
    3d08:	e3403000 	movt	r3, #0
    3d0c:	e5933000 	ldr	r3, [r3]
    3d10:	e3061dcc 	movw	r1, #28108	@ 0x6dcc
    3d14:	e3401000 	movt	r1, #0
    3d18:	e1a00003 	mov	r0, r3
    3d1c:	eb0004bc 	bl	5014 <printf>

  if(sbrk(0) > oldbrk)
    3d20:	e3a00000 	mov	r0, #0
    3d24:	eb000406 	bl	4d44 <sbrk>
    3d28:	e1a02000 	mov	r2, r0
    3d2c:	e51b3010 	ldr	r3, [fp, #-16]
    3d30:	e1530002 	cmp	r3, r2
    3d34:	2a000006 	bcs	3d54 <sbrktest+0x884>
    sbrk(-(sbrk(0) - oldbrk));
    3d38:	e3a00000 	mov	r0, #0
    3d3c:	eb000400 	bl	4d44 <sbrk>
    3d40:	e1a02000 	mov	r2, r0
    3d44:	e51b3010 	ldr	r3, [fp, #-16]
    3d48:	e0433002 	sub	r3, r3, r2
    3d4c:	e1a00003 	mov	r0, r3
    3d50:	eb0003fb 	bl	4d44 <sbrk>

  printf(stdout, "sbrk test OK\n");
    3d54:	e3073064 	movw	r3, #28772	@ 0x7064
    3d58:	e3403000 	movt	r3, #0
    3d5c:	e5933000 	ldr	r3, [r3]
    3d60:	e3061ddc 	movw	r1, #28124	@ 0x6ddc
    3d64:	e3401000 	movt	r1, #0
    3d68:	e1a00003 	mov	r0, r3
    3d6c:	eb0004a8 	bl	5014 <printf>
}
    3d70:	e320f000 	nop	{0}
    3d74:	e24bd004 	sub	sp, fp, #4
    3d78:	e8bd8800 	pop	{fp, pc}

00003d7c <validateint>:

void
validateint(int *p)
{
    3d7c:	e92d4800 	push	{fp, lr}
    3d80:	e28db004 	add	fp, sp, #4
    3d84:	e24dd008 	sub	sp, sp, #8
    3d88:	e50b0008 	str	r0, [fp, #-8]
    sleep(*p);
    3d8c:	e51b3008 	ldr	r3, [fp, #-8]
    3d90:	e5933000 	ldr	r3, [r3]
    3d94:	e1a00003 	mov	r0, r3
    3d98:	eb0003f6 	bl	4d78 <sleep>
}
    3d9c:	e320f000 	nop	{0}
    3da0:	e24bd004 	sub	sp, fp, #4
    3da4:	e8bd8800 	pop	{fp, pc}

00003da8 <validatetest>:

void
validatetest(void)
{
    3da8:	e92d4800 	push	{fp, lr}
    3dac:	e28db004 	add	fp, sp, #4
    3db0:	e24dd010 	sub	sp, sp, #16
  int hi, pid;
  uint p;

  printf(stdout, "validate test\n");
    3db4:	e3073064 	movw	r3, #28772	@ 0x7064
    3db8:	e3403000 	movt	r3, #0
    3dbc:	e5933000 	ldr	r3, [r3]
    3dc0:	e3061dec 	movw	r1, #28140	@ 0x6dec
    3dc4:	e3401000 	movt	r1, #0
    3dc8:	e1a00003 	mov	r0, r3
    3dcc:	eb000490 	bl	5014 <printf>
  hi = 1100*1024;
    3dd0:	e3a03a03 	mov	r3, #12288	@ 0x3000
    3dd4:	e3403011 	movt	r3, #17
    3dd8:	e50b300c 	str	r3, [fp, #-12]

  for(p = 0; p <= (uint)hi; p += 4096){
    3ddc:	e3a03000 	mov	r3, #0
    3de0:	e50b3008 	str	r3, [fp, #-8]
    3de4:	ea000022 	b	3e74 <validatetest+0xcc>
    if((pid = fork()) == 0){
    3de8:	eb0002eb 	bl	499c <fork>
    3dec:	e50b0010 	str	r0, [fp, #-16]
    3df0:	e51b3010 	ldr	r3, [fp, #-16]
    3df4:	e3530000 	cmp	r3, #0
    3df8:	1a000003 	bne	3e0c <validatetest+0x64>
      // try to crash the kernel by passing in a badly placed integer
      validateint((int*)p);
    3dfc:	e51b3008 	ldr	r3, [fp, #-8]
    3e00:	e1a00003 	mov	r0, r3
    3e04:	ebffffdc 	bl	3d7c <validateint>
      exit();
    3e08:	eb0002f0 	bl	49d0 <exit>
    }
    sleep(0);
    3e0c:	e3a00000 	mov	r0, #0
    3e10:	eb0003d8 	bl	4d78 <sleep>
    sleep(0);
    3e14:	e3a00000 	mov	r0, #0
    3e18:	eb0003d6 	bl	4d78 <sleep>
    kill(pid);
    3e1c:	e51b0010 	ldr	r0, [fp, #-16]
    3e20:	eb000338 	bl	4b08 <kill>
    wait();
    3e24:	eb0002f6 	bl	4a04 <wait>

    // try to crash the kernel by passing in a bad string pointer
    if(link("nosuchfile", (char*)p) != -1){
    3e28:	e51b3008 	ldr	r3, [fp, #-8]
    3e2c:	e1a01003 	mov	r1, r3
    3e30:	e3060dfc 	movw	r0, #28156	@ 0x6dfc
    3e34:	e3400000 	movt	r0, #0
    3e38:	eb000380 	bl	4c40 <link>
    3e3c:	e1a03000 	mov	r3, r0
    3e40:	e3730001 	cmn	r3, #1
    3e44:	0a000007 	beq	3e68 <validatetest+0xc0>
      printf(stdout, "link should not succeed\n");
    3e48:	e3073064 	movw	r3, #28772	@ 0x7064
    3e4c:	e3403000 	movt	r3, #0
    3e50:	e5933000 	ldr	r3, [r3]
    3e54:	e3061e08 	movw	r1, #28168	@ 0x6e08
    3e58:	e3401000 	movt	r1, #0
    3e5c:	e1a00003 	mov	r0, r3
    3e60:	eb00046b 	bl	5014 <printf>
      exit();
    3e64:	eb0002d9 	bl	49d0 <exit>
  for(p = 0; p <= (uint)hi; p += 4096){
    3e68:	e51b3008 	ldr	r3, [fp, #-8]
    3e6c:	e2833a01 	add	r3, r3, #4096	@ 0x1000
    3e70:	e50b3008 	str	r3, [fp, #-8]
    3e74:	e51b300c 	ldr	r3, [fp, #-12]
    3e78:	e51b2008 	ldr	r2, [fp, #-8]
    3e7c:	e1520003 	cmp	r2, r3
    3e80:	9affffd8 	bls	3de8 <validatetest+0x40>
    }
  }

  printf(stdout, "validate ok\n");
    3e84:	e3073064 	movw	r3, #28772	@ 0x7064
    3e88:	e3403000 	movt	r3, #0
    3e8c:	e5933000 	ldr	r3, [r3]
    3e90:	e3061e24 	movw	r1, #28196	@ 0x6e24
    3e94:	e3401000 	movt	r1, #0
    3e98:	e1a00003 	mov	r0, r3
    3e9c:	eb00045c 	bl	5014 <printf>
}
    3ea0:	e320f000 	nop	{0}
    3ea4:	e24bd004 	sub	sp, fp, #4
    3ea8:	e8bd8800 	pop	{fp, pc}

00003eac <bsstest>:

// does unintialized data start out zero?
char uninit[10000];
void
bsstest(void)
{
    3eac:	e92d4800 	push	{fp, lr}
    3eb0:	e28db004 	add	fp, sp, #4
    3eb4:	e24dd008 	sub	sp, sp, #8
  int i;

  printf(stdout, "bss test\n");
    3eb8:	e3073064 	movw	r3, #28772	@ 0x7064
    3ebc:	e3403000 	movt	r3, #0
    3ec0:	e5933000 	ldr	r3, [r3]
    3ec4:	e3061e34 	movw	r1, #28212	@ 0x6e34
    3ec8:	e3401000 	movt	r1, #0
    3ecc:	e1a00003 	mov	r0, r3
    3ed0:	eb00044f 	bl	5014 <printf>
  for(i = 0; i < sizeof(uninit); i++){
    3ed4:	e3a03000 	mov	r3, #0
    3ed8:	e50b3008 	str	r3, [fp, #-8]
    3edc:	ea000011 	b	3f28 <bsstest+0x7c>
    if(uninit[i] != '\0'){
    3ee0:	e3093084 	movw	r3, #36996	@ 0x9084
    3ee4:	e3403000 	movt	r3, #0
    3ee8:	e51b2008 	ldr	r2, [fp, #-8]
    3eec:	e0833002 	add	r3, r3, r2
    3ef0:	e5d33000 	ldrb	r3, [r3]
    3ef4:	e3530000 	cmp	r3, #0
    3ef8:	0a000007 	beq	3f1c <bsstest+0x70>
      printf(stdout, "bss test failed\n");
    3efc:	e3073064 	movw	r3, #28772	@ 0x7064
    3f00:	e3403000 	movt	r3, #0
    3f04:	e5933000 	ldr	r3, [r3]
    3f08:	e3061e40 	movw	r1, #28224	@ 0x6e40
    3f0c:	e3401000 	movt	r1, #0
    3f10:	e1a00003 	mov	r0, r3
    3f14:	eb00043e 	bl	5014 <printf>
      exit();
    3f18:	eb0002ac 	bl	49d0 <exit>
  for(i = 0; i < sizeof(uninit); i++){
    3f1c:	e51b3008 	ldr	r3, [fp, #-8]
    3f20:	e2833001 	add	r3, r3, #1
    3f24:	e50b3008 	str	r3, [fp, #-8]
    3f28:	e51b3008 	ldr	r3, [fp, #-8]
    3f2c:	e302270f 	movw	r2, #9999	@ 0x270f
    3f30:	e1530002 	cmp	r3, r2
    3f34:	9affffe9 	bls	3ee0 <bsstest+0x34>
    }
  }
  printf(stdout, "bss test ok\n");
    3f38:	e3073064 	movw	r3, #28772	@ 0x7064
    3f3c:	e3403000 	movt	r3, #0
    3f40:	e5933000 	ldr	r3, [r3]
    3f44:	e3061e54 	movw	r1, #28244	@ 0x6e54
    3f48:	e3401000 	movt	r1, #0
    3f4c:	e1a00003 	mov	r0, r3
    3f50:	eb00042f 	bl	5014 <printf>
}
    3f54:	e320f000 	nop	{0}
    3f58:	e24bd004 	sub	sp, fp, #4
    3f5c:	e8bd8800 	pop	{fp, pc}

00003f60 <bigargtest>:
// does exec return an error if the arguments
// are larger than a page? or does it write
// below the stack and wreck the instructions/data?
void
bigargtest(void)
{
    3f60:	e92d4800 	push	{fp, lr}
    3f64:	e28db004 	add	fp, sp, #4
    3f68:	e24dd010 	sub	sp, sp, #16
  int pid, fd;

  unlink("bigarg-ok");
    3f6c:	e3060e64 	movw	r0, #28260	@ 0x6e64
    3f70:	e3400000 	movt	r0, #0
    3f74:	eb000317 	bl	4bd8 <unlink>
  pid = fork();
    3f78:	eb000287 	bl	499c <fork>
    3f7c:	e50b000c 	str	r0, [fp, #-12]
  if(pid == 0){
    3f80:	e51b300c 	ldr	r3, [fp, #-12]
    3f84:	e3530000 	cmp	r3, #0
    3f88:	1a00002d 	bne	4044 <bigargtest+0xe4>
    static char *args[MAXARG];
    int i;
    for(i = 0; i < MAXARG-1; i++)
    3f8c:	e3a03000 	mov	r3, #0
    3f90:	e50b3008 	str	r3, [fp, #-8]
    3f94:	ea000008 	b	3fbc <bigargtest+0x5c>
      args[i] = "bigargs test: failed\n                                                                                                                                                                                                       ";
    3f98:	e30b3794 	movw	r3, #46996	@ 0xb794
    3f9c:	e3403000 	movt	r3, #0
    3fa0:	e51b1008 	ldr	r1, [fp, #-8]
    3fa4:	e3062e70 	movw	r2, #28272	@ 0x6e70
    3fa8:	e3402000 	movt	r2, #0
    3fac:	e7832101 	str	r2, [r3, r1, lsl #2]
    for(i = 0; i < MAXARG-1; i++)
    3fb0:	e51b3008 	ldr	r3, [fp, #-8]
    3fb4:	e2833001 	add	r3, r3, #1
    3fb8:	e50b3008 	str	r3, [fp, #-8]
    3fbc:	e51b3008 	ldr	r3, [fp, #-8]
    3fc0:	e353001e 	cmp	r3, #30
    3fc4:	dafffff3 	ble	3f98 <bigargtest+0x38>
    args[MAXARG-1] = 0;
    3fc8:	e30b3794 	movw	r3, #46996	@ 0xb794
    3fcc:	e3403000 	movt	r3, #0
    3fd0:	e3a02000 	mov	r2, #0
    3fd4:	e583207c 	str	r2, [r3, #124]	@ 0x7c
    printf(stdout, "bigarg test\n");
    3fd8:	e3073064 	movw	r3, #28772	@ 0x7064
    3fdc:	e3403000 	movt	r3, #0
    3fe0:	e5933000 	ldr	r3, [r3]
    3fe4:	e3061f50 	movw	r1, #28496	@ 0x6f50
    3fe8:	e3401000 	movt	r1, #0
    3fec:	e1a00003 	mov	r0, r3
    3ff0:	eb000407 	bl	5014 <printf>
    exec("echo", args);
    3ff4:	e30b1794 	movw	r1, #46996	@ 0xb794
    3ff8:	e3401000 	movt	r1, #0
    3ffc:	e30505d4 	movw	r0, #21972	@ 0x55d4
    4000:	e3400000 	movt	r0, #0
    4004:	eb0002cc 	bl	4b3c <exec>
    printf(stdout, "bigarg test ok\n");
    4008:	e3073064 	movw	r3, #28772	@ 0x7064
    400c:	e3403000 	movt	r3, #0
    4010:	e5933000 	ldr	r3, [r3]
    4014:	e3061f60 	movw	r1, #28512	@ 0x6f60
    4018:	e3401000 	movt	r1, #0
    401c:	e1a00003 	mov	r0, r3
    4020:	eb0003fb 	bl	5014 <printf>
    fd = open("bigarg-ok", O_CREATE);
    4024:	e3a01c02 	mov	r1, #512	@ 0x200
    4028:	e3060e64 	movw	r0, #28260	@ 0x6e64
    402c:	e3400000 	movt	r0, #0
    4030:	eb0002ce 	bl	4b70 <open>
    4034:	e50b0010 	str	r0, [fp, #-16]
    close(fd);
    4038:	e51b0010 	ldr	r0, [fp, #-16]
    403c:	eb0002a4 	bl	4ad4 <close>
    exit();
    4040:	eb000262 	bl	49d0 <exit>
  } else if(pid < 0){
    4044:	e51b300c 	ldr	r3, [fp, #-12]
    4048:	e3530000 	cmp	r3, #0
    404c:	aa000007 	bge	4070 <bigargtest+0x110>
    printf(stdout, "bigargtest: fork failed\n");
    4050:	e3073064 	movw	r3, #28772	@ 0x7064
    4054:	e3403000 	movt	r3, #0
    4058:	e5933000 	ldr	r3, [r3]
    405c:	e3061f70 	movw	r1, #28528	@ 0x6f70
    4060:	e3401000 	movt	r1, #0
    4064:	e1a00003 	mov	r0, r3
    4068:	eb0003e9 	bl	5014 <printf>
    exit();
    406c:	eb000257 	bl	49d0 <exit>
  }
  wait();
    4070:	eb000263 	bl	4a04 <wait>
  fd = open("bigarg-ok", 0);
    4074:	e3a01000 	mov	r1, #0
    4078:	e3060e64 	movw	r0, #28260	@ 0x6e64
    407c:	e3400000 	movt	r0, #0
    4080:	eb0002ba 	bl	4b70 <open>
    4084:	e50b0010 	str	r0, [fp, #-16]
  if(fd < 0){
    4088:	e51b3010 	ldr	r3, [fp, #-16]
    408c:	e3530000 	cmp	r3, #0
    4090:	aa000007 	bge	40b4 <bigargtest+0x154>
    printf(stdout, "bigarg test failed!\n");
    4094:	e3073064 	movw	r3, #28772	@ 0x7064
    4098:	e3403000 	movt	r3, #0
    409c:	e5933000 	ldr	r3, [r3]
    40a0:	e3061f8c 	movw	r1, #28556	@ 0x6f8c
    40a4:	e3401000 	movt	r1, #0
    40a8:	e1a00003 	mov	r0, r3
    40ac:	eb0003d8 	bl	5014 <printf>
    exit();
    40b0:	eb000246 	bl	49d0 <exit>
  }
  close(fd);
    40b4:	e51b0010 	ldr	r0, [fp, #-16]
    40b8:	eb000285 	bl	4ad4 <close>
  unlink("bigarg-ok");
    40bc:	e3060e64 	movw	r0, #28260	@ 0x6e64
    40c0:	e3400000 	movt	r0, #0
    40c4:	eb0002c3 	bl	4bd8 <unlink>
}
    40c8:	e320f000 	nop	{0}
    40cc:	e24bd004 	sub	sp, fp, #4
    40d0:	e8bd8800 	pop	{fp, pc}

000040d4 <fsfull>:

// what happens when the file system runs out of blocks?
// answer: balloc panics, so this test is not useful.
void
fsfull()
{
    40d4:	e92d4800 	push	{fp, lr}
    40d8:	e28db004 	add	fp, sp, #4
    40dc:	e24dd058 	sub	sp, sp, #88	@ 0x58
  int nfiles;
  int fsblocks = 0;
    40e0:	e3a03000 	mov	r3, #0
    40e4:	e50b300c 	str	r3, [fp, #-12]

  printf(1, "fsfull test\n");
    40e8:	e3061fa4 	movw	r1, #28580	@ 0x6fa4
    40ec:	e3401000 	movt	r1, #0
    40f0:	e3a00001 	mov	r0, #1
    40f4:	eb0003c6 	bl	5014 <printf>

  for(nfiles = 0; ; nfiles++){
    40f8:	e3a03000 	mov	r3, #0
    40fc:	e50b3008 	str	r3, [fp, #-8]
    char name[64];
    name[0] = 'f';
    4100:	e3a03066 	mov	r3, #102	@ 0x66
    4104:	e54b3058 	strb	r3, [fp, #-88]	@ 0xffffffa8
    name[1] = '0' + nfiles / 1000;
    4108:	e51b2008 	ldr	r2, [fp, #-8]
    410c:	e3043dd3 	movw	r3, #19923	@ 0x4dd3
    4110:	e3413062 	movt	r3, #4194	@ 0x1062
    4114:	e0c31293 	smull	r1, r3, r3, r2
    4118:	e1a01343 	asr	r1, r3, #6
    411c:	e1a03fc2 	asr	r3, r2, #31
    4120:	e0413003 	sub	r3, r1, r3
    4124:	e6ef3073 	uxtb	r3, r3
    4128:	e2833030 	add	r3, r3, #48	@ 0x30
    412c:	e6ef3073 	uxtb	r3, r3
    4130:	e54b3057 	strb	r3, [fp, #-87]	@ 0xffffffa9
    name[2] = '0' + (nfiles % 1000) / 100;
    4134:	e51b2008 	ldr	r2, [fp, #-8]
    4138:	e3043dd3 	movw	r3, #19923	@ 0x4dd3
    413c:	e3413062 	movt	r3, #4194	@ 0x1062
    4140:	e0c31293 	smull	r1, r3, r3, r2
    4144:	e1a01343 	asr	r1, r3, #6
    4148:	e1a03fc2 	asr	r3, r2, #31
    414c:	e0413003 	sub	r3, r1, r3
    4150:	e3a01ffa 	mov	r1, #1000	@ 0x3e8
    4154:	e0030391 	mul	r3, r1, r3
    4158:	e0423003 	sub	r3, r2, r3
    415c:	e308251f 	movw	r2, #34079	@ 0x851f
    4160:	e34521eb 	movt	r2, #20971	@ 0x51eb
    4164:	e0c21392 	smull	r1, r2, r2, r3
    4168:	e1a022c2 	asr	r2, r2, #5
    416c:	e1a03fc3 	asr	r3, r3, #31
    4170:	e0423003 	sub	r3, r2, r3
    4174:	e6ef3073 	uxtb	r3, r3
    4178:	e2833030 	add	r3, r3, #48	@ 0x30
    417c:	e6ef3073 	uxtb	r3, r3
    4180:	e54b3056 	strb	r3, [fp, #-86]	@ 0xffffffaa
    name[3] = '0' + (nfiles % 100) / 10;
    4184:	e51b2008 	ldr	r2, [fp, #-8]
    4188:	e308351f 	movw	r3, #34079	@ 0x851f
    418c:	e34531eb 	movt	r3, #20971	@ 0x51eb
    4190:	e0c31293 	smull	r1, r3, r3, r2
    4194:	e1a012c3 	asr	r1, r3, #5
    4198:	e1a03fc2 	asr	r3, r2, #31
    419c:	e0413003 	sub	r3, r1, r3
    41a0:	e3a01064 	mov	r1, #100	@ 0x64
    41a4:	e0030391 	mul	r3, r1, r3
    41a8:	e0423003 	sub	r3, r2, r3
    41ac:	e3062667 	movw	r2, #26215	@ 0x6667
    41b0:	e3462666 	movt	r2, #26214	@ 0x6666
    41b4:	e0c21392 	smull	r1, r2, r2, r3
    41b8:	e1a02142 	asr	r2, r2, #2
    41bc:	e1a03fc3 	asr	r3, r3, #31
    41c0:	e0423003 	sub	r3, r2, r3
    41c4:	e6ef3073 	uxtb	r3, r3
    41c8:	e2833030 	add	r3, r3, #48	@ 0x30
    41cc:	e6ef3073 	uxtb	r3, r3
    41d0:	e54b3055 	strb	r3, [fp, #-85]	@ 0xffffffab
    name[4] = '0' + (nfiles % 10);
    41d4:	e51b3008 	ldr	r3, [fp, #-8]
    41d8:	e3062667 	movw	r2, #26215	@ 0x6667
    41dc:	e3462666 	movt	r2, #26214	@ 0x6666
    41e0:	e0c21392 	smull	r1, r2, r2, r3
    41e4:	e1a01142 	asr	r1, r2, #2
    41e8:	e1a02fc3 	asr	r2, r3, #31
    41ec:	e0412002 	sub	r2, r1, r2
    41f0:	e3a0100a 	mov	r1, #10
    41f4:	e0020291 	mul	r2, r1, r2
    41f8:	e0432002 	sub	r2, r3, r2
    41fc:	e6ef3072 	uxtb	r3, r2
    4200:	e2833030 	add	r3, r3, #48	@ 0x30
    4204:	e6ef3073 	uxtb	r3, r3
    4208:	e54b3054 	strb	r3, [fp, #-84]	@ 0xffffffac
    name[5] = '\0';
    420c:	e3a03000 	mov	r3, #0
    4210:	e54b3053 	strb	r3, [fp, #-83]	@ 0xffffffad
    printf(1, "writing %s\n", name);
    4214:	e24b3058 	sub	r3, fp, #88	@ 0x58
    4218:	e1a02003 	mov	r2, r3
    421c:	e3061fb4 	movw	r1, #28596	@ 0x6fb4
    4220:	e3401000 	movt	r1, #0
    4224:	e3a00001 	mov	r0, #1
    4228:	eb000379 	bl	5014 <printf>
    int fd = open(name, O_CREATE|O_RDWR);
    422c:	e24b3058 	sub	r3, fp, #88	@ 0x58
    4230:	e3001202 	movw	r1, #514	@ 0x202
    4234:	e1a00003 	mov	r0, r3
    4238:	eb00024c 	bl	4b70 <open>
    423c:	e50b0014 	str	r0, [fp, #-20]	@ 0xffffffec
    if(fd < 0){
    4240:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
    4244:	e3530000 	cmp	r3, #0
    4248:	aa000006 	bge	4268 <fsfull+0x194>
      printf(1, "open %s failed\n", name);
    424c:	e24b3058 	sub	r3, fp, #88	@ 0x58
    4250:	e1a02003 	mov	r2, r3
    4254:	e3061fc0 	movw	r1, #28608	@ 0x6fc0
    4258:	e3401000 	movt	r1, #0
    425c:	e3a00001 	mov	r0, #1
    4260:	eb00036b 	bl	5014 <printf>
      break;
    4264:	ea000022 	b	42f4 <fsfull+0x220>
    }
    int total = 0;
    4268:	e3a03000 	mov	r3, #0
    426c:	e50b3010 	str	r3, [fp, #-16]
    while(1){
      int cc = write(fd, buf, 512);
    4270:	e3a02c02 	mov	r2, #512	@ 0x200
    4274:	e3071080 	movw	r1, #28800	@ 0x7080
    4278:	e3401000 	movt	r1, #0
    427c:	e51b0014 	ldr	r0, [fp, #-20]	@ 0xffffffec
    4280:	eb000206 	bl	4aa0 <write>
    4284:	e50b0018 	str	r0, [fp, #-24]	@ 0xffffffe8
      if(cc < 512)
    4288:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
    428c:	e3530c02 	cmp	r3, #512	@ 0x200
    4290:	ba000007 	blt	42b4 <fsfull+0x1e0>
        break;
      total += cc;
    4294:	e51b2010 	ldr	r2, [fp, #-16]
    4298:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
    429c:	e0823003 	add	r3, r2, r3
    42a0:	e50b3010 	str	r3, [fp, #-16]
      fsblocks++;
    42a4:	e51b300c 	ldr	r3, [fp, #-12]
    42a8:	e2833001 	add	r3, r3, #1
    42ac:	e50b300c 	str	r3, [fp, #-12]
    while(1){
    42b0:	eaffffee 	b	4270 <fsfull+0x19c>
        break;
    42b4:	e320f000 	nop	{0}
    }
    printf(1, "wrote %d bytes\n", total);
    42b8:	e51b2010 	ldr	r2, [fp, #-16]
    42bc:	e3061fd0 	movw	r1, #28624	@ 0x6fd0
    42c0:	e3401000 	movt	r1, #0
    42c4:	e3a00001 	mov	r0, #1
    42c8:	eb000351 	bl	5014 <printf>
    close(fd);
    42cc:	e51b0014 	ldr	r0, [fp, #-20]	@ 0xffffffec
    42d0:	eb0001ff 	bl	4ad4 <close>
    if(total == 0)
    42d4:	e51b3010 	ldr	r3, [fp, #-16]
    42d8:	e3530000 	cmp	r3, #0
    42dc:	0a000003 	beq	42f0 <fsfull+0x21c>
  for(nfiles = 0; ; nfiles++){
    42e0:	e51b3008 	ldr	r3, [fp, #-8]
    42e4:	e2833001 	add	r3, r3, #1
    42e8:	e50b3008 	str	r3, [fp, #-8]
    42ec:	eaffff83 	b	4100 <fsfull+0x2c>
      break;
    42f0:	e320f000 	nop	{0}
  }

  while(nfiles >= 0){
    42f4:	ea00004a 	b	4424 <fsfull+0x350>
    char name[64];
    name[0] = 'f';
    42f8:	e3a03066 	mov	r3, #102	@ 0x66
    42fc:	e54b3058 	strb	r3, [fp, #-88]	@ 0xffffffa8
    name[1] = '0' + nfiles / 1000;
    4300:	e51b2008 	ldr	r2, [fp, #-8]
    4304:	e3043dd3 	movw	r3, #19923	@ 0x4dd3
    4308:	e3413062 	movt	r3, #4194	@ 0x1062
    430c:	e0c31293 	smull	r1, r3, r3, r2
    4310:	e1a01343 	asr	r1, r3, #6
    4314:	e1a03fc2 	asr	r3, r2, #31
    4318:	e0413003 	sub	r3, r1, r3
    431c:	e6ef3073 	uxtb	r3, r3
    4320:	e2833030 	add	r3, r3, #48	@ 0x30
    4324:	e6ef3073 	uxtb	r3, r3
    4328:	e54b3057 	strb	r3, [fp, #-87]	@ 0xffffffa9
    name[2] = '0' + (nfiles % 1000) / 100;
    432c:	e51b2008 	ldr	r2, [fp, #-8]
    4330:	e3043dd3 	movw	r3, #19923	@ 0x4dd3
    4334:	e3413062 	movt	r3, #4194	@ 0x1062
    4338:	e0c31293 	smull	r1, r3, r3, r2
    433c:	e1a01343 	asr	r1, r3, #6
    4340:	e1a03fc2 	asr	r3, r2, #31
    4344:	e0413003 	sub	r3, r1, r3
    4348:	e3a01ffa 	mov	r1, #1000	@ 0x3e8
    434c:	e0030391 	mul	r3, r1, r3
    4350:	e0423003 	sub	r3, r2, r3
    4354:	e308251f 	movw	r2, #34079	@ 0x851f
    4358:	e34521eb 	movt	r2, #20971	@ 0x51eb
    435c:	e0c21392 	smull	r1, r2, r2, r3
    4360:	e1a022c2 	asr	r2, r2, #5
    4364:	e1a03fc3 	asr	r3, r3, #31
    4368:	e0423003 	sub	r3, r2, r3
    436c:	e6ef3073 	uxtb	r3, r3
    4370:	e2833030 	add	r3, r3, #48	@ 0x30
    4374:	e6ef3073 	uxtb	r3, r3
    4378:	e54b3056 	strb	r3, [fp, #-86]	@ 0xffffffaa
    name[3] = '0' + (nfiles % 100) / 10;
    437c:	e51b2008 	ldr	r2, [fp, #-8]
    4380:	e308351f 	movw	r3, #34079	@ 0x851f
    4384:	e34531eb 	movt	r3, #20971	@ 0x51eb
    4388:	e0c31293 	smull	r1, r3, r3, r2
    438c:	e1a012c3 	asr	r1, r3, #5
    4390:	e1a03fc2 	asr	r3, r2, #31
    4394:	e0413003 	sub	r3, r1, r3
    4398:	e3a01064 	mov	r1, #100	@ 0x64
    439c:	e0030391 	mul	r3, r1, r3
    43a0:	e0423003 	sub	r3, r2, r3
    43a4:	e3062667 	movw	r2, #26215	@ 0x6667
    43a8:	e3462666 	movt	r2, #26214	@ 0x6666
    43ac:	e0c21392 	smull	r1, r2, r2, r3
    43b0:	e1a02142 	asr	r2, r2, #2
    43b4:	e1a03fc3 	asr	r3, r3, #31
    43b8:	e0423003 	sub	r3, r2, r3
    43bc:	e6ef3073 	uxtb	r3, r3
    43c0:	e2833030 	add	r3, r3, #48	@ 0x30
    43c4:	e6ef3073 	uxtb	r3, r3
    43c8:	e54b3055 	strb	r3, [fp, #-85]	@ 0xffffffab
    name[4] = '0' + (nfiles % 10);
    43cc:	e51b3008 	ldr	r3, [fp, #-8]
    43d0:	e3062667 	movw	r2, #26215	@ 0x6667
    43d4:	e3462666 	movt	r2, #26214	@ 0x6666
    43d8:	e0c21392 	smull	r1, r2, r2, r3
    43dc:	e1a01142 	asr	r1, r2, #2
    43e0:	e1a02fc3 	asr	r2, r3, #31
    43e4:	e0412002 	sub	r2, r1, r2
    43e8:	e3a0100a 	mov	r1, #10
    43ec:	e0020291 	mul	r2, r1, r2
    43f0:	e0432002 	sub	r2, r3, r2
    43f4:	e6ef3072 	uxtb	r3, r2
    43f8:	e2833030 	add	r3, r3, #48	@ 0x30
    43fc:	e6ef3073 	uxtb	r3, r3
    4400:	e54b3054 	strb	r3, [fp, #-84]	@ 0xffffffac
    name[5] = '\0';
    4404:	e3a03000 	mov	r3, #0
    4408:	e54b3053 	strb	r3, [fp, #-83]	@ 0xffffffad
    unlink(name);
    440c:	e24b3058 	sub	r3, fp, #88	@ 0x58
    4410:	e1a00003 	mov	r0, r3
    4414:	eb0001ef 	bl	4bd8 <unlink>
    nfiles--;
    4418:	e51b3008 	ldr	r3, [fp, #-8]
    441c:	e2433001 	sub	r3, r3, #1
    4420:	e50b3008 	str	r3, [fp, #-8]
  while(nfiles >= 0){
    4424:	e51b3008 	ldr	r3, [fp, #-8]
    4428:	e3530000 	cmp	r3, #0
    442c:	aaffffb1 	bge	42f8 <fsfull+0x224>
  }

  printf(1, "fsfull test finished\n");
    4430:	e3061fe0 	movw	r1, #28640	@ 0x6fe0
    4434:	e3401000 	movt	r1, #0
    4438:	e3a00001 	mov	r0, #1
    443c:	eb0002f4 	bl	5014 <printf>
}
    4440:	e320f000 	nop	{0}
    4444:	e24bd004 	sub	sp, fp, #4
    4448:	e8bd8800 	pop	{fp, pc}

0000444c <rand>:

unsigned long randstate = 1;
unsigned int
rand()
{
    444c:	e52db004 	push	{fp}		@ (str fp, [sp, #-4]!)
    4450:	e28db000 	add	fp, sp, #0
  randstate = randstate * 1664525 + 1013904223;
    4454:	e3073068 	movw	r3, #28776	@ 0x7068
    4458:	e3403000 	movt	r3, #0
    445c:	e5932000 	ldr	r2, [r3]
    4460:	e306360d 	movw	r3, #26125	@ 0x660d
    4464:	e3403019 	movt	r3, #25
    4468:	e0020293 	mul	r2, r3, r2
    446c:	e30f335f 	movw	r3, #62303	@ 0xf35f
    4470:	e3433c6e 	movt	r3, #15470	@ 0x3c6e
    4474:	e0823003 	add	r3, r2, r3
    4478:	e3072068 	movw	r2, #28776	@ 0x7068
    447c:	e3402000 	movt	r2, #0
    4480:	e5823000 	str	r3, [r2]
  return randstate;
    4484:	e3073068 	movw	r3, #28776	@ 0x7068
    4488:	e3403000 	movt	r3, #0
    448c:	e5933000 	ldr	r3, [r3]
}
    4490:	e1a00003 	mov	r0, r3
    4494:	e28bd000 	add	sp, fp, #0
    4498:	e49db004 	pop	{fp}		@ (ldr fp, [sp], #4)
    449c:	e12fff1e 	bx	lr

000044a0 <main>:

int
main(int argc, char *argv[])
{
    44a0:	e92d4800 	push	{fp, lr}
    44a4:	e28db004 	add	fp, sp, #4
    44a8:	e24dd008 	sub	sp, sp, #8
    44ac:	e50b0008 	str	r0, [fp, #-8]
    44b0:	e50b100c 	str	r1, [fp, #-12]
  printf(1, "usertests starting\n");
    44b4:	e3061ff8 	movw	r1, #28664	@ 0x6ff8
    44b8:	e3401000 	movt	r1, #0
    44bc:	e3a00001 	mov	r0, #1
    44c0:	eb0002d3 	bl	5014 <printf>

  if(open("usertests.ran", 0) >= 0){
    44c4:	e3a01000 	mov	r1, #0
    44c8:	e307000c 	movw	r0, #28684	@ 0x700c
    44cc:	e3400000 	movt	r0, #0
    44d0:	eb0001a6 	bl	4b70 <open>
    44d4:	e1a03000 	mov	r3, r0
    44d8:	e3530000 	cmp	r3, #0
    44dc:	ba000004 	blt	44f4 <main+0x54>
    printf(1, "already ran user tests -- rebuild fs.img\n");
    44e0:	e307101c 	movw	r1, #28700	@ 0x701c
    44e4:	e3401000 	movt	r1, #0
    44e8:	e3a00001 	mov	r0, #1
    44ec:	eb0002c8 	bl	5014 <printf>
    exit();
    44f0:	eb000136 	bl	49d0 <exit>
  }
  close(open("usertests.ran", O_CREATE));
    44f4:	e3a01c02 	mov	r1, #512	@ 0x200
    44f8:	e307000c 	movw	r0, #28684	@ 0x700c
    44fc:	e3400000 	movt	r0, #0
    4500:	eb00019a 	bl	4b70 <open>
    4504:	e1a03000 	mov	r3, r0
    4508:	e1a00003 	mov	r0, r3
    450c:	eb000170 	bl	4ad4 <close>

  bigargtest();
    4510:	ebfffe92 	bl	3f60 <bigargtest>
  bigwrite();
    4514:	ebfff933 	bl	29e8 <bigwrite>
  bigargtest();
    4518:	ebfffe90 	bl	3f60 <bigargtest>
  bsstest();
    451c:	ebfffe62 	bl	3eac <bsstest>
  sbrktest();
    4520:	ebfffbea 	bl	34d0 <sbrktest>
  validatetest();
    4524:	ebfffe1f 	bl	3da8 <validatetest>

  opentest();
    4528:	ebffeeb4 	bl	0 <opentest>
  writetest();
    452c:	ebffeee9 	bl	d8 <writetest>
  writetest1();
    4530:	ebffef88 	bl	358 <writetest1>
  createtest();
    4534:	ebfff024 	bl	5cc <createtest>

  mem();
    4538:	ebfff1f8 	bl	d20 <mem>
  pipe1();
    453c:	ebfff0d5 	bl	898 <pipe1>
  preempt();
    4540:	ebfff16f 	bl	b04 <preempt>
  exitwait();
    4544:	ebfff1cb 	bl	c78 <exitwait>

  rmdot();
    4548:	ebfffa5a 	bl	2eb8 <rmdot>
  fourteen();
    454c:	ebfffa01 	bl	2d58 <fourteen>
  bigfile();
    4550:	ebfff96b 	bl	2b04 <bigfile>
  subdir();
    4554:	ebfff748 	bl	227c <subdir>
  concreate();
    4558:	ebfff552 	bl	1aa8 <concreate>
  linkunlink();
    455c:	ebfff66c 	bl	1f14 <linkunlink>
  linktest();
    4560:	ebfff4be 	bl	1860 <linktest>
  unlinkread();
    4564:	ebfff44e 	bl	16a4 <unlinkread>
  createdelete();
    4568:	ebfff36d 	bl	1324 <createdelete>
  twofiles();
    456c:	ebfff2bb 	bl	1060 <twofiles>
  sharedfd();
    4570:	ebfff229 	bl	e1c <sharedfd>
  dirfile();
    4574:	ebfffab3 	bl	3048 <dirfile>
  iref();
    4578:	ebfffb43 	bl	328c <iref>
  forktest();
    457c:	ebfffb91 	bl	33c8 <forktest>
  bigdir(); // slow
    4580:	ebfff6c2 	bl	2090 <bigdir>

  exectest();
    4584:	ebfff0a8 	bl	82c <exectest>

  exit();
    4588:	eb000110 	bl	49d0 <exit>

0000458c <strcpy>:
#include "user.h"
#include "arm.h"

char*
strcpy(char *s, char *t)
{
    458c:	e52db004 	push	{fp}		@ (str fp, [sp, #-4]!)
    4590:	e28db000 	add	fp, sp, #0
    4594:	e24dd014 	sub	sp, sp, #20
    4598:	e50b0010 	str	r0, [fp, #-16]
    459c:	e50b1014 	str	r1, [fp, #-20]	@ 0xffffffec
  char *os;

  os = s;
    45a0:	e51b3010 	ldr	r3, [fp, #-16]
    45a4:	e50b3008 	str	r3, [fp, #-8]
  while((*s++ = *t++) != 0)
    45a8:	e320f000 	nop	{0}
    45ac:	e51b2014 	ldr	r2, [fp, #-20]	@ 0xffffffec
    45b0:	e2823001 	add	r3, r2, #1
    45b4:	e50b3014 	str	r3, [fp, #-20]	@ 0xffffffec
    45b8:	e51b3010 	ldr	r3, [fp, #-16]
    45bc:	e2831001 	add	r1, r3, #1
    45c0:	e50b1010 	str	r1, [fp, #-16]
    45c4:	e5d22000 	ldrb	r2, [r2]
    45c8:	e5c32000 	strb	r2, [r3]
    45cc:	e5d33000 	ldrb	r3, [r3]
    45d0:	e3530000 	cmp	r3, #0
    45d4:	1afffff4 	bne	45ac <strcpy+0x20>
    ;
  return os;
    45d8:	e51b3008 	ldr	r3, [fp, #-8]
}
    45dc:	e1a00003 	mov	r0, r3
    45e0:	e28bd000 	add	sp, fp, #0
    45e4:	e49db004 	pop	{fp}		@ (ldr fp, [sp], #4)
    45e8:	e12fff1e 	bx	lr

000045ec <strcmp>:

int
strcmp(const char *p, const char *q)
{
    45ec:	e52db004 	push	{fp}		@ (str fp, [sp, #-4]!)
    45f0:	e28db000 	add	fp, sp, #0
    45f4:	e24dd00c 	sub	sp, sp, #12
    45f8:	e50b0008 	str	r0, [fp, #-8]
    45fc:	e50b100c 	str	r1, [fp, #-12]
  while(*p && *p == *q)
    4600:	ea000005 	b	461c <strcmp+0x30>
    p++, q++;
    4604:	e51b3008 	ldr	r3, [fp, #-8]
    4608:	e2833001 	add	r3, r3, #1
    460c:	e50b3008 	str	r3, [fp, #-8]
    4610:	e51b300c 	ldr	r3, [fp, #-12]
    4614:	e2833001 	add	r3, r3, #1
    4618:	e50b300c 	str	r3, [fp, #-12]
  while(*p && *p == *q)
    461c:	e51b3008 	ldr	r3, [fp, #-8]
    4620:	e5d33000 	ldrb	r3, [r3]
    4624:	e3530000 	cmp	r3, #0
    4628:	0a000005 	beq	4644 <strcmp+0x58>
    462c:	e51b3008 	ldr	r3, [fp, #-8]
    4630:	e5d32000 	ldrb	r2, [r3]
    4634:	e51b300c 	ldr	r3, [fp, #-12]
    4638:	e5d33000 	ldrb	r3, [r3]
    463c:	e1520003 	cmp	r2, r3
    4640:	0affffef 	beq	4604 <strcmp+0x18>
  return (uchar)*p - (uchar)*q;
    4644:	e51b3008 	ldr	r3, [fp, #-8]
    4648:	e5d33000 	ldrb	r3, [r3]
    464c:	e1a02003 	mov	r2, r3
    4650:	e51b300c 	ldr	r3, [fp, #-12]
    4654:	e5d33000 	ldrb	r3, [r3]
    4658:	e0423003 	sub	r3, r2, r3
}
    465c:	e1a00003 	mov	r0, r3
    4660:	e28bd000 	add	sp, fp, #0
    4664:	e49db004 	pop	{fp}		@ (ldr fp, [sp], #4)
    4668:	e12fff1e 	bx	lr

0000466c <strlen>:

uint
strlen(char *s)
{
    466c:	e52db004 	push	{fp}		@ (str fp, [sp, #-4]!)
    4670:	e28db000 	add	fp, sp, #0
    4674:	e24dd014 	sub	sp, sp, #20
    4678:	e50b0010 	str	r0, [fp, #-16]
  int n;

  for(n = 0; s[n]; n++)
    467c:	e3a03000 	mov	r3, #0
    4680:	e50b3008 	str	r3, [fp, #-8]
    4684:	ea000002 	b	4694 <strlen+0x28>
    4688:	e51b3008 	ldr	r3, [fp, #-8]
    468c:	e2833001 	add	r3, r3, #1
    4690:	e50b3008 	str	r3, [fp, #-8]
    4694:	e51b3008 	ldr	r3, [fp, #-8]
    4698:	e51b2010 	ldr	r2, [fp, #-16]
    469c:	e0823003 	add	r3, r2, r3
    46a0:	e5d33000 	ldrb	r3, [r3]
    46a4:	e3530000 	cmp	r3, #0
    46a8:	1afffff6 	bne	4688 <strlen+0x1c>
    ;
  return n;
    46ac:	e51b3008 	ldr	r3, [fp, #-8]
}
    46b0:	e1a00003 	mov	r0, r3
    46b4:	e28bd000 	add	sp, fp, #0
    46b8:	e49db004 	pop	{fp}		@ (ldr fp, [sp], #4)
    46bc:	e12fff1e 	bx	lr

000046c0 <memset>:

void*
memset(void *dst, int c, uint n)
{
    46c0:	e52db004 	push	{fp}		@ (str fp, [sp, #-4]!)
    46c4:	e28db000 	add	fp, sp, #0
    46c8:	e24dd01c 	sub	sp, sp, #28
    46cc:	e50b0010 	str	r0, [fp, #-16]
    46d0:	e50b1014 	str	r1, [fp, #-20]	@ 0xffffffec
    46d4:	e50b2018 	str	r2, [fp, #-24]	@ 0xffffffe8
  char *p=dst;
    46d8:	e51b3010 	ldr	r3, [fp, #-16]
    46dc:	e50b3008 	str	r3, [fp, #-8]
  u32 rc=n;
    46e0:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
    46e4:	e50b300c 	str	r3, [fp, #-12]

  while (rc-- > 0) *p++ = c;
    46e8:	ea000005 	b	4704 <memset+0x44>
    46ec:	e51b3008 	ldr	r3, [fp, #-8]
    46f0:	e2832001 	add	r2, r3, #1
    46f4:	e50b2008 	str	r2, [fp, #-8]
    46f8:	e51b2014 	ldr	r2, [fp, #-20]	@ 0xffffffec
    46fc:	e6ef2072 	uxtb	r2, r2
    4700:	e5c32000 	strb	r2, [r3]
    4704:	e51b300c 	ldr	r3, [fp, #-12]
    4708:	e2432001 	sub	r2, r3, #1
    470c:	e50b200c 	str	r2, [fp, #-12]
    4710:	e3530000 	cmp	r3, #0
    4714:	1afffff4 	bne	46ec <memset+0x2c>
  return (void *)p;
    4718:	e51b3008 	ldr	r3, [fp, #-8]
}
    471c:	e1a00003 	mov	r0, r3
    4720:	e28bd000 	add	sp, fp, #0
    4724:	e49db004 	pop	{fp}		@ (ldr fp, [sp], #4)
    4728:	e12fff1e 	bx	lr

0000472c <strchr>:

char*
strchr(const char *s, char c)
{
    472c:	e52db004 	push	{fp}		@ (str fp, [sp, #-4]!)
    4730:	e28db000 	add	fp, sp, #0
    4734:	e24dd00c 	sub	sp, sp, #12
    4738:	e50b0008 	str	r0, [fp, #-8]
    473c:	e1a03001 	mov	r3, r1
    4740:	e54b3009 	strb	r3, [fp, #-9]
  for(; *s; s++)
    4744:	ea000009 	b	4770 <strchr+0x44>
    if(*s == c)
    4748:	e51b3008 	ldr	r3, [fp, #-8]
    474c:	e5d33000 	ldrb	r3, [r3]
    4750:	e55b2009 	ldrb	r2, [fp, #-9]
    4754:	e1520003 	cmp	r2, r3
    4758:	1a000001 	bne	4764 <strchr+0x38>
      return (char*)s;
    475c:	e51b3008 	ldr	r3, [fp, #-8]
    4760:	ea000007 	b	4784 <strchr+0x58>
  for(; *s; s++)
    4764:	e51b3008 	ldr	r3, [fp, #-8]
    4768:	e2833001 	add	r3, r3, #1
    476c:	e50b3008 	str	r3, [fp, #-8]
    4770:	e51b3008 	ldr	r3, [fp, #-8]
    4774:	e5d33000 	ldrb	r3, [r3]
    4778:	e3530000 	cmp	r3, #0
    477c:	1afffff1 	bne	4748 <strchr+0x1c>
  return 0;
    4780:	e3a03000 	mov	r3, #0
}
    4784:	e1a00003 	mov	r0, r3
    4788:	e28bd000 	add	sp, fp, #0
    478c:	e49db004 	pop	{fp}		@ (ldr fp, [sp], #4)
    4790:	e12fff1e 	bx	lr

00004794 <gets>:

char*
gets(char *buf, int max)
{
    4794:	e92d4800 	push	{fp, lr}
    4798:	e28db004 	add	fp, sp, #4
    479c:	e24dd018 	sub	sp, sp, #24
    47a0:	e50b0018 	str	r0, [fp, #-24]	@ 0xffffffe8
    47a4:	e50b101c 	str	r1, [fp, #-28]	@ 0xffffffe4
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    47a8:	e3a03000 	mov	r3, #0
    47ac:	e50b3008 	str	r3, [fp, #-8]
    47b0:	ea000016 	b	4810 <gets+0x7c>
    cc = read(0, &c, 1);
    47b4:	e24b300d 	sub	r3, fp, #13
    47b8:	e3a02001 	mov	r2, #1
    47bc:	e1a01003 	mov	r1, r3
    47c0:	e3a00000 	mov	r0, #0
    47c4:	eb0000a8 	bl	4a6c <read>
    47c8:	e50b000c 	str	r0, [fp, #-12]
    if(cc < 1)
    47cc:	e51b300c 	ldr	r3, [fp, #-12]
    47d0:	e3530000 	cmp	r3, #0
    47d4:	da000013 	ble	4828 <gets+0x94>
      break;
    buf[i++] = c;
    47d8:	e51b3008 	ldr	r3, [fp, #-8]
    47dc:	e2832001 	add	r2, r3, #1
    47e0:	e50b2008 	str	r2, [fp, #-8]
    47e4:	e1a02003 	mov	r2, r3
    47e8:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
    47ec:	e0833002 	add	r3, r3, r2
    47f0:	e55b200d 	ldrb	r2, [fp, #-13]
    47f4:	e5c32000 	strb	r2, [r3]
    if(c == '\n' || c == '\r')
    47f8:	e55b300d 	ldrb	r3, [fp, #-13]
    47fc:	e353000a 	cmp	r3, #10
    4800:	0a000009 	beq	482c <gets+0x98>
    4804:	e55b300d 	ldrb	r3, [fp, #-13]
    4808:	e353000d 	cmp	r3, #13
    480c:	0a000006 	beq	482c <gets+0x98>
  for(i=0; i+1 < max; ){
    4810:	e51b3008 	ldr	r3, [fp, #-8]
    4814:	e2833001 	add	r3, r3, #1
    4818:	e51b201c 	ldr	r2, [fp, #-28]	@ 0xffffffe4
    481c:	e1520003 	cmp	r2, r3
    4820:	caffffe3 	bgt	47b4 <gets+0x20>
    4824:	ea000000 	b	482c <gets+0x98>
      break;
    4828:	e320f000 	nop	{0}
      break;
  }
  buf[i] = '\0';
    482c:	e51b3008 	ldr	r3, [fp, #-8]
    4830:	e51b2018 	ldr	r2, [fp, #-24]	@ 0xffffffe8
    4834:	e0823003 	add	r3, r2, r3
    4838:	e3a02000 	mov	r2, #0
    483c:	e5c32000 	strb	r2, [r3]
  return buf;
    4840:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
}
    4844:	e1a00003 	mov	r0, r3
    4848:	e24bd004 	sub	sp, fp, #4
    484c:	e8bd8800 	pop	{fp, pc}

00004850 <stat>:

int
stat(char *n, struct stat *st)
{
    4850:	e92d4800 	push	{fp, lr}
    4854:	e28db004 	add	fp, sp, #4
    4858:	e24dd010 	sub	sp, sp, #16
    485c:	e50b0010 	str	r0, [fp, #-16]
    4860:	e50b1014 	str	r1, [fp, #-20]	@ 0xffffffec
  int fd;
  int r;

  fd = open(n, O_RDONLY);
    4864:	e3a01000 	mov	r1, #0
    4868:	e51b0010 	ldr	r0, [fp, #-16]
    486c:	eb0000bf 	bl	4b70 <open>
    4870:	e50b0008 	str	r0, [fp, #-8]
  if(fd < 0)
    4874:	e51b3008 	ldr	r3, [fp, #-8]
    4878:	e3530000 	cmp	r3, #0
    487c:	aa000001 	bge	4888 <stat+0x38>
    return -1;
    4880:	e3e03000 	mvn	r3, #0
    4884:	ea000006 	b	48a4 <stat+0x54>
  r = fstat(fd, st);
    4888:	e51b1014 	ldr	r1, [fp, #-20]	@ 0xffffffec
    488c:	e51b0008 	ldr	r0, [fp, #-8]
    4890:	eb0000dd 	bl	4c0c <fstat>
    4894:	e50b000c 	str	r0, [fp, #-12]
  close(fd);
    4898:	e51b0008 	ldr	r0, [fp, #-8]
    489c:	eb00008c 	bl	4ad4 <close>
  return r;
    48a0:	e51b300c 	ldr	r3, [fp, #-12]
}
    48a4:	e1a00003 	mov	r0, r3
    48a8:	e24bd004 	sub	sp, fp, #4
    48ac:	e8bd8800 	pop	{fp, pc}

000048b0 <atoi>:

int
atoi(const char *s)
{
    48b0:	e52db004 	push	{fp}		@ (str fp, [sp, #-4]!)
    48b4:	e28db000 	add	fp, sp, #0
    48b8:	e24dd014 	sub	sp, sp, #20
    48bc:	e50b0010 	str	r0, [fp, #-16]
  int n;

  n = 0;
    48c0:	e3a03000 	mov	r3, #0
    48c4:	e50b3008 	str	r3, [fp, #-8]
  while('0' <= *s && *s <= '9')
    48c8:	ea000009 	b	48f4 <atoi+0x44>
    n = n*10 + *s++ - '0';
    48cc:	e51b3008 	ldr	r3, [fp, #-8]
    48d0:	e3a0200a 	mov	r2, #10
    48d4:	e0020392 	mul	r2, r2, r3
    48d8:	e51b3010 	ldr	r3, [fp, #-16]
    48dc:	e2831001 	add	r1, r3, #1
    48e0:	e50b1010 	str	r1, [fp, #-16]
    48e4:	e5d33000 	ldrb	r3, [r3]
    48e8:	e0823003 	add	r3, r2, r3
    48ec:	e2433030 	sub	r3, r3, #48	@ 0x30
    48f0:	e50b3008 	str	r3, [fp, #-8]
  while('0' <= *s && *s <= '9')
    48f4:	e51b3010 	ldr	r3, [fp, #-16]
    48f8:	e5d33000 	ldrb	r3, [r3]
    48fc:	e353002f 	cmp	r3, #47	@ 0x2f
    4900:	9a000003 	bls	4914 <atoi+0x64>
    4904:	e51b3010 	ldr	r3, [fp, #-16]
    4908:	e5d33000 	ldrb	r3, [r3]
    490c:	e3530039 	cmp	r3, #57	@ 0x39
    4910:	9affffed 	bls	48cc <atoi+0x1c>
  return n;
    4914:	e51b3008 	ldr	r3, [fp, #-8]
}
    4918:	e1a00003 	mov	r0, r3
    491c:	e28bd000 	add	sp, fp, #0
    4920:	e49db004 	pop	{fp}		@ (ldr fp, [sp], #4)
    4924:	e12fff1e 	bx	lr

00004928 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
    4928:	e52db004 	push	{fp}		@ (str fp, [sp, #-4]!)
    492c:	e28db000 	add	fp, sp, #0
    4930:	e24dd01c 	sub	sp, sp, #28
    4934:	e50b0010 	str	r0, [fp, #-16]
    4938:	e50b1014 	str	r1, [fp, #-20]	@ 0xffffffec
    493c:	e50b2018 	str	r2, [fp, #-24]	@ 0xffffffe8
  char *dst, *src;
  
  dst = vdst;
    4940:	e51b3010 	ldr	r3, [fp, #-16]
    4944:	e50b3008 	str	r3, [fp, #-8]
  src = vsrc;
    4948:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
    494c:	e50b300c 	str	r3, [fp, #-12]
  while(n-- > 0)
    4950:	ea000007 	b	4974 <memmove+0x4c>
    *dst++ = *src++;
    4954:	e51b200c 	ldr	r2, [fp, #-12]
    4958:	e2823001 	add	r3, r2, #1
    495c:	e50b300c 	str	r3, [fp, #-12]
    4960:	e51b3008 	ldr	r3, [fp, #-8]
    4964:	e2831001 	add	r1, r3, #1
    4968:	e50b1008 	str	r1, [fp, #-8]
    496c:	e5d22000 	ldrb	r2, [r2]
    4970:	e5c32000 	strb	r2, [r3]
  while(n-- > 0)
    4974:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
    4978:	e2432001 	sub	r2, r3, #1
    497c:	e50b2018 	str	r2, [fp, #-24]	@ 0xffffffe8
    4980:	e3530000 	cmp	r3, #0
    4984:	cafffff2 	bgt	4954 <memmove+0x2c>
  return vdst;
    4988:	e51b3010 	ldr	r3, [fp, #-16]
}
    498c:	e1a00003 	mov	r0, r3
    4990:	e28bd000 	add	sp, fp, #0
    4994:	e49db004 	pop	{fp}		@ (ldr fp, [sp], #4)
    4998:	e12fff1e 	bx	lr

0000499c <fork>:
    499c:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
    49a0:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
    49a4:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
    49a8:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
    49ac:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
    49b0:	e3a00001 	mov	r0, #1
    49b4:	ef000040 	svc	0x00000040
    49b8:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
    49bc:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
    49c0:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
    49c4:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
    49c8:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
    49cc:	e12fff1e 	bx	lr

000049d0 <exit>:
    49d0:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
    49d4:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
    49d8:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
    49dc:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
    49e0:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
    49e4:	e3a00002 	mov	r0, #2
    49e8:	ef000040 	svc	0x00000040
    49ec:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
    49f0:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
    49f4:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
    49f8:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
    49fc:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
    4a00:	e12fff1e 	bx	lr

00004a04 <wait>:
    4a04:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
    4a08:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
    4a0c:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
    4a10:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
    4a14:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
    4a18:	e3a00003 	mov	r0, #3
    4a1c:	ef000040 	svc	0x00000040
    4a20:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
    4a24:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
    4a28:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
    4a2c:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
    4a30:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
    4a34:	e12fff1e 	bx	lr

00004a38 <pipe>:
    4a38:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
    4a3c:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
    4a40:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
    4a44:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
    4a48:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
    4a4c:	e3a00004 	mov	r0, #4
    4a50:	ef000040 	svc	0x00000040
    4a54:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
    4a58:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
    4a5c:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
    4a60:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
    4a64:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
    4a68:	e12fff1e 	bx	lr

00004a6c <read>:
    4a6c:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
    4a70:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
    4a74:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
    4a78:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
    4a7c:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
    4a80:	e3a00005 	mov	r0, #5
    4a84:	ef000040 	svc	0x00000040
    4a88:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
    4a8c:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
    4a90:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
    4a94:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
    4a98:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
    4a9c:	e12fff1e 	bx	lr

00004aa0 <write>:
    4aa0:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
    4aa4:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
    4aa8:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
    4aac:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
    4ab0:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
    4ab4:	e3a00010 	mov	r0, #16
    4ab8:	ef000040 	svc	0x00000040
    4abc:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
    4ac0:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
    4ac4:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
    4ac8:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
    4acc:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
    4ad0:	e12fff1e 	bx	lr

00004ad4 <close>:
    4ad4:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
    4ad8:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
    4adc:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
    4ae0:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
    4ae4:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
    4ae8:	e3a00015 	mov	r0, #21
    4aec:	ef000040 	svc	0x00000040
    4af0:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
    4af4:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
    4af8:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
    4afc:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
    4b00:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
    4b04:	e12fff1e 	bx	lr

00004b08 <kill>:
    4b08:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
    4b0c:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
    4b10:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
    4b14:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
    4b18:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
    4b1c:	e3a00006 	mov	r0, #6
    4b20:	ef000040 	svc	0x00000040
    4b24:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
    4b28:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
    4b2c:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
    4b30:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
    4b34:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
    4b38:	e12fff1e 	bx	lr

00004b3c <exec>:
    4b3c:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
    4b40:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
    4b44:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
    4b48:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
    4b4c:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
    4b50:	e3a00007 	mov	r0, #7
    4b54:	ef000040 	svc	0x00000040
    4b58:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
    4b5c:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
    4b60:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
    4b64:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
    4b68:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
    4b6c:	e12fff1e 	bx	lr

00004b70 <open>:
    4b70:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
    4b74:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
    4b78:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
    4b7c:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
    4b80:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
    4b84:	e3a0000f 	mov	r0, #15
    4b88:	ef000040 	svc	0x00000040
    4b8c:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
    4b90:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
    4b94:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
    4b98:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
    4b9c:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
    4ba0:	e12fff1e 	bx	lr

00004ba4 <mknod>:
    4ba4:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
    4ba8:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
    4bac:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
    4bb0:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
    4bb4:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
    4bb8:	e3a00011 	mov	r0, #17
    4bbc:	ef000040 	svc	0x00000040
    4bc0:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
    4bc4:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
    4bc8:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
    4bcc:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
    4bd0:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
    4bd4:	e12fff1e 	bx	lr

00004bd8 <unlink>:
    4bd8:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
    4bdc:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
    4be0:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
    4be4:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
    4be8:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
    4bec:	e3a00012 	mov	r0, #18
    4bf0:	ef000040 	svc	0x00000040
    4bf4:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
    4bf8:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
    4bfc:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
    4c00:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
    4c04:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
    4c08:	e12fff1e 	bx	lr

00004c0c <fstat>:
    4c0c:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
    4c10:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
    4c14:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
    4c18:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
    4c1c:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
    4c20:	e3a00008 	mov	r0, #8
    4c24:	ef000040 	svc	0x00000040
    4c28:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
    4c2c:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
    4c30:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
    4c34:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
    4c38:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
    4c3c:	e12fff1e 	bx	lr

00004c40 <link>:
    4c40:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
    4c44:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
    4c48:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
    4c4c:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
    4c50:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
    4c54:	e3a00013 	mov	r0, #19
    4c58:	ef000040 	svc	0x00000040
    4c5c:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
    4c60:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
    4c64:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
    4c68:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
    4c6c:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
    4c70:	e12fff1e 	bx	lr

00004c74 <mkdir>:
    4c74:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
    4c78:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
    4c7c:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
    4c80:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
    4c84:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
    4c88:	e3a00014 	mov	r0, #20
    4c8c:	ef000040 	svc	0x00000040
    4c90:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
    4c94:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
    4c98:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
    4c9c:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
    4ca0:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
    4ca4:	e12fff1e 	bx	lr

00004ca8 <chdir>:
    4ca8:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
    4cac:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
    4cb0:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
    4cb4:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
    4cb8:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
    4cbc:	e3a00009 	mov	r0, #9
    4cc0:	ef000040 	svc	0x00000040
    4cc4:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
    4cc8:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
    4ccc:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
    4cd0:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
    4cd4:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
    4cd8:	e12fff1e 	bx	lr

00004cdc <dup>:
    4cdc:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
    4ce0:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
    4ce4:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
    4ce8:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
    4cec:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
    4cf0:	e3a0000a 	mov	r0, #10
    4cf4:	ef000040 	svc	0x00000040
    4cf8:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
    4cfc:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
    4d00:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
    4d04:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
    4d08:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
    4d0c:	e12fff1e 	bx	lr

00004d10 <getpid>:
    4d10:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
    4d14:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
    4d18:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
    4d1c:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
    4d20:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
    4d24:	e3a0000b 	mov	r0, #11
    4d28:	ef000040 	svc	0x00000040
    4d2c:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
    4d30:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
    4d34:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
    4d38:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
    4d3c:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
    4d40:	e12fff1e 	bx	lr

00004d44 <sbrk>:
    4d44:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
    4d48:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
    4d4c:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
    4d50:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
    4d54:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
    4d58:	e3a0000c 	mov	r0, #12
    4d5c:	ef000040 	svc	0x00000040
    4d60:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
    4d64:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
    4d68:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
    4d6c:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
    4d70:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
    4d74:	e12fff1e 	bx	lr

00004d78 <sleep>:
    4d78:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
    4d7c:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
    4d80:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
    4d84:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
    4d88:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
    4d8c:	e3a0000d 	mov	r0, #13
    4d90:	ef000040 	svc	0x00000040
    4d94:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
    4d98:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
    4d9c:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
    4da0:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
    4da4:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
    4da8:	e12fff1e 	bx	lr

00004dac <uptime>:
    4dac:	e52de004 	push	{lr}		@ (str lr, [sp, #-4]!)
    4db0:	e52d3004 	push	{r3}		@ (str r3, [sp, #-4]!)
    4db4:	e52d2004 	push	{r2}		@ (str r2, [sp, #-4]!)
    4db8:	e52d1004 	push	{r1}		@ (str r1, [sp, #-4]!)
    4dbc:	e52d0004 	push	{r0}		@ (str r0, [sp, #-4]!)
    4dc0:	e3a0000e 	mov	r0, #14
    4dc4:	ef000040 	svc	0x00000040
    4dc8:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
    4dcc:	e49d1004 	pop	{r1}		@ (ldr r1, [sp], #4)
    4dd0:	e49d2004 	pop	{r2}		@ (ldr r2, [sp], #4)
    4dd4:	e49d3004 	pop	{r3}		@ (ldr r3, [sp], #4)
    4dd8:	e49de004 	pop	{lr}		@ (ldr lr, [sp], #4)
    4ddc:	e12fff1e 	bx	lr

00004de0 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
    4de0:	e92d4800 	push	{fp, lr}
    4de4:	e28db004 	add	fp, sp, #4
    4de8:	e24dd008 	sub	sp, sp, #8
    4dec:	e50b0008 	str	r0, [fp, #-8]
    4df0:	e1a03001 	mov	r3, r1
    4df4:	e54b3009 	strb	r3, [fp, #-9]
  write(fd, &c, 1);
    4df8:	e24b3009 	sub	r3, fp, #9
    4dfc:	e3a02001 	mov	r2, #1
    4e00:	e1a01003 	mov	r1, r3
    4e04:	e51b0008 	ldr	r0, [fp, #-8]
    4e08:	ebffff24 	bl	4aa0 <write>
}
    4e0c:	e320f000 	nop	{0}
    4e10:	e24bd004 	sub	sp, fp, #4
    4e14:	e8bd8800 	pop	{fp, pc}

00004e18 <div>:

u32 div(u32 n, u32 d)  // long division
{
    4e18:	e52db004 	push	{fp}		@ (str fp, [sp, #-4]!)
    4e1c:	e28db000 	add	fp, sp, #0
    4e20:	e24dd01c 	sub	sp, sp, #28
    4e24:	e50b0018 	str	r0, [fp, #-24]	@ 0xffffffe8
    4e28:	e50b101c 	str	r1, [fp, #-28]	@ 0xffffffe4
    u32 q=0, r=0;
    4e2c:	e3a03000 	mov	r3, #0
    4e30:	e50b3008 	str	r3, [fp, #-8]
    4e34:	e3a03000 	mov	r3, #0
    4e38:	e50b300c 	str	r3, [fp, #-12]
    int i;

    for(i=31;i>=0;i--){
    4e3c:	e3a0301f 	mov	r3, #31
    4e40:	e50b3010 	str	r3, [fp, #-16]
    4e44:	ea00001b 	b	4eb8 <div+0xa0>
        r = r << 1;
    4e48:	e51b300c 	ldr	r3, [fp, #-12]
    4e4c:	e1a03083 	lsl	r3, r3, #1
    4e50:	e50b300c 	str	r3, [fp, #-12]
        r = r | ((n >> i) & 1);
    4e54:	e51b2018 	ldr	r2, [fp, #-24]	@ 0xffffffe8
    4e58:	e51b3010 	ldr	r3, [fp, #-16]
    4e5c:	e1a03332 	lsr	r3, r2, r3
    4e60:	e2033001 	and	r3, r3, #1
    4e64:	e51b200c 	ldr	r2, [fp, #-12]
    4e68:	e1823003 	orr	r3, r2, r3
    4e6c:	e50b300c 	str	r3, [fp, #-12]
        if(r >= d) {
    4e70:	e51b200c 	ldr	r2, [fp, #-12]
    4e74:	e51b301c 	ldr	r3, [fp, #-28]	@ 0xffffffe4
    4e78:	e1520003 	cmp	r2, r3
    4e7c:	3a00000a 	bcc	4eac <div+0x94>
            r = r - d;
    4e80:	e51b200c 	ldr	r2, [fp, #-12]
    4e84:	e51b301c 	ldr	r3, [fp, #-28]	@ 0xffffffe4
    4e88:	e0423003 	sub	r3, r2, r3
    4e8c:	e50b300c 	str	r3, [fp, #-12]
            q = q | (1 << i);
    4e90:	e3a02001 	mov	r2, #1
    4e94:	e51b3010 	ldr	r3, [fp, #-16]
    4e98:	e1a03312 	lsl	r3, r2, r3
    4e9c:	e1a02003 	mov	r2, r3
    4ea0:	e51b3008 	ldr	r3, [fp, #-8]
    4ea4:	e1833002 	orr	r3, r3, r2
    4ea8:	e50b3008 	str	r3, [fp, #-8]
    for(i=31;i>=0;i--){
    4eac:	e51b3010 	ldr	r3, [fp, #-16]
    4eb0:	e2433001 	sub	r3, r3, #1
    4eb4:	e50b3010 	str	r3, [fp, #-16]
    4eb8:	e51b3010 	ldr	r3, [fp, #-16]
    4ebc:	e3530000 	cmp	r3, #0
    4ec0:	aaffffe0 	bge	4e48 <div+0x30>
        }
    }
    return q;
    4ec4:	e51b3008 	ldr	r3, [fp, #-8]
}
    4ec8:	e1a00003 	mov	r0, r3
    4ecc:	e28bd000 	add	sp, fp, #0
    4ed0:	e49db004 	pop	{fp}		@ (ldr fp, [sp], #4)
    4ed4:	e12fff1e 	bx	lr

00004ed8 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
    4ed8:	e92d4800 	push	{fp, lr}
    4edc:	e28db004 	add	fp, sp, #4
    4ee0:	e24dd038 	sub	sp, sp, #56	@ 0x38
    4ee4:	e50b0030 	str	r0, [fp, #-48]	@ 0xffffffd0
    4ee8:	e50b1034 	str	r1, [fp, #-52]	@ 0xffffffcc
    4eec:	e50b2038 	str	r2, [fp, #-56]	@ 0xffffffc8
    4ef0:	e50b303c 	str	r3, [fp, #-60]	@ 0xffffffc4
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x, y, b;

  neg = 0;
    4ef4:	e3a03000 	mov	r3, #0
    4ef8:	e50b300c 	str	r3, [fp, #-12]
  if(sgn && xx < 0){
    4efc:	e51b303c 	ldr	r3, [fp, #-60]	@ 0xffffffc4
    4f00:	e3530000 	cmp	r3, #0
    4f04:	0a000008 	beq	4f2c <printint+0x54>
    4f08:	e51b3034 	ldr	r3, [fp, #-52]	@ 0xffffffcc
    4f0c:	e3530000 	cmp	r3, #0
    4f10:	aa000005 	bge	4f2c <printint+0x54>
    neg = 1;
    4f14:	e3a03001 	mov	r3, #1
    4f18:	e50b300c 	str	r3, [fp, #-12]
    x = -xx;
    4f1c:	e51b3034 	ldr	r3, [fp, #-52]	@ 0xffffffcc
    4f20:	e2633000 	rsb	r3, r3, #0
    4f24:	e50b3010 	str	r3, [fp, #-16]
    4f28:	ea000001 	b	4f34 <printint+0x5c>
  } else {
    x = xx;
    4f2c:	e51b3034 	ldr	r3, [fp, #-52]	@ 0xffffffcc
    4f30:	e50b3010 	str	r3, [fp, #-16]
  }

  b = base;
    4f34:	e51b3038 	ldr	r3, [fp, #-56]	@ 0xffffffc8
    4f38:	e50b3014 	str	r3, [fp, #-20]	@ 0xffffffec
  i = 0;
    4f3c:	e3a03000 	mov	r3, #0
    4f40:	e50b3008 	str	r3, [fp, #-8]
  do{
    y = div(x, b);
    4f44:	e51b1014 	ldr	r1, [fp, #-20]	@ 0xffffffec
    4f48:	e51b0010 	ldr	r0, [fp, #-16]
    4f4c:	ebffffb1 	bl	4e18 <div>
    4f50:	e50b0018 	str	r0, [fp, #-24]	@ 0xffffffe8
    buf[i++] = digits[x - y * b];
    4f54:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
    4f58:	e51b2014 	ldr	r2, [fp, #-20]	@ 0xffffffec
    4f5c:	e0030392 	mul	r3, r2, r3
    4f60:	e51b2010 	ldr	r2, [fp, #-16]
    4f64:	e0421003 	sub	r1, r2, r3
    4f68:	e51b2008 	ldr	r2, [fp, #-8]
    4f6c:	e2823001 	add	r3, r2, #1
    4f70:	e50b3008 	str	r3, [fp, #-8]
    4f74:	e307306c 	movw	r3, #28780	@ 0x706c
    4f78:	e3403000 	movt	r3, #0
    4f7c:	e7d31001 	ldrb	r1, [r3, r1]
    4f80:	e2423004 	sub	r3, r2, #4
    4f84:	e083300b 	add	r3, r3, fp
    4f88:	e1a02001 	mov	r2, r1
    4f8c:	e5432024 	strb	r2, [r3, #-36]	@ 0xffffffdc
  }while((x = y) != 0);
    4f90:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
    4f94:	e50b3010 	str	r3, [fp, #-16]
    4f98:	e51b3010 	ldr	r3, [fp, #-16]
    4f9c:	e3530000 	cmp	r3, #0
    4fa0:	1affffe7 	bne	4f44 <printint+0x6c>
  if(neg)
    4fa4:	e51b300c 	ldr	r3, [fp, #-12]
    4fa8:	e3530000 	cmp	r3, #0
    4fac:	0a00000e 	beq	4fec <printint+0x114>
    buf[i++] = '-';
    4fb0:	e51b3008 	ldr	r3, [fp, #-8]
    4fb4:	e2832001 	add	r2, r3, #1
    4fb8:	e50b2008 	str	r2, [fp, #-8]
    4fbc:	e2433004 	sub	r3, r3, #4
    4fc0:	e083300b 	add	r3, r3, fp
    4fc4:	e3a0202d 	mov	r2, #45	@ 0x2d
    4fc8:	e5432024 	strb	r2, [r3, #-36]	@ 0xffffffdc

  while(--i >= 0)
    4fcc:	ea000006 	b	4fec <printint+0x114>
    putc(fd, buf[i]);
    4fd0:	e24b2028 	sub	r2, fp, #40	@ 0x28
    4fd4:	e51b3008 	ldr	r3, [fp, #-8]
    4fd8:	e0823003 	add	r3, r2, r3
    4fdc:	e5d33000 	ldrb	r3, [r3]
    4fe0:	e1a01003 	mov	r1, r3
    4fe4:	e51b0030 	ldr	r0, [fp, #-48]	@ 0xffffffd0
    4fe8:	ebffff7c 	bl	4de0 <putc>
  while(--i >= 0)
    4fec:	e51b3008 	ldr	r3, [fp, #-8]
    4ff0:	e2433001 	sub	r3, r3, #1
    4ff4:	e50b3008 	str	r3, [fp, #-8]
    4ff8:	e51b3008 	ldr	r3, [fp, #-8]
    4ffc:	e3530000 	cmp	r3, #0
    5000:	aafffff2 	bge	4fd0 <printint+0xf8>
}
    5004:	e320f000 	nop	{0}
    5008:	e320f000 	nop	{0}
    500c:	e24bd004 	sub	sp, fp, #4
    5010:	e8bd8800 	pop	{fp, pc}

00005014 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
    5014:	e92d000e 	push	{r1, r2, r3}
    5018:	e92d4800 	push	{fp, lr}
    501c:	e28db004 	add	fp, sp, #4
    5020:	e24dd024 	sub	sp, sp, #36	@ 0x24
    5024:	e50b0024 	str	r0, [fp, #-36]	@ 0xffffffdc
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
    5028:	e3a03000 	mov	r3, #0
    502c:	e50b3014 	str	r3, [fp, #-20]	@ 0xffffffec
  ap = (uint*)(void*)&fmt + 1;
    5030:	e28b3008 	add	r3, fp, #8
    5034:	e50b3018 	str	r3, [fp, #-24]	@ 0xffffffe8
  for(i = 0; fmt[i]; i++){
    5038:	e3a03000 	mov	r3, #0
    503c:	e50b3010 	str	r3, [fp, #-16]
    5040:	ea000075 	b	521c <printf+0x208>
    c = fmt[i] & 0xff;
    5044:	e59b2004 	ldr	r2, [fp, #4]
    5048:	e51b3010 	ldr	r3, [fp, #-16]
    504c:	e0823003 	add	r3, r2, r3
    5050:	e5d33000 	ldrb	r3, [r3]
    5054:	e50b301c 	str	r3, [fp, #-28]	@ 0xffffffe4
    if(state == 0){
    5058:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
    505c:	e3530000 	cmp	r3, #0
    5060:	1a00000b 	bne	5094 <printf+0x80>
      if(c == '%'){
    5064:	e51b301c 	ldr	r3, [fp, #-28]	@ 0xffffffe4
    5068:	e3530025 	cmp	r3, #37	@ 0x25
    506c:	1a000002 	bne	507c <printf+0x68>
        state = '%';
    5070:	e3a03025 	mov	r3, #37	@ 0x25
    5074:	e50b3014 	str	r3, [fp, #-20]	@ 0xffffffec
    5078:	ea000064 	b	5210 <printf+0x1fc>
      } else {
        putc(fd, c);
    507c:	e51b301c 	ldr	r3, [fp, #-28]	@ 0xffffffe4
    5080:	e6ef3073 	uxtb	r3, r3
    5084:	e1a01003 	mov	r1, r3
    5088:	e51b0024 	ldr	r0, [fp, #-36]	@ 0xffffffdc
    508c:	ebffff53 	bl	4de0 <putc>
    5090:	ea00005e 	b	5210 <printf+0x1fc>
      }
    } else if(state == '%'){
    5094:	e51b3014 	ldr	r3, [fp, #-20]	@ 0xffffffec
    5098:	e3530025 	cmp	r3, #37	@ 0x25
    509c:	1a00005b 	bne	5210 <printf+0x1fc>
      if(c == 'd'){
    50a0:	e51b301c 	ldr	r3, [fp, #-28]	@ 0xffffffe4
    50a4:	e3530064 	cmp	r3, #100	@ 0x64
    50a8:	1a00000a 	bne	50d8 <printf+0xc4>
        printint(fd, *ap, 10, 1);
    50ac:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
    50b0:	e5933000 	ldr	r3, [r3]
    50b4:	e1a01003 	mov	r1, r3
    50b8:	e3a03001 	mov	r3, #1
    50bc:	e3a0200a 	mov	r2, #10
    50c0:	e51b0024 	ldr	r0, [fp, #-36]	@ 0xffffffdc
    50c4:	ebffff83 	bl	4ed8 <printint>
        ap++;
    50c8:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
    50cc:	e2833004 	add	r3, r3, #4
    50d0:	e50b3018 	str	r3, [fp, #-24]	@ 0xffffffe8
    50d4:	ea00004b 	b	5208 <printf+0x1f4>
      } else if(c == 'x' || c == 'p'){
    50d8:	e51b301c 	ldr	r3, [fp, #-28]	@ 0xffffffe4
    50dc:	e3530078 	cmp	r3, #120	@ 0x78
    50e0:	0a000002 	beq	50f0 <printf+0xdc>
    50e4:	e51b301c 	ldr	r3, [fp, #-28]	@ 0xffffffe4
    50e8:	e3530070 	cmp	r3, #112	@ 0x70
    50ec:	1a00000a 	bne	511c <printf+0x108>
        printint(fd, *ap, 16, 0);
    50f0:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
    50f4:	e5933000 	ldr	r3, [r3]
    50f8:	e1a01003 	mov	r1, r3
    50fc:	e3a03000 	mov	r3, #0
    5100:	e3a02010 	mov	r2, #16
    5104:	e51b0024 	ldr	r0, [fp, #-36]	@ 0xffffffdc
    5108:	ebffff72 	bl	4ed8 <printint>
        ap++;
    510c:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
    5110:	e2833004 	add	r3, r3, #4
    5114:	e50b3018 	str	r3, [fp, #-24]	@ 0xffffffe8
    5118:	ea00003a 	b	5208 <printf+0x1f4>
      } else if(c == 's'){
    511c:	e51b301c 	ldr	r3, [fp, #-28]	@ 0xffffffe4
    5120:	e3530073 	cmp	r3, #115	@ 0x73
    5124:	1a000019 	bne	5190 <printf+0x17c>
        s = (char*)*ap;
    5128:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
    512c:	e5933000 	ldr	r3, [r3]
    5130:	e50b300c 	str	r3, [fp, #-12]
        ap++;
    5134:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
    5138:	e2833004 	add	r3, r3, #4
    513c:	e50b3018 	str	r3, [fp, #-24]	@ 0xffffffe8
        if(s == 0)
    5140:	e51b300c 	ldr	r3, [fp, #-12]
    5144:	e3530000 	cmp	r3, #0
    5148:	1a00000b 	bne	517c <printf+0x168>
          s = "(null)";
    514c:	e3073048 	movw	r3, #28744	@ 0x7048
    5150:	e3403000 	movt	r3, #0
    5154:	e50b300c 	str	r3, [fp, #-12]
        while(*s != 0){
    5158:	ea000007 	b	517c <printf+0x168>
          putc(fd, *s);
    515c:	e51b300c 	ldr	r3, [fp, #-12]
    5160:	e5d33000 	ldrb	r3, [r3]
    5164:	e1a01003 	mov	r1, r3
    5168:	e51b0024 	ldr	r0, [fp, #-36]	@ 0xffffffdc
    516c:	ebffff1b 	bl	4de0 <putc>
          s++;
    5170:	e51b300c 	ldr	r3, [fp, #-12]
    5174:	e2833001 	add	r3, r3, #1
    5178:	e50b300c 	str	r3, [fp, #-12]
        while(*s != 0){
    517c:	e51b300c 	ldr	r3, [fp, #-12]
    5180:	e5d33000 	ldrb	r3, [r3]
    5184:	e3530000 	cmp	r3, #0
    5188:	1afffff3 	bne	515c <printf+0x148>
    518c:	ea00001d 	b	5208 <printf+0x1f4>
        }
      } else if(c == 'c'){
    5190:	e51b301c 	ldr	r3, [fp, #-28]	@ 0xffffffe4
    5194:	e3530063 	cmp	r3, #99	@ 0x63
    5198:	1a000009 	bne	51c4 <printf+0x1b0>
        putc(fd, *ap);
    519c:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
    51a0:	e5933000 	ldr	r3, [r3]
    51a4:	e6ef3073 	uxtb	r3, r3
    51a8:	e1a01003 	mov	r1, r3
    51ac:	e51b0024 	ldr	r0, [fp, #-36]	@ 0xffffffdc
    51b0:	ebffff0a 	bl	4de0 <putc>
        ap++;
    51b4:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
    51b8:	e2833004 	add	r3, r3, #4
    51bc:	e50b3018 	str	r3, [fp, #-24]	@ 0xffffffe8
    51c0:	ea000010 	b	5208 <printf+0x1f4>
      } else if(c == '%'){
    51c4:	e51b301c 	ldr	r3, [fp, #-28]	@ 0xffffffe4
    51c8:	e3530025 	cmp	r3, #37	@ 0x25
    51cc:	1a000005 	bne	51e8 <printf+0x1d4>
        putc(fd, c);
    51d0:	e51b301c 	ldr	r3, [fp, #-28]	@ 0xffffffe4
    51d4:	e6ef3073 	uxtb	r3, r3
    51d8:	e1a01003 	mov	r1, r3
    51dc:	e51b0024 	ldr	r0, [fp, #-36]	@ 0xffffffdc
    51e0:	ebfffefe 	bl	4de0 <putc>
    51e4:	ea000007 	b	5208 <printf+0x1f4>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
    51e8:	e3a01025 	mov	r1, #37	@ 0x25
    51ec:	e51b0024 	ldr	r0, [fp, #-36]	@ 0xffffffdc
    51f0:	ebfffefa 	bl	4de0 <putc>
        putc(fd, c);
    51f4:	e51b301c 	ldr	r3, [fp, #-28]	@ 0xffffffe4
    51f8:	e6ef3073 	uxtb	r3, r3
    51fc:	e1a01003 	mov	r1, r3
    5200:	e51b0024 	ldr	r0, [fp, #-36]	@ 0xffffffdc
    5204:	ebfffef5 	bl	4de0 <putc>
      }
      state = 0;
    5208:	e3a03000 	mov	r3, #0
    520c:	e50b3014 	str	r3, [fp, #-20]	@ 0xffffffec
  for(i = 0; fmt[i]; i++){
    5210:	e51b3010 	ldr	r3, [fp, #-16]
    5214:	e2833001 	add	r3, r3, #1
    5218:	e50b3010 	str	r3, [fp, #-16]
    521c:	e59b2004 	ldr	r2, [fp, #4]
    5220:	e51b3010 	ldr	r3, [fp, #-16]
    5224:	e0823003 	add	r3, r2, r3
    5228:	e5d33000 	ldrb	r3, [r3]
    522c:	e3530000 	cmp	r3, #0
    5230:	1affff83 	bne	5044 <printf+0x30>
    }
  }
}
    5234:	e320f000 	nop	{0}
    5238:	e320f000 	nop	{0}
    523c:	e24bd004 	sub	sp, fp, #4
    5240:	e8bd4800 	pop	{fp, lr}
    5244:	e28dd00c 	add	sp, sp, #12
    5248:	e12fff1e 	bx	lr

0000524c <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    524c:	e52db004 	push	{fp}		@ (str fp, [sp, #-4]!)
    5250:	e28db000 	add	fp, sp, #0
    5254:	e24dd014 	sub	sp, sp, #20
    5258:	e50b0010 	str	r0, [fp, #-16]
  Header *bp, *p;

  bp = (Header*)ap - 1;
    525c:	e51b3010 	ldr	r3, [fp, #-16]
    5260:	e2433008 	sub	r3, r3, #8
    5264:	e50b300c 	str	r3, [fp, #-12]
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    5268:	e30b381c 	movw	r3, #47132	@ 0xb81c
    526c:	e3403000 	movt	r3, #0
    5270:	e5933000 	ldr	r3, [r3]
    5274:	e50b3008 	str	r3, [fp, #-8]
    5278:	ea000010 	b	52c0 <free+0x74>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    527c:	e51b3008 	ldr	r3, [fp, #-8]
    5280:	e5933000 	ldr	r3, [r3]
    5284:	e51b2008 	ldr	r2, [fp, #-8]
    5288:	e1520003 	cmp	r2, r3
    528c:	3a000008 	bcc	52b4 <free+0x68>
    5290:	e51b200c 	ldr	r2, [fp, #-12]
    5294:	e51b3008 	ldr	r3, [fp, #-8]
    5298:	e1520003 	cmp	r2, r3
    529c:	8a000010 	bhi	52e4 <free+0x98>
    52a0:	e51b3008 	ldr	r3, [fp, #-8]
    52a4:	e5933000 	ldr	r3, [r3]
    52a8:	e51b200c 	ldr	r2, [fp, #-12]
    52ac:	e1520003 	cmp	r2, r3
    52b0:	3a00000b 	bcc	52e4 <free+0x98>
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    52b4:	e51b3008 	ldr	r3, [fp, #-8]
    52b8:	e5933000 	ldr	r3, [r3]
    52bc:	e50b3008 	str	r3, [fp, #-8]
    52c0:	e51b200c 	ldr	r2, [fp, #-12]
    52c4:	e51b3008 	ldr	r3, [fp, #-8]
    52c8:	e1520003 	cmp	r2, r3
    52cc:	9affffea 	bls	527c <free+0x30>
    52d0:	e51b3008 	ldr	r3, [fp, #-8]
    52d4:	e5933000 	ldr	r3, [r3]
    52d8:	e51b200c 	ldr	r2, [fp, #-12]
    52dc:	e1520003 	cmp	r2, r3
    52e0:	2affffe5 	bcs	527c <free+0x30>
      break;
  if(bp + bp->s.size == p->s.ptr){
    52e4:	e51b300c 	ldr	r3, [fp, #-12]
    52e8:	e5933004 	ldr	r3, [r3, #4]
    52ec:	e1a03183 	lsl	r3, r3, #3
    52f0:	e51b200c 	ldr	r2, [fp, #-12]
    52f4:	e0822003 	add	r2, r2, r3
    52f8:	e51b3008 	ldr	r3, [fp, #-8]
    52fc:	e5933000 	ldr	r3, [r3]
    5300:	e1520003 	cmp	r2, r3
    5304:	1a00000d 	bne	5340 <free+0xf4>
    bp->s.size += p->s.ptr->s.size;
    5308:	e51b300c 	ldr	r3, [fp, #-12]
    530c:	e5932004 	ldr	r2, [r3, #4]
    5310:	e51b3008 	ldr	r3, [fp, #-8]
    5314:	e5933000 	ldr	r3, [r3]
    5318:	e5933004 	ldr	r3, [r3, #4]
    531c:	e0822003 	add	r2, r2, r3
    5320:	e51b300c 	ldr	r3, [fp, #-12]
    5324:	e5832004 	str	r2, [r3, #4]
    bp->s.ptr = p->s.ptr->s.ptr;
    5328:	e51b3008 	ldr	r3, [fp, #-8]
    532c:	e5933000 	ldr	r3, [r3]
    5330:	e5932000 	ldr	r2, [r3]
    5334:	e51b300c 	ldr	r3, [fp, #-12]
    5338:	e5832000 	str	r2, [r3]
    533c:	ea000003 	b	5350 <free+0x104>
  } else
    bp->s.ptr = p->s.ptr;
    5340:	e51b3008 	ldr	r3, [fp, #-8]
    5344:	e5932000 	ldr	r2, [r3]
    5348:	e51b300c 	ldr	r3, [fp, #-12]
    534c:	e5832000 	str	r2, [r3]
  if(p + p->s.size == bp){
    5350:	e51b3008 	ldr	r3, [fp, #-8]
    5354:	e5933004 	ldr	r3, [r3, #4]
    5358:	e1a03183 	lsl	r3, r3, #3
    535c:	e51b2008 	ldr	r2, [fp, #-8]
    5360:	e0823003 	add	r3, r2, r3
    5364:	e51b200c 	ldr	r2, [fp, #-12]
    5368:	e1520003 	cmp	r2, r3
    536c:	1a00000b 	bne	53a0 <free+0x154>
    p->s.size += bp->s.size;
    5370:	e51b3008 	ldr	r3, [fp, #-8]
    5374:	e5932004 	ldr	r2, [r3, #4]
    5378:	e51b300c 	ldr	r3, [fp, #-12]
    537c:	e5933004 	ldr	r3, [r3, #4]
    5380:	e0822003 	add	r2, r2, r3
    5384:	e51b3008 	ldr	r3, [fp, #-8]
    5388:	e5832004 	str	r2, [r3, #4]
    p->s.ptr = bp->s.ptr;
    538c:	e51b300c 	ldr	r3, [fp, #-12]
    5390:	e5932000 	ldr	r2, [r3]
    5394:	e51b3008 	ldr	r3, [fp, #-8]
    5398:	e5832000 	str	r2, [r3]
    539c:	ea000002 	b	53ac <free+0x160>
  } else
    p->s.ptr = bp;
    53a0:	e51b3008 	ldr	r3, [fp, #-8]
    53a4:	e51b200c 	ldr	r2, [fp, #-12]
    53a8:	e5832000 	str	r2, [r3]
  freep = p;
    53ac:	e30b381c 	movw	r3, #47132	@ 0xb81c
    53b0:	e3403000 	movt	r3, #0
    53b4:	e51b2008 	ldr	r2, [fp, #-8]
    53b8:	e5832000 	str	r2, [r3]
}
    53bc:	e320f000 	nop	{0}
    53c0:	e28bd000 	add	sp, fp, #0
    53c4:	e49db004 	pop	{fp}		@ (ldr fp, [sp], #4)
    53c8:	e12fff1e 	bx	lr

000053cc <morecore>:

static Header*
morecore(uint nu)
{
    53cc:	e92d4800 	push	{fp, lr}
    53d0:	e28db004 	add	fp, sp, #4
    53d4:	e24dd010 	sub	sp, sp, #16
    53d8:	e50b0010 	str	r0, [fp, #-16]
  char *p;
  Header *hp;

  if(nu < 4096)
    53dc:	e51b3010 	ldr	r3, [fp, #-16]
    53e0:	e3530a01 	cmp	r3, #4096	@ 0x1000
    53e4:	2a000001 	bcs	53f0 <morecore+0x24>
    nu = 4096;
    53e8:	e3a03a01 	mov	r3, #4096	@ 0x1000
    53ec:	e50b3010 	str	r3, [fp, #-16]
  p = sbrk(nu * sizeof(Header));
    53f0:	e51b3010 	ldr	r3, [fp, #-16]
    53f4:	e1a03183 	lsl	r3, r3, #3
    53f8:	e1a00003 	mov	r0, r3
    53fc:	ebfffe50 	bl	4d44 <sbrk>
    5400:	e50b0008 	str	r0, [fp, #-8]
  if(p == (char*)-1)
    5404:	e51b3008 	ldr	r3, [fp, #-8]
    5408:	e3730001 	cmn	r3, #1
    540c:	1a000001 	bne	5418 <morecore+0x4c>
    return 0;
    5410:	e3a03000 	mov	r3, #0
    5414:	ea00000b 	b	5448 <morecore+0x7c>
  hp = (Header*)p;
    5418:	e51b3008 	ldr	r3, [fp, #-8]
    541c:	e50b300c 	str	r3, [fp, #-12]
  hp->s.size = nu;
    5420:	e51b300c 	ldr	r3, [fp, #-12]
    5424:	e51b2010 	ldr	r2, [fp, #-16]
    5428:	e5832004 	str	r2, [r3, #4]
  free((void*)(hp + 1));
    542c:	e51b300c 	ldr	r3, [fp, #-12]
    5430:	e2833008 	add	r3, r3, #8
    5434:	e1a00003 	mov	r0, r3
    5438:	ebffff83 	bl	524c <free>
  return freep;
    543c:	e30b381c 	movw	r3, #47132	@ 0xb81c
    5440:	e3403000 	movt	r3, #0
    5444:	e5933000 	ldr	r3, [r3]
}
    5448:	e1a00003 	mov	r0, r3
    544c:	e24bd004 	sub	sp, fp, #4
    5450:	e8bd8800 	pop	{fp, pc}

00005454 <malloc>:

void*
malloc(uint nbytes)
{
    5454:	e92d4800 	push	{fp, lr}
    5458:	e28db004 	add	fp, sp, #4
    545c:	e24dd018 	sub	sp, sp, #24
    5460:	e50b0018 	str	r0, [fp, #-24]	@ 0xffffffe8
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    5464:	e51b3018 	ldr	r3, [fp, #-24]	@ 0xffffffe8
    5468:	e2833007 	add	r3, r3, #7
    546c:	e1a031a3 	lsr	r3, r3, #3
    5470:	e2833001 	add	r3, r3, #1
    5474:	e50b3010 	str	r3, [fp, #-16]
  if((prevp = freep) == 0){
    5478:	e30b381c 	movw	r3, #47132	@ 0xb81c
    547c:	e3403000 	movt	r3, #0
    5480:	e5933000 	ldr	r3, [r3]
    5484:	e50b300c 	str	r3, [fp, #-12]
    5488:	e51b300c 	ldr	r3, [fp, #-12]
    548c:	e3530000 	cmp	r3, #0
    5490:	1a000010 	bne	54d8 <malloc+0x84>
    base.s.ptr = freep = prevp = &base;
    5494:	e30b3814 	movw	r3, #47124	@ 0xb814
    5498:	e3403000 	movt	r3, #0
    549c:	e50b300c 	str	r3, [fp, #-12]
    54a0:	e30b381c 	movw	r3, #47132	@ 0xb81c
    54a4:	e3403000 	movt	r3, #0
    54a8:	e51b200c 	ldr	r2, [fp, #-12]
    54ac:	e5832000 	str	r2, [r3]
    54b0:	e30b381c 	movw	r3, #47132	@ 0xb81c
    54b4:	e3403000 	movt	r3, #0
    54b8:	e5932000 	ldr	r2, [r3]
    54bc:	e30b3814 	movw	r3, #47124	@ 0xb814
    54c0:	e3403000 	movt	r3, #0
    54c4:	e5832000 	str	r2, [r3]
    base.s.size = 0;
    54c8:	e30b3814 	movw	r3, #47124	@ 0xb814
    54cc:	e3403000 	movt	r3, #0
    54d0:	e3a02000 	mov	r2, #0
    54d4:	e5832004 	str	r2, [r3, #4]
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    54d8:	e51b300c 	ldr	r3, [fp, #-12]
    54dc:	e5933000 	ldr	r3, [r3]
    54e0:	e50b3008 	str	r3, [fp, #-8]
    if(p->s.size >= nunits){
    54e4:	e51b3008 	ldr	r3, [fp, #-8]
    54e8:	e5933004 	ldr	r3, [r3, #4]
    54ec:	e51b2010 	ldr	r2, [fp, #-16]
    54f0:	e1520003 	cmp	r2, r3
    54f4:	8a00001f 	bhi	5578 <malloc+0x124>
      if(p->s.size == nunits)
    54f8:	e51b3008 	ldr	r3, [fp, #-8]
    54fc:	e5933004 	ldr	r3, [r3, #4]
    5500:	e51b2010 	ldr	r2, [fp, #-16]
    5504:	e1520003 	cmp	r2, r3
    5508:	1a000004 	bne	5520 <malloc+0xcc>
        prevp->s.ptr = p->s.ptr;
    550c:	e51b3008 	ldr	r3, [fp, #-8]
    5510:	e5932000 	ldr	r2, [r3]
    5514:	e51b300c 	ldr	r3, [fp, #-12]
    5518:	e5832000 	str	r2, [r3]
    551c:	ea00000e 	b	555c <malloc+0x108>
      else {
        p->s.size -= nunits;
    5520:	e51b3008 	ldr	r3, [fp, #-8]
    5524:	e5932004 	ldr	r2, [r3, #4]
    5528:	e51b3010 	ldr	r3, [fp, #-16]
    552c:	e0422003 	sub	r2, r2, r3
    5530:	e51b3008 	ldr	r3, [fp, #-8]
    5534:	e5832004 	str	r2, [r3, #4]
        p += p->s.size;
    5538:	e51b3008 	ldr	r3, [fp, #-8]
    553c:	e5933004 	ldr	r3, [r3, #4]
    5540:	e1a03183 	lsl	r3, r3, #3
    5544:	e51b2008 	ldr	r2, [fp, #-8]
    5548:	e0823003 	add	r3, r2, r3
    554c:	e50b3008 	str	r3, [fp, #-8]
        p->s.size = nunits;
    5550:	e51b3008 	ldr	r3, [fp, #-8]
    5554:	e51b2010 	ldr	r2, [fp, #-16]
    5558:	e5832004 	str	r2, [r3, #4]
      }
      freep = prevp;
    555c:	e30b381c 	movw	r3, #47132	@ 0xb81c
    5560:	e3403000 	movt	r3, #0
    5564:	e51b200c 	ldr	r2, [fp, #-12]
    5568:	e5832000 	str	r2, [r3]
      return (void*)(p + 1);
    556c:	e51b3008 	ldr	r3, [fp, #-8]
    5570:	e2833008 	add	r3, r3, #8
    5574:	ea000013 	b	55c8 <malloc+0x174>
    }
    if(p == freep)
    5578:	e30b381c 	movw	r3, #47132	@ 0xb81c
    557c:	e3403000 	movt	r3, #0
    5580:	e5933000 	ldr	r3, [r3]
    5584:	e51b2008 	ldr	r2, [fp, #-8]
    5588:	e1520003 	cmp	r2, r3
    558c:	1a000007 	bne	55b0 <malloc+0x15c>
      if((p = morecore(nunits)) == 0)
    5590:	e51b0010 	ldr	r0, [fp, #-16]
    5594:	ebffff8c 	bl	53cc <morecore>
    5598:	e50b0008 	str	r0, [fp, #-8]
    559c:	e51b3008 	ldr	r3, [fp, #-8]
    55a0:	e3530000 	cmp	r3, #0
    55a4:	1a000001 	bne	55b0 <malloc+0x15c>
        return 0;
    55a8:	e3a03000 	mov	r3, #0
    55ac:	ea000005 	b	55c8 <malloc+0x174>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    55b0:	e51b3008 	ldr	r3, [fp, #-8]
    55b4:	e50b300c 	str	r3, [fp, #-12]
    55b8:	e51b3008 	ldr	r3, [fp, #-8]
    55bc:	e5933000 	ldr	r3, [r3]
    55c0:	e50b3008 	str	r3, [fp, #-8]
    if(p->s.size >= nunits){
    55c4:	eaffffc6 	b	54e4 <malloc+0x90>
  }
}
    55c8:	e1a00003 	mov	r0, r3
    55cc:	e24bd004 	sub	sp, fp, #4
    55d0:	e8bd8800 	pop	{fp, pc}
