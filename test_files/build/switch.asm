
build/switch:     file format elf32-littleriscv


Disassembly of section .text:

80000000 <_start>:
80000000:	ff010113          	addi	sp,sp,-16
80000004:	00112623          	sw	ra,12(sp)
80000008:	00000517          	auipc	a0,0x0
8000000c:	25050513          	addi	a0,a0,592 # 80000258 <_bss_start>
80000010:	00000597          	auipc	a1,0x0
80000014:	24858593          	addi	a1,a1,584 # 80000258 <_bss_start>
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
80000048:	080000ef          	jal	ra,800000c8 <main>
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

80000078 <switch_case>:
80000078:	00c00793          	addi	a5,zero,12
8000007c:	02a7ee63          	bltu	a5,a0,800000b8 <switch_case+0x40>
80000080:	00251793          	slli	a5,a0,0x2
80000084:	80000737          	lui	a4,0x80000
80000088:	13470713          	addi	a4,a4,308 # 80000134 <_etext>
8000008c:	00e787b3          	add	a5,a5,a4
80000090:	0007a783          	lw	a5,0(a5)
80000094:	00078067          	jalr	zero,0(a5)
80000098:	00500513          	addi	a0,zero,5
8000009c:	00008067          	jalr	zero,0(ra)
800000a0:	00800513          	addi	a0,zero,8
800000a4:	00008067          	jalr	zero,0(ra)
800000a8:	00a00513          	addi	a0,zero,10
800000ac:	00008067          	jalr	zero,0(ra)
800000b0:	00f00513          	addi	a0,zero,15
800000b4:	00008067          	jalr	zero,0(ra)
800000b8:	fff00513          	addi	a0,zero,-1
800000bc:	00008067          	jalr	zero,0(ra)
800000c0:	00200513          	addi	a0,zero,2
800000c4:	00008067          	jalr	zero,0(ra)

800000c8 <main>:
800000c8:	ff010113          	addi	sp,sp,-16
800000cc:	00112623          	sw	ra,12(sp)
800000d0:	00812423          	sw	s0,8(sp)
800000d4:	00912223          	sw	s1,4(sp)
800000d8:	01212023          	sw	s2,0(sp)
800000dc:	800004b7          	lui	s1,0x80000
800000e0:	21c48493          	addi	s1,s1,540 # 8000021c <ans>
800000e4:	fff00413          	addi	s0,zero,-1
800000e8:	00e00913          	addi	s2,zero,14
800000ec:	00040513          	addi	a0,s0,0
800000f0:	f89ff0ef          	jal	ra,80000078 <switch_case>
800000f4:	0004a783          	lw	a5,0(s1)
800000f8:	40a78533          	sub	a0,a5,a0
800000fc:	00153513          	sltiu	a0,a0,1
80000100:	f65ff0ef          	jal	ra,80000064 <check>
80000104:	00140413          	addi	s0,s0,1
80000108:	00448493          	addi	s1,s1,4
8000010c:	ff2410e3          	bne	s0,s2,800000ec <main+0x24>
80000110:	00100513          	addi	a0,zero,1
80000114:	f51ff0ef          	jal	ra,80000064 <check>
80000118:	00000513          	addi	a0,zero,0
8000011c:	00c12083          	lw	ra,12(sp)
80000120:	00812403          	lw	s0,8(sp)
80000124:	00412483          	lw	s1,4(sp)
80000128:	00012903          	lw	s2,0(sp)
8000012c:	01010113          	addi	sp,sp,16
80000130:	00008067          	jalr	zero,0(ra)
