
build/if-else:     file format elf32-littleriscv


Disassembly of section .text:

80000000 <_start>:
80000000:	ff010113          	addi	sp,sp,-16
80000004:	00112623          	sw	ra,12(sp)
80000008:	00000517          	auipc	a0,0x0
8000000c:	24050513          	addi	a0,a0,576 # 80000248 <_bss_start>
80000010:	00000597          	auipc	a1,0x0
80000014:	23858593          	addi	a1,a1,568 # 80000248 <_bss_start>
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
80000048:	070000ef          	jal	ra,800000b8 <main>
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

80000078 <if_else>:
80000078:	00050793          	addi	a5,a0,0
8000007c:	1f400713          	addi	a4,zero,500
80000080:	02a74863          	blt	a4,a0,800000b0 <if_else+0x38>
80000084:	12c00713          	addi	a4,zero,300
80000088:	06400513          	addi	a0,zero,100
8000008c:	02f74463          	blt	a4,a5,800000b4 <if_else+0x3c>
80000090:	06400713          	addi	a4,zero,100
80000094:	04b00513          	addi	a0,zero,75
80000098:	00f74e63          	blt	a4,a5,800000b4 <if_else+0x3c>
8000009c:	03200713          	addi	a4,zero,50
800000a0:	00000513          	addi	a0,zero,0
800000a4:	00f75863          	bge	a4,a5,800000b4 <if_else+0x3c>
800000a8:	03200513          	addi	a0,zero,50
800000ac:	00008067          	jalr	zero,0(ra)
800000b0:	09600513          	addi	a0,zero,150
800000b4:	00008067          	jalr	zero,0(ra)

800000b8 <main>:
800000b8:	ff010113          	addi	sp,sp,-16
800000bc:	00112623          	sw	ra,12(sp)
800000c0:	00812423          	sw	s0,8(sp)
800000c4:	00912223          	sw	s1,4(sp)
800000c8:	01212023          	sw	s2,0(sp)
800000cc:	80000437          	lui	s0,0x80000
800000d0:	1d840413          	addi	s0,s0,472 # 800001d8 <test_data>
800000d4:	03840493          	addi	s1,s0,56
800000d8:	00048913          	addi	s2,s1,0
800000dc:	00042503          	lw	a0,0(s0)
800000e0:	f99ff0ef          	jal	ra,80000078 <if_else>
800000e4:	0004a783          	lw	a5,0(s1)
800000e8:	40a78533          	sub	a0,a5,a0
800000ec:	00153513          	sltiu	a0,a0,1
800000f0:	f75ff0ef          	jal	ra,80000064 <check>
800000f4:	00440413          	addi	s0,s0,4
800000f8:	00448493          	addi	s1,s1,4
800000fc:	ff2410e3          	bne	s0,s2,800000dc <main+0x24>
80000100:	00100513          	addi	a0,zero,1
80000104:	f61ff0ef          	jal	ra,80000064 <check>
80000108:	00000513          	addi	a0,zero,0
8000010c:	00c12083          	lw	ra,12(sp)
80000110:	00812403          	lw	s0,8(sp)
80000114:	00412483          	lw	s1,4(sp)
80000118:	00012903          	lw	s2,0(sp)
8000011c:	01010113          	addi	sp,sp,16
80000120:	00008067          	jalr	zero,0(ra)
