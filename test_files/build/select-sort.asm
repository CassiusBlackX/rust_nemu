
build/select-sort:     file format elf32-littleriscv


Disassembly of section .text:

80000000 <_start>:
80000000:	ff010113          	addi	sp,sp,-16
80000004:	00112623          	sw	ra,12(sp)
80000008:	00000517          	auipc	a0,0x0
8000000c:	29c50513          	addi	a0,a0,668 # 800002a4 <_bss_start>
80000010:	00000597          	auipc	a1,0x0
80000014:	29458593          	addi	a1,a1,660 # 800002a4 <_bss_start>
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
80000048:	0b0000ef          	jal	ra,800000f8 <main>
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

80000078 <select_sort>:
80000078:	800008b7          	lui	a7,0x80000
8000007c:	25888893          	addi	a7,a7,600 # 80000258 <a+0x4>
80000080:	00000313          	addi	t1,zero,0
80000084:	80000537          	lui	a0,0x80000
80000088:	25450513          	addi	a0,a0,596 # 80000254 <a>
8000008c:	01400813          	addi	a6,zero,20
80000090:	01300e13          	addi	t3,zero,19
80000094:	04c0006f          	jal	zero,800000e0 <select_sort+0x68>
80000098:	00170713          	addi	a4,a4,1
8000009c:	00468693          	addi	a3,a3,4
800000a0:	03070063          	beq	a4,a6,800000c0 <select_sort+0x48>
800000a4:	00261793          	slli	a5,a2,0x2
800000a8:	00f507b3          	add	a5,a0,a5
800000ac:	0006a583          	lw	a1,0(a3)
800000b0:	0007a783          	lw	a5,0(a5)
800000b4:	fef5d2e3          	bge	a1,a5,80000098 <select_sort+0x20>
800000b8:	00070613          	addi	a2,a4,0
800000bc:	fddff06f          	jal	zero,80000098 <select_sort+0x20>
800000c0:	ffc8a783          	lw	a5,-4(a7)
800000c4:	00261613          	slli	a2,a2,0x2
800000c8:	00c50633          	add	a2,a0,a2
800000cc:	00062703          	lw	a4,0(a2)
800000d0:	fee8ae23          	sw	a4,-4(a7)
800000d4:	00f62023          	sw	a5,0(a2)
800000d8:	00488893          	addi	a7,a7,4
800000dc:	01c30c63          	beq	t1,t3,800000f4 <select_sort+0x7c>
800000e0:	00030613          	addi	a2,t1,0
800000e4:	00130313          	addi	t1,t1,1
800000e8:	00088693          	addi	a3,a7,0
800000ec:	00030713          	addi	a4,t1,0
800000f0:	fb5ff06f          	jal	zero,800000a4 <select_sort+0x2c>
800000f4:	00008067          	jalr	zero,0(ra)

800000f8 <main>:
800000f8:	fe010113          	addi	sp,sp,-32
800000fc:	00112e23          	sw	ra,28(sp)
80000100:	00812c23          	sw	s0,24(sp)
80000104:	00912a23          	sw	s1,20(sp)
80000108:	01212823          	sw	s2,16(sp)
8000010c:	01312623          	sw	s3,12(sp)
80000110:	f69ff0ef          	jal	ra,80000078 <select_sort>
80000114:	800004b7          	lui	s1,0x80000
80000118:	25448913          	addi	s2,s1,596 # 80000254 <a>
8000011c:	25448493          	addi	s1,s1,596
80000120:	00000413          	addi	s0,zero,0
80000124:	01400993          	addi	s3,zero,20
80000128:	0004a503          	lw	a0,0(s1)
8000012c:	40850533          	sub	a0,a0,s0
80000130:	00153513          	sltiu	a0,a0,1
80000134:	f31ff0ef          	jal	ra,80000064 <check>
80000138:	00140413          	addi	s0,s0,1
8000013c:	00448493          	addi	s1,s1,4
80000140:	ff3414e3          	bne	s0,s3,80000128 <main+0x30>
80000144:	00100513          	addi	a0,zero,1
80000148:	f1dff0ef          	jal	ra,80000064 <check>
8000014c:	f2dff0ef          	jal	ra,80000078 <select_sort>
80000150:	00000413          	addi	s0,zero,0
80000154:	01400493          	addi	s1,zero,20
80000158:	00092503          	lw	a0,0(s2)
8000015c:	40850533          	sub	a0,a0,s0
80000160:	00153513          	sltiu	a0,a0,1
80000164:	f01ff0ef          	jal	ra,80000064 <check>
80000168:	00140413          	addi	s0,s0,1
8000016c:	00490913          	addi	s2,s2,4
80000170:	fe9414e3          	bne	s0,s1,80000158 <main+0x60>
80000174:	00100513          	addi	a0,zero,1
80000178:	eedff0ef          	jal	ra,80000064 <check>
8000017c:	00000513          	addi	a0,zero,0
80000180:	01c12083          	lw	ra,28(sp)
80000184:	01812403          	lw	s0,24(sp)
80000188:	01412483          	lw	s1,20(sp)
8000018c:	01012903          	lw	s2,16(sp)
80000190:	00c12983          	lw	s3,12(sp)
80000194:	02010113          	addi	sp,sp,32
80000198:	00008067          	jalr	zero,0(ra)
