
build/add:     file format elf32-littleriscv


Disassembly of section .text:

80000000 <_start>:
80000000:	ff010113          	addi	sp,sp,-16
80000004:	00112623          	sw	ra,12(sp)
80000008:	00000517          	auipc	a0,0x0
8000000c:	32450513          	addi	a0,a0,804 # 8000032c <_bss_start>
80000010:	00000597          	auipc	a1,0x0
80000014:	31c58593          	addi	a1,a1,796 # 8000032c <_bss_start>
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
80000048:	038000ef          	jal	ra,80000080 <main>
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

80000078 <add>:
80000078:	00b50533          	add	a0,a0,a1
8000007c:	00008067          	jalr	zero,0(ra)

80000080 <main>:
80000080:	fd010113          	addi	sp,sp,-48
80000084:	02112623          	sw	ra,44(sp)
80000088:	02812423          	sw	s0,40(sp)
8000008c:	02912223          	sw	s1,36(sp)
80000090:	03212023          	sw	s2,32(sp)
80000094:	01312e23          	sw	s3,28(sp)
80000098:	01412c23          	sw	s4,24(sp)
8000009c:	01512a23          	sw	s5,20(sp)
800000a0:	01612823          	sw	s6,16(sp)
800000a4:	01712623          	sw	s7,12(sp)
800000a8:	80000a37          	lui	s4,0x80000
800000ac:	20ca0a13          	addi	s4,s4,524 # 8000020c <ans>
800000b0:	100a0b13          	addi	s6,s4,256
800000b4:	000b0913          	addi	s2,s6,0
800000b8:	00000a93          	addi	s5,zero,0
800000bc:	020b0993          	addi	s3,s6,32
800000c0:	04000b93          	addi	s7,zero,64
800000c4:	000a0493          	addi	s1,s4,0
800000c8:	000b0413          	addi	s0,s6,0
800000cc:	00092503          	lw	a0,0(s2)
800000d0:	00042783          	lw	a5,0(s0)
800000d4:	00f50533          	add	a0,a0,a5
800000d8:	0004a783          	lw	a5,0(s1)
800000dc:	40f50533          	sub	a0,a0,a5
800000e0:	00153513          	sltiu	a0,a0,1
800000e4:	f81ff0ef          	jal	ra,80000064 <check>
800000e8:	00440413          	addi	s0,s0,4
800000ec:	00448493          	addi	s1,s1,4
800000f0:	fd341ee3          	bne	s0,s3,800000cc <main+0x4c>
800000f4:	008a8a93          	addi	s5,s5,8
800000f8:	00100513          	addi	a0,zero,1
800000fc:	f69ff0ef          	jal	ra,80000064 <check>
80000100:	020a0a13          	addi	s4,s4,32
80000104:	00490913          	addi	s2,s2,4
80000108:	fb7a9ee3          	bne	s5,s7,800000c4 <main+0x44>
8000010c:	00100513          	addi	a0,zero,1
80000110:	f55ff0ef          	jal	ra,80000064 <check>
80000114:	00000513          	addi	a0,zero,0
80000118:	02c12083          	lw	ra,44(sp)
8000011c:	02812403          	lw	s0,40(sp)
80000120:	02412483          	lw	s1,36(sp)
80000124:	02012903          	lw	s2,32(sp)
80000128:	01c12983          	lw	s3,28(sp)
8000012c:	01812a03          	lw	s4,24(sp)
80000130:	01412a83          	lw	s5,20(sp)
80000134:	01012b03          	lw	s6,16(sp)
80000138:	00c12b83          	lw	s7,12(sp)
8000013c:	03010113          	addi	sp,sp,48
80000140:	00008067          	jalr	zero,0(ra)
