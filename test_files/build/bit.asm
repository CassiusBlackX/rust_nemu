
build/bit:     file format elf32-littleriscv


Disassembly of section .text:

80000000 <_start>:
80000000:	ff010113          	addi	sp,sp,-16
80000004:	00112623          	sw	ra,12(sp)
80000008:	00000517          	auipc	a0,0x0
8000000c:	30850513          	addi	a0,a0,776 # 80000310 <_bss_start>
80000010:	00000597          	auipc	a1,0x0
80000014:	30058593          	addi	a1,a1,768 # 80000310 <_bss_start>
80000018:	00b501b3          	add	gp,a0,a1
8000001c:	4011d193          	srai	gp,gp,0x1
80000020:	00000537          	lui	a0,0x0
80000024:	06b50513          	addi	a0,a0,107 # 6b <_start-0x7fffff95>
80000028:	840005b7          	lui	a1,0x84000
8000002c:	ff058593          	addi	a1,a1,-16 # 83fffff0 <_end+0x3ff6ff0>
80000030:	00a5a023          	sw	a0,0(a1)
80000034:	00000537          	lui	a0,0x0
80000038:	0eb50513          	addi	a0,a0,235 # eb <_start-0x7fffff15>
8000003c:	840005b7          	lui	a1,0x84000
80000040:	ff458593          	addi	a1,a1,-12 # 83fffff4 <_end+0x3ff6ff4>
80000044:	00a5a023          	sw	a0,0(a1)
80000048:	0a8000ef          	jal	ra,800000f0 <main>
8000004c:	84000537          	lui	a0,0x84000
80000050:	ff050513          	addi	a0,a0,-16 # 83fffff0 <_end+0x3ff6ff0>
80000054:	00050067          	jalr	zero,0(a0)
80000058:	00c12083          	lw	ra,12(sp)
8000005c:	01010113          	addi	sp,sp,16
80000060:	00008067          	jalr	zero,0(ra)

80000064 <check>:
80000064:	00051863          	bne	a0,zero,80000074 <check+0x10>
80000068:	84000537          	lui	a0,0x84000
8000006c:	ff450513          	addi	a0,a0,-12 # 83fffff4 <_end+0x3ff6ff4>
80000070:	00050067          	jalr	zero,0(a0)
80000074:	00008067          	jalr	zero,0(ra)

80000078 <getbit>:
80000078:	4035d793          	srai	a5,a1,0x3
8000007c:	00f50533          	add	a0,a0,a5
80000080:	0075f593          	andi	a1,a1,7
80000084:	00100793          	addi	a5,zero,1
80000088:	00b797b3          	sll	a5,a5,a1
8000008c:	00054503          	lbu	a0,0(a0)
80000090:	00f57533          	and	a0,a0,a5
80000094:	00a03533          	sltu	a0,zero,a0
80000098:	00008067          	jalr	zero,0(ra)

8000009c <setbit>:
8000009c:	ff010113          	addi	sp,sp,-16
800000a0:	0075f793          	andi	a5,a1,7
800000a4:	00100713          	addi	a4,zero,1
800000a8:	00f71733          	sll	a4,a4,a5
800000ac:	4035d593          	srai	a1,a1,0x3
800000b0:	00b50533          	add	a0,a0,a1
800000b4:	00a12623          	sw	a0,12(sp)
800000b8:	02061263          	bne	a2,zero,800000dc <setbit+0x40>
800000bc:	00c12783          	lw	a5,12(sp)
800000c0:	fff74713          	xori	a4,a4,-1
800000c4:	0007c783          	lbu	a5,0(a5)
800000c8:	00e7f7b3          	and	a5,a5,a4
800000cc:	00c12703          	lw	a4,12(sp)
800000d0:	00f70023          	sb	a5,0(a4)
800000d4:	01010113          	addi	sp,sp,16
800000d8:	00008067          	jalr	zero,0(ra)
800000dc:	00c12783          	lw	a5,12(sp)
800000e0:	0007c783          	lbu	a5,0(a5)
800000e4:	00e7e7b3          	or	a5,a5,a4
800000e8:	0ff7f793          	andi	a5,a5,255
800000ec:	fe1ff06f          	jal	zero,800000cc <setbit+0x30>

800000f0 <main>:
800000f0:	fe010113          	addi	sp,sp,-32
800000f4:	00112e23          	sw	ra,28(sp)
800000f8:	faa00793          	addi	a5,zero,-86
800000fc:	00f10623          	sb	a5,12(sp)
80000100:	000106a3          	sb	zero,13(sp)
80000104:	00000593          	addi	a1,zero,0
80000108:	00c10513          	addi	a0,sp,12
8000010c:	f6dff0ef          	jal	ra,80000078 <getbit>
80000110:	00154513          	xori	a0,a0,1
80000114:	0ff57513          	andi	a0,a0,255
80000118:	f4dff0ef          	jal	ra,80000064 <check>
8000011c:	00100593          	addi	a1,zero,1
80000120:	00c10513          	addi	a0,sp,12
80000124:	f55ff0ef          	jal	ra,80000078 <getbit>
80000128:	f3dff0ef          	jal	ra,80000064 <check>
8000012c:	00200593          	addi	a1,zero,2
80000130:	00c10513          	addi	a0,sp,12
80000134:	f45ff0ef          	jal	ra,80000078 <getbit>
80000138:	00154513          	xori	a0,a0,1
8000013c:	0ff57513          	andi	a0,a0,255
80000140:	f25ff0ef          	jal	ra,80000064 <check>
80000144:	00300593          	addi	a1,zero,3
80000148:	00c10513          	addi	a0,sp,12
8000014c:	f2dff0ef          	jal	ra,80000078 <getbit>
80000150:	f15ff0ef          	jal	ra,80000064 <check>
80000154:	00400593          	addi	a1,zero,4
80000158:	00c10513          	addi	a0,sp,12
8000015c:	f1dff0ef          	jal	ra,80000078 <getbit>
80000160:	00154513          	xori	a0,a0,1
80000164:	0ff57513          	andi	a0,a0,255
80000168:	efdff0ef          	jal	ra,80000064 <check>
8000016c:	00500593          	addi	a1,zero,5
80000170:	00c10513          	addi	a0,sp,12
80000174:	f05ff0ef          	jal	ra,80000078 <getbit>
80000178:	eedff0ef          	jal	ra,80000064 <check>
8000017c:	00600593          	addi	a1,zero,6
80000180:	00c10513          	addi	a0,sp,12
80000184:	ef5ff0ef          	jal	ra,80000078 <getbit>
80000188:	00154513          	xori	a0,a0,1
8000018c:	0ff57513          	andi	a0,a0,255
80000190:	ed5ff0ef          	jal	ra,80000064 <check>
80000194:	00700593          	addi	a1,zero,7
80000198:	00c10513          	addi	a0,sp,12
8000019c:	eddff0ef          	jal	ra,80000078 <getbit>
800001a0:	ec5ff0ef          	jal	ra,80000064 <check>
800001a4:	00100613          	addi	a2,zero,1
800001a8:	00800593          	addi	a1,zero,8
800001ac:	00c10513          	addi	a0,sp,12
800001b0:	eedff0ef          	jal	ra,8000009c <setbit>
800001b4:	00000613          	addi	a2,zero,0
800001b8:	00900593          	addi	a1,zero,9
800001bc:	00c10513          	addi	a0,sp,12
800001c0:	eddff0ef          	jal	ra,8000009c <setbit>
800001c4:	00100613          	addi	a2,zero,1
800001c8:	00a00593          	addi	a1,zero,10
800001cc:	00c10513          	addi	a0,sp,12
800001d0:	ecdff0ef          	jal	ra,8000009c <setbit>
800001d4:	00000613          	addi	a2,zero,0
800001d8:	00b00593          	addi	a1,zero,11
800001dc:	00c10513          	addi	a0,sp,12
800001e0:	ebdff0ef          	jal	ra,8000009c <setbit>
800001e4:	00100613          	addi	a2,zero,1
800001e8:	00c00593          	addi	a1,zero,12
800001ec:	00c10513          	addi	a0,sp,12
800001f0:	eadff0ef          	jal	ra,8000009c <setbit>
800001f4:	00000613          	addi	a2,zero,0
800001f8:	00d00593          	addi	a1,zero,13
800001fc:	00c10513          	addi	a0,sp,12
80000200:	e9dff0ef          	jal	ra,8000009c <setbit>
80000204:	00100613          	addi	a2,zero,1
80000208:	00e00593          	addi	a1,zero,14
8000020c:	00c10513          	addi	a0,sp,12
80000210:	e8dff0ef          	jal	ra,8000009c <setbit>
80000214:	00000613          	addi	a2,zero,0
80000218:	00f00593          	addi	a1,zero,15
8000021c:	00c10513          	addi	a0,sp,12
80000220:	e7dff0ef          	jal	ra,8000009c <setbit>
80000224:	00d14503          	lbu	a0,13(sp)
80000228:	fab50513          	addi	a0,a0,-85
8000022c:	00153513          	sltiu	a0,a0,1
80000230:	e35ff0ef          	jal	ra,80000064 <check>
80000234:	00000513          	addi	a0,zero,0
80000238:	01c12083          	lw	ra,28(sp)
8000023c:	02010113          	addi	sp,sp,32
80000240:	00008067          	jalr	zero,0(ra)
