
build/fib:     file format elf32-littleriscv


Disassembly of section .text:

80000000 <_start>:
80000000:	ff010113          	addi	sp,sp,-16
80000004:	00112623          	sw	ra,12(sp)
80000008:	00000517          	auipc	a0,0x0
8000000c:	2bc50513          	addi	a0,a0,700 # 800002c4 <_bss_start>
80000010:	00000597          	auipc	a1,0x0
80000014:	2b458593          	addi	a1,a1,692 # 800002c4 <_bss_start>
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
8000008c:	80000437          	lui	s0,0x80000
80000090:	18440413          	addi	s0,s0,388 # 80000184 <fib>
80000094:	0a840493          	addi	s1,s0,168
80000098:	09840913          	addi	s2,s0,152
8000009c:	00442783          	lw	a5,4(s0)
800000a0:	00042703          	lw	a4,0(s0)
800000a4:	00e787b3          	add	a5,a5,a4
800000a8:	00f42423          	sw	a5,8(s0)
800000ac:	0004a503          	lw	a0,0(s1)
800000b0:	40f50533          	sub	a0,a0,a5
800000b4:	00153513          	sltiu	a0,a0,1
800000b8:	fadff0ef          	jal	ra,80000064 <check>
800000bc:	00440413          	addi	s0,s0,4
800000c0:	00448493          	addi	s1,s1,4
800000c4:	fd241ce3          	bne	s0,s2,8000009c <main+0x24>
800000c8:	00100513          	addi	a0,zero,1
800000cc:	f99ff0ef          	jal	ra,80000064 <check>
800000d0:	00000513          	addi	a0,zero,0
800000d4:	00c12083          	lw	ra,12(sp)
800000d8:	00812403          	lw	s0,8(sp)
800000dc:	00412483          	lw	s1,4(sp)
800000e0:	00012903          	lw	s2,0(sp)
800000e4:	01010113          	addi	sp,sp,16
800000e8:	00008067          	jalr	zero,0(ra)
