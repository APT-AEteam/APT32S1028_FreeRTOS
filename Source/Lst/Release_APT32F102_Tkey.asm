
.//Obj/Release_APT32F102_Tkey.elf:     file format elf32-csky-little


Disassembly of section .text:

00000000 <vector_table>:
		IFC->CR=0X01;					//Start Program
	}
}
//一般模式，调用一次完成，会在程序中延时4.2MS
void Page_ProgramData(unsigned int FlashAdd,unsigned int DataSize,volatile unsigned char *BufArry)
{
   0:	00000108 	.long	0x00000108
	int i,DataBuffer;

	//页缓存擦除 1
	SetUserKey;
   4:	00001ac2 	.long	0x00001ac2
   8:	00001ab2 	.long	0x00001ab2
	IFC->CMR=0x07;					//页缓存擦除
   c:	00000180 	.long	0x00000180
	IFC->FM_ADDR=FlashAdd;
	IFC->CR=0X01;					//Start Program
  10:	00001aba 	.long	0x00001aba
  14:	00001a78 	.long	0x00001a78
	while(IFC->CR!=0x0);			//等待操作完成
  18:	00000180 	.long	0x00000180
	//向写缓存中写数据 2
	for(i=0;i<((DataSize+3)/4);i++)   //sizeof structure
  1c:	00001aaa 	.long	0x00001aaa
  20:	00001aa2 	.long	0x00001aa2
  24:	00000180 	.long	0x00000180
  28:	00000180 	.long	0x00000180
  2c:	00000180 	.long	0x00000180
		*(volatile unsigned int *)(FlashAdd+4*i)=DataBuffer;
		BufArry  +=4;
	}
	//预编程操作设定 3
	SetUserKey;
	IFC->CMR=0x06;					//预编程操作设定
  30:	00000180 	.long	0x00000180
	SetUserKey;
  34:	00000180 	.long	0x00000180
	IFC->FM_ADDR=FlashAdd;
	IFC->CR=0X01;					//Start Program
  38:	00000180 	.long	0x00000180
  3c:	00000180 	.long	0x00000180
	while(IFC->CR!=0x0);			//等待操作完成
  40:	00001a9a 	.long	0x00001a9a
	//执行预编程 4
	SetUserKey;
  44:	00001a92 	.long	0x00001a92
	IFC->CMR=0x01;					//执行预编程
  48:	00001a8a 	.long	0x00001a8a
	IFC->FM_ADDR=FlashAdd;			//
	IFC->CR=0X01;					//Start Program
  4c:	00001a82 	.long	0x00001a82
	while(IFC->RISR!=PEP_END_INT);			//等待操作完成
  50:	00000180 	.long	0x00000180
	//页擦除 5
	SetUserKey;
	IFC->CMR=0x02;					//页擦除
  54:	00000180 	.long	0x00000180
	SetUserKey;
  58:	00000180 	.long	0x00000180
	IFC->FM_ADDR=FlashAdd;			//
	IFC->CR=0X01;					//Start Program
  5c:	00000180 	.long	0x00000180
  60:	00000180 	.long	0x00000180
	while(IFC->RISR!=ERS_END_INT);			//等待操作完成
  64:	00000180 	.long	0x00000180
	//将页缓存的数据写入闪存中 6
	SetUserKey;
  68:	00000180 	.long	0x00000180
	IFC->CMR=0x01;					//将页缓存的数据写入闪存中
	IFC->FM_ADDR=FlashAdd;		//
  6c:	00000180 	.long	0x00000180
	IFC->CR=0X01;					//Start Program
	while(IFC->RISR!=RGM_END_INT);			//等待操作完成
  70:	00000180 	.long	0x00000180
  74:	00000180 	.long	0x00000180
}
  78:	00000180 	.long	0x00000180
		DataBuffer=*BufArry+(*(BufArry+1)<<8)+(*(BufArry+2)<<16)+(*(BufArry+3)<<24);
  7c:	00001a7a 	.long	0x00001a7a
  80:	000011b0 	.long	0x000011b0
  84:	000011c8 	.long	0x000011c8
  88:	000012ac 	.long	0x000012ac
  8c:	00001ad2 	.long	0x00001ad2
  90:	00001398 	.long	0x00001398
		BufArry  +=4;
  94:	00000180 	.long	0x00000180
  98:	00001540 	.long	0x00001540
  9c:	00001880 	.long	0x00001880
  a0:	000018a0 	.long	0x000018a0
  a4:	0000158c 	.long	0x0000158c
  a8:	00000180 	.long	0x00000180
  ac:	00000180 	.long	0x00000180
  b0:	00001640 	.long	0x00001640
  b4:	000016b0 	.long	0x000016b0
  b8:	00001704 	.long	0x00001704
  bc:	00001758 	.long	0x00001758
  c0:	00000180 	.long	0x00000180
  c4:	000017ac 	.long	0x000017ac
  c8:	00000180 	.long	0x00000180
  cc:	000017c0 	.long	0x000017c0
  d0:	000017fc 	.long	0x000017fc
  d4:	000018c0 	.long	0x000018c0
  d8:	000018ec 	.long	0x000018ec
  dc:	00001948 	.long	0x00001948
  e0:	00001aca 	.long	0x00001aca
  e4:	00000180 	.long	0x00000180
  e8:	000019a8 	.long	0x000019a8
  ec:	00000180 	.long	0x00000180
  f0:	000019dc 	.long	0x000019dc
  f4:	00001a30 	.long	0x00001a30
  f8:	00000180 	.long	0x00000180
  fc:	00000180 	.long	0x00000180
	...

00000108 <__start>:
//  .long __start
__start:

	
  //initialize all registers
  movi r0, 0
 108:	3000      	movi      	r0, 0
  movi r1, 0
 10a:	3100      	movi      	r1, 0
  movi r2, 0
 10c:	3200      	movi      	r2, 0
  movi r3, 0
 10e:	3300      	movi      	r3, 0
  movi r4, 0
 110:	3400      	movi      	r4, 0
  movi r5, 0
 112:	3500      	movi      	r5, 0
  movi r6, 0
 114:	3600      	movi      	r6, 0
  movi r7, 0
 116:	3700      	movi      	r7, 0
  //movi r13, 0
  //movi r14, 0
  //movi r15, 0

//set VBR
  lrw r2, vector_table
 118:	105b      	lrw      	r2, 0x0	// 184 <DummyHandler+0x4>
  mtcr r2, cr<1,0>
 11a:	c0026421 	mtcr      	r2, cr<1, 0>

//enable EE bit of psr
  mfcr r2, cr<0,0>
 11e:	c0006022 	mfcr      	r2, cr<0, 0>
  bseti r2, r2, 8
 122:	3aa8      	bseti      	r2, 8
  mtcr r2, cr<0,0>
 124:	c0026420 	mtcr      	r2, cr<0, 0>
//  st.w    r2, (r1,0x4)
//  movi    r2, 0x1
//  st.w    r2, (r1,0x0)

//disable power peak 
  lrw     r1, 0xe000ef90
 128:	1038      	lrw      	r1, 0xe000ef90	// 188 <DummyHandler+0x8>
  movi    r2, 0x0
 12a:	3200      	movi      	r2, 0
  st.w    r2, (r1, 0x0)
 12c:	b140      	st.w      	r2, (r1, 0x0)



//initialize kernel stack
  lrw  r7, __kernel_stack
 12e:	10f8      	lrw      	r7, 0x20000ff8	// 18c <DummyHandler+0xc>
  mov r14,r7
 130:	6f9f      	mov      	r14, r7
  subi r6,r7,0x4
 132:	5fcf      	subi      	r6, r7, 4

  //lrw  r3, 0x40
  lrw  r3, 0x04
 134:	3304      	movi      	r3, 4
	
  subu r4, r7, r3
 136:	5f8d      	subu      	r4, r7, r3
  lrw  r5, 0x0
 138:	3500      	movi      	r5, 0

0000013a <INIT_KERLE_STACK>:
INIT_KERLE_STACK:
  addi r4, 0x4
 13a:	2403      	addi      	r4, 4
  st.w r5, (r4)
 13c:	b4a0      	st.w      	r5, (r4, 0x0)
  //cmphs r7, r4
  cmphs r6, r4
 13e:	6518      	cmphs      	r6, r4
  bt  INIT_KERLE_STACK
 140:	0bfd      	bt      	0x13a	// 13a <INIT_KERLE_STACK>

00000142 <__to_main>:
        
__to_main:
  lrw r0,__main
 142:	1014      	lrw      	r0, 0x5b8	// 190 <DummyHandler+0x10>
  jsr r0
 144:	7bc1      	jsr      	r0
  mov r0, r0
 146:	6c03      	mov      	r0, r0
  mov r0, r0
 148:	6c03      	mov      	r0, r0


  
  lrw r15, __exit
 14a:	ea8f0013 	lrw      	r15, 0x15c	// 194 <DummyHandler+0x14>
  lrw r0,main
 14e:	1013      	lrw      	r0, 0x1bcc	// 198 <DummyHandler+0x18>
  jmp r0
 150:	7800      	jmp      	r0
  mov r0, r0
 152:	6c03      	mov      	r0, r0
  mov r0, r0
 154:	6c03      	mov      	r0, r0
  mov r0, r0
 156:	6c03      	mov      	r0, r0
  mov r0, r0
 158:	6c03      	mov      	r0, r0
  mov r0, r0
 15a:	6c03      	mov      	r0, r0

0000015c <__exit>:

.export __exit
__exit:

  lrw r4, 0x20003000
 15c:	1090      	lrw      	r4, 0x20003000	// 19c <DummyHandler+0x1c>
  //lrw r5, 0x0
  mov r5, r0
 15e:	6d43      	mov      	r5, r0
  st.w r5, (r4)
 160:	b4a0      	st.w      	r5, (r4, 0x0)

  mfcr r1, cr<0,0>
 162:	c0006021 	mfcr      	r1, cr<0, 0>
  lrw  r1, 0xFFFF
 166:	102f      	lrw      	r1, 0xffff	// 1a0 <DummyHandler+0x20>
  mtcr r1, cr<11,0>
 168:	c001642b 	mtcr      	r1, cr<11, 0>
  lrw     r1, 0xFFF
 16c:	102e      	lrw      	r1, 0xfff	// 1a4 <DummyHandler+0x24>
  movi    r0, 0x0
 16e:	3000      	movi      	r0, 0
  st      r1, (r0)
 170:	b020      	st.w      	r1, (r0, 0x0)

00000172 <__fail>:

.export __fail
__fail:
  lrw  r1, 0xEEEE
 172:	102e      	lrw      	r1, 0xeeee	// 1a8 <DummyHandler+0x28>
  mtcr r1, cr<11,0>
 174:	c001642b 	mtcr      	r1, cr<11, 0>
  lrw     r1, 0xEEE
 178:	102d      	lrw      	r1, 0xeee	// 1ac <DummyHandler+0x2c>
  movi    r0, 0x0
 17a:	3000      	movi      	r0, 0
  st      r1, (r0)
 17c:	b020      	st.w      	r1, (r0, 0x0)

0000017e <__dummy>:

__dummy:
  br      __fail
 17e:	07fa      	br      	0x172	// 172 <__fail>

00000180 <DummyHandler>:

.export DummyHandler
DummyHandler:
  br      __fail
 180:	07f9      	br      	0x172	// 172 <__fail>
 182:	0000      	.short	0x0000
 184:	00000000 	.long	0x00000000
 188:	e000ef90 	.long	0xe000ef90
 18c:	20000ff8 	.long	0x20000ff8
 190:	000005b8 	.long	0x000005b8
 194:	0000015c 	.long	0x0000015c
 198:	00001bcc 	.long	0x00001bcc
 19c:	20003000 	.long	0x20003000
 1a0:	0000ffff 	.long	0x0000ffff
 1a4:	00000fff 	.long	0x00000fff
 1a8:	0000eeee 	.long	0x0000eeee
 1ac:	00000eee 	.long	0x00000eee

000001b0 <vPortStartTask>:
 *
 ********************************************************************/
.global vPortStartTask
.type   vPortStartTask, %function
vPortStartTask:
    psrclr   ie
 1b0:	c0807020 	psrclr      	ie
    lrw      r4, pxCurrentTCB
 1b4:	118a      	lrw      	r4, 0x200000e8	// 25c <vPortYield+0x72>
    ld.w     r4, (r4)                // the current task stack pointer is the first member
 1b6:	9480      	ld.w      	r4, (r4, 0x0)
    ld.w     sp, (r4)
 1b8:	d9c42000 	ld.w      	r14, (r4, 0x0)

    ldw      r0, (sp, 48)
 1bc:	980c      	ld.w      	r0, (r14, 0x30)
    mtcr     r0, epc
 1be:	c0006424 	mtcr      	r0, cr<4, 0>
    ldw      r0, (sp, 44)
 1c2:	980b      	ld.w      	r0, (r14, 0x2c)
    mtcr     r0, epsr
 1c4:	c0006422 	mtcr      	r0, cr<2, 0>
    ldw      r15, (sp, 40)
 1c8:	d9ee200a 	ld.w      	r15, (r14, 0x28)
	ldw      r13, (sp,36)
 1cc:	d9ae2009 	ld.w      	r13, (r14, 0x24)
	ldw      r8, (sp,32)
 1d0:	d90e2008 	ld.w      	r8, (r14, 0x20)
	ldw      r7, (sp,28)
 1d4:	98e7      	ld.w      	r7, (r14, 0x1c)
	ldw      r6, (sp,24)
 1d6:	98c6      	ld.w      	r6, (r14, 0x18)
	ldw      r5, (sp,20)
 1d8:	98a5      	ld.w      	r5, (r14, 0x14)
	ldw      r4, (sp,16)
 1da:	9884      	ld.w      	r4, (r14, 0x10)
	ldw      r3, (sp,12)
 1dc:	9863      	ld.w      	r3, (r14, 0xc)
	ldw      r2, (sp,8)
 1de:	9842      	ld.w      	r2, (r14, 0x8)
	ldw      r1, (sp,4)
 1e0:	9821      	ld.w      	r1, (r14, 0x4)
	ldw      r0, (sp,0)
 1e2:	9800      	ld.w      	r0, (r14, 0x0)
    addi     sp, 52
 1e4:	140d      	addi      	r14, r14, 52
    rte
 1e6:	c0004020 	rte

000001ea <vPortYield>:
 *
 ********************************************************************/
.global vPortYield
.type   vPortYield, %function
vPortYield:
    psrclr  ee
 1ea:	c1007020 	psrclr      	ee
    subi    sp, 52
 1ee:	142d      	subi      	r14, r14, 52
	stw     r0, (sp,0)
 1f0:	b800      	st.w      	r0, (r14, 0x0)
	stw     r1, (sp,4)
 1f2:	b821      	st.w      	r1, (r14, 0x4)
	stw     r2, (sp,8)
 1f4:	b842      	st.w      	r2, (r14, 0x8)
	stw     r3, (sp,12)
 1f6:	b863      	st.w      	r3, (r14, 0xc)
	stw     r4, (sp,16)
 1f8:	b884      	st.w      	r4, (r14, 0x10)
	stw     r5, (sp,20)
 1fa:	b8a5      	st.w      	r5, (r14, 0x14)
	stw     r6, (sp,24)
 1fc:	b8c6      	st.w      	r6, (r14, 0x18)
	stw     r7, (sp,28)
 1fe:	b8e7      	st.w      	r7, (r14, 0x1c)
	stw     r8, (sp,32)
 200:	dd0e2008 	st.w      	r8, (r14, 0x20)
	stw     r13, (sp,36)
 204:	ddae2009 	st.w      	r13, (r14, 0x24)
	stw     r15, (sp,40)
 208:	ddee200a 	st.w      	r15, (r14, 0x28)
    mfcr    r0, psr
 20c:	c0006020 	mfcr      	r0, cr<0, 0>
    bseti   r0, 8
 210:	38a8      	bseti      	r0, 8
    stw     r0, (sp, 44)
 212:	b80b      	st.w      	r0, (r14, 0x2c)
    stw     r15, (sp, 48)
 214:	ddee200c 	st.w      	r15, (r14, 0x30)

    lrw     r2, pxCurrentTCB
 218:	1051      	lrw      	r2, 0x200000e8	// 25c <vPortYield+0x72>
    ld.w    r3, (r2)
 21a:	9260      	ld.w      	r3, (r2, 0x0)
    st.w    sp, (r3)
 21c:	ddc32000 	st.w      	r14, (r3, 0x0)

    jbsr    vTaskSwitchContext
 220:	e00010de 	bsr      	0x23dc	// 23dc <vTaskSwitchContext>
	
    lrw     r4, pxCurrentTCB
 224:	108e      	lrw      	r4, 0x200000e8	// 25c <vPortYield+0x72>
    ld.w    r4, (r4)
 226:	9480      	ld.w      	r4, (r4, 0x0)
    ld.w    sp, (r4)
 228:	d9c42000 	ld.w      	r14, (r4, 0x0)

    ldw      r0, (sp, 48)
 22c:	980c      	ld.w      	r0, (r14, 0x30)
    mtcr     r0, epc
 22e:	c0006424 	mtcr      	r0, cr<4, 0>
    ldw      r0, (sp, 44)
 232:	980b      	ld.w      	r0, (r14, 0x2c)
    mtcr     r0, epsr
 234:	c0006422 	mtcr      	r0, cr<2, 0>
    ldw      r15, (sp, 40)
 238:	d9ee200a 	ld.w      	r15, (r14, 0x28)
	ldw      r13, (sp,36)
 23c:	d9ae2009 	ld.w      	r13, (r14, 0x24)
	ldw      r8, (sp,32)
 240:	d90e2008 	ld.w      	r8, (r14, 0x20)
	ldw      r7, (sp,28)
 244:	98e7      	ld.w      	r7, (r14, 0x1c)
	ldw      r6, (sp,24)
 246:	98c6      	ld.w      	r6, (r14, 0x18)
	ldw      r5, (sp,20)
 248:	98a5      	ld.w      	r5, (r14, 0x14)
	ldw      r4, (sp,16)
 24a:	9884      	ld.w      	r4, (r14, 0x10)
	ldw      r3, (sp,12)
 24c:	9863      	ld.w      	r3, (r14, 0xc)
	ldw      r2, (sp,8)
 24e:	9842      	ld.w      	r2, (r14, 0x8)
	ldw      r1, (sp,4)
 250:	9821      	ld.w      	r1, (r14, 0x4)
	ldw      r0, (sp,0)
 252:	9800      	ld.w      	r0, (r14, 0x0)
    addi     sp, 52
 254:	140d      	addi      	r14, r14, 52

    rte
 256:	c0004020 	rte
 25a:	0000      	.short	0x0000
 25c:	200000e8 	.long	0x200000e8

00000260 <___gnu_csky_case_uqi>:
 260:	1421      	subi      	r14, r14, 4
 262:	b820      	st.w      	r1, (r14, 0x0)
 264:	6c7f      	mov      	r1, r15
 266:	6040      	addu      	r1, r0
 268:	8120      	ld.b      	r1, (r1, 0x0)
 26a:	4121      	lsli      	r1, r1, 1
 26c:	63c4      	addu      	r15, r1
 26e:	9820      	ld.w      	r1, (r14, 0x0)
 270:	1401      	addi      	r14, r14, 4
 272:	783c      	jmp      	r15

00000274 <__cskyvprintfprintf>:
 274:	1424      	subi      	r14, r14, 16
 276:	b863      	st.w      	r3, (r14, 0xc)
 278:	b842      	st.w      	r2, (r14, 0x8)
 27a:	b821      	st.w      	r1, (r14, 0x4)
 27c:	b800      	st.w      	r0, (r14, 0x0)
 27e:	14d0      	push      	r15
 280:	1421      	subi      	r14, r14, 4
 282:	9802      	ld.w      	r0, (r14, 0x8)
 284:	1903      	addi      	r1, r14, 12
 286:	b800      	st.w      	r0, (r14, 0x0)
 288:	e000002e 	bsr      	0x2e4	// 2e4 <__cskyvprintfvprintf>
 28c:	1401      	addi      	r14, r14, 4
 28e:	d9ee2000 	ld.w      	r15, (r14, 0x0)
 292:	1405      	addi      	r14, r14, 20
 294:	783c      	jmp      	r15
	...

00000298 <__GI_puts>:
 298:	14d1      	push      	r4, r15
 29a:	1085      	lrw      	r4, 0x20000090	// 2ac <__GI_puts+0x14>
 29c:	9420      	ld.w      	r1, (r4, 0x0)
 29e:	e0000033 	bsr      	0x304	// 304 <__GI_fputs>
 2a2:	9420      	ld.w      	r1, (r4, 0x0)
 2a4:	300a      	movi      	r0, 10
 2a6:	e0000c81 	bsr      	0x1ba8	// 1ba8 <fputc>
 2aa:	1491      	pop      	r4, r15
 2ac:	20000090 	.long	0x20000090

000002b0 <__stdio_outs>:
 2b0:	14d3      	push      	r4-r6, r15
 2b2:	10ac      	lrw      	r5, 0x20000090	// 2e0 <__stdio_outs+0x30>
 2b4:	6d03      	mov      	r4, r0
 2b6:	9500      	ld.w      	r0, (r5, 0x0)
 2b8:	6d87      	mov      	r6, r1
 2ba:	2017      	addi      	r0, 24
 2bc:	e00000c0 	bsr      	0x43c	// 43c <__GI_os_critical_enter>
 2c0:	6190      	addu      	r6, r4
 2c2:	6592      	cmpne      	r4, r6
 2c4:	0807      	bt      	0x2d2	// 2d2 <__stdio_outs+0x22>
 2c6:	9500      	ld.w      	r0, (r5, 0x0)
 2c8:	2017      	addi      	r0, 24
 2ca:	e00000bb 	bsr      	0x440	// 440 <__GI_os_critical_exit>
 2ce:	3001      	movi      	r0, 1
 2d0:	1493      	pop      	r4-r6, r15
 2d2:	8400      	ld.b      	r0, (r4, 0x0)
 2d4:	9520      	ld.w      	r1, (r5, 0x0)
 2d6:	e0000c69 	bsr      	0x1ba8	// 1ba8 <fputc>
 2da:	2400      	addi      	r4, 1
 2dc:	07f3      	br      	0x2c2	// 2c2 <__stdio_outs+0x12>
 2de:	0000      	bkpt
 2e0:	20000090 	.long	0x20000090

000002e4 <__cskyvprintfvprintf>:
 2e4:	14d0      	push      	r15
 2e6:	1422      	subi      	r14, r14, 8
 2e8:	6c87      	mov      	r2, r1
 2ea:	1026      	lrw      	r1, 0x2b0	// 300 <__cskyvprintfvprintf+0x1c>
 2ec:	3300      	movi      	r3, 0
 2ee:	b821      	st.w      	r1, (r14, 0x4)
 2f0:	6c43      	mov      	r1, r0
 2f2:	6c3b      	mov      	r0, r14
 2f4:	b860      	st.w      	r3, (r14, 0x0)
 2f6:	e00000a9 	bsr      	0x448	// 448 <__v2_printf>
 2fa:	1402      	addi      	r14, r14, 8
 2fc:	1490      	pop      	r15
 2fe:	0000      	bkpt
 300:	000002b0 	.long	0x000002b0

00000304 <__GI_fputs>:
 304:	14d4      	push      	r4-r7, r15
 306:	1422      	subi      	r14, r14, 8
 308:	3940      	cmpnei      	r1, 0
 30a:	6dc3      	mov      	r7, r0
 30c:	6d87      	mov      	r6, r1
 30e:	0806      	bt      	0x31a	// 31a <__GI_fputs+0x16>
 310:	3400      	movi      	r4, 0
 312:	2c00      	subi      	r4, 1
 314:	6c13      	mov      	r0, r4
 316:	1402      	addi      	r14, r14, 8
 318:	1494      	pop      	r4-r7, r15
 31a:	3018      	movi      	r0, 24
 31c:	6004      	addu      	r0, r1
 31e:	b800      	st.w      	r0, (r14, 0x0)
 320:	e000008e 	bsr      	0x43c	// 43c <__GI_os_critical_enter>
 324:	3200      	movi      	r2, 0
 326:	6d5f      	mov      	r5, r7
 328:	2a00      	subi      	r2, 1
 32a:	8500      	ld.b      	r0, (r5, 0x0)
 32c:	3840      	cmpnei      	r0, 0
 32e:	5d9d      	subu      	r4, r5, r7
 330:	0805      	bt      	0x33a	// 33a <__GI_fputs+0x36>
 332:	9800      	ld.w      	r0, (r14, 0x0)
 334:	e0000086 	bsr      	0x440	// 440 <__GI_os_critical_exit>
 338:	07ee      	br      	0x314	// 314 <__GI_fputs+0x10>
 33a:	6c5b      	mov      	r1, r6
 33c:	b841      	st.w      	r2, (r14, 0x4)
 33e:	e0000c35 	bsr      	0x1ba8	// 1ba8 <fputc>
 342:	9841      	ld.w      	r2, (r14, 0x4)
 344:	6482      	cmpne      	r0, r2
 346:	0fe5      	bf      	0x310	// 310 <__GI_fputs+0xc>
 348:	2500      	addi      	r5, 1
 34a:	07f0      	br      	0x32a	// 32a <__GI_fputs+0x26>

0000034c <__memset_fast>:
 34c:	14c3      	push      	r4-r6
 34e:	7444      	zextb      	r1, r1
 350:	3a40      	cmpnei      	r2, 0
 352:	0c1f      	bf      	0x390	// 390 <__memset_fast+0x44>
 354:	6d43      	mov      	r5, r0
 356:	6d03      	mov      	r4, r0
 358:	3603      	movi      	r6, 3
 35a:	6918      	and      	r4, r6
 35c:	3c40      	cmpnei      	r4, 0
 35e:	0c1a      	bf      	0x392	// 392 <__memset_fast+0x46>
 360:	a520      	st.b      	r1, (r5, 0x0)
 362:	2a00      	subi      	r2, 1
 364:	3a40      	cmpnei      	r2, 0
 366:	0c15      	bf      	0x390	// 390 <__memset_fast+0x44>
 368:	2500      	addi      	r5, 1
 36a:	6d17      	mov      	r4, r5
 36c:	3603      	movi      	r6, 3
 36e:	6918      	and      	r4, r6
 370:	3c40      	cmpnei      	r4, 0
 372:	0c10      	bf      	0x392	// 392 <__memset_fast+0x46>
 374:	a520      	st.b      	r1, (r5, 0x0)
 376:	2a00      	subi      	r2, 1
 378:	3a40      	cmpnei      	r2, 0
 37a:	0c0b      	bf      	0x390	// 390 <__memset_fast+0x44>
 37c:	2500      	addi      	r5, 1
 37e:	6d17      	mov      	r4, r5
 380:	3603      	movi      	r6, 3
 382:	6918      	and      	r4, r6
 384:	3c40      	cmpnei      	r4, 0
 386:	0c06      	bf      	0x392	// 392 <__memset_fast+0x46>
 388:	a520      	st.b      	r1, (r5, 0x0)
 38a:	2a00      	subi      	r2, 1
 38c:	2500      	addi      	r5, 1
 38e:	0402      	br      	0x392	// 392 <__memset_fast+0x46>
 390:	1483      	pop      	r4-r6
 392:	4168      	lsli      	r3, r1, 8
 394:	6c4c      	or      	r1, r3
 396:	4170      	lsli      	r3, r1, 16
 398:	6c4c      	or      	r1, r3
 39a:	3a2f      	cmplti      	r2, 16
 39c:	0809      	bt      	0x3ae	// 3ae <__memset_fast+0x62>
 39e:	b520      	st.w      	r1, (r5, 0x0)
 3a0:	b521      	st.w      	r1, (r5, 0x4)
 3a2:	b522      	st.w      	r1, (r5, 0x8)
 3a4:	b523      	st.w      	r1, (r5, 0xc)
 3a6:	2a0f      	subi      	r2, 16
 3a8:	250f      	addi      	r5, 16
 3aa:	3a2f      	cmplti      	r2, 16
 3ac:	0ff9      	bf      	0x39e	// 39e <__memset_fast+0x52>
 3ae:	3a23      	cmplti      	r2, 4
 3b0:	0806      	bt      	0x3bc	// 3bc <__memset_fast+0x70>
 3b2:	2a03      	subi      	r2, 4
 3b4:	b520      	st.w      	r1, (r5, 0x0)
 3b6:	2503      	addi      	r5, 4
 3b8:	3a23      	cmplti      	r2, 4
 3ba:	0ffc      	bf      	0x3b2	// 3b2 <__memset_fast+0x66>
 3bc:	3a40      	cmpnei      	r2, 0
 3be:	0fe9      	bf      	0x390	// 390 <__memset_fast+0x44>
 3c0:	2a00      	subi      	r2, 1
 3c2:	a520      	st.b      	r1, (r5, 0x0)
 3c4:	3a40      	cmpnei      	r2, 0
 3c6:	0fe5      	bf      	0x390	// 390 <__memset_fast+0x44>
 3c8:	2a00      	subi      	r2, 1
 3ca:	a521      	st.b      	r1, (r5, 0x1)
 3cc:	3a40      	cmpnei      	r2, 0
 3ce:	0fe1      	bf      	0x390	// 390 <__memset_fast+0x44>
 3d0:	a522      	st.b      	r1, (r5, 0x2)
 3d2:	1483      	pop      	r4-r6

000003d4 <__memcpy_fast>:
 3d4:	14c3      	push      	r4-r6
 3d6:	6d83      	mov      	r6, r0
 3d8:	6d07      	mov      	r4, r1
 3da:	6d18      	or      	r4, r6
 3dc:	3303      	movi      	r3, 3
 3de:	690c      	and      	r4, r3
 3e0:	3c40      	cmpnei      	r4, 0
 3e2:	0c0b      	bf      	0x3f8	// 3f8 <__memcpy_fast+0x24>
 3e4:	3a40      	cmpnei      	r2, 0
 3e6:	0c08      	bf      	0x3f6	// 3f6 <__memcpy_fast+0x22>
 3e8:	8160      	ld.b      	r3, (r1, 0x0)
 3ea:	2100      	addi      	r1, 1
 3ec:	2a00      	subi      	r2, 1
 3ee:	a660      	st.b      	r3, (r6, 0x0)
 3f0:	2600      	addi      	r6, 1
 3f2:	3a40      	cmpnei      	r2, 0
 3f4:	0bfa      	bt      	0x3e8	// 3e8 <__memcpy_fast+0x14>
 3f6:	1483      	pop      	r4-r6
 3f8:	3a2f      	cmplti      	r2, 16
 3fa:	080e      	bt      	0x416	// 416 <__memcpy_fast+0x42>
 3fc:	91a0      	ld.w      	r5, (r1, 0x0)
 3fe:	9161      	ld.w      	r3, (r1, 0x4)
 400:	9182      	ld.w      	r4, (r1, 0x8)
 402:	b6a0      	st.w      	r5, (r6, 0x0)
 404:	91a3      	ld.w      	r5, (r1, 0xc)
 406:	b661      	st.w      	r3, (r6, 0x4)
 408:	b682      	st.w      	r4, (r6, 0x8)
 40a:	b6a3      	st.w      	r5, (r6, 0xc)
 40c:	2a0f      	subi      	r2, 16
 40e:	210f      	addi      	r1, 16
 410:	260f      	addi      	r6, 16
 412:	3a2f      	cmplti      	r2, 16
 414:	0ff4      	bf      	0x3fc	// 3fc <__memcpy_fast+0x28>
 416:	3a23      	cmplti      	r2, 4
 418:	0808      	bt      	0x428	// 428 <__memcpy_fast+0x54>
 41a:	9160      	ld.w      	r3, (r1, 0x0)
 41c:	2a03      	subi      	r2, 4
 41e:	2103      	addi      	r1, 4
 420:	b660      	st.w      	r3, (r6, 0x0)
 422:	2603      	addi      	r6, 4
 424:	3a23      	cmplti      	r2, 4
 426:	0ffa      	bf      	0x41a	// 41a <__memcpy_fast+0x46>
 428:	3a40      	cmpnei      	r2, 0
 42a:	0fe6      	bf      	0x3f6	// 3f6 <__memcpy_fast+0x22>
 42c:	8160      	ld.b      	r3, (r1, 0x0)
 42e:	2100      	addi      	r1, 1
 430:	2a00      	subi      	r2, 1
 432:	a660      	st.b      	r3, (r6, 0x0)
 434:	2600      	addi      	r6, 1
 436:	07f9      	br      	0x428	// 428 <__memcpy_fast+0x54>

00000438 <__GI_os_critical_open>:
 438:	3000      	movi      	r0, 0
 43a:	783c      	jmp      	r15

0000043c <__GI_os_critical_enter>:
 43c:	3000      	movi      	r0, 0
 43e:	783c      	jmp      	r15

00000440 <__GI_os_critical_exit>:
 440:	3000      	movi      	r0, 0
 442:	783c      	jmp      	r15

00000444 <__GI_os_critical_close>:
 444:	3000      	movi      	r0, 0
 446:	783c      	jmp      	r15

00000448 <__v2_printf>:
 448:	14d4      	push      	r4-r7, r15
 44a:	142e      	subi      	r14, r14, 56
 44c:	6d83      	mov      	r6, r0
 44e:	6dcb      	mov      	r7, r2
 450:	b820      	st.w      	r1, (r14, 0x0)
 452:	3500      	movi      	r5, 0
 454:	b8a1      	st.w      	r5, (r14, 0x4)
 456:	9880      	ld.w      	r4, (r14, 0x0)
 458:	3125      	movi      	r1, 37
 45a:	8460      	ld.b      	r3, (r4, 0x0)
 45c:	3b40      	cmpnei      	r3, 0
 45e:	082d      	bt      	0x4b8	// 4b8 <__v2_printf+0x70>
 460:	9800      	ld.w      	r0, (r14, 0x0)
 462:	5ca1      	subu      	r5, r4, r0
 464:	3d40      	cmpnei      	r5, 0
 466:	0c09      	bf      	0x478	// 478 <__v2_printf+0x30>
 468:	6c57      	mov      	r1, r5
 46a:	9661      	ld.w      	r3, (r6, 0x4)
 46c:	9640      	ld.w      	r2, (r6, 0x0)
 46e:	9800      	ld.w      	r0, (r14, 0x0)
 470:	7bcd      	jsr      	r3
 472:	9821      	ld.w      	r1, (r14, 0x4)
 474:	6054      	addu      	r1, r5
 476:	b821      	st.w      	r1, (r14, 0x4)
 478:	8440      	ld.b      	r2, (r4, 0x0)
 47a:	3a40      	cmpnei      	r2, 0
 47c:	0c9b      	bf      	0x5b2	// 5b2 <__v2_printf+0x16a>
 47e:	3500      	movi      	r5, 0
 480:	dcae000f 	st.b      	r5, (r14, 0xf)
 484:	2400      	addi      	r4, 1
 486:	3100      	movi      	r1, 0
 488:	3200      	movi      	r2, 0
 48a:	3563      	movi      	r5, 99
 48c:	5c02      	addi      	r0, r4, 1
 48e:	8480      	ld.b      	r4, (r4, 0x0)
 490:	6552      	cmpne      	r4, r5
 492:	b800      	st.w      	r0, (r14, 0x0)
 494:	0c33      	bf      	0x4fa	// 4fa <__v2_printf+0xb2>
 496:	6514      	cmphs      	r5, r4
 498:	0c14      	bf      	0x4c0	// 4c0 <__v2_printf+0x78>
 49a:	332b      	movi      	r3, 43
 49c:	64d2      	cmpne      	r4, r3
 49e:	0c2c      	bf      	0x4f6	// 4f6 <__v2_printf+0xae>
 4a0:	302d      	movi      	r0, 45
 4a2:	6412      	cmpne      	r4, r0
 4a4:	0c08      	bf      	0x4b4	// 4b4 <__v2_printf+0x6c>
 4a6:	3320      	movi      	r3, 32
 4a8:	64d2      	cmpne      	r4, r3
 4aa:	0813      	bt      	0x4d0	// 4d0 <__v2_printf+0x88>
 4ac:	3a40      	cmpnei      	r2, 0
 4ae:	0803      	bt      	0x4b4	// 4b4 <__v2_printf+0x6c>
 4b0:	3220      	movi      	r2, 32
 4b2:	3101      	movi      	r1, 1
 4b4:	9880      	ld.w      	r4, (r14, 0x0)
 4b6:	07eb      	br      	0x48c	// 48c <__v2_printf+0x44>
 4b8:	644e      	cmpne      	r3, r1
 4ba:	0fd3      	bf      	0x460	// 460 <__v2_printf+0x18>
 4bc:	2400      	addi      	r4, 1
 4be:	07ce      	br      	0x45a	// 45a <__v2_printf+0x12>
 4c0:	3069      	movi      	r0, 105
 4c2:	6412      	cmpne      	r4, r0
 4c4:	0c25      	bf      	0x50e	// 50e <__v2_printf+0xc6>
 4c6:	6500      	cmphs      	r0, r4
 4c8:	0c0c      	bf      	0x4e0	// 4e0 <__v2_printf+0x98>
 4ca:	3364      	movi      	r3, 100
 4cc:	64d2      	cmpne      	r4, r3
 4ce:	0c20      	bf      	0x50e	// 50e <__v2_printf+0xc6>
 4d0:	3c40      	cmpnei      	r4, 0
 4d2:	0c70      	bf      	0x5b2	// 5b2 <__v2_printf+0x16a>
 4d4:	3500      	movi      	r5, 0
 4d6:	dc8e0010 	st.b      	r4, (r14, 0x10)
 4da:	dcae000f 	st.b      	r5, (r14, 0xf)
 4de:	0415      	br      	0x508	// 508 <__v2_printf+0xc0>
 4e0:	3273      	movi      	r2, 115
 4e2:	6492      	cmpne      	r4, r2
 4e4:	0c2e      	bf      	0x540	// 540 <__v2_printf+0xf8>
 4e6:	3175      	movi      	r1, 117
 4e8:	6452      	cmpne      	r4, r1
 4ea:	0bf3      	bt      	0x4d0	// 4d0 <__v2_printf+0x88>
 4ec:	5f8e      	addi      	r4, r7, 4
 4ee:	b882      	st.w      	r4, (r14, 0x8)
 4f0:	97e0      	ld.w      	r7, (r7, 0x0)
 4f2:	3000      	movi      	r0, 0
 4f4:	0419      	br      	0x526	// 526 <__v2_printf+0xde>
 4f6:	322b      	movi      	r2, 43
 4f8:	07dd      	br      	0x4b2	// 4b2 <__v2_printf+0x6a>
 4fa:	8740      	ld.b      	r2, (r7, 0x0)
 4fc:	3300      	movi      	r3, 0
 4fe:	dc4e0010 	st.b      	r2, (r14, 0x10)
 502:	dc6e000f 	st.b      	r3, (r14, 0xf)
 506:	2703      	addi      	r7, 4
 508:	3501      	movi      	r5, 1
 50a:	1c04      	addi      	r4, r14, 16
 50c:	0425      	br      	0x556	// 556 <__v2_printf+0x10e>
 50e:	3940      	cmpnei      	r1, 0
 510:	0c03      	bf      	0x516	// 516 <__v2_printf+0xce>
 512:	dc4e000f 	st.b      	r2, (r14, 0xf)
 516:	5f2e      	addi      	r1, r7, 4
 518:	97e0      	ld.w      	r7, (r7, 0x0)
 51a:	3fdf      	btsti      	r7, 31
 51c:	b822      	st.w      	r1, (r14, 0x8)
 51e:	0c06      	bf      	0x52a	// 52a <__v2_printf+0xe2>
 520:	3500      	movi      	r5, 0
 522:	5dfd      	subu      	r7, r5, r7
 524:	302d      	movi      	r0, 45
 526:	dc0e000f 	st.b      	r0, (r14, 0xf)
 52a:	3f09      	cmphsi      	r7, 10
 52c:	0832      	bt      	0x590	// 590 <__v2_printf+0x148>
 52e:	1c0c      	addi      	r4, r14, 48
 530:	272f      	addi      	r7, 48
 532:	a4e7      	st.b      	r7, (r4, 0x7)
 534:	1c04      	addi      	r4, r14, 16
 536:	2426      	addi      	r4, 39
 538:	180e      	addi      	r0, r14, 56
 53a:	58b1      	subu      	r5, r0, r4
 53c:	98e2      	ld.w      	r7, (r14, 0x8)
 53e:	040c      	br      	0x556	// 556 <__v2_printf+0x10e>
 540:	9780      	ld.w      	r4, (r7, 0x0)
 542:	5f6e      	addi      	r3, r7, 4
 544:	3700      	movi      	r7, 0
 546:	dcee000f 	st.b      	r7, (r14, 0xf)
 54a:	6d53      	mov      	r5, r4
 54c:	8540      	ld.b      	r2, (r5, 0x0)
 54e:	3a40      	cmpnei      	r2, 0
 550:	081e      	bt      	0x58c	// 58c <__v2_printf+0x144>
 552:	6152      	subu      	r5, r4
 554:	6dcf      	mov      	r7, r3
 556:	3ddf      	btsti      	r5, 31
 558:	b8a2      	st.w      	r5, (r14, 0x8)
 55a:	0c03      	bf      	0x560	// 560 <__v2_printf+0x118>
 55c:	3100      	movi      	r1, 0
 55e:	b822      	st.w      	r1, (r14, 0x8)
 560:	d80e000f 	ld.b      	r0, (r14, 0xf)
 564:	3840      	cmpnei      	r0, 0
 566:	0c0a      	bf      	0x57a	// 57a <__v2_printf+0x132>
 568:	9842      	ld.w      	r2, (r14, 0x8)
 56a:	2200      	addi      	r2, 1
 56c:	1803      	addi      	r0, r14, 12
 56e:	b842      	st.w      	r2, (r14, 0x8)
 570:	9661      	ld.w      	r3, (r6, 0x4)
 572:	9640      	ld.w      	r2, (r6, 0x0)
 574:	3101      	movi      	r1, 1
 576:	2002      	addi      	r0, 3
 578:	7bcd      	jsr      	r3
 57a:	6c57      	mov      	r1, r5
 57c:	6c13      	mov      	r0, r4
 57e:	9661      	ld.w      	r3, (r6, 0x4)
 580:	9640      	ld.w      	r2, (r6, 0x0)
 582:	7bcd      	jsr      	r3
 584:	98a1      	ld.w      	r5, (r14, 0x4)
 586:	9882      	ld.w      	r4, (r14, 0x8)
 588:	6150      	addu      	r5, r4
 58a:	0765      	br      	0x454	// 454 <__v2_printf+0xc>
 58c:	2500      	addi      	r5, 1
 58e:	07df      	br      	0x54c	// 54c <__v2_printf+0x104>
 590:	1c0e      	addi      	r4, r14, 56
 592:	3530      	movi      	r5, 48
 594:	310a      	movi      	r1, 10
 596:	6c1f      	mov      	r0, r7
 598:	e0000b56 	bsr      	0x1c44	// 1c44 <__umodsi3>
 59c:	6014      	addu      	r0, r5
 59e:	2c00      	subi      	r4, 1
 5a0:	a400      	st.b      	r0, (r4, 0x0)
 5a2:	310a      	movi      	r1, 10
 5a4:	6c1f      	mov      	r0, r7
 5a6:	e0000b3d 	bsr      	0x1c20	// 1c20 <__udivsi3>
 5aa:	3840      	cmpnei      	r0, 0
 5ac:	6dc3      	mov      	r7, r0
 5ae:	0bf3      	bt      	0x594	// 594 <__v2_printf+0x14c>
 5b0:	07c4      	br      	0x538	// 538 <__v2_printf+0xf0>
 5b2:	9801      	ld.w      	r0, (r14, 0x4)
 5b4:	140e      	addi      	r14, r14, 56
 5b6:	1494      	pop      	r4-r7, r15

Disassembly of section .text.__main:

000005b8 <__main>:
extern char _bss_start[];
extern char _ebss[];


void __main( void ) 
{
 5b8:	14d0      	push      	r15

  /* if the start of data (dst)
     is not equal to end of text (src) then
     copy it, else it's already in the right place
     */
  if( _start_data != _end_rodata ) {
 5ba:	1009      	lrw      	r0, 0x20000000	// 5dc <__main+0x24>
 5bc:	1029      	lrw      	r1, 0x2b7c	// 5e0 <__main+0x28>
 5be:	6442      	cmpne      	r0, r1
 5c0:	0c05      	bf      	0x5ca	// 5ca <__main+0x12>
//    __memcpy_fast( dst, src, (_end_data - _start_data));
    memcpy( dst, src, (_end_data - _start_data));
 5c2:	1049      	lrw      	r2, 0x200000d0	// 5e4 <__main+0x2c>
 5c4:	6082      	subu      	r2, r0
 5c6:	e3ffff07 	bsr      	0x3d4	// 3d4 <__memcpy_fast>
  }

  /* zero the bss 
   */
  if( _ebss - _bss_start ) {
 5ca:	1048      	lrw      	r2, 0x20000e94	// 5e8 <__main+0x30>
 5cc:	1008      	lrw      	r0, 0x200000d0	// 5ec <__main+0x34>
 5ce:	640a      	cmpne      	r2, r0
 5d0:	0c05      	bf      	0x5da	// 5da <__main+0x22>
//    __memset_fast( _bss_start, 0x00, ( _ebss - _bss_start ));
    memset( _bss_start, 0x00, ( _ebss - _bss_start ));
 5d2:	6082      	subu      	r2, r0
 5d4:	3100      	movi      	r1, 0
 5d6:	e3fffebb 	bsr      	0x34c	// 34c <__memset_fast>
  }

	
}
 5da:	1490      	pop      	r15
 5dc:	20000000 	.long	0x20000000
 5e0:	00002b7c 	.long	0x00002b7c
 5e4:	200000d0 	.long	0x200000d0
 5e8:	20000e94 	.long	0x20000e94
 5ec:	200000d0 	.long	0x200000d0

Disassembly of section .text.BT_DeInit:

000005f0 <BT_DeInit>:
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/    
void BT_DeInit(CSP_BT_T *BTx)
{
	BTx->RSSR=BT_RESET_VALUE;
 5f0:	3300      	movi      	r3, 0
 5f2:	b060      	st.w      	r3, (r0, 0x0)
	BTx->CR=BT_RESET_VALUE;
 5f4:	b061      	st.w      	r3, (r0, 0x4)
	BTx->PSCR=BT_RESET_VALUE;
 5f6:	b062      	st.w      	r3, (r0, 0x8)
	BTx->PRDR=BT_RESET_VALUE;
 5f8:	b063      	st.w      	r3, (r0, 0xc)
	BTx->CMP=BT_RESET_VALUE;
 5fa:	b064      	st.w      	r3, (r0, 0x10)
	BTx->CNT=BT_RESET_VALUE;
 5fc:	b065      	st.w      	r3, (r0, 0x14)
	BTx->EVTRG=BT_RESET_VALUE;
 5fe:	b066      	st.w      	r3, (r0, 0x18)
	BTx->EVSWF=BT_RESET_VALUE;
 600:	b069      	st.w      	r3, (r0, 0x24)
	BTx->RISR=BT_RESET_VALUE;
 602:	b06a      	st.w      	r3, (r0, 0x28)
	BTx->IMCR=BT_RESET_VALUE;
 604:	b06b      	st.w      	r3, (r0, 0x2c)
	BTx->MISR=BT_RESET_VALUE;
 606:	b06c      	st.w      	r3, (r0, 0x30)
	BTx->ICR=BT_RESET_VALUE;
 608:	b06d      	st.w      	r3, (r0, 0x34)
}
 60a:	783c      	jmp      	r15

Disassembly of section .text.BT_IO_Init:

0000060c <BT_IO_Init>:
//EntryParameter:LPT_OUT_PA09,LPT_OUT_PB01,LPT_IN_PA10,
//ReturnValue:NONE
/*************************************************************/
void BT_IO_Init(BT_Pin_TypeDef BT_IONAME)
{
	if(BT_IONAME==BT0_PA00)										//BT0 PA0.0
 60c:	3840      	cmpnei      	r0, 0
 60e:	080a      	bt      	0x622	// 622 <BT_IO_Init+0x16>
	{
		GPIOA0->CONLR=(GPIOA0->CONLR & 0XFFFFFFF0)|0x00000006;
 610:	1270      	lrw      	r3, 0x2000004c	// 750 <BT_IO_Init+0x144>
 612:	310f      	movi      	r1, 15
 614:	9340      	ld.w      	r2, (r3, 0x0)
 616:	9260      	ld.w      	r3, (r2, 0x0)
 618:	68c5      	andn      	r3, r1
 61a:	3ba1      	bseti      	r3, 1
 61c:	3ba2      	bseti      	r3, 2
	{
		GPIOA0->CONHR=(GPIOA0->CONHR & 0XF0FFFFFF)|0x05000000;
	}
	if(BT_IONAME==BT1_PB00)										//BT1 PB0.0
	{
		GPIOB0->CONLR=(GPIOB0->CONLR & 0XFFFFFFF0)|0x00000008;
 61e:	b260      	st.w      	r3, (r2, 0x0)
 620:	044e      	br      	0x6bc	// 6bc <BT_IO_Init+0xb0>
	if(BT_IONAME==BT0_PA02)										//BT0 PA0.2
 622:	3841      	cmpnei      	r0, 1
 624:	080b      	bt      	0x63a	// 63a <BT_IO_Init+0x2e>
		GPIOA0->CONLR=(GPIOA0->CONLR & 0XFFFFF0FF)|0x00000600;
 626:	126b      	lrw      	r3, 0x2000004c	// 750 <BT_IO_Init+0x144>
 628:	32f0      	movi      	r2, 240
 62a:	9320      	ld.w      	r1, (r3, 0x0)
 62c:	9160      	ld.w      	r3, (r1, 0x0)
 62e:	4244      	lsli      	r2, r2, 4
 630:	68c9      	andn      	r3, r2
 632:	3ba9      	bseti      	r3, 9
 634:	3baa      	bseti      	r3, 10
	}
	if(BT_IONAME==BT1_PB04)										//BT1 PB0.4
	{
		GPIOB0->CONLR=(GPIOB0->CONLR & 0XFFF0FFFF)|0x00070000;
 636:	b160      	st.w      	r3, (r1, 0x0)
	}
}
 638:	0442      	br      	0x6bc	// 6bc <BT_IO_Init+0xb0>
	if(BT_IONAME==BT0_PA05)										//BT0 PA0.5
 63a:	3842      	cmpnei      	r0, 2
 63c:	080a      	bt      	0x650	// 650 <BT_IO_Init+0x44>
		GPIOA0->CONLR=(GPIOA0->CONLR & 0XFF0FFFFF)|0x00500000;
 63e:	1265      	lrw      	r3, 0x2000004c	// 750 <BT_IO_Init+0x144>
 640:	32f0      	movi      	r2, 240
 642:	9320      	ld.w      	r1, (r3, 0x0)
 644:	9160      	ld.w      	r3, (r1, 0x0)
 646:	4250      	lsli      	r2, r2, 16
 648:	68c9      	andn      	r3, r2
 64a:	3bb4      	bseti      	r3, 20
 64c:	3bb6      	bseti      	r3, 22
 64e:	07f4      	br      	0x636	// 636 <BT_IO_Init+0x2a>
	if(BT_IONAME==BT0_PB02)										//BT0 PB0.2
 650:	3843      	cmpnei      	r0, 3
 652:	080a      	bt      	0x666	// 666 <BT_IO_Init+0x5a>
		GPIOB0->CONLR=(GPIOB0->CONLR & 0XFFFFF0FF)|0x00000500;
 654:	1260      	lrw      	r3, 0x20000048	// 754 <BT_IO_Init+0x148>
 656:	32f0      	movi      	r2, 240
 658:	9320      	ld.w      	r1, (r3, 0x0)
 65a:	9160      	ld.w      	r3, (r1, 0x0)
 65c:	4244      	lsli      	r2, r2, 4
 65e:	68c9      	andn      	r3, r2
 660:	3ba8      	bseti      	r3, 8
 662:	3baa      	bseti      	r3, 10
 664:	07e9      	br      	0x636	// 636 <BT_IO_Init+0x2a>
	if(BT_IONAME==BT0_PB05)										//BT0 PB0.5
 666:	3844      	cmpnei      	r0, 4
 668:	080b      	bt      	0x67e	// 67e <BT_IO_Init+0x72>
		GPIOB0->CONLR=(GPIOB0->CONLR & 0XFF0FFFFF)|0x00700000;
 66a:	117b      	lrw      	r3, 0x20000048	// 754 <BT_IO_Init+0x148>
 66c:	32f0      	movi      	r2, 240
 66e:	9320      	ld.w      	r1, (r3, 0x0)
 670:	4250      	lsli      	r2, r2, 16
 672:	9160      	ld.w      	r3, (r1, 0x0)
 674:	68c9      	andn      	r3, r2
 676:	32e0      	movi      	r2, 224
 678:	424f      	lsli      	r2, r2, 15
		GPIOB0->CONLR=(GPIOB0->CONLR & 0XFFF0FFFF)|0x00070000;
 67a:	6cc8      	or      	r3, r2
 67c:	07dd      	br      	0x636	// 636 <BT_IO_Init+0x2a>
	if(BT_IONAME==BT0_PA11)										//BT0 PA0.11
 67e:	3845      	cmpnei      	r0, 5
 680:	080a      	bt      	0x694	// 694 <BT_IO_Init+0x88>
		GPIOA0->CONHR=(GPIOA0->CONHR & 0XFFFF0FFF)|0x00008000;
 682:	1174      	lrw      	r3, 0x2000004c	// 750 <BT_IO_Init+0x144>
 684:	32f0      	movi      	r2, 240
 686:	9320      	ld.w      	r1, (r3, 0x0)
 688:	9161      	ld.w      	r3, (r1, 0x4)
 68a:	4248      	lsli      	r2, r2, 8
 68c:	68c9      	andn      	r3, r2
 68e:	3baf      	bseti      	r3, 15
		GPIOA0->CONHR=(GPIOA0->CONHR & 0XF0FFFFFF)|0x05000000;
 690:	b161      	st.w      	r3, (r1, 0x4)
 692:	0415      	br      	0x6bc	// 6bc <BT_IO_Init+0xb0>
	if(BT_IONAME==BT0_PA13)										//BT0 PA0.13
 694:	3846      	cmpnei      	r0, 6
 696:	0809      	bt      	0x6a8	// 6a8 <BT_IO_Init+0x9c>
		GPIOA0->CONHR=(GPIOA0->CONHR & 0XFF0FFFFF)|0x00800000;
 698:	116e      	lrw      	r3, 0x2000004c	// 750 <BT_IO_Init+0x144>
 69a:	32f0      	movi      	r2, 240
 69c:	9320      	ld.w      	r1, (r3, 0x0)
 69e:	9161      	ld.w      	r3, (r1, 0x4)
 6a0:	4250      	lsli      	r2, r2, 16
 6a2:	68c9      	andn      	r3, r2
 6a4:	3bb7      	bseti      	r3, 23
 6a6:	07f5      	br      	0x690	// 690 <BT_IO_Init+0x84>
	if(BT_IONAME==BT0_PA15)										//BT0 PA0.15
 6a8:	3847      	cmpnei      	r0, 7
 6aa:	080a      	bt      	0x6be	// 6be <BT_IO_Init+0xb2>
		GPIOA0->CONHR=(GPIOA0->CONHR & 0X0FFFFFFF)|0x50000000;
 6ac:	1169      	lrw      	r3, 0x2000004c	// 750 <BT_IO_Init+0x144>
 6ae:	9340      	ld.w      	r2, (r3, 0x0)
 6b0:	9261      	ld.w      	r3, (r2, 0x4)
 6b2:	4364      	lsli      	r3, r3, 4
 6b4:	4b64      	lsri      	r3, r3, 4
 6b6:	3bbc      	bseti      	r3, 28
 6b8:	3bbe      	bseti      	r3, 30
		GPIOA0->CONHR=(GPIOA0->CONHR & 0XFFFFFFF0)|0x00000006;
 6ba:	b261      	st.w      	r3, (r2, 0x4)
}
 6bc:	783c      	jmp      	r15
	if(BT_IONAME==BT1_PA01)										//BT1 PA0.1
 6be:	3848      	cmpnei      	r0, 8
 6c0:	0809      	bt      	0x6d2	// 6d2 <BT_IO_Init+0xc6>
		GPIOA0->CONLR=(GPIOA0->CONLR & 0XFFFFFF0F)|0x00000060;
 6c2:	1164      	lrw      	r3, 0x2000004c	// 750 <BT_IO_Init+0x144>
 6c4:	31f0      	movi      	r1, 240
 6c6:	9340      	ld.w      	r2, (r3, 0x0)
 6c8:	9260      	ld.w      	r3, (r2, 0x0)
 6ca:	68c5      	andn      	r3, r1
 6cc:	3ba5      	bseti      	r3, 5
 6ce:	3ba6      	bseti      	r3, 6
 6d0:	07a7      	br      	0x61e	// 61e <BT_IO_Init+0x12>
	if(BT_IONAME==BT1_PA06)										//BT1 PA0.6
 6d2:	3849      	cmpnei      	r0, 9
 6d4:	0809      	bt      	0x6e6	// 6e6 <BT_IO_Init+0xda>
		GPIOA0->CONLR=(GPIOA0->CONLR & 0XF0FFFFFF)|0x04000000;
 6d6:	107f      	lrw      	r3, 0x2000004c	// 750 <BT_IO_Init+0x144>
 6d8:	32f0      	movi      	r2, 240
 6da:	9320      	ld.w      	r1, (r3, 0x0)
 6dc:	9160      	ld.w      	r3, (r1, 0x0)
 6de:	4254      	lsli      	r2, r2, 20
 6e0:	68c9      	andn      	r3, r2
 6e2:	3bba      	bseti      	r3, 26
 6e4:	07a9      	br      	0x636	// 636 <BT_IO_Init+0x2a>
	if(BT_IONAME==BT1_PA08)										//BT1 PA0.8
 6e6:	384a      	cmpnei      	r0, 10
 6e8:	0809      	bt      	0x6fa	// 6fa <BT_IO_Init+0xee>
		GPIOA0->CONHR=(GPIOA0->CONHR & 0XFFFFFFF0)|0x00000006;
 6ea:	107a      	lrw      	r3, 0x2000004c	// 750 <BT_IO_Init+0x144>
 6ec:	310f      	movi      	r1, 15
 6ee:	9340      	ld.w      	r2, (r3, 0x0)
 6f0:	9261      	ld.w      	r3, (r2, 0x4)
 6f2:	68c5      	andn      	r3, r1
 6f4:	3ba1      	bseti      	r3, 1
 6f6:	3ba2      	bseti      	r3, 2
 6f8:	07e1      	br      	0x6ba	// 6ba <BT_IO_Init+0xae>
	if(BT_IONAME==BT1_PA12)										//BT1 PA0.12
 6fa:	384b      	cmpnei      	r0, 11
 6fc:	080a      	bt      	0x710	// 710 <BT_IO_Init+0x104>
		GPIOA0->CONHR=(GPIOA0->CONHR & 0XFFF0FFFF)|0x00060000;
 6fe:	1075      	lrw      	r3, 0x2000004c	// 750 <BT_IO_Init+0x144>
 700:	32f0      	movi      	r2, 240
 702:	9320      	ld.w      	r1, (r3, 0x0)
 704:	9161      	ld.w      	r3, (r1, 0x4)
 706:	424c      	lsli      	r2, r2, 12
 708:	68c9      	andn      	r3, r2
 70a:	3bb1      	bseti      	r3, 17
 70c:	3bb2      	bseti      	r3, 18
 70e:	07c1      	br      	0x690	// 690 <BT_IO_Init+0x84>
	if(BT_IONAME==BT1_PA14)										//BT1 PA0.14
 710:	384c      	cmpnei      	r0, 12
 712:	080a      	bt      	0x726	// 726 <BT_IO_Init+0x11a>
		GPIOA0->CONHR=(GPIOA0->CONHR & 0XF0FFFFFF)|0x05000000;
 714:	106f      	lrw      	r3, 0x2000004c	// 750 <BT_IO_Init+0x144>
 716:	32f0      	movi      	r2, 240
 718:	9320      	ld.w      	r1, (r3, 0x0)
 71a:	9161      	ld.w      	r3, (r1, 0x4)
 71c:	4254      	lsli      	r2, r2, 20
 71e:	68c9      	andn      	r3, r2
 720:	3bb8      	bseti      	r3, 24
 722:	3bba      	bseti      	r3, 26
 724:	07b6      	br      	0x690	// 690 <BT_IO_Init+0x84>
	if(BT_IONAME==BT1_PB00)										//BT1 PB0.0
 726:	384d      	cmpnei      	r0, 13
 728:	0808      	bt      	0x738	// 738 <BT_IO_Init+0x12c>
		GPIOB0->CONLR=(GPIOB0->CONLR & 0XFFFFFFF0)|0x00000008;
 72a:	106b      	lrw      	r3, 0x20000048	// 754 <BT_IO_Init+0x148>
 72c:	310f      	movi      	r1, 15
 72e:	9340      	ld.w      	r2, (r3, 0x0)
 730:	9260      	ld.w      	r3, (r2, 0x0)
 732:	68c5      	andn      	r3, r1
 734:	3ba3      	bseti      	r3, 3
 736:	0774      	br      	0x61e	// 61e <BT_IO_Init+0x12>
	if(BT_IONAME==BT1_PB04)										//BT1 PB0.4
 738:	384e      	cmpnei      	r0, 14
 73a:	0bc1      	bt      	0x6bc	// 6bc <BT_IO_Init+0xb0>
		GPIOB0->CONLR=(GPIOB0->CONLR & 0XFFF0FFFF)|0x00070000;
 73c:	1066      	lrw      	r3, 0x20000048	// 754 <BT_IO_Init+0x148>
 73e:	32f0      	movi      	r2, 240
 740:	9320      	ld.w      	r1, (r3, 0x0)
 742:	424c      	lsli      	r2, r2, 12
 744:	9160      	ld.w      	r3, (r1, 0x0)
 746:	68c9      	andn      	r3, r2
 748:	32e0      	movi      	r2, 224
 74a:	424b      	lsli      	r2, r2, 11
 74c:	0797      	br      	0x67a	// 67a <BT_IO_Init+0x6e>
 74e:	0000      	bkpt
 750:	2000004c 	.long	0x2000004c
 754:	20000048 	.long	0x20000048

Disassembly of section .text.BT_Start:

00000758 <BT_Start>:
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/ 
void BT_Start(CSP_BT_T *BTx)
{
	BTx->RSSR |=0X01;
 758:	9060      	ld.w      	r3, (r0, 0x0)
 75a:	3ba0      	bseti      	r3, 0
 75c:	b060      	st.w      	r3, (r0, 0x0)
}
 75e:	783c      	jmp      	r15

Disassembly of section .text.BT_Configure:

00000760 <BT_Configure>:
//BT Configure
//EntryParameter:
//ReturnValue:NONE
/*************************************************************/
void BT_Configure(CSP_BT_T *BTx,BT_CLK_TypeDef BTCLK,U16_T PSCR_DATA,BT_SHDWSTP_TypeDef BTSHDWSTP,BT_OPM_TypeDef BTOPM,BT_EXTCKM_TypeDef BTEXTCKM)
{
 760:	14c3      	push      	r4-r6
 762:	98a4      	ld.w      	r5, (r14, 0x10)
 764:	6d97      	mov      	r6, r5
 766:	9883      	ld.w      	r4, (r14, 0xc)
	BTx->CR |=BTCLK| BTSHDWSTP| BTOPM| BTEXTCKM;
 768:	6d18      	or      	r4, r6
 76a:	6cd0      	or      	r3, r4
 76c:	90a1      	ld.w      	r5, (r0, 0x4)
 76e:	6c4c      	or      	r1, r3
 770:	6c54      	or      	r1, r5
 772:	b021      	st.w      	r1, (r0, 0x4)
	BTx->PSCR = PSCR_DATA;
 774:	b042      	st.w      	r2, (r0, 0x8)
}
 776:	1483      	pop      	r4-r6

Disassembly of section .text.BT_ControlSet_Configure:

00000778 <BT_ControlSet_Configure>:
//EntryParameter:
//ReturnValue:NONE
/*************************************************************/
void BT_ControlSet_Configure(CSP_BT_T *BTx,BT_STARTST_TypeDef BTSTART,BT_IDLEST_TypeDef BTIDLE,BT_SYNCEN_TypeDef BTSYNC,BT_SYNCMD_TypeDef BTSYNCMD,
							BT_OSTMDX_TypeDef BTOSTMD,BT_AREARM_TypeDef BTAREARM,BT_CNTRLD_TypeDef BTCNTRLD)
{
 778:	14c4      	push      	r4-r7
 77a:	1421      	subi      	r14, r14, 4
 77c:	9885      	ld.w      	r4, (r14, 0x14)
 77e:	6dd3      	mov      	r7, r4
 780:	9886      	ld.w      	r4, (r14, 0x18)
 782:	b880      	st.w      	r4, (r14, 0x0)
 784:	9887      	ld.w      	r4, (r14, 0x1c)
 786:	6d93      	mov      	r6, r4
 788:	98a8      	ld.w      	r5, (r14, 0x20)
	BTx->CR |=BTSTART| BTIDLE| BTSYNC| BTSYNCMD| BTOSTMD| BTAREARM| BTCNTRLD;
 78a:	6d58      	or      	r5, r6
 78c:	98c0      	ld.w      	r6, (r14, 0x0)
 78e:	6d58      	or      	r5, r6
 790:	6d5c      	or      	r5, r7
 792:	6cd4      	or      	r3, r5
 794:	6c8c      	or      	r2, r3
 796:	9081      	ld.w      	r4, (r0, 0x4)
 798:	6c48      	or      	r1, r2
 79a:	6d04      	or      	r4, r1
 79c:	6d9f      	mov      	r6, r7
 79e:	b081      	st.w      	r4, (r0, 0x4)
}
 7a0:	1401      	addi      	r14, r14, 4
 7a2:	1484      	pop      	r4-r7

Disassembly of section .text.BT_Period_CMP_Write:

000007a4 <BT_Period_CMP_Write>:
//ReturnValue:NONE
/*************************************************************/
void BT_Period_CMP_Write(CSP_BT_T *BTx,U16_T BTPRDR_DATA,U16_T BTCMP_DATA)
{
	//BTx->CR|=0X01<<2;
	BTx->PRDR =BTPRDR_DATA;
 7a4:	b023      	st.w      	r1, (r0, 0xc)
	BTx->CMP =BTCMP_DATA;
 7a6:	b044      	st.w      	r2, (r0, 0x10)
}
 7a8:	783c      	jmp      	r15

Disassembly of section .text.BT_ConfigInterrupt_CMD:

000007aa <BT_ConfigInterrupt_CMD>:
//NewState:ENABLE,DISABLE
//ReturnValue:NONE
/*************************************************************/ 
void BT_ConfigInterrupt_CMD(CSP_BT_T *BTx,FunctionalStatus NewState,BT_IMSCR_TypeDef BT_IMSCR_X)
{
	if (NewState != DISABLE)
 7aa:	3940      	cmpnei      	r1, 0
	{
		BTx->IMCR  |= BT_IMSCR_X;						
 7ac:	906b      	ld.w      	r3, (r0, 0x2c)
	if (NewState != DISABLE)
 7ae:	0c04      	bf      	0x7b6	// 7b6 <BT_ConfigInterrupt_CMD+0xc>
		BTx->IMCR  |= BT_IMSCR_X;						
 7b0:	6c8c      	or      	r2, r3
 7b2:	b04b      	st.w      	r2, (r0, 0x2c)
	}
	else
	{
		BTx->IMCR  &= ~BT_IMSCR_X;					
	}
}
 7b4:	783c      	jmp      	r15
		BTx->IMCR  &= ~BT_IMSCR_X;					
 7b6:	68c9      	andn      	r3, r2
 7b8:	b06b      	st.w      	r3, (r0, 0x2c)
}
 7ba:	07fd      	br      	0x7b4	// 7b4 <BT_ConfigInterrupt_CMD+0xa>

Disassembly of section .text.BT0_INT_ENABLE:

000007bc <BT0_INT_ENABLE>:
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void BT0_INT_ENABLE(void)
{
	INTC_ISER_WRITE(BT0_INT);
 7bc:	3380      	movi      	r3, 128
 7be:	4375      	lsli      	r3, r3, 21
 7c0:	1042      	lrw      	r2, 0xe000e100	// 7c8 <BT0_INT_ENABLE+0xc>
 7c2:	b260      	st.w      	r3, (r2, 0x0)
}
 7c4:	783c      	jmp      	r15
 7c6:	0000      	bkpt
 7c8:	e000e100 	.long	0xe000e100

Disassembly of section .text.GPIO_Init:

000007cc <GPIO_Init>:
//byte:Lowbyte(PIN_0~7),Highbyte(PIN_8~15)
//Dir:0:output 1:input
//ReturnValue:NONE
/*************************************************************/  
void GPIO_Init(CSP_GPIO_T *GPIOx,uint8_t PinNum,GPIO_Dir_TypeDef Dir)
{
 7cc:	14d1      	push      	r4, r15
    uint32_t data_temp;
    uint8_t GPIO_Pin;
    if(PinNum<8)
 7ce:	3907      	cmphsi      	r1, 8
{
 7d0:	6d03      	mov      	r4, r0
    if(PinNum<8)
 7d2:	0830      	bt      	0x832	// 832 <GPIO_Init+0x66>
    {
    switch (PinNum)
 7d4:	5903      	subi      	r0, r1, 1
 7d6:	3806      	cmphsi      	r0, 7
 7d8:	0827      	bt      	0x826	// 826 <GPIO_Init+0x5a>
 7da:	e3fffd43 	bsr      	0x260	// 260 <___gnu_csky_case_uqi>
 7de:	1004      	.short	0x1004
 7e0:	1d1a1613 	.long	0x1d1a1613
 7e4:	0021      	.short	0x0021
    {
        case 0:data_temp=0xfffffff0;GPIO_Pin=0;break;
        case 1:data_temp=0xffffff0f;GPIO_Pin=4;break;
 7e6:	3300      	movi      	r3, 0
 7e8:	3104      	movi      	r1, 4
 7ea:	2bf0      	subi      	r3, 241
        case 4:data_temp=0xfff0ffff;GPIO_Pin=16;break;
        case 5:data_temp=0xff0fffff;GPIO_Pin=20;break;
        case 6:data_temp=0xf0ffffff;GPIO_Pin=24;break;
        case 7:data_temp=0x0fffffff;GPIO_Pin=28;break;
    }
        if (Dir)
 7ec:	3a40      	cmpnei      	r2, 0
        {
          (GPIOx)->CONLR =((GPIOx)->CONLR & data_temp) | 1<<GPIO_Pin;
 7ee:	9440      	ld.w      	r2, (r4, 0x0)
 7f0:	68c8      	and      	r3, r2
        if (Dir)
 7f2:	0c1e      	bf      	0x82e	// 82e <GPIO_Init+0x62>
          (GPIOx)->CONLR =((GPIOx)->CONLR & data_temp) | 1<<GPIO_Pin;
 7f4:	3201      	movi      	r2, 1
        }
        else
        {
         (GPIOx)->CONLR = ((GPIOx)->CONLR & data_temp) | 2<<GPIO_Pin; 
 7f6:	7084      	lsl      	r2, r1
 7f8:	6cc8      	or      	r3, r2
 7fa:	b460      	st.w      	r3, (r4, 0x0)
        else
        {
         (GPIOx)->CONHR = ((GPIOx)->CONHR & data_temp) | 2<<GPIO_Pin;    
        }
    }
}
 7fc:	1491      	pop      	r4, r15
        case 2:data_temp=0xfffff0ff;GPIO_Pin=8;break;
 7fe:	3108      	movi      	r1, 8
 800:	1166      	lrw      	r3, 0xfffff0ff	// 898 <GPIO_Init+0xcc>
 802:	07f5      	br      	0x7ec	// 7ec <GPIO_Init+0x20>
        case 3:data_temp=0xffff0fff;GPIO_Pin=12;break;
 804:	310c      	movi      	r1, 12
 806:	1166      	lrw      	r3, 0xffff0fff	// 89c <GPIO_Init+0xd0>
 808:	07f2      	br      	0x7ec	// 7ec <GPIO_Init+0x20>
        case 4:data_temp=0xfff0ffff;GPIO_Pin=16;break;
 80a:	3110      	movi      	r1, 16
 80c:	1165      	lrw      	r3, 0xfff10000	// 8a0 <GPIO_Init+0xd4>
        case 6:data_temp=0xf0ffffff;GPIO_Pin=24;break;
 80e:	2b00      	subi      	r3, 1
 810:	07ee      	br      	0x7ec	// 7ec <GPIO_Init+0x20>
        case 5:data_temp=0xff0fffff;GPIO_Pin=20;break;
 812:	3114      	movi      	r1, 20
 814:	1164      	lrw      	r3, 0xff100000	// 8a4 <GPIO_Init+0xd8>
 816:	07fc      	br      	0x80e	// 80e <GPIO_Init+0x42>
        case 6:data_temp=0xf0ffffff;GPIO_Pin=24;break;
 818:	33f1      	movi      	r3, 241
 81a:	3118      	movi      	r1, 24
 81c:	4378      	lsli      	r3, r3, 24
 81e:	07f8      	br      	0x80e	// 80e <GPIO_Init+0x42>
        case 7:data_temp=0x0fffffff;GPIO_Pin=28;break;
 820:	311c      	movi      	r1, 28
 822:	1162      	lrw      	r3, 0xfffffff	// 8a8 <GPIO_Init+0xdc>
 824:	07e4      	br      	0x7ec	// 7ec <GPIO_Init+0x20>
        case 0:data_temp=0xfffffff0;GPIO_Pin=0;break;
 826:	3300      	movi      	r3, 0
 828:	3100      	movi      	r1, 0
 82a:	2b0f      	subi      	r3, 16
 82c:	07e0      	br      	0x7ec	// 7ec <GPIO_Init+0x20>
         (GPIOx)->CONLR = ((GPIOx)->CONLR & data_temp) | 2<<GPIO_Pin; 
 82e:	3202      	movi      	r2, 2
 830:	07e3      	br      	0x7f6	// 7f6 <GPIO_Init+0x2a>
    else if (PinNum<16)
 832:	390f      	cmphsi      	r1, 16
 834:	0be4      	bt      	0x7fc	// 7fc <GPIO_Init+0x30>
        switch (PinNum)
 836:	2908      	subi      	r1, 9
 838:	3906      	cmphsi      	r1, 7
 83a:	6c07      	mov      	r0, r1
 83c:	0827      	bt      	0x88a	// 88a <GPIO_Init+0xbe>
 83e:	e3fffd11 	bsr      	0x260	// 260 <___gnu_csky_case_uqi>
 842:	1004      	.short	0x1004
 844:	1d1a1613 	.long	0x1d1a1613
 848:	0021      	.short	0x0021
        case 9:data_temp=0xffffff0f;GPIO_Pin=4;break;
 84a:	3300      	movi      	r3, 0
 84c:	3104      	movi      	r1, 4
 84e:	2bf0      	subi      	r3, 241
      if (Dir)
 850:	3a40      	cmpnei      	r2, 0
        (GPIOx)->CONHR = ((GPIOx)->CONHR & data_temp) | 1<<GPIO_Pin;  
 852:	9441      	ld.w      	r2, (r4, 0x4)
 854:	68c8      	and      	r3, r2
      if (Dir)
 856:	0c1e      	bf      	0x892	// 892 <GPIO_Init+0xc6>
        (GPIOx)->CONHR = ((GPIOx)->CONHR & data_temp) | 1<<GPIO_Pin;  
 858:	3201      	movi      	r2, 1
         (GPIOx)->CONHR = ((GPIOx)->CONHR & data_temp) | 2<<GPIO_Pin;    
 85a:	7084      	lsl      	r2, r1
 85c:	6cc8      	or      	r3, r2
 85e:	b461      	st.w      	r3, (r4, 0x4)
}
 860:	07ce      	br      	0x7fc	// 7fc <GPIO_Init+0x30>
        case 10:data_temp=0xfffff0ff;GPIO_Pin=8;break;
 862:	3108      	movi      	r1, 8
 864:	106d      	lrw      	r3, 0xfffff0ff	// 898 <GPIO_Init+0xcc>
 866:	07f5      	br      	0x850	// 850 <GPIO_Init+0x84>
        case 11:data_temp=0xffff0fff;GPIO_Pin=12;break;
 868:	310c      	movi      	r1, 12
 86a:	106d      	lrw      	r3, 0xffff0fff	// 89c <GPIO_Init+0xd0>
 86c:	07f2      	br      	0x850	// 850 <GPIO_Init+0x84>
        case 12:data_temp=0xfff0ffff;GPIO_Pin=16;break;
 86e:	3110      	movi      	r1, 16
 870:	106c      	lrw      	r3, 0xfff10000	// 8a0 <GPIO_Init+0xd4>
        case 14:data_temp=0xf0ffffff;GPIO_Pin=24;break;
 872:	2b00      	subi      	r3, 1
 874:	07ee      	br      	0x850	// 850 <GPIO_Init+0x84>
        case 13:data_temp=0xff0fffff;GPIO_Pin=20;break;
 876:	3114      	movi      	r1, 20
 878:	106b      	lrw      	r3, 0xff100000	// 8a4 <GPIO_Init+0xd8>
 87a:	07fc      	br      	0x872	// 872 <GPIO_Init+0xa6>
        case 14:data_temp=0xf0ffffff;GPIO_Pin=24;break;
 87c:	33f1      	movi      	r3, 241
 87e:	3118      	movi      	r1, 24
 880:	4378      	lsli      	r3, r3, 24
 882:	07f8      	br      	0x872	// 872 <GPIO_Init+0xa6>
        case 15:data_temp=0x0fffffff;GPIO_Pin=28;break;
 884:	311c      	movi      	r1, 28
 886:	1069      	lrw      	r3, 0xfffffff	// 8a8 <GPIO_Init+0xdc>
 888:	07e4      	br      	0x850	// 850 <GPIO_Init+0x84>
        case 8:data_temp=0xfffffff0;GPIO_Pin=0;break;
 88a:	3300      	movi      	r3, 0
 88c:	3100      	movi      	r1, 0
 88e:	2b0f      	subi      	r3, 16
 890:	07e0      	br      	0x850	// 850 <GPIO_Init+0x84>
         (GPIOx)->CONHR = ((GPIOx)->CONHR & data_temp) | 2<<GPIO_Pin;    
 892:	3202      	movi      	r2, 2
 894:	07e3      	br      	0x85a	// 85a <GPIO_Init+0x8e>
 896:	0000      	bkpt
 898:	fffff0ff 	.long	0xfffff0ff
 89c:	ffff0fff 	.long	0xffff0fff
 8a0:	fff10000 	.long	0xfff10000
 8a4:	ff100000 	.long	0xff100000
 8a8:	0fffffff 	.long	0x0fffffff

Disassembly of section .text.GPIO_Write_High:

000008ac <GPIO_Write_High>:
//bit:0~15
//ReturnValue:VALUE
/*************************************************************/
void GPIO_Write_High(CSP_GPIO_T *GPIOx,uint8_t bit)
{
        (GPIOx)->SODR = (1ul<<bit);
 8ac:	3301      	movi      	r3, 1
 8ae:	70c4      	lsl      	r3, r1
 8b0:	b063      	st.w      	r3, (r0, 0xc)
}
 8b2:	783c      	jmp      	r15

Disassembly of section .text.GPIO_Write_Low:

000008b4 <GPIO_Write_Low>:
void GPIO_Write_Low(CSP_GPIO_T *GPIOx,uint8_t bit)
{
        (GPIOx)->CODR = (1ul<<bit);
 8b4:	3301      	movi      	r3, 1
 8b6:	70c4      	lsl      	r3, r1
 8b8:	b064      	st.w      	r3, (r0, 0x10)
}
 8ba:	783c      	jmp      	r15

Disassembly of section .text.GPIO_Reverse:

000008bc <GPIO_Reverse>:
//ReturnValue:VALUE
/*************************************************************/
void GPIO_Reverse(CSP_GPIO_T *GPIOx,uint8_t bit)
{
     uint32_t dat = 0;
     dat=((GPIOx)->ODSR>>bit)&1ul;
 8bc:	9045      	ld.w      	r2, (r0, 0x14)
 8be:	3301      	movi      	r3, 1
 8c0:	7085      	lsr      	r2, r1
 8c2:	688c      	and      	r2, r3
     {
       if (dat==1)  
 8c4:	3a40      	cmpnei      	r2, 0
 8c6:	70c4      	lsl      	r3, r1
 8c8:	0c03      	bf      	0x8ce	// 8ce <GPIO_Reverse+0x12>
       {
           (GPIOx)->CODR = (1ul<<bit);
 8ca:	b064      	st.w      	r3, (r0, 0x10)
       {
           (GPIOx)->SODR = (1ul<<bit);
           return;
       }
     }
}
 8cc:	783c      	jmp      	r15
           (GPIOx)->SODR = (1ul<<bit);
 8ce:	b063      	st.w      	r3, (r0, 0xc)
           return;
 8d0:	07fe      	br      	0x8cc	// 8cc <GPIO_Reverse+0x10>

Disassembly of section .text.I2C_DeInit:

000008d4 <I2C_DeInit>:
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void I2C_DeInit(void)
{
    I2C0->ENABLE  	= 0;
 8d4:	1064      	lrw      	r3, 0x20000030	// 8e4 <I2C_DeInit+0x10>
 8d6:	3200      	movi      	r2, 0
 8d8:	9360      	ld.w      	r3, (r3, 0x0)
 8da:	b34f      	st.w      	r2, (r3, 0x3c)
    I2C0->IMSCR  	= 0;
 8dc:	b357      	st.w      	r2, (r3, 0x5c)
    I2C0->ICR   	= 0X7FFF;
 8de:	1043      	lrw      	r2, 0x7fff	// 8e8 <I2C_DeInit+0x14>
 8e0:	b359      	st.w      	r2, (r3, 0x64)
} 
 8e2:	783c      	jmp      	r15
 8e4:	20000030 	.long	0x20000030
 8e8:	00007fff 	.long	0x00007fff

Disassembly of section .text.I2C_Slave_CONFIG:

000008ec <I2C_Slave_CONFIG>:
//I2C_SALVE_ADD:I2C SLAVE ADDRESS
//ReturnValue:NONE
/*************************************************************/
void I2C_Slave_CONFIG(I2C_SDA_TypeDef I2C_SDA_IO,I2C_SCL_TypeDef I2C_SCL_IO,I2C_SPEEDMODE_TypeDef SPEEDMODE,
						I2C_SLAVEBITS_TypeDef SLAVEBITS,U16_T I2C_SALVE_ADDS,U16_T SS_SCLHX,U16_T SS_SCLLX)
{
 8ec:	14c4      	push      	r4-r7
 8ee:	1421      	subi      	r14, r14, 4
 8f0:	d88e100a 	ld.h      	r4, (r14, 0x14)
	//SDA IO Initial
    if(I2C_SDA_IO==I2C_SDA_PA00)
 8f4:	3840      	cmpnei      	r0, 0
{
 8f6:	b880      	st.w      	r4, (r14, 0x0)
 8f8:	d8ae100c 	ld.h      	r5, (r14, 0x18)
 8fc:	d88e100e 	ld.h      	r4, (r14, 0x1c)
    if(I2C_SDA_IO==I2C_SDA_PA00)
 900:	080a      	bt      	0x914	// 914 <I2C_Slave_CONFIG+0x28>
    {
    GPIOA0->CONLR = (GPIOA0->CONLR&0XFFFFFFF0)  | 0x00000005;            //PA0.0->SDA
 902:	1206      	lrw      	r0, 0x2000004c	// a18 <I2C_Slave_CONFIG+0x12c>
 904:	370f      	movi      	r7, 15
 906:	90c0      	ld.w      	r6, (r0, 0x0)
 908:	9600      	ld.w      	r0, (r6, 0x0)
 90a:	681d      	andn      	r0, r7
 90c:	38a0      	bseti      	r0, 0
 90e:	38a2      	bseti      	r0, 2
    {
    GPIOA0->CONLR = (GPIOA0->CONLR&0XFFFF0FFF)  | 0x00006000;            //PA0.3->SDA   ///
    }
	else if (I2C_SDA_IO==I2C_SDA_PA07)
    {
    GPIOA0->CONLR = (GPIOA0->CONLR&0X0FFFFFFF)  | 0x40000000;            //PA0.7->SDA        
 910:	b600      	st.w      	r0, (r6, 0x0)
 912:	040c      	br      	0x92a	// 92a <I2C_Slave_CONFIG+0x3e>
    else if(I2C_SDA_IO==I2C_SDA_PA03)
 914:	3841      	cmpnei      	r0, 1
 916:	0827      	bt      	0x964	// 964 <I2C_Slave_CONFIG+0x78>
    GPIOA0->CONLR = (GPIOA0->CONLR&0XFFFF0FFF)  | 0x00006000;            //PA0.3->SDA   ///
 918:	1200      	lrw      	r0, 0x2000004c	// a18 <I2C_Slave_CONFIG+0x12c>
 91a:	36f0      	movi      	r6, 240
 91c:	90e0      	ld.w      	r7, (r0, 0x0)
 91e:	9700      	ld.w      	r0, (r7, 0x0)
 920:	46c8      	lsli      	r6, r6, 8
 922:	6819      	andn      	r0, r6
 924:	38ad      	bseti      	r0, 13
 926:	38ae      	bseti      	r0, 14
 928:	b700      	st.w      	r0, (r7, 0x0)
	else if(I2C_SDA_IO==I2C_SDA_PA014)
    {
    GPIOA0->CONHR = (GPIOA0->CONHR&0XF0FFFFFF)  | 0x06000000;            //PA0.14->SDA
    }
	//SCL IO Initial
	if (I2C_SCL_IO==I2C_SCL_PB00)
 92a:	3940      	cmpnei      	r1, 0
 92c:	083c      	bt      	0x9a4	// 9a4 <I2C_Slave_CONFIG+0xb8>
    {
    GPIOB0->CONLR = (GPIOB0->CONLR&0XFFFFFFF0)  | 0x00000006;            //PB0.0->SCL        
 92e:	113c      	lrw      	r1, 0x20000048	// a1c <I2C_Slave_CONFIG+0x130>
 930:	360f      	movi      	r6, 15
 932:	9100      	ld.w      	r0, (r1, 0x0)
 934:	9020      	ld.w      	r1, (r0, 0x0)
 936:	6859      	andn      	r1, r6
 938:	39a1      	bseti      	r1, 1
 93a:	39a2      	bseti      	r1, 2
    }
	else if (I2C_SCL_IO==I2C_SCL_PB02)
    {
    GPIOB0->CONLR = (GPIOB0->CONLR&0XFFFFF0FF)  | 0x00000400;            //PB0.2->SCL        
 93c:	b020      	st.w      	r1, (r0, 0x0)
    }
	else if(I2C_SCL_IO==I2C_SCL_PA015)
    {
    GPIOA0->CONHR = (GPIOA0->CONHR&0X0FFFFFFF)  | 0x60000000;            //PA0.15->SCL  
    }
	I2C0->ENABLE = (I2C0->ENABLE&0XFFFFFFFE)|I2C_DISABLE;
 93e:	1139      	lrw      	r1, 0x20000030	// a20 <I2C_Slave_CONFIG+0x134>
	I2C0->CR =(I2C0->CR&0XFFFFF000)| I2C_MASTER_DIS |I2C_SLAVE_EN | SPEEDMODE | SLAVEBITS;
 940:	11d9      	lrw      	r6, 0xfff	// a24 <I2C_Slave_CONFIG+0x138>
	I2C0->ENABLE = (I2C0->ENABLE&0XFFFFFFFE)|I2C_DISABLE;
 942:	9120      	ld.w      	r1, (r1, 0x0)
 944:	910f      	ld.w      	r0, (r1, 0x3c)
 946:	3880      	bclri      	r0, 0
 948:	b10f      	st.w      	r0, (r1, 0x3c)
	I2C0->CR =(I2C0->CR&0XFFFFF000)| I2C_MASTER_DIS |I2C_SLAVE_EN | SPEEDMODE | SLAVEBITS;
 94a:	9100      	ld.w      	r0, (r1, 0x0)
 94c:	6819      	andn      	r0, r6
 94e:	6cc0      	or      	r3, r0
 950:	6cc8      	or      	r3, r2
 952:	b160      	st.w      	r3, (r1, 0x0)
	I2C0->SADDR = I2C_SALVE_ADDS;
	if(SPEEDMODE==FAST_MODE)
 954:	3a44      	cmpnei      	r2, 4
	I2C0->SADDR = I2C_SALVE_ADDS;
 956:	9860      	ld.w      	r3, (r14, 0x0)
 958:	b162      	st.w      	r3, (r1, 0x8)
	if(SPEEDMODE==FAST_MODE)
 95a:	085a      	bt      	0xa0e	// a0e <I2C_Slave_CONFIG+0x122>
	{
		I2C0->FS_SCLH  = SS_SCLHX;  							//SCL high time
 95c:	b1a7      	st.w      	r5, (r1, 0x1c)
		I2C0->FS_SCLL  = SS_SCLLX;  							//SCL low  time
 95e:	b188      	st.w      	r4, (r1, 0x20)
	else if(SPEEDMODE==STANDARD_MODE)
	{
		I2C0->SS_SCLH  = SS_SCLHX;  							//SCL high time
		I2C0->SS_SCLL  = SS_SCLLX;  							//SCL low  time
	}
}
 960:	1401      	addi      	r14, r14, 4
 962:	1484      	pop      	r4-r7
	else if (I2C_SDA_IO==I2C_SDA_PA07)
 964:	3842      	cmpnei      	r0, 2
 966:	0808      	bt      	0x976	// 976 <I2C_Slave_CONFIG+0x8a>
    GPIOA0->CONLR = (GPIOA0->CONLR&0X0FFFFFFF)  | 0x40000000;            //PA0.7->SDA        
 968:	110c      	lrw      	r0, 0x2000004c	// a18 <I2C_Slave_CONFIG+0x12c>
 96a:	90c0      	ld.w      	r6, (r0, 0x0)
 96c:	9600      	ld.w      	r0, (r6, 0x0)
 96e:	4004      	lsli      	r0, r0, 4
 970:	4804      	lsri      	r0, r0, 4
 972:	38be      	bseti      	r0, 30
 974:	07ce      	br      	0x910	// 910 <I2C_Slave_CONFIG+0x24>
	else if(I2C_SDA_IO==I2C_SDA_PA013)
 976:	3843      	cmpnei      	r0, 3
 978:	080b      	bt      	0x98e	// 98e <I2C_Slave_CONFIG+0xa2>
    GPIOA0->CONHR = (GPIOA0->CONHR&0XFF0FFFFF)  | 0x00600000;            //PA0.13->SDA
 97a:	1108      	lrw      	r0, 0x2000004c	// a18 <I2C_Slave_CONFIG+0x12c>
 97c:	36f0      	movi      	r6, 240
 97e:	90e0      	ld.w      	r7, (r0, 0x0)
 980:	9701      	ld.w      	r0, (r7, 0x4)
 982:	46d0      	lsli      	r6, r6, 16
 984:	6819      	andn      	r0, r6
 986:	38b5      	bseti      	r0, 21
 988:	38b6      	bseti      	r0, 22
    GPIOA0->CONHR = (GPIOA0->CONHR&0XF0FFFFFF)  | 0x06000000;            //PA0.14->SDA
 98a:	b701      	st.w      	r0, (r7, 0x4)
 98c:	07cf      	br      	0x92a	// 92a <I2C_Slave_CONFIG+0x3e>
	else if(I2C_SDA_IO==I2C_SDA_PA014)
 98e:	3844      	cmpnei      	r0, 4
 990:	0bcd      	bt      	0x92a	// 92a <I2C_Slave_CONFIG+0x3e>
    GPIOA0->CONHR = (GPIOA0->CONHR&0XF0FFFFFF)  | 0x06000000;            //PA0.14->SDA
 992:	1102      	lrw      	r0, 0x2000004c	// a18 <I2C_Slave_CONFIG+0x12c>
 994:	36f0      	movi      	r6, 240
 996:	90e0      	ld.w      	r7, (r0, 0x0)
 998:	9701      	ld.w      	r0, (r7, 0x4)
 99a:	46d4      	lsli      	r6, r6, 20
 99c:	6819      	andn      	r0, r6
 99e:	38b9      	bseti      	r0, 25
 9a0:	38ba      	bseti      	r0, 26
 9a2:	07f4      	br      	0x98a	// 98a <I2C_Slave_CONFIG+0x9e>
	else if (I2C_SCL_IO==I2C_SCL_PB02)
 9a4:	3941      	cmpnei      	r1, 1
 9a6:	0809      	bt      	0x9b8	// 9b8 <I2C_Slave_CONFIG+0xcc>
    GPIOB0->CONLR = (GPIOB0->CONLR&0XFFFFF0FF)  | 0x00000400;            //PB0.2->SCL        
 9a8:	103d      	lrw      	r1, 0x20000048	// a1c <I2C_Slave_CONFIG+0x130>
 9aa:	36f0      	movi      	r6, 240
 9ac:	9100      	ld.w      	r0, (r1, 0x0)
 9ae:	9020      	ld.w      	r1, (r0, 0x0)
 9b0:	46c4      	lsli      	r6, r6, 4
 9b2:	6859      	andn      	r1, r6
 9b4:	39aa      	bseti      	r1, 10
 9b6:	07c3      	br      	0x93c	// 93c <I2C_Slave_CONFIG+0x50>
    else if(I2C_SCL_IO==I2C_SCL_PA01)
 9b8:	3942      	cmpnei      	r1, 2
 9ba:	0809      	bt      	0x9cc	// 9cc <I2C_Slave_CONFIG+0xe0>
    GPIOA0->CONLR = (GPIOA0->CONLR&0XFFFFFF0F)  | 0x00000050;            //PA0.1->SCL
 9bc:	1037      	lrw      	r1, 0x2000004c	// a18 <I2C_Slave_CONFIG+0x12c>
 9be:	36f0      	movi      	r6, 240
 9c0:	9100      	ld.w      	r0, (r1, 0x0)
 9c2:	9020      	ld.w      	r1, (r0, 0x0)
 9c4:	6859      	andn      	r1, r6
 9c6:	39a4      	bseti      	r1, 4
 9c8:	39a6      	bseti      	r1, 6
 9ca:	07b9      	br      	0x93c	// 93c <I2C_Slave_CONFIG+0x50>
    else if(I2C_SCL_IO==I2C_SCL_PA04)
 9cc:	3943      	cmpnei      	r1, 3
 9ce:	080a      	bt      	0x9e2	// 9e2 <I2C_Slave_CONFIG+0xf6>
     GPIOA0->CONLR = (GPIOA0->CONLR&0XFFF0FFFF)  | 0x00060000;            //PA0.4->SCL   //
 9d0:	1032      	lrw      	r1, 0x2000004c	// a18 <I2C_Slave_CONFIG+0x12c>
 9d2:	36f0      	movi      	r6, 240
 9d4:	9100      	ld.w      	r0, (r1, 0x0)
 9d6:	9020      	ld.w      	r1, (r0, 0x0)
 9d8:	46cc      	lsli      	r6, r6, 12
 9da:	6859      	andn      	r1, r6
 9dc:	39b1      	bseti      	r1, 17
 9de:	39b2      	bseti      	r1, 18
 9e0:	07ae      	br      	0x93c	// 93c <I2C_Slave_CONFIG+0x50>
	else if(I2C_SCL_IO==I2C_SCL_PA06)
 9e2:	3944      	cmpnei      	r1, 4
 9e4:	080a      	bt      	0x9f8	// 9f8 <I2C_Slave_CONFIG+0x10c>
    GPIOA0->CONLR = (GPIOA0->CONLR&0XF0FFFFFF)  | 0x06000000;            //PA0.6->SCL  
 9e6:	102d      	lrw      	r1, 0x2000004c	// a18 <I2C_Slave_CONFIG+0x12c>
 9e8:	36f0      	movi      	r6, 240
 9ea:	9100      	ld.w      	r0, (r1, 0x0)
 9ec:	9020      	ld.w      	r1, (r0, 0x0)
 9ee:	46d4      	lsli      	r6, r6, 20
 9f0:	6859      	andn      	r1, r6
 9f2:	39b9      	bseti      	r1, 25
 9f4:	39ba      	bseti      	r1, 26
 9f6:	07a3      	br      	0x93c	// 93c <I2C_Slave_CONFIG+0x50>
	else if(I2C_SCL_IO==I2C_SCL_PA015)
 9f8:	3945      	cmpnei      	r1, 5
 9fa:	0ba2      	bt      	0x93e	// 93e <I2C_Slave_CONFIG+0x52>
    GPIOA0->CONHR = (GPIOA0->CONHR&0X0FFFFFFF)  | 0x60000000;            //PA0.15->SCL  
 9fc:	1027      	lrw      	r1, 0x2000004c	// a18 <I2C_Slave_CONFIG+0x12c>
 9fe:	9100      	ld.w      	r0, (r1, 0x0)
 a00:	9021      	ld.w      	r1, (r0, 0x4)
 a02:	4124      	lsli      	r1, r1, 4
 a04:	4924      	lsri      	r1, r1, 4
 a06:	39bd      	bseti      	r1, 29
 a08:	39be      	bseti      	r1, 30
 a0a:	b021      	st.w      	r1, (r0, 0x4)
 a0c:	0799      	br      	0x93e	// 93e <I2C_Slave_CONFIG+0x52>
	else if(SPEEDMODE==STANDARD_MODE)
 a0e:	3a42      	cmpnei      	r2, 2
 a10:	0ba8      	bt      	0x960	// 960 <I2C_Slave_CONFIG+0x74>
		I2C0->SS_SCLH  = SS_SCLHX;  							//SCL high time
 a12:	b1a5      	st.w      	r5, (r1, 0x14)
		I2C0->SS_SCLL  = SS_SCLLX;  							//SCL low  time
 a14:	b186      	st.w      	r4, (r1, 0x18)
}
 a16:	07a5      	br      	0x960	// 960 <I2C_Slave_CONFIG+0x74>
 a18:	2000004c 	.long	0x2000004c
 a1c:	20000048 	.long	0x20000048
 a20:	20000030 	.long	0x20000030
 a24:	00000fff 	.long	0x00000fff

Disassembly of section .text.I2C_SDA_TSETUP_THOLD_CONFIG:

00000a28 <I2C_SDA_TSETUP_THOLD_CONFIG>:
//ReturnValue:NONE
/*************************************************************/
void I2C_SDA_TSETUP_THOLD_CONFIG(U8_T SDA_TSETUP , U8_T SDA_RX_THOLD , U16_T SDA_TX_THOLD)
{
	I2C0->SDA_TSETUP=SDA_TSETUP;
	I2C0->SDA_THOLD=(SDA_RX_THOLD<<16)|SDA_TX_THOLD;
 a28:	4130      	lsli      	r1, r1, 16
	I2C0->SDA_TSETUP=SDA_TSETUP;
 a2a:	1064      	lrw      	r3, 0x20000030	// a38 <I2C_SDA_TSETUP_THOLD_CONFIG+0x10>
	I2C0->SDA_THOLD=(SDA_RX_THOLD<<16)|SDA_TX_THOLD;
 a2c:	6c84      	or      	r2, r1
	I2C0->SDA_TSETUP=SDA_TSETUP;
 a2e:	9360      	ld.w      	r3, (r3, 0x0)
 a30:	b312      	st.w      	r0, (r3, 0x48)
	I2C0->SDA_THOLD=(SDA_RX_THOLD<<16)|SDA_TX_THOLD;
 a32:	b353      	st.w      	r2, (r3, 0x4c)
}
 a34:	783c      	jmp      	r15
 a36:	0000      	bkpt
 a38:	20000030 	.long	0x20000030

Disassembly of section .text.I2C_ConfigInterrupt_CMD:

00000a3c <I2C_ConfigInterrupt_CMD>:
//				 I2C_RESTART_DET,I2C_MST_ON_HOLD,I2C_SCL_SLOW   
//NewState:ENABLE/DISABLE
//ReturnValue:NONE
/*************************************************************/
void I2C_ConfigInterrupt_CMD(FunctionalStatus NewState,U32_T INT_TYPE)
{
 a3c:	1066      	lrw      	r3, 0x20000030	// a54 <I2C_ConfigInterrupt_CMD+0x18>
	if(NewState != DISABLE)
 a3e:	3840      	cmpnei      	r0, 0
	{
		I2C0->IMSCR |= INT_TYPE;
 a40:	9340      	ld.w      	r2, (r3, 0x0)
 a42:	9277      	ld.w      	r3, (r2, 0x5c)
	if(NewState != DISABLE)
 a44:	0c04      	bf      	0xa4c	// a4c <I2C_ConfigInterrupt_CMD+0x10>
		I2C0->IMSCR |= INT_TYPE;
 a46:	6c4c      	or      	r1, r3
 a48:	b237      	st.w      	r1, (r2, 0x5c)
	}
	else
	{
		I2C0->IMSCR &= (~INT_TYPE);
	}
}
 a4a:	783c      	jmp      	r15
		I2C0->IMSCR &= (~INT_TYPE);
 a4c:	68c5      	andn      	r3, r1
 a4e:	b277      	st.w      	r3, (r2, 0x5c)
}
 a50:	07fd      	br      	0xa4a	// a4a <I2C_ConfigInterrupt_CMD+0xe>
 a52:	0000      	bkpt
 a54:	20000030 	.long	0x20000030

Disassembly of section .text.I2C_FIFO_TriggerData:

00000a58 <I2C_FIFO_TriggerData>:
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void I2C_FIFO_TriggerData(U16_T RX_FLSEL,U16_T TX_FLSEL)
{
	I2C0->RX_FLSEL = RX_FLSEL;  							
 a58:	1063      	lrw      	r3, 0x20000030	// a64 <I2C_FIFO_TriggerData+0xc>
 a5a:	9360      	ld.w      	r3, (r3, 0x0)
 a5c:	b30b      	st.w      	r0, (r3, 0x2c)
	I2C0->TX_FLSEL = TX_FLSEL;  							
 a5e:	b32c      	st.w      	r1, (r3, 0x30)
}
 a60:	783c      	jmp      	r15
 a62:	0000      	bkpt
 a64:	20000030 	.long	0x20000030

Disassembly of section .text.I2C_Enable:

00000a68 <I2C_Enable>:
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void I2C_Enable(void)
{
	I2C0->ENABLE = (I2C0->ENABLE&0XFFFFFFFE)|I2C_ENABLE;                         //Enable I2C
 a68:	1066      	lrw      	r3, 0x20000030	// a80 <I2C_Enable+0x18>
	while((I2C0->STATUS&0x1000)!=0x1000);
 a6a:	3280      	movi      	r2, 128
	I2C0->ENABLE = (I2C0->ENABLE&0XFFFFFFFE)|I2C_ENABLE;                         //Enable I2C
 a6c:	9320      	ld.w      	r1, (r3, 0x0)
 a6e:	916f      	ld.w      	r3, (r1, 0x3c)
 a70:	3ba0      	bseti      	r3, 0
 a72:	b16f      	st.w      	r3, (r1, 0x3c)
	while((I2C0->STATUS&0x1000)!=0x1000);
 a74:	4245      	lsli      	r2, r2, 5
 a76:	9170      	ld.w      	r3, (r1, 0x40)
 a78:	68c8      	and      	r3, r2
 a7a:	3b40      	cmpnei      	r3, 0
 a7c:	0ffd      	bf      	0xa76	// a76 <I2C_Enable+0xe>
}
 a7e:	783c      	jmp      	r15
 a80:	20000030 	.long	0x20000030

Disassembly of section .text.I2C_Disable:

00000a84 <I2C_Disable>:
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void I2C_Disable(void)
{
	I2C0->ENABLE =(I2C0->ENABLE&0XFFFFFFFE)|I2C_DISABLE;                         //Disable I2C
 a84:	1066      	lrw      	r3, 0x20000030	// a9c <I2C_Disable+0x18>
	while((I2C0->STATUS&0x1000)==0x1000);
 a86:	3280      	movi      	r2, 128
	I2C0->ENABLE =(I2C0->ENABLE&0XFFFFFFFE)|I2C_DISABLE;                         //Disable I2C
 a88:	9320      	ld.w      	r1, (r3, 0x0)
 a8a:	916f      	ld.w      	r3, (r1, 0x3c)
 a8c:	3b80      	bclri      	r3, 0
 a8e:	b16f      	st.w      	r3, (r1, 0x3c)
	while((I2C0->STATUS&0x1000)==0x1000);
 a90:	4245      	lsli      	r2, r2, 5
 a92:	9170      	ld.w      	r3, (r1, 0x40)
 a94:	68c8      	and      	r3, r2
 a96:	3b40      	cmpnei      	r3, 0
 a98:	0bfd      	bt      	0xa92	// a92 <I2C_Disable+0xe>
}
 a9a:	783c      	jmp      	r15
 a9c:	20000030 	.long	0x20000030

Disassembly of section .text.I2C_Int_Enable:

00000aa0 <I2C_Int_Enable>:
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void I2C_Int_Enable(void)
{
	INTC_ISER_WRITE(I2C_INT);                             //Enable I2C interrupt
 aa0:	3380      	movi      	r3, 128
 aa2:	436a      	lsli      	r3, r3, 10
 aa4:	1042      	lrw      	r2, 0xe000e100	// aac <I2C_Int_Enable+0xc>
 aa6:	b260      	st.w      	r3, (r2, 0x0)
}
 aa8:	783c      	jmp      	r15
 aaa:	0000      	bkpt
 aac:	e000e100 	.long	0xe000e100

Disassembly of section .text.I2C_Slave_Receive:

00000ab0 <I2C_Slave_Receive>:
//I2C slave Receive
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void I2C_Slave_Receive(void)
{
 ab0:	14d2      	push      	r4-r5, r15
	
	if(!(((I2C0->MISR&I2C_SCL_SLOW)==I2C_SCL_SLOW)
 ab2:	1296      	lrw      	r4, 0x20000030	// c08 <I2C_Slave_Receive+0x158>
 ab4:	3180      	movi      	r1, 128
 ab6:	9460      	ld.w      	r3, (r4, 0x0)
 ab8:	9356      	ld.w      	r2, (r3, 0x58)
 aba:	4127      	lsli      	r1, r1, 7
 abc:	6884      	and      	r2, r1
 abe:	3a40      	cmpnei      	r2, 0
 ac0:	0894      	bt      	0xbe8	// be8 <I2C_Slave_Receive+0x138>
			||((I2C0->MISR&I2C_TX_ABRT)==I2C_TX_ABRT)))				 //SCLK锁死,IIC发送中止))
 ac2:	9356      	ld.w      	r2, (r3, 0x58)
 ac4:	3140      	movi      	r1, 64
 ac6:	6884      	and      	r2, r1
	if(!(((I2C0->MISR&I2C_SCL_SLOW)==I2C_SCL_SLOW)
 ac8:	3a40      	cmpnei      	r2, 0
 aca:	088f      	bt      	0xbe8	// be8 <I2C_Slave_Receive+0x138>
	{
	if((I2C0->MISR&I2C_RX_FULL)==I2C_RX_FULL)        //有接收到数据
 acc:	9356      	ld.w      	r2, (r3, 0x58)
 ace:	3104      	movi      	r1, 4
 ad0:	6884      	and      	r2, r1
 ad2:	3a40      	cmpnei      	r2, 0
 ad4:	0c14      	bf      	0xafc	// afc <I2C_Slave_Receive+0x4c>
	{
		if(RdIndex==0)
 ad6:	122e      	lrw      	r1, 0x200000d0	// c0c <I2C_Slave_Receive+0x15c>
 ad8:	8141      	ld.b      	r2, (r1, 0x1)
 ada:	3a40      	cmpnei      	r2, 0
 adc:	124d      	lrw      	r2, 0x20000e25	// c10 <I2C_Slave_Receive+0x160>
 ade:	084f      	bt      	0xb7c	// b7c <I2C_Slave_Receive+0xcc>
		{
			RdIndex=1;
 ae0:	3001      	movi      	r0, 1
 ae2:	a101      	st.b      	r0, (r1, 0x1)
			I2C_Data_Adress=I2C0->DATA_CMD&0XFF;
 ae4:	9324      	ld.w      	r1, (r3, 0x10)
 ae6:	7444      	zextb      	r1, r1
 ae8:	a220      	st.b      	r1, (r2, 0x0)
			I2C_St_Adress=I2C_Data_Adress;
 aea:	8240      	ld.b      	r2, (r2, 0x0)
 aec:	7488      	zextb      	r2, r2
 aee:	122a      	lrw      	r1, 0x20000e04	// c14 <I2C_Slave_Receive+0x164>
 af0:	a140      	st.b      	r2, (r1, 0x0)
			{
				I2CRdBuffer[I2C_Data_Adress]= I2C0->DATA_CMD&0XFF;
			}
			I2C_Data_Adress++;
		}
		I2C0->ICR = I2C_RX_FULL;
 af2:	3204      	movi      	r2, 4
 af4:	b359      	st.w      	r2, (r3, 0x64)
		R_IIC_ERROR_CONT=0;
 af6:	3200      	movi      	r2, 0
 af8:	1268      	lrw      	r3, 0x20000e00	// c18 <I2C_Slave_Receive+0x168>
 afa:	b340      	st.w      	r2, (r3, 0x0)
	}
		
	if((I2C0->MISR&I2C_RD_REQ)==I2C_RD_REQ)			//读请求产生
 afc:	9460      	ld.w      	r3, (r4, 0x0)
 afe:	9356      	ld.w      	r2, (r3, 0x58)
 b00:	3120      	movi      	r1, 32
 b02:	6884      	and      	r2, r1
 b04:	3a40      	cmpnei      	r2, 0
 b06:	0c1d      	bf      	0xb40	// b40 <I2C_Slave_Receive+0x90>
	{
		if(RdIndex==1)
 b08:	1221      	lrw      	r1, 0x200000d0	// c0c <I2C_Slave_Receive+0x15c>
 b0a:	8141      	ld.b      	r2, (r1, 0x1)
 b0c:	3a41      	cmpnei      	r2, 1
 b0e:	0814      	bt      	0xb36	// b36 <I2C_Slave_Receive+0x86>
		{
			RdIndex=2;
 b10:	3202      	movi      	r2, 2
 b12:	a141      	st.b      	r2, (r1, 0x1)
			WrIndex = I2C_St_Adress;
 b14:	1240      	lrw      	r2, 0x20000e04	// c14 <I2C_Slave_Receive+0x164>
 b16:	8240      	ld.b      	r2, (r2, 0x0)
 b18:	7488      	zextb      	r2, r2
 b1a:	a142      	st.b      	r2, (r1, 0x2)
			//I2C_ConfigInterrupt_CMD(ENABLE,I2C_TX_EMPTY);
			if(WrIndex<BUFSIZE)
 b1c:	8142      	ld.b      	r2, (r1, 0x2)
 b1e:	7488      	zextb      	r2, r2
 b20:	3a1f      	cmphsi      	r2, 32
 b22:	080a      	bt      	0xb36	// b36 <I2C_Slave_Receive+0x86>
			{
				I2C0->DATA_CMD= (I2C0->DATA_CMD&0XFFFFFF00) |I2CWrBuffer[WrIndex];
 b24:	9344      	ld.w      	r2, (r3, 0x10)
 b26:	8122      	ld.b      	r1, (r1, 0x2)
 b28:	111d      	lrw      	r0, 0x20000e05	// c1c <I2C_Slave_Receive+0x16c>
 b2a:	6040      	addu      	r1, r0
 b2c:	30ff      	movi      	r0, 255
 b2e:	8120      	ld.b      	r1, (r1, 0x0)
 b30:	6881      	andn      	r2, r0
 b32:	6c84      	or      	r2, r1
 b34:	b344      	st.w      	r2, (r3, 0x10)
			}	
		}	
		I2C0->ICR = I2C_RD_REQ;
 b36:	3220      	movi      	r2, 32
 b38:	b359      	st.w      	r2, (r3, 0x64)
		R_IIC_ERROR_CONT=0;
 b3a:	3100      	movi      	r1, 0
 b3c:	1157      	lrw      	r2, 0x20000e00	// c18 <I2C_Slave_Receive+0x168>
 b3e:	b220      	st.w      	r1, (r2, 0x0)
	} 
                         
	if((I2C0->MISR&I2C_TX_EMPTY)==I2C_TX_EMPTY)				//IIC发送为空
 b40:	9356      	ld.w      	r2, (r3, 0x58)
 b42:	3110      	movi      	r1, 16
 b44:	6884      	and      	r2, r1
 b46:	3a40      	cmpnei      	r2, 0
 b48:	0c3d      	bf      	0xbc2	// bc2 <I2C_Slave_Receive+0x112>
	{
		if(RdIndex==2)
 b4a:	1151      	lrw      	r2, 0x200000d0	// c0c <I2C_Slave_Receive+0x15c>
 b4c:	8221      	ld.b      	r1, (r2, 0x1)
 b4e:	3942      	cmpnei      	r1, 2
 b50:	0825      	bt      	0xb9a	// b9a <I2C_Slave_Receive+0xea>
		{
			if(WrIndex+1<BUFSIZE)
 b52:	8222      	ld.b      	r1, (r2, 0x2)
 b54:	7444      	zextb      	r1, r1
 b56:	393e      	cmplti      	r1, 31
 b58:	0c0a      	bf      	0xb6c	// b6c <I2C_Slave_Receive+0xbc>
			{
				I2C0->DATA_CMD= (I2C0->DATA_CMD&0XFFFFFF00) |I2CWrBuffer[WrIndex+1];
 b5a:	9324      	ld.w      	r1, (r3, 0x10)
 b5c:	11b1      	lrw      	r5, 0x20000e06	// c20 <I2C_Slave_Receive+0x170>
 b5e:	8202      	ld.b      	r0, (r2, 0x2)
 b60:	6014      	addu      	r0, r5
 b62:	35ff      	movi      	r5, 255
 b64:	8000      	ld.b      	r0, (r0, 0x0)
 b66:	6855      	andn      	r1, r5
 b68:	6c40      	or      	r1, r0
 b6a:	b324      	st.w      	r1, (r3, 0x10)
			}
			WrIndex++;
 b6c:	8262      	ld.b      	r3, (r2, 0x2)
 b6e:	2300      	addi      	r3, 1
 b70:	74cc      	zextb      	r3, r3
 b72:	a262      	st.b      	r3, (r2, 0x2)
			else
			{
				R_IIC_ERROR_CONT++;
			}
		}
		I2C0->CR = I2C_TX_EMPTY;
 b74:	9460      	ld.w      	r3, (r4, 0x0)
 b76:	3210      	movi      	r2, 16
		I2C0->DATA_CMD= (I2C0->DATA_CMD&0XFFFFFF00);
		I2C_SLAVE_CONFIG(); 
		RdIndex=0;	
		//I2C_ConfigInterrupt_CMD(ENABLE,I2C_TX_EMPTY);				
		I2C0->ICR = I2C_SCL_SLOW|I2C_TX_ABRT;
		R_IIC_ERROR_CONT=0;
 b78:	b340      	st.w      	r2, (r3, 0x0)
	
}
}
 b7a:	1492      	pop      	r4-r5, r15
			if(I2C_Data_Adress<BUFSIZE)
 b7c:	8220      	ld.b      	r1, (r2, 0x0)
 b7e:	7444      	zextb      	r1, r1
 b80:	391f      	cmphsi      	r1, 32
 b82:	0807      	bt      	0xb90	// b90 <I2C_Slave_Receive+0xe0>
				I2CRdBuffer[I2C_Data_Adress]= I2C0->DATA_CMD&0XFF;
 b84:	8220      	ld.b      	r1, (r2, 0x0)
 b86:	11a8      	lrw      	r5, 0x20000e26	// c24 <I2C_Slave_Receive+0x174>
 b88:	6054      	addu      	r1, r5
 b8a:	9304      	ld.w      	r0, (r3, 0x10)
 b8c:	7400      	zextb      	r0, r0
 b8e:	a100      	st.b      	r0, (r1, 0x0)
			I2C_Data_Adress++;
 b90:	8220      	ld.b      	r1, (r2, 0x0)
 b92:	2100      	addi      	r1, 1
 b94:	7444      	zextb      	r1, r1
 b96:	a220      	st.b      	r1, (r2, 0x0)
 b98:	07ad      	br      	0xaf2	// af2 <I2C_Slave_Receive+0x42>
			if(R_IIC_ERROR_CONT>10000)
 b9a:	11a0      	lrw      	r5, 0x20000e00	// c18 <I2C_Slave_Receive+0x168>
 b9c:	1163      	lrw      	r3, 0x2710	// c28 <I2C_Slave_Receive+0x178>
 b9e:	9540      	ld.w      	r2, (r5, 0x0)
 ba0:	648c      	cmphs      	r3, r2
 ba2:	080d      	bt      	0xbbc	// bbc <I2C_Slave_Receive+0x10c>
				I2C_Disable();
 ba4:	e3ffff70 	bsr      	0xa84	// a84 <I2C_Disable>
				I2C0->DATA_CMD= (I2C0->DATA_CMD&0XFFFFFF00);
 ba8:	9440      	ld.w      	r2, (r4, 0x0)
 baa:	9264      	ld.w      	r3, (r2, 0x10)
 bac:	31ff      	movi      	r1, 255
 bae:	68c5      	andn      	r3, r1
 bb0:	b264      	st.w      	r3, (r2, 0x10)
				I2C_SLAVE_CONFIG();
 bb2:	e0000275 	bsr      	0x109c	// 109c <I2C_SLAVE_CONFIG>
				R_IIC_ERROR_CONT=0;
 bb6:	3300      	movi      	r3, 0
				R_IIC_ERROR_CONT++;
 bb8:	b560      	st.w      	r3, (r5, 0x0)
 bba:	07dd      	br      	0xb74	// b74 <I2C_Slave_Receive+0xc4>
 bbc:	9560      	ld.w      	r3, (r5, 0x0)
 bbe:	2300      	addi      	r3, 1
 bc0:	07fc      	br      	0xbb8	// bb8 <I2C_Slave_Receive+0x108>
	else if((I2C0->MISR&I2C_STOP_DET)==I2C_STOP_DET)
 bc2:	3280      	movi      	r2, 128
 bc4:	9336      	ld.w      	r1, (r3, 0x58)
 bc6:	4242      	lsli      	r2, r2, 2
 bc8:	6848      	and      	r1, r2
 bca:	3940      	cmpnei      	r1, 0
 bcc:	0fd7      	bf      	0xb7a	// b7a <I2C_Slave_Receive+0xca>
		I2C0->ICR =I2C_STOP_DET;
 bce:	b359      	st.w      	r2, (r3, 0x64)
		if(RdIndex!=0)
 bd0:	104f      	lrw      	r2, 0x200000d0	// c0c <I2C_Slave_Receive+0x15c>
 bd2:	8221      	ld.b      	r1, (r2, 0x1)
 bd4:	3940      	cmpnei      	r1, 0
 bd6:	0c03      	bf      	0xbdc	// bdc <I2C_Slave_Receive+0x12c>
			RdIndex=0;
 bd8:	3100      	movi      	r1, 0
 bda:	a221      	st.b      	r1, (r2, 0x1)
		R_READ_BUF=I2C0->DATA_CMD&0XFF;
 bdc:	9364      	ld.w      	r3, (r3, 0x10)
 bde:	74cc      	zextb      	r3, r3
 be0:	aa62      	st.h      	r3, (r2, 0x4)
		R_IIC_ERROR_CONT=0;
 be2:	3200      	movi      	r2, 0
 be4:	106d      	lrw      	r3, 0x20000e00	// c18 <I2C_Slave_Receive+0x168>
 be6:	07c9      	br      	0xb78	// b78 <I2C_Slave_Receive+0xc8>
		I2C_Disable();
 be8:	e3ffff4e 	bsr      	0xa84	// a84 <I2C_Disable>
		I2C0->DATA_CMD= (I2C0->DATA_CMD&0XFFFFFF00);
 bec:	9440      	ld.w      	r2, (r4, 0x0)
 bee:	9264      	ld.w      	r3, (r2, 0x10)
 bf0:	31ff      	movi      	r1, 255
 bf2:	68c5      	andn      	r3, r1
 bf4:	b264      	st.w      	r3, (r2, 0x10)
		I2C_SLAVE_CONFIG(); 
 bf6:	e0000253 	bsr      	0x109c	// 109c <I2C_SLAVE_CONFIG>
		RdIndex=0;	
 bfa:	1065      	lrw      	r3, 0x200000d0	// c0c <I2C_Slave_Receive+0x15c>
 bfc:	3200      	movi      	r2, 0
 bfe:	a341      	st.b      	r2, (r3, 0x1)
		I2C0->ICR = I2C_SCL_SLOW|I2C_TX_ABRT;
 c00:	9460      	ld.w      	r3, (r4, 0x0)
 c02:	104b      	lrw      	r2, 0x4040	// c2c <I2C_Slave_Receive+0x17c>
 c04:	b359      	st.w      	r2, (r3, 0x64)
 c06:	07ee      	br      	0xbe2	// be2 <I2C_Slave_Receive+0x132>
 c08:	20000030 	.long	0x20000030
 c0c:	200000d0 	.long	0x200000d0
 c10:	20000e25 	.long	0x20000e25
 c14:	20000e04 	.long	0x20000e04
 c18:	20000e00 	.long	0x20000e00
 c1c:	20000e05 	.long	0x20000e05
 c20:	20000e06 	.long	0x20000e06
 c24:	20000e26 	.long	0x20000e26
 c28:	00002710 	.long	0x00002710
 c2c:	00004040 	.long	0x00004040

Disassembly of section .text.SYSCON_General_CMD.part.0:

00000c30 <SYSCON_General_CMD.part.0>:
/*************************************************************/  
void SYSCON_General_CMD(FunctionalStatus NewState, SYSCON_General_CMD_TypeDef ENDIS_X )
{
	if (NewState != DISABLE)
	{
		if(ENDIS_X==ENDIS_EMOSC) 
 c30:	3848      	cmpnei      	r0, 8
 c32:	080a      	bt      	0xc46	// c46 <SYSCON_General_CMD.part.0+0x16>
		GPIOA0->CONLR=(GPIOA0->CONLR & 0XFFF00FFF)|0x00044000;					//使能对应PIN
 c34:	107a      	lrw      	r3, 0x2000004c	// c9c <SYSCON_General_CMD.part.0+0x6c>
 c36:	32ff      	movi      	r2, 255
 c38:	9320      	ld.w      	r1, (r3, 0x0)
 c3a:	9160      	ld.w      	r3, (r1, 0x0)
 c3c:	424c      	lsli      	r2, r2, 12
 c3e:	68c9      	andn      	r3, r2
 c40:	3bae      	bseti      	r3, 14
 c42:	3bb2      	bseti      	r3, 18
 c44:	b160      	st.w      	r3, (r1, 0x0)
		SYSCON->GCER|=ENDIS_X;													//enable SYSCON General Control
 c46:	1077      	lrw      	r3, 0x2000005c	// ca0 <SYSCON_General_CMD.part.0+0x70>
 c48:	9360      	ld.w      	r3, (r3, 0x0)
 c4a:	9341      	ld.w      	r2, (r3, 0x4)
 c4c:	6c80      	or      	r2, r0
 c4e:	b341      	st.w      	r2, (r3, 0x4)
		while(!(SYSCON->GCSR&ENDIS_X));											//check  Enable?	
 c50:	9343      	ld.w      	r2, (r3, 0xc)
 c52:	6880      	and      	r2, r0
 c54:	3a40      	cmpnei      	r2, 0
 c56:	0ffd      	bf      	0xc50	// c50 <SYSCON_General_CMD.part.0+0x20>
		switch(ENDIS_X)
 c58:	3842      	cmpnei      	r0, 2
 c5a:	0807      	bt      	0xc68	// c68 <SYSCON_General_CMD.part.0+0x38>
		{
			case ENDIS_IMOSC:
				while (!(SYSCON->CKST & ENDIS_IMOSC)); 	
 c5c:	3102      	movi      	r1, 2
 c5e:	9344      	ld.w      	r2, (r3, 0x10)
 c60:	6884      	and      	r2, r1
 c62:	3a40      	cmpnei      	r2, 0
 c64:	0ffd      	bf      	0xc5e	// c5e <SYSCON_General_CMD.part.0+0x2e>
	{
		SYSCON->GCDR|=ENDIS_X;													//disable SYSCON General Control
		while(SYSCON->GCSR&ENDIS_X);											//check  Disable?
		SYSCON->ICR|=ENDIS_X;													// Clear ENDIS_X stable bit
	}
}
 c66:	783c      	jmp      	r15
		switch(ENDIS_X)
 c68:	3802      	cmphsi      	r0, 3
 c6a:	0809      	bt      	0xc7c	// c7c <SYSCON_General_CMD.part.0+0x4c>
 c6c:	3841      	cmpnei      	r0, 1
 c6e:	0bfc      	bt      	0xc66	// c66 <SYSCON_General_CMD.part.0+0x36>
				while (!(SYSCON->CKST & ENDIS_ISOSC)); 
 c70:	3101      	movi      	r1, 1
 c72:	9344      	ld.w      	r2, (r3, 0x10)
 c74:	6884      	and      	r2, r1
 c76:	3a40      	cmpnei      	r2, 0
 c78:	0ffd      	bf      	0xc72	// c72 <SYSCON_General_CMD.part.0+0x42>
 c7a:	07f6      	br      	0xc66	// c66 <SYSCON_General_CMD.part.0+0x36>
		switch(ENDIS_X)
 c7c:	3848      	cmpnei      	r0, 8
 c7e:	0807      	bt      	0xc8c	// c8c <SYSCON_General_CMD.part.0+0x5c>
				while (!(SYSCON->CKST & ENDIS_EMOSC)); 
 c80:	3108      	movi      	r1, 8
 c82:	9344      	ld.w      	r2, (r3, 0x10)
 c84:	6884      	and      	r2, r1
 c86:	3a40      	cmpnei      	r2, 0
 c88:	0ffd      	bf      	0xc82	// c82 <SYSCON_General_CMD.part.0+0x52>
 c8a:	07ee      	br      	0xc66	// c66 <SYSCON_General_CMD.part.0+0x36>
		switch(ENDIS_X)
 c8c:	3850      	cmpnei      	r0, 16
 c8e:	0bec      	bt      	0xc66	// c66 <SYSCON_General_CMD.part.0+0x36>
				while (!(SYSCON->CKST & ENDIS_HFOSC)); 
 c90:	3110      	movi      	r1, 16
 c92:	9344      	ld.w      	r2, (r3, 0x10)
 c94:	6884      	and      	r2, r1
 c96:	3a40      	cmpnei      	r2, 0
 c98:	0ffd      	bf      	0xc92	// c92 <SYSCON_General_CMD.part.0+0x62>
 c9a:	07e6      	br      	0xc66	// c66 <SYSCON_General_CMD.part.0+0x36>
 c9c:	2000004c 	.long	0x2000004c
 ca0:	2000005c 	.long	0x2000005c

Disassembly of section .text.SYSCON_RST_VALUE:

00000ca4 <SYSCON_RST_VALUE>:
	SYSCON->RAMCHK=SYSCON_RAMCHK_RST;
 ca4:	106f      	lrw      	r3, 0x2000005c	// ce0 <SYSCON_RST_VALUE+0x3c>
 ca6:	1050      	lrw      	r2, 0xffff	// ce4 <SYSCON_RST_VALUE+0x40>
 ca8:	9360      	ld.w      	r3, (r3, 0x0)
 caa:	b345      	st.w      	r2, (r3, 0x14)
	SYSCON->EFLCHK=SYSCON_EFLCHK_RST;
 cac:	104f      	lrw      	r2, 0xffffff	// ce8 <SYSCON_RST_VALUE+0x44>
 cae:	b346      	st.w      	r2, (r3, 0x18)
	SYSCON->SCLKCR=SYSCON_SCLKCR_RST;
 cb0:	104f      	lrw      	r2, 0xd22d0000	// cec <SYSCON_RST_VALUE+0x48>
 cb2:	b347      	st.w      	r2, (r3, 0x1c)
	SYSCON->OSTR=SYSCON_OSTR_RST;
 cb4:	104f      	lrw      	r2, 0x70ff3bff	// cf0 <SYSCON_RST_VALUE+0x4c>
 cb6:	b350      	st.w      	r2, (r3, 0x40)
	SYSCON->EXIRT=SYSCON_EXIRT_RST;
 cb8:	3180      	movi      	r1, 128
	SYSCON->LVDCR=SYSCON_LVDCR_RST;
 cba:	320a      	movi      	r2, 10
 cbc:	b353      	st.w      	r2, (r3, 0x4c)
	SYSCON->EXIRT=SYSCON_EXIRT_RST;
 cbe:	604c      	addu      	r1, r3
 cc0:	3200      	movi      	r2, 0
	SYSCON->IWDCR=SYSCON_IWDCR_RST;
 cc2:	100d      	lrw      	r0, 0x70c	// cf4 <SYSCON_RST_VALUE+0x50>
	SYSCON->EXIRT=SYSCON_EXIRT_RST;
 cc4:	b145      	st.w      	r2, (r1, 0x14)
	SYSCON->UREG0=SYSCON_UREG0_RST;
 cc6:	23ff      	addi      	r3, 256
	SYSCON->EXIFT=SYSCON_EXIFT_RST;
 cc8:	b146      	st.w      	r2, (r1, 0x18)
	SYSCON->IWDCR=SYSCON_IWDCR_RST;
 cca:	b10d      	st.w      	r0, (r1, 0x34)
	SYSCON->IWDCNT=SYSCON_IWDCNT_RST;
 ccc:	100b      	lrw      	r0, 0x3fe	// cf8 <SYSCON_RST_VALUE+0x54>
 cce:	b10e      	st.w      	r0, (r1, 0x38)
	SYSCON->EVTRG=SYSCON_EVTRG_RST;
 cd0:	b15d      	st.w      	r2, (r1, 0x74)
	SYSCON->EVPS=SYSCON_EVPS_RST;
 cd2:	b15e      	st.w      	r2, (r1, 0x78)
	SYSCON->EVSWF=SYSCON_EVSWF_RST;
 cd4:	b15f      	st.w      	r2, (r1, 0x7c)
	SYSCON->UREG0=SYSCON_UREG0_RST;
 cd6:	b340      	st.w      	r2, (r3, 0x0)
	SYSCON->UREG1=SYSCON_UREG1_RST;
 cd8:	b341      	st.w      	r2, (r3, 0x4)
	SYSCON->UREG2=SYSCON_UREG2_RST;
 cda:	b342      	st.w      	r2, (r3, 0x8)
	SYSCON->UREG3=SYSCON_UREG3_RST;
 cdc:	b343      	st.w      	r2, (r3, 0xc)
}
 cde:	783c      	jmp      	r15
 ce0:	2000005c 	.long	0x2000005c
 ce4:	0000ffff 	.long	0x0000ffff
 ce8:	00ffffff 	.long	0x00ffffff
 cec:	d22d0000 	.long	0xd22d0000
 cf0:	70ff3bff 	.long	0x70ff3bff
 cf4:	0000070c 	.long	0x0000070c
 cf8:	000003fe 	.long	0x000003fe

Disassembly of section .text.SYSCON_General_CMD:

00000cfc <SYSCON_General_CMD>:
{
 cfc:	14d0      	push      	r15
	if (NewState != DISABLE)
 cfe:	3840      	cmpnei      	r0, 0
 d00:	0c05      	bf      	0xd0a	// d0a <SYSCON_General_CMD+0xe>
 d02:	6c07      	mov      	r0, r1
 d04:	e3ffff96 	bsr      	0xc30	// c30 <SYSCON_General_CMD.part.0>
}
 d08:	1490      	pop      	r15
		SYSCON->GCDR|=ENDIS_X;													//disable SYSCON General Control
 d0a:	1068      	lrw      	r3, 0x2000005c	// d28 <SYSCON_General_CMD+0x2c>
 d0c:	9360      	ld.w      	r3, (r3, 0x0)
 d0e:	9342      	ld.w      	r2, (r3, 0x8)
 d10:	6c84      	or      	r2, r1
 d12:	b342      	st.w      	r2, (r3, 0x8)
		while(SYSCON->GCSR&ENDIS_X);											//check  Disable?
 d14:	9343      	ld.w      	r2, (r3, 0xc)
 d16:	6884      	and      	r2, r1
 d18:	3a40      	cmpnei      	r2, 0
 d1a:	0bfd      	bt      	0xd14	// d14 <SYSCON_General_CMD+0x18>
		SYSCON->ICR|=ENDIS_X;													// Clear ENDIS_X stable bit
 d1c:	237f      	addi      	r3, 128
 d1e:	9301      	ld.w      	r0, (r3, 0x4)
 d20:	6c40      	or      	r1, r0
 d22:	b321      	st.w      	r1, (r3, 0x4)
}
 d24:	07f2      	br      	0xd08	// d08 <SYSCON_General_CMD+0xc>
 d26:	0000      	bkpt
 d28:	2000005c 	.long	0x2000005c

Disassembly of section .text.SystemCLK_HCLKDIV_PCLKDIV_Config:

00000d2c <SystemCLK_HCLKDIV_PCLKDIV_Config>:
//SystemClk_data_x:EMOSC_24M,EMOSC_16M,EMOSC_12M,EMOSC_8M,EMOSC_4M,EMOSC_36K,
//ISOSC,IMOSC,HFOSC_48M,HFOSC_24M,HFOSC_12M,HFOSC_6M
//ReturnValue:NONE
/*************************************************************/ 
void SystemCLK_HCLKDIV_PCLKDIV_Config(SystemCLK_TypeDef SYSCLK_X , SystemCLK_Div_TypeDef HCLK_DIV_X , PCLK_Div_TypeDef PCLK_DIV_X , SystemClk_data_TypeDef SystemClk_data_x )
{
 d2c:	14c2      	push      	r4-r5
	if(SystemClk_data_x==HFOSC_48M)
 d2e:	3b48      	cmpnei      	r3, 8
 d30:	0825      	bt      	0xd7a	// d7a <SystemCLK_HCLKDIV_PCLKDIV_Config+0x4e>
	{
		IFC->CEDR=0X01;						//CLKEN
 d32:	1098      	lrw      	r4, 0x20000060	// d90 <SystemCLK_HCLKDIV_PCLKDIV_Config+0x64>
 d34:	3501      	movi      	r5, 1
 d36:	9480      	ld.w      	r4, (r4, 0x0)
 d38:	b4a1      	st.w      	r5, (r4, 0x4)
		IFC->MR=0X04|(0X00<<16);			//高速模式
 d3a:	3504      	movi      	r5, 4
	}
	if((SystemClk_data_x==EMOSC_24M)||(SystemClk_data_x==EMOSC_16M)||(SystemClk_data_x==HFOSC_24M))
	{
		IFC->CEDR=0X01;						//CLKEN
		IFC->MR=0X02|(0X00<<16);			//中速模式
 d3c:	b4a5      	st.w      	r5, (r4, 0x14)
	}
	if((SystemClk_data_x==EMOSC_12M)||(SystemClk_data_x==EMOSC_8M)||(SystemClk_data_x==EMOSC_4M)||(SystemClk_data_x==EMOSC_36K)
		||(SystemClk_data_x==IMOSC)||(SystemClk_data_x==ISOSC)||(SystemClk_data_x==HFOSC_12M)||(SystemClk_data_x==HFOSC_6M))
 d3e:	5b87      	subi      	r4, r3, 2
	if((SystemClk_data_x==EMOSC_12M)||(SystemClk_data_x==EMOSC_8M)||(SystemClk_data_x==EMOSC_4M)||(SystemClk_data_x==EMOSC_36K)
 d40:	3c05      	cmphsi      	r4, 6
 d42:	0c04      	bf      	0xd4a	// d4a <SystemCLK_HCLKDIV_PCLKDIV_Config+0x1e>
		||(SystemClk_data_x==IMOSC)||(SystemClk_data_x==ISOSC)||(SystemClk_data_x==HFOSC_12M)||(SystemClk_data_x==HFOSC_6M))
 d44:	2b09      	subi      	r3, 10
 d46:	3b01      	cmphsi      	r3, 2
 d48:	0806      	bt      	0xd54	// d54 <SystemCLK_HCLKDIV_PCLKDIV_Config+0x28>
	{
		IFC->CEDR=0X01;						//CLKEN
 d4a:	1072      	lrw      	r3, 0x20000060	// d90 <SystemCLK_HCLKDIV_PCLKDIV_Config+0x64>
 d4c:	3401      	movi      	r4, 1
 d4e:	9360      	ld.w      	r3, (r3, 0x0)
 d50:	b381      	st.w      	r4, (r3, 0x4)
		IFC->MR=0X01|(0X00<<16);			//低速
 d52:	b385      	st.w      	r4, (r3, 0x14)
	}
	SYSCON->SCLKCR=SYSCLK_KEY | HCLK_DIV_X| SYSCLK_X;
 d54:	1090      	lrw      	r4, 0xd22d0000	// d94 <SystemCLK_HCLKDIV_PCLKDIV_Config+0x68>
 d56:	6c10      	or      	r0, r4
 d58:	1070      	lrw      	r3, 0x2000005c	// d98 <SystemCLK_HCLKDIV_PCLKDIV_Config+0x6c>
 d5a:	6c40      	or      	r1, r0
 d5c:	9360      	ld.w      	r3, (r3, 0x0)
	while (!(SYSCON->CKST & (1<<8))); 											// waiting for sysclk stable
 d5e:	3080      	movi      	r0, 128
	SYSCON->SCLKCR=SYSCLK_KEY | HCLK_DIV_X| SYSCLK_X;
 d60:	b327      	st.w      	r1, (r3, 0x1c)
	while (!(SYSCON->CKST & (1<<8))); 											// waiting for sysclk stable
 d62:	4001      	lsli      	r0, r0, 1
 d64:	9324      	ld.w      	r1, (r3, 0x10)
 d66:	6840      	and      	r1, r0
 d68:	3940      	cmpnei      	r1, 0
 d6a:	0ffd      	bf      	0xd64	// d64 <SystemCLK_HCLKDIV_PCLKDIV_Config+0x38>
	SYSCON->PCLKCR=PCLK_KEY|PCLK_DIV_X;											//PCLK DIV 1 2 4 6 8 16		
 d6c:	102c      	lrw      	r1, 0xc33c0000	// d9c <SystemCLK_HCLKDIV_PCLKDIV_Config+0x70>
 d6e:	6c48      	or      	r1, r2
 d70:	b328      	st.w      	r1, (r3, 0x20)
	while(SYSCON->PCLKCR!=PCLK_DIV_X);											//Wait PCLK DIV
 d72:	9328      	ld.w      	r1, (r3, 0x20)
 d74:	644a      	cmpne      	r2, r1
 d76:	0bfe      	bt      	0xd72	// d72 <SystemCLK_HCLKDIV_PCLKDIV_Config+0x46>
}
 d78:	1482      	pop      	r4-r5
	if((SystemClk_data_x==EMOSC_24M)||(SystemClk_data_x==EMOSC_16M)||(SystemClk_data_x==HFOSC_24M))
 d7a:	3b01      	cmphsi      	r3, 2
 d7c:	0c03      	bf      	0xd82	// d82 <SystemCLK_HCLKDIV_PCLKDIV_Config+0x56>
 d7e:	3b49      	cmpnei      	r3, 9
 d80:	0bdf      	bt      	0xd3e	// d3e <SystemCLK_HCLKDIV_PCLKDIV_Config+0x12>
		IFC->CEDR=0X01;						//CLKEN
 d82:	1084      	lrw      	r4, 0x20000060	// d90 <SystemCLK_HCLKDIV_PCLKDIV_Config+0x64>
 d84:	3501      	movi      	r5, 1
 d86:	9480      	ld.w      	r4, (r4, 0x0)
 d88:	b4a1      	st.w      	r5, (r4, 0x4)
		IFC->MR=0X02|(0X00<<16);			//中速模式
 d8a:	3502      	movi      	r5, 2
 d8c:	07d8      	br      	0xd3c	// d3c <SystemCLK_HCLKDIV_PCLKDIV_Config+0x10>
 d8e:	0000      	bkpt
 d90:	20000060 	.long	0x20000060
 d94:	d22d0000 	.long	0xd22d0000
 d98:	2000005c 	.long	0x2000005c
 d9c:	c33c0000 	.long	0xc33c0000

Disassembly of section .text.SYSCON_HFOSC_SELECTE:

00000da0 <SYSCON_HFOSC_SELECTE>:
//EntryParameter:HFOSC_SELECTE_X
//HFOSC_SELECTE_X:HFOSC_SELECTE_48M,HFOSC_SELECTE_24M;HFOSC_SELECTE_12M;HFOSC_SELECTE_6M
//ReturnValue:NONE
/*************************************************************/  
void SYSCON_HFOSC_SELECTE(HFOSC_SELECTE_TypeDef HFOSC_SELECTE_X)
{		
 da0:	14d1      	push      	r4, r15
 da2:	6d03      	mov      	r4, r0
	SYSCON_General_CMD(DISABLE,ENDIS_HFOSC);					//disable HFOSC
 da4:	3110      	movi      	r1, 16
 da6:	3000      	movi      	r0, 0
 da8:	e3ffffaa 	bsr      	0xcfc	// cfc <SYSCON_General_CMD>
	SYSCON->OPT1 = (SYSCON->OPT1 & 0XFFFFFFCF)|HFOSC_SELECTE_X;
 dac:	1066      	lrw      	r3, 0x2000005c	// dc4 <SYSCON_HFOSC_SELECTE+0x24>
 dae:	9360      	ld.w      	r3, (r3, 0x0)
 db0:	9319      	ld.w      	r0, (r3, 0x64)
 db2:	3884      	bclri      	r0, 4
 db4:	3885      	bclri      	r0, 5
 db6:	6c10      	or      	r0, r4
 db8:	b319      	st.w      	r0, (r3, 0x64)
 dba:	3010      	movi      	r0, 16
 dbc:	e3ffff3a 	bsr      	0xc30	// c30 <SYSCON_General_CMD.part.0>
	SYSCON_General_CMD(ENABLE,ENDIS_HFOSC);						//enable HFOSC
}
 dc0:	1491      	pop      	r4, r15
 dc2:	0000      	bkpt
 dc4:	2000005c 	.long	0x2000005c

Disassembly of section .text.SYSCON_WDT_CMD:

00000dc8 <SYSCON_WDT_CMD>:
//EntryParameter:,NewState
//NewState:ENABLE,DISABLE
//ReturnValue:NONE
/*************************************************************/
void SYSCON_WDT_CMD(FunctionalStatus NewState)
{
 dc8:	106c      	lrw      	r3, 0x2000005c	// df8 <SYSCON_WDT_CMD+0x30>
	if(NewState != DISABLE)
 dca:	3840      	cmpnei      	r0, 0
	{
		SYSCON->IWDEDR=IWDTEDR_KEY|Enable_IWDT;
 dcc:	9360      	ld.w      	r3, (r3, 0x0)
 dce:	237f      	addi      	r3, 128
	if(NewState != DISABLE)
 dd0:	0c0a      	bf      	0xde4	// de4 <SYSCON_WDT_CMD+0x1c>
		SYSCON->IWDEDR=IWDTEDR_KEY|Enable_IWDT;
 dd2:	104b      	lrw      	r2, 0x78870000	// dfc <SYSCON_WDT_CMD+0x34>
		while(!(SYSCON->IWDCR&Check_IWDT_BUSY));
 dd4:	3180      	movi      	r1, 128
		SYSCON->IWDEDR=IWDTEDR_KEY|Enable_IWDT;
 dd6:	b34f      	st.w      	r2, (r3, 0x3c)
		while(!(SYSCON->IWDCR&Check_IWDT_BUSY));
 dd8:	4125      	lsli      	r1, r1, 5
 dda:	934d      	ld.w      	r2, (r3, 0x34)
 ddc:	6884      	and      	r2, r1
 dde:	3a40      	cmpnei      	r2, 0
 de0:	0ffd      	bf      	0xdda	// dda <SYSCON_WDT_CMD+0x12>
	else
	{
		SYSCON->IWDEDR=IWDTEDR_KEY|Disable_IWDT;
		while(SYSCON->IWDCR&Check_IWDT_BUSY);
	}
}
 de2:	783c      	jmp      	r15
		SYSCON->IWDEDR=IWDTEDR_KEY|Disable_IWDT;
 de4:	1047      	lrw      	r2, 0x788755aa	// e00 <SYSCON_WDT_CMD+0x38>
		while(SYSCON->IWDCR&Check_IWDT_BUSY);
 de6:	3180      	movi      	r1, 128
		SYSCON->IWDEDR=IWDTEDR_KEY|Disable_IWDT;
 de8:	b34f      	st.w      	r2, (r3, 0x3c)
		while(SYSCON->IWDCR&Check_IWDT_BUSY);
 dea:	4125      	lsli      	r1, r1, 5
 dec:	934d      	ld.w      	r2, (r3, 0x34)
 dee:	6884      	and      	r2, r1
 df0:	3a40      	cmpnei      	r2, 0
 df2:	0bfd      	bt      	0xdec	// dec <SYSCON_WDT_CMD+0x24>
 df4:	07f7      	br      	0xde2	// de2 <SYSCON_WDT_CMD+0x1a>
 df6:	0000      	bkpt
 df8:	2000005c 	.long	0x2000005c
 dfc:	78870000 	.long	0x78870000
 e00:	788755aa 	.long	0x788755aa

Disassembly of section .text.SYSCON_IWDCNT_Reload:

00000e04 <SYSCON_IWDCNT_Reload>:
//EntryParameter:NONE
//ReturnValue: NONE
/*************************************************************/
void SYSCON_IWDCNT_Reload(void)
{
	SYSCON->IWDCNT=CLR_IWDT;
 e04:	1064      	lrw      	r3, 0x2000005c	// e14 <SYSCON_IWDCNT_Reload+0x10>
 e06:	32b4      	movi      	r2, 180
 e08:	9360      	ld.w      	r3, (r3, 0x0)
 e0a:	237f      	addi      	r3, 128
 e0c:	4257      	lsli      	r2, r2, 23
 e0e:	b34e      	st.w      	r2, (r3, 0x38)
}
 e10:	783c      	jmp      	r15
 e12:	0000      	bkpt
 e14:	2000005c 	.long	0x2000005c

Disassembly of section .text.SYSCON_IWDCNT_Config:

00000e18 <SYSCON_IWDCNT_Config>:
//IWDT_INTW_DIV_X:IWDT_INTW_DIV_1/2/3/4/4/5/6
//ReturnValue: NONE
/*************************************************************/
void SYSCON_IWDCNT_Config(IWDT_TIME_TypeDef IWDT_TIME_X , IWDT_TIMEDIV_TypeDef IWDT_INTW_DIV_X )
{
	SYSCON->IWDCR=IWDT_KEY|IWDT_TIME_X|IWDT_INTW_DIV_X;
 e18:	1044      	lrw      	r2, 0x87780000	// e28 <SYSCON_IWDCNT_Config+0x10>
 e1a:	1065      	lrw      	r3, 0x2000005c	// e2c <SYSCON_IWDCNT_Config+0x14>
 e1c:	6c48      	or      	r1, r2
 e1e:	9360      	ld.w      	r3, (r3, 0x0)
 e20:	6c04      	or      	r0, r1
 e22:	237f      	addi      	r3, 128
 e24:	b30d      	st.w      	r0, (r3, 0x34)
}
 e26:	783c      	jmp      	r15
 e28:	87780000 	.long	0x87780000
 e2c:	2000005c 	.long	0x2000005c

Disassembly of section .text.SYSCON_LVD_Config:

00000e30 <SYSCON_LVD_Config>:
//X_LVD_INT:ENABLE_LVD_INT,DISABLE_LVD_INT
//INTDET_POL_X:INTDET_POL_fall,INTDET_POL_X_rise,INTDET_POL_X_riseORfall
//ReturnValue: NONE
/*************************************************************/
void SYSCON_LVD_Config(X_LVDEN_TypeDef X_LVDEN , INTDET_LVL_X_TypeDef INTDET_LVL_X , RSTDET_LVL_X_TypeDef RSTDET_LVL_X , X_LVD_INT_TypeDef X_LVD_INT , INTDET_POL_X_TypeDef INTDET_POL_X)
{
 e30:	14c3      	push      	r4-r6
 e32:	9883      	ld.w      	r4, (r14, 0xc)
	//SYSCON->LVDCR=LVD_KEY;
	SYSCON->LVDCR=LVD_KEY|X_LVDEN|INTDET_LVL_X|RSTDET_LVL_X|X_LVD_INT|INTDET_POL_X;
 e34:	10c5      	lrw      	r6, 0xb44b0000	// e48 <SYSCON_LVD_Config+0x18>
 e36:	6d18      	or      	r4, r6
 e38:	6cd0      	or      	r3, r4
 e3a:	6c8c      	or      	r2, r3
 e3c:	6c48      	or      	r1, r2
 e3e:	10a4      	lrw      	r5, 0x2000005c	// e4c <SYSCON_LVD_Config+0x1c>
 e40:	6c04      	or      	r0, r1
 e42:	95a0      	ld.w      	r5, (r5, 0x0)
 e44:	b513      	st.w      	r0, (r5, 0x4c)
}
 e46:	1483      	pop      	r4-r6
 e48:	b44b0000 	.long	0xb44b0000
 e4c:	2000005c 	.long	0x2000005c

Disassembly of section .text.EXTI_trigger_CMD:

00000e50 <EXTI_trigger_CMD>:
//EXI_tringer_mode:_EXIRT,_EXIFT
//ReturnValue: LVD detection flag
/*************************************************************/
void EXTI_trigger_CMD(FunctionalStatus NewState , SYSCON_EXIPIN_TypeDef  EXIPIN , EXI_tringer_mode_TypeDef EXI_tringer_mode)
{
	switch(EXI_tringer_mode)
 e50:	3a40      	cmpnei      	r2, 0
 e52:	0c04      	bf      	0xe5a	// e5a <EXTI_trigger_CMD+0xa>
 e54:	3a41      	cmpnei      	r2, 1
 e56:	0c0e      	bf      	0xe72	// e72 <EXTI_trigger_CMD+0x22>
		{
			SYSCON->EXIFT &=~EXIPIN;	
		}
		break;
	}	
}
 e58:	783c      	jmp      	r15
 e5a:	106d      	lrw      	r3, 0x2000005c	// e8c <EXTI_trigger_CMD+0x3c>
		if(NewState != DISABLE)
 e5c:	3840      	cmpnei      	r0, 0
			SYSCON->EXIRT |=EXIPIN;
 e5e:	9360      	ld.w      	r3, (r3, 0x0)
 e60:	237f      	addi      	r3, 128
 e62:	9345      	ld.w      	r2, (r3, 0x14)
		if(NewState != DISABLE)
 e64:	0c04      	bf      	0xe6c	// e6c <EXTI_trigger_CMD+0x1c>
			SYSCON->EXIRT |=EXIPIN;
 e66:	6c48      	or      	r1, r2
 e68:	b325      	st.w      	r1, (r3, 0x14)
 e6a:	07f7      	br      	0xe58	// e58 <EXTI_trigger_CMD+0x8>
			SYSCON->EXIRT &=~EXIPIN;	
 e6c:	6885      	andn      	r2, r1
 e6e:	b345      	st.w      	r2, (r3, 0x14)
 e70:	07f4      	br      	0xe58	// e58 <EXTI_trigger_CMD+0x8>
 e72:	1067      	lrw      	r3, 0x2000005c	// e8c <EXTI_trigger_CMD+0x3c>
		if(NewState != DISABLE)
 e74:	3840      	cmpnei      	r0, 0
			SYSCON->EXIFT |=EXIPIN;
 e76:	9360      	ld.w      	r3, (r3, 0x0)
 e78:	237f      	addi      	r3, 128
 e7a:	9346      	ld.w      	r2, (r3, 0x18)
		if(NewState != DISABLE)
 e7c:	0c04      	bf      	0xe84	// e84 <EXTI_trigger_CMD+0x34>
			SYSCON->EXIFT |=EXIPIN;
 e7e:	6c48      	or      	r1, r2
 e80:	b326      	st.w      	r1, (r3, 0x18)
 e82:	07eb      	br      	0xe58	// e58 <EXTI_trigger_CMD+0x8>
			SYSCON->EXIFT &=~EXIPIN;	
 e84:	6885      	andn      	r2, r1
 e86:	b346      	st.w      	r2, (r3, 0x18)
}
 e88:	07e8      	br      	0xe58	// e58 <EXTI_trigger_CMD+0x8>
 e8a:	0000      	bkpt
 e8c:	2000005c 	.long	0x2000005c

Disassembly of section .text.SYSCON_INT_Priority:

00000e90 <SYSCON_INT_Priority>:
//DUMMY    IRQ30
//DUMMY    IRQ31
/*************************************************************/
void SYSCON_INT_Priority(void)
{
	INTC_IPR0_WRITE(0X40404040);   //IQR0-3
 e90:	1066      	lrw      	r3, 0xe000e400	// ea8 <SYSCON_INT_Priority+0x18>
 e92:	1047      	lrw      	r2, 0x40404040	// eac <SYSCON_INT_Priority+0x1c>
 e94:	b340      	st.w      	r2, (r3, 0x0)
	INTC_IPR1_WRITE(0X40404040);   //IQR4-7  
 e96:	b341      	st.w      	r2, (r3, 0x4)
	INTC_IPR2_WRITE(0X40404040);   //IQR8-11  
 e98:	b342      	st.w      	r2, (r3, 0x8)
	INTC_IPR3_WRITE(0X40404040);   //IQR12-15  
 e9a:	b343      	st.w      	r2, (r3, 0xc)
	INTC_IPR4_WRITE(0X40404040);   //IQR16-19  
 e9c:	b344      	st.w      	r2, (r3, 0x10)
	INTC_IPR5_WRITE(0X40404040);   //IQR20-23 
 e9e:	b345      	st.w      	r2, (r3, 0x14)
	INTC_IPR6_WRITE(0X40404040);   //IQR24-27  
 ea0:	b346      	st.w      	r2, (r3, 0x18)
	INTC_IPR7_WRITE(0X40404040);   //IQR28-31
 ea2:	b347      	st.w      	r2, (r3, 0x1c)
}
 ea4:	783c      	jmp      	r15
 ea6:	0000      	bkpt
 ea8:	e000e400 	.long	0xe000e400
 eac:	40404040 	.long	0x40404040

Disassembly of section .text.UART1_DeInit:

00000eb0 <UART1_DeInit>:
    UART0->ISR  = UART_RESET_VALUE;
    UART0->BRDIV =UART_RESET_VALUE;
}
void UART1_DeInit(void)
{
    UART1->DATA = UART_RESET_VALUE;
 eb0:	1065      	lrw      	r3, 0x2000003c	// ec4 <UART1_DeInit+0x14>
 eb2:	3200      	movi      	r2, 0
 eb4:	9360      	ld.w      	r3, (r3, 0x0)
 eb6:	b340      	st.w      	r2, (r3, 0x0)
    UART1->SR   = UART_RESET_VALUE;
 eb8:	b341      	st.w      	r2, (r3, 0x4)
    UART1->CTRL = UART_RESET_VALUE;
 eba:	b342      	st.w      	r2, (r3, 0x8)
    UART1->ISR  = UART_RESET_VALUE;
 ebc:	b343      	st.w      	r2, (r3, 0xc)
    UART1->BRDIV =UART_RESET_VALUE;
 ebe:	b344      	st.w      	r2, (r3, 0x10)
}
 ec0:	783c      	jmp      	r15
 ec2:	0000      	bkpt
 ec4:	2000003c 	.long	0x2000003c

Disassembly of section .text.UART_IO_Init:

00000ec8 <UART_IO_Init>:
//UART_IO_G:0 1
//ReturnValue:NONE
/*************************************************************/
void UART_IO_Init(UART_NUM_TypeDef IO_UART_NUM , U8_T UART_IO_G)
{
    if (IO_UART_NUM==IO_UART0)
 ec8:	3840      	cmpnei      	r0, 0
 eca:	0821      	bt      	0xf0c	// f0c <UART_IO_Init+0x44>
    {
		if(UART_IO_G==0)
 ecc:	3940      	cmpnei      	r1, 0
 ece:	080a      	bt      	0xee2	// ee2 <UART_IO_Init+0x1a>
		{
			GPIOA0->CONLR = (GPIOA0->CONLR&0XFFFFFF00)  | 0x00000044;       //PA0.1->RXD0, PA0.0->TXD0
 ed0:	1177      	lrw      	r3, 0x2000004c	// fac <UART_IO_Init+0xe4>
 ed2:	31ff      	movi      	r1, 255
 ed4:	9340      	ld.w      	r2, (r3, 0x0)
 ed6:	9260      	ld.w      	r3, (r2, 0x0)
 ed8:	68c5      	andn      	r3, r1
 eda:	3ba2      	bseti      	r3, 2
 edc:	3ba6      	bseti      	r3, 6
    }
	 if (IO_UART_NUM==IO_UART2)
    {
        if(UART_IO_G==0)
		{
			GPIOA0->CONLR = (GPIOA0->CONLR&0XFFFFFF00)  | 0x00000077;       //PA0.0->RXD2, PA0.1->TXD2
 ede:	b260      	st.w      	r3, (r2, 0x0)
 ee0:	0415      	br      	0xf0a	// f0a <UART_IO_Init+0x42>
		else if(UART_IO_G==1)
 ee2:	3941      	cmpnei      	r1, 1
 ee4:	0813      	bt      	0xf0a	// f0a <UART_IO_Init+0x42>
			GPIOA0->CONLR = (GPIOA0->CONLR&0XFF0FFFFF)  | 0x00700000;      //PA0.5->RXD0, PA0.12->TXD0
 ee6:	1172      	lrw      	r3, 0x2000004c	// fac <UART_IO_Init+0xe4>
 ee8:	31f0      	movi      	r1, 240
 eea:	9340      	ld.w      	r2, (r3, 0x0)
 eec:	9260      	ld.w      	r3, (r2, 0x0)
 eee:	4130      	lsli      	r1, r1, 16
 ef0:	68c5      	andn      	r3, r1
 ef2:	31e0      	movi      	r1, 224
 ef4:	412f      	lsli      	r1, r1, 15
 ef6:	6cc4      	or      	r3, r1
 ef8:	b260      	st.w      	r3, (r2, 0x0)
			GPIOA0->CONHR = (GPIOA0->CONHR&0XFFF0FFFF)  | 0x00070000;      
 efa:	31f0      	movi      	r1, 240
 efc:	9261      	ld.w      	r3, (r2, 0x4)
 efe:	412c      	lsli      	r1, r1, 12
 f00:	68c5      	andn      	r3, r1
 f02:	31e0      	movi      	r1, 224
 f04:	412b      	lsli      	r1, r1, 11
 f06:	6cc4      	or      	r3, r1
 f08:	b261      	st.w      	r3, (r2, 0x4)
		else if(UART_IO_G==2)
		{
			GPIOB0->CONLR = (GPIOB0->CONLR&0XFF00FFFF) | 0X00660000;        //PB0.5->RXD2, PB0.4->TXD2
		}
    }
}
 f0a:	783c      	jmp      	r15
     if (IO_UART_NUM==IO_UART1)
 f0c:	3841      	cmpnei      	r0, 1
 f0e:	082d      	bt      	0xf68	// f68 <UART_IO_Init+0xa0>
        if(UART_IO_G==0)
 f10:	3940      	cmpnei      	r1, 0
 f12:	0814      	bt      	0xf3a	// f3a <UART_IO_Init+0x72>
			GPIOB0->CONLR = (GPIOB0->CONLR&0XFFFFFFF0)  | 0x00000007;       //PA0.13->RXD1, PB0.0->TXD1
 f14:	1167      	lrw      	r3, 0x20000048	// fb0 <UART_IO_Init+0xe8>
 f16:	310f      	movi      	r1, 15
 f18:	9340      	ld.w      	r2, (r3, 0x0)
 f1a:	9260      	ld.w      	r3, (r2, 0x0)
 f1c:	68c5      	andn      	r3, r1
 f1e:	3107      	movi      	r1, 7
 f20:	6cc4      	or      	r3, r1
 f22:	b260      	st.w      	r3, (r2, 0x0)
			GPIOA0->CONHR = (GPIOA0->CONHR&0XFF0FFFFF)  | 0x00700000;       
 f24:	32f0      	movi      	r2, 240
 f26:	1162      	lrw      	r3, 0x2000004c	// fac <UART_IO_Init+0xe4>
 f28:	4250      	lsli      	r2, r2, 16
 f2a:	9320      	ld.w      	r1, (r3, 0x0)
 f2c:	9161      	ld.w      	r3, (r1, 0x4)
 f2e:	68c9      	andn      	r3, r2
 f30:	32e0      	movi      	r2, 224
 f32:	424f      	lsli      	r2, r2, 15
			GPIOA0->CONHR = (GPIOA0->CONHR&0X00FFFFFF) | 0X77000000;        //PA0.15->RXD1, PA0.14->TXD1
 f34:	6cc8      	or      	r3, r2
 f36:	b161      	st.w      	r3, (r1, 0x4)
 f38:	07e9      	br      	0xf0a	// f0a <UART_IO_Init+0x42>
		else if(UART_IO_G==1)
 f3a:	3941      	cmpnei      	r1, 1
 f3c:	080c      	bt      	0xf54	// f54 <UART_IO_Init+0x8c>
			GPIOA0->CONLR = (GPIOA0->CONLR&0XFFF00FFF) | 0X00077000;        //PA0.4->RXD1, PA0.3->TXD1
 f3e:	107c      	lrw      	r3, 0x2000004c	// fac <UART_IO_Init+0xe4>
 f40:	32ff      	movi      	r2, 255
 f42:	9320      	ld.w      	r1, (r3, 0x0)
 f44:	424c      	lsli      	r2, r2, 12
 f46:	9160      	ld.w      	r3, (r1, 0x0)
 f48:	68c9      	andn      	r3, r2
 f4a:	32ee      	movi      	r2, 238
 f4c:	424b      	lsli      	r2, r2, 11
			GPIOB0->CONLR = (GPIOB0->CONLR&0XFF00FFFF) | 0X00660000;        //PB0.5->RXD2, PB0.4->TXD2
 f4e:	6cc8      	or      	r3, r2
 f50:	b160      	st.w      	r3, (r1, 0x0)
}
 f52:	07dc      	br      	0xf0a	// f0a <UART_IO_Init+0x42>
		else if(UART_IO_G==2)
 f54:	3942      	cmpnei      	r1, 2
 f56:	0bda      	bt      	0xf0a	// f0a <UART_IO_Init+0x42>
			GPIOA0->CONHR = (GPIOA0->CONHR&0X00FFFFFF) | 0X77000000;        //PA0.15->RXD1, PA0.14->TXD1
 f58:	1075      	lrw      	r3, 0x2000004c	// fac <UART_IO_Init+0xe4>
 f5a:	32ee      	movi      	r2, 238
 f5c:	9320      	ld.w      	r1, (r3, 0x0)
 f5e:	9161      	ld.w      	r3, (r1, 0x4)
 f60:	4368      	lsli      	r3, r3, 8
 f62:	4b68      	lsri      	r3, r3, 8
 f64:	4257      	lsli      	r2, r2, 23
 f66:	07e7      	br      	0xf34	// f34 <UART_IO_Init+0x6c>
	 if (IO_UART_NUM==IO_UART2)
 f68:	3842      	cmpnei      	r0, 2
 f6a:	0bd0      	bt      	0xf0a	// f0a <UART_IO_Init+0x42>
        if(UART_IO_G==0)
 f6c:	3940      	cmpnei      	r1, 0
 f6e:	0809      	bt      	0xf80	// f80 <UART_IO_Init+0xb8>
			GPIOA0->CONLR = (GPIOA0->CONLR&0XFFFFFF00)  | 0x00000077;       //PA0.0->RXD2, PA0.1->TXD2
 f70:	106f      	lrw      	r3, 0x2000004c	// fac <UART_IO_Init+0xe4>
 f72:	31ff      	movi      	r1, 255
 f74:	9340      	ld.w      	r2, (r3, 0x0)
 f76:	9260      	ld.w      	r3, (r2, 0x0)
 f78:	68c5      	andn      	r3, r1
 f7a:	3177      	movi      	r1, 119
 f7c:	6cc4      	or      	r3, r1
 f7e:	07b0      	br      	0xede	// ede <UART_IO_Init+0x16>
		else if(UART_IO_G==1)
 f80:	3941      	cmpnei      	r1, 1
 f82:	0809      	bt      	0xf94	// f94 <UART_IO_Init+0xcc>
			GPIOA0->CONLR = (GPIOA0->CONLR&0X00FFFFFF) | 0X77000000;        //PA0.7->RXD2, PA0.6->TXD2
 f84:	106a      	lrw      	r3, 0x2000004c	// fac <UART_IO_Init+0xe4>
 f86:	32ee      	movi      	r2, 238
 f88:	9320      	ld.w      	r1, (r3, 0x0)
 f8a:	9160      	ld.w      	r3, (r1, 0x0)
 f8c:	4368      	lsli      	r3, r3, 8
 f8e:	4b68      	lsri      	r3, r3, 8
 f90:	4257      	lsli      	r2, r2, 23
 f92:	07de      	br      	0xf4e	// f4e <UART_IO_Init+0x86>
		else if(UART_IO_G==2)
 f94:	3942      	cmpnei      	r1, 2
 f96:	0bba      	bt      	0xf0a	// f0a <UART_IO_Init+0x42>
			GPIOB0->CONLR = (GPIOB0->CONLR&0XFF00FFFF) | 0X00660000;        //PB0.5->RXD2, PB0.4->TXD2
 f98:	1066      	lrw      	r3, 0x20000048	// fb0 <UART_IO_Init+0xe8>
 f9a:	32ff      	movi      	r2, 255
 f9c:	9320      	ld.w      	r1, (r3, 0x0)
 f9e:	4250      	lsli      	r2, r2, 16
 fa0:	9160      	ld.w      	r3, (r1, 0x0)
 fa2:	68c9      	andn      	r3, r2
 fa4:	32cc      	movi      	r2, 204
 fa6:	424f      	lsli      	r2, r2, 15
 fa8:	07d3      	br      	0xf4e	// f4e <UART_IO_Init+0x86>
 faa:	0000      	bkpt
 fac:	2000004c 	.long	0x2000004c
 fb0:	20000048 	.long	0x20000048

Disassembly of section .text.UARTInitRxTxIntEn:

00000fb4 <UARTInitRxTxIntEn>:
//ReturnValue:NONE
/*************************************************************/
void UARTInitRxTxIntEn(CSP_UART_T *uart,U16_T baudrate_u16,UART_PAR_TypeDef PAR_DAT)
{
   // Set Transmitter Enable
   CSP_UART_SET_CTRL(uart, UART_TX | UART_RX | UART_RX_INT | UART_TX_INT);
 fb4:	330f      	movi      	r3, 15
 fb6:	b062      	st.w      	r3, (r0, 0x8)
   // Set Baudrate
   CSP_UART_SET_BRDIV(uart, baudrate_u16);
 fb8:	b024      	st.w      	r1, (r0, 0x10)

   uart->CTRL|=PAR_DAT|(0X01<<31);
 fba:	9062      	ld.w      	r3, (r0, 0x8)
 fbc:	3abf      	bseti      	r2, 31
 fbe:	6c8c      	or      	r2, r3
 fc0:	b042      	st.w      	r2, (r0, 0x8)
}
 fc2:	783c      	jmp      	r15

Disassembly of section .text.UARTTxByte:

00000fc4 <UARTTxByte>:
/*************************************************************/
void UARTTxByte(CSP_UART_T *uart,U8_T txdata_u8)
{
	unsigned int  DataI;
	// Write the transmit buffer
	CSP_UART_SET_DATA(uart,txdata_u8);
 fc4:	b020      	st.w      	r1, (r0, 0x0)
	do
	{
		DataI = CSP_UART_GET_SR(uart);
		DataI = DataI & UART_TX_FULL;
 fc6:	3201      	movi      	r2, 1
		DataI = CSP_UART_GET_SR(uart);
 fc8:	9061      	ld.w      	r3, (r0, 0x4)
		DataI = DataI & UART_TX_FULL;
 fca:	68c8      	and      	r3, r2
	}
	while(DataI == UART_TX_FULL);    //Loop  when tx is full
 fcc:	3b40      	cmpnei      	r3, 0
 fce:	0bfd      	bt      	0xfc8	// fc8 <UARTTxByte+0x4>
	while ( (CSP_UART_GET_ISR(uart) & UART_TX_INT_S) != UART_TX_INT_S ) {}

	// Clear status bit for the next transmit
	CSP_UART_SET_ISR(uart, UART_TX_INT_S);*/

}
 fd0:	783c      	jmp      	r15

Disassembly of section .text.WWDT_CNT_Load:

00000fd4 <WWDT_CNT_Load>:
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/ 
void WWDT_CNT_Load(U8_T cnt_data)
{
	WWDT->CR  |= cnt_data;						//SET
 fd4:	1063      	lrw      	r3, 0x20000010	// fe0 <WWDT_CNT_Load+0xc>
 fd6:	9360      	ld.w      	r3, (r3, 0x0)
 fd8:	9340      	ld.w      	r2, (r3, 0x0)
 fda:	6c08      	or      	r0, r2
 fdc:	b300      	st.w      	r0, (r3, 0x0)
}
 fde:	783c      	jmp      	r15
 fe0:	20000010 	.long	0x20000010

Disassembly of section .text.delay_nms:

00000fe4 <delay_nms>:
//software delay
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/	
void delay_nms(unsigned int t)
{
     fe4:	14d0      	push      	r15
     fe6:	1423      	subi      	r14, r14, 12
    volatile unsigned int i,j ,k=0;
    j = 50* t;
     fe8:	3232      	movi      	r2, 50
    volatile unsigned int i,j ,k=0;
     fea:	3300      	movi      	r3, 0
    j = 50* t;
     fec:	7c08      	mult      	r0, r2
    volatile unsigned int i,j ,k=0;
     fee:	b862      	st.w      	r3, (r14, 0x8)
    j = 50* t;
     ff0:	b801      	st.w      	r0, (r14, 0x4)
    for ( i = 0; i < j; i++ )
     ff2:	b860      	st.w      	r3, (r14, 0x0)
     ff4:	9840      	ld.w      	r2, (r14, 0x0)
     ff6:	9861      	ld.w      	r3, (r14, 0x4)
     ff8:	64c8      	cmphs      	r2, r3
     ffa:	0c03      	bf      	0x1000	// 1000 <delay_nms+0x1c>
    {
        k++;
		SYSCON_IWDCNT_Reload(); 
    }
}
     ffc:	1403      	addi      	r14, r14, 12
     ffe:	1490      	pop      	r15
        k++;
    1000:	9862      	ld.w      	r3, (r14, 0x8)
    1002:	2300      	addi      	r3, 1
    1004:	b862      	st.w      	r3, (r14, 0x8)
		SYSCON_IWDCNT_Reload(); 
    1006:	e3fffeff 	bsr      	0xe04	// e04 <SYSCON_IWDCNT_Reload>
    for ( i = 0; i < j; i++ )
    100a:	9860      	ld.w      	r3, (r14, 0x0)
    100c:	2300      	addi      	r3, 1
    100e:	07f2      	br      	0xff2	// ff2 <delay_nms+0xe>

Disassembly of section .text.GPIO_CONFIG:

00001010 <GPIO_CONFIG>:
//GPIO Initial
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/	
void GPIO_CONFIG(void)
{
    1010:	14d1      	push      	r4, r15
	GPIO_Init(GPIOA0,4,0);
    1012:	1088      	lrw      	r4, 0x2000004c	// 1030 <GPIO_CONFIG+0x20>
    1014:	3200      	movi      	r2, 0
    1016:	9400      	ld.w      	r0, (r4, 0x0)
    1018:	3104      	movi      	r1, 4
    101a:	e3fffbd9 	bsr      	0x7cc	// 7cc <GPIO_Init>
	GPIO_Write_High(GPIOA0,4);				
    101e:	9400      	ld.w      	r0, (r4, 0x0)
    1020:	3104      	movi      	r1, 4
    1022:	e3fffc45 	bsr      	0x8ac	// 8ac <GPIO_Write_High>
	GPIO_Write_Low(GPIOA0,4);				
    1026:	9400      	ld.w      	r0, (r4, 0x0)
    1028:	3104      	movi      	r1, 4
    102a:	e3fffc45 	bsr      	0x8b4	// 8b4 <GPIO_Write_Low>
    //EXI0_WakeUp_Enable();										//EXI0 interrupt wake up enable
	//EXI1_WakeUp_Enable();										//EXI1 interrupt wake up enable
	//EXI2_WakeUp_Enable();										//EXI2~EXI3 interrupt wake up enable
	//EXI3_WakeUp_Enable();										//EXI4~EXI8 interrupt wake up enable
	//EXI4_WakeUp_Enable();										//EXI9~EXI13 interrupt wake up enable
}
    102e:	1491      	pop      	r4, r15
    1030:	2000004c 	.long	0x2000004c

Disassembly of section .text.BT_CONFIG:

00001034 <BT_CONFIG>:
//BT Initial
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/	
void BT_CONFIG(void)
{
    1034:	14d2      	push      	r4-r5, r15
    1036:	1424      	subi      	r14, r14, 16
	BT_DeInit(BT0);
    1038:	1097      	lrw      	r4, 0x2000000c	// 1094 <BT_CONFIG+0x60>
	BT_IO_Init(BT0_PB02);
	BT_Configure(BT0,BTCLK_EN,0,BT_IMMEDIATE,BT_CONTINUOUS,BT_PCLKDIV);//TCLK=PCLK/(0+1)
    103a:	3500      	movi      	r5, 0
	BT_DeInit(BT0);
    103c:	9400      	ld.w      	r0, (r4, 0x0)
    103e:	e3fffad9 	bsr      	0x5f0	// 5f0 <BT_DeInit>
	BT_IO_Init(BT0_PB02);
    1042:	3003      	movi      	r0, 3
    1044:	e3fffae4 	bsr      	0x60c	// 60c <BT_IO_Init>
	BT_Configure(BT0,BTCLK_EN,0,BT_IMMEDIATE,BT_CONTINUOUS,BT_PCLKDIV);//TCLK=PCLK/(0+1)
    1048:	9400      	ld.w      	r0, (r4, 0x0)
    104a:	b8a1      	st.w      	r5, (r14, 0x4)
    104c:	b8a0      	st.w      	r5, (r14, 0x0)
    104e:	3308      	movi      	r3, 8
    1050:	3200      	movi      	r2, 0
    1052:	3101      	movi      	r1, 1
    1054:	e3fffb86 	bsr      	0x760	// 760 <BT_Configure>
	BT_ControlSet_Configure(BT0,BT_START_HIGH,BT_IDLE_LOW,BT_SYNC_DIS,BT_SYNCMD_DIS,BT_OSTMDX_ONCE,BT_AREARM_DIS,BT_CNTRLD_EN);
    1058:	3380      	movi      	r3, 128
    105a:	4363      	lsli      	r3, r3, 3
    105c:	b861      	st.w      	r3, (r14, 0x4)
    105e:	9400      	ld.w      	r0, (r4, 0x0)
    1060:	3300      	movi      	r3, 0
    1062:	b8a3      	st.w      	r5, (r14, 0xc)
    1064:	b8a2      	st.w      	r5, (r14, 0x8)
    1066:	b8a0      	st.w      	r5, (r14, 0x0)
    1068:	3200      	movi      	r2, 0
    106a:	3180      	movi      	r1, 128
    106c:	e3fffb86 	bsr      	0x778	// 778 <BT_ControlSet_Configure>
	//BT_ControlSet_Configure(BT0,BT_START_HIGH,BT_IDLE_LOW,BT_SYNC_EN,BT_SYNCMD_DIS,BT_OSTMDX_ONCE,BT_AREARM_DIS,BT_CNTRLD_EN);
	//BT_Trigger_Configure(BT0,BT_TRGSRC_PEND,BT_TRGOE_EN);
	BT_Period_CMP_Write(BT0,10000,500);
    1070:	32fa      	movi      	r2, 250
    1072:	4241      	lsli      	r2, r2, 1
    1074:	1029      	lrw      	r1, 0x2710	// 1098 <BT_CONFIG+0x64>
    1076:	9400      	ld.w      	r0, (r4, 0x0)
    1078:	e3fffb96 	bsr      	0x7a4	// 7a4 <BT_Period_CMP_Write>
	BT_Start(BT0);
    107c:	9400      	ld.w      	r0, (r4, 0x0)
    107e:	e3fffb6d 	bsr      	0x758	// 758 <BT_Start>
	BT_ConfigInterrupt_CMD(BT0,ENABLE,BT_PEND);
    1082:	9400      	ld.w      	r0, (r4, 0x0)
    1084:	3201      	movi      	r2, 1
    1086:	3101      	movi      	r1, 1
    1088:	e3fffb91 	bsr      	0x7aa	// 7aa <BT_ConfigInterrupt_CMD>
	BT0_INT_ENABLE();
    108c:	e3fffb98 	bsr      	0x7bc	// 7bc <BT0_INT_ENABLE>
	BT_Trigger_Configure(BT1,BT_TRGSRC_PEND,BT_TRGOE_EN);
	BT_Period_CMP_Write(BT1,1000,500);
	BT_Start(BT1);
	BT_ConfigInterrupt_CMD(BT1,BT_PEND,ENABLE);
	BT1_INT_ENABLE();*/
}
    1090:	1404      	addi      	r14, r14, 16
    1092:	1492      	pop      	r4-r5, r15
    1094:	2000000c 	.long	0x2000000c
    1098:	00002710 	.long	0x00002710

Disassembly of section .text.I2C_SLAVE_CONFIG:

0000109c <I2C_SLAVE_CONFIG>:
//IIC SLAVER Initial
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/	
void I2C_SLAVE_CONFIG(void)
{
    109c:	14d0      	push      	r15
    109e:	1423      	subi      	r14, r14, 12
	I2C_DeInit();
    10a0:	e3fffc1a 	bsr      	0x8d4	// 8d4 <I2C_DeInit>
	I2C_Slave_CONFIG(I2C_SDA_PA07,I2C_SCL_PA01,FAST_MODE,I2C_SLAVE_7BIT,0X57,0X50,0X50);//从机地址不能设置为0x00~0x07,0x78~0x7f
    10a4:	3350      	movi      	r3, 80
    10a6:	b862      	st.w      	r3, (r14, 0x8)
    10a8:	b861      	st.w      	r3, (r14, 0x4)
    10aa:	3357      	movi      	r3, 87
    10ac:	b860      	st.w      	r3, (r14, 0x0)
    10ae:	3204      	movi      	r2, 4
    10b0:	3300      	movi      	r3, 0
    10b2:	3102      	movi      	r1, 2
    10b4:	3002      	movi      	r0, 2
    10b6:	e3fffc1b 	bsr      	0x8ec	// 8ec <I2C_Slave_CONFIG>
	I2C_SDA_TSETUP_THOLD_CONFIG(0x40,0x40,0x40);
    10ba:	3240      	movi      	r2, 64
    10bc:	3140      	movi      	r1, 64
    10be:	3040      	movi      	r0, 64
    10c0:	e3fffcb4 	bsr      	0xa28	// a28 <I2C_SDA_TSETUP_THOLD_CONFIG>
	I2C_FIFO_TriggerData(0,0);															//发送FIFO设置为7
    10c4:	3100      	movi      	r1, 0
    10c6:	3000      	movi      	r0, 0
    10c8:	e3fffcc8 	bsr      	0xa58	// a58 <I2C_FIFO_TriggerData>
	I2C_ConfigInterrupt_CMD(ENABLE,I2C_SCL_SLOW);
    10cc:	3180      	movi      	r1, 128
    10ce:	4127      	lsli      	r1, r1, 7
    10d0:	3001      	movi      	r0, 1
    10d2:	e3fffcb5 	bsr      	0xa3c	// a3c <I2C_ConfigInterrupt_CMD>
	I2C_ConfigInterrupt_CMD(ENABLE,I2C_STOP_DET);
    10d6:	3180      	movi      	r1, 128
    10d8:	4122      	lsli      	r1, r1, 2
    10da:	3001      	movi      	r0, 1
    10dc:	e3fffcb0 	bsr      	0xa3c	// a3c <I2C_ConfigInterrupt_CMD>
	I2C_ConfigInterrupt_CMD(ENABLE,I2C_RD_REQ);
    10e0:	3120      	movi      	r1, 32
    10e2:	3001      	movi      	r0, 1
    10e4:	e3fffcac 	bsr      	0xa3c	// a3c <I2C_ConfigInterrupt_CMD>
	I2C_ConfigInterrupt_CMD(ENABLE,I2C_RX_FULL);
    10e8:	3104      	movi      	r1, 4
    10ea:	3001      	movi      	r0, 1
    10ec:	e3fffca8 	bsr      	0xa3c	// a3c <I2C_ConfigInterrupt_CMD>
	I2C_ConfigInterrupt_CMD(ENABLE,I2C_TX_ABRT);
    10f0:	3140      	movi      	r1, 64
    10f2:	3001      	movi      	r0, 1
    10f4:	e3fffca4 	bsr      	0xa3c	// a3c <I2C_ConfigInterrupt_CMD>
	I2C_Enable();
    10f8:	e3fffcb8 	bsr      	0xa68	// a68 <I2C_Enable>
	I2C_Int_Enable();
    10fc:	e3fffcd2 	bsr      	0xaa0	// aa0 <I2C_Int_Enable>
	
}
    1100:	1403      	addi      	r14, r14, 12
    1102:	1490      	pop      	r15

Disassembly of section .text.UART1_CONFIG:

00001104 <UART1_CONFIG>:
//UART1  CONFIG
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/	
void UART1_CONFIG(void)
{
    1104:	14d0      	push      	r15
	UART1_DeInit();                                                 //clear all UART Register
    1106:	e3fffed5 	bsr      	0xeb0	// eb0 <UART1_DeInit>
    UART_IO_Init(IO_UART1,2);                                    	//use PA0.13->RXD1, PB0.0->TXD1
    110a:	3102      	movi      	r1, 2
    110c:	3001      	movi      	r0, 1
    110e:	e3fffedd 	bsr      	0xec8	// ec8 <UART_IO_Init>
    UARTInitRxTxIntEn(UART1,208,UART_PAR_NONE);	                    //baudrate=sysclock/46=115200
    1112:	1064      	lrw      	r3, 0x2000003c	// 1120 <UART1_CONFIG+0x1c>
    1114:	3200      	movi      	r2, 0
    1116:	9300      	ld.w      	r0, (r3, 0x0)
    1118:	31d0      	movi      	r1, 208
    111a:	e3ffff4d 	bsr      	0xfb4	// fb4 <UARTInitRxTxIntEn>
	//UART1_Int_Enable();
}	
    111e:	1490      	pop      	r15
    1120:	2000003c 	.long	0x2000003c

Disassembly of section .text.SYSCON_CONFIG:

00001124 <SYSCON_CONFIG>:
//syscon Functions
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void SYSCON_CONFIG(void)
{
    1124:	14d0      	push      	r15
    1126:	1421      	subi      	r14, r14, 4
//------SYSTEM CLK AND PCLK FUNTION---------------------------/
	SYSCON_RST_VALUE();                                                         //SYSCON all register clr
    1128:	e3fffdbe 	bsr      	0xca4	// ca4 <SYSCON_RST_VALUE>
	SYSCON_General_CMD(ENABLE,ENDIS_ISOSC);
    112c:	3101      	movi      	r1, 1
    112e:	3001      	movi      	r0, 1
    1130:	e3fffde6 	bsr      	0xcfc	// cfc <SYSCON_General_CMD>
	//EMOSC_OSTR_Config(0XAD,0X1f,EM_LFSEL_EN,EM_FLEN_EN,EM_FLSEL_10ns);			//EM_CNT=0X3FF,0xAD(36K),EM_GM=0,Low F modedisable,EM filter disable,if enable,cont set 5ns
	//SYSCON_General_CMD(ENABLE,ENDIS_EMOSC);
	SYSCON_HFOSC_SELECTE(HFOSC_SELECTE_24M);									//HFOSC selected 48MHz
    1134:	3010      	movi      	r0, 16
    1136:	e3fffe35 	bsr      	0xda0	// da0 <SYSCON_HFOSC_SELECTE>
	SystemCLK_HCLKDIV_PCLKDIV_Config(SYSCLK_HFOSC,HCLK_DIV_1,PCLK_DIV_1,HFOSC_24M);//system clock set, Hclk div ,Pclk div  set system clock=SystemCLK/Hclk div/Pclk div
    113a:	3180      	movi      	r1, 128
    113c:	3309      	movi      	r3, 9
    113e:	3200      	movi      	r2, 0
    1140:	4121      	lsli      	r1, r1, 1
    1142:	3002      	movi      	r0, 2
    1144:	e3fffdf4 	bsr      	0xd2c	// d2c <SystemCLK_HCLKDIV_PCLKDIV_Config>
//------------  WDT FUNTION  --------------------------------/
    SYSCON_IWDCNT_Config(IWDT_TIME_2S,IWDT_INTW_DIV_7);      					//WDT TIME 1s,WDT alarm interrupt time=1s-1s*1/8=0.875S
    1148:	3080      	movi      	r0, 128
    114a:	3118      	movi      	r1, 24
    114c:	4003      	lsli      	r0, r0, 3
    114e:	e3fffe65 	bsr      	0xe18	// e18 <SYSCON_IWDCNT_Config>
    SYSCON_WDT_CMD(DISABLE);                                                  	//enable WDT		
    1152:	3000      	movi      	r0, 0
    1154:	e3fffe3a 	bsr      	0xdc8	// dc8 <SYSCON_WDT_CMD>
    SYSCON_IWDCNT_Reload();                                                   	//reload WDT
    1158:	e3fffe56 	bsr      	0xe04	// e04 <SYSCON_IWDCNT_Reload>
	//WWDT_CMD(ENABLE);
//------------  CLO  --------------------------------/	
	//SYSCON_CLO_CONFIG(CLO_PA02);
	//SYSCON->OPT1=(SYSCON->OPT1&0XFFFF8000)|(0X05<<12)|(0X04<<8)|(0x00<<4);			//48M HFCLK  16div
//------------  LVD FUNTION  --------------------------------/ 
    SYSCON_LVD_Config(DISABLE_LVDEN,INTDET_LVL_3_3V,RSTDET_LVL_1_9V,DISABLE_LVD_INT,INTDET_POL_fall);   //LVD LVR Enable/Disable
    115c:	3340      	movi      	r3, 64
    115e:	3180      	movi      	r1, 128
    1160:	b860      	st.w      	r3, (r14, 0x0)
    1162:	3200      	movi      	r2, 0
    1164:	3300      	movi      	r3, 0
    1166:	4123      	lsli      	r1, r1, 3
    1168:	300a      	movi      	r0, 10
    116a:	e3fffe63 	bsr      	0xe30	// e30 <SYSCON_LVD_Config>
    //LVD_Int_Enable();
//------------------------------------------------------------/
//OSC CLOCK Calibration
//------------------------------------------------------------/	
	std_clk_calib(CLK_HFOSC_24M);												//Select the same clock source as the system
    116e:	3001      	movi      	r0, 1
    1170:	e0000b06 	bsr      	0x277c	// 277c <std_clk_calib>
//------------  SYSCON Vector  --------------------------------/ 	
	//SYSCON_Int_Enable();    														//SYSCON VECTOR
	//SYSCON_WakeUp_Enable();    													//Enable WDT wakeup INT
}
    1174:	1401      	addi      	r14, r14, 4
    1176:	1490      	pop      	r15

Disassembly of section .text.APT32S1028_init:

00001178 <APT32S1028_init>:
//ReturnValue:NONE                                                                /
/*********************************************************************************/
/*********************************************************************************/  
/*********************************************************************************/
void APT32S1028_init(void) 
{
    1178:	14d0      	push      	r15
//------------------------------------------------------------/
//Peripheral clock enable and disable
//EntryParameter:NONE
//ReturnValue:NONE
//------------------------------------------------------------/
    SYSCON->PCER0=0xFFFFFFF;                                        //PCLK Enable  0x00410071
    117a:	106c      	lrw      	r3, 0x2000005c	// 11a8 <APT32S1028_init+0x30>
    SYSCON->PCER1=0xFFFFFFF;                                        //PCLK Enable
    while(!(SYSCON->PCSR0&0x1));                                    //Wait PCLK enabled	
    117c:	3101      	movi      	r1, 1
    SYSCON->PCER0=0xFFFFFFF;                                        //PCLK Enable  0x00410071
    117e:	9340      	ld.w      	r2, (r3, 0x0)
    1180:	106b      	lrw      	r3, 0xfffffff	// 11ac <APT32S1028_init+0x34>
    1182:	b26a      	st.w      	r3, (r2, 0x28)
    SYSCON->PCER1=0xFFFFFFF;                                        //PCLK Enable
    1184:	b26d      	st.w      	r3, (r2, 0x34)
    while(!(SYSCON->PCSR0&0x1));                                    //Wait PCLK enabled	
    1186:	926c      	ld.w      	r3, (r2, 0x30)
    1188:	68c4      	and      	r3, r1
    118a:	3b40      	cmpnei      	r3, 0
    118c:	0ffd      	bf      	0x1186	// 1186 <APT32S1028_init+0xe>
//------------------------------------------------------------/
//ISOSC/IMOSC/EMOSC/SYSCLK/IWDT/LVD/EM_CMFAIL/EM_CMRCV/CMD_ERR OSC stable interrupt
//EntryParameter:NONE
//ReturnValue:NONE
//------------------------------------------------------------/
    SYSCON_CONFIG();                                                 //syscon  initial
    118e:	e3ffffcb 	bsr      	0x1124	// 1124 <SYSCON_CONFIG>
	CK_CPU_EnAllNormalIrq();                                         //enable all IRQ
    1192:	e000056b 	bsr      	0x1c68	// 1c68 <CK_CPU_EnAllNormalIrq>
//------------------------------------------------------------/
//Other IP config
//------------------------------------------------------------/
	GPIO_CONFIG();                                                //GPIO initial   
    1196:	e3ffff3d 	bsr      	0x1010	// 1010 <GPIO_CONFIG>
	//CORET_CONFIG();												//CORET initial
	//EPT0_CONFIG();                                                //EPT0 initial 
	//GPT0_CONFIG();												//GPT0 initial
	//LPT_CONFIG();													//LPT initial	
	BT_CONFIG();													//BT initial
    119a:	e3ffff4d 	bsr      	0x1034	// 1034 <BT_CONFIG>
	//I2C_SLAVE_CONFIG();                                           //I2C harware slave initial 
	//SPI_MASTER_CONFIG();											//SPI Master initial 	
	//SPI_SLAVE_CONFIG();											//SPI Slaver initial 
	//SIO_CONFIG();													//SIO initial
    //UART0_CONFIG();                                               //UART0 initial 
	UART1_CONFIG();                                               //UART1 initial 
    119e:	e3ffffb3 	bsr      	0x1104	// 1104 <UART1_CONFIG>
	//UART2_CONFIG();                                               //UART2 initial 
	//ADC12_CONFIG();                                               //ADC initial 
	//IFC_CONFIG();
	SYSCON_INT_Priority();
    11a2:	e3fffe77 	bsr      	0xe90	// e90 <SYSCON_INT_Priority>
}
    11a6:	1490      	pop      	r15
    11a8:	2000005c 	.long	0x2000005c
    11ac:	0fffffff 	.long	0x0fffffff

Disassembly of section .text.CORETHandler:

000011b0 <CORETHandler>:
//CORET Interrupt
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void CORETHandler(void) 
{
    11b0:	1460      	nie
    11b2:	1462      	ipush
    // ISR content ...
//	xPortSysTickHandler();
	
	CK801->CORET_CVR = 0x0;							// Clear counter and flag
    11b4:	1064      	lrw      	r3, 0x20000064	// 11c4 <CORETHandler+0x14>
    11b6:	3200      	movi      	r2, 0
    11b8:	9360      	ld.w      	r3, (r3, 0x0)
    11ba:	b346      	st.w      	r2, (r3, 0x18)
	nop;
    11bc:	6c03      	mov      	r0, r0
}
    11be:	1463      	ipop
    11c0:	1461      	nir
    11c2:	0000      	bkpt
    11c4:	20000064 	.long	0x20000064

Disassembly of section .text.SYSCONIntHandler:

000011c8 <SYSCONIntHandler>:
//SYSCON Interrupt
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void SYSCONIntHandler(void) 
{
    11c8:	1460      	nie
    11ca:	1462      	ipush
    // ISR content ...
	if((SYSCON->MISR&ISOSC_ST)==ISOSC_ST)
    11cc:	1177      	lrw      	r3, 0x2000005c	// 12a8 <SYSCONIntHandler+0xe0>
    11ce:	3280      	movi      	r2, 128
    11d0:	9360      	ld.w      	r3, (r3, 0x0)
    11d2:	60c8      	addu      	r3, r2
    11d4:	9323      	ld.w      	r1, (r3, 0xc)
    11d6:	3001      	movi      	r0, 1
    11d8:	6840      	and      	r1, r0
    11da:	3940      	cmpnei      	r1, 0
    11dc:	0c04      	bf      	0x11e4	// 11e4 <SYSCONIntHandler+0x1c>
	{
		SYSCON->ICR = EMOSC_ST;
	} 
	else if((SYSCON->MISR&HFOSC_ST)==HFOSC_ST)
	{
		SYSCON->ICR = HFOSC_ST;
    11de:	b301      	st.w      	r0, (r3, 0x4)
	}
	else if((SYSCON->MISR&CMD_ERR_ST)==CMD_ERR_ST)
	{
		SYSCON->ICR = CMD_ERR_ST;
	}
}
    11e0:	1463      	ipop
    11e2:	1461      	nir
	else if((SYSCON->MISR&IMOSC_ST)==IMOSC_ST)
    11e4:	9323      	ld.w      	r1, (r3, 0xc)
    11e6:	3002      	movi      	r0, 2
    11e8:	6840      	and      	r1, r0
    11ea:	3940      	cmpnei      	r1, 0
    11ec:	0bf9      	bt      	0x11de	// 11de <SYSCONIntHandler+0x16>
	else if((SYSCON->MISR&EMOSC_ST)==EMOSC_ST)
    11ee:	9323      	ld.w      	r1, (r3, 0xc)
    11f0:	3008      	movi      	r0, 8
    11f2:	6840      	and      	r1, r0
    11f4:	3940      	cmpnei      	r1, 0
    11f6:	0bf4      	bt      	0x11de	// 11de <SYSCONIntHandler+0x16>
	else if((SYSCON->MISR&HFOSC_ST)==HFOSC_ST)
    11f8:	9323      	ld.w      	r1, (r3, 0xc)
    11fa:	3010      	movi      	r0, 16
    11fc:	6840      	and      	r1, r0
    11fe:	3940      	cmpnei      	r1, 0
    1200:	0bef      	bt      	0x11de	// 11de <SYSCONIntHandler+0x16>
	else if((SYSCON->MISR&SYSCLK_ST)==SYSCLK_ST)
    1202:	9323      	ld.w      	r1, (r3, 0xc)
    1204:	6848      	and      	r1, r2
    1206:	3940      	cmpnei      	r1, 0
    1208:	0c03      	bf      	0x120e	// 120e <SYSCONIntHandler+0x46>
		SYSCON->ICR = CMD_ERR_ST;
    120a:	b341      	st.w      	r2, (r3, 0x4)
}
    120c:	07ea      	br      	0x11e0	// 11e0 <SYSCONIntHandler+0x18>
	else if((SYSCON->MISR&IWDT_INT_ST)==IWDT_INT_ST)
    120e:	3280      	movi      	r2, 128
    1210:	9323      	ld.w      	r1, (r3, 0xc)
    1212:	4241      	lsli      	r2, r2, 1
    1214:	6848      	and      	r1, r2
    1216:	3940      	cmpnei      	r1, 0
    1218:	0bf9      	bt      	0x120a	// 120a <SYSCONIntHandler+0x42>
	else if((SYSCON->MISR&WKI_INT_ST)==WKI_INT_ST)
    121a:	3280      	movi      	r2, 128
    121c:	9323      	ld.w      	r1, (r3, 0xc)
    121e:	4242      	lsli      	r2, r2, 2
    1220:	6848      	and      	r1, r2
    1222:	3940      	cmpnei      	r1, 0
    1224:	0bf3      	bt      	0x120a	// 120a <SYSCONIntHandler+0x42>
	else if((SYSCON->MISR&RAMERRINT_ST)==RAMERRINT_ST)
    1226:	3280      	movi      	r2, 128
    1228:	9323      	ld.w      	r1, (r3, 0xc)
    122a:	4243      	lsli      	r2, r2, 3
    122c:	6848      	and      	r1, r2
    122e:	3940      	cmpnei      	r1, 0
    1230:	0bed      	bt      	0x120a	// 120a <SYSCONIntHandler+0x42>
	else if((SYSCON->MISR&LVD_INT_ST)==LVD_INT_ST)
    1232:	3280      	movi      	r2, 128
    1234:	9323      	ld.w      	r1, (r3, 0xc)
    1236:	4244      	lsli      	r2, r2, 4
    1238:	6848      	and      	r1, r2
    123a:	3940      	cmpnei      	r1, 0
    123c:	0be7      	bt      	0x120a	// 120a <SYSCONIntHandler+0x42>
	else if((SYSCON->MISR&HWD_ERR)==HWD_ERR)
    123e:	3280      	movi      	r2, 128
    1240:	9323      	ld.w      	r1, (r3, 0xc)
    1242:	4245      	lsli      	r2, r2, 5
    1244:	6848      	and      	r1, r2
    1246:	3940      	cmpnei      	r1, 0
    1248:	0be1      	bt      	0x120a	// 120a <SYSCONIntHandler+0x42>
	else if((SYSCON->MISR&OPTERR_INT)==OPTERR_INT)
    124a:	3280      	movi      	r2, 128
    124c:	9323      	ld.w      	r1, (r3, 0xc)
    124e:	4247      	lsli      	r2, r2, 7
    1250:	6848      	and      	r1, r2
    1252:	3940      	cmpnei      	r1, 0
    1254:	0bdb      	bt      	0x120a	// 120a <SYSCONIntHandler+0x42>
	else if((SYSCON->MISR&EM_CMLST_ST)==EM_CMLST_ST)
    1256:	3280      	movi      	r2, 128
    1258:	9323      	ld.w      	r1, (r3, 0xc)
    125a:	424b      	lsli      	r2, r2, 11
    125c:	6848      	and      	r1, r2
    125e:	3940      	cmpnei      	r1, 0
    1260:	0bd5      	bt      	0x120a	// 120a <SYSCONIntHandler+0x42>
	else if((SYSCON->MISR&EM_EVTRG0_ST)==EM_EVTRG0_ST)
    1262:	3280      	movi      	r2, 128
    1264:	9323      	ld.w      	r1, (r3, 0xc)
    1266:	424c      	lsli      	r2, r2, 12
    1268:	6848      	and      	r1, r2
    126a:	3940      	cmpnei      	r1, 0
    126c:	0c04      	bf      	0x1274	// 1274 <SYSCONIntHandler+0xac>
		SYSCON->ICR = EM_EVTRG0_ST;
    126e:	b341      	st.w      	r2, (r3, 0x4)
		nop;
    1270:	6c03      	mov      	r0, r0
    1272:	07b7      	br      	0x11e0	// 11e0 <SYSCONIntHandler+0x18>
	else if((SYSCON->MISR&EM_EVTRG1_ST)==EM_EVTRG1_ST)
    1274:	3280      	movi      	r2, 128
    1276:	9323      	ld.w      	r1, (r3, 0xc)
    1278:	424d      	lsli      	r2, r2, 13
    127a:	6848      	and      	r1, r2
    127c:	3940      	cmpnei      	r1, 0
    127e:	0bc6      	bt      	0x120a	// 120a <SYSCONIntHandler+0x42>
	else if((SYSCON->MISR&EM_EVTRG2_ST)==EM_EVTRG2_ST)
    1280:	3280      	movi      	r2, 128
    1282:	9323      	ld.w      	r1, (r3, 0xc)
    1284:	424e      	lsli      	r2, r2, 14
    1286:	6848      	and      	r1, r2
    1288:	3940      	cmpnei      	r1, 0
    128a:	0bc0      	bt      	0x120a	// 120a <SYSCONIntHandler+0x42>
	else if((SYSCON->MISR&EM_EVTRG3_ST)==EM_EVTRG3_ST)
    128c:	3280      	movi      	r2, 128
    128e:	9323      	ld.w      	r1, (r3, 0xc)
    1290:	424f      	lsli      	r2, r2, 15
    1292:	6848      	and      	r1, r2
    1294:	3940      	cmpnei      	r1, 0
    1296:	0bba      	bt      	0x120a	// 120a <SYSCONIntHandler+0x42>
	else if((SYSCON->MISR&CMD_ERR_ST)==CMD_ERR_ST)
    1298:	3280      	movi      	r2, 128
    129a:	9323      	ld.w      	r1, (r3, 0xc)
    129c:	4256      	lsli      	r2, r2, 22
    129e:	6848      	and      	r1, r2
    12a0:	3940      	cmpnei      	r1, 0
    12a2:	0bb4      	bt      	0x120a	// 120a <SYSCONIntHandler+0x42>
    12a4:	079e      	br      	0x11e0	// 11e0 <SYSCONIntHandler+0x18>
    12a6:	0000      	bkpt
    12a8:	2000005c 	.long	0x2000005c

Disassembly of section .text.IFCIntHandler:

000012ac <IFCIntHandler>:
//IFC Interrupt
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void IFCIntHandler(void) 
{
    12ac:	1460      	nie
    12ae:	1462      	ipush
    12b0:	14c1      	push      	r4
    // ISR content ...
	//并行写模式
	if(IFC->MISR&ERS_END_INT)			//擦除指令完成
    12b2:	1174      	lrw      	r3, 0x20000060	// 1380 <IFCIntHandler+0xd4>
    12b4:	3101      	movi      	r1, 1
    12b6:	9360      	ld.w      	r3, (r3, 0x0)
    12b8:	934b      	ld.w      	r2, (r3, 0x2c)
    12ba:	6884      	and      	r2, r1
    12bc:	3a40      	cmpnei      	r2, 0
    12be:	0c18      	bf      	0x12ee	// 12ee <IFCIntHandler+0x42>
	{
		IFC->ICR=ERS_END_INT;
    12c0:	b32c      	st.w      	r1, (r3, 0x30)
		if((ifc_step==1)&&(f_Drom_writing==1))
    12c2:	1131      	lrw      	r1, 0x20000e4c	// 1384 <IFCIntHandler+0xd8>
    12c4:	8140      	ld.b      	r2, (r1, 0x0)
    12c6:	3a41      	cmpnei      	r2, 1
    12c8:	080f      	bt      	0x12e6	// 12e6 <IFCIntHandler+0x3a>
    12ca:	1150      	lrw      	r2, 0x200000d6	// 1388 <IFCIntHandler+0xdc>
    12cc:	8240      	ld.b      	r2, (r2, 0x0)
    12ce:	7488      	zextb      	r2, r2
    12d0:	3a41      	cmpnei      	r2, 1
    12d2:	080a      	bt      	0x12e6	// 12e6 <IFCIntHandler+0x3a>
		{
			SetUserKey;
    12d4:	110e      	lrw      	r0, 0x5a5a5a5a	// 138c <IFCIntHandler+0xe0>
    12d6:	b308      	st.w      	r0, (r3, 0x20)
			IFC->CMR=0x01;					//将页缓存的数据写入闪存中
    12d8:	b343      	st.w      	r2, (r3, 0xc)
			IFC->FM_ADDR=R_INT_FlashAdd;		//
    12da:	110e      	lrw      	r0, 0x20000e48	// 1390 <IFCIntHandler+0xe4>
    12dc:	9000      	ld.w      	r0, (r0, 0x0)
    12de:	b306      	st.w      	r0, (r3, 0x18)
			IFC->CR=0X01;					//Start Program
    12e0:	b344      	st.w      	r2, (r3, 0x10)
			ifc_step=2;
    12e2:	3302      	movi      	r3, 2
    12e4:	a160      	st.b      	r3, (r1, 0x0)
	}
	else if(IFC->MISR&OVW_ERR_INT)		//非法操作错误中断
	{
		IFC->ICR=OVW_ERR_INT;
	}
}
    12e6:	9880      	ld.w      	r4, (r14, 0x0)
    12e8:	1401      	addi      	r14, r14, 4
    12ea:	1463      	ipop
    12ec:	1461      	nir
	else if(IFC->MISR&RGM_END_INT)		//编译指令完成
    12ee:	934b      	ld.w      	r2, (r3, 0x2c)
    12f0:	3102      	movi      	r1, 2
    12f2:	6884      	and      	r2, r1
    12f4:	3a40      	cmpnei      	r2, 0
    12f6:	0c10      	bf      	0x1316	// 1316 <IFCIntHandler+0x6a>
		IFC->ICR=RGM_END_INT;
    12f8:	b32c      	st.w      	r1, (r3, 0x30)
		if((ifc_step==2)&&(f_Drom_writing==1))
    12fa:	1163      	lrw      	r3, 0x20000e4c	// 1384 <IFCIntHandler+0xd8>
    12fc:	8360      	ld.b      	r3, (r3, 0x0)
    12fe:	3b42      	cmpnei      	r3, 2
    1300:	0bf3      	bt      	0x12e6	// 12e6 <IFCIntHandler+0x3a>
    1302:	1162      	lrw      	r3, 0x200000d6	// 1388 <IFCIntHandler+0xdc>
    1304:	8340      	ld.b      	r2, (r3, 0x0)
    1306:	3a41      	cmpnei      	r2, 1
    1308:	0bef      	bt      	0x12e6	// 12e6 <IFCIntHandler+0x3a>
			f_Drom_writing=0;
    130a:	3200      	movi      	r2, 0
    130c:	a340      	st.b      	r2, (r3, 0x0)
			f_Drom_write_complete=1;
    130e:	3201      	movi      	r2, 1
    1310:	1161      	lrw      	r3, 0x200000d7	// 1394 <IFCIntHandler+0xe8>
    1312:	a340      	st.b      	r2, (r3, 0x0)
    1314:	07e9      	br      	0x12e6	// 12e6 <IFCIntHandler+0x3a>
	else if(IFC->MISR&PEP_END_INT)		//预编程指令完成
    1316:	934b      	ld.w      	r2, (r3, 0x2c)
    1318:	3004      	movi      	r0, 4
    131a:	6880      	and      	r2, r0
    131c:	3a40      	cmpnei      	r2, 0
    131e:	0c15      	bf      	0x1348	// 1348 <IFCIntHandler+0x9c>
		IFC->ICR=PEP_END_INT;
    1320:	b30c      	st.w      	r0, (r3, 0x30)
		if((ifc_step==0)&&(f_Drom_writing==1))
    1322:	1019      	lrw      	r0, 0x20000e4c	// 1384 <IFCIntHandler+0xd8>
    1324:	8040      	ld.b      	r2, (r0, 0x0)
    1326:	3a40      	cmpnei      	r2, 0
    1328:	0bdf      	bt      	0x12e6	// 12e6 <IFCIntHandler+0x3a>
    132a:	1058      	lrw      	r2, 0x200000d6	// 1388 <IFCIntHandler+0xdc>
    132c:	8240      	ld.b      	r2, (r2, 0x0)
    132e:	7488      	zextb      	r2, r2
    1330:	3a41      	cmpnei      	r2, 1
    1332:	0bda      	bt      	0x12e6	// 12e6 <IFCIntHandler+0x3a>
			SetUserKey;
    1334:	1096      	lrw      	r4, 0x5a5a5a5a	// 138c <IFCIntHandler+0xe0>
    1336:	b388      	st.w      	r4, (r3, 0x20)
			IFC->CMR=0x02;					//页擦除
    1338:	b323      	st.w      	r1, (r3, 0xc)
			IFC->FM_ADDR=R_INT_FlashAdd;			//
    133a:	1036      	lrw      	r1, 0x20000e48	// 1390 <IFCIntHandler+0xe4>
    133c:	9120      	ld.w      	r1, (r1, 0x0)
    133e:	b326      	st.w      	r1, (r3, 0x18)
			IFC->CR=0X01;					//Start Program
    1340:	b344      	st.w      	r2, (r3, 0x10)
			ifc_step=1;
    1342:	3301      	movi      	r3, 1
    1344:	a060      	st.b      	r3, (r0, 0x0)
    1346:	07d0      	br      	0x12e6	// 12e6 <IFCIntHandler+0x3a>
	else if(IFC->MISR&PROT_ERR_INT)		//保护错误中断
    1348:	3280      	movi      	r2, 128
    134a:	932b      	ld.w      	r1, (r3, 0x2c)
    134c:	4245      	lsli      	r2, r2, 5
    134e:	6848      	and      	r1, r2
    1350:	3940      	cmpnei      	r1, 0
    1352:	0c03      	bf      	0x1358	// 1358 <IFCIntHandler+0xac>
		IFC->ICR=OVW_ERR_INT;
    1354:	b34c      	st.w      	r2, (r3, 0x30)
}
    1356:	07c8      	br      	0x12e6	// 12e6 <IFCIntHandler+0x3a>
	else if(IFC->MISR&UDEF_ERR_INT)		//未定义指令错误中断
    1358:	3280      	movi      	r2, 128
    135a:	932b      	ld.w      	r1, (r3, 0x2c)
    135c:	4246      	lsli      	r2, r2, 6
    135e:	6848      	and      	r1, r2
    1360:	3940      	cmpnei      	r1, 0
    1362:	0bf9      	bt      	0x1354	// 1354 <IFCIntHandler+0xa8>
	else if(IFC->MISR&ADDR_ERR_INT)		//地址错误中断
    1364:	3280      	movi      	r2, 128
    1366:	932b      	ld.w      	r1, (r3, 0x2c)
    1368:	4247      	lsli      	r2, r2, 7
    136a:	6848      	and      	r1, r2
    136c:	3940      	cmpnei      	r1, 0
    136e:	0bf3      	bt      	0x1354	// 1354 <IFCIntHandler+0xa8>
	else if(IFC->MISR&OVW_ERR_INT)		//非法操作错误中断
    1370:	3280      	movi      	r2, 128
    1372:	932b      	ld.w      	r1, (r3, 0x2c)
    1374:	4248      	lsli      	r2, r2, 8
    1376:	6848      	and      	r1, r2
    1378:	3940      	cmpnei      	r1, 0
    137a:	0bed      	bt      	0x1354	// 1354 <IFCIntHandler+0xa8>
    137c:	07b5      	br      	0x12e6	// 12e6 <IFCIntHandler+0x3a>
    137e:	0000      	bkpt
    1380:	20000060 	.long	0x20000060
    1384:	20000e4c 	.long	0x20000e4c
    1388:	200000d6 	.long	0x200000d6
    138c:	5a5a5a5a 	.long	0x5a5a5a5a
    1390:	20000e48 	.long	0x20000e48
    1394:	200000d7 	.long	0x200000d7

Disassembly of section .text.EPT0IntHandler:

00001398 <EPT0IntHandler>:
//EPT0 Interrupt
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void EPT0IntHandler(void) 
{
    1398:	1460      	nie
    139a:	1462      	ipush
    139c:	14d1      	push      	r4, r15
    // ISR content ...
	if((EPT0->MISR&EPT_TRGEV0_INT)==EPT_TRGEV0_INT)
    139e:	1386      	lrw      	r4, 0x20000020	// 1534 <EPT0IntHandler+0x19c>
    13a0:	3280      	movi      	r2, 128
    13a2:	9460      	ld.w      	r3, (r4, 0x0)
    13a4:	60c8      	addu      	r3, r2
    13a6:	9335      	ld.w      	r1, (r3, 0x54)
    13a8:	3001      	movi      	r0, 1
    13aa:	6840      	and      	r1, r0
    13ac:	3940      	cmpnei      	r1, 0
    13ae:	0c03      	bf      	0x13b4	// 13b4 <EPT0IntHandler+0x1c>
		EXTI_trigger_CMD(DISABLE,EXI_PIN0,_EXIFT);
		R_CMPB_BUF=EPT0->CMPB;			//周期计数值
	}
	else if((EPT0->MISR&EPT_CAP_LD2)==EPT_CAP_LD2)
	{
		EPT0->ICR=EPT_CAP_LD2;
    13b0:	b317      	st.w      	r0, (r3, 0x5c)
    13b2:	0424      	br      	0x13fa	// 13fa <EPT0IntHandler+0x62>
	else if((EPT0->MISR&EPT_TRGEV1_INT)==EPT_TRGEV1_INT)
    13b4:	9335      	ld.w      	r1, (r3, 0x54)
    13b6:	3002      	movi      	r0, 2
    13b8:	6840      	and      	r1, r0
    13ba:	3940      	cmpnei      	r1, 0
    13bc:	0bfa      	bt      	0x13b0	// 13b0 <EPT0IntHandler+0x18>
	else if((EPT0->MISR&EPT_TRGEV2_INT)==EPT_TRGEV2_INT)
    13be:	9335      	ld.w      	r1, (r3, 0x54)
    13c0:	3004      	movi      	r0, 4
    13c2:	6840      	and      	r1, r0
    13c4:	3940      	cmpnei      	r1, 0
    13c6:	0bf5      	bt      	0x13b0	// 13b0 <EPT0IntHandler+0x18>
	else if((EPT0->MISR&EPT_TRGEV3_INT)==EPT_TRGEV3_INT)
    13c8:	9335      	ld.w      	r1, (r3, 0x54)
    13ca:	3008      	movi      	r0, 8
    13cc:	6840      	and      	r1, r0
    13ce:	3940      	cmpnei      	r1, 0
    13d0:	0bf0      	bt      	0x13b0	// 13b0 <EPT0IntHandler+0x18>
	else if((EPT0->MISR&EPT_CAP_LD0)==EPT_CAP_LD0)
    13d2:	9335      	ld.w      	r1, (r3, 0x54)
    13d4:	3010      	movi      	r0, 16
    13d6:	6840      	and      	r1, r0
    13d8:	3940      	cmpnei      	r1, 0
    13da:	0c1f      	bf      	0x1418	// 1418 <EPT0IntHandler+0x80>
		EPT0->ICR=EPT_CAP_LD0;
    13dc:	b317      	st.w      	r0, (r3, 0x5c)
		EXTI_trigger_CMD(DISABLE,EXI_PIN0,_EXIRT);
    13de:	3200      	movi      	r2, 0
    13e0:	3101      	movi      	r1, 1
    13e2:	3000      	movi      	r0, 0
    13e4:	e3fffd36 	bsr      	0xe50	// e50 <EXTI_trigger_CMD>
		EXTI_trigger_CMD(ENABLE,EXI_PIN0,_EXIFT);
    13e8:	3201      	movi      	r2, 1
    13ea:	3101      	movi      	r1, 1
    13ec:	3001      	movi      	r0, 1
    13ee:	e3fffd31 	bsr      	0xe50	// e50 <EXTI_trigger_CMD>
		R_CMPA_BUF=EPT0->CMPA;			//低电平
    13f2:	9460      	ld.w      	r3, (r4, 0x0)
    13f4:	934b      	ld.w      	r2, (r3, 0x2c)
    13f6:	1271      	lrw      	r3, 0x20000e58	// 1538 <EPT0IntHandler+0x1a0>
		R_CMPB_BUF=EPT0->CMPB;			//周期计数值
    13f8:	b340      	st.w      	r2, (r3, 0x0)
	else if((EPT0->MISR&EPT_PEND)==EPT_PEND)
	{
		EPT0->ICR=EPT_PEND;
	}
	//紧急中断
	if((EPT0->EMMISR&EPT_EP0_EMINT)==EPT_EP0_EMINT)
    13fa:	9460      	ld.w      	r3, (r4, 0x0)
    13fc:	3280      	movi      	r2, 128
    13fe:	60c8      	addu      	r3, r2
    1400:	932b      	ld.w      	r1, (r3, 0x2c)
    1402:	3001      	movi      	r0, 1
    1404:	6840      	and      	r1, r0
    1406:	3940      	cmpnei      	r1, 0
    1408:	0c5e      	bf      	0x14c4	// 14c4 <EPT0IntHandler+0x12c>
	{
		EPT0->EMICR=EPT_EP5_EMINT;
	}
	else if((EPT0->EMMISR&EPT_EP6_EMINT)==EPT_EP6_EMINT)
	{
		EPT0->EMICR=EPT_EP6_EMINT;
    140a:	b30d      	st.w      	r0, (r3, 0x34)
	}
	else if((EPT0->EMMISR&EPT_EOM_FAULT_EMINT)==EPT_EOM_FAULT_EMINT)
	{
		EPT0->EMICR=EPT_EOM_FAULT_EMINT;
	}
}
    140c:	d9ee2001 	ld.w      	r15, (r14, 0x4)
    1410:	9880      	ld.w      	r4, (r14, 0x0)
    1412:	1402      	addi      	r14, r14, 8
    1414:	1463      	ipop
    1416:	1461      	nir
	else if((EPT0->MISR&EPT_CAP_LD1)==EPT_CAP_LD1)
    1418:	9335      	ld.w      	r1, (r3, 0x54)
    141a:	3020      	movi      	r0, 32
    141c:	6840      	and      	r1, r0
    141e:	3940      	cmpnei      	r1, 0
    1420:	0c10      	bf      	0x1440	// 1440 <EPT0IntHandler+0xa8>
		EPT0->ICR=EPT_CAP_LD1;
    1422:	b317      	st.w      	r0, (r3, 0x5c)
		EXTI_trigger_CMD(ENABLE,EXI_PIN0,_EXIRT);
    1424:	3200      	movi      	r2, 0
    1426:	3101      	movi      	r1, 1
    1428:	3001      	movi      	r0, 1
    142a:	e3fffd13 	bsr      	0xe50	// e50 <EXTI_trigger_CMD>
		EXTI_trigger_CMD(DISABLE,EXI_PIN0,_EXIFT);
    142e:	3201      	movi      	r2, 1
    1430:	3101      	movi      	r1, 1
    1432:	3000      	movi      	r0, 0
    1434:	e3fffd0e 	bsr      	0xe50	// e50 <EXTI_trigger_CMD>
		R_CMPB_BUF=EPT0->CMPB;			//周期计数值
    1438:	9460      	ld.w      	r3, (r4, 0x0)
    143a:	934c      	ld.w      	r2, (r3, 0x30)
    143c:	1260      	lrw      	r3, 0x20000e50	// 153c <EPT0IntHandler+0x1a4>
    143e:	07dd      	br      	0x13f8	// 13f8 <EPT0IntHandler+0x60>
	else if((EPT0->MISR&EPT_CAP_LD2)==EPT_CAP_LD2)
    1440:	9335      	ld.w      	r1, (r3, 0x54)
    1442:	3040      	movi      	r0, 64
    1444:	6840      	and      	r1, r0
    1446:	3940      	cmpnei      	r1, 0
    1448:	0bb4      	bt      	0x13b0	// 13b0 <EPT0IntHandler+0x18>
	else if((EPT0->MISR&EPT_CAP_LD3)==EPT_CAP_LD3)
    144a:	9335      	ld.w      	r1, (r3, 0x54)
    144c:	6848      	and      	r1, r2
    144e:	3940      	cmpnei      	r1, 0
    1450:	0c03      	bf      	0x1456	// 1456 <EPT0IntHandler+0xbe>
		EPT0->ICR=EPT_PEND;
    1452:	b357      	st.w      	r2, (r3, 0x5c)
    1454:	07d3      	br      	0x13fa	// 13fa <EPT0IntHandler+0x62>
	else if((EPT0->MISR&EPT_CAU)==EPT_CAU)
    1456:	3280      	movi      	r2, 128
    1458:	9335      	ld.w      	r1, (r3, 0x54)
    145a:	4241      	lsli      	r2, r2, 1
    145c:	6848      	and      	r1, r2
    145e:	3940      	cmpnei      	r1, 0
    1460:	0bf9      	bt      	0x1452	// 1452 <EPT0IntHandler+0xba>
	else if((EPT0->MISR&EPT_CAD)==EPT_CAD)
    1462:	3280      	movi      	r2, 128
    1464:	9335      	ld.w      	r1, (r3, 0x54)
    1466:	4242      	lsli      	r2, r2, 2
    1468:	6848      	and      	r1, r2
    146a:	3940      	cmpnei      	r1, 0
    146c:	0bf3      	bt      	0x1452	// 1452 <EPT0IntHandler+0xba>
	else if((EPT0->MISR&EPT_CBU)==EPT_CBU)
    146e:	3280      	movi      	r2, 128
    1470:	9335      	ld.w      	r1, (r3, 0x54)
    1472:	4243      	lsli      	r2, r2, 3
    1474:	6848      	and      	r1, r2
    1476:	3940      	cmpnei      	r1, 0
    1478:	0bed      	bt      	0x1452	// 1452 <EPT0IntHandler+0xba>
	else if((EPT0->MISR&EPT_CBD)==EPT_CBD)
    147a:	3280      	movi      	r2, 128
    147c:	9335      	ld.w      	r1, (r3, 0x54)
    147e:	4244      	lsli      	r2, r2, 4
    1480:	6848      	and      	r1, r2
    1482:	3940      	cmpnei      	r1, 0
    1484:	0be7      	bt      	0x1452	// 1452 <EPT0IntHandler+0xba>
	else if((EPT0->MISR&EPT_CCU)==EPT_CCU)
    1486:	3280      	movi      	r2, 128
    1488:	9335      	ld.w      	r1, (r3, 0x54)
    148a:	4245      	lsli      	r2, r2, 5
    148c:	6848      	and      	r1, r2
    148e:	3940      	cmpnei      	r1, 0
    1490:	0be1      	bt      	0x1452	// 1452 <EPT0IntHandler+0xba>
	else if((EPT0->MISR&EPT_CCD)==EPT_CCD)
    1492:	3280      	movi      	r2, 128
    1494:	9335      	ld.w      	r1, (r3, 0x54)
    1496:	4246      	lsli      	r2, r2, 6
    1498:	6848      	and      	r1, r2
    149a:	3940      	cmpnei      	r1, 0
    149c:	0bdb      	bt      	0x1452	// 1452 <EPT0IntHandler+0xba>
	else if((EPT0->MISR&EPT_CDU)==EPT_CDU)
    149e:	3280      	movi      	r2, 128
    14a0:	9335      	ld.w      	r1, (r3, 0x54)
    14a2:	4247      	lsli      	r2, r2, 7
    14a4:	6848      	and      	r1, r2
    14a6:	3940      	cmpnei      	r1, 0
    14a8:	0bd5      	bt      	0x1452	// 1452 <EPT0IntHandler+0xba>
	else if((EPT0->MISR&EPT_CDD)==EPT_CDD)
    14aa:	3280      	movi      	r2, 128
    14ac:	9335      	ld.w      	r1, (r3, 0x54)
    14ae:	4248      	lsli      	r2, r2, 8
    14b0:	6848      	and      	r1, r2
    14b2:	3940      	cmpnei      	r1, 0
    14b4:	0bcf      	bt      	0x1452	// 1452 <EPT0IntHandler+0xba>
	else if((EPT0->MISR&EPT_PEND)==EPT_PEND)
    14b6:	3280      	movi      	r2, 128
    14b8:	9335      	ld.w      	r1, (r3, 0x54)
    14ba:	4249      	lsli      	r2, r2, 9
    14bc:	6848      	and      	r1, r2
    14be:	3940      	cmpnei      	r1, 0
    14c0:	0f9d      	bf      	0x13fa	// 13fa <EPT0IntHandler+0x62>
    14c2:	07c8      	br      	0x1452	// 1452 <EPT0IntHandler+0xba>
	else if((EPT0->EMMISR&EPT_EP1_EMINT)==EPT_EP1_EMINT)
    14c4:	932b      	ld.w      	r1, (r3, 0x2c)
    14c6:	3002      	movi      	r0, 2
    14c8:	6840      	and      	r1, r0
    14ca:	3940      	cmpnei      	r1, 0
    14cc:	0b9f      	bt      	0x140a	// 140a <EPT0IntHandler+0x72>
	else if((EPT0->EMMISR&EPT_EP2_EMINT)==EPT_EP2_EMINT)
    14ce:	932b      	ld.w      	r1, (r3, 0x2c)
    14d0:	3004      	movi      	r0, 4
    14d2:	6840      	and      	r1, r0
    14d4:	3940      	cmpnei      	r1, 0
    14d6:	0b9a      	bt      	0x140a	// 140a <EPT0IntHandler+0x72>
	else if((EPT0->EMMISR&EPT_EP3_EMINT)==EPT_EP3_EMINT)
    14d8:	932b      	ld.w      	r1, (r3, 0x2c)
    14da:	3008      	movi      	r0, 8
    14dc:	6840      	and      	r1, r0
    14de:	3940      	cmpnei      	r1, 0
    14e0:	0b95      	bt      	0x140a	// 140a <EPT0IntHandler+0x72>
	else if((EPT0->EMMISR&EPT_EP4_EMINT)==EPT_EP4_EMINT)
    14e2:	932b      	ld.w      	r1, (r3, 0x2c)
    14e4:	3010      	movi      	r0, 16
    14e6:	6840      	and      	r1, r0
    14e8:	3940      	cmpnei      	r1, 0
    14ea:	0b90      	bt      	0x140a	// 140a <EPT0IntHandler+0x72>
	else if((EPT0->EMMISR&EPT_EP5_EMINT)==EPT_EP5_EMINT)
    14ec:	932b      	ld.w      	r1, (r3, 0x2c)
    14ee:	3020      	movi      	r0, 32
    14f0:	6840      	and      	r1, r0
    14f2:	3940      	cmpnei      	r1, 0
    14f4:	0b8b      	bt      	0x140a	// 140a <EPT0IntHandler+0x72>
	else if((EPT0->EMMISR&EPT_EP6_EMINT)==EPT_EP6_EMINT)
    14f6:	932b      	ld.w      	r1, (r3, 0x2c)
    14f8:	3040      	movi      	r0, 64
    14fa:	6840      	and      	r1, r0
    14fc:	3940      	cmpnei      	r1, 0
    14fe:	0b86      	bt      	0x140a	// 140a <EPT0IntHandler+0x72>
	else if((EPT0->EMMISR&EPT_EP7_EMINT)==EPT_EP7_EMINT)
    1500:	932b      	ld.w      	r1, (r3, 0x2c)
    1502:	6848      	and      	r1, r2
    1504:	3940      	cmpnei      	r1, 0
    1506:	0c03      	bf      	0x150c	// 150c <EPT0IntHandler+0x174>
		EPT0->EMICR=EPT_EOM_FAULT_EMINT;
    1508:	b34d      	st.w      	r2, (r3, 0x34)
}
    150a:	0781      	br      	0x140c	// 140c <EPT0IntHandler+0x74>
	else if((EPT0->EMMISR&EPT_CPU_FAULT_EMINT)==EPT_CPU_FAULT_EMINT)
    150c:	3280      	movi      	r2, 128
    150e:	932b      	ld.w      	r1, (r3, 0x2c)
    1510:	4241      	lsli      	r2, r2, 1
    1512:	6848      	and      	r1, r2
    1514:	3940      	cmpnei      	r1, 0
    1516:	0bf9      	bt      	0x1508	// 1508 <EPT0IntHandler+0x170>
	else if((EPT0->EMMISR&EPT_MEM_FAULT_EMINT)==EPT_MEM_FAULT_EMINT)
    1518:	3280      	movi      	r2, 128
    151a:	932b      	ld.w      	r1, (r3, 0x2c)
    151c:	4242      	lsli      	r2, r2, 2
    151e:	6848      	and      	r1, r2
    1520:	3940      	cmpnei      	r1, 0
    1522:	0bf3      	bt      	0x1508	// 1508 <EPT0IntHandler+0x170>
	else if((EPT0->EMMISR&EPT_EOM_FAULT_EMINT)==EPT_EOM_FAULT_EMINT)
    1524:	3280      	movi      	r2, 128
    1526:	932b      	ld.w      	r1, (r3, 0x2c)
    1528:	4243      	lsli      	r2, r2, 3
    152a:	6848      	and      	r1, r2
    152c:	3940      	cmpnei      	r1, 0
    152e:	0bed      	bt      	0x1508	// 1508 <EPT0IntHandler+0x170>
    1530:	076e      	br      	0x140c	// 140c <EPT0IntHandler+0x74>
    1532:	0000      	bkpt
    1534:	20000020 	.long	0x20000020
    1538:	20000e58 	.long	0x20000e58
    153c:	20000e50 	.long	0x20000e50

Disassembly of section .text.WWDTHandler:

00001540 <WWDTHandler>:
//WWDT Interrupt
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void WWDTHandler(void)
{
    1540:	1460      	nie
    1542:	1462      	ipush
    1544:	14d3      	push      	r4-r6, r15
	WWDT->ICR=0X01;
    1546:	10b0      	lrw      	r5, 0x20000010	// 1584 <WWDTHandler+0x44>
    1548:	3401      	movi      	r4, 1
    154a:	9560      	ld.w      	r3, (r5, 0x0)
    154c:	b385      	st.w      	r4, (r3, 0x14)
	WWDT_CNT_Load(0xFF);
    154e:	30ff      	movi      	r0, 255
	GPIO_Init(GPIOA0,4,0);
    1550:	10ce      	lrw      	r6, 0x2000004c	// 1588 <WWDTHandler+0x48>
	WWDT_CNT_Load(0xFF);
    1552:	e3fffd41 	bsr      	0xfd4	// fd4 <WWDT_CNT_Load>
	GPIO_Init(GPIOA0,4,0);
    1556:	3200      	movi      	r2, 0
    1558:	3104      	movi      	r1, 4
    155a:	9600      	ld.w      	r0, (r6, 0x0)
    155c:	e3fff938 	bsr      	0x7cc	// 7cc <GPIO_Init>
	GPIO_Reverse(GPIOA0,4);
    1560:	9600      	ld.w      	r0, (r6, 0x0)
    1562:	3104      	movi      	r1, 4
    1564:	e3fff9ac 	bsr      	0x8bc	// 8bc <GPIO_Reverse>
	
	if((WWDT->MISR&WWDT_EVI)==WWDT_EVI)
    1568:	9540      	ld.w      	r2, (r5, 0x0)
    156a:	9263      	ld.w      	r3, (r2, 0xc)
    156c:	68d0      	and      	r3, r4
    156e:	3b40      	cmpnei      	r3, 0
    1570:	0c02      	bf      	0x1574	// 1574 <WWDTHandler+0x34>
	{
		WWDT->ICR = WWDT_EVI;
    1572:	b285      	st.w      	r4, (r2, 0x14)
	} 
}
    1574:	d9ee2003 	ld.w      	r15, (r14, 0xc)
    1578:	98c2      	ld.w      	r6, (r14, 0x8)
    157a:	98a1      	ld.w      	r5, (r14, 0x4)
    157c:	9880      	ld.w      	r4, (r14, 0x0)
    157e:	1404      	addi      	r14, r14, 16
    1580:	1463      	ipop
    1582:	1461      	nir
    1584:	20000010 	.long	0x20000010
    1588:	2000004c 	.long	0x2000004c

Disassembly of section .text.GPT0IntHandler:

0000158c <GPT0IntHandler>:
//GPT0 Interrupt
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void GPT0IntHandler(void) 
{
    158c:	1460      	nie
    158e:	1462      	ipush
    1590:	14c1      	push      	r4
    // ISR content ...
	//Interupt
	if((GPT0->MISR&GPT_INT_TRGEV0)==GPT_INT_TRGEV0)
    1592:	116b      	lrw      	r3, 0x20000024	// 163c <GPT0IntHandler+0xb0>
    1594:	3280      	movi      	r2, 128
    1596:	9360      	ld.w      	r3, (r3, 0x0)
    1598:	60c8      	addu      	r3, r2
    159a:	9315      	ld.w      	r0, (r3, 0x54)
    159c:	3101      	movi      	r1, 1
    159e:	6804      	and      	r0, r1
    15a0:	3840      	cmpnei      	r0, 0
    15a2:	0c03      	bf      	0x15a8	// 15a8 <GPT0IntHandler+0x1c>
	{
		GPT0->ICR = GPT_INT_TRGEV1;
	}
	else if((GPT0->MISR&GPT_INT_TRGEV2)==GPT_INT_TRGEV2)
	{
		GPT0->ICR = GPT_INT_TRGEV0;
    15a4:	b337      	st.w      	r1, (r3, 0x5c)
    15a6:	0407      	br      	0x15b4	// 15b4 <GPT0IntHandler+0x28>
	else if((GPT0->MISR&GPT_INT_TRGEV1)==GPT_INT_TRGEV1)
    15a8:	9315      	ld.w      	r0, (r3, 0x54)
    15aa:	3402      	movi      	r4, 2
    15ac:	6810      	and      	r0, r4
    15ae:	3840      	cmpnei      	r0, 0
    15b0:	0c06      	bf      	0x15bc	// 15bc <GPT0IntHandler+0x30>
		GPT0->ICR = GPT_INT_TRGEV1;
    15b2:	b397      	st.w      	r4, (r3, 0x5c)
	}
	else if((GPT0->MISR&GPT_INT_PEND)==GPT_INT_PEND)
	{
		GPT0->ICR = GPT_INT_PEND;
	}
}
    15b4:	9880      	ld.w      	r4, (r14, 0x0)
    15b6:	1401      	addi      	r14, r14, 4
    15b8:	1463      	ipop
    15ba:	1461      	nir
	else if((GPT0->MISR&GPT_INT_TRGEV2)==GPT_INT_TRGEV2)
    15bc:	9315      	ld.w      	r0, (r3, 0x54)
    15be:	3404      	movi      	r4, 4
    15c0:	6810      	and      	r0, r4
    15c2:	3840      	cmpnei      	r0, 0
    15c4:	0bf0      	bt      	0x15a4	// 15a4 <GPT0IntHandler+0x18>
	else if((GPT0->MISR&GPT_TRGEV3)==GPT_INT_TRGEV3)
    15c6:	9335      	ld.w      	r1, (r3, 0x54)
    15c8:	3008      	movi      	r0, 8
    15ca:	6840      	and      	r1, r0
    15cc:	3940      	cmpnei      	r1, 0
    15ce:	0c03      	bf      	0x15d4	// 15d4 <GPT0IntHandler+0x48>
		GPT0->ICR = GPT_INT_CAPLD2;
    15d0:	b317      	st.w      	r0, (r3, 0x5c)
    15d2:	07f1      	br      	0x15b4	// 15b4 <GPT0IntHandler+0x28>
	else if((GPT0->MISR&GPT_INT_CAPLD0)==GPT_INT_CAPLD0)
    15d4:	9335      	ld.w      	r1, (r3, 0x54)
    15d6:	3010      	movi      	r0, 16
    15d8:	6840      	and      	r1, r0
    15da:	3940      	cmpnei      	r1, 0
    15dc:	0bfa      	bt      	0x15d0	// 15d0 <GPT0IntHandler+0x44>
	else if((GPT0->MISR&GPT_INT_CAPLD1)==GPT_INT_CAPLD1)
    15de:	9335      	ld.w      	r1, (r3, 0x54)
    15e0:	3020      	movi      	r0, 32
    15e2:	6840      	and      	r1, r0
    15e4:	3940      	cmpnei      	r1, 0
    15e6:	0bf5      	bt      	0x15d0	// 15d0 <GPT0IntHandler+0x44>
	else if((GPT0->MISR&GPT_INT_CAPLD2)==GPT_INT_CAPLD2)
    15e8:	9335      	ld.w      	r1, (r3, 0x54)
    15ea:	3040      	movi      	r0, 64
    15ec:	6840      	and      	r1, r0
    15ee:	3940      	cmpnei      	r1, 0
    15f0:	0bf0      	bt      	0x15d0	// 15d0 <GPT0IntHandler+0x44>
	else if((GPT0->MISR&GPT_INT_CAPLD3)==GPT_INT_CAPLD3)
    15f2:	9335      	ld.w      	r1, (r3, 0x54)
    15f4:	6848      	and      	r1, r2
    15f6:	3940      	cmpnei      	r1, 0
    15f8:	0c03      	bf      	0x15fe	// 15fe <GPT0IntHandler+0x72>
		GPT0->ICR = GPT_INT_PEND;
    15fa:	b357      	st.w      	r2, (r3, 0x5c)
}
    15fc:	07dc      	br      	0x15b4	// 15b4 <GPT0IntHandler+0x28>
	else if((GPT0->MISR&GPT_INT_CAU)==GPT_INT_CAU)
    15fe:	3280      	movi      	r2, 128
    1600:	9335      	ld.w      	r1, (r3, 0x54)
    1602:	4241      	lsli      	r2, r2, 1
    1604:	6848      	and      	r1, r2
    1606:	3940      	cmpnei      	r1, 0
    1608:	0bf9      	bt      	0x15fa	// 15fa <GPT0IntHandler+0x6e>
	else if((GPT0->MISR&GPT_INT_CAD)==GPT_INT_CAD)
    160a:	3280      	movi      	r2, 128
    160c:	9335      	ld.w      	r1, (r3, 0x54)
    160e:	4242      	lsli      	r2, r2, 2
    1610:	6848      	and      	r1, r2
    1612:	3940      	cmpnei      	r1, 0
    1614:	0bf3      	bt      	0x15fa	// 15fa <GPT0IntHandler+0x6e>
	else if((GPT0->MISR&GPT_INT_CBU)==GPT_INT_CBU)
    1616:	3280      	movi      	r2, 128
    1618:	9335      	ld.w      	r1, (r3, 0x54)
    161a:	4243      	lsli      	r2, r2, 3
    161c:	6848      	and      	r1, r2
    161e:	3940      	cmpnei      	r1, 0
    1620:	0bed      	bt      	0x15fa	// 15fa <GPT0IntHandler+0x6e>
	else if((GPT0->MISR&GPT_INT_CBD)==GPT_INT_CBD)
    1622:	3280      	movi      	r2, 128
    1624:	9335      	ld.w      	r1, (r3, 0x54)
    1626:	4244      	lsli      	r2, r2, 4
    1628:	6848      	and      	r1, r2
    162a:	3940      	cmpnei      	r1, 0
    162c:	0be7      	bt      	0x15fa	// 15fa <GPT0IntHandler+0x6e>
	else if((GPT0->MISR&GPT_INT_PEND)==GPT_INT_PEND)
    162e:	3280      	movi      	r2, 128
    1630:	9335      	ld.w      	r1, (r3, 0x54)
    1632:	4249      	lsli      	r2, r2, 9
    1634:	6848      	and      	r1, r2
    1636:	3940      	cmpnei      	r1, 0
    1638:	0be1      	bt      	0x15fa	// 15fa <GPT0IntHandler+0x6e>
    163a:	07bd      	br      	0x15b4	// 15b4 <GPT0IntHandler+0x28>
    163c:	20000024 	.long	0x20000024

Disassembly of section .text.RTCIntHandler:

00001640 <RTCIntHandler>:
//RTC Interrupt
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void RTCIntHandler(void) 
{
    1640:	1460      	nie
    1642:	1462      	ipush
    // ISR content ...
	if((RTC->MISR&ALRA_INT)==ALRA_INT)			//ALRAR 
    1644:	1079      	lrw      	r3, 0x20000018	// 16a8 <RTCIntHandler+0x68>
    1646:	3101      	movi      	r1, 1
    1648:	9360      	ld.w      	r3, (r3, 0x0)
    164a:	934a      	ld.w      	r2, (r3, 0x28)
    164c:	6884      	and      	r2, r1
    164e:	3a40      	cmpnei      	r2, 0
    1650:	0c14      	bf      	0x1678	// 1678 <RTCIntHandler+0x38>
	{
		RTC->ICR=ALRA_INT;
		RTC->KEY=0XCA53;
    1652:	1057      	lrw      	r2, 0xca53	// 16ac <RTCIntHandler+0x6c>
		RTC->ICR=ALRA_INT;
    1654:	b32b      	st.w      	r1, (r3, 0x2c)
		RTC->KEY=0XCA53;
    1656:	b34c      	st.w      	r2, (r3, 0x30)
		RTC->CR=RTC->CR|0x01;
    1658:	9342      	ld.w      	r2, (r3, 0x8)
    165a:	6c84      	or      	r2, r1
    165c:	b342      	st.w      	r2, (r3, 0x8)
		RTC->TIMR=(0x10<<16)|(0x00<<8)|(0x00);			//Hour bit6->0:am 1:pm	
    165e:	3280      	movi      	r2, 128
    1660:	424d      	lsli      	r2, r2, 13
    1662:	b340      	st.w      	r2, (r3, 0x0)
		while(RTC->CR&0x02);//busy 判断TIMR DATR ALRAR ALRBR数据写完
    1664:	3102      	movi      	r1, 2
    1666:	9342      	ld.w      	r2, (r3, 0x8)
    1668:	6884      	and      	r2, r1
    166a:	3a40      	cmpnei      	r2, 0
    166c:	0bfd      	bt      	0x1666	// 1666 <RTCIntHandler+0x26>
		RTC->CR &= ~0x1;
    166e:	9342      	ld.w      	r2, (r3, 0x8)
    1670:	3a80      	bclri      	r2, 0
    1672:	b342      	st.w      	r2, (r3, 0x8)
	}
	else if((RTC->IMCR&RTC_TRGEV1_INT)==RTC_TRGEV1_INT)
	{
		RTC->ICR=RTC_TRGEV1_INT;
	}
}
    1674:	1463      	ipop
    1676:	1461      	nir
	else if((RTC->MISR&ALRB_INT)==ALRB_INT)			//ALRBR				
    1678:	934a      	ld.w      	r2, (r3, 0x28)
    167a:	3102      	movi      	r1, 2
    167c:	6884      	and      	r2, r1
    167e:	3a40      	cmpnei      	r2, 0
    1680:	0c03      	bf      	0x1686	// 1686 <RTCIntHandler+0x46>
		RTC->ICR=RTC_TRGEV1_INT;
    1682:	b32b      	st.w      	r1, (r3, 0x2c)
}
    1684:	07f8      	br      	0x1674	// 1674 <RTCIntHandler+0x34>
	else if((RTC->IMCR&CPRD_INT)==CPRD_INT)			//CPRD
    1686:	9349      	ld.w      	r2, (r3, 0x24)
    1688:	3104      	movi      	r1, 4
    168a:	6884      	and      	r2, r1
    168c:	3a40      	cmpnei      	r2, 0
    168e:	0bfa      	bt      	0x1682	// 1682 <RTCIntHandler+0x42>
	else if((RTC->IMCR&RTC_TRGEV0_INT)==RTC_TRGEV0_INT)
    1690:	9349      	ld.w      	r2, (r3, 0x24)
    1692:	3108      	movi      	r1, 8
    1694:	6884      	and      	r2, r1
    1696:	3a40      	cmpnei      	r2, 0
    1698:	0bf5      	bt      	0x1682	// 1682 <RTCIntHandler+0x42>
	else if((RTC->IMCR&RTC_TRGEV1_INT)==RTC_TRGEV1_INT)
    169a:	9349      	ld.w      	r2, (r3, 0x24)
    169c:	3110      	movi      	r1, 16
    169e:	6884      	and      	r2, r1
    16a0:	3a40      	cmpnei      	r2, 0
    16a2:	0bf0      	bt      	0x1682	// 1682 <RTCIntHandler+0x42>
    16a4:	07e8      	br      	0x1674	// 1674 <RTCIntHandler+0x34>
    16a6:	0000      	bkpt
    16a8:	20000018 	.long	0x20000018
    16ac:	0000ca53 	.long	0x0000ca53

Disassembly of section .text.UART0IntHandler:

000016b0 <UART0IntHandler>:
//UART0 Interrupt
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void UART0IntHandler(void) 
{
    16b0:	1460      	nie
    16b2:	1462      	ipush
    // ISR content ...
	//Interupt
	if ((UART0->ISR&UART_RX_INT_S)==UART_RX_INT_S)
    16b4:	1071      	lrw      	r3, 0x20000040	// 16f8 <UART0IntHandler+0x48>
    16b6:	3102      	movi      	r1, 2
    16b8:	9360      	ld.w      	r3, (r3, 0x0)
    16ba:	9343      	ld.w      	r2, (r3, 0xc)
    16bc:	6884      	and      	r2, r1
    16be:	3a40      	cmpnei      	r2, 0
    16c0:	0c07      	bf      	0x16ce	// 16ce <UART0IntHandler+0x1e>
	{
		UART0->ISR=UART_RX_INT_S;
    16c2:	b323      	st.w      	r1, (r3, 0xc)
		RxDataFlag = TRUE;
    16c4:	106e      	lrw      	r3, 0x200000d8	// 16fc <UART0IntHandler+0x4c>
	}
	else if( (UART0->ISR&UART_TX_INT_S)==UART_TX_INT_S ) 
    {
		UART0->ISR=UART_TX_INT_S;
		TxDataFlag = TRUE;
    16c6:	3201      	movi      	r2, 1
    16c8:	a340      	st.b      	r2, (r3, 0x0)
	}
	else if ((UART0->ISR&UART_TX_IOV_S)==UART_TX_IOV_S)
	{
		UART0->ISR=UART_TX_IOV_S;
	}
}
    16ca:	1463      	ipop
    16cc:	1461      	nir
	else if( (UART0->ISR&UART_TX_INT_S)==UART_TX_INT_S ) 
    16ce:	9343      	ld.w      	r2, (r3, 0xc)
    16d0:	3101      	movi      	r1, 1
    16d2:	6884      	and      	r2, r1
    16d4:	3a40      	cmpnei      	r2, 0
    16d6:	0c04      	bf      	0x16de	// 16de <UART0IntHandler+0x2e>
		UART0->ISR=UART_TX_INT_S;
    16d8:	b323      	st.w      	r1, (r3, 0xc)
		TxDataFlag = TRUE;
    16da:	106a      	lrw      	r3, 0x200000d9	// 1700 <UART0IntHandler+0x50>
    16dc:	07f5      	br      	0x16c6	// 16c6 <UART0IntHandler+0x16>
	else if ((UART0->ISR&UART_RX_IOV_S)==UART_RX_IOV_S)
    16de:	9343      	ld.w      	r2, (r3, 0xc)
    16e0:	3108      	movi      	r1, 8
    16e2:	6884      	and      	r2, r1
    16e4:	3a40      	cmpnei      	r2, 0
    16e6:	0c03      	bf      	0x16ec	// 16ec <UART0IntHandler+0x3c>
		UART0->ISR=UART_TX_IOV_S;
    16e8:	b323      	st.w      	r1, (r3, 0xc)
}
    16ea:	07f0      	br      	0x16ca	// 16ca <UART0IntHandler+0x1a>
	else if ((UART0->ISR&UART_TX_IOV_S)==UART_TX_IOV_S)
    16ec:	9343      	ld.w      	r2, (r3, 0xc)
    16ee:	3104      	movi      	r1, 4
    16f0:	6884      	and      	r2, r1
    16f2:	3a40      	cmpnei      	r2, 0
    16f4:	0bfa      	bt      	0x16e8	// 16e8 <UART0IntHandler+0x38>
    16f6:	07ea      	br      	0x16ca	// 16ca <UART0IntHandler+0x1a>
    16f8:	20000040 	.long	0x20000040
    16fc:	200000d8 	.long	0x200000d8
    1700:	200000d9 	.long	0x200000d9

Disassembly of section .text.UART1IntHandler:

00001704 <UART1IntHandler>:
//UART1 Interrupt
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void UART1IntHandler(void) 
{
    1704:	1460      	nie
    1706:	1462      	ipush
    // ISR content ...
	//Interupt
	if ((UART1->ISR&UART_RX_INT_S)==UART_RX_INT_S)
    1708:	1071      	lrw      	r3, 0x2000003c	// 174c <UART1IntHandler+0x48>
    170a:	3102      	movi      	r1, 2
    170c:	9360      	ld.w      	r3, (r3, 0x0)
    170e:	9343      	ld.w      	r2, (r3, 0xc)
    1710:	6884      	and      	r2, r1
    1712:	3a40      	cmpnei      	r2, 0
    1714:	0c07      	bf      	0x1722	// 1722 <UART1IntHandler+0x1e>
	{
		UART1->ISR=UART_RX_INT_S;
    1716:	b323      	st.w      	r1, (r3, 0xc)
		RxDataFlag = TRUE;
    1718:	106e      	lrw      	r3, 0x200000d8	// 1750 <UART1IntHandler+0x4c>
	}
	else if( (UART1->ISR&UART_TX_INT_S)==UART_TX_INT_S ) 
    {
		UART1->ISR=UART_TX_INT_S;
		TxDataFlag = TRUE;
    171a:	3201      	movi      	r2, 1
    171c:	a340      	st.b      	r2, (r3, 0x0)
	}
	else if ((UART1->ISR&UART_TX_IOV_S)==UART_TX_IOV_S)
	{
		UART1->ISR=UART_TX_IOV_S;
	}
}
    171e:	1463      	ipop
    1720:	1461      	nir
	else if( (UART1->ISR&UART_TX_INT_S)==UART_TX_INT_S ) 
    1722:	9343      	ld.w      	r2, (r3, 0xc)
    1724:	3101      	movi      	r1, 1
    1726:	6884      	and      	r2, r1
    1728:	3a40      	cmpnei      	r2, 0
    172a:	0c04      	bf      	0x1732	// 1732 <UART1IntHandler+0x2e>
		UART1->ISR=UART_TX_INT_S;
    172c:	b323      	st.w      	r1, (r3, 0xc)
		TxDataFlag = TRUE;
    172e:	106a      	lrw      	r3, 0x200000d9	// 1754 <UART1IntHandler+0x50>
    1730:	07f5      	br      	0x171a	// 171a <UART1IntHandler+0x16>
	else if ((UART1->ISR&UART_RX_IOV_S)==UART_RX_IOV_S)
    1732:	9343      	ld.w      	r2, (r3, 0xc)
    1734:	3108      	movi      	r1, 8
    1736:	6884      	and      	r2, r1
    1738:	3a40      	cmpnei      	r2, 0
    173a:	0c03      	bf      	0x1740	// 1740 <UART1IntHandler+0x3c>
		UART1->ISR=UART_TX_IOV_S;
    173c:	b323      	st.w      	r1, (r3, 0xc)
}
    173e:	07f0      	br      	0x171e	// 171e <UART1IntHandler+0x1a>
	else if ((UART1->ISR&UART_TX_IOV_S)==UART_TX_IOV_S)
    1740:	9343      	ld.w      	r2, (r3, 0xc)
    1742:	3104      	movi      	r1, 4
    1744:	6884      	and      	r2, r1
    1746:	3a40      	cmpnei      	r2, 0
    1748:	0bfa      	bt      	0x173c	// 173c <UART1IntHandler+0x38>
    174a:	07ea      	br      	0x171e	// 171e <UART1IntHandler+0x1a>
    174c:	2000003c 	.long	0x2000003c
    1750:	200000d8 	.long	0x200000d8
    1754:	200000d9 	.long	0x200000d9

Disassembly of section .text.UART2IntHandler:

00001758 <UART2IntHandler>:
//UART2 Interrupt
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void UART2IntHandler(void) 
{
    1758:	1460      	nie
    175a:	1462      	ipush
    // ISR content ...
	//Interupt
	if ((UART2->ISR&UART_RX_INT_S)==UART_RX_INT_S)
    175c:	1071      	lrw      	r3, 0x20000038	// 17a0 <UART2IntHandler+0x48>
    175e:	3102      	movi      	r1, 2
    1760:	9360      	ld.w      	r3, (r3, 0x0)
    1762:	9343      	ld.w      	r2, (r3, 0xc)
    1764:	6884      	and      	r2, r1
    1766:	3a40      	cmpnei      	r2, 0
    1768:	0c07      	bf      	0x1776	// 1776 <UART2IntHandler+0x1e>
	{
		UART2->ISR=UART_RX_INT_S;
    176a:	b323      	st.w      	r1, (r3, 0xc)
		RxDataFlag = TRUE;
    176c:	106e      	lrw      	r3, 0x200000d8	// 17a4 <UART2IntHandler+0x4c>
	}
	else if( (UART2->ISR&UART_TX_INT_S)==UART_TX_INT_S ) 
    {
		UART2->ISR=UART_TX_INT_S;
		TxDataFlag = TRUE;
    176e:	3201      	movi      	r2, 1
    1770:	a340      	st.b      	r2, (r3, 0x0)
	}
	else if ((UART2->ISR&UART_TX_IOV_S)==UART_TX_IOV_S)
	{
		UART2->ISR=UART_TX_IOV_S;
	}
}
    1772:	1463      	ipop
    1774:	1461      	nir
	else if( (UART2->ISR&UART_TX_INT_S)==UART_TX_INT_S ) 
    1776:	9343      	ld.w      	r2, (r3, 0xc)
    1778:	3101      	movi      	r1, 1
    177a:	6884      	and      	r2, r1
    177c:	3a40      	cmpnei      	r2, 0
    177e:	0c04      	bf      	0x1786	// 1786 <UART2IntHandler+0x2e>
		UART2->ISR=UART_TX_INT_S;
    1780:	b323      	st.w      	r1, (r3, 0xc)
		TxDataFlag = TRUE;
    1782:	106a      	lrw      	r3, 0x200000d9	// 17a8 <UART2IntHandler+0x50>
    1784:	07f5      	br      	0x176e	// 176e <UART2IntHandler+0x16>
	else if ((UART2->ISR&UART_RX_IOV_S)==UART_RX_IOV_S)
    1786:	9343      	ld.w      	r2, (r3, 0xc)
    1788:	3108      	movi      	r1, 8
    178a:	6884      	and      	r2, r1
    178c:	3a40      	cmpnei      	r2, 0
    178e:	0c03      	bf      	0x1794	// 1794 <UART2IntHandler+0x3c>
		UART2->ISR=UART_TX_IOV_S;
    1790:	b323      	st.w      	r1, (r3, 0xc)
}
    1792:	07f0      	br      	0x1772	// 1772 <UART2IntHandler+0x1a>
	else if ((UART2->ISR&UART_TX_IOV_S)==UART_TX_IOV_S)
    1794:	9343      	ld.w      	r2, (r3, 0xc)
    1796:	3104      	movi      	r1, 4
    1798:	6884      	and      	r2, r1
    179a:	3a40      	cmpnei      	r2, 0
    179c:	0bfa      	bt      	0x1790	// 1790 <UART2IntHandler+0x38>
    179e:	07ea      	br      	0x1772	// 1772 <UART2IntHandler+0x1a>
    17a0:	20000038 	.long	0x20000038
    17a4:	200000d8 	.long	0x200000d8
    17a8:	200000d9 	.long	0x200000d9

Disassembly of section .text.I2CIntHandler:

000017ac <I2CIntHandler>:
//I2C Interrupt
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void I2CIntHandler(void) 
{
    17ac:	1460      	nie
    17ae:	1462      	ipush
    17b0:	14d0      	push      	r15
    // ISR content ...
	I2C_Slave_Receive();
    17b2:	e3fff97f 	bsr      	0xab0	// ab0 <I2C_Slave_Receive>
}
    17b6:	d9ee2000 	ld.w      	r15, (r14, 0x0)
    17ba:	1401      	addi      	r14, r14, 4
    17bc:	1463      	ipop
    17be:	1461      	nir

Disassembly of section .text.SPI0IntHandler:

000017c0 <SPI0IntHandler>:
//SPI Interrupt
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void SPI0IntHandler(void) 
{
    17c0:	1460      	nie
    17c2:	1462      	ipush
    // ISR content ...
	if((SPI0->MISR&SPI_PORIM)==SPI_PORIM)					//Receive Overrun Interrupt
    17c4:	106d      	lrw      	r3, 0x20000034	// 17f8 <SPI0IntHandler+0x38>
    17c6:	3101      	movi      	r1, 1
    17c8:	9360      	ld.w      	r3, (r3, 0x0)
    17ca:	9347      	ld.w      	r2, (r3, 0x1c)
    17cc:	6884      	and      	r2, r1
    17ce:	3a40      	cmpnei      	r2, 0
    17d0:	0c03      	bf      	0x17d6	// 17d6 <SPI0IntHandler+0x16>
			}
		}*/
	}
	else if((SPI0->MISR&SPI_TXIM)==SPI_TXIM)				//Transmit FIFO Interrupt
	{
		SPI0->ICR = SPI_TXIM;
    17d2:	b328      	st.w      	r1, (r3, 0x20)
	}

}
    17d4:	0410      	br      	0x17f4	// 17f4 <SPI0IntHandler+0x34>
	else if((SPI0->MISR&SPI_RTIM)==SPI_RTIM)				//Receive Timeout Interrupt
    17d6:	9347      	ld.w      	r2, (r3, 0x1c)
    17d8:	3102      	movi      	r1, 2
    17da:	6884      	and      	r2, r1
    17dc:	3a40      	cmpnei      	r2, 0
    17de:	0bfa      	bt      	0x17d2	// 17d2 <SPI0IntHandler+0x12>
	else if((SPI0->MISR&SPI_RXIM)==SPI_RXIM)				//Receive FIFO Interrupt,FIFO can be set 1/8,1/4,1/2 FIFO Interrupt
    17e0:	9347      	ld.w      	r2, (r3, 0x1c)
    17e2:	3104      	movi      	r1, 4
    17e4:	6884      	and      	r2, r1
    17e6:	3a40      	cmpnei      	r2, 0
    17e8:	0bf5      	bt      	0x17d2	// 17d2 <SPI0IntHandler+0x12>
	else if((SPI0->MISR&SPI_TXIM)==SPI_TXIM)				//Transmit FIFO Interrupt
    17ea:	9347      	ld.w      	r2, (r3, 0x1c)
    17ec:	3108      	movi      	r1, 8
    17ee:	6884      	and      	r2, r1
    17f0:	3a40      	cmpnei      	r2, 0
    17f2:	0bf0      	bt      	0x17d2	// 17d2 <SPI0IntHandler+0x12>
}
    17f4:	1463      	ipop
    17f6:	1461      	nir
    17f8:	20000034 	.long	0x20000034

Disassembly of section .text.SIO0IntHandler:

000017fc <SIO0IntHandler>:
//SIO Interrupt
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void SIO0IntHandler(void) 
{
    17fc:	1460      	nie
    17fe:	1462      	ipush
		delay_nms(10);
		SIO0->TXBUF=(0x03<<30)|(0x02<<28)|(0x03<<26)|(0x02<<24)|(0x03<<22)|(0x02<<20)|(0x03<<18)|(0x02<<16)|
				(0x01<<14)|(0x00<<12)|(0x01<<10)|(0x00<<8)|(0x01<<6)|(0x00<<4)|(0x01<<2)|(0x0<<0);		//0:D0,1:D1,2:DL,3:DH;	
	}*/
	
	if(SIO0->MISR&0X02)					//RXDNE
    1800:	107d      	lrw      	r3, 0x2000002c	// 1874 <SIO0IntHandler+0x78>
    1802:	3102      	movi      	r1, 2
    1804:	9360      	ld.w      	r3, (r3, 0x0)
    1806:	9349      	ld.w      	r2, (r3, 0x24)
    1808:	6884      	and      	r2, r1
    180a:	3a40      	cmpnei      	r2, 0
    180c:	0c13      	bf      	0x1832	// 1832 <SIO0IntHandler+0x36>
	{
		SIO0->ICR=0X02;
    180e:	b32b      	st.w      	r1, (r3, 0x2c)
		if(R_SIORX_count>=1)
    1810:	101a      	lrw      	r0, 0x20000e5c	// 1878 <SIO0IntHandler+0x7c>
    1812:	9040      	ld.w      	r2, (r0, 0x0)
    1814:	3a20      	cmplti      	r2, 1
    1816:	080c      	bt      	0x182e	// 182e <SIO0IntHandler+0x32>
		{
			R_SIORX_buf[R_SIORX_count]=SIO0->RXBUF&0xff000000;			//8bit
    1818:	9040      	ld.w      	r2, (r0, 0x0)
    181a:	9327      	ld.w      	r1, (r3, 0x1c)
    181c:	4938      	lsri      	r1, r1, 24
    181e:	4262      	lsli      	r3, r2, 2
    1820:	1057      	lrw      	r2, 0x20000e60	// 187c <SIO0IntHandler+0x80>
    1822:	4138      	lsli      	r1, r1, 24
    1824:	60c8      	addu      	r3, r2
    1826:	b320      	st.w      	r1, (r3, 0x0)
			nop;
    1828:	6c03      	mov      	r0, r0
			R_SIORX_count=0;
    182a:	3300      	movi      	r3, 0
    182c:	b060      	st.w      	r3, (r0, 0x0)
	}
	else if(SIO0->MISR&0X020)				//TIMEOUT
	{
		SIO0->ICR=0X20;
	}
}
    182e:	1463      	ipop
    1830:	1461      	nir
	else if(SIO0->MISR&0X08)					//RXBUFFULL	
    1832:	9349      	ld.w      	r2, (r3, 0x24)
    1834:	3108      	movi      	r1, 8
    1836:	6884      	and      	r2, r1
    1838:	3a40      	cmpnei      	r2, 0
    183a:	0c10      	bf      	0x185a	// 185a <SIO0IntHandler+0x5e>
		SIO0->ICR=0X08;
    183c:	b32b      	st.w      	r1, (r3, 0x2c)
		if(R_SIORX_count<1)
    183e:	102f      	lrw      	r1, 0x20000e5c	// 1878 <SIO0IntHandler+0x7c>
    1840:	9140      	ld.w      	r2, (r1, 0x0)
    1842:	3a20      	cmplti      	r2, 1
    1844:	0ff5      	bf      	0x182e	// 182e <SIO0IntHandler+0x32>
			R_SIORX_buf[R_SIORX_count]=SIO0->RXBUF;				//32bit
    1846:	9140      	ld.w      	r2, (r1, 0x0)
    1848:	9307      	ld.w      	r0, (r3, 0x1c)
    184a:	4262      	lsli      	r3, r2, 2
    184c:	104c      	lrw      	r2, 0x20000e60	// 187c <SIO0IntHandler+0x80>
    184e:	60c8      	addu      	r3, r2
    1850:	b300      	st.w      	r0, (r3, 0x0)
			R_SIORX_count++;
    1852:	9160      	ld.w      	r3, (r1, 0x0)
    1854:	2300      	addi      	r3, 1
    1856:	b160      	st.w      	r3, (r1, 0x0)
    1858:	07eb      	br      	0x182e	// 182e <SIO0IntHandler+0x32>
	else if(SIO0->MISR&0X010)				//BREAK
    185a:	9349      	ld.w      	r2, (r3, 0x24)
    185c:	3110      	movi      	r1, 16
    185e:	6884      	and      	r2, r1
    1860:	3a40      	cmpnei      	r2, 0
    1862:	0c03      	bf      	0x1868	// 1868 <SIO0IntHandler+0x6c>
		SIO0->ICR=0X20;
    1864:	b32b      	st.w      	r1, (r3, 0x2c)
}
    1866:	07e4      	br      	0x182e	// 182e <SIO0IntHandler+0x32>
	else if(SIO0->MISR&0X020)				//TIMEOUT
    1868:	9349      	ld.w      	r2, (r3, 0x24)
    186a:	3120      	movi      	r1, 32
    186c:	6884      	and      	r2, r1
    186e:	3a40      	cmpnei      	r2, 0
    1870:	0bfa      	bt      	0x1864	// 1864 <SIO0IntHandler+0x68>
    1872:	07de      	br      	0x182e	// 182e <SIO0IntHandler+0x32>
    1874:	2000002c 	.long	0x2000002c
    1878:	20000e5c 	.long	0x20000e5c
    187c:	20000e60 	.long	0x20000e60

Disassembly of section .text.EXI0IntHandler:

00001880 <EXI0IntHandler>:
//EXT0 Interrupt
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void EXI0IntHandler(void) 
{
    1880:	1460      	nie
    1882:	1462      	ipush
    // ISR content ...
	if ((SYSCON->EXIRS&EXI_PIN0)==EXI_PIN0) 
    1884:	1066      	lrw      	r3, 0x2000005c	// 189c <EXI0IntHandler+0x1c>
    1886:	3101      	movi      	r1, 1
    1888:	9360      	ld.w      	r3, (r3, 0x0)
    188a:	237f      	addi      	r3, 128
    188c:	934c      	ld.w      	r2, (r3, 0x30)
    188e:	6884      	and      	r2, r1
    1890:	3a40      	cmpnei      	r2, 0
    1892:	0c02      	bf      	0x1896	// 1896 <EXI0IntHandler+0x16>
	{
		SYSCON->EXICR = EXI_PIN0;
    1894:	b32b      	st.w      	r1, (r3, 0x2c)
	}
}
    1896:	1463      	ipop
    1898:	1461      	nir
    189a:	0000      	bkpt
    189c:	2000005c 	.long	0x2000005c

Disassembly of section .text.EXI1IntHandler:

000018a0 <EXI1IntHandler>:
//EXT1Interrupt
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void EXI1IntHandler(void) 
{
    18a0:	1460      	nie
    18a2:	1462      	ipush
    // ISR content ...
	if ((SYSCON->EXIRS&EXI_PIN1)==EXI_PIN1) 
    18a4:	1066      	lrw      	r3, 0x2000005c	// 18bc <EXI1IntHandler+0x1c>
    18a6:	3102      	movi      	r1, 2
    18a8:	9360      	ld.w      	r3, (r3, 0x0)
    18aa:	237f      	addi      	r3, 128
    18ac:	934c      	ld.w      	r2, (r3, 0x30)
    18ae:	6884      	and      	r2, r1
    18b0:	3a40      	cmpnei      	r2, 0
    18b2:	0c02      	bf      	0x18b6	// 18b6 <EXI1IntHandler+0x16>
	{
		SYSCON->EXICR = EXI_PIN1;
    18b4:	b32b      	st.w      	r1, (r3, 0x2c)
	}
}
    18b6:	1463      	ipop
    18b8:	1461      	nir
    18ba:	0000      	bkpt
    18bc:	2000005c 	.long	0x2000005c

Disassembly of section .text.EXI2to3IntHandler:

000018c0 <EXI2to3IntHandler>:
//EXI2 Interrupt
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void EXI2to3IntHandler(void) 
{
    18c0:	1460      	nie
    18c2:	1462      	ipush
    // ISR content ...
	if ((SYSCON->EXIRS&EXI_PIN2)==EXI_PIN2) 
    18c4:	1069      	lrw      	r3, 0x2000005c	// 18e8 <EXI2to3IntHandler+0x28>
    18c6:	3104      	movi      	r1, 4
    18c8:	9360      	ld.w      	r3, (r3, 0x0)
    18ca:	237f      	addi      	r3, 128
    18cc:	934c      	ld.w      	r2, (r3, 0x30)
    18ce:	6884      	and      	r2, r1
    18d0:	3a40      	cmpnei      	r2, 0
    18d2:	0c03      	bf      	0x18d8	// 18d8 <EXI2to3IntHandler+0x18>
	{
		SYSCON->EXICR = EXI_PIN2;
	} 
	else if ((SYSCON->EXIRS&EXI_PIN3)==EXI_PIN3) 
	{
		SYSCON->EXICR = EXI_PIN3;
    18d4:	b32b      	st.w      	r1, (r3, 0x2c)
	}
}
    18d6:	0406      	br      	0x18e2	// 18e2 <EXI2to3IntHandler+0x22>
	else if ((SYSCON->EXIRS&EXI_PIN3)==EXI_PIN3) 
    18d8:	934c      	ld.w      	r2, (r3, 0x30)
    18da:	3108      	movi      	r1, 8
    18dc:	6884      	and      	r2, r1
    18de:	3a40      	cmpnei      	r2, 0
    18e0:	0bfa      	bt      	0x18d4	// 18d4 <EXI2to3IntHandler+0x14>
}
    18e2:	1463      	ipop
    18e4:	1461      	nir
    18e6:	0000      	bkpt
    18e8:	2000005c 	.long	0x2000005c

Disassembly of section .text.EXI4to9IntHandler:

000018ec <EXI4to9IntHandler>:
void EXI4to9IntHandler(void) 
{
    18ec:	1460      	nie
    18ee:	1462      	ipush
    // ISR content ...
	if ((SYSCON->EXIRS&EXI_PIN4)==EXI_PIN4) 
    18f0:	1075      	lrw      	r3, 0x2000005c	// 1944 <EXI4to9IntHandler+0x58>
    18f2:	3280      	movi      	r2, 128
    18f4:	9360      	ld.w      	r3, (r3, 0x0)
    18f6:	60c8      	addu      	r3, r2
    18f8:	932c      	ld.w      	r1, (r3, 0x30)
    18fa:	3010      	movi      	r0, 16
    18fc:	6840      	and      	r1, r0
    18fe:	3940      	cmpnei      	r1, 0
    1900:	0c04      	bf      	0x1908	// 1908 <EXI4to9IntHandler+0x1c>
	{
		SYSCON->EXICR = EXI_PIN5;
	} 
	else if ((SYSCON->EXIRS&EXI_PIN6)==EXI_PIN6) 
	{
		SYSCON->EXICR = EXI_PIN6;
    1902:	b30b      	st.w      	r0, (r3, 0x2c)
	else if ((SYSCON->EXIRS&EXI_PIN9)==EXI_PIN9) 
	{
		SYSCON->EXICR = EXI_PIN9;
	} 

}
    1904:	1463      	ipop
    1906:	1461      	nir
	else if ((SYSCON->EXIRS&EXI_PIN5)==EXI_PIN5) 
    1908:	932c      	ld.w      	r1, (r3, 0x30)
    190a:	3020      	movi      	r0, 32
    190c:	6840      	and      	r1, r0
    190e:	3940      	cmpnei      	r1, 0
    1910:	0bf9      	bt      	0x1902	// 1902 <EXI4to9IntHandler+0x16>
	else if ((SYSCON->EXIRS&EXI_PIN6)==EXI_PIN6) 
    1912:	932c      	ld.w      	r1, (r3, 0x30)
    1914:	3040      	movi      	r0, 64
    1916:	6840      	and      	r1, r0
    1918:	3940      	cmpnei      	r1, 0
    191a:	0bf4      	bt      	0x1902	// 1902 <EXI4to9IntHandler+0x16>
	else if ((SYSCON->EXIRS&EXI_PIN7)==EXI_PIN7) 
    191c:	932c      	ld.w      	r1, (r3, 0x30)
    191e:	6848      	and      	r1, r2
    1920:	3940      	cmpnei      	r1, 0
    1922:	0c03      	bf      	0x1928	// 1928 <EXI4to9IntHandler+0x3c>
		SYSCON->EXICR = EXI_PIN9;
    1924:	b34b      	st.w      	r2, (r3, 0x2c)
}
    1926:	07ef      	br      	0x1904	// 1904 <EXI4to9IntHandler+0x18>
	else if ((SYSCON->EXIRS&EXI_PIN8)==EXI_PIN8) 
    1928:	3280      	movi      	r2, 128
    192a:	932c      	ld.w      	r1, (r3, 0x30)
    192c:	4241      	lsli      	r2, r2, 1
    192e:	6848      	and      	r1, r2
    1930:	3940      	cmpnei      	r1, 0
    1932:	0bf9      	bt      	0x1924	// 1924 <EXI4to9IntHandler+0x38>
	else if ((SYSCON->EXIRS&EXI_PIN9)==EXI_PIN9) 
    1934:	3280      	movi      	r2, 128
    1936:	932c      	ld.w      	r1, (r3, 0x30)
    1938:	4242      	lsli      	r2, r2, 2
    193a:	6848      	and      	r1, r2
    193c:	3940      	cmpnei      	r1, 0
    193e:	0bf3      	bt      	0x1924	// 1924 <EXI4to9IntHandler+0x38>
    1940:	07e2      	br      	0x1904	// 1904 <EXI4to9IntHandler+0x18>
    1942:	0000      	bkpt
    1944:	2000005c 	.long	0x2000005c

Disassembly of section .text.EXI10to15IntHandler:

00001948 <EXI10to15IntHandler>:
//EXI4 Interrupt
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void EXI10to15IntHandler(void) 
{
    1948:	1460      	nie
    194a:	1462      	ipush
    // ISR content ...
	if ((SYSCON->EXIRS&EXI_PIN10)==EXI_PIN10) 
    194c:	1076      	lrw      	r3, 0x2000005c	// 19a4 <EXI10to15IntHandler+0x5c>
    194e:	3280      	movi      	r2, 128
    1950:	9360      	ld.w      	r3, (r3, 0x0)
    1952:	237f      	addi      	r3, 128
    1954:	932c      	ld.w      	r1, (r3, 0x30)
    1956:	4243      	lsli      	r2, r2, 3
    1958:	6848      	and      	r1, r2
    195a:	3940      	cmpnei      	r1, 0
    195c:	0c03      	bf      	0x1962	// 1962 <EXI10to15IntHandler+0x1a>
	{
		SYSCON->EXICR = EXI_PIN14;
	}
	else if ((SYSCON->EXIRS&EXI_PIN15)==EXI_PIN15) 
	{
		SYSCON->EXICR = EXI_PIN15;
    195e:	b34b      	st.w      	r2, (r3, 0x2c)
	}
}
    1960:	041f      	br      	0x199e	// 199e <EXI10to15IntHandler+0x56>
	else if ((SYSCON->EXIRS&EXI_PIN11)==EXI_PIN11) 
    1962:	3280      	movi      	r2, 128
    1964:	932c      	ld.w      	r1, (r3, 0x30)
    1966:	4244      	lsli      	r2, r2, 4
    1968:	6848      	and      	r1, r2
    196a:	3940      	cmpnei      	r1, 0
    196c:	0bf9      	bt      	0x195e	// 195e <EXI10to15IntHandler+0x16>
	else if ((SYSCON->EXIRS&EXI_PIN12)==EXI_PIN12) 
    196e:	3280      	movi      	r2, 128
    1970:	932c      	ld.w      	r1, (r3, 0x30)
    1972:	4245      	lsli      	r2, r2, 5
    1974:	6848      	and      	r1, r2
    1976:	3940      	cmpnei      	r1, 0
    1978:	0bf3      	bt      	0x195e	// 195e <EXI10to15IntHandler+0x16>
	else if ((SYSCON->EXIRS&EXI_PIN13)==EXI_PIN13) 
    197a:	3280      	movi      	r2, 128
    197c:	932c      	ld.w      	r1, (r3, 0x30)
    197e:	4246      	lsli      	r2, r2, 6
    1980:	6848      	and      	r1, r2
    1982:	3940      	cmpnei      	r1, 0
    1984:	0bed      	bt      	0x195e	// 195e <EXI10to15IntHandler+0x16>
	else if ((SYSCON->EXIRS&EXI_PIN14)==EXI_PIN14) 
    1986:	3280      	movi      	r2, 128
    1988:	932c      	ld.w      	r1, (r3, 0x30)
    198a:	4247      	lsli      	r2, r2, 7
    198c:	6848      	and      	r1, r2
    198e:	3940      	cmpnei      	r1, 0
    1990:	0be7      	bt      	0x195e	// 195e <EXI10to15IntHandler+0x16>
	else if ((SYSCON->EXIRS&EXI_PIN15)==EXI_PIN15) 
    1992:	3280      	movi      	r2, 128
    1994:	932c      	ld.w      	r1, (r3, 0x30)
    1996:	4248      	lsli      	r2, r2, 8
    1998:	6848      	and      	r1, r2
    199a:	3940      	cmpnei      	r1, 0
    199c:	0be1      	bt      	0x195e	// 195e <EXI10to15IntHandler+0x16>
}
    199e:	1463      	ipop
    19a0:	1461      	nir
    19a2:	0000      	bkpt
    19a4:	2000005c 	.long	0x2000005c

Disassembly of section .text.LPTIntHandler:

000019a8 <LPTIntHandler>:
//LPT Interrupt
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void LPTIntHandler(void) 
{
    19a8:	1460      	nie
    19aa:	1462      	ipush
    // ISR content ...
	//Interupt
	if((LPT->MISR&LPT_TRGEV0)==LPT_TRGEV0)
    19ac:	106b      	lrw      	r3, 0x20000014	// 19d8 <LPTIntHandler+0x30>
    19ae:	3101      	movi      	r1, 1
    19b0:	9360      	ld.w      	r3, (r3, 0x0)
    19b2:	934e      	ld.w      	r2, (r3, 0x38)
    19b4:	6884      	and      	r2, r1
    19b6:	3a40      	cmpnei      	r2, 0
    19b8:	0c03      	bf      	0x19be	// 19be <LPTIntHandler+0x16>
	{
		LPT->ICR = LPT_MATCH;
	}
	else if((LPT->MISR&LPT_PEND)==LPT_PEND)
	{
		LPT->ICR = LPT_PEND;
    19ba:	b330      	st.w      	r1, (r3, 0x40)
	}
}
    19bc:	040b      	br      	0x19d2	// 19d2 <LPTIntHandler+0x2a>
	else if((LPT->MISR&LPT_MATCH)==LPT_MATCH)
    19be:	934e      	ld.w      	r2, (r3, 0x38)
    19c0:	3102      	movi      	r1, 2
    19c2:	6884      	and      	r2, r1
    19c4:	3a40      	cmpnei      	r2, 0
    19c6:	0bfa      	bt      	0x19ba	// 19ba <LPTIntHandler+0x12>
	else if((LPT->MISR&LPT_PEND)==LPT_PEND)
    19c8:	934e      	ld.w      	r2, (r3, 0x38)
    19ca:	3104      	movi      	r1, 4
    19cc:	6884      	and      	r2, r1
    19ce:	3a40      	cmpnei      	r2, 0
    19d0:	0bf5      	bt      	0x19ba	// 19ba <LPTIntHandler+0x12>
}
    19d2:	1463      	ipop
    19d4:	1461      	nir
    19d6:	0000      	bkpt
    19d8:	20000014 	.long	0x20000014

Disassembly of section .text.BT0IntHandler:

000019dc <BT0IntHandler>:
//BT0 Interrupt
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void BT0IntHandler(void) 
{
    19dc:	1460      	nie
    19de:	1462      	ipush
    19e0:	14d2      	push      	r4-r5, r15
    // ISR content ...
	if((BT0->MISR&BT_PEND)==BT_PEND)
    19e2:	10b3      	lrw      	r5, 0x2000000c	// 1a2c <BT0IntHandler+0x50>
    19e4:	3401      	movi      	r4, 1
    19e6:	9560      	ld.w      	r3, (r5, 0x0)
    19e8:	934c      	ld.w      	r2, (r3, 0x30)
    19ea:	6890      	and      	r2, r4
    19ec:	3a40      	cmpnei      	r2, 0
    19ee:	0c0c      	bf      	0x1a06	// 1a06 <BT0IntHandler+0x2a>
	{
		//if(xTaskGetSchedulerState()!=taskSCHEDULER_NOT_STARTED)//系统已经运行 
		{ 
			xPortSysTickHandler();
    19f0:	e00006a8 	bsr      	0x2740	// 2740 <xPortSysTickHandler>
		}
		BT0->ICR = BT_PEND;
    19f4:	9560      	ld.w      	r3, (r5, 0x0)
    19f6:	b38d      	st.w      	r4, (r3, 0x34)
	} 
	else if((BT0->MISR&BT_EVTRG)==BT_EVTRG)
	{
		BT0->ICR = BT_EVTRG;
	} 
}
    19f8:	d9ee2002 	ld.w      	r15, (r14, 0x8)
    19fc:	98a1      	ld.w      	r5, (r14, 0x4)
    19fe:	9880      	ld.w      	r4, (r14, 0x0)
    1a00:	1403      	addi      	r14, r14, 12
    1a02:	1463      	ipop
    1a04:	1461      	nir
	else if((BT0->MISR&BT_CMP)==BT_CMP)
    1a06:	934c      	ld.w      	r2, (r3, 0x30)
    1a08:	3102      	movi      	r1, 2
    1a0a:	6884      	and      	r2, r1
    1a0c:	3a40      	cmpnei      	r2, 0
    1a0e:	0c03      	bf      	0x1a14	// 1a14 <BT0IntHandler+0x38>
		BT0->ICR = BT_EVTRG;
    1a10:	b32d      	st.w      	r1, (r3, 0x34)
}
    1a12:	07f3      	br      	0x19f8	// 19f8 <BT0IntHandler+0x1c>
	else if((BT0->MISR&BT_OVF)==BT_OVF)
    1a14:	934c      	ld.w      	r2, (r3, 0x30)
    1a16:	3104      	movi      	r1, 4
    1a18:	6884      	and      	r2, r1
    1a1a:	3a40      	cmpnei      	r2, 0
    1a1c:	0bfa      	bt      	0x1a10	// 1a10 <BT0IntHandler+0x34>
	else if((BT0->MISR&BT_EVTRG)==BT_EVTRG)
    1a1e:	934c      	ld.w      	r2, (r3, 0x30)
    1a20:	3108      	movi      	r1, 8
    1a22:	6884      	and      	r2, r1
    1a24:	3a40      	cmpnei      	r2, 0
    1a26:	0bf5      	bt      	0x1a10	// 1a10 <BT0IntHandler+0x34>
    1a28:	07e8      	br      	0x19f8	// 19f8 <BT0IntHandler+0x1c>
    1a2a:	0000      	bkpt
    1a2c:	2000000c 	.long	0x2000000c

Disassembly of section .text.BT1IntHandler:

00001a30 <BT1IntHandler>:
//BT1 Interrupt
//EntryParameter:NONE
//ReturnValue:NONE
/*************************************************************/
void BT1IntHandler(void) 
{
    1a30:	1460      	nie
    1a32:	1462      	ipush
    // ISR content ...
	if((BT1->MISR&BT_PEND)==BT_PEND)
    1a34:	106f      	lrw      	r3, 0x20000008	// 1a70 <BT1IntHandler+0x40>
    1a36:	3101      	movi      	r1, 1
    1a38:	9360      	ld.w      	r3, (r3, 0x0)
    1a3a:	934c      	ld.w      	r2, (r3, 0x30)
    1a3c:	6884      	and      	r2, r1
    1a3e:	3a40      	cmpnei      	r2, 0
    1a40:	0c03      	bf      	0x1a46	// 1a46 <BT1IntHandler+0x16>
	{
		BT1->ICR = BT_OVF;
	} 
	else if((BT0->MISR&BT_EVTRG)==BT_EVTRG)
	{
		BT1->ICR = BT_EVTRG;
    1a42:	b32d      	st.w      	r1, (r3, 0x34)
	} 
}
    1a44:	0409      	br      	0x1a56	// 1a56 <BT1IntHandler+0x26>
	else if((BT0->MISR&BT_CMP)==BT_CMP)
    1a46:	104c      	lrw      	r2, 0x2000000c	// 1a74 <BT1IntHandler+0x44>
    1a48:	3002      	movi      	r0, 2
    1a4a:	9240      	ld.w      	r2, (r2, 0x0)
    1a4c:	922c      	ld.w      	r1, (r2, 0x30)
    1a4e:	6840      	and      	r1, r0
    1a50:	3940      	cmpnei      	r1, 0
    1a52:	0c04      	bf      	0x1a5a	// 1a5a <BT1IntHandler+0x2a>
		BT1->ICR = BT_OVF;
    1a54:	b30d      	st.w      	r0, (r3, 0x34)
}
    1a56:	1463      	ipop
    1a58:	1461      	nir
	else if((BT0->MISR&BT_OVF)==BT_OVF)
    1a5a:	922c      	ld.w      	r1, (r2, 0x30)
    1a5c:	3004      	movi      	r0, 4
    1a5e:	6840      	and      	r1, r0
    1a60:	3940      	cmpnei      	r1, 0
    1a62:	0bf9      	bt      	0x1a54	// 1a54 <BT1IntHandler+0x24>
	else if((BT0->MISR&BT_EVTRG)==BT_EVTRG)
    1a64:	924c      	ld.w      	r2, (r2, 0x30)
    1a66:	3108      	movi      	r1, 8
    1a68:	6884      	and      	r2, r1
    1a6a:	3a40      	cmpnei      	r2, 0
    1a6c:	0beb      	bt      	0x1a42	// 1a42 <BT1IntHandler+0x12>
    1a6e:	07f4      	br      	0x1a56	// 1a56 <BT1IntHandler+0x26>
    1a70:	20000008 	.long	0x20000008
    1a74:	2000000c 	.long	0x2000000c

Disassembly of section .text.PriviledgeVioHandler:

00001a78 <PriviledgeVioHandler>:
    1a78:	783c      	jmp      	r15

Disassembly of section .text.PendTrapHandler:

00001a7a <PendTrapHandler>:
    // ISR content ...

}

void PendTrapHandler(void) 
{
    1a7a:	1460      	nie
    1a7c:	1462      	ipush
    // ISR content ...

}
    1a7e:	1463      	ipop
    1a80:	1461      	nir

Disassembly of section .text.Trap3Handler:

00001a82 <Trap3Handler>:
    1a82:	1460      	nie
    1a84:	1462      	ipush
    1a86:	1463      	ipop
    1a88:	1461      	nir

Disassembly of section .text.Trap2Handler:

00001a8a <Trap2Handler>:
    1a8a:	1460      	nie
    1a8c:	1462      	ipush
    1a8e:	1463      	ipop
    1a90:	1461      	nir

Disassembly of section .text.Trap1Handler:

00001a92 <Trap1Handler>:
    1a92:	1460      	nie
    1a94:	1462      	ipush
    1a96:	1463      	ipop
    1a98:	1461      	nir

Disassembly of section .text.Trap0Handler:

00001a9a <Trap0Handler>:
    1a9a:	1460      	nie
    1a9c:	1462      	ipush
    1a9e:	1463      	ipop
    1aa0:	1461      	nir

Disassembly of section .text.UnrecExecpHandler:

00001aa2 <UnrecExecpHandler>:
    1aa2:	1460      	nie
    1aa4:	1462      	ipush
    1aa6:	1463      	ipop
    1aa8:	1461      	nir

Disassembly of section .text.BreakPointHandler:

00001aaa <BreakPointHandler>:
    1aaa:	1460      	nie
    1aac:	1462      	ipush
    1aae:	1463      	ipop
    1ab0:	1461      	nir

Disassembly of section .text.AccessErrHandler:

00001ab2 <AccessErrHandler>:
    1ab2:	1460      	nie
    1ab4:	1462      	ipush
    1ab6:	1463      	ipop
    1ab8:	1461      	nir

Disassembly of section .text.IllegalInstrHandler:

00001aba <IllegalInstrHandler>:
    1aba:	1460      	nie
    1abc:	1462      	ipush
    1abe:	1463      	ipop
    1ac0:	1461      	nir

Disassembly of section .text.MisalignedHandler:

00001ac2 <MisalignedHandler>:
    1ac2:	1460      	nie
    1ac4:	1462      	ipush
    1ac6:	1463      	ipop
    1ac8:	1461      	nir

Disassembly of section .text.CNTAIntHandler:

00001aca <CNTAIntHandler>:
    1aca:	1460      	nie
    1acc:	1462      	ipush
    1ace:	1463      	ipop
    1ad0:	1461      	nir

Disassembly of section .text.ADCIntHandler:

00001ad2 <ADCIntHandler>:
    1ad2:	1460      	nie
    1ad4:	1462      	ipush
    1ad6:	1463      	ipop
    1ad8:	1461      	nir

Disassembly of section .text.Task1:

00001adc <Task1>:




void Task1()
{
    1adc:	14d1      	push      	r4, r15
	while(1)
	{
		printf("Task1 is running!!!\r\n");
    1ade:	1085      	lrw      	r4, 0x2a08	// 1af0 <Task1+0x14>
    1ae0:	6c13      	mov      	r0, r4
    1ae2:	e3fff3db 	bsr      	0x298	// 298 <__GI_puts>
		vTaskDelay(1000);
    1ae6:	30fa      	movi      	r0, 250
    1ae8:	4002      	lsli      	r0, r0, 2
    1aea:	e0000445 	bsr      	0x2374	// 2374 <vTaskDelay>
    1aee:	07f9      	br      	0x1ae0	// 1ae0 <Task1+0x4>
    1af0:	00002a08 	.long	0x00002a08

Disassembly of section .text.Task2:

00001af4 <Task2>:
	}
}


void Task2()
{
    1af4:	14d1      	push      	r4, r15
	
	while(1)
	{
		printf("Task2 is running!!!\r\n");
    1af6:	1085      	lrw      	r4, 0x2a1d	// 1b08 <Task2+0x14>
    1af8:	6c13      	mov      	r0, r4
    1afa:	e3fff3cf 	bsr      	0x298	// 298 <__GI_puts>
		vTaskDelay(1000);
    1afe:	30fa      	movi      	r0, 250
    1b00:	4002      	lsli      	r0, r0, 2
    1b02:	e0000439 	bsr      	0x2374	// 2374 <vTaskDelay>
    1b06:	07f9      	br      	0x1af8	// 1af8 <Task2+0x4>
    1b08:	00002a1d 	.long	0x00002a1d

Disassembly of section .text.StartTask:

00001b0c <StartTask>:
	}
}

void StartTask()
{
    1b0c:	14d0      	push      	r15
    1b0e:	1422      	subi      	r14, r14, 8
	printf("StartTask is running!!!\r\n");
    1b10:	1019      	lrw      	r0, 0x2a32	// 1b74 <StartTask+0x68>
    1b12:	e3fff3c3 	bsr      	0x298	// 298 <__GI_puts>
	
	taskENTER_CRITICAL();
    1b16:	e00005f1 	bsr      	0x26f8	// 26f8 <vPortEnterCritical>
	
	if(pdPASS != xTaskCreate((TaskFunction_t )Task1, 
    1b1a:	1078      	lrw      	r3, 0x20000e90	// 1b78 <StartTask+0x6c>
    1b1c:	3240      	movi      	r2, 64
    1b1e:	b861      	st.w      	r3, (r14, 0x4)
    1b20:	3302      	movi      	r3, 2
    1b22:	b860      	st.w      	r3, (r14, 0x0)
    1b24:	3300      	movi      	r3, 0
    1b26:	1036      	lrw      	r1, 0x2a4b	// 1b7c <StartTask+0x70>
    1b28:	1016      	lrw      	r0, 0x1adc	// 1b80 <StartTask+0x74>
    1b2a:	e0000169 	bsr      	0x1dfc	// 1dfc <xTaskCreate>
    1b2e:	3841      	cmpnei      	r0, 1
    1b30:	0c1e      	bf      	0x1b6c	// 1b6c <StartTask+0x60>
							 (uint16_t       )TASK1_STK_SIZE,  
							 (void*          )NULL,  
							 (UBaseType_t    )TASK1_PRIORITY, 
							 (TaskHandle_t*  )&TASK1_HANDLE))
	{
		printf("Task1 create fail!!!\r\n");
    1b32:	1015      	lrw      	r0, 0x2a51	// 1b84 <StartTask+0x78>
	}
	else 
	{
		printf("Task1 create sucess!!!\r\n");
    1b34:	e3fff3b2 	bsr      	0x298	// 298 <__GI_puts>
	}
	
	 
	if(pdPASS != xTaskCreate((TaskFunction_t )Task2, 
    1b38:	1074      	lrw      	r3, 0x20000e8c	// 1b88 <StartTask+0x7c>
    1b3a:	3240      	movi      	r2, 64
    1b3c:	b861      	st.w      	r3, (r14, 0x4)
    1b3e:	3303      	movi      	r3, 3
    1b40:	b860      	st.w      	r3, (r14, 0x0)
    1b42:	3300      	movi      	r3, 0
    1b44:	1032      	lrw      	r1, 0x2a7f	// 1b8c <StartTask+0x80>
    1b46:	1013      	lrw      	r0, 0x1af4	// 1b90 <StartTask+0x84>
    1b48:	e000015a 	bsr      	0x1dfc	// 1dfc <xTaskCreate>
    1b4c:	3841      	cmpnei      	r0, 1
    1b4e:	0c11      	bf      	0x1b70	// 1b70 <StartTask+0x64>
							 (uint16_t       )TASK2_STK_SIZE,
							 (void*          )NULL,
							 (UBaseType_t    )TASK2_PRIORITY,
							 (TaskHandle_t*  )&TASK2_HANDLE))
	{
		printf("task2 create fail!!!\r\n");
    1b50:	1011      	lrw      	r0, 0x2a85	// 1b94 <StartTask+0x88>
	}
	else 
	{
		printf("Task2 create sucess!!!\r\n");
    1b52:	e3fff3a3 	bsr      	0x298	// 298 <__GI_puts>
	}
	
	printf("StartTask is deleted !!!\r\n");
    1b56:	1011      	lrw      	r0, 0x2ab3	// 1b98 <StartTask+0x8c>
    1b58:	e3fff3a0 	bsr      	0x298	// 298 <__GI_puts>
	vTaskDelete(STARTTASK_HANDLE);
    1b5c:	1070      	lrw      	r3, 0x20000e88	// 1b9c <StartTask+0x90>
    1b5e:	9300      	ld.w      	r0, (r3, 0x0)
    1b60:	e0000230 	bsr      	0x1fc0	// 1fc0 <vTaskDelete>
	
	taskEXIT_CRITICAL();
    1b64:	e00005d4 	bsr      	0x270c	// 270c <vPortExitCritical>
}
    1b68:	1402      	addi      	r14, r14, 8
    1b6a:	1490      	pop      	r15
		printf("Task1 create sucess!!!\r\n");
    1b6c:	100d      	lrw      	r0, 0x2a67	// 1ba0 <StartTask+0x94>
    1b6e:	07e3      	br      	0x1b34	// 1b34 <StartTask+0x28>
		printf("Task2 create sucess!!!\r\n");
    1b70:	100d      	lrw      	r0, 0x2a9b	// 1ba4 <StartTask+0x98>
    1b72:	07f0      	br      	0x1b52	// 1b52 <StartTask+0x46>
    1b74:	00002a32 	.long	0x00002a32
    1b78:	20000e90 	.long	0x20000e90
    1b7c:	00002a4b 	.long	0x00002a4b
    1b80:	00001adc 	.long	0x00001adc
    1b84:	00002a51 	.long	0x00002a51
    1b88:	20000e8c 	.long	0x20000e8c
    1b8c:	00002a7f 	.long	0x00002a7f
    1b90:	00001af4 	.long	0x00001af4
    1b94:	00002a85 	.long	0x00002a85
    1b98:	00002ab3 	.long	0x00002ab3
    1b9c:	20000e88 	.long	0x20000e88
    1ba0:	00002a67 	.long	0x00002a67
    1ba4:	00002a9b 	.long	0x00002a9b

Disassembly of section .text.fputc:

00001ba8 <fputc>:
{
    1ba8:	14d2      	push      	r4-r5, r15
    if (ch == '\n') {
    1baa:	384a      	cmpnei      	r0, 10
{
    1bac:	6d03      	mov      	r4, r0
    1bae:	10a7      	lrw      	r5, 0x2000003c	// 1bc8 <fputc+0x20>
    if (ch == '\n') {
    1bb0:	0805      	bt      	0x1bba	// 1bba <fputc+0x12>
        UARTTxByte(UART1,'\r');
    1bb2:	310d      	movi      	r1, 13
    1bb4:	9500      	ld.w      	r0, (r5, 0x0)
    1bb6:	e3fffa07 	bsr      	0xfc4	// fc4 <UARTTxByte>
    UARTTxByte(UART1, ch);
    1bba:	9500      	ld.w      	r0, (r5, 0x0)
    1bbc:	7450      	zextb      	r1, r4
    1bbe:	e3fffa03 	bsr      	0xfc4	// fc4 <UARTTxByte>
}
    1bc2:	3000      	movi      	r0, 0
    1bc4:	1492      	pop      	r4-r5, r15
    1bc6:	0000      	bkpt
    1bc8:	2000003c 	.long	0x2000003c

Disassembly of section .text.startup.main:

00001bcc <main>:

/***************************************************/
//main
/**************************************************/
int main(void) 
{
    1bcc:	14d0      	push      	r15
    1bce:	1422      	subi      	r14, r14, 8
	APT32S1028_init();
    1bd0:	e3fffad4 	bsr      	0x1178	// 1178 <APT32S1028_init>
	
	printf("--->This is APT1028 FreeRTOS demo\r\n");
    1bd4:	100d      	lrw      	r0, 0x2acd	// 1c08 <main+0x3c>
    1bd6:	e3fff361 	bsr      	0x298	// 298 <__GI_puts>

	if(pdPASS != xTaskCreate((TaskFunction_t)StartTask, 
    1bda:	106d      	lrw      	r3, 0x20000e88	// 1c0c <main+0x40>
    1bdc:	3280      	movi      	r2, 128
    1bde:	b861      	st.w      	r3, (r14, 0x4)
    1be0:	3301      	movi      	r3, 1
    1be2:	b860      	st.w      	r3, (r14, 0x0)
    1be4:	4241      	lsli      	r2, r2, 1
    1be6:	3300      	movi      	r3, 0
    1be8:	102a      	lrw      	r1, 0x2af0	// 1c10 <main+0x44>
    1bea:	100b      	lrw      	r0, 0x1b0c	// 1c14 <main+0x48>
    1bec:	e0000108 	bsr      	0x1dfc	// 1dfc <xTaskCreate>
    1bf0:	3841      	cmpnei      	r0, 1
    1bf2:	0c09      	bf      	0x1c04	// 1c04 <main+0x38>
							(uint16_t       )STARTTASK_STK_SIZE,  
							(void*          )NULL,  
							(UBaseType_t    )STARTTASK_PRIORITY, 
							(TaskHandle_t*  )&STARTTASK_HANDLE))
	{
		printf("StartTask create fail!!!\r\n");
    1bf4:	1009      	lrw      	r0, 0x2afa	// 1c18 <main+0x4c>
	}
	else 
	{
		printf("StartTask create sucess!!!\r\n");
    1bf6:	e3fff351 	bsr      	0x298	// 298 <__GI_puts>
	}
	
	vTaskStartScheduler();  
    1bfa:	e0000241 	bsr      	0x207c	// 207c <vTaskStartScheduler>
	

    while(1)
	{
		SYSCON_IWDCNT_Reload(); 
    1bfe:	e3fff903 	bsr      	0xe04	// e04 <SYSCON_IWDCNT_Reload>
    1c02:	07fe      	br      	0x1bfe	// 1bfe <main+0x32>
		printf("StartTask create sucess!!!\r\n");
    1c04:	1006      	lrw      	r0, 0x2b14	// 1c1c <main+0x50>
    1c06:	07f8      	br      	0x1bf6	// 1bf6 <main+0x2a>
    1c08:	00002acd 	.long	0x00002acd
    1c0c:	20000e88 	.long	0x20000e88
    1c10:	00002af0 	.long	0x00002af0
    1c14:	00001b0c 	.long	0x00001b0c
    1c18:	00002afa 	.long	0x00002afa
    1c1c:	00002b14 	.long	0x00002b14

Disassembly of section .text.__udivsi3:

00001c20 <__udivsi3>:
					);
					
	return HWD->QUOTIENT;
}
 unsigned int __udivsi3 ( unsigned int a,  unsigned int b)
{   
    1c20:	14c1      	push      	r4
	int PSR;
	__asm volatile(
    1c22:	c0006023 	mfcr      	r3, cr<0, 0>
    1c26:	c0807020 	psrclr      	ie
					"mfcr %0 , psr \n\r"
					"psrclr ie \n\r"
					: "=r"(PSR)
				   );
	
	HWD->CR = 1;
    1c2a:	1046      	lrw      	r2, 0x20000000	// 1c40 <__udivsi3+0x20>
    1c2c:	3401      	movi      	r4, 1
    1c2e:	9240      	ld.w      	r2, (r2, 0x0)
    1c30:	b284      	st.w      	r4, (r2, 0x10)
	HWD->DIVIDENT = a;
	HWD->DIVISOR = b;

	PSR |= 0x80000000;
    1c32:	3bbf      	bseti      	r3, 31
	HWD->DIVIDENT = a;
    1c34:	b200      	st.w      	r0, (r2, 0x0)
	HWD->DIVISOR = b;
    1c36:	b221      	st.w      	r1, (r2, 0x4)
	__asm volatile(
    1c38:	c0036420 	mtcr      	r3, cr<0, 0>
					 "mtcr %0 , psr \n\r"
					 : 
					 :"r"(PSR)
					);

	return HWD->QUOTIENT;
    1c3c:	9202      	ld.w      	r0, (r2, 0x8)
}
    1c3e:	1481      	pop      	r4
    1c40:	20000000 	.long	0x20000000

Disassembly of section .text.__umodsi3:

00001c44 <__umodsi3>:
					);	
	return HWD->REMAIN;
}

unsigned int __umodsi3 ( unsigned int a,  unsigned int b)
{   
    1c44:	14c1      	push      	r4
	int PSR;
	__asm volatile(
    1c46:	c0006023 	mfcr      	r3, cr<0, 0>
    1c4a:	c0807020 	psrclr      	ie
					"mfcr %0 , psr \n\r"
					"psrclr ie \n\r"
					: "=r"(PSR)
				   );
	
	HWD->CR = 1;
    1c4e:	1046      	lrw      	r2, 0x20000000	// 1c64 <__umodsi3+0x20>
    1c50:	3401      	movi      	r4, 1
    1c52:	9240      	ld.w      	r2, (r2, 0x0)
    1c54:	b284      	st.w      	r4, (r2, 0x10)
	HWD->DIVIDENT = a;
	HWD->DIVISOR = b;

	PSR |= 0x80000000;
    1c56:	3bbf      	bseti      	r3, 31
	HWD->DIVIDENT = a;
    1c58:	b200      	st.w      	r0, (r2, 0x0)
	HWD->DIVISOR = b;
    1c5a:	b221      	st.w      	r1, (r2, 0x4)
	__asm volatile(
    1c5c:	c0036420 	mtcr      	r3, cr<0, 0>
					 "mtcr %0 , psr \n\r"
					 : 
					 :"r"(PSR)
					);	
	return HWD->REMAIN;
    1c60:	9203      	ld.w      	r0, (r2, 0xc)
}
    1c62:	1481      	pop      	r4
    1c64:	20000000 	.long	0x20000000

Disassembly of section .text.CK_CPU_EnAllNormalIrq:

00001c68 <CK_CPU_EnAllNormalIrq>:
}


void CK_CPU_EnAllNormalIrq(void)
{
  asm  ("psrset ee,ie");
    1c68:	c1807420 	psrset      	ee, ie
}
    1c6c:	783c      	jmp      	r15

Disassembly of section .text.vListInitialise:

00001c6e <vListInitialise>:
void vListInitialise( List_t * const pxList )
{
    /* The list structure contains a list item which is used to mark the
     * end of the list.  To initialise the list the list end is inserted
     * as the only list entry. */
    pxList->pxIndex = ( ListItem_t * ) &( pxList->xListEnd ); /*lint !e826 !e740 !e9087 The mini list structure is used as the list end to save RAM.  This is checked and valid. */
    1c6e:	587e      	addi      	r3, r0, 8

    listSET_FIRST_LIST_ITEM_INTEGRITY_CHECK_VALUE( &( pxList->xListEnd ) );

    /* The list end value is the highest possible value in the list to
     * ensure it remains at the end of the list. */
    pxList->xListEnd.xItemValue = portMAX_DELAY;
    1c70:	3200      	movi      	r2, 0
    pxList->pxIndex = ( ListItem_t * ) &( pxList->xListEnd ); /*lint !e826 !e740 !e9087 The mini list structure is used as the list end to save RAM.  This is checked and valid. */
    1c72:	b061      	st.w      	r3, (r0, 0x4)
    pxList->xListEnd.xItemValue = portMAX_DELAY;
    1c74:	2a00      	subi      	r2, 1

    /* The list end next and previous pointers point to itself so we know
     * when the list is empty. */
    pxList->xListEnd.pxNext = ( ListItem_t * ) &( pxList->xListEnd );     /*lint !e826 !e740 !e9087 The mini list structure is used as the list end to save RAM.  This is checked and valid. */
    1c76:	b063      	st.w      	r3, (r0, 0xc)
    pxList->xListEnd.pxPrevious = ( ListItem_t * ) &( pxList->xListEnd ); /*lint !e826 !e740 !e9087 The mini list structure is used as the list end to save RAM.  This is checked and valid. */
    1c78:	b064      	st.w      	r3, (r0, 0x10)
        pxList->xListEnd.pxContainer = NULL;
        listSET_SECOND_LIST_ITEM_INTEGRITY_CHECK_VALUE( &( pxList->xListEnd ) );
    }
    #endif

    pxList->uxNumberOfItems = ( UBaseType_t ) 0U;
    1c7a:	3300      	movi      	r3, 0
    pxList->xListEnd.xItemValue = portMAX_DELAY;
    1c7c:	b042      	st.w      	r2, (r0, 0x8)
    pxList->uxNumberOfItems = ( UBaseType_t ) 0U;
    1c7e:	b060      	st.w      	r3, (r0, 0x0)

    /* Write known values into the list if
     * configUSE_LIST_DATA_INTEGRITY_CHECK_BYTES is set to 1. */
    listSET_LIST_INTEGRITY_CHECK_1_VALUE( pxList );
    listSET_LIST_INTEGRITY_CHECK_2_VALUE( pxList );
}
    1c80:	783c      	jmp      	r15

Disassembly of section .text.vListInitialiseItem:

00001c82 <vListInitialiseItem>:
/*-----------------------------------------------------------*/

void vListInitialiseItem( ListItem_t * const pxItem )
{
    /* Make sure the list item is not recorded as being on a list. */
    pxItem->pxContainer = NULL;
    1c82:	3300      	movi      	r3, 0
    1c84:	b064      	st.w      	r3, (r0, 0x10)

    /* Write known values into the list item if
     * configUSE_LIST_DATA_INTEGRITY_CHECK_BYTES is set to 1. */
    listSET_FIRST_LIST_ITEM_INTEGRITY_CHECK_VALUE( pxItem );
    listSET_SECOND_LIST_ITEM_INTEGRITY_CHECK_VALUE( pxItem );
}
    1c86:	783c      	jmp      	r15

Disassembly of section .text.vListInsertEnd:

00001c88 <vListInsertEnd>:
/*-----------------------------------------------------------*/

void vListInsertEnd( List_t * const pxList,
                     ListItem_t * const pxNewListItem )
{
    ListItem_t * const pxIndex = pxList->pxIndex;
    1c88:	9061      	ld.w      	r3, (r0, 0x4)

    /* Insert a new list item into pxList, but rather than sort the list,
     * makes the new list item the last item to be removed by a call to
     * listGET_OWNER_OF_NEXT_ENTRY(). */
    pxNewListItem->pxNext = pxIndex;
    pxNewListItem->pxPrevious = pxIndex->pxPrevious;
    1c8a:	9342      	ld.w      	r2, (r3, 0x8)
    1c8c:	b142      	st.w      	r2, (r1, 0x8)

    /* Only used during decision coverage testing. */
    mtCOVERAGE_TEST_DELAY();

    pxIndex->pxPrevious->pxNext = pxNewListItem;
    1c8e:	9342      	ld.w      	r2, (r3, 0x8)
    pxNewListItem->pxNext = pxIndex;
    1c90:	b161      	st.w      	r3, (r1, 0x4)
    pxIndex->pxPrevious->pxNext = pxNewListItem;
    1c92:	b221      	st.w      	r1, (r2, 0x4)
    pxIndex->pxPrevious = pxNewListItem;
    1c94:	b322      	st.w      	r1, (r3, 0x8)

    /* Remember which list the item is in. */
    pxNewListItem->pxContainer = pxList;

    ( pxList->uxNumberOfItems )++;
    1c96:	9060      	ld.w      	r3, (r0, 0x0)
    1c98:	2300      	addi      	r3, 1
    pxNewListItem->pxContainer = pxList;
    1c9a:	b104      	st.w      	r0, (r1, 0x10)
    ( pxList->uxNumberOfItems )++;
    1c9c:	b060      	st.w      	r3, (r0, 0x0)
}
    1c9e:	783c      	jmp      	r15

Disassembly of section .text.vListInsert:

00001ca0 <vListInsert>:
/*-----------------------------------------------------------*/

void vListInsert( List_t * const pxList,
                  ListItem_t * const pxNewListItem )
{
    1ca0:	14c2      	push      	r4-r5
     * new list item should be placed after it.  This ensures that TCBs which are
     * stored in ready lists (all of which have the same xItemValue value) get a
     * share of the CPU.  However, if the xItemValue is the same as the back marker
     * the iteration loop below will not end.  Therefore the value is checked
     * first, and the algorithm slightly modified if necessary. */
    if( xValueOfInsertion == portMAX_DELAY )
    1ca2:	3300      	movi      	r3, 0
    const TickType_t xValueOfInsertion = pxNewListItem->xItemValue;
    1ca4:	9140      	ld.w      	r2, (r1, 0x0)
    if( xValueOfInsertion == portMAX_DELAY )
    1ca6:	2b00      	subi      	r3, 1
    1ca8:	64ca      	cmpne      	r2, r3
    1caa:	080c      	bt      	0x1cc2	// 1cc2 <vListInsert+0x22>
    {
        pxIterator = pxList->xListEnd.pxPrevious;
    1cac:	9064      	ld.w      	r3, (r0, 0x10)
            /* There is nothing to do here, just iterating to the wanted
             * insertion position. */
        }
    }

    pxNewListItem->pxNext = pxIterator->pxNext;
    1cae:	9341      	ld.w      	r2, (r3, 0x4)
    1cb0:	b141      	st.w      	r2, (r1, 0x4)
    pxNewListItem->pxNext->pxPrevious = pxNewListItem;
    1cb2:	b222      	st.w      	r1, (r2, 0x8)
    pxNewListItem->pxPrevious = pxIterator;
    1cb4:	b162      	st.w      	r3, (r1, 0x8)
    pxIterator->pxNext = pxNewListItem;
    1cb6:	b321      	st.w      	r1, (r3, 0x4)

    /* Remember which list the item is in.  This allows fast removal of the
     * item later. */
    pxNewListItem->pxContainer = pxList;

    ( pxList->uxNumberOfItems )++;
    1cb8:	9060      	ld.w      	r3, (r0, 0x0)
    1cba:	2300      	addi      	r3, 1
    pxNewListItem->pxContainer = pxList;
    1cbc:	b104      	st.w      	r0, (r1, 0x10)
    ( pxList->uxNumberOfItems )++;
    1cbe:	b060      	st.w      	r3, (r0, 0x0)
}
    1cc0:	1482      	pop      	r4-r5
        for( pxIterator = ( ListItem_t * ) &( pxList->xListEnd ); pxIterator->pxNext->xItemValue <= xValueOfInsertion; pxIterator = pxIterator->pxNext ) /*lint !e826 !e740 !e9087 The mini list structure is used as the list end to save RAM.  This is checked and valid. *//*lint !e440 The iterator moves to a different value, not xValueOfInsertion. */
    1cc2:	587e      	addi      	r3, r0, 8
    1cc4:	9381      	ld.w      	r4, (r3, 0x4)
    1cc6:	94a0      	ld.w      	r5, (r4, 0x0)
    1cc8:	6548      	cmphs      	r2, r5
    1cca:	0ff2      	bf      	0x1cae	// 1cae <vListInsert+0xe>
    1ccc:	6cd3      	mov      	r3, r4
    1cce:	07fb      	br      	0x1cc4	// 1cc4 <vListInsert+0x24>

Disassembly of section .text.uxListRemove:

00001cd0 <uxListRemove>:
{
/* The list item knows which list it is in.  Obtain the list from the list
 * item. */
    List_t * const pxList = pxItemToRemove->pxContainer;

    pxItemToRemove->pxNext->pxPrevious = pxItemToRemove->pxPrevious;
    1cd0:	9021      	ld.w      	r1, (r0, 0x4)
    1cd2:	9042      	ld.w      	r2, (r0, 0x8)
    List_t * const pxList = pxItemToRemove->pxContainer;
    1cd4:	9064      	ld.w      	r3, (r0, 0x10)
    pxItemToRemove->pxNext->pxPrevious = pxItemToRemove->pxPrevious;
    1cd6:	b142      	st.w      	r2, (r1, 0x8)
    pxItemToRemove->pxPrevious->pxNext = pxItemToRemove->pxNext;
    1cd8:	9042      	ld.w      	r2, (r0, 0x8)
    1cda:	b221      	st.w      	r1, (r2, 0x4)

    /* Only used during decision coverage testing. */
    mtCOVERAGE_TEST_DELAY();

    /* Make sure the index is left pointing to a valid item. */
    if( pxList->pxIndex == pxItemToRemove )
    1cdc:	9321      	ld.w      	r1, (r3, 0x4)
    1cde:	6442      	cmpne      	r0, r1
    1ce0:	0802      	bt      	0x1ce4	// 1ce4 <uxListRemove+0x14>
    {
        pxList->pxIndex = pxItemToRemove->pxPrevious;
    1ce2:	b341      	st.w      	r2, (r3, 0x4)
    else
    {
        mtCOVERAGE_TEST_MARKER();
    }

    pxItemToRemove->pxContainer = NULL;
    1ce4:	3200      	movi      	r2, 0
    1ce6:	b044      	st.w      	r2, (r0, 0x10)
    ( pxList->uxNumberOfItems )--;
    1ce8:	9340      	ld.w      	r2, (r3, 0x0)
    1cea:	2a00      	subi      	r2, 1
    1cec:	b340      	st.w      	r2, (r3, 0x0)

    return pxList->uxNumberOfItems;
    1cee:	9300      	ld.w      	r0, (r3, 0x0)
}
    1cf0:	783c      	jmp      	r15

Disassembly of section .text.prvResetNextTaskUnblockTime:

00001cf4 <prvResetNextTaskUnblockTime>:
#endif /* INCLUDE_vTaskDelete */
/*-----------------------------------------------------------*/

static void prvResetNextTaskUnblockTime( void )
{
    if( listLIST_IS_EMPTY( pxDelayedTaskList ) != pdFALSE )
    1cf4:	1066      	lrw      	r3, 0x200000dc	// 1d0c <prvResetNextTaskUnblockTime+0x18>
    1cf6:	9340      	ld.w      	r2, (r3, 0x0)
    1cf8:	9240      	ld.w      	r2, (r2, 0x0)
    1cfa:	3a40      	cmpnei      	r2, 0
    1cfc:	0804      	bt      	0x1d04	// 1d04 <prvResetNextTaskUnblockTime+0x10>
    {
        /* The new current delayed list is empty.  Set xNextTaskUnblockTime to
         * the maximum possible value so it is  extremely unlikely that the
         * if( xTickCount >= xNextTaskUnblockTime ) test will pass until
         * there is an item in the delayed list. */
        xNextTaskUnblockTime = portMAX_DELAY;
    1cfe:	2a00      	subi      	r2, 1
    {
        /* The new current delayed list is not empty, get the value of
         * the item at the head of the delayed list.  This is the time at
         * which the task at the head of the delayed list should be removed
         * from the Blocked state. */
        xNextTaskUnblockTime = listGET_ITEM_VALUE_OF_HEAD_ENTRY( pxDelayedTaskList );
    1d00:	b341      	st.w      	r2, (r3, 0x4)
    }
}
    1d02:	783c      	jmp      	r15
        xNextTaskUnblockTime = listGET_ITEM_VALUE_OF_HEAD_ENTRY( pxDelayedTaskList );
    1d04:	9340      	ld.w      	r2, (r3, 0x0)
    1d06:	9243      	ld.w      	r2, (r2, 0xc)
    1d08:	9240      	ld.w      	r2, (r2, 0x0)
    1d0a:	07fb      	br      	0x1d00	// 1d00 <prvResetNextTaskUnblockTime+0xc>
    1d0c:	200000dc 	.long	0x200000dc

Disassembly of section .text.prvAddCurrentTaskToDelayedList:

00001d10 <prvAddCurrentTaskToDelayedList>:
#endif /* if ( ( configGENERATE_RUN_TIME_STATS == 1 ) && ( INCLUDE_xTaskGetIdleTaskHandle == 1 ) ) */
/*-----------------------------------------------------------*/

static void prvAddCurrentTaskToDelayedList( TickType_t xTicksToWait,
                                            const BaseType_t xCanBlockIndefinitely )
{
    1d10:	14d4      	push      	r4-r7, r15
    1d12:	1421      	subi      	r14, r14, 4
    TickType_t xTimeToWake;
    const TickType_t xConstTickCount = xTickCount;
    1d14:	109e      	lrw      	r4, 0x200000dc	// 1d8c <prvAddCurrentTaskToDelayedList+0x7c>
{
    1d16:	6d83      	mov      	r6, r0
    const TickType_t xConstTickCount = xTickCount;
    1d18:	94e2      	ld.w      	r7, (r4, 0x8)
    }
    #endif

    /* Remove the task from the ready list before adding it to the blocked list
     * as the same list item is used for both lists. */
    if( uxListRemove( &( pxCurrentTCB->xStateListItem ) ) == ( UBaseType_t ) 0 )
    1d1a:	9403      	ld.w      	r0, (r4, 0xc)
    1d1c:	2003      	addi      	r0, 4
{
    1d1e:	b820      	st.w      	r1, (r14, 0x0)
    if( uxListRemove( &( pxCurrentTCB->xStateListItem ) ) == ( UBaseType_t ) 0 )
    1d20:	e3ffffd8 	bsr      	0x1cd0	// 1cd0 <uxListRemove>
        mtCOVERAGE_TEST_MARKER();
    }

    #if ( INCLUDE_vTaskSuspend == 1 )
    {
        if( ( xTicksToWait == portMAX_DELAY ) && ( xCanBlockIndefinitely != pdFALSE ) )
    1d24:	3300      	movi      	r3, 0
    1d26:	2b00      	subi      	r3, 1
    1d28:	64da      	cmpne      	r6, r3
    1d2a:	6d53      	mov      	r5, r4
    1d2c:	9820      	ld.w      	r1, (r14, 0x0)
    1d2e:	0819      	bt      	0x1d60	// 1d60 <prvAddCurrentTaskToDelayedList+0x50>
    1d30:	3940      	cmpnei      	r1, 0
    1d32:	0c17      	bf      	0x1d60	// 1d60 <prvAddCurrentTaskToDelayedList+0x50>
        {
            /* Add the task to the suspended task list instead of a delayed task
             * list to ensure it is not woken by a timing event.  It will block
             * indefinitely. */
            listINSERT_END( &xSuspendedTaskList, &( pxCurrentTCB->xStateListItem ) );
    1d34:	3310      	movi      	r3, 16
    1d36:	60d0      	addu      	r3, r4
    1d38:	9423      	ld.w      	r1, (r4, 0xc)
    1d3a:	9341      	ld.w      	r2, (r3, 0x4)
    1d3c:	b142      	st.w      	r2, (r1, 0x8)
    1d3e:	9202      	ld.w      	r0, (r2, 0x8)
    1d40:	9423      	ld.w      	r1, (r4, 0xc)
    1d42:	b103      	st.w      	r0, (r1, 0xc)
    1d44:	9423      	ld.w      	r1, (r4, 0xc)
    1d46:	9202      	ld.w      	r0, (r2, 0x8)
    1d48:	2103      	addi      	r1, 4
    1d4a:	b021      	st.w      	r1, (r0, 0x4)
    1d4c:	9423      	ld.w      	r1, (r4, 0xc)
    1d4e:	2103      	addi      	r1, 4
    1d50:	b222      	st.w      	r1, (r2, 0x8)
    1d52:	9443      	ld.w      	r2, (r4, 0xc)
    1d54:	b265      	st.w      	r3, (r2, 0x14)
    1d56:	9340      	ld.w      	r2, (r3, 0x0)
    1d58:	2200      	addi      	r2, 1
    1d5a:	b340      	st.w      	r2, (r3, 0x0)

        /* Avoid compiler warning when INCLUDE_vTaskSuspend is not 1. */
        ( void ) xCanBlockIndefinitely;
    }
    #endif /* INCLUDE_vTaskSuspend */
}
    1d5c:	1401      	addi      	r14, r14, 4
    1d5e:	1494      	pop      	r4-r7, r15
            xTimeToWake = xConstTickCount + xTicksToWait;
    1d60:	619c      	addu      	r6, r7
            listSET_LIST_ITEM_VALUE( &( pxCurrentTCB->xStateListItem ), xTimeToWake );
    1d62:	9563      	ld.w      	r3, (r5, 0xc)
            if( xTimeToWake < xConstTickCount )
    1d64:	65d8      	cmphs      	r6, r7
            listSET_LIST_ITEM_VALUE( &( pxCurrentTCB->xStateListItem ), xTimeToWake );
    1d66:	b3c1      	st.w      	r6, (r3, 0x4)
            if( xTimeToWake < xConstTickCount )
    1d68:	0807      	bt      	0x1d76	// 1d76 <prvAddCurrentTaskToDelayedList+0x66>
                vListInsert( pxOverflowDelayedTaskList, &( pxCurrentTCB->xStateListItem ) );
    1d6a:	9509      	ld.w      	r0, (r5, 0x24)
    1d6c:	9523      	ld.w      	r1, (r5, 0xc)
    1d6e:	2103      	addi      	r1, 4
    1d70:	e3ffff98 	bsr      	0x1ca0	// 1ca0 <vListInsert>
    1d74:	07f4      	br      	0x1d5c	// 1d5c <prvAddCurrentTaskToDelayedList+0x4c>
                vListInsert( pxDelayedTaskList, &( pxCurrentTCB->xStateListItem ) );
    1d76:	9500      	ld.w      	r0, (r5, 0x0)
    1d78:	9523      	ld.w      	r1, (r5, 0xc)
    1d7a:	2103      	addi      	r1, 4
    1d7c:	e3ffff92 	bsr      	0x1ca0	// 1ca0 <vListInsert>
                if( xTimeToWake < xNextTaskUnblockTime )
    1d80:	9561      	ld.w      	r3, (r5, 0x4)
    1d82:	64d8      	cmphs      	r6, r3
    1d84:	0bec      	bt      	0x1d5c	// 1d5c <prvAddCurrentTaskToDelayedList+0x4c>
                    xNextTaskUnblockTime = xTimeToWake;
    1d86:	b5c1      	st.w      	r6, (r5, 0x4)
}
    1d88:	07ea      	br      	0x1d5c	// 1d5c <prvAddCurrentTaskToDelayedList+0x4c>
    1d8a:	0000      	bkpt
    1d8c:	200000dc 	.long	0x200000dc

Disassembly of section .text.prvIdleTask:

00001d90 <prvIdleTask>:
{
    1d90:	14d3      	push      	r4-r6, r15
        while( uxDeletedTasksWaitingCleanUp > ( UBaseType_t ) 0U )
    1d92:	1097      	lrw      	r4, 0x200000dc	// 1dec <prvIdleTask+0x5c>
                pxTCB = listGET_OWNER_OF_HEAD_ENTRY( ( &xTasksWaitingTermination ) ); /*lint !e9079 void * is used as this macro is used with timers and co-routines too.  Alignment is known to be fine as the type of the pointer stored and retrieved is the same. */
    1d94:	3628      	movi      	r6, 40
    1d96:	6190      	addu      	r6, r4
        while( uxDeletedTasksWaitingCleanUp > ( UBaseType_t ) 0U )
    1d98:	9470      	ld.w      	r3, (r4, 0x40)
    1d9a:	3b40      	cmpnei      	r3, 0
    1d9c:	080e      	bt      	0x1db8	// 1db8 <prvIdleTask+0x28>
            if( listCURRENT_LIST_LENGTH( &( pxReadyTasksLists[ tskIDLE_PRIORITY ] ) ) > ( UBaseType_t ) 1 )
    1d9e:	1075      	lrw      	r3, 0x20000120	// 1df0 <prvIdleTask+0x60>
    1da0:	9360      	ld.w      	r3, (r3, 0x0)
    1da2:	3b01      	cmphsi      	r3, 2
    1da4:	0ffa      	bf      	0x1d98	// 1d98 <prvIdleTask+0x8>
                taskYIELD();
    1da6:	1074      	lrw      	r3, 0x2000006c	// 1df4 <prvIdleTask+0x64>
    1da8:	9360      	ld.w      	r3, (r3, 0x0)
    1daa:	3b40      	cmpnei      	r3, 0
    1dac:	081c      	bt      	0x1de4	// 1de4 <prvIdleTask+0x54>
    1dae:	e3fff21e 	bsr      	0x1ea	// 1ea <vPortYield>
    1db2:	6c03      	mov      	r0, r0
    1db4:	6c03      	mov      	r0, r0
    1db6:	07f1      	br      	0x1d98	// 1d98 <prvIdleTask+0x8>
            taskENTER_CRITICAL();
    1db8:	e00004a0 	bsr      	0x26f8	// 26f8 <vPortEnterCritical>
                pxTCB = listGET_OWNER_OF_HEAD_ENTRY( ( &xTasksWaitingTermination ) ); /*lint !e9079 void * is used as this macro is used with timers and co-routines too.  Alignment is known to be fine as the type of the pointer stored and retrieved is the same. */
    1dbc:	9663      	ld.w      	r3, (r6, 0xc)
    1dbe:	93a3      	ld.w      	r5, (r3, 0xc)
                ( void ) uxListRemove( &( pxTCB->xStateListItem ) );
    1dc0:	5d0e      	addi      	r0, r5, 4
    1dc2:	e3ffff87 	bsr      	0x1cd0	// 1cd0 <uxListRemove>
                --uxCurrentNumberOfTasks;
    1dc6:	946f      	ld.w      	r3, (r4, 0x3c)
    1dc8:	2b00      	subi      	r3, 1
    1dca:	b46f      	st.w      	r3, (r4, 0x3c)
                --uxDeletedTasksWaitingCleanUp;
    1dcc:	9470      	ld.w      	r3, (r4, 0x40)
    1dce:	2b00      	subi      	r3, 1
    1dd0:	b470      	st.w      	r3, (r4, 0x40)
            taskEXIT_CRITICAL();
    1dd2:	e000049d 	bsr      	0x270c	// 270c <vPortExitCritical>
            vPortFreeStack( pxTCB->pxStack );
    1dd6:	950c      	ld.w      	r0, (r5, 0x30)
    1dd8:	e0000402 	bsr      	0x25dc	// 25dc <vPortFree>
            vPortFree( pxTCB );
    1ddc:	6c17      	mov      	r0, r5
    1dde:	e00003ff 	bsr      	0x25dc	// 25dc <vPortFree>
    1de2:	07db      	br      	0x1d98	// 1d98 <prvIdleTask+0x8>
                taskYIELD();
    1de4:	3201      	movi      	r2, 1
    1de6:	1065      	lrw      	r3, 0x20000dfc	// 1df8 <prvIdleTask+0x68>
    1de8:	b340      	st.w      	r2, (r3, 0x0)
    1dea:	07e4      	br      	0x1db2	// 1db2 <prvIdleTask+0x22>
    1dec:	200000dc 	.long	0x200000dc
    1df0:	20000120 	.long	0x20000120
    1df4:	2000006c 	.long	0x2000006c
    1df8:	20000dfc 	.long	0x20000dfc

Disassembly of section .text.xTaskCreate:

00001dfc <xTaskCreate>:
    {
    1dfc:	14d4      	push      	r4-r7, r15
    1dfe:	1425      	subi      	r14, r14, 20
    1e00:	b863      	st.w      	r3, (r14, 0xc)
    1e02:	986b      	ld.w      	r3, (r14, 0x2c)
    1e04:	b861      	st.w      	r3, (r14, 0x4)
            pxStack = pvPortMallocStack( ( ( ( size_t ) usStackDepth ) * sizeof( StackType_t ) ) ); /*lint !e9079 All values returned by pvPortMalloc() have at least the alignment required by the MCU's stack and this allocation is the stack. */
    1e06:	4262      	lsli      	r3, r2, 2
    {
    1e08:	b802      	st.w      	r0, (r14, 0x8)
            pxStack = pvPortMallocStack( ( ( ( size_t ) usStackDepth ) * sizeof( StackType_t ) ) ); /*lint !e9079 All values returned by pvPortMalloc() have at least the alignment required by the MCU's stack and this allocation is the stack. */
    1e0a:	6c0f      	mov      	r0, r3
    {
    1e0c:	6d07      	mov      	r4, r1
    1e0e:	98ea      	ld.w      	r7, (r14, 0x28)
            pxStack = pvPortMallocStack( ( ( ( size_t ) usStackDepth ) * sizeof( StackType_t ) ) ); /*lint !e9079 All values returned by pvPortMalloc() have at least the alignment required by the MCU's stack and this allocation is the stack. */
    1e10:	b860      	st.w      	r3, (r14, 0x0)
    1e12:	e0000351 	bsr      	0x24b4	// 24b4 <pvPortMalloc>
            if( pxStack != NULL )
    1e16:	3840      	cmpnei      	r0, 0
            pxStack = pvPortMallocStack( ( ( ( size_t ) usStackDepth ) * sizeof( StackType_t ) ) ); /*lint !e9079 All values returned by pvPortMalloc() have at least the alignment required by the MCU's stack and this allocation is the stack. */
    1e18:	6d43      	mov      	r5, r0
            if( pxStack != NULL )
    1e1a:	0c19      	bf      	0x1e4c	// 1e4c <xTaskCreate+0x50>
                pxNewTCB = ( TCB_t * ) pvPortMalloc( sizeof( TCB_t ) ); /*lint !e9087 !e9079 All values returned by pvPortMalloc() have at least the alignment required by the MCU's stack, and the first member of TCB_t is always a pointer to the task's stack. */
    1e1c:	3050      	movi      	r0, 80
    1e1e:	e000034b 	bsr      	0x24b4	// 24b4 <pvPortMalloc>
                if( pxNewTCB != NULL )
    1e22:	3840      	cmpnei      	r0, 0
                pxNewTCB = ( TCB_t * ) pvPortMalloc( sizeof( TCB_t ) ); /*lint !e9087 !e9079 All values returned by pvPortMalloc() have at least the alignment required by the MCU's stack, and the first member of TCB_t is always a pointer to the task's stack. */
    1e24:	6d83      	mov      	r6, r0
                if( pxNewTCB != NULL )
    1e26:	0c10      	bf      	0x1e46	// 1e46 <xTaskCreate+0x4a>
                    memset( ( void * ) pxNewTCB, 0x00, sizeof( TCB_t ) );
    1e28:	3250      	movi      	r2, 80
    1e2a:	3100      	movi      	r1, 0
    1e2c:	e3fff290 	bsr      	0x34c	// 34c <__memset_fast>
    if( pcName != NULL )
    1e30:	3c40      	cmpnei      	r4, 0
                    pxNewTCB->pxStack = pxStack;
    1e32:	b6ac      	st.w      	r5, (r6, 0x30)
    if( pcName != NULL )
    1e34:	0810      	bt      	0x1e54	// 1e54 <xTaskCreate+0x58>
    configASSERT( uxPriority < configMAX_PRIORITIES );
    1e36:	3f04      	cmphsi      	r7, 5
    1e38:	0c20      	bf      	0x1e78	// 1e78 <xTaskCreate+0x7c>
    1e3a:	125c      	lrw      	r2, 0x392	// 1fa8 <xTaskCreate+0x1ac>
    1e3c:	123c      	lrw      	r1, 0x2b30	// 1fac <xTaskCreate+0x1b0>
    1e3e:	121d      	lrw      	r0, 0x2b41	// 1fb0 <xTaskCreate+0x1b4>
    1e40:	e3fff21a 	bsr      	0x274	// 274 <__cskyvprintfprintf>
    1e44:	0400      	br      	0x1e44	// 1e44 <xTaskCreate+0x48>
                    vPortFreeStack( pxStack );
    1e46:	6c17      	mov      	r0, r5
    1e48:	e00003ca 	bsr      	0x25dc	// 25dc <vPortFree>
            xReturn = errCOULD_NOT_ALLOCATE_REQUIRED_MEMORY;
    1e4c:	3000      	movi      	r0, 0
    1e4e:	2800      	subi      	r0, 1
    }
    1e50:	1405      	addi      	r14, r14, 20
    1e52:	1494      	pop      	r4-r7, r15
    1e54:	3234      	movi      	r2, 52
    1e56:	310c      	movi      	r1, 12
    1e58:	6098      	addu      	r2, r6
    1e5a:	6050      	addu      	r1, r4
            pxNewTCB->pcTaskName[ x ] = pcName[ x ];
    1e5c:	8460      	ld.b      	r3, (r4, 0x0)
    1e5e:	a260      	st.b      	r3, (r2, 0x0)
            if( pcName[ x ] == ( char ) 0x00 )
    1e60:	8400      	ld.b      	r0, (r4, 0x0)
    1e62:	3840      	cmpnei      	r0, 0
    1e64:	0c05      	bf      	0x1e6e	// 1e6e <xTaskCreate+0x72>
    1e66:	2400      	addi      	r4, 1
        for( x = ( UBaseType_t ) 0; x < ( UBaseType_t ) configMAX_TASK_NAME_LEN; x++ )
    1e68:	6506      	cmpne      	r1, r4
    1e6a:	2200      	addi      	r2, 1
    1e6c:	0bf8      	bt      	0x1e5c	// 1e5c <xTaskCreate+0x60>
        pxNewTCB->pcTaskName[ configMAX_TASK_NAME_LEN - 1 ] = '\0';
    1e6e:	3220      	movi      	r2, 32
    1e70:	6098      	addu      	r2, r6
    1e72:	3300      	movi      	r3, 0
    1e74:	a27f      	st.b      	r3, (r2, 0x1f)
    1e76:	07e0      	br      	0x1e36	// 1e36 <xTaskCreate+0x3a>
    vListInitialiseItem( &( pxNewTCB->xStateListItem ) );
    1e78:	5e6e      	addi      	r3, r6, 4
    1e7a:	6c0f      	mov      	r0, r3
    pxNewTCB->uxPriority = uxPriority;
    1e7c:	b6eb      	st.w      	r7, (r6, 0x2c)
        pxNewTCB->uxBasePriority = uxPriority;
    1e7e:	b6f0      	st.w      	r7, (r6, 0x40)
    vListInitialiseItem( &( pxNewTCB->xStateListItem ) );
    1e80:	b864      	st.w      	r3, (r14, 0x10)
    1e82:	e3ffff00 	bsr      	0x1c82	// 1c82 <vListInitialiseItem>
    vListInitialiseItem( &( pxNewTCB->xEventListItem ) );
    1e86:	3018      	movi      	r0, 24
    1e88:	6018      	addu      	r0, r6
    1e8a:	e3fffefc 	bsr      	0x1c82	// 1c82 <vListInitialiseItem>
        pxTopOfStack = &( pxNewTCB->pxStack[ ulStackDepth - ( uint32_t ) 1 ] );
    1e8e:	9800      	ld.w      	r0, (r14, 0x0)
    listSET_LIST_ITEM_VALUE( &( pxNewTCB->xEventListItem ), ( TickType_t ) configMAX_PRIORITIES - ( TickType_t ) uxPriority ); /*lint !e961 MISRA exception as the casts are only redundant for some ports. */
    1e90:	3205      	movi      	r2, 5
    1e92:	609e      	subu      	r2, r7
        pxTopOfStack = &( pxNewTCB->pxStack[ ulStackDepth - ( uint32_t ) 1 ] );
    1e94:	2803      	subi      	r0, 4
    listSET_LIST_ITEM_VALUE( &( pxNewTCB->xEventListItem ), ( TickType_t ) configMAX_PRIORITIES - ( TickType_t ) uxPriority ); /*lint !e961 MISRA exception as the casts are only redundant for some ports. */
    1e96:	b646      	st.w      	r2, (r6, 0x18)
        pxTopOfStack = &( pxNewTCB->pxStack[ ulStackDepth - ( uint32_t ) 1 ] );
    1e98:	6014      	addu      	r0, r5
        pxTopOfStack = ( StackType_t * ) ( ( ( portPOINTER_SIZE_TYPE ) pxTopOfStack ) & ( ~( ( portPOINTER_SIZE_TYPE ) portBYTE_ALIGNMENT_MASK ) ) ); /*lint !e923 !e9033 !e9078 MISRA exception.  Avoiding casts between pointers and integers is not practical.  Size differences accounted for using portPOINTER_SIZE_TYPE type.  Checked by assert(). */
    1e9a:	3207      	movi      	r2, 7
    1e9c:	6809      	andn      	r0, r2
    listSET_LIST_ITEM_OWNER( &( pxNewTCB->xStateListItem ), pxNewTCB );
    1e9e:	b6c4      	st.w      	r6, (r6, 0x10)
    listSET_LIST_ITEM_OWNER( &( pxNewTCB->xEventListItem ), pxNewTCB );
    1ea0:	b6c9      	st.w      	r6, (r6, 0x24)
            pxNewTCB->pxTopOfStack = pxPortInitialiseStack( pxTopOfStack, pxTaskCode, pvParameters );
    1ea2:	9843      	ld.w      	r2, (r14, 0xc)
    1ea4:	9822      	ld.w      	r1, (r14, 0x8)
    1ea6:	e00003cf 	bsr      	0x2644	// 2644 <pxPortInitialiseStack>
    if( pxCreatedTask != NULL )
    1eaa:	9861      	ld.w      	r3, (r14, 0x4)
    1eac:	3b40      	cmpnei      	r3, 0
            pxNewTCB->pxTopOfStack = pxPortInitialiseStack( pxTopOfStack, pxTaskCode, pvParameters );
    1eae:	b600      	st.w      	r0, (r6, 0x0)
    if( pxCreatedTask != NULL )
    1eb0:	0c02      	bf      	0x1eb4	// 1eb4 <xTaskCreate+0xb8>
        *pxCreatedTask = ( TaskHandle_t ) pxNewTCB;
    1eb2:	b3c0      	st.w      	r6, (r3, 0x0)
        uxCurrentNumberOfTasks++;
    1eb4:	12a0      	lrw      	r5, 0x200000dc	// 1fb4 <xTaskCreate+0x1b8>
    taskENTER_CRITICAL();
    1eb6:	e0000421 	bsr      	0x26f8	// 26f8 <vPortEnterCritical>
        uxCurrentNumberOfTasks++;
    1eba:	954f      	ld.w      	r2, (r5, 0x3c)
    1ebc:	2200      	addi      	r2, 1
    1ebe:	b54f      	st.w      	r2, (r5, 0x3c)
        if( pxCurrentTCB == NULL )
    1ec0:	9543      	ld.w      	r2, (r5, 0xc)
    1ec2:	3444      	movi      	r4, 68
    1ec4:	3780      	movi      	r7, 128
    1ec6:	3a40      	cmpnei      	r2, 0
    1ec8:	6114      	addu      	r4, r5
    1eca:	61d4      	addu      	r7, r5
    1ecc:	085f      	bt      	0x1f8a	// 1f8a <xTaskCreate+0x18e>
            pxCurrentTCB = pxNewTCB;
    1ece:	b5c3      	st.w      	r6, (r5, 0xc)
            if( uxCurrentNumberOfTasks == ( UBaseType_t ) 1 )
    1ed0:	954f      	ld.w      	r2, (r5, 0x3c)
    1ed2:	3a41      	cmpnei      	r2, 1
    1ed4:	082f      	bt      	0x1f32	// 1f32 <xTaskCreate+0x136>
        vListInitialise( &( pxReadyTasksLists[ uxPriority ] ) );
    1ed6:	6c13      	mov      	r0, r4
    1ed8:	e3fffecb 	bsr      	0x1c6e	// 1c6e <vListInitialise>
    1edc:	3014      	movi      	r0, 20
    1ede:	6010      	addu      	r0, r4
    1ee0:	e3fffec7 	bsr      	0x1c6e	// 1c6e <vListInitialise>
    1ee4:	3028      	movi      	r0, 40
    1ee6:	6010      	addu      	r0, r4
    1ee8:	e3fffec3 	bsr      	0x1c6e	// 1c6e <vListInitialise>
    1eec:	6c1f      	mov      	r0, r7
    1eee:	e3fffec0 	bsr      	0x1c6e	// 1c6e <vListInitialise>
    1ef2:	3050      	movi      	r0, 80
    1ef4:	6010      	addu      	r0, r4
    1ef6:	e3fffebc 	bsr      	0x1c6e	// 1c6e <vListInitialise>
    vListInitialise( &xDelayedTaskList1 );
    1efa:	31a8      	movi      	r1, 168
    1efc:	6054      	addu      	r1, r5
    1efe:	6c07      	mov      	r0, r1
    1f00:	b821      	st.w      	r1, (r14, 0x4)
    1f02:	e3fffeb6 	bsr      	0x1c6e	// 1c6e <vListInitialise>
    vListInitialise( &xDelayedTaskList2 );
    1f06:	32bc      	movi      	r2, 188
    1f08:	6094      	addu      	r2, r5
    1f0a:	6c0b      	mov      	r0, r2
    1f0c:	b840      	st.w      	r2, (r14, 0x0)
    1f0e:	e3fffeb0 	bsr      	0x1c6e	// 1c6e <vListInitialise>
    vListInitialise( &xPendingReadyList );
    1f12:	30d0      	movi      	r0, 208
    1f14:	6014      	addu      	r0, r5
    1f16:	e3fffeac 	bsr      	0x1c6e	// 1c6e <vListInitialise>
        vListInitialise( &xTasksWaitingTermination );
    1f1a:	3028      	movi      	r0, 40
    1f1c:	6014      	addu      	r0, r5
    1f1e:	e3fffea8 	bsr      	0x1c6e	// 1c6e <vListInitialise>
        vListInitialise( &xSuspendedTaskList );
    1f22:	3010      	movi      	r0, 16
    1f24:	6014      	addu      	r0, r5
    1f26:	e3fffea4 	bsr      	0x1c6e	// 1c6e <vListInitialise>
    pxDelayedTaskList = &xDelayedTaskList1;
    1f2a:	9821      	ld.w      	r1, (r14, 0x4)
    pxOverflowDelayedTaskList = &xDelayedTaskList2;
    1f2c:	9840      	ld.w      	r2, (r14, 0x0)
    pxDelayedTaskList = &xDelayedTaskList1;
    1f2e:	b520      	st.w      	r1, (r5, 0x0)
    pxOverflowDelayedTaskList = &xDelayedTaskList2;
    1f30:	b549      	st.w      	r2, (r5, 0x24)
        uxTaskNumber++;
    1f32:	975a      	ld.w      	r2, (r7, 0x68)
    1f34:	2200      	addi      	r2, 1
    1f36:	b75a      	st.w      	r2, (r7, 0x68)
        prvAddTaskToReadyList( pxNewTCB );
    1f38:	973b      	ld.w      	r1, (r7, 0x6c)
    1f3a:	964b      	ld.w      	r2, (r6, 0x2c)
    1f3c:	6484      	cmphs      	r1, r2
    1f3e:	0802      	bt      	0x1f42	// 1f42 <xTaskCreate+0x146>
    1f40:	b75b      	st.w      	r2, (r7, 0x6c)
    1f42:	4202      	lsli      	r0, r2, 2
    1f44:	6008      	addu      	r0, r2
    1f46:	4002      	lsli      	r0, r0, 2
    1f48:	6010      	addu      	r0, r4
    1f4a:	9041      	ld.w      	r2, (r0, 0x4)
    1f4c:	9222      	ld.w      	r1, (r2, 0x8)
    1f4e:	b623      	st.w      	r1, (r6, 0xc)
    1f50:	9222      	ld.w      	r1, (r2, 0x8)
    1f52:	5e6e      	addi      	r3, r6, 4
    1f54:	b642      	st.w      	r2, (r6, 0x8)
    1f56:	b161      	st.w      	r3, (r1, 0x4)
    1f58:	b262      	st.w      	r3, (r2, 0x8)
    1f5a:	9040      	ld.w      	r2, (r0, 0x0)
    1f5c:	2200      	addi      	r2, 1
    1f5e:	b605      	st.w      	r0, (r6, 0x14)
    1f60:	b040      	st.w      	r2, (r0, 0x0)
    taskEXIT_CRITICAL();
    1f62:	e00003d5 	bsr      	0x270c	// 270c <vPortExitCritical>
    if( xSchedulerRunning != pdFALSE )
    1f66:	9759      	ld.w      	r2, (r7, 0x64)
    1f68:	3a40      	cmpnei      	r2, 0
    1f6a:	0c0e      	bf      	0x1f86	// 1f86 <xTaskCreate+0x18a>
        if( pxCurrentTCB->uxPriority < pxNewTCB->uxPriority )
    1f6c:	9543      	ld.w      	r2, (r5, 0xc)
    1f6e:	924b      	ld.w      	r2, (r2, 0x2c)
    1f70:	966b      	ld.w      	r3, (r6, 0x2c)
    1f72:	64c8      	cmphs      	r2, r3
    1f74:	0809      	bt      	0x1f86	// 1f86 <xTaskCreate+0x18a>
            taskYIELD_IF_USING_PREEMPTION();
    1f76:	1071      	lrw      	r3, 0x2000006c	// 1fb8 <xTaskCreate+0x1bc>
    1f78:	9360      	ld.w      	r3, (r3, 0x0)
    1f7a:	3b40      	cmpnei      	r3, 0
    1f7c:	0811      	bt      	0x1f9e	// 1f9e <xTaskCreate+0x1a2>
    1f7e:	e3fff136 	bsr      	0x1ea	// 1ea <vPortYield>
    1f82:	6c03      	mov      	r0, r0
    1f84:	6c03      	mov      	r0, r0
            xReturn = pdPASS;
    1f86:	3001      	movi      	r0, 1
        return xReturn;
    1f88:	0764      	br      	0x1e50	// 1e50 <xTaskCreate+0x54>
            if( xSchedulerRunning == pdFALSE )
    1f8a:	9759      	ld.w      	r2, (r7, 0x64)
    1f8c:	3a40      	cmpnei      	r2, 0
    1f8e:	0bd2      	bt      	0x1f32	// 1f32 <xTaskCreate+0x136>
                if( pxCurrentTCB->uxPriority <= pxNewTCB->uxPriority )
    1f90:	9543      	ld.w      	r2, (r5, 0xc)
    1f92:	922b      	ld.w      	r1, (r2, 0x2c)
    1f94:	964b      	ld.w      	r2, (r6, 0x2c)
    1f96:	6448      	cmphs      	r2, r1
    1f98:	0fcd      	bf      	0x1f32	// 1f32 <xTaskCreate+0x136>
                    pxCurrentTCB = pxNewTCB;
    1f9a:	b5c3      	st.w      	r6, (r5, 0xc)
    1f9c:	07cb      	br      	0x1f32	// 1f32 <xTaskCreate+0x136>
            taskYIELD_IF_USING_PREEMPTION();
    1f9e:	3201      	movi      	r2, 1
    1fa0:	1067      	lrw      	r3, 0x20000dfc	// 1fbc <xTaskCreate+0x1c0>
    1fa2:	b340      	st.w      	r2, (r3, 0x0)
    1fa4:	07ef      	br      	0x1f82	// 1f82 <xTaskCreate+0x186>
    1fa6:	0000      	bkpt
    1fa8:	00000392 	.long	0x00000392
    1fac:	00002b30 	.long	0x00002b30
    1fb0:	00002b41 	.long	0x00002b41
    1fb4:	200000dc 	.long	0x200000dc
    1fb8:	2000006c 	.long	0x2000006c
    1fbc:	20000dfc 	.long	0x20000dfc

Disassembly of section .text.vTaskDelete:

00001fc0 <vTaskDelete>:
    {
    1fc0:	14d4      	push      	r4-r7, r15
    1fc2:	6d03      	mov      	r4, r0
        taskENTER_CRITICAL();
    1fc4:	e000039a 	bsr      	0x26f8	// 26f8 <vPortEnterCritical>
            pxTCB = prvGetTCBFromHandle( xTaskToDelete );
    1fc8:	3c40      	cmpnei      	r4, 0
    1fca:	11a5      	lrw      	r5, 0x200000dc	// 205c <vTaskDelete+0x9c>
    1fcc:	0802      	bt      	0x1fd0	// 1fd0 <vTaskDelete+0x10>
    1fce:	9583      	ld.w      	r4, (r5, 0xc)
            if( uxListRemove( &( pxTCB->xStateListItem ) ) == ( UBaseType_t ) 0 )
    1fd0:	5cee      	addi      	r7, r4, 4
    1fd2:	6c1f      	mov      	r0, r7
    1fd4:	e3fffe7e 	bsr      	0x1cd0	// 1cd0 <uxListRemove>
            if( listLIST_ITEM_CONTAINER( &( pxTCB->xEventListItem ) ) != NULL )
    1fd8:	946a      	ld.w      	r3, (r4, 0x28)
    1fda:	3b40      	cmpnei      	r3, 0
    1fdc:	0c05      	bf      	0x1fe6	// 1fe6 <vTaskDelete+0x26>
                ( void ) uxListRemove( &( pxTCB->xEventListItem ) );
    1fde:	3018      	movi      	r0, 24
    1fe0:	6010      	addu      	r0, r4
    1fe2:	e3fffe77 	bsr      	0x1cd0	// 1cd0 <uxListRemove>
            uxTaskNumber++;
    1fe6:	10df      	lrw      	r6, 0x2000015c	// 2060 <vTaskDelete+0xa0>
    1fe8:	967a      	ld.w      	r3, (r6, 0x68)
    1fea:	2300      	addi      	r3, 1
    1fec:	b67a      	st.w      	r3, (r6, 0x68)
            if( pxTCB == pxCurrentTCB )
    1fee:	9563      	ld.w      	r3, (r5, 0xc)
    1ff0:	64d2      	cmpne      	r4, r3
    1ff2:	0822      	bt      	0x2036	// 2036 <vTaskDelete+0x76>
                vListInsertEnd( &xTasksWaitingTermination, &( pxTCB->xStateListItem ) );
    1ff4:	6c5f      	mov      	r1, r7
    1ff6:	101c      	lrw      	r0, 0x20000104	// 2064 <vTaskDelete+0xa4>
    1ff8:	e3fffe48 	bsr      	0x1c88	// 1c88 <vListInsertEnd>
                ++uxDeletedTasksWaitingCleanUp;
    1ffc:	9570      	ld.w      	r3, (r5, 0x40)
    1ffe:	2300      	addi      	r3, 1
    2000:	b570      	st.w      	r3, (r5, 0x40)
        taskEXIT_CRITICAL();
    2002:	e0000385 	bsr      	0x270c	// 270c <vPortExitCritical>
        if( pxTCB != pxCurrentTCB )
    2006:	9563      	ld.w      	r3, (r5, 0xc)
    2008:	64d2      	cmpne      	r4, r3
    200a:	0c07      	bf      	0x2018	// 2018 <vTaskDelete+0x58>
            vPortFreeStack( pxTCB->pxStack );
    200c:	940c      	ld.w      	r0, (r4, 0x30)
    200e:	e00002e7 	bsr      	0x25dc	// 25dc <vPortFree>
            vPortFree( pxTCB );
    2012:	6c13      	mov      	r0, r4
    2014:	e00002e4 	bsr      	0x25dc	// 25dc <vPortFree>
        if( xSchedulerRunning != pdFALSE )
    2018:	9679      	ld.w      	r3, (r6, 0x64)
    201a:	3b40      	cmpnei      	r3, 0
    201c:	0c1b      	bf      	0x2052	// 2052 <vTaskDelete+0x92>
            if( pxTCB == pxCurrentTCB )
    201e:	9563      	ld.w      	r3, (r5, 0xc)
    2020:	64d2      	cmpne      	r4, r3
    2022:	0818      	bt      	0x2052	// 2052 <vTaskDelete+0x92>
                configASSERT( uxSchedulerSuspended == 0 );
    2024:	967c      	ld.w      	r3, (r6, 0x70)
    2026:	3b40      	cmpnei      	r3, 0
    2028:	0c0d      	bf      	0x2042	// 2042 <vTaskDelete+0x82>
    202a:	1050      	lrw      	r2, 0x4af	// 2068 <vTaskDelete+0xa8>
    202c:	1030      	lrw      	r1, 0x2b30	// 206c <vTaskDelete+0xac>
    202e:	1011      	lrw      	r0, 0x2b41	// 2070 <vTaskDelete+0xb0>
    2030:	e3fff122 	bsr      	0x274	// 274 <__cskyvprintfprintf>
    2034:	0400      	br      	0x2034	// 2034 <vTaskDelete+0x74>
                --uxCurrentNumberOfTasks;
    2036:	956f      	ld.w      	r3, (r5, 0x3c)
    2038:	2b00      	subi      	r3, 1
    203a:	b56f      	st.w      	r3, (r5, 0x3c)
                prvResetNextTaskUnblockTime();
    203c:	e3fffe5c 	bsr      	0x1cf4	// 1cf4 <prvResetNextTaskUnblockTime>
    2040:	07e1      	br      	0x2002	// 2002 <vTaskDelete+0x42>
                portYIELD_WITHIN_API();
    2042:	106d      	lrw      	r3, 0x2000006c	// 2074 <vTaskDelete+0xb4>
    2044:	9360      	ld.w      	r3, (r3, 0x0)
    2046:	3b40      	cmpnei      	r3, 0
    2048:	0806      	bt      	0x2054	// 2054 <vTaskDelete+0x94>
    204a:	e3fff0d0 	bsr      	0x1ea	// 1ea <vPortYield>
    204e:	6c03      	mov      	r0, r0
    2050:	6c03      	mov      	r0, r0
    }
    2052:	1494      	pop      	r4-r7, r15
                portYIELD_WITHIN_API();
    2054:	3201      	movi      	r2, 1
    2056:	1069      	lrw      	r3, 0x20000dfc	// 2078 <vTaskDelete+0xb8>
    2058:	b340      	st.w      	r2, (r3, 0x0)
    205a:	07fa      	br      	0x204e	// 204e <vTaskDelete+0x8e>
    205c:	200000dc 	.long	0x200000dc
    2060:	2000015c 	.long	0x2000015c
    2064:	20000104 	.long	0x20000104
    2068:	000004af 	.long	0x000004af
    206c:	00002b30 	.long	0x00002b30
    2070:	00002b41 	.long	0x00002b41
    2074:	2000006c 	.long	0x2000006c
    2078:	20000dfc 	.long	0x20000dfc

Disassembly of section .text.vTaskStartScheduler:

0000207c <vTaskStartScheduler>:
{
    207c:	14d3      	push      	r4-r6, r15
    207e:	1422      	subi      	r14, r14, 8
        xReturn = xTaskCreate( prvIdleTask,
    2080:	1093      	lrw      	r4, 0x200000dc	// 20cc <vTaskStartScheduler+0x50>
    2082:	33f8      	movi      	r3, 248
    2084:	60d0      	addu      	r3, r4
    2086:	3500      	movi      	r5, 0
    2088:	b861      	st.w      	r3, (r14, 0x4)
    208a:	b8a0      	st.w      	r5, (r14, 0x0)
    208c:	3300      	movi      	r3, 0
    208e:	3240      	movi      	r2, 64
    2090:	1030      	lrw      	r1, 0x2b52	// 20d0 <vTaskStartScheduler+0x54>
    2092:	1011      	lrw      	r0, 0x1d90	// 20d4 <vTaskStartScheduler+0x58>
    2094:	e3fffeb4 	bsr      	0x1dfc	// 1dfc <xTaskCreate>
    2098:	3680      	movi      	r6, 128
    209a:	3300      	movi      	r3, 0
    if( xReturn == pdPASS )
    209c:	3841      	cmpnei      	r0, 1
        xReturn = xTaskCreate( prvIdleTask,
    209e:	6190      	addu      	r6, r4
    20a0:	2b00      	subi      	r3, 1
    if( xReturn == pdPASS )
    20a2:	080c      	bt      	0x20ba	// 20ba <vTaskStartScheduler+0x3e>
  \details Disables IRQ interrupts by clearing the IE-bit in the PSR.
  Can only be executed in Privileged modes.
 */
__ALWAYS_STATIC_INLINE void __disable_irq(void)
{
    __ASM volatile("psrclr ie");
    20a4:	c0807020 	psrclr      	ie
        xNextTaskUnblockTime = portMAX_DELAY;
    20a8:	b461      	st.w      	r3, (r4, 0x4)
        xSchedulerRunning = pdTRUE;
    20aa:	b619      	st.w      	r0, (r6, 0x64)
        xTickCount = ( TickType_t ) configINITIAL_TICK_COUNT;
    20ac:	b4a2      	st.w      	r5, (r4, 0x8)
        xPortStartScheduler();
    20ae:	e000031b 	bsr      	0x26e4	// 26e4 <xPortStartScheduler>
    ( void ) uxTopUsedPriority;
    20b2:	106a      	lrw      	r3, 0x20000068	// 20d8 <vTaskStartScheduler+0x5c>
    20b4:	9360      	ld.w      	r3, (r3, 0x0)
}
    20b6:	1402      	addi      	r14, r14, 8
    20b8:	1493      	pop      	r4-r6, r15
        configASSERT( xReturn != errCOULD_NOT_ALLOCATE_REQUIRED_MEMORY );
    20ba:	64c2      	cmpne      	r0, r3
    20bc:	0bfb      	bt      	0x20b2	// 20b2 <vTaskStartScheduler+0x36>
    20be:	1048      	lrw      	r2, 0x812	// 20dc <vTaskStartScheduler+0x60>
    20c0:	1028      	lrw      	r1, 0x2b30	// 20e0 <vTaskStartScheduler+0x64>
    20c2:	1009      	lrw      	r0, 0x2b41	// 20e4 <vTaskStartScheduler+0x68>
    20c4:	e3fff0d8 	bsr      	0x274	// 274 <__cskyvprintfprintf>
    20c8:	0400      	br      	0x20c8	// 20c8 <vTaskStartScheduler+0x4c>
    20ca:	0000      	bkpt
    20cc:	200000dc 	.long	0x200000dc
    20d0:	00002b52 	.long	0x00002b52
    20d4:	00001d90 	.long	0x00001d90
    20d8:	20000068 	.long	0x20000068
    20dc:	00000812 	.long	0x00000812
    20e0:	00002b30 	.long	0x00002b30
    20e4:	00002b41 	.long	0x00002b41

Disassembly of section .text.vTaskSuspendAll:

000020e8 <vTaskSuspendAll>:
    ++uxSchedulerSuspended;
    20e8:	1043      	lrw      	r2, 0x2000015c	// 20f4 <vTaskSuspendAll+0xc>
    20ea:	927c      	ld.w      	r3, (r2, 0x70)
    20ec:	2300      	addi      	r3, 1
    20ee:	b27c      	st.w      	r3, (r2, 0x70)
}
    20f0:	783c      	jmp      	r15
    20f2:	0000      	bkpt
    20f4:	2000015c 	.long	0x2000015c

Disassembly of section .text.xTaskIncrementTick:

000020f8 <xTaskIncrementTick>:
{
    20f8:	14d4      	push      	r4-r7, r15
    20fa:	1423      	subi      	r14, r14, 12
    if( uxSchedulerSuspended == ( UBaseType_t ) pdFALSE )
    20fc:	126a      	lrw      	r3, 0x200000dc	// 2224 <xTaskIncrementTick+0x12c>
    20fe:	3580      	movi      	r5, 128
    2100:	614c      	addu      	r5, r3
    2102:	955c      	ld.w      	r2, (r5, 0x70)
    2104:	3a40      	cmpnei      	r2, 0
    2106:	6d0f      	mov      	r4, r3
    2108:	b8a0      	st.w      	r5, (r14, 0x0)
    210a:	0886      	bt      	0x2216	// 2216 <xTaskIncrementTick+0x11e>
        const TickType_t xConstTickCount = xTickCount + ( TickType_t ) 1;
    210c:	9342      	ld.w      	r2, (r3, 0x8)
    210e:	5ae2      	addi      	r7, r2, 1
        if( xConstTickCount == ( TickType_t ) 0U ) /*lint !e774 'if' does not always evaluate to false as it is looking for an overflow. */
    2110:	3f40      	cmpnei      	r7, 0
        xTickCount = xConstTickCount;
    2112:	b3e2      	st.w      	r7, (r3, 0x8)
        if( xConstTickCount == ( TickType_t ) 0U ) /*lint !e774 'if' does not always evaluate to false as it is looking for an overflow. */
    2114:	0816      	bt      	0x2140	// 2140 <xTaskIncrementTick+0x48>
            taskSWITCH_DELAYED_LISTS();
    2116:	9360      	ld.w      	r3, (r3, 0x0)
    2118:	9360      	ld.w      	r3, (r3, 0x0)
    211a:	3b40      	cmpnei      	r3, 0
    211c:	0c07      	bf      	0x212a	// 212a <xTaskIncrementTick+0x32>
    211e:	1243      	lrw      	r2, 0xab7	// 2228 <xTaskIncrementTick+0x130>
    2120:	1223      	lrw      	r1, 0x2b30	// 222c <xTaskIncrementTick+0x134>
    2122:	1204      	lrw      	r0, 0x2b41	// 2230 <xTaskIncrementTick+0x138>
    2124:	e3fff0a8 	bsr      	0x274	// 274 <__cskyvprintfprintf>
    2128:	0400      	br      	0x2128	// 2128 <xTaskIncrementTick+0x30>
    212a:	9460      	ld.w      	r3, (r4, 0x0)
    212c:	9449      	ld.w      	r2, (r4, 0x24)
    212e:	b440      	st.w      	r2, (r4, 0x0)
    2130:	b469      	st.w      	r3, (r4, 0x24)
    2132:	9860      	ld.w      	r3, (r14, 0x0)
    2134:	937f      	ld.w      	r3, (r3, 0x7c)
    2136:	2300      	addi      	r3, 1
    2138:	9840      	ld.w      	r2, (r14, 0x0)
    213a:	b27f      	st.w      	r3, (r2, 0x7c)
    213c:	e3fffddc 	bsr      	0x1cf4	// 1cf4 <prvResetNextTaskUnblockTime>
        if( xConstTickCount >= xNextTaskUnblockTime )
    2140:	9461      	ld.w      	r3, (r4, 0x4)
    2142:	64dc      	cmphs      	r7, r3
    2144:	117c      	lrw      	r3, 0x20000120	// 2234 <xTaskIncrementTick+0x13c>
    2146:	3000      	movi      	r0, 0
    2148:	b862      	st.w      	r3, (r14, 0x8)
    214a:	0c07      	bf      	0x2158	// 2158 <xTaskIncrementTick+0x60>
                if( listLIST_IS_EMPTY( pxDelayedTaskList ) != pdFALSE )
    214c:	9460      	ld.w      	r3, (r4, 0x0)
    214e:	9360      	ld.w      	r3, (r3, 0x0)
    2150:	3b40      	cmpnei      	r3, 0
    2152:	0815      	bt      	0x217c	// 217c <xTaskIncrementTick+0x84>
                    xNextTaskUnblockTime = portMAX_DELAY; /*lint !e961 MISRA exception as the casts are only redundant for some ports. */
    2154:	2b00      	subi      	r3, 1
    2156:	b461      	st.w      	r3, (r4, 0x4)
            if( listCURRENT_LIST_LENGTH( &( pxReadyTasksLists[ pxCurrentTCB->uxPriority ] ) ) > ( UBaseType_t ) 1 )
    2158:	9463      	ld.w      	r3, (r4, 0xc)
    215a:	934b      	ld.w      	r2, (r3, 0x2c)
    215c:	4262      	lsli      	r3, r2, 2
    215e:	60c8      	addu      	r3, r2
    2160:	4362      	lsli      	r3, r3, 2
    2162:	9842      	ld.w      	r2, (r14, 0x8)
    2164:	608c      	addu      	r2, r3
    2166:	9260      	ld.w      	r3, (r2, 0x0)
    2168:	3b01      	cmphsi      	r3, 2
    216a:	0c02      	bf      	0x216e	// 216e <xTaskIncrementTick+0x76>
                xSwitchRequired = pdTRUE;
    216c:	3001      	movi      	r0, 1
            if( xYieldPending != pdFALSE )
    216e:	9860      	ld.w      	r3, (r14, 0x0)
    2170:	937d      	ld.w      	r3, (r3, 0x74)
    2172:	3b40      	cmpnei      	r3, 0
    2174:	0c02      	bf      	0x2178	// 2178 <xTaskIncrementTick+0x80>
                xSwitchRequired = pdTRUE;
    2176:	3001      	movi      	r0, 1
}
    2178:	1403      	addi      	r14, r14, 12
    217a:	1494      	pop      	r4-r7, r15
                    pxTCB = listGET_OWNER_OF_HEAD_ENTRY( pxDelayedTaskList ); /*lint !e9079 void * is used as this macro is used with timers and co-routines too.  Alignment is known to be fine as the type of the pointer stored and retrieved is the same. */
    217c:	9460      	ld.w      	r3, (r4, 0x0)
    217e:	9363      	ld.w      	r3, (r3, 0xc)
    2180:	9363      	ld.w      	r3, (r3, 0xc)
                    xItemValue = listGET_LIST_ITEM_VALUE( &( pxTCB->xStateListItem ) );
    2182:	9341      	ld.w      	r2, (r3, 0x4)
                    if( xConstTickCount < xItemValue )
    2184:	649c      	cmphs      	r7, r2
    2186:	0803      	bt      	0x218c	// 218c <xTaskIncrementTick+0x94>
                        xNextTaskUnblockTime = xItemValue;
    2188:	b441      	st.w      	r2, (r4, 0x4)
    218a:	07e7      	br      	0x2158	// 2158 <xTaskIncrementTick+0x60>
                    listREMOVE_ITEM( &( pxTCB->xStateListItem ) );
    218c:	93c2      	ld.w      	r6, (r3, 0x8)
    218e:	9323      	ld.w      	r1, (r3, 0xc)
    2190:	9345      	ld.w      	r2, (r3, 0x14)
    2192:	b622      	st.w      	r1, (r6, 0x8)
    2194:	9323      	ld.w      	r1, (r3, 0xc)
    2196:	b1c1      	st.w      	r6, (r1, 0x4)
    2198:	5bce      	addi      	r6, r3, 4
    219a:	b8c1      	st.w      	r6, (r14, 0x4)
    219c:	5bae      	addi      	r5, r3, 4
    219e:	92c1      	ld.w      	r6, (r2, 0x4)
    21a0:	655a      	cmpne      	r6, r5
    21a2:	0802      	bt      	0x21a6	// 21a6 <xTaskIncrementTick+0xae>
    21a4:	b221      	st.w      	r1, (r2, 0x4)
    21a6:	3100      	movi      	r1, 0
    21a8:	b325      	st.w      	r1, (r3, 0x14)
    21aa:	9220      	ld.w      	r1, (r2, 0x0)
    21ac:	2900      	subi      	r1, 1
    21ae:	b220      	st.w      	r1, (r2, 0x0)
                    if( listLIST_ITEM_CONTAINER( &( pxTCB->xEventListItem ) ) != NULL )
    21b0:	934a      	ld.w      	r2, (r3, 0x28)
    21b2:	3a40      	cmpnei      	r2, 0
    21b4:	0c11      	bf      	0x21d6	// 21d6 <xTaskIncrementTick+0xde>
                        listREMOVE_ITEM( &( pxTCB->xEventListItem ) );
    21b6:	9327      	ld.w      	r1, (r3, 0x1c)
    21b8:	93c8      	ld.w      	r6, (r3, 0x20)
    21ba:	b1c2      	st.w      	r6, (r1, 0x8)
    21bc:	93c8      	ld.w      	r6, (r3, 0x20)
    21be:	b621      	st.w      	r1, (r6, 0x4)
    21c0:	3118      	movi      	r1, 24
    21c2:	604c      	addu      	r1, r3
    21c4:	92a1      	ld.w      	r5, (r2, 0x4)
    21c6:	6456      	cmpne      	r5, r1
    21c8:	0802      	bt      	0x21cc	// 21cc <xTaskIncrementTick+0xd4>
    21ca:	b2c1      	st.w      	r6, (r2, 0x4)
    21cc:	3100      	movi      	r1, 0
    21ce:	b32a      	st.w      	r1, (r3, 0x28)
    21d0:	9220      	ld.w      	r1, (r2, 0x0)
    21d2:	2900      	subi      	r1, 1
    21d4:	b220      	st.w      	r1, (r2, 0x0)
                    prvAddTaskToReadyList( pxTCB );
    21d6:	9840      	ld.w      	r2, (r14, 0x0)
    21d8:	932b      	ld.w      	r1, (r3, 0x2c)
    21da:	925b      	ld.w      	r2, (r2, 0x6c)
    21dc:	6448      	cmphs      	r2, r1
    21de:	0803      	bt      	0x21e4	// 21e4 <xTaskIncrementTick+0xec>
    21e0:	9840      	ld.w      	r2, (r14, 0x0)
    21e2:	b23b      	st.w      	r1, (r2, 0x6c)
    21e4:	4142      	lsli      	r2, r1, 2
    21e6:	6084      	addu      	r2, r1
    21e8:	98a2      	ld.w      	r5, (r14, 0x8)
    21ea:	4242      	lsli      	r2, r2, 2
    21ec:	6094      	addu      	r2, r5
    21ee:	92c1      	ld.w      	r6, (r2, 0x4)
    21f0:	96a2      	ld.w      	r5, (r6, 0x8)
    21f2:	b3a3      	st.w      	r5, (r3, 0xc)
    21f4:	96a2      	ld.w      	r5, (r6, 0x8)
    21f6:	b841      	st.w      	r2, (r14, 0x4)
    21f8:	5b4e      	addi      	r2, r3, 4
    21fa:	b3c2      	st.w      	r6, (r3, 0x8)
    21fc:	b541      	st.w      	r2, (r5, 0x4)
    21fe:	b642      	st.w      	r2, (r6, 0x8)
    2200:	9841      	ld.w      	r2, (r14, 0x4)
    2202:	b345      	st.w      	r2, (r3, 0x14)
    2204:	9260      	ld.w      	r3, (r2, 0x0)
    2206:	2300      	addi      	r3, 1
    2208:	b260      	st.w      	r3, (r2, 0x0)
                        if( pxTCB->uxPriority > pxCurrentTCB->uxPriority )
    220a:	9463      	ld.w      	r3, (r4, 0xc)
    220c:	936b      	ld.w      	r3, (r3, 0x2c)
    220e:	644c      	cmphs      	r3, r1
    2210:	0b9e      	bt      	0x214c	// 214c <xTaskIncrementTick+0x54>
                            xSwitchRequired = pdTRUE;
    2212:	3001      	movi      	r0, 1
    2214:	079c      	br      	0x214c	// 214c <xTaskIncrementTick+0x54>
        ++xPendedTicks;
    2216:	23ff      	addi      	r3, 256
    2218:	9340      	ld.w      	r2, (r3, 0x0)
    221a:	2200      	addi      	r2, 1
    221c:	b340      	st.w      	r2, (r3, 0x0)
    BaseType_t xSwitchRequired = pdFALSE;
    221e:	3000      	movi      	r0, 0
    return xSwitchRequired;
    2220:	07ac      	br      	0x2178	// 2178 <xTaskIncrementTick+0x80>
    2222:	0000      	bkpt
    2224:	200000dc 	.long	0x200000dc
    2228:	00000ab7 	.long	0x00000ab7
    222c:	00002b30 	.long	0x00002b30
    2230:	00002b41 	.long	0x00002b41
    2234:	20000120 	.long	0x20000120

Disassembly of section .text.xTaskResumeAll:

00002238 <xTaskResumeAll>:
{
    2238:	14d4      	push      	r4-r7, r15
    223a:	1423      	subi      	r14, r14, 12
    configASSERT( uxSchedulerSuspended );
    223c:	12a7      	lrw      	r5, 0x200000dc	// 2358 <xTaskResumeAll+0x120>
    223e:	3480      	movi      	r4, 128
    2240:	6114      	addu      	r4, r5
    2242:	947c      	ld.w      	r3, (r4, 0x70)
    2244:	3b40      	cmpnei      	r3, 0
    2246:	0807      	bt      	0x2254	// 2254 <xTaskResumeAll+0x1c>
    2248:	1245      	lrw      	r2, 0x885	// 235c <xTaskResumeAll+0x124>
    224a:	1226      	lrw      	r1, 0x2b30	// 2360 <xTaskResumeAll+0x128>
    224c:	1206      	lrw      	r0, 0x2b41	// 2364 <xTaskResumeAll+0x12c>
    224e:	e3fff013 	bsr      	0x274	// 274 <__cskyvprintfprintf>
    2252:	0400      	br      	0x2252	// 2252 <xTaskResumeAll+0x1a>
    taskENTER_CRITICAL();
    2254:	e0000252 	bsr      	0x26f8	// 26f8 <vPortEnterCritical>
        --uxSchedulerSuspended;
    2258:	947c      	ld.w      	r3, (r4, 0x70)
    225a:	2b00      	subi      	r3, 1
    225c:	b47c      	st.w      	r3, (r4, 0x70)
        if( uxSchedulerSuspended == ( UBaseType_t ) pdFALSE )
    225e:	947c      	ld.w      	r3, (r4, 0x70)
    2260:	3b40      	cmpnei      	r3, 0
    2262:	0c07      	bf      	0x2270	// 2270 <xTaskResumeAll+0x38>
    BaseType_t xAlreadyYielded = pdFALSE;
    2264:	3400      	movi      	r4, 0
    taskEXIT_CRITICAL();
    2266:	e0000253 	bsr      	0x270c	// 270c <vPortExitCritical>
}
    226a:	6c13      	mov      	r0, r4
    226c:	1403      	addi      	r14, r14, 12
    226e:	1494      	pop      	r4-r7, r15
            if( uxCurrentNumberOfTasks > ( UBaseType_t ) 0U )
    2270:	956f      	ld.w      	r3, (r5, 0x3c)
    2272:	3b40      	cmpnei      	r3, 0
    2274:	0ff8      	bf      	0x2264	// 2264 <xTaskResumeAll+0x2c>
                    pxTCB = listGET_OWNER_OF_HEAD_ENTRY( ( &xPendingReadyList ) ); /*lint !e9079 void * is used as this macro is used with timers and co-routines too.  Alignment is known to be fine as the type of the pointer stored and retrieved is the same. */
    2276:	32d0      	movi      	r2, 208
    2278:	6094      	addu      	r2, r5
    227a:	9263      	ld.w      	r3, (r2, 0xc)
    227c:	b841      	st.w      	r2, (r14, 0x4)
                    prvAddTaskToReadyList( pxTCB );
    227e:	3244      	movi      	r2, 68
    2280:	6094      	addu      	r2, r5
                    pxTCB = listGET_OWNER_OF_HEAD_ENTRY( ( &xPendingReadyList ) ); /*lint !e9079 void * is used as this macro is used with timers and co-routines too.  Alignment is known to be fine as the type of the pointer stored and retrieved is the same. */
    2282:	b860      	st.w      	r3, (r14, 0x0)
                    prvAddTaskToReadyList( pxTCB );
    2284:	b842      	st.w      	r2, (r14, 0x8)
                    pxTCB = listGET_OWNER_OF_HEAD_ENTRY( ( &xPendingReadyList ) ); /*lint !e9079 void * is used as this macro is used with timers and co-routines too.  Alignment is known to be fine as the type of the pointer stored and retrieved is the same. */
    2286:	3300      	movi      	r3, 0
                while( listLIST_IS_EMPTY( &xPendingReadyList ) == pdFALSE )
    2288:	9841      	ld.w      	r2, (r14, 0x4)
    228a:	9240      	ld.w      	r2, (r2, 0x0)
    228c:	3a40      	cmpnei      	r2, 0
    228e:	0821      	bt      	0x22d0	// 22d0 <xTaskResumeAll+0x98>
                if( pxTCB != NULL )
    2290:	3b40      	cmpnei      	r3, 0
    2292:	0c03      	bf      	0x2298	// 2298 <xTaskResumeAll+0x60>
                    prvResetNextTaskUnblockTime();
    2294:	e3fffd30 	bsr      	0x1cf4	// 1cf4 <prvResetNextTaskUnblockTime>
                    TickType_t xPendedCounts = xPendedTicks; /* Non-volatile copy. */
    2298:	1174      	lrw      	r3, 0x200001dc	// 2368 <xTaskResumeAll+0x130>
    229a:	93a0      	ld.w      	r5, (r3, 0x0)
                    if( xPendedCounts > ( TickType_t ) 0U )
    229c:	3d40      	cmpnei      	r5, 0
    229e:	6d8f      	mov      	r6, r3
    22a0:	0c0b      	bf      	0x22b6	// 22b6 <xTaskResumeAll+0x7e>
                            if( xTaskIncrementTick() != pdFALSE )
    22a2:	e3ffff2b 	bsr      	0x20f8	// 20f8 <xTaskIncrementTick>
    22a6:	3840      	cmpnei      	r0, 0
    22a8:	0c03      	bf      	0x22ae	// 22ae <xTaskResumeAll+0x76>
                                xYieldPending = pdTRUE;
    22aa:	3301      	movi      	r3, 1
    22ac:	b47d      	st.w      	r3, (r4, 0x74)
                            --xPendedCounts;
    22ae:	2d00      	subi      	r5, 1
                        } while( xPendedCounts > ( TickType_t ) 0U );
    22b0:	3d40      	cmpnei      	r5, 0
    22b2:	0bf8      	bt      	0x22a2	// 22a2 <xTaskResumeAll+0x6a>
                        xPendedTicks = 0;
    22b4:	b6a0      	st.w      	r5, (r6, 0x0)
                if( xYieldPending != pdFALSE )
    22b6:	947d      	ld.w      	r3, (r4, 0x74)
    22b8:	3b40      	cmpnei      	r3, 0
    22ba:	0fd5      	bf      	0x2264	// 2264 <xTaskResumeAll+0x2c>
                    taskYIELD_IF_USING_PREEMPTION();
    22bc:	116c      	lrw      	r3, 0x2000006c	// 236c <xTaskResumeAll+0x134>
    22be:	9360      	ld.w      	r3, (r3, 0x0)
    22c0:	3b40      	cmpnei      	r3, 0
    22c2:	0846      	bt      	0x234e	// 234e <xTaskResumeAll+0x116>
    22c4:	e3ffef93 	bsr      	0x1ea	// 1ea <vPortYield>
    22c8:	6c03      	mov      	r0, r0
    22ca:	6c03      	mov      	r0, r0
                        xAlreadyYielded = pdTRUE;
    22cc:	3401      	movi      	r4, 1
    22ce:	07cc      	br      	0x2266	// 2266 <xTaskResumeAll+0x2e>
                    pxTCB = listGET_OWNER_OF_HEAD_ENTRY( ( &xPendingReadyList ) ); /*lint !e9079 void * is used as this macro is used with timers and co-routines too.  Alignment is known to be fine as the type of the pointer stored and retrieved is the same. */
    22d0:	9860      	ld.w      	r3, (r14, 0x0)
    22d2:	9363      	ld.w      	r3, (r3, 0xc)
                    listREMOVE_ITEM( &( pxTCB->xEventListItem ) );
    22d4:	9307      	ld.w      	r0, (r3, 0x1c)
    22d6:	9328      	ld.w      	r1, (r3, 0x20)
    22d8:	934a      	ld.w      	r2, (r3, 0x28)
    22da:	b022      	st.w      	r1, (r0, 0x8)
    22dc:	9328      	ld.w      	r1, (r3, 0x20)
    22de:	b101      	st.w      	r0, (r1, 0x4)
    22e0:	3018      	movi      	r0, 24
    22e2:	600c      	addu      	r0, r3
    22e4:	92c1      	ld.w      	r6, (r2, 0x4)
    22e6:	641a      	cmpne      	r6, r0
    22e8:	0802      	bt      	0x22ec	// 22ec <xTaskResumeAll+0xb4>
    22ea:	b221      	st.w      	r1, (r2, 0x4)
    22ec:	3100      	movi      	r1, 0
    22ee:	b32a      	st.w      	r1, (r3, 0x28)
    22f0:	9220      	ld.w      	r1, (r2, 0x0)
    22f2:	2900      	subi      	r1, 1
    22f4:	b220      	st.w      	r1, (r2, 0x0)
                    listREMOVE_ITEM( &( pxTCB->xStateListItem ) );
    22f6:	9302      	ld.w      	r0, (r3, 0x8)
    22f8:	9323      	ld.w      	r1, (r3, 0xc)
    22fa:	9345      	ld.w      	r2, (r3, 0x14)
    22fc:	b022      	st.w      	r1, (r0, 0x8)
    22fe:	9323      	ld.w      	r1, (r3, 0xc)
    2300:	b101      	st.w      	r0, (r1, 0x4)
    2302:	5bce      	addi      	r6, r3, 4
    2304:	9201      	ld.w      	r0, (r2, 0x4)
    2306:	6582      	cmpne      	r0, r6
    2308:	0802      	bt      	0x230c	// 230c <xTaskResumeAll+0xd4>
    230a:	b221      	st.w      	r1, (r2, 0x4)
    230c:	3100      	movi      	r1, 0
    230e:	b325      	st.w      	r1, (r3, 0x14)
    2310:	9220      	ld.w      	r1, (r2, 0x0)
    2312:	2900      	subi      	r1, 1
    2314:	b220      	st.w      	r1, (r2, 0x0)
                    prvAddTaskToReadyList( pxTCB );
    2316:	945b      	ld.w      	r2, (r4, 0x6c)
    2318:	932b      	ld.w      	r1, (r3, 0x2c)
    231a:	6448      	cmphs      	r2, r1
    231c:	0802      	bt      	0x2320	// 2320 <xTaskResumeAll+0xe8>
    231e:	b43b      	st.w      	r1, (r4, 0x6c)
    2320:	4142      	lsli      	r2, r1, 2
    2322:	6084      	addu      	r2, r1
    2324:	9802      	ld.w      	r0, (r14, 0x8)
    2326:	4242      	lsli      	r2, r2, 2
    2328:	6080      	addu      	r2, r0
    232a:	9201      	ld.w      	r0, (r2, 0x4)
    232c:	90e2      	ld.w      	r7, (r0, 0x8)
    232e:	b3e3      	st.w      	r7, (r3, 0xc)
    2330:	90e2      	ld.w      	r7, (r0, 0x8)
    2332:	b302      	st.w      	r0, (r3, 0x8)
    2334:	b7c1      	st.w      	r6, (r7, 0x4)
    2336:	b0c2      	st.w      	r6, (r0, 0x8)
    2338:	9200      	ld.w      	r0, (r2, 0x0)
    233a:	2000      	addi      	r0, 1
    233c:	b345      	st.w      	r2, (r3, 0x14)
    233e:	b200      	st.w      	r0, (r2, 0x0)
                    if( pxTCB->uxPriority >= pxCurrentTCB->uxPriority )
    2340:	9543      	ld.w      	r2, (r5, 0xc)
    2342:	924b      	ld.w      	r2, (r2, 0x2c)
    2344:	6484      	cmphs      	r1, r2
    2346:	0fa1      	bf      	0x2288	// 2288 <xTaskResumeAll+0x50>
                        xYieldPending = pdTRUE;
    2348:	3201      	movi      	r2, 1
    234a:	b45d      	st.w      	r2, (r4, 0x74)
    234c:	079e      	br      	0x2288	// 2288 <xTaskResumeAll+0x50>
                    taskYIELD_IF_USING_PREEMPTION();
    234e:	3201      	movi      	r2, 1
    2350:	1068      	lrw      	r3, 0x20000dfc	// 2370 <xTaskResumeAll+0x138>
    2352:	b340      	st.w      	r2, (r3, 0x0)
    2354:	07ba      	br      	0x22c8	// 22c8 <xTaskResumeAll+0x90>
    2356:	0000      	bkpt
    2358:	200000dc 	.long	0x200000dc
    235c:	00000885 	.long	0x00000885
    2360:	00002b30 	.long	0x00002b30
    2364:	00002b41 	.long	0x00002b41
    2368:	200001dc 	.long	0x200001dc
    236c:	2000006c 	.long	0x2000006c
    2370:	20000dfc 	.long	0x20000dfc

Disassembly of section .text.vTaskDelay:

00002374 <vTaskDelay>:
    {
    2374:	14d0      	push      	r15
    2376:	1421      	subi      	r14, r14, 4
        if( xTicksToDelay > ( TickType_t ) 0U )
    2378:	3840      	cmpnei      	r0, 0
    237a:	080a      	bt      	0x238e	// 238e <vTaskDelay+0x1a>
            portYIELD_WITHIN_API();
    237c:	1072      	lrw      	r3, 0x2000006c	// 23c4 <vTaskDelay+0x50>
    237e:	9360      	ld.w      	r3, (r3, 0x0)
    2380:	3b40      	cmpnei      	r3, 0
    2382:	081d      	bt      	0x23bc	// 23bc <vTaskDelay+0x48>
    2384:	e3ffef33 	bsr      	0x1ea	// 1ea <vPortYield>
    2388:	6c03      	mov      	r0, r0
    238a:	6c03      	mov      	r0, r0
    }
    238c:	0416      	br      	0x23b8	// 23b8 <vTaskDelay+0x44>
            configASSERT( uxSchedulerSuspended == 0 );
    238e:	106f      	lrw      	r3, 0x2000015c	// 23c8 <vTaskDelay+0x54>
    2390:	937c      	ld.w      	r3, (r3, 0x70)
    2392:	3b40      	cmpnei      	r3, 0
    2394:	0c07      	bf      	0x23a2	// 23a2 <vTaskDelay+0x2e>
    2396:	104e      	lrw      	r2, 0x51c	// 23cc <vTaskDelay+0x58>
    2398:	102e      	lrw      	r1, 0x2b30	// 23d0 <vTaskDelay+0x5c>
    239a:	100f      	lrw      	r0, 0x2b41	// 23d4 <vTaskDelay+0x60>
    239c:	e3ffef6c 	bsr      	0x274	// 274 <__cskyvprintfprintf>
    23a0:	0400      	br      	0x23a0	// 23a0 <vTaskDelay+0x2c>
    23a2:	b800      	st.w      	r0, (r14, 0x0)
            vTaskSuspendAll();
    23a4:	e3fffea2 	bsr      	0x20e8	// 20e8 <vTaskSuspendAll>
                prvAddCurrentTaskToDelayedList( xTicksToDelay, pdFALSE );
    23a8:	3100      	movi      	r1, 0
    23aa:	9800      	ld.w      	r0, (r14, 0x0)
    23ac:	e3fffcb2 	bsr      	0x1d10	// 1d10 <prvAddCurrentTaskToDelayedList>
            xAlreadyYielded = xTaskResumeAll();
    23b0:	e3ffff44 	bsr      	0x2238	// 2238 <xTaskResumeAll>
        if( xAlreadyYielded == pdFALSE )
    23b4:	3840      	cmpnei      	r0, 0
    23b6:	0fe3      	bf      	0x237c	// 237c <vTaskDelay+0x8>
    }
    23b8:	1401      	addi      	r14, r14, 4
    23ba:	1490      	pop      	r15
            portYIELD_WITHIN_API();
    23bc:	3201      	movi      	r2, 1
    23be:	1067      	lrw      	r3, 0x20000dfc	// 23d8 <vTaskDelay+0x64>
    23c0:	b340      	st.w      	r2, (r3, 0x0)
    23c2:	07e3      	br      	0x2388	// 2388 <vTaskDelay+0x14>
    23c4:	2000006c 	.long	0x2000006c
    23c8:	2000015c 	.long	0x2000015c
    23cc:	0000051c 	.long	0x0000051c
    23d0:	00002b30 	.long	0x00002b30
    23d4:	00002b41 	.long	0x00002b41
    23d8:	20000dfc 	.long	0x20000dfc

Disassembly of section .text.vTaskSwitchContext:

000023dc <vTaskSwitchContext>:
{
    23dc:	14d4      	push      	r4-r7, r15
    23de:	1421      	subi      	r14, r14, 4
    if( uxSchedulerSuspended != ( UBaseType_t ) pdFALSE )
    23e0:	109f      	lrw      	r4, 0x200000dc	// 245c <vTaskSwitchContext+0x80>
    23e2:	3380      	movi      	r3, 128
    23e4:	60d0      	addu      	r3, r4
    23e6:	935c      	ld.w      	r2, (r3, 0x70)
    23e8:	3a40      	cmpnei      	r2, 0
    23ea:	6d4f      	mov      	r5, r3
    23ec:	0c05      	bf      	0x23f6	// 23f6 <vTaskSwitchContext+0x1a>
        xYieldPending = pdTRUE;
    23ee:	3201      	movi      	r2, 1
    23f0:	b35d      	st.w      	r2, (r3, 0x74)
}
    23f2:	1401      	addi      	r14, r14, 4
    23f4:	1494      	pop      	r4-r7, r15
        xYieldPending = pdFALSE;
    23f6:	b35d      	st.w      	r2, (r3, 0x74)
        taskCHECK_FOR_STACK_OVERFLOW();
    23f8:	9443      	ld.w      	r2, (r4, 0xc)
    23fa:	9463      	ld.w      	r3, (r4, 0xc)
    23fc:	9240      	ld.w      	r2, (r2, 0x0)
    23fe:	936c      	ld.w      	r3, (r3, 0x30)
    2400:	648c      	cmphs      	r3, r2
    2402:	0c06      	bf      	0x240e	// 240e <vTaskSwitchContext+0x32>
    2404:	9403      	ld.w      	r0, (r4, 0xc)
    2406:	9423      	ld.w      	r1, (r4, 0xc)
    2408:	2133      	addi      	r1, 52
    240a:	e00001b7 	bsr      	0x2778	// 2778 <vApplicationStackOverflowHook>
        taskSELECT_HIGHEST_PRIORITY_TASK(); /*lint !e9079 void * is used as this macro is used with timers and co-routines too.  Alignment is known to be fine as the type of the pointer stored and retrieved is the same. */
    240e:	1015      	lrw      	r0, 0x20000120	// 2460 <vTaskSwitchContext+0x84>
    2410:	957b      	ld.w      	r3, (r5, 0x6c)
    2412:	b800      	st.w      	r0, (r14, 0x0)
    2414:	4342      	lsli      	r2, r3, 2
    2416:	5a2c      	addu      	r1, r2, r3
    2418:	4122      	lsli      	r1, r1, 2
    241a:	58c4      	addu      	r6, r0, r1
    241c:	96e0      	ld.w      	r7, (r6, 0x0)
    241e:	3f40      	cmpnei      	r7, 0
    2420:	0c13      	bf      	0x2446	// 2446 <vTaskSwitchContext+0x6a>
    2422:	96e1      	ld.w      	r7, (r6, 0x4)
    2424:	2107      	addi      	r1, 8
    2426:	97e1      	ld.w      	r7, (r7, 0x4)
    2428:	6040      	addu      	r1, r0
    242a:	645e      	cmpne      	r7, r1
    242c:	b6e1      	st.w      	r7, (r6, 0x4)
    242e:	0803      	bt      	0x2434	// 2434 <vTaskSwitchContext+0x58>
    2430:	9721      	ld.w      	r1, (r7, 0x4)
    2432:	b621      	st.w      	r1, (r6, 0x4)
    2434:	608c      	addu      	r2, r3
    2436:	4242      	lsli      	r2, r2, 2
    2438:	9820      	ld.w      	r1, (r14, 0x0)
    243a:	6048      	addu      	r1, r2
    243c:	9141      	ld.w      	r2, (r1, 0x4)
    243e:	9243      	ld.w      	r2, (r2, 0xc)
    2440:	b443      	st.w      	r2, (r4, 0xc)
    2442:	b57b      	st.w      	r3, (r5, 0x6c)
}
    2444:	07d7      	br      	0x23f2	// 23f2 <vTaskSwitchContext+0x16>
        taskSELECT_HIGHEST_PRIORITY_TASK(); /*lint !e9079 void * is used as this macro is used with timers and co-routines too.  Alignment is known to be fine as the type of the pointer stored and retrieved is the same. */
    2446:	3b40      	cmpnei      	r3, 0
    2448:	0807      	bt      	0x2456	// 2456 <vTaskSwitchContext+0x7a>
    244a:	1047      	lrw      	r2, 0xbf6	// 2464 <vTaskSwitchContext+0x88>
    244c:	1027      	lrw      	r1, 0x2b30	// 2468 <vTaskSwitchContext+0x8c>
    244e:	1008      	lrw      	r0, 0x2b41	// 246c <vTaskSwitchContext+0x90>
    2450:	e3ffef12 	bsr      	0x274	// 274 <__cskyvprintfprintf>
    2454:	0400      	br      	0x2454	// 2454 <vTaskSwitchContext+0x78>
    2456:	2b00      	subi      	r3, 1
    2458:	07de      	br      	0x2414	// 2414 <vTaskSwitchContext+0x38>
    245a:	0000      	bkpt
    245c:	200000dc 	.long	0x200000dc
    2460:	20000120 	.long	0x20000120
    2464:	00000bf6 	.long	0x00000bf6
    2468:	00002b30 	.long	0x00002b30
    246c:	00002b41 	.long	0x00002b41

Disassembly of section .text.prvInsertBlockIntoFreeList:

00002470 <prvInsertBlockIntoFreeList>:
    xFreeBytesRemaining = pxFirstFreeBlock->xBlockSize;
}
/*-----------------------------------------------------------*/

static void prvInsertBlockIntoFreeList( BlockLink_t * pxBlockToInsert ) /* PRIVILEGED_FUNCTION */
{
    2470:	14c2      	push      	r4-r5
    BlockLink_t * pxIterator;
    uint8_t * puc;

    /* Iterate through the list until a block is found that has a higher address
     * than the block being inserted. */
    for( pxIterator = &xStart; pxIterator->pxNextFreeBlock < pxBlockToInsert; pxIterator = pxIterator->pxNextFreeBlock )
    2472:	1070      	lrw      	r3, 0x200001e0	// 24b0 <prvInsertBlockIntoFreeList+0x40>
    2474:	6d4f      	mov      	r5, r3
    2476:	9340      	ld.w      	r2, (r3, 0x0)
    2478:	6408      	cmphs      	r2, r0
    247a:	0c19      	bf      	0x24ac	// 24ac <prvInsertBlockIntoFreeList+0x3c>

    /* Do the block being inserted, and the block it is being inserted after
     * make a contiguous block of memory? */
    puc = ( uint8_t * ) pxIterator;

    if( ( puc + pxIterator->xBlockSize ) == ( uint8_t * ) pxBlockToInsert )
    247c:	9381      	ld.w      	r4, (r3, 0x4)
    247e:	5b30      	addu      	r1, r3, r4
    2480:	6442      	cmpne      	r0, r1
    2482:	0805      	bt      	0x248c	// 248c <prvInsertBlockIntoFreeList+0x1c>
    {
        pxIterator->xBlockSize += pxBlockToInsert->xBlockSize;
    2484:	9021      	ld.w      	r1, (r0, 0x4)
    2486:	6050      	addu      	r1, r4
    2488:	b321      	st.w      	r1, (r3, 0x4)
    248a:	6c0f      	mov      	r0, r3

    /* Do the block being inserted, and the block it is being inserted before
     * make a contiguous block of memory? */
    puc = ( uint8_t * ) pxBlockToInsert;

    if( ( puc + pxBlockToInsert->xBlockSize ) == ( uint8_t * ) pxIterator->pxNextFreeBlock )
    248c:	9081      	ld.w      	r4, (r0, 0x4)
    248e:	5830      	addu      	r1, r0, r4
    2490:	644a      	cmpne      	r2, r1
    2492:	0808      	bt      	0x24a2	// 24a2 <prvInsertBlockIntoFreeList+0x32>
    {
        if( pxIterator->pxNextFreeBlock != pxEnd )
    2494:	9522      	ld.w      	r1, (r5, 0x8)
    2496:	644a      	cmpne      	r2, r1
    2498:	0c05      	bf      	0x24a2	// 24a2 <prvInsertBlockIntoFreeList+0x32>
        {
            /* Form one big block from the two blocks. */
            pxBlockToInsert->xBlockSize += pxIterator->pxNextFreeBlock->xBlockSize;
    249a:	9221      	ld.w      	r1, (r2, 0x4)
    249c:	6050      	addu      	r1, r4
    249e:	b021      	st.w      	r1, (r0, 0x4)
            pxBlockToInsert->pxNextFreeBlock = pxIterator->pxNextFreeBlock->pxNextFreeBlock;
    24a0:	9240      	ld.w      	r2, (r2, 0x0)

    /* If the block being inserted plugged a gab, so was merged with the block
     * before and the block after, then it's pxNextFreeBlock pointer will have
     * already been set, and should not be set here as that would make it point
     * to itself. */
    if( pxIterator != pxBlockToInsert )
    24a2:	64c2      	cmpne      	r0, r3
        pxBlockToInsert->pxNextFreeBlock = pxIterator->pxNextFreeBlock;
    24a4:	b040      	st.w      	r2, (r0, 0x0)
    if( pxIterator != pxBlockToInsert )
    24a6:	0c02      	bf      	0x24aa	// 24aa <prvInsertBlockIntoFreeList+0x3a>
    {
        pxIterator->pxNextFreeBlock = pxBlockToInsert;
    24a8:	b300      	st.w      	r0, (r3, 0x0)
    }
    else
    {
        mtCOVERAGE_TEST_MARKER();
    }
}
    24aa:	1482      	pop      	r4-r5
    24ac:	6ccb      	mov      	r3, r2
    24ae:	07e4      	br      	0x2476	// 2476 <prvInsertBlockIntoFreeList+0x6>
    24b0:	200001e0 	.long	0x200001e0

Disassembly of section .text.pvPortMalloc:

000024b4 <pvPortMalloc>:
{
    24b4:	14d4      	push      	r4-r7, r15
    24b6:	1421      	subi      	r14, r14, 4
    24b8:	6d03      	mov      	r4, r0
    vTaskSuspendAll();
    24ba:	e3fffe17 	bsr      	0x20e8	// 20e8 <vTaskSuspendAll>
        if( pxEnd == NULL )
    24be:	1221      	lrw      	r1, 0x200001e0	// 25c0 <pvPortMalloc+0x10c>
    24c0:	9162      	ld.w      	r3, (r1, 0x8)
    24c2:	3b40      	cmpnei      	r3, 0
    24c4:	081d      	bt      	0x24fe	// 24fe <pvPortMalloc+0x4a>
    uxAddress = ( portPOINTER_SIZE_TYPE ) ucHeap;
    24c6:	320c      	movi      	r2, 12
    24c8:	6084      	addu      	r2, r1
    if( ( uxAddress & portBYTE_ALIGNMENT_MASK ) != 0 )
    24ca:	3307      	movi      	r3, 7
    24cc:	6c0b      	mov      	r0, r2
    24ce:	680c      	and      	r0, r3
    24d0:	11bd      	lrw      	r5, 0xc0c	// 25c4 <pvPortMalloc+0x110>
    24d2:	3840      	cmpnei      	r0, 0
    24d4:	6144      	addu      	r5, r1
    24d6:	0c2f      	bf      	0x2534	// 2534 <pvPortMalloc+0x80>
        uxAddress += ( portBYTE_ALIGNMENT - 1 );
    24d8:	2206      	addi      	r2, 7
        uxAddress &= ~( ( portPOINTER_SIZE_TYPE ) portBYTE_ALIGNMENT_MASK );
    24da:	688d      	andn      	r2, r3
        xTotalHeapSize -= uxAddress - ( portPOINTER_SIZE_TYPE ) ucHeap;
    24dc:	5d69      	subu      	r3, r5, r2
    uxAddress = ( ( portPOINTER_SIZE_TYPE ) pucAlignedHeap ) + xTotalHeapSize;
    24de:	60c8      	addu      	r3, r2
    uxAddress -= xHeapStructSize;
    24e0:	2b07      	subi      	r3, 8
    uxAddress &= ~( ( portPOINTER_SIZE_TYPE ) portBYTE_ALIGNMENT_MASK );
    24e2:	3607      	movi      	r6, 7
    24e4:	68d9      	andn      	r3, r6
    xStart.xBlockSize = ( size_t ) 0;
    24e6:	3000      	movi      	r0, 0
    24e8:	b101      	st.w      	r0, (r1, 0x4)
    xStart.pxNextFreeBlock = ( void * ) pucAlignedHeap;
    24ea:	b140      	st.w      	r2, (r1, 0x0)
    pxEnd->xBlockSize = 0;
    24ec:	b301      	st.w      	r0, (r3, 0x4)
    pxEnd->pxNextFreeBlock = NULL;
    24ee:	b300      	st.w      	r0, (r3, 0x0)
    pxEnd = ( BlockLink_t * ) uxAddress;
    24f0:	b162      	st.w      	r3, (r1, 0x8)
    pxFirstFreeBlock->xBlockSize = ( size_t ) ( uxAddress - ( portPOINTER_SIZE_TYPE ) pxFirstFreeBlock );
    24f2:	5b09      	subu      	r0, r3, r2
    pxFirstFreeBlock->pxNextFreeBlock = pxEnd;
    24f4:	b260      	st.w      	r3, (r2, 0x0)
    xFreeBytesRemaining = pxFirstFreeBlock->xBlockSize;
    24f6:	1175      	lrw      	r3, 0x20000df0	// 25c8 <pvPortMalloc+0x114>
    pxFirstFreeBlock->xBlockSize = ( size_t ) ( uxAddress - ( portPOINTER_SIZE_TYPE ) pxFirstFreeBlock );
    24f8:	b201      	st.w      	r0, (r2, 0x4)
    xMinimumEverFreeBytesRemaining = pxFirstFreeBlock->xBlockSize;
    24fa:	b500      	st.w      	r0, (r5, 0x0)
    xFreeBytesRemaining = pxFirstFreeBlock->xBlockSize;
    24fc:	b300      	st.w      	r0, (r3, 0x0)
        if( xWantedSize > 0 )
    24fe:	3c40      	cmpnei      	r4, 0
    2500:	0c18      	bf      	0x2530	// 2530 <pvPortMalloc+0x7c>
            xAdditionalRequiredSize = xHeapStructSize + portBYTE_ALIGNMENT - ( xWantedSize & portBYTE_ALIGNMENT_MASK );
    2502:	3207      	movi      	r2, 7
    2504:	6890      	and      	r2, r4
    2506:	3310      	movi      	r3, 16
    2508:	60ca      	subu      	r3, r2
            if( heapADD_WILL_OVERFLOW( xWantedSize, xAdditionalRequiredSize ) == 0 )
    250a:	6c8f      	mov      	r2, r3
    250c:	6c8a      	nor      	r2, r2
    250e:	6508      	cmphs      	r2, r4
    2510:	0c10      	bf      	0x2530	// 2530 <pvPortMalloc+0x7c>
                xWantedSize += xAdditionalRequiredSize;
    2512:	610c      	addu      	r4, r3
            if( ( xWantedSize > 0 ) && ( xWantedSize <= xFreeBytesRemaining ) )
    2514:	3c20      	cmplti      	r4, 1
    2516:	080d      	bt      	0x2530	// 2530 <pvPortMalloc+0x7c>
    2518:	114c      	lrw      	r2, 0x20000df0	// 25c8 <pvPortMalloc+0x114>
    251a:	92e0      	ld.w      	r7, (r2, 0x0)
    251c:	651c      	cmphs      	r7, r4
    251e:	0c09      	bf      	0x2530	// 2530 <pvPortMalloc+0x7c>
                pxBlock = xStart.pxNextFreeBlock;
    2520:	91a0      	ld.w      	r5, (r1, 0x0)
                pxPreviousBlock = &xStart;
    2522:	1108      	lrw      	r0, 0x200001e0	// 25c0 <pvPortMalloc+0x10c>
                while( ( pxBlock->xBlockSize < xWantedSize ) && ( pxBlock->pxNextFreeBlock != NULL ) )
    2524:	9561      	ld.w      	r3, (r5, 0x4)
    2526:	650c      	cmphs      	r3, r4
    2528:	0c09      	bf      	0x253a	// 253a <pvPortMalloc+0x86>
                if( pxBlock != pxEnd )
    252a:	9122      	ld.w      	r1, (r1, 0x8)
    252c:	6456      	cmpne      	r5, r1
    252e:	080c      	bt      	0x2546	// 2546 <pvPortMalloc+0x92>
    void * pvReturn = NULL;
    2530:	3600      	movi      	r6, 0
    2532:	0432      	br      	0x2596	// 2596 <pvPortMalloc+0xe2>
    size_t xTotalHeapSize = configTOTAL_HEAP_SIZE;
    2534:	33c0      	movi      	r3, 192
    2536:	4364      	lsli      	r3, r3, 4
    2538:	07d3      	br      	0x24de	// 24de <pvPortMalloc+0x2a>
                while( ( pxBlock->xBlockSize < xWantedSize ) && ( pxBlock->pxNextFreeBlock != NULL ) )
    253a:	95c0      	ld.w      	r6, (r5, 0x0)
    253c:	3e40      	cmpnei      	r6, 0
    253e:	0ff6      	bf      	0x252a	// 252a <pvPortMalloc+0x76>
    2540:	6c17      	mov      	r0, r5
    2542:	6d5b      	mov      	r5, r6
    2544:	07f0      	br      	0x2524	// 2524 <pvPortMalloc+0x70>
                    if( ( pxBlock->xBlockSize - xWantedSize ) > heapMINIMUM_BLOCK_SIZE )
    2546:	60d2      	subu      	r3, r4
                    pvReturn = ( void * ) ( ( ( uint8_t * ) pxPreviousBlock->pxNextFreeBlock ) + xHeapStructSize );
    2548:	90c0      	ld.w      	r6, (r0, 0x0)
                    pxPreviousBlock->pxNextFreeBlock = pxBlock->pxNextFreeBlock;
    254a:	9520      	ld.w      	r1, (r5, 0x0)
                    if( ( pxBlock->xBlockSize - xWantedSize ) > heapMINIMUM_BLOCK_SIZE )
    254c:	3b10      	cmphsi      	r3, 17
                    pvReturn = ( void * ) ( ( ( uint8_t * ) pxPreviousBlock->pxNextFreeBlock ) + xHeapStructSize );
    254e:	2607      	addi      	r6, 8
                    pxPreviousBlock->pxNextFreeBlock = pxBlock->pxNextFreeBlock;
    2550:	b020      	st.w      	r1, (r0, 0x0)
                    if( ( pxBlock->xBlockSize - xWantedSize ) > heapMINIMUM_BLOCK_SIZE )
    2552:	0c12      	bf      	0x2576	// 2576 <pvPortMalloc+0xc2>
                        pxNewBlockLink = ( void * ) ( ( ( uint8_t * ) pxBlock ) + xWantedSize );
    2554:	5d10      	addu      	r0, r5, r4
                        configASSERT( ( ( ( size_t ) pxNewBlockLink ) & portBYTE_ALIGNMENT_MASK ) == 0 );
    2556:	3107      	movi      	r1, 7
    2558:	6840      	and      	r1, r0
    255a:	3940      	cmpnei      	r1, 0
    255c:	0c07      	bf      	0x256a	// 256a <pvPortMalloc+0xb6>
    255e:	32dc      	movi      	r2, 220
    2560:	103b      	lrw      	r1, 0x2b57	// 25cc <pvPortMalloc+0x118>
    2562:	101c      	lrw      	r0, 0x2b41	// 25d0 <pvPortMalloc+0x11c>
    2564:	e3ffee88 	bsr      	0x274	// 274 <__cskyvprintfprintf>
    2568:	0400      	br      	0x2568	// 2568 <pvPortMalloc+0xb4>
                        pxNewBlockLink->xBlockSize = pxBlock->xBlockSize - xWantedSize;
    256a:	b061      	st.w      	r3, (r0, 0x4)
                        pxBlock->xBlockSize = xWantedSize;
    256c:	b581      	st.w      	r4, (r5, 0x4)
    256e:	b840      	st.w      	r2, (r14, 0x0)
                        prvInsertBlockIntoFreeList( pxNewBlockLink );
    2570:	e3ffff80 	bsr      	0x2470	// 2470 <prvInsertBlockIntoFreeList>
    2574:	9840      	ld.w      	r2, (r14, 0x0)
                    xFreeBytesRemaining -= pxBlock->xBlockSize;
    2576:	9521      	ld.w      	r1, (r5, 0x4)
    2578:	5f65      	subu      	r3, r7, r1
    257a:	b260      	st.w      	r3, (r2, 0x0)
                    if( xFreeBytesRemaining < xMinimumEverFreeBytesRemaining )
    257c:	1056      	lrw      	r2, 0x20000dec	// 25d4 <pvPortMalloc+0x120>
    257e:	9200      	ld.w      	r0, (r2, 0x0)
    2580:	640c      	cmphs      	r3, r0
    2582:	0802      	bt      	0x2586	// 2586 <pvPortMalloc+0xd2>
                        xMinimumEverFreeBytesRemaining = xFreeBytesRemaining;
    2584:	b260      	st.w      	r3, (r2, 0x0)
                    pxBlock->pxNextFreeBlock = NULL;
    2586:	3300      	movi      	r3, 0
                    xNumberOfSuccessfulAllocations++;
    2588:	1054      	lrw      	r2, 0x20000df4	// 25d8 <pvPortMalloc+0x124>
                    pxBlock->pxNextFreeBlock = NULL;
    258a:	b560      	st.w      	r3, (r5, 0x0)
                    xNumberOfSuccessfulAllocations++;
    258c:	9260      	ld.w      	r3, (r2, 0x0)
                    heapALLOCATE_BLOCK( pxBlock );
    258e:	39bf      	bseti      	r1, 31
                    xNumberOfSuccessfulAllocations++;
    2590:	2300      	addi      	r3, 1
                    heapALLOCATE_BLOCK( pxBlock );
    2592:	b521      	st.w      	r1, (r5, 0x4)
                    xNumberOfSuccessfulAllocations++;
    2594:	b260      	st.w      	r3, (r2, 0x0)
    ( void ) xTaskResumeAll();
    2596:	e3fffe51 	bsr      	0x2238	// 2238 <xTaskResumeAll>
        if( pvReturn == NULL )
    259a:	3e40      	cmpnei      	r6, 0
    259c:	0803      	bt      	0x25a2	// 25a2 <pvPortMalloc+0xee>
            vApplicationMallocFailedHook();
    259e:	e00000ee 	bsr      	0x277a	// 277a <vApplicationMallocFailedHook>
    configASSERT( ( ( ( size_t ) pvReturn ) & ( size_t ) portBYTE_ALIGNMENT_MASK ) == 0 );
    25a2:	3307      	movi      	r3, 7
    25a4:	68d8      	and      	r3, r6
    25a6:	3b40      	cmpnei      	r3, 0
    25a8:	0c08      	bf      	0x25b8	// 25b8 <pvPortMalloc+0x104>
    25aa:	328e      	movi      	r2, 142
    25ac:	4241      	lsli      	r2, r2, 1
    25ae:	1028      	lrw      	r1, 0x2b57	// 25cc <pvPortMalloc+0x118>
    25b0:	1008      	lrw      	r0, 0x2b41	// 25d0 <pvPortMalloc+0x11c>
    25b2:	e3ffee61 	bsr      	0x274	// 274 <__cskyvprintfprintf>
    25b6:	0400      	br      	0x25b6	// 25b6 <pvPortMalloc+0x102>
}
    25b8:	6c1b      	mov      	r0, r6
    25ba:	1401      	addi      	r14, r14, 4
    25bc:	1494      	pop      	r4-r7, r15
    25be:	0000      	bkpt
    25c0:	200001e0 	.long	0x200001e0
    25c4:	00000c0c 	.long	0x00000c0c
    25c8:	20000df0 	.long	0x20000df0
    25cc:	00002b57 	.long	0x00002b57
    25d0:	00002b41 	.long	0x00002b41
    25d4:	20000dec 	.long	0x20000dec
    25d8:	20000df4 	.long	0x20000df4

Disassembly of section .text.vPortFree:

000025dc <vPortFree>:
{
    25dc:	14d2      	push      	r4-r5, r15
    if( pv != NULL )
    25de:	3840      	cmpnei      	r0, 0
    25e0:	0c28      	bf      	0x2630	// 2630 <vPortFree+0x54>
        puc -= xHeapStructSize;
    25e2:	589f      	subi      	r4, r0, 8
        configASSERT( heapBLOCK_IS_ALLOCATED( pxLink ) != 0 );
    25e4:	9461      	ld.w      	r3, (r4, 0x4)
    25e6:	3bdf      	btsti      	r3, 31
    25e8:	0807      	bt      	0x25f6	// 25f6 <vPortFree+0x1a>
    25ea:	1053      	lrw      	r2, 0x12f	// 2634 <vPortFree+0x58>
    25ec:	1033      	lrw      	r1, 0x2b57	// 2638 <vPortFree+0x5c>
    25ee:	1014      	lrw      	r0, 0x2b41	// 263c <vPortFree+0x60>
    25f0:	e3ffee42 	bsr      	0x274	// 274 <__cskyvprintfprintf>
    25f4:	0400      	br      	0x25f4	// 25f4 <vPortFree+0x18>
        configASSERT( pxLink->pxNextFreeBlock == NULL );
    25f6:	9440      	ld.w      	r2, (r4, 0x0)
    25f8:	3a40      	cmpnei      	r2, 0
    25fa:	0c08      	bf      	0x260a	// 260a <vPortFree+0x2e>
    25fc:	3298      	movi      	r2, 152
    25fe:	4241      	lsli      	r2, r2, 1
    2600:	102e      	lrw      	r1, 0x2b57	// 2638 <vPortFree+0x5c>
    2602:	100f      	lrw      	r0, 0x2b41	// 263c <vPortFree+0x60>
    2604:	e3ffee38 	bsr      	0x274	// 274 <__cskyvprintfprintf>
    2608:	0400      	br      	0x2608	// 2608 <vPortFree+0x2c>
                heapFREE_BLOCK( pxLink );
    260a:	4361      	lsli      	r3, r3, 1
    260c:	4b61      	lsri      	r3, r3, 1
                    xFreeBytesRemaining += pxLink->xBlockSize;
    260e:	10ad      	lrw      	r5, 0x20000df0	// 2640 <vPortFree+0x64>
                heapFREE_BLOCK( pxLink );
    2610:	b461      	st.w      	r3, (r4, 0x4)
                vTaskSuspendAll();
    2612:	e3fffd6b 	bsr      	0x20e8	// 20e8 <vTaskSuspendAll>
                    xFreeBytesRemaining += pxLink->xBlockSize;
    2616:	9540      	ld.w      	r2, (r5, 0x0)
    2618:	9461      	ld.w      	r3, (r4, 0x4)
    261a:	60c8      	addu      	r3, r2
                    prvInsertBlockIntoFreeList( ( ( BlockLink_t * ) pxLink ) );
    261c:	6c13      	mov      	r0, r4
                    xFreeBytesRemaining += pxLink->xBlockSize;
    261e:	b560      	st.w      	r3, (r5, 0x0)
                    prvInsertBlockIntoFreeList( ( ( BlockLink_t * ) pxLink ) );
    2620:	e3ffff28 	bsr      	0x2470	// 2470 <prvInsertBlockIntoFreeList>
                    xNumberOfSuccessfulFrees++;
    2624:	9562      	ld.w      	r3, (r5, 0x8)
    2626:	2300      	addi      	r3, 1
    2628:	b562      	st.w      	r3, (r5, 0x8)
    262a:	2507      	addi      	r5, 8
                ( void ) xTaskResumeAll();
    262c:	e3fffe06 	bsr      	0x2238	// 2238 <xTaskResumeAll>
}
    2630:	1492      	pop      	r4-r5, r15
    2632:	0000      	bkpt
    2634:	0000012f 	.long	0x0000012f
    2638:	00002b57 	.long	0x00002b57
    263c:	00002b41 	.long	0x00002b41
    2640:	20000df0 	.long	0x20000df0

Disassembly of section .text.pxPortInitialiseStack:

00002644 <pxPortInitialiseStack>:
{
    StackType_t *stk  = NULL;

    stk = pxTopOfStack;

    *(--stk)  = (uint32_t)pxCode;            /* Entry Point                                         */
    2644:	586f      	subi      	r3, r0, 4
    2646:	b320      	st.w      	r1, (r3, 0x0)
    *(--stk)  = (uint32_t)0xE0000140L;       /* PSR                                                 */
    2648:	587f      	subi      	r3, r0, 8
    264a:	103d      	lrw      	r1, 0xe0000140	// 26bc <pxPortInitialiseStack+0x78>
    264c:	b320      	st.w      	r1, (r3, 0x0)
    *(--stk)  = (uint32_t)0xFFFFFFFEL;       /* R15 (LR) (init value will cause fault if ever used) */
    264e:	3100      	movi      	r1, 0
    2650:	290b      	subi      	r1, 12
    2652:	3300      	movi      	r3, 0
    2654:	6040      	addu      	r1, r0
    2656:	2b01      	subi      	r3, 2
    2658:	b160      	st.w      	r3, (r1, 0x0)
    *(--stk)  = (uint32_t)0x13131313L;       /* R13                                                 */
    265a:	3300      	movi      	r3, 0
    265c:	2b0f      	subi      	r3, 16
    265e:	60c0      	addu      	r3, r0
    2660:	1038      	lrw      	r1, 0x13131313	// 26c0 <pxPortInitialiseStack+0x7c>
    2662:	b320      	st.w      	r1, (r3, 0x0)
//    *(--stk)  = (uint32_t)0x12121212L;       /* R12                                                 */
//    *(--stk)  = (uint32_t)0x11111111L;       /* R11                                                 */
//    *(--stk)  = (uint32_t)0x10101010L;       /* R10                                                 */
//    *(--stk)  = (uint32_t)0x09090909L;       /* R9                                                  */
    *(--stk)  = (uint32_t)0x08080808L;       /* R8                                                  */
    2664:	3300      	movi      	r3, 0
    2666:	2b13      	subi      	r3, 20
    2668:	60c0      	addu      	r3, r0
    266a:	1037      	lrw      	r1, 0x8080808	// 26c4 <pxPortInitialiseStack+0x80>
    266c:	b320      	st.w      	r1, (r3, 0x0)
    *(--stk)  = (uint32_t)0x07070707L;       /* R7                                                  */
    266e:	3300      	movi      	r3, 0
    2670:	2b17      	subi      	r3, 24
    2672:	60c0      	addu      	r3, r0
    2674:	1035      	lrw      	r1, 0x7070707	// 26c8 <pxPortInitialiseStack+0x84>
    2676:	b320      	st.w      	r1, (r3, 0x0)
    *(--stk)  = (uint32_t)0x06060606L;       /* R6                                                  */
    2678:	3300      	movi      	r3, 0
    267a:	2b1b      	subi      	r3, 28
    267c:	60c0      	addu      	r3, r0
    267e:	1034      	lrw      	r1, 0x6060606	// 26cc <pxPortInitialiseStack+0x88>
    2680:	b320      	st.w      	r1, (r3, 0x0)
    *(--stk)  = (uint32_t)0x05050505L;       /* R5                                                  */
    2682:	3300      	movi      	r3, 0
    2684:	2b1f      	subi      	r3, 32
    2686:	60c0      	addu      	r3, r0
    2688:	1032      	lrw      	r1, 0x5050505	// 26d0 <pxPortInitialiseStack+0x8c>
    268a:	b320      	st.w      	r1, (r3, 0x0)
    *(--stk)  = (uint32_t)0x04040404L;       /* R4                                                  */
    268c:	3300      	movi      	r3, 0
    268e:	2b23      	subi      	r3, 36
    2690:	60c0      	addu      	r3, r0
    2692:	1031      	lrw      	r1, 0x4040404	// 26d4 <pxPortInitialiseStack+0x90>
    2694:	b320      	st.w      	r1, (r3, 0x0)
    *(--stk)  = (uint32_t)0x03030303L;       /* R3                                                  */
    2696:	3300      	movi      	r3, 0
    2698:	2b27      	subi      	r3, 40
    269a:	60c0      	addu      	r3, r0
    269c:	102f      	lrw      	r1, 0x3030303	// 26d8 <pxPortInitialiseStack+0x94>
    269e:	b320      	st.w      	r1, (r3, 0x0)
    *(--stk)  = (uint32_t)0x02020202L;       /* R2                                                  */
    26a0:	3300      	movi      	r3, 0
    26a2:	2b2b      	subi      	r3, 44
    26a4:	60c0      	addu      	r3, r0
    26a6:	102e      	lrw      	r1, 0x2020202	// 26dc <pxPortInitialiseStack+0x98>
    26a8:	b320      	st.w      	r1, (r3, 0x0)
    *(--stk)  = (uint32_t)0x01010101L;       /* R1                                                  */
    26aa:	3300      	movi      	r3, 0
    26ac:	2b2f      	subi      	r3, 48
    26ae:	60c0      	addu      	r3, r0
    26b0:	102c      	lrw      	r1, 0x1010101	// 26e0 <pxPortInitialiseStack+0x9c>
    *(--stk)  = (uint32_t)pvParameters;      /* R0 : argument                                       */
    26b2:	2833      	subi      	r0, 52
    *(--stk)  = (uint32_t)0x01010101L;       /* R1                                                  */
    26b4:	b320      	st.w      	r1, (r3, 0x0)
    *(--stk)  = (uint32_t)pvParameters;      /* R0 : argument                                       */
    26b6:	b040      	st.w      	r2, (r0, 0x0)

    return stk;
}
    26b8:	783c      	jmp      	r15
    26ba:	0000      	bkpt
    26bc:	e0000140 	.long	0xe0000140
    26c0:	13131313 	.long	0x13131313
    26c4:	08080808 	.long	0x08080808
    26c8:	07070707 	.long	0x07070707
    26cc:	06060606 	.long	0x06060606
    26d0:	05050505 	.long	0x05050505
    26d4:	04040404 	.long	0x04040404
    26d8:	03030303 	.long	0x03030303
    26dc:	02020202 	.long	0x02020202
    26e0:	01010101 	.long	0x01010101

Disassembly of section .text.xPortStartScheduler:

000026e4 <xPortStartScheduler>:

BaseType_t xPortStartScheduler( void )
{
    26e4:	14d0      	push      	r15
    ulCriticalNesting = 0UL;
    26e6:	3200      	movi      	r2, 0
    26e8:	1063      	lrw      	r3, 0x2000006c	// 26f4 <xPortStartScheduler+0x10>
    26ea:	b340      	st.w      	r2, (r3, 0x0)

    vPortStartTask();
    26ec:	e3ffed62 	bsr      	0x1b0	// 1b0 <vPortStartTask>

    return pdFALSE;
}
    26f0:	3000      	movi      	r0, 0
    26f2:	1490      	pop      	r15
    26f4:	2000006c 	.long	0x2000006c

Disassembly of section .text.vPortEnterCritical:

000026f8 <vPortEnterCritical>:
    26f8:	c0807020 	psrclr      	ie
}

void vPortEnterCritical( void )
{
    portDISABLE_INTERRUPTS();
    ulCriticalNesting ++;
    26fc:	1043      	lrw      	r2, 0x2000006c	// 2708 <vPortEnterCritical+0x10>
    26fe:	9260      	ld.w      	r3, (r2, 0x0)
    2700:	2300      	addi      	r3, 1
    2702:	b260      	st.w      	r3, (r2, 0x0)
}
    2704:	783c      	jmp      	r15
    2706:	0000      	bkpt
    2708:	2000006c 	.long	0x2000006c

Disassembly of section .text.vPortExitCritical:

0000270c <vPortExitCritical>:

void vPortExitCritical( void )
{
    270c:	14d0      	push      	r15
    if (ulCriticalNesting == 0) {
    270e:	104b      	lrw      	r2, 0x2000006c	// 2738 <vPortExitCritical+0x2c>
    2710:	9260      	ld.w      	r3, (r2, 0x0)
    2712:	3b40      	cmpnei      	r3, 0
    2714:	0802      	bt      	0x2718	// 2718 <vPortExitCritical+0xc>
    2716:	0400      	br      	0x2716	// 2716 <vPortExitCritical+0xa>
        while(1);
    }

    ulCriticalNesting --;
    2718:	2b00      	subi      	r3, 1
    if (ulCriticalNesting == 0)
    271a:	3b40      	cmpnei      	r3, 0
    ulCriticalNesting --;
    271c:	b260      	st.w      	r3, (r2, 0x0)
    if (ulCriticalNesting == 0)
    271e:	080c      	bt      	0x2736	// 2736 <vPortExitCritical+0x2a>
    __ASM volatile("psrset ie");
    2720:	c0807420 	psrset      	ie
    {
        portENABLE_INTERRUPTS();

        if (pendsvflag)
    2724:	1046      	lrw      	r2, 0x20000dfc	// 273c <vPortExitCritical+0x30>
    2726:	9220      	ld.w      	r1, (r2, 0x0)
    2728:	3940      	cmpnei      	r1, 0
    272a:	0c06      	bf      	0x2736	// 2736 <vPortExitCritical+0x2a>
        {
            pendsvflag = 0;
    272c:	b260      	st.w      	r3, (r2, 0x0)
            portYIELD();
    272e:	e3ffed5e 	bsr      	0x1ea	// 1ea <vPortYield>
    2732:	6c03      	mov      	r0, r0
    2734:	6c03      	mov      	r0, r0
        }
    }
}
    2736:	1490      	pop      	r15
    2738:	2000006c 	.long	0x2000006c
    273c:	20000dfc 	.long	0x20000dfc

Disassembly of section .text.xPortSysTickHandler:

00002740 <xPortSysTickHandler>:
    portCLEAR_INTERRUPT_MASK_FROM_ISR( ulDummy );
}

#else
void xPortSysTickHandler( void )
{
    2740:	14d1      	push      	r4, r15
 */
__ALWAYS_STATIC_INLINE uint32_t __get_PSR(void)
{
    uint32_t result;

    __ASM volatile("mfcr %0, psr" : "=r"(result));
    2742:	c0006024 	mfcr      	r4, cr<0, 0>
    __ASM volatile("psrclr ie");
    2746:	c0807020 	psrclr      	ie
    portLONG ulDummy;

    ulDummy = portSET_INTERRUPT_MASK_FROM_ISR();
    {
        if (xTaskIncrementTick() != pdFALSE)
    274a:	e3fffcd7 	bsr      	0x20f8	// 20f8 <xTaskIncrementTick>
    274e:	3840      	cmpnei      	r0, 0
    2750:	0c09      	bf      	0x2762	// 2762 <xPortSysTickHandler+0x22>
        {
            portYIELD_FROM_ISR(pdTRUE);
    2752:	1068      	lrw      	r3, 0x2000006c	// 2770 <xPortSysTickHandler+0x30>
    2754:	9360      	ld.w      	r3, (r3, 0x0)
    2756:	3b40      	cmpnei      	r3, 0
    2758:	0808      	bt      	0x2768	// 2768 <xPortSysTickHandler+0x28>
    275a:	e3ffed48 	bsr      	0x1ea	// 1ea <vPortYield>
    275e:	6c03      	mov      	r0, r0
    2760:	6c03      	mov      	r0, r0
    return flags;
}

static inline void RestoreLocalPSR (portLONG newMask)
{
    __asm__ __volatile__(
    2762:	c0046420 	mtcr      	r4, cr<0, 0>
        }
    }
    portCLEAR_INTERRUPT_MASK_FROM_ISR( ulDummy );
}
    2766:	1491      	pop      	r4, r15
            portYIELD_FROM_ISR(pdTRUE);
    2768:	3201      	movi      	r2, 1
    276a:	1063      	lrw      	r3, 0x20000dfc	// 2774 <xPortSysTickHandler+0x34>
    276c:	b340      	st.w      	r2, (r3, 0x0)
    276e:	07f8      	br      	0x275e	// 275e <xPortSysTickHandler+0x1e>
    2770:	2000006c 	.long	0x2000006c
    2774:	20000dfc 	.long	0x20000dfc

Disassembly of section .text.vApplicationStackOverflowHook:

00002778 <vApplicationStackOverflowHook>:
}


__attribute__((weak)) void vApplicationStackOverflowHook( TaskHandle_t xTask,
                                        char * pcTaskName )
{
    2778:	0400      	br      	0x2778	// 2778 <vApplicationStackOverflowHook>

Disassembly of section .text.vApplicationMallocFailedHook:

0000277a <vApplicationMallocFailedHook>:
    for(;;);
}

__attribute__((weak)) void vApplicationMallocFailedHook( void )
{
    277a:	0400      	br      	0x277a	// 277a <vApplicationMallocFailedHook>

Disassembly of section .text.std_clk_calib:

0000277c <std_clk_calib>:
    277c:	14d4      	push      	r4-r7, r15
    277e:	142d      	subi      	r14, r14, 52
    2780:	3201      	movi      	r2, 1
    2782:	03cc      	lrw      	r6, 0x2000005c	// 29cc <std_clk_calib+0x250>
    2784:	6cc3      	mov      	r3, r0
    2786:	dc4e000a 	st.b      	r2, (r14, 0xa)
    278a:	9640      	ld.w      	r2, (r6, 0x0)
    278c:	9247      	ld.w      	r2, (r2, 0x1c)
    278e:	7488      	zextb      	r2, r2
    2790:	dc4e0009 	st.b      	r2, (r14, 0x9)
    2794:	d84e0009 	ld.b      	r2, (r14, 0x9)
    2798:	3a40      	cmpnei      	r2, 0
    279a:	0c08      	bf      	0x27aa	// 27aa <std_clk_calib+0x2e>
    279c:	d84e0009 	ld.b      	r2, (r14, 0x9)
    27a0:	3a42      	cmpnei      	r2, 2
    27a2:	0c04      	bf      	0x27aa	// 27aa <std_clk_calib+0x2e>
    27a4:	3000      	movi      	r0, 0
    27a6:	140d      	addi      	r14, r14, 52
    27a8:	1494      	pop      	r4-r7, r15
    27aa:	0395      	lrw      	r4, 0x2000000c	// 29d0 <std_clk_calib+0x254>
    27ac:	3209      	movi      	r2, 9
    27ae:	9400      	ld.w      	r0, (r4, 0x0)
    27b0:	3b40      	cmpnei      	r3, 0
    27b2:	b041      	st.w      	r2, (r0, 0x4)
    27b4:	085a      	bt      	0x2868	// 2868 <std_clk_calib+0xec>
    27b6:	3307      	movi      	r3, 7
    27b8:	dc6e000b 	st.b      	r3, (r14, 0xb)
    27bc:	0379      	lrw      	r3, 0x2dc6c00	// 29d4 <std_clk_calib+0x258>
    27be:	b863      	st.w      	r3, (r14, 0xc)
    27c0:	3380      	movi      	r3, 128
    27c2:	4362      	lsli      	r3, r3, 2
    27c4:	b867      	st.w      	r3, (r14, 0x1c)
    27c6:	d86e000b 	ld.b      	r3, (r14, 0xb)
    27ca:	74cc      	zextb      	r3, r3
    27cc:	b062      	st.w      	r3, (r0, 0x8)
    27ce:	037c      	lrw      	r3, 0xffff	// 29d8 <std_clk_calib+0x25c>
    27d0:	b063      	st.w      	r3, (r0, 0xc)
    27d2:	3201      	movi      	r2, 1
    27d4:	3101      	movi      	r1, 1
    27d6:	03bd      	lrw      	r5, 0x20000014	// 29dc <std_clk_calib+0x260>
    27d8:	e3ffefe9 	bsr      	0x7aa	// 7aa <BT_ConfigInterrupt_CMD>
    27dc:	95e0      	ld.w      	r7, (r5, 0x0)
    27de:	037e      	lrw      	r3, 0xbe9c0005	// 29e0 <std_clk_calib+0x264>
    27e0:	b760      	st.w      	r3, (r7, 0x0)
    27e2:	035e      	lrw      	r2, 0x30010	// 29e4 <std_clk_calib+0x268>
    27e4:	3300      	movi      	r3, 0
    27e6:	b762      	st.w      	r3, (r7, 0x8)
    27e8:	b743      	st.w      	r2, (r7, 0xc)
    27ea:	32d8      	movi      	r2, 216
    27ec:	b745      	st.w      	r2, (r7, 0x14)
    27ee:	974f      	ld.w      	r2, (r7, 0x3c)
    27f0:	3aa2      	bseti      	r2, 2
    27f2:	b74f      	st.w      	r2, (r7, 0x3c)
    27f4:	9803      	ld.w      	r0, (r14, 0xc)
    27f6:	d82e000b 	ld.b      	r1, (r14, 0xb)
    27fa:	327d      	movi      	r2, 125
    27fc:	2100      	addi      	r1, 1
    27fe:	7c48      	mult      	r1, r2
    2800:	b861      	st.w      	r3, (r14, 0x4)
    2802:	e3fffa0f 	bsr      	0x1c20	// 1c20 <__udivsi3>
    2806:	b804      	st.w      	r0, (r14, 0x10)
    2808:	32fa      	movi      	r2, 250
    280a:	9824      	ld.w      	r1, (r14, 0x10)
    280c:	4242      	lsli      	r2, r2, 2
    280e:	6448      	cmphs      	r2, r1
    2810:	0bca      	bt      	0x27a4	// 27a4 <std_clk_calib+0x28>
    2812:	9844      	ld.w      	r2, (r14, 0x10)
    2814:	3178      	movi      	r1, 120
    2816:	9804      	ld.w      	r0, (r14, 0x10)
    2818:	b840      	st.w      	r2, (r14, 0x0)
    281a:	e3fffa03 	bsr      	0x1c20	// 1c20 <__udivsi3>
    281e:	9840      	ld.w      	r2, (r14, 0x0)
    2820:	6082      	subu      	r2, r0
    2822:	b845      	st.w      	r2, (r14, 0x14)
    2824:	9804      	ld.w      	r0, (r14, 0x10)
    2826:	3178      	movi      	r1, 120
    2828:	9844      	ld.w      	r2, (r14, 0x10)
    282a:	b840      	st.w      	r2, (r14, 0x0)
    282c:	e3fff9fa 	bsr      	0x1c20	// 1c20 <__udivsi3>
    2830:	9840      	ld.w      	r2, (r14, 0x0)
    2832:	6008      	addu      	r0, r2
    2834:	b806      	st.w      	r0, (r14, 0x18)
    2836:	c0807020 	psrclr      	ie
    283a:	9640      	ld.w      	r2, (r6, 0x0)
    283c:	9254      	ld.w      	r2, (r2, 0x50)
    283e:	b848      	st.w      	r2, (r14, 0x20)
    2840:	9861      	ld.w      	r3, (r14, 0x4)
    2842:	9440      	ld.w      	r2, (r4, 0x0)
    2844:	b260      	st.w      	r3, (r2, 0x0)
    2846:	b761      	st.w      	r3, (r7, 0x4)
    2848:	d86e000a 	ld.b      	r3, (r14, 0xa)
    284c:	3b40      	cmpnei      	r3, 0
    284e:	0841      	bt      	0x28d0	// 28d0 <std_clk_calib+0x154>
    2850:	9440      	ld.w      	r2, (r4, 0x0)
    2852:	9260      	ld.w      	r3, (r2, 0x0)
    2854:	3bac      	bseti      	r3, 12
    2856:	3bae      	bseti      	r3, 14
    2858:	b260      	st.w      	r3, (r2, 0x0)
    285a:	9540      	ld.w      	r2, (r5, 0x0)
    285c:	9261      	ld.w      	r3, (r2, 0x4)
    285e:	3bac      	bseti      	r3, 12
    2860:	3bae      	bseti      	r3, 14
    2862:	b261      	st.w      	r3, (r2, 0x4)
    2864:	3001      	movi      	r0, 1
    2866:	07a0      	br      	0x27a6	// 27a6 <std_clk_calib+0x2a>
    2868:	3b41      	cmpnei      	r3, 1
    286a:	0806      	bt      	0x2876	// 2876 <std_clk_calib+0xfa>
    286c:	3303      	movi      	r3, 3
    286e:	dc6e000b 	st.b      	r3, (r14, 0xb)
    2872:	127e      	lrw      	r3, 0x16e3600	// 29e8 <std_clk_calib+0x26c>
    2874:	07a5      	br      	0x27be	// 27be <std_clk_calib+0x42>
    2876:	3b42      	cmpnei      	r3, 2
    2878:	0806      	bt      	0x2884	// 2884 <std_clk_calib+0x108>
    287a:	3301      	movi      	r3, 1
    287c:	dc6e000b 	st.b      	r3, (r14, 0xb)
    2880:	127b      	lrw      	r3, 0xb71b00	// 29ec <std_clk_calib+0x270>
    2882:	079e      	br      	0x27be	// 27be <std_clk_calib+0x42>
    2884:	3b43      	cmpnei      	r3, 3
    2886:	0806      	bt      	0x2892	// 2892 <std_clk_calib+0x116>
    2888:	3300      	movi      	r3, 0
    288a:	dc6e000b 	st.b      	r3, (r14, 0xb)
    288e:	1279      	lrw      	r3, 0x5b8d80	// 29f0 <std_clk_calib+0x274>
    2890:	0797      	br      	0x27be	// 27be <std_clk_calib+0x42>
    2892:	3b44      	cmpnei      	r3, 4
    2894:	0809      	bt      	0x28a6	// 28a6 <std_clk_calib+0x12a>
    2896:	3300      	movi      	r3, 0
    2898:	dc6e000b 	st.b      	r3, (r14, 0xb)
    289c:	1276      	lrw      	r3, 0x54c720	// 29f4 <std_clk_calib+0x278>
    289e:	b863      	st.w      	r3, (r14, 0xc)
    28a0:	3380      	movi      	r3, 128
    28a2:	4369      	lsli      	r3, r3, 9
    28a4:	0790      	br      	0x27c4	// 27c4 <std_clk_calib+0x48>
    28a6:	3b45      	cmpnei      	r3, 5
    28a8:	0806      	bt      	0x28b4	// 28b4 <std_clk_calib+0x138>
    28aa:	3300      	movi      	r3, 0
    28ac:	dc6e000b 	st.b      	r3, (r14, 0xb)
    28b0:	1272      	lrw      	r3, 0x3ffed0	// 29f8 <std_clk_calib+0x27c>
    28b2:	07f6      	br      	0x289e	// 289e <std_clk_calib+0x122>
    28b4:	3b46      	cmpnei      	r3, 6
    28b6:	0806      	bt      	0x28c2	// 28c2 <std_clk_calib+0x146>
    28b8:	3300      	movi      	r3, 0
    28ba:	dc6e000b 	st.b      	r3, (r14, 0xb)
    28be:	1270      	lrw      	r3, 0x1fff68	// 29fc <std_clk_calib+0x280>
    28c0:	07ef      	br      	0x289e	// 289e <std_clk_calib+0x122>
    28c2:	3b47      	cmpnei      	r3, 7
    28c4:	0b81      	bt      	0x27c6	// 27c6 <std_clk_calib+0x4a>
    28c6:	3300      	movi      	r3, 0
    28c8:	dc6e000b 	st.b      	r3, (r14, 0xb)
    28cc:	126d      	lrw      	r3, 0x1ffb8	// 2a00 <std_clk_calib+0x284>
    28ce:	07e8      	br      	0x289e	// 289e <std_clk_calib+0x122>
    28d0:	9560      	ld.w      	r3, (r5, 0x0)
    28d2:	3101      	movi      	r1, 1
    28d4:	9440      	ld.w      	r2, (r4, 0x0)
    28d6:	b321      	st.w      	r1, (r3, 0x4)
    28d8:	b220      	st.w      	r1, (r2, 0x0)
    28da:	3100      	movi      	r1, 0
    28dc:	b327      	st.w      	r1, (r3, 0x1c)
    28de:	3004      	movi      	r0, 4
    28e0:	b225      	st.w      	r1, (r2, 0x14)
    28e2:	932e      	ld.w      	r1, (r3, 0x38)
    28e4:	6840      	and      	r1, r0
    28e6:	3940      	cmpnei      	r1, 0
    28e8:	0ffd      	bf      	0x28e2	// 28e2 <std_clk_calib+0x166>
    28ea:	9225      	ld.w      	r1, (r2, 0x14)
    28ec:	b82a      	st.w      	r1, (r14, 0x28)
    28ee:	3100      	movi      	r1, 0
    28f0:	b310      	st.w      	r0, (r3, 0x40)
    28f2:	b327      	st.w      	r1, (r3, 0x1c)
    28f4:	3004      	movi      	r0, 4
    28f6:	b225      	st.w      	r1, (r2, 0x14)
    28f8:	932e      	ld.w      	r1, (r3, 0x38)
    28fa:	6840      	and      	r1, r0
    28fc:	3940      	cmpnei      	r1, 0
    28fe:	0ffd      	bf      	0x28f8	// 28f8 <std_clk_calib+0x17c>
    2900:	9225      	ld.w      	r1, (r2, 0x14)
    2902:	b82b      	st.w      	r1, (r14, 0x2c)
    2904:	3100      	movi      	r1, 0
    2906:	b310      	st.w      	r0, (r3, 0x40)
    2908:	b327      	st.w      	r1, (r3, 0x1c)
    290a:	3004      	movi      	r0, 4
    290c:	b225      	st.w      	r1, (r2, 0x14)
    290e:	932e      	ld.w      	r1, (r3, 0x38)
    2910:	6840      	and      	r1, r0
    2912:	3940      	cmpnei      	r1, 0
    2914:	0ffd      	bf      	0x290e	// 290e <std_clk_calib+0x192>
    2916:	9225      	ld.w      	r1, (r2, 0x14)
    2918:	b82c      	st.w      	r1, (r14, 0x30)
    291a:	b310      	st.w      	r0, (r3, 0x40)
    291c:	982b      	ld.w      	r1, (r14, 0x2c)
    291e:	980c      	ld.w      	r0, (r14, 0x30)
    2920:	6040      	addu      	r1, r0
    2922:	b829      	st.w      	r1, (r14, 0x24)
    2924:	9829      	ld.w      	r1, (r14, 0x24)
    2926:	4921      	lsri      	r1, r1, 1
    2928:	b829      	st.w      	r1, (r14, 0x24)
    292a:	3100      	movi      	r1, 0
    292c:	b321      	st.w      	r1, (r3, 0x4)
    292e:	b220      	st.w      	r1, (r2, 0x0)
    2930:	b327      	st.w      	r1, (r3, 0x1c)
    2932:	b225      	st.w      	r1, (r2, 0x14)
    2934:	d86e0009 	ld.b      	r3, (r14, 0x9)
    2938:	3b42      	cmpnei      	r3, 2
    293a:	9849      	ld.w      	r2, (r14, 0x24)
    293c:	082c      	bt      	0x2994	// 2994 <std_clk_calib+0x218>
    293e:	1172      	lrw      	r3, 0x7ff	// 2a04 <std_clk_calib+0x288>
    2940:	648c      	cmphs      	r3, r2
    2942:	0c03      	bf      	0x2948	// 2948 <std_clk_calib+0x1cc>
    2944:	3300      	movi      	r3, 0
    2946:	040f      	br      	0x2964	// 2964 <std_clk_calib+0x1e8>
    2948:	9849      	ld.w      	r2, (r14, 0x24)
    294a:	9866      	ld.w      	r3, (r14, 0x18)
    294c:	648c      	cmphs      	r3, r2
    294e:	080e      	bt      	0x296a	// 296a <std_clk_calib+0x1ee>
    2950:	9868      	ld.w      	r3, (r14, 0x20)
    2952:	9847      	ld.w      	r2, (r14, 0x1c)
    2954:	60ca      	subu      	r3, r2
    2956:	b868      	st.w      	r3, (r14, 0x20)
    2958:	32fe      	movi      	r2, 254
    295a:	9868      	ld.w      	r3, (r14, 0x20)
    295c:	4248      	lsli      	r2, r2, 8
    295e:	68c8      	and      	r3, r2
    2960:	3b40      	cmpnei      	r3, 0
    2962:	0812      	bt      	0x2986	// 2986 <std_clk_calib+0x20a>
    2964:	dc6e000a 	st.b      	r3, (r14, 0xa)
    2968:	071e      	br      	0x27a4	// 27a4 <std_clk_calib+0x28>
    296a:	9849      	ld.w      	r2, (r14, 0x24)
    296c:	9865      	ld.w      	r3, (r14, 0x14)
    296e:	64c8      	cmphs      	r2, r3
    2970:	0829      	bt      	0x29c2	// 29c2 <std_clk_calib+0x246>
    2972:	9868      	ld.w      	r3, (r14, 0x20)
    2974:	9847      	ld.w      	r2, (r14, 0x1c)
    2976:	60c8      	addu      	r3, r2
    2978:	b868      	st.w      	r3, (r14, 0x20)
    297a:	33fe      	movi      	r3, 254
    297c:	9848      	ld.w      	r2, (r14, 0x20)
    297e:	4368      	lsli      	r3, r3, 8
    2980:	688c      	and      	r2, r3
    2982:	64ca      	cmpne      	r2, r3
    2984:	0fe0      	bf      	0x2944	// 2944 <std_clk_calib+0x1c8>
    2986:	9660      	ld.w      	r3, (r6, 0x0)
    2988:	9848      	ld.w      	r2, (r14, 0x20)
    298a:	b354      	st.w      	r2, (r3, 0x50)
    298c:	3001      	movi      	r0, 1
    298e:	e3fff32b 	bsr      	0xfe4	// fe4 <delay_nms>
    2992:	075b      	br      	0x2848	// 2848 <std_clk_calib+0xcc>
    2994:	9866      	ld.w      	r3, (r14, 0x18)
    2996:	648c      	cmphs      	r3, r2
    2998:	0809      	bt      	0x29aa	// 29aa <std_clk_calib+0x22e>
    299a:	9868      	ld.w      	r3, (r14, 0x20)
    299c:	9847      	ld.w      	r2, (r14, 0x1c)
    299e:	60ca      	subu      	r3, r2
    29a0:	b868      	st.w      	r3, (r14, 0x20)
    29a2:	32ff      	movi      	r2, 255
    29a4:	9868      	ld.w      	r3, (r14, 0x20)
    29a6:	4250      	lsli      	r2, r2, 16
    29a8:	07db      	br      	0x295e	// 295e <std_clk_calib+0x1e2>
    29aa:	9849      	ld.w      	r2, (r14, 0x24)
    29ac:	9865      	ld.w      	r3, (r14, 0x14)
    29ae:	64c8      	cmphs      	r2, r3
    29b0:	0809      	bt      	0x29c2	// 29c2 <std_clk_calib+0x246>
    29b2:	9868      	ld.w      	r3, (r14, 0x20)
    29b4:	9847      	ld.w      	r2, (r14, 0x1c)
    29b6:	60c8      	addu      	r3, r2
    29b8:	b868      	st.w      	r3, (r14, 0x20)
    29ba:	33ff      	movi      	r3, 255
    29bc:	9848      	ld.w      	r2, (r14, 0x20)
    29be:	4370      	lsli      	r3, r3, 16
    29c0:	07e0      	br      	0x2980	// 2980 <std_clk_calib+0x204>
    29c2:	3300      	movi      	r3, 0
    29c4:	dc6e000a 	st.b      	r3, (r14, 0xa)
    29c8:	07e2      	br      	0x298c	// 298c <std_clk_calib+0x210>
    29ca:	0000      	bkpt
    29cc:	2000005c 	.long	0x2000005c
    29d0:	2000000c 	.long	0x2000000c
    29d4:	02dc6c00 	.long	0x02dc6c00
    29d8:	0000ffff 	.long	0x0000ffff
    29dc:	20000014 	.long	0x20000014
    29e0:	be9c0005 	.long	0xbe9c0005
    29e4:	00030010 	.long	0x00030010
    29e8:	016e3600 	.long	0x016e3600
    29ec:	00b71b00 	.long	0x00b71b00
    29f0:	005b8d80 	.long	0x005b8d80
    29f4:	0054c720 	.long	0x0054c720
    29f8:	003ffed0 	.long	0x003ffed0
    29fc:	001fff68 	.long	0x001fff68
    2a00:	0001ffb8 	.long	0x0001ffb8
    2a04:	000007ff 	.long	0x000007ff
