
build/crc32:     file format elf32-littleriscv


Disassembly of section .text:

80000000 <_start>:
80000000:	ff010113          	addi	sp,sp,-16
80000004:	00112623          	sw	ra,12(sp)
80000008:	00000517          	auipc	a0,0x0
8000000c:	23050513          	addi	a0,a0,560 # 80000238 <table.0>
80000010:	00000597          	auipc	a1,0x0
80000014:	22858593          	addi	a1,a1,552 # 80000238 <table.0>
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
80000048:	0e0000ef          	jal	ra,80000128 <main>
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

80000078 <rc_crc32>:
80000078:	800007b7          	lui	a5,0x80000
8000007c:	6387a803          	lw	a6,1592(a5) # 80000638 <have_table.1>
80000080:	06081263          	bne	a6,zero,800000e4 <rc_crc32+0x6c>
80000084:	80000337          	lui	t1,0x80000
80000088:	23830313          	addi	t1,t1,568 # 80000238 <table.0>
8000008c:	edb888b7          	lui	a7,0xedb88
80000090:	32088893          	addi	a7,a7,800 # edb88320 <_end+0x6db7f320>
80000094:	10000e13          	addi	t3,zero,256
80000098:	0340006f          	jal	zero,800000cc <rc_crc32+0x54>
8000009c:	0017d793          	srli	a5,a5,0x1
800000a0:	fff70713          	addi	a4,a4,-1
800000a4:	00070c63          	beq	a4,zero,800000bc <rc_crc32+0x44>
800000a8:	0017f693          	andi	a3,a5,1
800000ac:	fe0688e3          	beq	a3,zero,8000009c <rc_crc32+0x24>
800000b0:	0017d793          	srli	a5,a5,0x1
800000b4:	0117c7b3          	xor	a5,a5,a7
800000b8:	fe9ff06f          	jal	zero,800000a0 <rc_crc32+0x28>
800000bc:	00f32023          	sw	a5,0(t1)
800000c0:	00180813          	addi	a6,a6,1
800000c4:	00430313          	addi	t1,t1,4
800000c8:	01c80863          	beq	a6,t3,800000d8 <rc_crc32+0x60>
800000cc:	00080793          	addi	a5,a6,0
800000d0:	00800713          	addi	a4,zero,8
800000d4:	fd5ff06f          	jal	zero,800000a8 <rc_crc32+0x30>
800000d8:	800007b7          	lui	a5,0x80000
800000dc:	00100713          	addi	a4,zero,1
800000e0:	62e7ac23          	sw	a4,1592(a5) # 80000638 <have_table.1>
800000e4:	fff54513          	xori	a0,a0,-1
800000e8:	00c58633          	add	a2,a1,a2
800000ec:	02c5fa63          	bgeu	a1,a2,80000120 <rc_crc32+0xa8>
800000f0:	80000837          	lui	a6,0x80000
800000f4:	23880813          	addi	a6,a6,568 # 80000238 <table.0>
800000f8:	00855713          	srli	a4,a0,0x8
800000fc:	0ff57793          	andi	a5,a0,255
80000100:	0005c683          	lbu	a3,0(a1)
80000104:	00d7c7b3          	xor	a5,a5,a3
80000108:	00279793          	slli	a5,a5,0x2
8000010c:	00f807b3          	add	a5,a6,a5
80000110:	0007a503          	lw	a0,0(a5)
80000114:	00a74533          	xor	a0,a4,a0
80000118:	00158593          	addi	a1,a1,1
8000011c:	fcb61ee3          	bne	a2,a1,800000f8 <rc_crc32+0x80>
80000120:	fff54513          	xori	a0,a0,-1
80000124:	00008067          	jalr	zero,0(ra)

80000128 <main>:
80000128:	ff010113          	addi	sp,sp,-16
8000012c:	00112623          	sw	ra,12(sp)
80000130:	02b00613          	addi	a2,zero,43
80000134:	800005b7          	lui	a1,0x80000
80000138:	16858593          	addi	a1,a1,360 # 80000168 <_etext>
8000013c:	00000513          	addi	a0,zero,0
80000140:	f39ff0ef          	jal	ra,80000078 <rc_crc32>
80000144:	beb067b7          	lui	a5,0xbeb06
80000148:	cc778793          	addi	a5,a5,-825 # beb05cc7 <_end+0x3eafccc7>
8000014c:	00f50533          	add	a0,a0,a5
80000150:	00153513          	sltiu	a0,a0,1
80000154:	f11ff0ef          	jal	ra,80000064 <check>
80000158:	00000513          	addi	a0,zero,0
8000015c:	00c12083          	lw	ra,12(sp)
80000160:	01010113          	addi	sp,sp,16
80000164:	00008067          	jalr	zero,0(ra)
