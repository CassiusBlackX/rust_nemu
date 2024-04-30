
build/to-lower-case:     file format elf32-littleriscv


Disassembly of section .text:

80000000 <_start>:
80000000:	ff010113          	addi	sp,sp,-16
80000004:	00112623          	sw	ra,12(sp)
80000008:	00000517          	auipc	a0,0x0
8000000c:	22450513          	addi	a0,a0,548 # 8000022c <_bss_start>
80000010:	00000597          	auipc	a1,0x0
80000014:	21c58593          	addi	a1,a1,540 # 8000022c <_bss_start>
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
80000048:	04c000ef          	jal	ra,80000094 <main>
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

80000078 <to_lower_case>:
80000078:	fbf50793          	addi	a5,a0,-65
8000007c:	0ff7f793          	andi	a5,a5,255
80000080:	01900713          	addi	a4,zero,25
80000084:	00f76663          	bltu	a4,a5,80000090 <to_lower_case+0x18>
80000088:	02050513          	addi	a0,a0,32
8000008c:	0ff57513          	andi	a0,a0,255
80000090:	00008067          	jalr	zero,0(ra)

80000094 <main>:
80000094:	ff010113          	addi	sp,sp,-16
80000098:	00112623          	sw	ra,12(sp)
8000009c:	00812423          	sw	s0,8(sp)
800000a0:	00912223          	sw	s1,4(sp)
800000a4:	01212023          	sw	s2,0(sp)
800000a8:	00000413          	addi	s0,zero,0
800000ac:	800004b7          	lui	s1,0x80000
800000b0:	1ac48493          	addi	s1,s1,428 # 800001ac <ans>
800000b4:	08000913          	addi	s2,zero,128
800000b8:	0ff47513          	andi	a0,s0,255
800000bc:	fbdff0ef          	jal	ra,80000078 <to_lower_case>
800000c0:	008487b3          	add	a5,s1,s0
800000c4:	0007c783          	lbu	a5,0(a5)
800000c8:	40f50533          	sub	a0,a0,a5
800000cc:	00153513          	sltiu	a0,a0,1
800000d0:	f95ff0ef          	jal	ra,80000064 <check>
800000d4:	00140413          	addi	s0,s0,1
800000d8:	ff2410e3          	bne	s0,s2,800000b8 <main+0x24>
800000dc:	00000513          	addi	a0,zero,0
800000e0:	00c12083          	lw	ra,12(sp)
800000e4:	00812403          	lw	s0,8(sp)
800000e8:	00412483          	lw	s1,4(sp)
800000ec:	00012903          	lw	s2,0(sp)
800000f0:	01010113          	addi	sp,sp,16
800000f4:	00008067          	jalr	zero,0(ra)
