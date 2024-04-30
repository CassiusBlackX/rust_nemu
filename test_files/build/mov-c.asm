
build/mov-c:     file format elf32-littleriscv


Disassembly of section .text:

80000000 <_start>:
80000000:	ff010113          	addi	sp,sp,-16
80000004:	00112623          	sw	ra,12(sp)
80000008:	00000517          	auipc	a0,0x0
8000000c:	1d850513          	addi	a0,a0,472 # 800001e0 <A>
80000010:	00000597          	auipc	a1,0x0
80000014:	1d058593          	addi	a1,a1,464 # 800001e0 <A>
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
8000008c:	1e040413          	addi	s0,s0,480 # 800001e0 <A>
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
800000bc:	20f4a423          	sw	a5,520(s1) # 80000208 <b>
800000c0:	2084a783          	lw	a5,520(s1)
800000c4:	00f42a23          	sw	a5,20(s0)
800000c8:	00042503          	lw	a0,0(s0)
800000cc:	00153513          	sltiu	a0,a0,1
800000d0:	f95ff0ef          	jal	ra,80000064 <check>
800000d4:	00442503          	lw	a0,4(s0)
800000d8:	fff50513          	addi	a0,a0,-1
800000dc:	00153513          	sltiu	a0,a0,1
800000e0:	f85ff0ef          	jal	ra,80000064 <check>
800000e4:	00842503          	lw	a0,8(s0)
800000e8:	ffe50513          	addi	a0,a0,-2
800000ec:	00153513          	sltiu	a0,a0,1
800000f0:	f75ff0ef          	jal	ra,80000064 <check>
800000f4:	00c42503          	lw	a0,12(s0)
800000f8:	ffd50513          	addi	a0,a0,-3
800000fc:	00153513          	sltiu	a0,a0,1
80000100:	f65ff0ef          	jal	ra,80000064 <check>
80000104:	01042503          	lw	a0,16(s0)
80000108:	ffc50513          	addi	a0,a0,-4
8000010c:	00153513          	sltiu	a0,a0,1
80000110:	f55ff0ef          	jal	ra,80000064 <check>
80000114:	2084a503          	lw	a0,520(s1)
80000118:	ffd50513          	addi	a0,a0,-3
8000011c:	00153513          	sltiu	a0,a0,1
80000120:	f45ff0ef          	jal	ra,80000064 <check>
80000124:	01442503          	lw	a0,20(s0)
80000128:	ffd50513          	addi	a0,a0,-3
8000012c:	00153513          	sltiu	a0,a0,1
80000130:	f35ff0ef          	jal	ra,80000064 <check>
80000134:	00000513          	addi	a0,zero,0
80000138:	00c12083          	lw	ra,12(sp)
8000013c:	00812403          	lw	s0,8(sp)
80000140:	00412483          	lw	s1,4(sp)
80000144:	01010113          	addi	sp,sp,16
80000148:	00008067          	jalr	zero,0(ra)
