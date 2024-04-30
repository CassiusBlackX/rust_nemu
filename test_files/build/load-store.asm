
build/load-store:     file format elf32-littleriscv


Disassembly of section .text:

80000000 <_start>:
80000000:	ff010113          	addi	sp,sp,-16
80000004:	00112623          	sw	ra,12(sp)
80000008:	00000517          	auipc	a0,0x0
8000000c:	32850513          	addi	a0,a0,808 # 80000330 <_bss_start>
80000010:	00000597          	auipc	a1,0x0
80000014:	32058593          	addi	a1,a1,800 # 80000330 <_bss_start>
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
80000094:	80000437          	lui	s0,0x80000
80000098:	2b040493          	addi	s1,s0,688 # 800002b0 <mem>
8000009c:	01048913          	addi	s2,s1,16
800000a0:	00090993          	addi	s3,s2,0
800000a4:	2b040413          	addi	s0,s0,688
800000a8:	00041503          	lh	a0,0(s0)
800000ac:	00092783          	lw	a5,0(s2)
800000b0:	40f50533          	sub	a0,a0,a5
800000b4:	00153513          	sltiu	a0,a0,1
800000b8:	fadff0ef          	jal	ra,80000064 <check>
800000bc:	00240413          	addi	s0,s0,2
800000c0:	00490913          	addi	s2,s2,4
800000c4:	ff3412e3          	bne	s0,s3,800000a8 <main+0x30>
800000c8:	80000437          	lui	s0,0x80000
800000cc:	2e040413          	addi	s0,s0,736 # 800002e0 <lhu_ans>
800000d0:	0004d503          	lhu	a0,0(s1)
800000d4:	00042783          	lw	a5,0(s0)
800000d8:	40f50533          	sub	a0,a0,a5
800000dc:	00153513          	sltiu	a0,a0,1
800000e0:	f85ff0ef          	jal	ra,80000064 <check>
800000e4:	00248493          	addi	s1,s1,2
800000e8:	00440413          	addi	s0,s0,4
800000ec:	ff3492e3          	bne	s1,s3,800000d0 <main+0x58>
800000f0:	800004b7          	lui	s1,0x80000
800000f4:	2b048493          	addi	s1,s1,688 # 800002b0 <mem>
800000f8:	0014c703          	lbu	a4,1(s1)
800000fc:	0024c783          	lbu	a5,2(s1)
80000100:	00879793          	slli	a5,a5,0x8
80000104:	00e7e7b3          	or	a5,a5,a4
80000108:	0034c703          	lbu	a4,3(s1)
8000010c:	01071713          	slli	a4,a4,0x10
80000110:	00f76733          	or	a4,a4,a5
80000114:	0044c783          	lbu	a5,4(s1)
80000118:	01879793          	slli	a5,a5,0x18
8000011c:	00e7e7b3          	or	a5,a5,a4
80000120:	0504a503          	lw	a0,80(s1)
80000124:	40f50533          	sub	a0,a0,a5
80000128:	00153513          	sltiu	a0,a0,1
8000012c:	f39ff0ef          	jal	ra,80000064 <check>
80000130:	0054c783          	lbu	a5,5(s1)
80000134:	0064c703          	lbu	a4,6(s1)
80000138:	00871713          	slli	a4,a4,0x8
8000013c:	00f76733          	or	a4,a4,a5
80000140:	0074c783          	lbu	a5,7(s1)
80000144:	01079793          	slli	a5,a5,0x10
80000148:	00e7e7b3          	or	a5,a5,a4
8000014c:	0084c503          	lbu	a0,8(s1)
80000150:	01851513          	slli	a0,a0,0x18
80000154:	00f56533          	or	a0,a0,a5
80000158:	0544a783          	lw	a5,84(s1)
8000015c:	40f50533          	sub	a0,a0,a5
80000160:	00153513          	sltiu	a0,a0,1
80000164:	f01ff0ef          	jal	ra,80000064 <check>
80000168:	0094c703          	lbu	a4,9(s1)
8000016c:	00a4c783          	lbu	a5,10(s1)
80000170:	00879793          	slli	a5,a5,0x8
80000174:	00e7e7b3          	or	a5,a5,a4
80000178:	00b4c703          	lbu	a4,11(s1)
8000017c:	01071713          	slli	a4,a4,0x10
80000180:	00f76733          	or	a4,a4,a5
80000184:	00c4c783          	lbu	a5,12(s1)
80000188:	01879793          	slli	a5,a5,0x18
8000018c:	00e7e7b3          	or	a5,a5,a4
80000190:	0584a503          	lw	a0,88(s1)
80000194:	40f50533          	sub	a0,a0,a5
80000198:	00153513          	sltiu	a0,a0,1
8000019c:	ec9ff0ef          	jal	ra,80000064 <check>
800001a0:	06048493          	addi	s1,s1,96
800001a4:	00100413          	addi	s0,zero,1
800001a8:	00100a13          	addi	s4,zero,1
800001ac:	80000937          	lui	s2,0x80000
800001b0:	2b090913          	addi	s2,s2,688 # 800002b0 <mem>
800001b4:	01100993          	addi	s3,zero,17
800001b8:	008a17b3          	sll	a5,s4,s0
800001bc:	fff7c793          	xori	a5,a5,-1
800001c0:	01079793          	slli	a5,a5,0x10
800001c4:	0107d793          	srli	a5,a5,0x10
800001c8:	00890733          	add	a4,s2,s0
800001cc:	fef71fa3          	sh	a5,-1(a4)
800001d0:	0004a503          	lw	a0,0(s1)
800001d4:	40f50533          	sub	a0,a0,a5
800001d8:	00153513          	sltiu	a0,a0,1
800001dc:	e89ff0ef          	jal	ra,80000064 <check>
800001e0:	00240413          	addi	s0,s0,2
800001e4:	00448493          	addi	s1,s1,4
800001e8:	fd3418e3          	bne	s0,s3,800001b8 <main+0x140>
800001ec:	00000513          	addi	a0,zero,0
800001f0:	01c12083          	lw	ra,28(sp)
800001f4:	01812403          	lw	s0,24(sp)
800001f8:	01412483          	lw	s1,20(sp)
800001fc:	01012903          	lw	s2,16(sp)
80000200:	00c12983          	lw	s3,12(sp)
80000204:	00812a03          	lw	s4,8(sp)
80000208:	02010113          	addi	sp,sp,32
8000020c:	00008067          	jalr	zero,0(ra)