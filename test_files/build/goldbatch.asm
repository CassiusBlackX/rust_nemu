
build/goldbatch:     file format elf32-littleriscv


Disassembly of section .text:

80000000 <_start>:
80000000:	ff010113          	addi	sp,sp,-16
80000004:	00112623          	sw	ra,12(sp)
80000008:	00000517          	auipc	a0,0x0
8000000c:	24c50513          	addi	a0,a0,588 # 80000254 <_bss_start>
80000010:	00000597          	auipc	a1,0x0
80000014:	24458593          	addi	a1,a1,580 # 80000254 <_bss_start>
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
80000048:	0e4000ef          	jal	ra,8000012c <main>
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

80000078 <is_prime>:
80000078:	00050713          	addi	a4,a0,0
8000007c:	00100793          	addi	a5,zero,1
80000080:	02a7d863          	bge	a5,a0,800000b0 <is_prime+0x38>
80000084:	00200793          	addi	a5,zero,2
80000088:	02a7d863          	bge	a5,a0,800000b8 <is_prime+0x40>
8000008c:	00157513          	andi	a0,a0,1
80000090:	00050c63          	beq	a0,zero,800000a8 <is_prime+0x30>
80000094:	00178793          	addi	a5,a5,1
80000098:	00f70a63          	beq	a4,a5,800000ac <is_prime+0x34>
8000009c:	02f766b3          	rem	a3,a4,a5
800000a0:	fe069ae3          	bne	a3,zero,80000094 <is_prime+0x1c>
800000a4:	00068513          	addi	a0,a3,0
800000a8:	00008067          	jalr	zero,0(ra)
800000ac:	00008067          	jalr	zero,0(ra)
800000b0:	00000513          	addi	a0,zero,0
800000b4:	00008067          	jalr	zero,0(ra)
800000b8:	00100513          	addi	a0,zero,1
800000bc:	00008067          	jalr	zero,0(ra)

800000c0 <goldbach>:
800000c0:	00200793          	addi	a5,zero,2
800000c4:	06a7d063          	bge	a5,a0,80000124 <goldbach+0x64>
800000c8:	ff010113          	addi	sp,sp,-16
800000cc:	00112623          	sw	ra,12(sp)
800000d0:	00812423          	sw	s0,8(sp)
800000d4:	00912223          	sw	s1,4(sp)
800000d8:	00050493          	addi	s1,a0,0
800000dc:	00200413          	addi	s0,zero,2
800000e0:	00c0006f          	jal	zero,800000ec <goldbach+0x2c>
800000e4:	00140413          	addi	s0,s0,1
800000e8:	02848263          	beq	s1,s0,8000010c <goldbach+0x4c>
800000ec:	00040513          	addi	a0,s0,0
800000f0:	f89ff0ef          	jal	ra,80000078 <is_prime>
800000f4:	fe0508e3          	beq	a0,zero,800000e4 <goldbach+0x24>
800000f8:	40848533          	sub	a0,s1,s0
800000fc:	f7dff0ef          	jal	ra,80000078 <is_prime>
80000100:	fe0502e3          	beq	a0,zero,800000e4 <goldbach+0x24>
80000104:	00100513          	addi	a0,zero,1
80000108:	0080006f          	jal	zero,80000110 <goldbach+0x50>
8000010c:	00000513          	addi	a0,zero,0
80000110:	00c12083          	lw	ra,12(sp)
80000114:	00812403          	lw	s0,8(sp)
80000118:	00412483          	lw	s1,4(sp)
8000011c:	01010113          	addi	sp,sp,16
80000120:	00008067          	jalr	zero,0(ra)
80000124:	00000513          	addi	a0,zero,0
80000128:	00008067          	jalr	zero,0(ra)

8000012c <main>:
8000012c:	ff010113          	addi	sp,sp,-16
80000130:	00112623          	sw	ra,12(sp)
80000134:	00812423          	sw	s0,8(sp)
80000138:	00912223          	sw	s1,4(sp)
8000013c:	00400413          	addi	s0,zero,4
80000140:	02000493          	addi	s1,zero,32
80000144:	00040513          	addi	a0,s0,0
80000148:	f79ff0ef          	jal	ra,800000c0 <goldbach>
8000014c:	fff50513          	addi	a0,a0,-1
80000150:	00153513          	sltiu	a0,a0,1
80000154:	f11ff0ef          	jal	ra,80000064 <check>
80000158:	00240413          	addi	s0,s0,2
8000015c:	fe9414e3          	bne	s0,s1,80000144 <main+0x18>
80000160:	00000513          	addi	a0,zero,0
80000164:	00c12083          	lw	ra,12(sp)
80000168:	00812403          	lw	s0,8(sp)
8000016c:	00412483          	lw	s1,4(sp)
80000170:	01010113          	addi	sp,sp,16
80000174:	00008067          	jalr	zero,0(ra)
