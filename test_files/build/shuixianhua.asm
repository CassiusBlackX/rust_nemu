
build/shuixianhua:     file format elf32-littleriscv


Disassembly of section .text:

80000000 <_start>:
80000000:	ff010113          	addi	sp,sp,-16
80000004:	00112623          	sw	ra,12(sp)
80000008:	00000517          	auipc	a0,0x0
8000000c:	21c50513          	addi	a0,a0,540 # 80000224 <_bss_start>
80000010:	00000597          	auipc	a1,0x0
80000014:	21458593          	addi	a1,a1,532 # 80000224 <_bss_start>
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
80000048:	03c000ef          	jal	ra,80000084 <main>
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

80000078 <cube>:
80000078:	02a507b3          	mul	a5,a0,a0
8000007c:	02a78533          	mul	a0,a5,a0
80000080:	00008067          	jalr	zero,0(ra)

80000084 <main>:
80000084:	fe010113          	addi	sp,sp,-32
80000088:	00112e23          	sw	ra,28(sp)
8000008c:	00812c23          	sw	s0,24(sp)
80000090:	00912a23          	sw	s1,20(sp)
80000094:	01212823          	sw	s2,16(sp)
80000098:	01312623          	sw	s3,12(sp)
8000009c:	01412423          	sw	s4,8(sp)
800000a0:	01512223          	sw	s5,4(sp)
800000a4:	00000a13          	addi	s4,zero,0
800000a8:	06400413          	addi	s0,zero,100
800000ac:	06400993          	addi	s3,zero,100
800000b0:	00a00493          	addi	s1,zero,10
800000b4:	80000ab7          	lui	s5,0x80000
800000b8:	214a8a93          	addi	s5,s5,532 # 80000214 <ans>
800000bc:	1f400913          	addi	s2,zero,500
800000c0:	00c0006f          	jal	zero,800000cc <main+0x48>
800000c4:	00140413          	addi	s0,s0,1
800000c8:	05240c63          	beq	s0,s2,80000120 <main+0x9c>
800000cc:	033446b3          	div	a3,s0,s3
800000d0:	02944633          	div	a2,s0,s1
800000d4:	02966633          	rem	a2,a2,s1
800000d8:	02946733          	rem	a4,s0,s1
800000dc:	02c607b3          	mul	a5,a2,a2
800000e0:	02c787b3          	mul	a5,a5,a2
800000e4:	02d68633          	mul	a2,a3,a3
800000e8:	02d606b3          	mul	a3,a2,a3
800000ec:	00d787b3          	add	a5,a5,a3
800000f0:	02e706b3          	mul	a3,a4,a4
800000f4:	02e68733          	mul	a4,a3,a4
800000f8:	00e787b3          	add	a5,a5,a4
800000fc:	fcf414e3          	bne	s0,a5,800000c4 <main+0x40>
80000100:	002a1793          	slli	a5,s4,0x2
80000104:	00fa87b3          	add	a5,s5,a5
80000108:	0007a503          	lw	a0,0(a5)
8000010c:	40850533          	sub	a0,a0,s0
80000110:	00153513          	sltiu	a0,a0,1
80000114:	f51ff0ef          	jal	ra,80000064 <check>
80000118:	001a0a13          	addi	s4,s4,1
8000011c:	fa9ff06f          	jal	zero,800000c4 <main+0x40>
80000120:	ffca0513          	addi	a0,s4,-4
80000124:	00153513          	sltiu	a0,a0,1
80000128:	f3dff0ef          	jal	ra,80000064 <check>
8000012c:	00000513          	addi	a0,zero,0
80000130:	01c12083          	lw	ra,28(sp)
80000134:	01812403          	lw	s0,24(sp)
80000138:	01412483          	lw	s1,20(sp)
8000013c:	01012903          	lw	s2,16(sp)
80000140:	00c12983          	lw	s3,12(sp)
80000144:	00812a03          	lw	s4,8(sp)
80000148:	00412a83          	lw	s5,4(sp)
8000014c:	02010113          	addi	sp,sp,32
80000150:	00008067          	jalr	zero,0(ra)
