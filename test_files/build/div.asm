
build/div:     file format elf32-littleriscv


Disassembly of section .text:

80000000 <_start>:
80000000:	ff010113          	addi	sp,sp,-16
80000004:	00112623          	sw	ra,12(sp)
80000008:	00000517          	auipc	a0,0x0
8000000c:	1dc50513          	addi	a0,a0,476 # 800001e4 <a>
80000010:	00000597          	auipc	a1,0x0
80000014:	1d458593          	addi	a1,a1,468 # 800001e4 <a>
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
80000078:	ff010113          	addi	sp,sp,-16
8000007c:	00112623          	sw	ra,12(sp)
80000080:	00812423          	sw	s0,8(sp)
80000084:	00912223          	sw	s1,4(sp)
80000088:	01212023          	sw	s2,0(sp)
8000008c:	80000737          	lui	a4,0x80000
80000090:	1e470493          	addi	s1,a4,484 # 800001e4 <a>
80000094:	1e470713          	addi	a4,a4,484
80000098:	00000793          	addi	a5,zero,0
8000009c:	00a00693          	addi	a3,zero,10
800000a0:	00f72023          	sw	a5,0(a4)
800000a4:	00178793          	addi	a5,a5,1
800000a8:	00470713          	addi	a4,a4,4
800000ac:	fed79ae3          	bne	a5,a3,800000a0 <main+0x28>
800000b0:	02848593          	addi	a1,s1,40
800000b4:	00048613          	addi	a2,s1,0
800000b8:	00b00693          	addi	a3,zero,11
800000bc:	00060513          	addi	a0,a2,0
800000c0:	00062703          	lw	a4,0(a2)
800000c4:	00100793          	addi	a5,zero,1
800000c8:	02f70733          	mul	a4,a4,a5
800000cc:	00178793          	addi	a5,a5,1
800000d0:	fed79ce3          	bne	a5,a3,800000c8 <main+0x50>
800000d4:	00e52023          	sw	a4,0(a0)
800000d8:	00460613          	addi	a2,a2,4
800000dc:	feb610e3          	bne	a2,a1,800000bc <main+0x44>
800000e0:	00048613          	addi	a2,s1,0
800000e4:	00b00693          	addi	a3,zero,11
800000e8:	00060513          	addi	a0,a2,0
800000ec:	00062703          	lw	a4,0(a2)
800000f0:	00100793          	addi	a5,zero,1
800000f4:	02f74733          	div	a4,a4,a5
800000f8:	00178793          	addi	a5,a5,1
800000fc:	fed79ce3          	bne	a5,a3,800000f4 <main+0x7c>
80000100:	00e52023          	sw	a4,0(a0)
80000104:	00460613          	addi	a2,a2,4
80000108:	feb610e3          	bne	a2,a1,800000e8 <main+0x70>
8000010c:	00000413          	addi	s0,zero,0
80000110:	00a00913          	addi	s2,zero,10
80000114:	0004a503          	lw	a0,0(s1)
80000118:	40850533          	sub	a0,a0,s0
8000011c:	00153513          	sltiu	a0,a0,1
80000120:	f45ff0ef          	jal	ra,80000064 <check>
80000124:	00140413          	addi	s0,s0,1
80000128:	00448493          	addi	s1,s1,4
8000012c:	ff2414e3          	bne	s0,s2,80000114 <main+0x9c>
80000130:	00000513          	addi	a0,zero,0
80000134:	00c12083          	lw	ra,12(sp)
80000138:	00812403          	lw	s0,8(sp)
8000013c:	00412483          	lw	s1,4(sp)
80000140:	00012903          	lw	s2,0(sp)
80000144:	01010113          	addi	sp,sp,16
80000148:	00008067          	jalr	zero,0(ra)
