
build/movsx:     file format elf32-littleriscv


Disassembly of section .text:

80000000 <_start>:
80000000:	ff010113          	addi	sp,sp,-16
80000004:	00112623          	sw	ra,12(sp)
80000008:	00000517          	auipc	a0,0x0
8000000c:	27450513          	addi	a0,a0,628 # 8000027c <A>
80000010:	00000597          	auipc	a1,0x0
80000014:	26c58593          	addi	a1,a1,620 # 8000027c <A>
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
80000088:	80000437          	lui	s0,0x80000
8000008c:	27c40413          	addi	s0,s0,636 # 8000027c <A>
80000090:	00042023          	sw	zero,0(s0)
80000094:	00100793          	addi	a5,zero,1
80000098:	00f42223          	sw	a5,4(s0)
8000009c:	00200793          	addi	a5,zero,2
800000a0:	00f42423          	sw	a5,8(s0)
800000a4:	00300793          	addi	a5,zero,3
800000a8:	00f42623          	sw	a5,12(s0)
800000ac:	00400793          	addi	a5,zero,4
800000b0:	00f42823          	sw	a5,16(s0)
800000b4:	00c42783          	lw	a5,12(s0)
800000b8:	800004b7          	lui	s1,0x80000
800000bc:	2af4a823          	sw	a5,688(s1) # 800002b0 <b>
800000c0:	2b04a783          	lw	a5,688(s1)
800000c4:	00f42a23          	sw	a5,20(s0)
800000c8:	06100793          	addi	a5,zero,97
800000cc:	02f40423          	sb	a5,40(s0)
800000d0:	02844503          	lbu	a0,40(s0)
800000d4:	01851513          	slli	a0,a0,0x18
800000d8:	41855513          	srai	a0,a0,0x18
800000dc:	f9f50513          	addi	a0,a0,-97
800000e0:	00153513          	sltiu	a0,a0,1
800000e4:	f81ff0ef          	jal	ra,80000064 <check>
800000e8:	02844783          	lbu	a5,40(s0)
800000ec:	01879793          	slli	a5,a5,0x18
800000f0:	4187d793          	srai	a5,a5,0x18
800000f4:	02f404a3          	sb	a5,41(s0)
800000f8:	02944503          	lbu	a0,41(s0)
800000fc:	01851513          	slli	a0,a0,0x18
80000100:	41855513          	srai	a0,a0,0x18
80000104:	f9f50513          	addi	a0,a0,-97
80000108:	00153513          	sltiu	a0,a0,1
8000010c:	f59ff0ef          	jal	ra,80000064 <check>
80000110:	02844783          	lbu	a5,40(s0)
80000114:	01879793          	slli	a5,a5,0x18
80000118:	4187d793          	srai	a5,a5,0x18
8000011c:	00f42023          	sw	a5,0(s0)
80000120:	00042503          	lw	a0,0(s0)
80000124:	f9f50513          	addi	a0,a0,-97
80000128:	00153513          	sltiu	a0,a0,1
8000012c:	f39ff0ef          	jal	ra,80000064 <check>
80000130:	f8000793          	addi	a5,zero,-128
80000134:	02f404a3          	sb	a5,41(s0)
80000138:	02944783          	lbu	a5,41(s0)
8000013c:	01879793          	slli	a5,a5,0x18
80000140:	4187d793          	srai	a5,a5,0x18
80000144:	00f42023          	sw	a5,0(s0)
80000148:	00442503          	lw	a0,4(s0)
8000014c:	fff50513          	addi	a0,a0,-1
80000150:	00153513          	sltiu	a0,a0,1
80000154:	f11ff0ef          	jal	ra,80000064 <check>
80000158:	00842503          	lw	a0,8(s0)
8000015c:	ffe50513          	addi	a0,a0,-2
80000160:	00153513          	sltiu	a0,a0,1
80000164:	f01ff0ef          	jal	ra,80000064 <check>
80000168:	00c42503          	lw	a0,12(s0)
8000016c:	ffd50513          	addi	a0,a0,-3
80000170:	00153513          	sltiu	a0,a0,1
80000174:	ef1ff0ef          	jal	ra,80000064 <check>
80000178:	01042503          	lw	a0,16(s0)
8000017c:	ffc50513          	addi	a0,a0,-4
80000180:	00153513          	sltiu	a0,a0,1
80000184:	ee1ff0ef          	jal	ra,80000064 <check>
80000188:	2b04a503          	lw	a0,688(s1)
8000018c:	ffd50513          	addi	a0,a0,-3
80000190:	00153513          	sltiu	a0,a0,1
80000194:	ed1ff0ef          	jal	ra,80000064 <check>
80000198:	01442503          	lw	a0,20(s0)
8000019c:	ffd50513          	addi	a0,a0,-3
800001a0:	00153513          	sltiu	a0,a0,1
800001a4:	ec1ff0ef          	jal	ra,80000064 <check>
800001a8:	02944503          	lbu	a0,41(s0)
800001ac:	01851513          	slli	a0,a0,0x18
800001b0:	41855513          	srai	a0,a0,0x18
800001b4:	08050513          	addi	a0,a0,128
800001b8:	00153513          	sltiu	a0,a0,1
800001bc:	ea9ff0ef          	jal	ra,80000064 <check>
800001c0:	00042503          	lw	a0,0(s0)
800001c4:	08050513          	addi	a0,a0,128
800001c8:	00153513          	sltiu	a0,a0,1
800001cc:	e99ff0ef          	jal	ra,80000064 <check>
800001d0:	00000513          	addi	a0,zero,0
800001d4:	00c12083          	lw	ra,12(sp)
800001d8:	00812403          	lw	s0,8(sp)
800001dc:	00412483          	lw	s1,4(sp)
800001e0:	01010113          	addi	sp,sp,16
800001e4:	00008067          	jalr	zero,0(ra)
