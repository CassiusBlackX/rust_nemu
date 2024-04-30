
build/prime:     file format elf32-littleriscv


Disassembly of section .text:

80000000 <_start>:
80000000:	ff010113          	addi	sp,sp,-16
80000004:	00112623          	sw	ra,12(sp)
80000008:	00000517          	auipc	a0,0x0
8000000c:	1e850513          	addi	a0,a0,488 # 800001f0 <_bss_start>
80000010:	00000597          	auipc	a1,0x0
80000014:	1e058593          	addi	a1,a1,480 # 800001f0 <_bss_start>
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
80000080:	00812c23          	sw	s0,24(sp)
80000084:	00912a23          	sw	s1,20(sp)
80000088:	01212823          	sw	s2,16(sp)
8000008c:	01312623          	sw	s3,12(sp)
80000090:	01412423          	sw	s4,8(sp)
80000094:	00000493          	addi	s1,zero,0
80000098:	06500413          	addi	s0,zero,101
8000009c:	00200913          	addi	s2,zero,2
800000a0:	80000a37          	lui	s4,0x80000
800000a4:	1c8a0a13          	addi	s4,s4,456 # 800001c8 <ans>
800000a8:	09700993          	addi	s3,zero,151
800000ac:	02c0006f          	jal	zero,800000d8 <main+0x60>
800000b0:	00040713          	addi	a4,s0,0
800000b4:	00249793          	slli	a5,s1,0x2
800000b8:	00fa07b3          	add	a5,s4,a5
800000bc:	0007a503          	lw	a0,0(a5)
800000c0:	40e50533          	sub	a0,a0,a4
800000c4:	00153513          	sltiu	a0,a0,1
800000c8:	f9dff0ef          	jal	ra,80000064 <check>
800000cc:	00148493          	addi	s1,s1,1
800000d0:	00240413          	addi	s0,s0,2
800000d4:	03340263          	beq	s0,s3,800000f8 <main+0x80>
800000d8:	00200793          	addi	a5,zero,2
800000dc:	00090713          	addi	a4,s2,0
800000e0:	fc895ae3          	bge	s2,s0,800000b4 <main+0x3c>
800000e4:	00178793          	addi	a5,a5,1
800000e8:	fc8784e3          	beq	a5,s0,800000b0 <main+0x38>
800000ec:	02f46733          	rem	a4,s0,a5
800000f0:	fe071ae3          	bne	a4,zero,800000e4 <main+0x6c>
800000f4:	fddff06f          	jal	zero,800000d0 <main+0x58>
800000f8:	ff648513          	addi	a0,s1,-10
800000fc:	00153513          	sltiu	a0,a0,1
80000100:	f65ff0ef          	jal	ra,80000064 <check>
80000104:	00000513          	addi	a0,zero,0
80000108:	01c12083          	lw	ra,28(sp)
8000010c:	01812403          	lw	s0,24(sp)
80000110:	01412483          	lw	s1,20(sp)
80000114:	01012903          	lw	s2,16(sp)
80000118:	00c12983          	lw	s3,12(sp)
8000011c:	00812a03          	lw	s4,8(sp)
80000120:	02010113          	addi	sp,sp,32
80000124:	00008067          	jalr	zero,0(ra)
