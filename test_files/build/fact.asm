
build/fact:     file format elf32-littleriscv


Disassembly of section .text:

80000000 <_start>:
80000000:	ff010113          	addi	sp,sp,-16
80000004:	00112623          	sw	ra,12(sp)
80000008:	00000517          	auipc	a0,0x0
8000000c:	22050513          	addi	a0,a0,544 # 80000228 <f>
80000010:	00000597          	auipc	a1,0x0
80000014:	21858593          	addi	a1,a1,536 # 80000228 <f>
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
80000048:	06c000ef          	jal	ra,800000b4 <main>
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

80000078 <fact>:
80000078:	00100793          	addi	a5,zero,1
8000007c:	00a7e663          	bltu	a5,a0,80000088 <fact+0x10>
80000080:	00100513          	addi	a0,zero,1
80000084:	00008067          	jalr	zero,0(ra)
80000088:	ff010113          	addi	sp,sp,-16
8000008c:	00112623          	sw	ra,12(sp)
80000090:	00812423          	sw	s0,8(sp)
80000094:	00050413          	addi	s0,a0,0
80000098:	fff50513          	addi	a0,a0,-1
8000009c:	fddff0ef          	jal	ra,80000078 <fact>
800000a0:	02850533          	mul	a0,a0,s0
800000a4:	00c12083          	lw	ra,12(sp)
800000a8:	00812403          	lw	s0,8(sp)
800000ac:	01010113          	addi	sp,sp,16
800000b0:	00008067          	jalr	zero,0(ra)

800000b4 <main>:
800000b4:	fe010113          	addi	sp,sp,-32
800000b8:	00112e23          	sw	ra,28(sp)
800000bc:	00812c23          	sw	s0,24(sp)
800000c0:	00912a23          	sw	s1,20(sp)
800000c4:	01212823          	sw	s2,16(sp)
800000c8:	01312623          	sw	s3,12(sp)
800000cc:	80000937          	lui	s2,0x80000
800000d0:	22890913          	addi	s2,s2,552 # 80000228 <f>
800000d4:	800004b7          	lui	s1,0x80000
800000d8:	1f448493          	addi	s1,s1,500 # 800001f4 <ans>
800000dc:	00000413          	addi	s0,zero,0
800000e0:	00d00993          	addi	s3,zero,13
800000e4:	00040513          	addi	a0,s0,0
800000e8:	f91ff0ef          	jal	ra,80000078 <fact>
800000ec:	00a92023          	sw	a0,0(s2)
800000f0:	0004a783          	lw	a5,0(s1)
800000f4:	40a78533          	sub	a0,a5,a0
800000f8:	00153513          	sltiu	a0,a0,1
800000fc:	f69ff0ef          	jal	ra,80000064 <check>
80000100:	00140413          	addi	s0,s0,1
80000104:	00490913          	addi	s2,s2,4
80000108:	00448493          	addi	s1,s1,4
8000010c:	fd341ce3          	bne	s0,s3,800000e4 <main+0x30>
80000110:	00000513          	addi	a0,zero,0
80000114:	01c12083          	lw	ra,28(sp)
80000118:	01812403          	lw	s0,24(sp)
8000011c:	01412483          	lw	s1,20(sp)
80000120:	01012903          	lw	s2,16(sp)
80000124:	00c12983          	lw	s3,12(sp)
80000128:	02010113          	addi	sp,sp,32
8000012c:	00008067          	jalr	zero,0(ra)
