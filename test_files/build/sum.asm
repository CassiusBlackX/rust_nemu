
build/sum:     file format elf32-littleriscv


Disassembly of section .text:

80000000 <_start>:
80000000:	ff010113          	addi	sp,sp,-16
80000004:	00112623          	sw	ra,12(sp)
80000008:	00000517          	auipc	a0,0x0
8000000c:	14c50513          	addi	a0,a0,332 # 80000154 <_bss_start>
80000010:	00000597          	auipc	a1,0x0
80000014:	14458593          	addi	a1,a1,324 # 80000154 <_bss_start>
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
80000048:	030000ef          	jal	ra,80000078 <main>
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

80000078 <main>:
80000078:	fe010113          	addi	sp,sp,-32
8000007c:	00112e23          	sw	ra,28(sp)
80000080:	00012623          	sw	zero,12(sp)
80000084:	00100793          	addi	a5,zero,1
80000088:	06500693          	addi	a3,zero,101
8000008c:	00c12703          	lw	a4,12(sp)
80000090:	00f70733          	add	a4,a4,a5
80000094:	00e12623          	sw	a4,12(sp)
80000098:	00178793          	addi	a5,a5,1
8000009c:	fed798e3          	bne	a5,a3,8000008c <main+0x14>
800000a0:	00c12503          	lw	a0,12(sp)
800000a4:	fffff7b7          	lui	a5,0xfffff
800000a8:	c4678793          	addi	a5,a5,-954 # ffffec46 <_end+0x7fff5c46>
800000ac:	00f50533          	add	a0,a0,a5
800000b0:	00153513          	sltiu	a0,a0,1
800000b4:	fb1ff0ef          	jal	ra,80000064 <check>
800000b8:	00000513          	addi	a0,zero,0
800000bc:	01c12083          	lw	ra,28(sp)
800000c0:	02010113          	addi	sp,sp,32
800000c4:	00008067          	jalr	zero,0(ra)
