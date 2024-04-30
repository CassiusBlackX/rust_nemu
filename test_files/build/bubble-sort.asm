
build/bubble-sort:     file format elf32-littleriscv


Disassembly of section .text:

80000000 <_start>:
80000000:	ff010113          	addi	sp,sp,-16
80000004:	00112623          	sw	ra,12(sp)
80000008:	00000517          	auipc	a0,0x0
8000000c:	26050513          	addi	a0,a0,608 # 80000268 <_bss_start>
80000010:	00000597          	auipc	a1,0x0
80000014:	25858593          	addi	a1,a1,600 # 80000268 <_bss_start>
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
80000048:	074000ef          	jal	ra,800000bc <main>
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

80000078 <bubble_sort>:
80000078:	01400593          	addi	a1,zero,20
8000007c:	80000537          	lui	a0,0x80000
80000080:	fff58593          	addi	a1,a1,-1
80000084:	02058a63          	beq	a1,zero,800000b8 <bubble_sort+0x40>
80000088:	21850793          	addi	a5,a0,536 # 80000218 <a>
8000008c:	00000713          	addi	a4,zero,0
80000090:	00c0006f          	jal	zero,8000009c <bubble_sort+0x24>
80000094:	00478793          	addi	a5,a5,4
80000098:	feb754e3          	bge	a4,a1,80000080 <bubble_sort+0x8>
8000009c:	0007a683          	lw	a3,0(a5)
800000a0:	00170713          	addi	a4,a4,1
800000a4:	0047a603          	lw	a2,4(a5)
800000a8:	fed656e3          	bge	a2,a3,80000094 <bubble_sort+0x1c>
800000ac:	00c7a023          	sw	a2,0(a5)
800000b0:	00d7a223          	sw	a3,4(a5)
800000b4:	fe1ff06f          	jal	zero,80000094 <bubble_sort+0x1c>
800000b8:	00008067          	jalr	zero,0(ra)

800000bc <main>:
800000bc:	fe010113          	addi	sp,sp,-32
800000c0:	00112e23          	sw	ra,28(sp)
800000c4:	00812c23          	sw	s0,24(sp)
800000c8:	00912a23          	sw	s1,20(sp)
800000cc:	01212823          	sw	s2,16(sp)
800000d0:	01312623          	sw	s3,12(sp)
800000d4:	fa5ff0ef          	jal	ra,80000078 <bubble_sort>
800000d8:	800004b7          	lui	s1,0x80000
800000dc:	21848913          	addi	s2,s1,536 # 80000218 <a>
800000e0:	21848493          	addi	s1,s1,536
800000e4:	00000413          	addi	s0,zero,0
800000e8:	01400993          	addi	s3,zero,20
800000ec:	0004a503          	lw	a0,0(s1)
800000f0:	40850533          	sub	a0,a0,s0
800000f4:	00153513          	sltiu	a0,a0,1
800000f8:	f6dff0ef          	jal	ra,80000064 <check>
800000fc:	00140413          	addi	s0,s0,1
80000100:	00448493          	addi	s1,s1,4
80000104:	ff3414e3          	bne	s0,s3,800000ec <main+0x30>
80000108:	00100513          	addi	a0,zero,1
8000010c:	f59ff0ef          	jal	ra,80000064 <check>
80000110:	f69ff0ef          	jal	ra,80000078 <bubble_sort>
80000114:	00000413          	addi	s0,zero,0
80000118:	01400493          	addi	s1,zero,20
8000011c:	00092503          	lw	a0,0(s2)
80000120:	40850533          	sub	a0,a0,s0
80000124:	00153513          	sltiu	a0,a0,1
80000128:	f3dff0ef          	jal	ra,80000064 <check>
8000012c:	00140413          	addi	s0,s0,1
80000130:	00490913          	addi	s2,s2,4
80000134:	fe9414e3          	bne	s0,s1,8000011c <main+0x60>
80000138:	00100513          	addi	a0,zero,1
8000013c:	f29ff0ef          	jal	ra,80000064 <check>
80000140:	00000513          	addi	a0,zero,0
80000144:	01c12083          	lw	ra,28(sp)
80000148:	01812403          	lw	s0,24(sp)
8000014c:	01412483          	lw	s1,20(sp)
80000150:	01012903          	lw	s2,16(sp)
80000154:	00c12983          	lw	s3,12(sp)
80000158:	02010113          	addi	sp,sp,32
8000015c:	00008067          	jalr	zero,0(ra)
