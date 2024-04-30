
build/mut-longlong:     file format elf32-littleriscv


Disassembly of section .text:

80000000 <_start>:
80000000:	ff010113          	addi	sp,sp,-16
80000004:	00112623          	sw	ra,12(sp)
80000008:	00000517          	auipc	a0,0x0
8000000c:	2c850513          	addi	a0,a0,712 # 800002d0 <_bss_start>
80000010:	00000597          	auipc	a1,0x0
80000014:	2c058593          	addi	a1,a1,704 # 800002d0 <_bss_start>
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
80000048:	04c000ef          	jal	ra,80000094 <main>
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

80000078 <mul>:
80000078:	02c585b3          	mul	a1,a1,a2
8000007c:	02a686b3          	mul	a3,a3,a0
80000080:	00d585b3          	add	a1,a1,a3
80000084:	02c537b3          	mulhu	a5,a0,a2
80000088:	02c50533          	mul	a0,a0,a2
8000008c:	00f585b3          	add	a1,a1,a5
80000090:	00008067          	jalr	zero,0(ra)

80000094 <main>:
80000094:	fd010113          	addi	sp,sp,-48
80000098:	02112623          	sw	ra,44(sp)
8000009c:	02812423          	sw	s0,40(sp)
800000a0:	02912223          	sw	s1,36(sp)
800000a4:	03212023          	sw	s2,32(sp)
800000a8:	01312e23          	sw	s3,28(sp)
800000ac:	01412c23          	sw	s4,24(sp)
800000b0:	01512a23          	sw	s5,20(sp)
800000b4:	01612823          	sw	s6,16(sp)
800000b8:	01712623          	sw	s7,12(sp)
800000bc:	01812423          	sw	s8,8(sp)
800000c0:	800009b7          	lui	s3,0x80000
800000c4:	27098993          	addi	s3,s3,624 # 80000270 <test_data>
800000c8:	00000b13          	addi	s6,zero,0
800000cc:	00000a93          	addi	s5,zero,0
800000d0:	80000bb7          	lui	s7,0x80000
800000d4:	280b8b93          	addi	s7,s7,640 # 80000280 <ans>
800000d8:	00300a13          	addi	s4,zero,3
800000dc:	00400c13          	addi	s8,zero,4
800000e0:	003b1413          	slli	s0,s6,0x3
800000e4:	008b8433          	add	s0,s7,s0
800000e8:	00098913          	addi	s2,s3,0
800000ec:	000a8493          	addi	s1,s5,0
800000f0:	0009a703          	lw	a4,0(s3)
800000f4:	41f75793          	srai	a5,a4,0x1f
800000f8:	00092683          	lw	a3,0(s2)
800000fc:	41f6d613          	srai	a2,a3,0x1f
80000100:	02d787b3          	mul	a5,a5,a3
80000104:	02e60633          	mul	a2,a2,a4
80000108:	00c787b3          	add	a5,a5,a2
8000010c:	02d70633          	mul	a2,a4,a3
80000110:	02d73733          	mulhu	a4,a4,a3
80000114:	00e787b3          	add	a5,a5,a4
80000118:	00042503          	lw	a0,0(s0)
8000011c:	00c54533          	xor	a0,a0,a2
80000120:	00442703          	lw	a4,4(s0)
80000124:	00f747b3          	xor	a5,a4,a5
80000128:	00f56533          	or	a0,a0,a5
8000012c:	00153513          	sltiu	a0,a0,1
80000130:	f35ff0ef          	jal	ra,80000064 <check>
80000134:	00148493          	addi	s1,s1,1
80000138:	00840413          	addi	s0,s0,8
8000013c:	00490913          	addi	s2,s2,4
80000140:	fa9a78e3          	bgeu	s4,s1,800000f0 <main+0x5c>
80000144:	001b0b13          	addi	s6,s6,1
80000148:	415a07b3          	sub	a5,s4,s5
8000014c:	01678b33          	add	s6,a5,s6
80000150:	00100513          	addi	a0,zero,1
80000154:	f11ff0ef          	jal	ra,80000064 <check>
80000158:	001a8a93          	addi	s5,s5,1
8000015c:	00498993          	addi	s3,s3,4
80000160:	f98a90e3          	bne	s5,s8,800000e0 <main+0x4c>
80000164:	00100513          	addi	a0,zero,1
80000168:	efdff0ef          	jal	ra,80000064 <check>
8000016c:	00000513          	addi	a0,zero,0
80000170:	02c12083          	lw	ra,44(sp)
80000174:	02812403          	lw	s0,40(sp)
80000178:	02412483          	lw	s1,36(sp)
8000017c:	02012903          	lw	s2,32(sp)
80000180:	01c12983          	lw	s3,28(sp)
80000184:	01812a03          	lw	s4,24(sp)
80000188:	01412a83          	lw	s5,20(sp)
8000018c:	01012b03          	lw	s6,16(sp)
80000190:	00c12b83          	lw	s7,12(sp)
80000194:	00812c03          	lw	s8,8(sp)
80000198:	03010113          	addi	sp,sp,48
8000019c:	00008067          	jalr	zero,0(ra)
