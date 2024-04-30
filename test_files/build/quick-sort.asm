
build/quick-sort:     file format elf32-littleriscv


Disassembly of section .text:

80000000 <_start>:
80000000:	ff010113          	addi	sp,sp,-16
80000004:	00112623          	sw	ra,12(sp)
80000008:	00000517          	auipc	a0,0x0
8000000c:	3c450513          	addi	a0,a0,964 # 800003cc <_bss_start>
80000010:	00000597          	auipc	a1,0x0
80000014:	3bc58593          	addi	a1,a1,956 # 800003cc <_bss_start>
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
80000048:	184000ef          	jal	ra,800001cc <main>
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

80000078 <partition>:
80000078:	00050893          	addi	a7,a0,0
8000007c:	00259793          	slli	a5,a1,0x2
80000080:	00f507b3          	add	a5,a0,a5
80000084:	0007a703          	lw	a4,0(a5)
80000088:	00058513          	addi	a0,a1,0
8000008c:	06c5ca63          	blt	a1,a2,80000100 <partition+0x88>
80000090:	0480006f          	jal	zero,800000d8 <partition+0x60>
80000094:	00261813          	slli	a6,a2,0x2
80000098:	01088833          	add	a6,a7,a6
8000009c:	00259793          	slli	a5,a1,0x2
800000a0:	00f887b3          	add	a5,a7,a5
800000a4:	00082683          	lw	a3,0(a6)
800000a8:	00d7a023          	sw	a3,0(a5)
800000ac:	08c5d463          	bge	a1,a2,80000134 <partition+0xbc>
800000b0:	0007a683          	lw	a3,0(a5)
800000b4:	02d74a63          	blt	a4,a3,800000e8 <partition+0x70>
800000b8:	00158593          	addi	a1,a1,1
800000bc:	00478793          	addi	a5,a5,4
800000c0:	fec598e3          	bne	a1,a2,800000b0 <partition+0x38>
800000c4:	00261793          	slli	a5,a2,0x2
800000c8:	00f887b3          	add	a5,a7,a5
800000cc:	0007a783          	lw	a5,0(a5)
800000d0:	00f82023          	sw	a5,0(a6)
800000d4:	00060513          	addi	a0,a2,0
800000d8:	00251793          	slli	a5,a0,0x2
800000dc:	00f887b3          	add	a5,a7,a5
800000e0:	00e7a023          	sw	a4,0(a5)
800000e4:	00008067          	jalr	zero,0(ra)
800000e8:	00259793          	slli	a5,a1,0x2
800000ec:	00f887b3          	add	a5,a7,a5
800000f0:	0007a783          	lw	a5,0(a5)
800000f4:	00f82023          	sw	a5,0(a6)
800000f8:	02c5da63          	bge	a1,a2,8000012c <partition+0xb4>
800000fc:	04c5d063          	bge	a1,a2,8000013c <partition+0xc4>
80000100:	00261793          	slli	a5,a2,0x2
80000104:	00f887b3          	add	a5,a7,a5
80000108:	0007a683          	lw	a3,0(a5)
8000010c:	f8d754e3          	bge	a4,a3,80000094 <partition+0x1c>
80000110:	fff60613          	addi	a2,a2,-1
80000114:	ffc78793          	addi	a5,a5,-4
80000118:	feb618e3          	bne	a2,a1,80000108 <partition+0x90>
8000011c:	00259813          	slli	a6,a1,0x2
80000120:	01088833          	add	a6,a7,a6
80000124:	00058613          	addi	a2,a1,0
80000128:	f9dff06f          	jal	zero,800000c4 <partition+0x4c>
8000012c:	00058513          	addi	a0,a1,0
80000130:	fa9ff06f          	jal	zero,800000d8 <partition+0x60>
80000134:	00058613          	addi	a2,a1,0
80000138:	f8dff06f          	jal	zero,800000c4 <partition+0x4c>
8000013c:	00261613          	slli	a2,a2,0x2
80000140:	00c88833          	add	a6,a7,a2
80000144:	00082683          	lw	a3,0(a6)
80000148:	00259793          	slli	a5,a1,0x2
8000014c:	00f887b3          	add	a5,a7,a5
80000150:	00d7a023          	sw	a3,0(a5)
80000154:	00058613          	addi	a2,a1,0
80000158:	f6dff06f          	jal	zero,800000c4 <partition+0x4c>

8000015c <quick_sort>:
8000015c:	00c5c463          	blt	a1,a2,80000164 <quick_sort+0x8>
80000160:	00008067          	jalr	zero,0(ra)
80000164:	fe010113          	addi	sp,sp,-32
80000168:	00112e23          	sw	ra,28(sp)
8000016c:	00812c23          	sw	s0,24(sp)
80000170:	00912a23          	sw	s1,20(sp)
80000174:	01212823          	sw	s2,16(sp)
80000178:	01312623          	sw	s3,12(sp)
8000017c:	00050913          	addi	s2,a0,0
80000180:	00058493          	addi	s1,a1,0
80000184:	00060413          	addi	s0,a2,0
80000188:	ef1ff0ef          	jal	ra,80000078 <partition>
8000018c:	00050993          	addi	s3,a0,0
80000190:	fff50613          	addi	a2,a0,-1
80000194:	00048593          	addi	a1,s1,0
80000198:	00090513          	addi	a0,s2,0
8000019c:	fc1ff0ef          	jal	ra,8000015c <quick_sort>
800001a0:	00040613          	addi	a2,s0,0
800001a4:	00198593          	addi	a1,s3,1
800001a8:	00090513          	addi	a0,s2,0
800001ac:	fb1ff0ef          	jal	ra,8000015c <quick_sort>
800001b0:	01c12083          	lw	ra,28(sp)
800001b4:	01812403          	lw	s0,24(sp)
800001b8:	01412483          	lw	s1,20(sp)
800001bc:	01012903          	lw	s2,16(sp)
800001c0:	00c12983          	lw	s3,12(sp)
800001c4:	02010113          	addi	sp,sp,32
800001c8:	00008067          	jalr	zero,0(ra)

800001cc <main>:
800001cc:	fe010113          	addi	sp,sp,-32
800001d0:	00112e23          	sw	ra,28(sp)
800001d4:	00812c23          	sw	s0,24(sp)
800001d8:	00912a23          	sw	s1,20(sp)
800001dc:	01212823          	sw	s2,16(sp)
800001e0:	01312623          	sw	s3,12(sp)
800001e4:	800004b7          	lui	s1,0x80000
800001e8:	01300613          	addi	a2,zero,19
800001ec:	00000593          	addi	a1,zero,0
800001f0:	37c48513          	addi	a0,s1,892 # 8000037c <a>
800001f4:	f69ff0ef          	jal	ra,8000015c <quick_sort>
800001f8:	37c48913          	addi	s2,s1,892
800001fc:	37c48493          	addi	s1,s1,892
80000200:	00000413          	addi	s0,zero,0
80000204:	01400993          	addi	s3,zero,20
80000208:	0004a503          	lw	a0,0(s1)
8000020c:	40850533          	sub	a0,a0,s0
80000210:	00153513          	sltiu	a0,a0,1
80000214:	e51ff0ef          	jal	ra,80000064 <check>
80000218:	00140413          	addi	s0,s0,1
8000021c:	00448493          	addi	s1,s1,4
80000220:	ff3414e3          	bne	s0,s3,80000208 <main+0x3c>
80000224:	00100513          	addi	a0,zero,1
80000228:	e3dff0ef          	jal	ra,80000064 <check>
8000022c:	01300613          	addi	a2,zero,19
80000230:	00000593          	addi	a1,zero,0
80000234:	80000537          	lui	a0,0x80000
80000238:	37c50513          	addi	a0,a0,892 # 8000037c <a>
8000023c:	f21ff0ef          	jal	ra,8000015c <quick_sort>
80000240:	00000413          	addi	s0,zero,0
80000244:	01400493          	addi	s1,zero,20
80000248:	00092503          	lw	a0,0(s2)
8000024c:	40850533          	sub	a0,a0,s0
80000250:	00153513          	sltiu	a0,a0,1
80000254:	e11ff0ef          	jal	ra,80000064 <check>
80000258:	00140413          	addi	s0,s0,1
8000025c:	00490913          	addi	s2,s2,4
80000260:	fe9414e3          	bne	s0,s1,80000248 <main+0x7c>
80000264:	00100513          	addi	a0,zero,1
80000268:	dfdff0ef          	jal	ra,80000064 <check>
8000026c:	00000513          	addi	a0,zero,0
80000270:	01c12083          	lw	ra,28(sp)
80000274:	01812403          	lw	s0,24(sp)
80000278:	01412483          	lw	s1,20(sp)
8000027c:	01012903          	lw	s2,16(sp)
80000280:	00c12983          	lw	s3,12(sp)
80000284:	02010113          	addi	sp,sp,32
80000288:	00008067          	jalr	zero,0(ra)
