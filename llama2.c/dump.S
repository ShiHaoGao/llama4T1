
run.elf:     file format elf32-littleriscv


Disassembly of section .text:

20000000 <_start>:
20000000:	4085                	li	ra,1
20000002:	00b6                	sll	ra,ra,0xd
20000004:	3000a073          	csrs	mstatus,ra
20000008:	4085                	li	ra,1
2000000a:	00a6                	sll	ra,ra,0x9
2000000c:	3000a073          	csrs	mstatus,ra
20000010:	4081                	li	ra,0
20000012:	4101                	li	sp,0
20000014:	4181                	li	gp,0
20000016:	4201                	li	tp,0
20000018:	4281                	li	t0,0
2000001a:	4301                	li	t1,0
2000001c:	4381                	li	t2,0
2000001e:	4401                	li	s0,0
20000020:	4481                	li	s1,0
20000022:	4501                	li	a0,0
20000024:	4581                	li	a1,0
20000026:	4601                	li	a2,0
20000028:	4681                	li	a3,0
2000002a:	4701                	li	a4,0
2000002c:	4781                	li	a5,0
2000002e:	4801                	li	a6,0
20000030:	4881                	li	a7,0
20000032:	4901                	li	s2,0
20000034:	4981                	li	s3,0
20000036:	4a01                	li	s4,0
20000038:	4a81                	li	s5,0
2000003a:	4b01                	li	s6,0
2000003c:	4b81                	li	s7,0
2000003e:	4c01                	li	s8,0
20000040:	4c81                	li	s9,0
20000042:	4d01                	li	s10,0
20000044:	4d81                	li	s11,0
20000046:	4e01                	li	t3,0
20000048:	4e81                	li	t4,0
2000004a:	4f01                	li	t5,0
2000004c:	4f81                	li	t6,0
2000004e:	00020117          	auipc	sp,0x20
20000052:	3b210113          	add	sp,sp,946 # 20020400 <bootstacktop>
20000056:	777080ef          	jal	20008fcc <main>

2000005a <poweroff>:
2000005a:	a001                	j	2000005a <poweroff>

2000005c <v_memcpy>:
2000005c:	86aa                	mv	a3,a0

2000005e <loop>:
2000005e:	0c3672d7          	vsetvli	t0,a2,e8,m8,ta,ma
20000062:	02058007          	vle8.v	v0,(a1)
20000066:	9596                	add	a1,a1,t0
20000068:	40560633          	sub	a2,a2,t0
2000006c:	02068027          	vse8.v	v0,(a3)
20000070:	9696                	add	a3,a3,t0
20000072:	f675                	bnez	a2,2000005e <loop>
20000074:	8082                	ret

20000076 <compare>:
20000076:	6118                	flw	fa4,0(a0)
20000078:	619c                	flw	fa5,0(a1)
2000007a:	a0e797d3          	flt.s	a5,fa5,fa4
2000007e:	e781                	bnez	a5,20000086 <compare+0x10>
20000080:	a0f71553          	flt.s	a0,fa4,fa5
20000084:	8082                	ret
20000086:	557d                	li	a0,-1
20000088:	8082                	ret

2000008a <compare_tokens>:
2000008a:	418c                	lw	a1,0(a1)
2000008c:	4108                	lw	a0,0(a0)
2000008e:	3750d06f          	j	2000dc02 <strcmp>

20000092 <malloc_run_state>:
20000092:	200147b7          	lui	a5,0x20014
20000096:	b5878793          	add	a5,a5,-1192 # 20013b58 <__clz_tab+0x110>
2000009a:	0007a803          	lw	a6,0(a5)
2000009e:	43d0                	lw	a2,4(a5)
200000a0:	4794                	lw	a3,8(a5)
200000a2:	47d8                	lw	a4,12(a5)
200000a4:	4b9c                	lw	a5,16(a5)
200000a6:	7159                	add	sp,sp,-112
200000a8:	d4a2                	sw	s0,104(sp)
200000aa:	d2a6                	sw	s1,100(sp)
200000ac:	842a                	mv	s0,a0
200000ae:	84ae                	mv	s1,a1
200000b0:	0028                	add	a0,sp,8
200000b2:	d686                	sw	ra,108(sp)
200000b4:	c442                	sw	a6,8(sp)
200000b6:	c632                	sw	a2,12(sp)
200000b8:	c836                	sw	a3,16(sp)
200000ba:	ca3a                	sw	a4,20(sp)
200000bc:	cc3e                	sw	a5,24(sp)
200000be:	d0ca                	sw	s2,96(sp)
200000c0:	cece                	sw	s3,92(sp)
200000c2:	ccd2                	sw	s4,88(sp)
200000c4:	cad6                	sw	s5,84(sp)
200000c6:	c8da                	sw	s6,80(sp)
200000c8:	c6de                	sw	s7,76(sp)
200000ca:	c4e2                	sw	s8,72(sp)
200000cc:	c2e6                	sw	s9,68(sp)
200000ce:	c0ea                	sw	s10,64(sp)
200000d0:	de6e                	sw	s11,60(sp)
200000d2:	5a2020ef          	jal	20002674 <print_s>
200000d6:	0004a903          	lw	s2,0(s1)
200000da:	0104a983          	lw	s3,16(s1)
200000de:	00c4ad83          	lw	s11,12(s1)
200000e2:	4591                	li	a1,4
200000e4:	033909b3          	mul	s3,s2,s3
200000e8:	854a                	mv	a0,s2
200000ea:	240090ef          	jal	2000932a <calloc>
200000ee:	c008                	sw	a0,0(s0)
200000f0:	4591                	li	a1,4
200000f2:	8a2a                	mv	s4,a0
200000f4:	854a                	mv	a0,s2
200000f6:	234090ef          	jal	2000932a <calloc>
200000fa:	c048                	sw	a0,4(s0)
200000fc:	4591                	li	a1,4
200000fe:	03b9c9b3          	div	s3,s3,s11
20000102:	8b2a                	mv	s6,a0
20000104:	854a                	mv	a0,s2
20000106:	224090ef          	jal	2000932a <calloc>
2000010a:	0044ab83          	lw	s7,4(s1)
2000010e:	4591                	li	a1,4
20000110:	c408                	sw	a0,8(s0)
20000112:	8aaa                	mv	s5,a0
20000114:	855e                	mv	a0,s7
20000116:	214090ef          	jal	2000932a <calloc>
2000011a:	c448                	sw	a0,12(s0)
2000011c:	4591                	li	a1,4
2000011e:	8caa                	mv	s9,a0
20000120:	855e                	mv	a0,s7
20000122:	208090ef          	jal	2000932a <calloc>
20000126:	c808                	sw	a0,16(s0)
20000128:	4591                	li	a1,4
2000012a:	8c2a                	mv	s8,a0
2000012c:	854a                	mv	a0,s2
2000012e:	1fc090ef          	jal	2000932a <calloc>
20000132:	0184ad03          	lw	s10,24(s1)
20000136:	0084a903          	lw	s2,8(s1)
2000013a:	4591                	li	a1,4
2000013c:	c848                	sw	a0,20(s0)
2000013e:	8baa                	mv	s7,a0
20000140:	032d0933          	mul	s2,s10,s2
20000144:	03390933          	mul	s2,s2,s3
20000148:	854a                	mv	a0,s2
2000014a:	1e0090ef          	jal	2000932a <calloc>
2000014e:	d408                	sw	a0,40(s0)
20000150:	4591                	li	a1,4
20000152:	89aa                	mv	s3,a0
20000154:	854a                	mv	a0,s2
20000156:	1d4090ef          	jal	2000932a <calloc>
2000015a:	892a                	mv	s2,a0
2000015c:	03ad8533          	mul	a0,s11,s10
20000160:	4591                	li	a1,4
20000162:	03242623          	sw	s2,44(s0)
20000166:	1c4090ef          	jal	2000932a <calloc>
2000016a:	87aa                	mv	a5,a0
2000016c:	48c8                	lw	a0,20(s1)
2000016e:	4591                	li	a1,4
20000170:	d01c                	sw	a5,32(s0)
20000172:	84be                	mv	s1,a5
20000174:	1b6090ef          	jal	2000932a <calloc>
20000178:	d048                	sw	a0,36(s0)
2000017a:	060a0263          	beqz	s4,200001de <malloc_run_state+0x14c>
2000017e:	060b0063          	beqz	s6,200001de <malloc_run_state+0x14c>
20000182:	040a8e63          	beqz	s5,200001de <malloc_run_state+0x14c>
20000186:	040c8c63          	beqz	s9,200001de <malloc_run_state+0x14c>
2000018a:	040c0a63          	beqz	s8,200001de <malloc_run_state+0x14c>
2000018e:	040b8863          	beqz	s7,200001de <malloc_run_state+0x14c>
20000192:	04098663          	beqz	s3,200001de <malloc_run_state+0x14c>
20000196:	04090463          	beqz	s2,200001de <malloc_run_state+0x14c>
2000019a:	c0b1                	beqz	s1,200001de <malloc_run_state+0x14c>
2000019c:	c129                	beqz	a0,200001de <malloc_run_state+0x14c>
2000019e:	200147b7          	lui	a5,0x20014
200001a2:	b6c78793          	add	a5,a5,-1172 # 20013b6c <__clz_tab+0x124>
200001a6:	438c                	lw	a1,0(a5)
200001a8:	43d0                	lw	a2,4(a5)
200001aa:	4794                	lw	a3,8(a5)
200001ac:	47d8                	lw	a4,12(a5)
200001ae:	4b9c                	lw	a5,16(a5)
200001b0:	0868                	add	a0,sp,28
200001b2:	ce2e                	sw	a1,28(sp)
200001b4:	d032                	sw	a2,32(sp)
200001b6:	d236                	sw	a3,36(sp)
200001b8:	d43a                	sw	a4,40(sp)
200001ba:	d63e                	sw	a5,44(sp)
200001bc:	4b8020ef          	jal	20002674 <print_s>
200001c0:	50b6                	lw	ra,108(sp)
200001c2:	5426                	lw	s0,104(sp)
200001c4:	5496                	lw	s1,100(sp)
200001c6:	5906                	lw	s2,96(sp)
200001c8:	49f6                	lw	s3,92(sp)
200001ca:	4a66                	lw	s4,88(sp)
200001cc:	4ad6                	lw	s5,84(sp)
200001ce:	4b46                	lw	s6,80(sp)
200001d0:	4bb6                	lw	s7,76(sp)
200001d2:	4c26                	lw	s8,72(sp)
200001d4:	4c96                	lw	s9,68(sp)
200001d6:	4d06                	lw	s10,64(sp)
200001d8:	5df2                	lw	s11,60(sp)
200001da:	6165                	add	sp,sp,112
200001dc:	8082                	ret
200001de:	200147b7          	lui	a5,0x20014
200001e2:	3647a683          	lw	a3,868(a5) # 20014364 <stderr>
200001e6:	20014537          	lui	a0,0x20014
200001ea:	463d                	li	a2,15
200001ec:	4585                	li	a1,1
200001ee:	b4850513          	add	a0,a0,-1208 # 20013b48 <__clz_tab+0x100>
200001f2:	0f00b0ef          	jal	2000b2e2 <fwrite>
200001f6:	4505                	li	a0,1
200001f8:	114090ef          	jal	2000930c <exit>

200001fc <free_run_state>:
200001fc:	1141                	add	sp,sp,-16
200001fe:	c422                	sw	s0,8(sp)
20000200:	842a                	mv	s0,a0
20000202:	4108                	lw	a0,0(a0)
20000204:	c606                	sw	ra,12(sp)
20000206:	1d6090ef          	jal	200093dc <free>
2000020a:	4048                	lw	a0,4(s0)
2000020c:	1d0090ef          	jal	200093dc <free>
20000210:	4408                	lw	a0,8(s0)
20000212:	1ca090ef          	jal	200093dc <free>
20000216:	4448                	lw	a0,12(s0)
20000218:	1c4090ef          	jal	200093dc <free>
2000021c:	4808                	lw	a0,16(s0)
2000021e:	1be090ef          	jal	200093dc <free>
20000222:	4848                	lw	a0,20(s0)
20000224:	1b8090ef          	jal	200093dc <free>
20000228:	5008                	lw	a0,32(s0)
2000022a:	1b2090ef          	jal	200093dc <free>
2000022e:	5048                	lw	a0,36(s0)
20000230:	1ac090ef          	jal	200093dc <free>
20000234:	5408                	lw	a0,40(s0)
20000236:	1a6090ef          	jal	200093dc <free>
2000023a:	5448                	lw	a0,44(s0)
2000023c:	4422                	lw	s0,8(sp)
2000023e:	40b2                	lw	ra,12(sp)
20000240:	0141                	add	sp,sp,16
20000242:	19a0906f          	j	200093dc <free>

20000246 <memory_map_weights>:
20000246:	711d                	add	sp,sp,-96
20000248:	cca2                	sw	s0,88(sp)
2000024a:	20014437          	lui	s0,0x20014
2000024e:	94c40413          	add	s0,s0,-1716 # 2001394c <__mremap+0xa0>
20000252:	00042e03          	lw	t3,0(s0)
20000256:	00442303          	lw	t1,4(s0)
2000025a:	00842883          	lw	a7,8(s0)
2000025e:	00c42803          	lw	a6,12(s0)
20000262:	4818                	lw	a4,16(s0)
20000264:	01445783          	lhu	a5,20(s0)
20000268:	caa6                	sw	s1,84(sp)
2000026a:	84aa                	mv	s1,a0
2000026c:	850a                	mv	a0,sp
2000026e:	c8ca                	sw	s2,80(sp)
20000270:	c6ce                	sw	s3,76(sp)
20000272:	8932                	mv	s2,a2
20000274:	89ae                	mv	s3,a1
20000276:	c4d2                	sw	s4,72(sp)
20000278:	c072                	sw	t3,0(sp)
2000027a:	8a36                	mv	s4,a3
2000027c:	c21a                	sw	t1,4(sp)
2000027e:	c446                	sw	a7,8(sp)
20000280:	c642                	sw	a6,12(sp)
20000282:	c83a                	sw	a4,16(sp)
20000284:	00f11a23          	sh	a5,20(sp)
20000288:	ce86                	sw	ra,92(sp)
2000028a:	00011b23          	sh	zero,22(sp)
2000028e:	00011c23          	sh	zero,24(sp)
20000292:	00011d23          	sh	zero,26(sp)
20000296:	00011e23          	sh	zero,28(sp)
2000029a:	3da020ef          	jal	20002674 <print_s>
2000029e:	0009a683          	lw	a3,0(s3)
200002a2:	00c9a603          	lw	a2,12(s3)
200002a6:	0089a783          	lw	a5,8(s3)
200002aa:	0109a503          	lw	a0,16(s3)
200002ae:	02c6c8b3          	div	a7,a3,a2
200002b2:	0149a803          	lw	a6,20(s3)
200002b6:	0049ae03          	lw	t3,4(s3)
200002ba:	0189a303          	lw	t1,24(s3)
200002be:	0124a023          	sw	s2,0(s1)
200002c2:	02d787b3          	mul	a5,a5,a3
200002c6:	03160633          	mul	a2,a2,a7
200002ca:	00279713          	sll	a4,a5,0x2
200002ce:	02a885b3          	mul	a1,a7,a0
200002d2:	03068833          	mul	a6,a3,a6
200002d6:	02c70633          	mul	a2,a4,a2
200002da:	080a                	sll	a6,a6,0x2
200002dc:	984a                	add	a6,a6,s2
200002de:	00e80533          	add	a0,a6,a4
200002e2:	c4c8                	sw	a0,12(s1)
200002e4:	0104a223          	sw	a6,4(s1)
200002e8:	02b705b3          	mul	a1,a4,a1
200002ec:	9532                	add	a0,a0,a2
200002ee:	c888                	sw	a0,16(s1)
200002f0:	03c787b3          	mul	a5,a5,t3
200002f4:	952e                	add	a0,a0,a1
200002f6:	95aa                	add	a1,a1,a0
200002f8:	962e                	add	a2,a2,a1
200002fa:	9732                	add	a4,a4,a2
200002fc:	ccd8                	sw	a4,28(s1)
200002fe:	c490                	sw	a2,8(s1)
20000300:	c8c8                	sw	a0,20(s1)
20000302:	cc8c                	sw	a1,24(s1)
20000304:	078a                	sll	a5,a5,0x2
20000306:	973e                	add	a4,a4,a5
20000308:	00f70633          	add	a2,a4,a5
2000030c:	97b2                	add	a5,a5,a2
2000030e:	d098                	sw	a4,32(s1)
20000310:	d0d0                	sw	a2,36(s1)
20000312:	d49c                	sw	a5,40(s1)
20000314:	000a1c63          	bnez	s4,2000032c <memory_map_weights+0xe6>
20000318:	03130333          	mul	t1,t1,a7
2000031c:	01f35913          	srl	s2,t1,0x1f
20000320:	991a                	add	s2,s2,t1
20000322:	ffe97913          	and	s2,s2,-2
20000326:	9936                	add	s2,s2,a3
20000328:	090a                	sll	s2,s2,0x2
2000032a:	993e                	add	s2,s2,a5
2000032c:	02042883          	lw	a7,32(s0)
20000330:	02442803          	lw	a6,36(s0)
20000334:	540c                	lw	a1,40(s0)
20000336:	5450                	lw	a2,44(s0)
20000338:	5814                	lw	a3,48(s0)
2000033a:	03445703          	lhu	a4,52(s0)
2000033e:	03644783          	lbu	a5,54(s0)
20000342:	0324a623          	sw	s2,44(s1)
20000346:	1008                	add	a0,sp,32
20000348:	d046                	sw	a7,32(sp)
2000034a:	d242                	sw	a6,36(sp)
2000034c:	d42e                	sw	a1,40(sp)
2000034e:	d632                	sw	a2,44(sp)
20000350:	d836                	sw	a3,48(sp)
20000352:	02e11a23          	sh	a4,52(sp)
20000356:	02f10b23          	sb	a5,54(sp)
2000035a:	02010ba3          	sb	zero,55(sp)
2000035e:	02010c23          	sb	zero,56(sp)
20000362:	02010ca3          	sb	zero,57(sp)
20000366:	02010d23          	sb	zero,58(sp)
2000036a:	02010da3          	sb	zero,59(sp)
2000036e:	02010e23          	sb	zero,60(sp)
20000372:	02010ea3          	sb	zero,61(sp)
20000376:	2fe020ef          	jal	20002674 <print_s>
2000037a:	40f6                	lw	ra,92(sp)
2000037c:	4466                	lw	s0,88(sp)
2000037e:	44d6                	lw	s1,84(sp)
20000380:	4946                	lw	s2,80(sp)
20000382:	49b6                	lw	s3,76(sp)
20000384:	4a26                	lw	s4,72(sp)
20000386:	6125                	add	sp,sp,96
20000388:	8082                	ret

2000038a <read_checkpoint>:
2000038a:	711d                	add	sp,sp,-96
2000038c:	cca2                	sw	s0,88(sp)
2000038e:	20014437          	lui	s0,0x20014
20000392:	94c40413          	add	s0,s0,-1716 # 2001394c <__mremap+0xa0>
20000396:	04042e83          	lw	t4,64(s0)
2000039a:	04442e03          	lw	t3,68(s0)
2000039e:	04842303          	lw	t1,72(s0)
200003a2:	04c42883          	lw	a7,76(s0)
200003a6:	05045803          	lhu	a6,80(s0)
200003aa:	05244683          	lbu	a3,82(s0)
200003ae:	0048                	add	a0,sp,4
200003b0:	ce86                	sw	ra,92(sp)
200003b2:	caa6                	sw	s1,84(sp)
200003b4:	c8ca                	sw	s2,80(sp)
200003b6:	c6ce                	sw	s3,76(sp)
200003b8:	c4d2                	sw	s4,72(sp)
200003ba:	c2d6                	sw	s5,68(sp)
200003bc:	c0da                	sw	s6,64(sp)
200003be:	84ae                	mv	s1,a1
200003c0:	893a                	mv	s2,a4
200003c2:	c276                	sw	t4,4(sp)
200003c4:	c472                	sw	t3,8(sp)
200003c6:	c61a                	sw	t1,12(sp)
200003c8:	c846                	sw	a7,16(sp)
200003ca:	89be                	mv	s3,a5
200003cc:	8a32                	mv	s4,a2
200003ce:	01011a23          	sh	a6,20(sp)
200003d2:	00d10b23          	sb	a3,22(sp)
200003d6:	2eb6eb37          	lui	s6,0x2eb6e
200003da:	00010ba3          	sb	zero,23(sp)
200003de:	296020ef          	jal	20002674 <print_s>
200003e2:	518b0593          	add	a1,s6,1304 # 2eb6e518 <checkpoint_str>
200003e6:	8526                	mv	a0,s1
200003e8:	4671                	li	a2,28
200003ea:	028020ef          	jal	20002412 <convert_n_hex2mem>
200003ee:	0144aa83          	lw	s5,20(s1)
200003f2:	03a007b7          	lui	a5,0x3a00
200003f6:	a9c78793          	add	a5,a5,-1380 # 39ffa9c <_start-0x1c600564>
200003fa:	41fad693          	sra	a3,s5,0x1f
200003fe:	0156c733          	xor	a4,a3,s5
20000402:	8f15                	sub	a4,a4,a3
20000404:	c8d8                	sw	a4,20(s1)
20000406:	05442803          	lw	a6,84(s0)
2000040a:	06445703          	lhu	a4,100(s0)
2000040e:	5034                	lw	a3,96(s0)
20000410:	4c2c                	lw	a1,88(s0)
20000412:	4c70                	lw	a2,92(s0)
20000414:	00f9a023          	sw	a5,0(s3)
20000418:	200207b7          	lui	a5,0x20020
2000041c:	44078793          	add	a5,a5,1088 # 20020440 <checkpoint_data>
20000420:	00f92023          	sw	a5,0(s2)
20000424:	0828                	add	a0,sp,24
20000426:	cc42                	sw	a6,24(sp)
20000428:	02e11423          	sh	a4,40(sp)
2000042c:	d236                	sw	a3,36(sp)
2000042e:	ce2e                	sw	a1,28(sp)
20000430:	d032                	sw	a2,32(sp)
20000432:	02011523          	sh	zero,42(sp)
20000436:	23e020ef          	jal	20002674 <print_s>
2000043a:	0009a603          	lw	a2,0(s3)
2000043e:	00092503          	lw	a0,0(s2)
20000442:	518b0593          	add	a1,s6,1304
20000446:	7cd010ef          	jal	20002412 <convert_n_hex2mem>
2000044a:	00092603          	lw	a2,0(s2)
2000044e:	015026b3          	sgtz	a3,s5
20000452:	85a6                	mv	a1,s1
20000454:	8552                	mv	a0,s4
20000456:	0671                	add	a2,a2,28
20000458:	33fd                	jal	20000246 <memory_map_weights>
2000045a:	200147b7          	lui	a5,0x20014
2000045e:	b8478793          	add	a5,a5,-1148 # 20013b84 <__clz_tab+0x13c>
20000462:	438c                	lw	a1,0(a5)
20000464:	43d0                	lw	a2,4(a5)
20000466:	4794                	lw	a3,8(a5)
20000468:	47d8                	lw	a4,12(a5)
2000046a:	4b9c                	lw	a5,16(a5)
2000046c:	1068                	add	a0,sp,44
2000046e:	d62e                	sw	a1,44(sp)
20000470:	d832                	sw	a2,48(sp)
20000472:	da36                	sw	a3,52(sp)
20000474:	dc3a                	sw	a4,56(sp)
20000476:	de3e                	sw	a5,60(sp)
20000478:	1fc020ef          	jal	20002674 <print_s>
2000047c:	40f6                	lw	ra,92(sp)
2000047e:	4466                	lw	s0,88(sp)
20000480:	44d6                	lw	s1,84(sp)
20000482:	4946                	lw	s2,80(sp)
20000484:	49b6                	lw	s3,76(sp)
20000486:	4a26                	lw	s4,72(sp)
20000488:	4a96                	lw	s5,68(sp)
2000048a:	4b06                	lw	s6,64(sp)
2000048c:	6125                	add	sp,sp,96
2000048e:	8082                	ret

20000490 <build_transformer>:
20000490:	200147b7          	lui	a5,0x20014
20000494:	b9878793          	add	a5,a5,-1128 # 20013b98 <__clz_tab+0x150>
20000498:	0007a803          	lw	a6,0(a5)
2000049c:	43d0                	lw	a2,4(a5)
2000049e:	4794                	lw	a3,8(a5)
200004a0:	47d8                	lw	a4,12(a5)
200004a2:	4b9c                	lw	a5,16(a5)
200004a4:	711d                	add	sp,sp,-96
200004a6:	cca2                	sw	s0,88(sp)
200004a8:	842a                	mv	s0,a0
200004aa:	0028                	add	a0,sp,8
200004ac:	ce86                	sw	ra,92(sp)
200004ae:	caa6                	sw	s1,84(sp)
200004b0:	c442                	sw	a6,8(sp)
200004b2:	84ae                	mv	s1,a1
200004b4:	c632                	sw	a2,12(sp)
200004b6:	c836                	sw	a3,16(sp)
200004b8:	ca3a                	sw	a4,20(sp)
200004ba:	cc3e                	sw	a5,24(sp)
200004bc:	1b8020ef          	jal	20002674 <print_s>
200004c0:	08440793          	add	a5,s0,132
200004c4:	08040713          	add	a4,s0,128
200004c8:	07c40693          	add	a3,s0,124
200004cc:	01c40613          	add	a2,s0,28
200004d0:	85a2                	mv	a1,s0
200004d2:	8526                	mv	a0,s1
200004d4:	3d5d                	jal	2000038a <read_checkpoint>
200004d6:	85a2                	mv	a1,s0
200004d8:	04c40513          	add	a0,s0,76
200004dc:	3e5d                	jal	20000092 <malloc_run_state>
200004de:	200147b7          	lui	a5,0x20014
200004e2:	94c78793          	add	a5,a5,-1716 # 2001394c <__mremap+0xa0>
200004e6:	0687a803          	lw	a6,104(a5)
200004ea:	57ec                	lw	a1,108(a5)
200004ec:	5bb0                	lw	a2,112(a5)
200004ee:	5bf4                	lw	a3,116(a5)
200004f0:	5fb8                	lw	a4,120(a5)
200004f2:	07c7d783          	lhu	a5,124(a5)
200004f6:	0868                	add	a0,sp,28
200004f8:	ce42                	sw	a6,28(sp)
200004fa:	d02e                	sw	a1,32(sp)
200004fc:	d232                	sw	a2,36(sp)
200004fe:	d436                	sw	a3,40(sp)
20000500:	d63a                	sw	a4,44(sp)
20000502:	02f11823          	sh	a5,48(sp)
20000506:	02011923          	sh	zero,50(sp)
2000050a:	02011a23          	sh	zero,52(sp)
2000050e:	02011b23          	sh	zero,54(sp)
20000512:	02011c23          	sh	zero,56(sp)
20000516:	02011d23          	sh	zero,58(sp)
2000051a:	02011e23          	sh	zero,60(sp)
2000051e:	02011f23          	sh	zero,62(sp)
20000522:	04011023          	sh	zero,64(sp)
20000526:	04011123          	sh	zero,66(sp)
2000052a:	04011223          	sh	zero,68(sp)
2000052e:	04011323          	sh	zero,70(sp)
20000532:	04011423          	sh	zero,72(sp)
20000536:	04011523          	sh	zero,74(sp)
2000053a:	04011623          	sh	zero,76(sp)
2000053e:	136020ef          	jal	20002674 <print_s>
20000542:	40f6                	lw	ra,92(sp)
20000544:	4466                	lw	s0,88(sp)
20000546:	44d6                	lw	s1,84(sp)
20000548:	6125                	add	sp,sp,96
2000054a:	8082                	ret

2000054c <free_transformer>:
2000054c:	1141                	add	sp,sp,-16
2000054e:	c422                	sw	s0,8(sp)
20000550:	842a                	mv	s0,a0
20000552:	08052503          	lw	a0,128(a0)
20000556:	c606                	sw	ra,12(sp)
20000558:	57fd                	li	a5,-1
2000055a:	00f50663          	beq	a0,a5,20000566 <free_transformer+0x1a>
2000055e:	08442583          	lw	a1,132(s0)
20000562:	2750a0ef          	jal	2000afd6 <__munmap>
20000566:	5c68                	lw	a0,124(s0)
20000568:	57fd                	li	a5,-1
2000056a:	00f50463          	beq	a0,a5,20000572 <free_transformer+0x26>
2000056e:	06f0d0ef          	jal	2000dddc <close>
20000572:	4468                	lw	a0,76(s0)
20000574:	669080ef          	jal	200093dc <free>
20000578:	4828                	lw	a0,80(s0)
2000057a:	663080ef          	jal	200093dc <free>
2000057e:	4868                	lw	a0,84(s0)
20000580:	65d080ef          	jal	200093dc <free>
20000584:	4c28                	lw	a0,88(s0)
20000586:	657080ef          	jal	200093dc <free>
2000058a:	4c68                	lw	a0,92(s0)
2000058c:	651080ef          	jal	200093dc <free>
20000590:	5028                	lw	a0,96(s0)
20000592:	64b080ef          	jal	200093dc <free>
20000596:	5468                	lw	a0,108(s0)
20000598:	645080ef          	jal	200093dc <free>
2000059c:	5828                	lw	a0,112(s0)
2000059e:	63f080ef          	jal	200093dc <free>
200005a2:	5868                	lw	a0,116(s0)
200005a4:	639080ef          	jal	200093dc <free>
200005a8:	5c28                	lw	a0,120(s0)
200005aa:	4422                	lw	s0,8(sp)
200005ac:	40b2                	lw	ra,12(sp)
200005ae:	0141                	add	sp,sp,16
200005b0:	62d0806f          	j	200093dc <free>

200005b4 <rmsnorm>:
200005b4:	06d05d63          	blez	a3,2000062e <rmsnorm+0x7a>
200005b8:	f0000553          	fmv.w.x	fa0,zero
200005bc:	d006f753          	fcvt.s.w	fa4,a3
200005c0:	1101                	add	sp,sp,-32
200005c2:	068a                	sll	a3,a3,0x2
200005c4:	ce06                	sw	ra,28(sp)
200005c6:	00d58733          	add	a4,a1,a3
200005ca:	87ae                	mv	a5,a1
200005cc:	639c                	flw	fa5,0(a5)
200005ce:	0791                	add	a5,a5,4
200005d0:	50f7f543          	fmadd.s	fa0,fa5,fa5,fa0
200005d4:	fef71ce3          	bne	a4,a5,200005cc <rmsnorm+0x18>
200005d8:	18e57553          	fdiv.s	fa0,fa0,fa4
200005dc:	200147b7          	lui	a5,0x20014
200005e0:	00c7a787          	flw	fa5,12(a5) # 2001400c <__clz_tab+0x5c4>
200005e4:	00f57553          	fadd.s	fa0,fa0,fa5
200005e8:	00102773          	frflags	a4
200005ec:	f00007d3          	fmv.w.x	fa5,zero
200005f0:	a0f517d3          	flt.s	a5,fa0,fa5
200005f4:	00171073          	fsflags	a4
200005f8:	ef85                	bnez	a5,20000630 <rmsnorm+0x7c>
200005fa:	58057553          	fsqrt.s	fa0,fa0
200005fe:	200147b7          	lui	a5,0x20014
20000602:	0107a687          	flw	fa3,16(a5) # 20014010 <__clz_tab+0x5c8>
20000606:	00d607b3          	add	a5,a2,a3
2000060a:	18a6f6d3          	fdiv.s	fa3,fa3,fa0
2000060e:	619c                	flw	fa5,0(a1)
20000610:	6218                	flw	fa4,0(a2)
20000612:	0511                	add	a0,a0,4
20000614:	10f6f7d3          	fmul.s	fa5,fa3,fa5
20000618:	0611                	add	a2,a2,4
2000061a:	0591                	add	a1,a1,4
2000061c:	10e7f7d3          	fmul.s	fa5,fa5,fa4
20000620:	fef52e27          	fsw	fa5,-4(a0)
20000624:	fec795e3          	bne	a5,a2,2000060e <rmsnorm+0x5a>
20000628:	40f2                	lw	ra,28(sp)
2000062a:	6105                	add	sp,sp,32
2000062c:	8082                	ret
2000062e:	8082                	ret
20000630:	c632                	sw	a2,12(sp)
20000632:	c42a                	sw	a0,8(sp)
20000634:	c22e                	sw	a1,4(sp)
20000636:	c036                	sw	a3,0(sp)
20000638:	76e0a0ef          	jal	2000ada6 <sqrtf>
2000063c:	4632                	lw	a2,12(sp)
2000063e:	4522                	lw	a0,8(sp)
20000640:	4592                	lw	a1,4(sp)
20000642:	4682                	lw	a3,0(sp)
20000644:	bf6d                	j	200005fe <rmsnorm+0x4a>

20000646 <softmax>:
20000646:	1101                	add	sp,sp,-32
20000648:	cc22                	sw	s0,24(sp)
2000064a:	a026                	fsd	fs1,0(sp)
2000064c:	ce06                	sw	ra,28(sp)
2000064e:	4785                	li	a5,1
20000650:	6104                	flw	fs1,0(a0)
20000652:	842a                	mv	s0,a0
20000654:	06b7d463          	bge	a5,a1,200006bc <softmax+0x76>
20000658:	058a                	sll	a1,a1,0x2
2000065a:	ca26                	sw	s1,20(sp)
2000065c:	c84a                	sw	s2,16(sp)
2000065e:	a422                	fsd	fs0,8(sp)
20000660:	00450793          	add	a5,a0,4
20000664:	00b506b3          	add	a3,a0,a1
20000668:	639c                	flw	fa5,0(a5)
2000066a:	0791                	add	a5,a5,4
2000066c:	a0f49753          	flt.s	a4,fs1,fa5
20000670:	c319                	beqz	a4,20000676 <softmax+0x30>
20000672:	20f784d3          	fmv.s	fs1,fa5
20000676:	fed799e3          	bne	a5,a3,20000668 <softmax+0x22>
2000067a:	f0000453          	fmv.w.x	fs0,zero
2000067e:	00b40933          	add	s2,s0,a1
20000682:	84a2                	mv	s1,s0
20000684:	6088                	flw	fa0,0(s1)
20000686:	0491                	add	s1,s1,4
20000688:	08957553          	fsub.s	fa0,fa0,fs1
2000068c:	3860a0ef          	jal	2000aa12 <expf>
20000690:	fea4ae27          	fsw	fa0,-4(s1)
20000694:	00a47453          	fadd.s	fs0,fs0,fa0
20000698:	ff2496e3          	bne	s1,s2,20000684 <softmax+0x3e>
2000069c:	601c                	flw	fa5,0(s0)
2000069e:	0411                	add	s0,s0,4
200006a0:	1887f7d3          	fdiv.s	fa5,fa5,fs0
200006a4:	fef42e27          	fsw	fa5,-4(s0)
200006a8:	fe891ae3          	bne	s2,s0,2000069c <softmax+0x56>
200006ac:	44d2                	lw	s1,20(sp)
200006ae:	4942                	lw	s2,16(sp)
200006b0:	2422                	fld	fs0,8(sp)
200006b2:	40f2                	lw	ra,28(sp)
200006b4:	4462                	lw	s0,24(sp)
200006b6:	2482                	fld	fs1,0(sp)
200006b8:	6105                	add	sp,sp,32
200006ba:	8082                	ret
200006bc:	fef59be3          	bne	a1,a5,200006b2 <softmax+0x6c>
200006c0:	ca26                	sw	s1,20(sp)
200006c2:	c84a                	sw	s2,16(sp)
200006c4:	a422                	fsd	fs0,8(sp)
200006c6:	4591                	li	a1,4
200006c8:	bf4d                	j	2000067a <softmax+0x34>

200006ca <matmul>:
200006ca:	02e05e63          	blez	a4,20000706 <matmul+0x3c>
200006ce:	070a                	sll	a4,a4,0x2
200006d0:	00269813          	sll	a6,a3,0x2
200006d4:	00e50333          	add	t1,a0,a4
200006d8:	982e                	add	a6,a6,a1
200006da:	4881                	li	a7,0
200006dc:	00289713          	sll	a4,a7,0x2
200006e0:	f00007d3          	fmv.w.x	fa5,zero
200006e4:	9732                	add	a4,a4,a2
200006e6:	87ae                	mv	a5,a1
200006e8:	00d05a63          	blez	a3,200006fc <matmul+0x32>
200006ec:	6314                	flw	fa3,0(a4)
200006ee:	6398                	flw	fa4,0(a5)
200006f0:	0791                	add	a5,a5,4
200006f2:	0711                	add	a4,a4,4
200006f4:	78e6f7c3          	fmadd.s	fa5,fa3,fa4,fa5
200006f8:	fef81ae3          	bne	a6,a5,200006ec <matmul+0x22>
200006fc:	e11c                	fsw	fa5,0(a0)
200006fe:	0511                	add	a0,a0,4
20000700:	98b6                	add	a7,a7,a3
20000702:	fca31de3          	bne	t1,a0,200006dc <matmul+0x12>
20000706:	8082                	ret

20000708 <forward>:
20000708:	7111                	add	sp,sp,-256
2000070a:	c7ee                	sw	s11,204(sp)
2000070c:	00052d83          	lw	s11,0(a0)
20000710:	00c52803          	lw	a6,12(a0)
20000714:	4918                	lw	a4,16(a0)
20000716:	02bd87b3          	mul	a5,s11,a1
2000071a:	4d4c                	lw	a1,28(a0)
2000071c:	86b2                	mv	a3,a2
2000071e:	d5d2                	sw	s4,232(sp)
20000720:	c436                	sw	a3,8(sp)
20000722:	8a36                	mv	s4,a3
20000724:	d7ce                	sw	s3,236(sp)
20000726:	d3d6                	sw	s5,228(sp)
20000728:	89aa                	mv	s3,a0
2000072a:	04c52a83          	lw	s5,76(a0)
2000072e:	078a                	sll	a5,a5,0x2
20000730:	95be                	add	a1,a1,a5
20000732:	02e847b3          	div	a5,a6,a4
20000736:	cfde                	sw	s7,220(sp)
20000738:	0049ab83          	lw	s7,4(s3)
2000073c:	dda2                	sw	s0,248(sp)
2000073e:	002d9413          	sll	s0,s11,0x2
20000742:	8556                	mv	a0,s5
20000744:	8622                	mv	a2,s0
20000746:	dba6                	sw	s1,244(sp)
20000748:	d9ca                	sw	s2,240(sp)
2000074a:	df86                	sw	ra,252(sp)
2000074c:	a956                	fsd	fs5,144(sp)
2000074e:	d056                	sw	s5,32(sp)
20000750:	dc5e                	sw	s7,56(sp)
20000752:	03b706b3          	mul	a3,a4,s11
20000756:	ca3e                	sw	a5,20(sp)
20000758:	0306c933          	div	s2,a3,a6
2000075c:	030dc4b3          	div	s1,s11,a6
20000760:	04c0d0ef          	jal	2000d7ac <memcpy>
20000764:	0089a783          	lw	a5,8(s3)
20000768:	060787e3          	beqz	a5,20000fd6 <forward+0x8ce>
2000076c:	200147b7          	lui	a5,0x20014
20000770:	ad52                	fsd	fs4,152(sp)
20000772:	00c7aa07          	flw	fs4,12(a5) # 2001400c <__clz_tab+0x5c4>
20000776:	200147b7          	lui	a5,0x20014
2000077a:	b54a                	fsd	fs2,168(sp)
2000077c:	0107a907          	flw	fs2,16(a5) # 20014010 <__clz_tab+0x5c8>
20000780:	200147b7          	lui	a5,0x20014
20000784:	b14e                	fsd	fs3,160(sp)
20000786:	0147a987          	flw	fs3,20(a5) # 20014014 <__clz_tab+0x5cc>
2000078a:	001a0793          	add	a5,s4,1
2000078e:	c83e                	sw	a5,16(sp)
20000790:	002a1793          	sll	a5,s4,0x2
20000794:	ce3e                	sw	a5,28(sp)
20000796:	002b9793          	sll	a5,s7,0x2
2000079a:	d83e                	sw	a5,48(sp)
2000079c:	d00dfad3          	fcvt.s.w	fs5,s11
200007a0:	c9ea                	sw	s10,208(sp)
200007a2:	b8e6                	fsd	fs9,112(sp)
200007a4:	01540d33          	add	s10,s0,s5
200007a8:	215a8cd3          	fmv.s	fs9,fs5
200007ac:	d1da                	sw	s6,224(sp)
200007ae:	cde2                	sw	s8,216(sp)
200007b0:	00249b13          	sll	s6,s1,0x2
200007b4:	cbe6                	sw	s9,212(sp)
200007b6:	bd22                	fsd	fs0,184(sp)
200007b8:	b926                	fsd	fs1,176(sp)
200007ba:	a55a                	fsd	fs6,136(sp)
200007bc:	a15e                	fsd	fs7,128(sp)
200007be:	034907b3          	mul	a5,s2,s4
200007c2:	bce2                	fsd	fs8,120(sp)
200007c4:	8a22                	mv	s4,s0
200007c6:	d202                	sw	zero,36(sp)
200007c8:	8426                	mv	s0,s1
200007ca:	de02                	sw	zero,60(sp)
200007cc:	84ce                	mv	s1,s3
200007ce:	d402                	sw	zero,40(sp)
200007d0:	d602                	sw	zero,44(sp)
200007d2:	da02                	sw	zero,52(sp)
200007d4:	c8be                	sw	a5,80(sp)
200007d6:	037d87b3          	mul	a5,s11,s7
200007da:	c082                	sw	zero,64(sp)
200007dc:	89ca                	mv	s3,s2
200007de:	cebe                	sw	a5,92(sp)
200007e0:	032d87b3          	mul	a5,s11,s2
200007e4:	ccbe                	sw	a5,88(sp)
200007e6:	03bd87b3          	mul	a5,s11,s11
200007ea:	cabe                	sw	a5,84(sp)
200007ec:	87ea                	mv	a5,s10
200007ee:	8d6e                	mv	s10,s11
200007f0:	8dbe                	mv	s11,a5
200007f2:	0504ac83          	lw	s9,80(s1)
200007f6:	0204a903          	lw	s2,32(s1)
200007fa:	05a05f63          	blez	s10,20000858 <forward+0x150>
200007fe:	f00007d3          	fmv.w.x	fa5,zero
20000802:	5782                	lw	a5,32(sp)
20000804:	6398                	flw	fa4,0(a5)
20000806:	0791                	add	a5,a5,4
20000808:	78e777c3          	fmadd.s	fa5,fa4,fa4,fa5
2000080c:	fefd9ce3          	bne	s11,a5,20000804 <forward+0xfc>
20000810:	1997f7d3          	fdiv.s	fa5,fa5,fs9
20000814:	0147f553          	fadd.s	fa0,fa5,fs4
20000818:	00102773          	frflags	a4
2000081c:	f00007d3          	fmv.w.x	fa5,zero
20000820:	a0f517d3          	flt.s	a5,fa0,fa5
20000824:	00171073          	fsflags	a4
20000828:	7a079e63          	bnez	a5,20000fe4 <forward+0x8dc>
2000082c:	58057753          	fsqrt.s	fa4,fa0
20000830:	57a2                	lw	a5,40(sp)
20000832:	8666                	mv	a2,s9
20000834:	00f90733          	add	a4,s2,a5
20000838:	5782                	lw	a5,32(sp)
2000083a:	18e97753          	fdiv.s	fa4,fs2,fa4
2000083e:	639c                	flw	fa5,0(a5)
20000840:	6314                	flw	fa3,0(a4)
20000842:	0611                	add	a2,a2,4
20000844:	10f777d3          	fmul.s	fa5,fa4,fa5
20000848:	0791                	add	a5,a5,4
2000084a:	0711                	add	a4,a4,4
2000084c:	10d7f7d3          	fmul.s	fa5,fa5,fa3
20000850:	fef62e27          	fsw	fa5,-4(a2)
20000854:	fefd95e3          	bne	s11,a5,2000083e <forward+0x136>
20000858:	4c9c                	lw	a5,24(s1)
2000085a:	5752                	lw	a4,52(sp)
2000085c:	46c6                	lw	a3,80(sp)
2000085e:	02f98c33          	mul	s8,s3,a5
20000862:	58f0                	lw	a2,116(s1)
20000864:	0784ae03          	lw	t3,120(s1)
20000868:	0604ab83          	lw	s7,96(s1)
2000086c:	0284ae83          	lw	t4,40(s1)
20000870:	02c4af03          	lw	t5,44(s1)
20000874:	02ec0733          	mul	a4,s8,a4
20000878:	c63a                	sw	a4,12(sp)
2000087a:	9736                	add	a4,a4,a3
2000087c:	070a                	sll	a4,a4,0x2
2000087e:	963a                	add	a2,a2,a4
20000880:	9e3a                	add	t3,t3,a4
20000882:	d0f0                	sw	a2,100(s1)
20000884:	07c4a423          	sw	t3,104(s1)
20000888:	73a05563          	blez	s10,20000fb2 <forward+0x8aa>
2000088c:	5712                	lw	a4,36(sp)
2000088e:	855e                	mv	a0,s7
20000890:	017a0fb3          	add	t6,s4,s7
20000894:	070a                	sll	a4,a4,0x2
20000896:	9eba                	add	t4,t4,a4
20000898:	019a0ab3          	add	s5,s4,s9
2000089c:	f00007d3          	fmv.w.x	fa5,zero
200008a0:	8766                	mv	a4,s9
200008a2:	86f6                	mv	a3,t4
200008a4:	6294                	flw	fa3,0(a3)
200008a6:	6318                	flw	fa4,0(a4)
200008a8:	0711                	add	a4,a4,4
200008aa:	0691                	add	a3,a3,4
200008ac:	78e6f7c3          	fmadd.s	fa5,fa3,fa4,fa5
200008b0:	feea9ae3          	bne	s5,a4,200008a4 <forward+0x19c>
200008b4:	e11c                	fsw	fa5,0(a0)
200008b6:	0511                	add	a0,a0,4
200008b8:	9ed2                	add	t4,t4,s4
200008ba:	feaf91e3          	bne	t6,a0,2000089c <forward+0x194>
200008be:	6f305f63          	blez	s3,20000fbc <forward+0x8b4>
200008c2:	5772                	lw	a4,60(sp)
200008c4:	8eb2                	mv	t4,a2
200008c6:	4501                	li	a0,0
200008c8:	00271f93          	sll	t6,a4,0x2
200008cc:	9f7e                	add	t5,t5,t6
200008ce:	f00007d3          	fmv.w.x	fa5,zero
200008d2:	8766                	mv	a4,s9
200008d4:	86fa                	mv	a3,t5
200008d6:	01a05a63          	blez	s10,200008ea <forward+0x1e2>
200008da:	6294                	flw	fa3,0(a3)
200008dc:	6318                	flw	fa4,0(a4)
200008de:	0711                	add	a4,a4,4
200008e0:	0691                	add	a3,a3,4
200008e2:	78e6f7c3          	fmadd.s	fa5,fa3,fa4,fa5
200008e6:	feea9ae3          	bne	s5,a4,200008da <forward+0x1d2>
200008ea:	00fea027          	fsw	fa5,0(t4)
200008ee:	0505                	add	a0,a0,1
200008f0:	0e91                	add	t4,t4,4
200008f2:	9f52                	add	t5,t5,s4
200008f4:	fd354de3          	blt	a0,s3,200008ce <forward+0x1c6>
200008f8:	0304af03          	lw	t5,48(s1)
200008fc:	4e81                	li	t4,0
200008fe:	9f7e                	add	t5,t5,t6
20000900:	f00007d3          	fmv.w.x	fa5,zero
20000904:	8766                	mv	a4,s9
20000906:	86fa                	mv	a3,t5
20000908:	01a05a63          	blez	s10,2000091c <forward+0x214>
2000090c:	6294                	flw	fa3,0(a3)
2000090e:	6318                	flw	fa4,0(a4)
20000910:	0711                	add	a4,a4,4
20000912:	0691                	add	a3,a3,4
20000914:	78e6f7c3          	fmadd.s	fa5,fa3,fa4,fa5
20000918:	feea9ae3          	bne	s5,a4,2000090c <forward+0x204>
2000091c:	00fe2027          	fsw	fa5,0(t3)
20000920:	0e85                	add	t4,t4,1
20000922:	0e11                	add	t3,t3,4
20000924:	9f52                	add	t5,t5,s4
20000926:	fd3ecde3          	blt	t4,s3,20000900 <forward+0x1f8>
2000092a:	67a05363          	blez	s10,20000f90 <forward+0x888>
2000092e:	d00474d3          	fcvt.s.w	fs1,s0
20000932:	8eea                	mv	t4,s10
20000934:	01a9d363          	bge	s3,s10,2000093a <forward+0x232>
20000938:	8ece                	mv	t4,s3
2000093a:	4722                	lw	a4,8(sp)
2000093c:	4c01                	li	s8,0
2000093e:	c4d2                	sw	s4,72(sp)
20000940:	d0077b53          	fcvt.s.w	fs6,a4
20000944:	20014737          	lui	a4,0x20014
20000948:	cc3a                	sw	a4,24(sp)
2000094a:	20014737          	lui	a4,0x20014
2000094e:	c6ce                	sw	s3,76(sp)
20000950:	8a62                	mv	s4,s8
20000952:	c2ba                	sw	a4,68(sp)
20000954:	8c56                	mv	s8,s5
20000956:	89de                	mv	s3,s7
20000958:	8aa6                	mv	s5,s1
2000095a:	d0be                	sw	a5,96(sp)
2000095c:	8976                	mv	s2,t4
2000095e:	84b2                	mv	s1,a2
20000960:	028a66b3          	rem	a3,s4,s0
20000964:	21398553          	fmv.s	fa0,fs3
20000968:	09a1                	add	s3,s3,8
2000096a:	04a1                	add	s1,s1,8
2000096c:	0a09                	add	s4,s4,2
2000096e:	d006f5d3          	fcvt.s.w	fa1,a3
20000972:	1895f5d3          	fdiv.s	fa1,fa1,fs1
20000976:	1720a0ef          	jal	2000aae8 <powf>
2000097a:	18a97bd3          	fdiv.s	fs7,fs2,fa0
2000097e:	116bfbd3          	fmul.s	fs7,fs7,fs6
20000982:	217b8553          	fmv.s	fa0,fs7
20000986:	753090ef          	jal	2000a8d8 <cosf>
2000098a:	20a50453          	fmv.s	fs0,fa0
2000098e:	217b8553          	fmv.s	fa0,fs7
20000992:	41a0a0ef          	jal	2000adac <sinf>
20000996:	ffc9a707          	flw	fa4,-4(s3)
2000099a:	ff89a787          	flw	fa5,-8(s3)
2000099e:	108776d3          	fmul.s	fa3,fa4,fs0
200009a2:	10a77753          	fmul.s	fa4,fa4,fa0
200009a6:	68a7f6c3          	fmadd.s	fa3,fa5,fa0,fa3
200009aa:	7087f7c7          	fmsub.s	fa5,fa5,fs0,fa4
200009ae:	fed9ae27          	fsw	fa3,-4(s3)
200009b2:	fef9ac27          	fsw	fa5,-8(s3)
200009b6:	ffc4a707          	flw	fa4,-4(s1)
200009ba:	ff84a787          	flw	fa5,-8(s1)
200009be:	10a776d3          	fmul.s	fa3,fa4,fa0
200009c2:	10877753          	fmul.s	fa4,fa4,fs0
200009c6:	6887f447          	fmsub.s	fs0,fa5,fs0,fa3
200009ca:	70a7f7c3          	fmadd.s	fa5,fa5,fa0,fa4
200009ce:	fe84ac27          	fsw	fs0,-8(s1)
200009d2:	fef4ae27          	fsw	fa5,-4(s1)
200009d6:	f92a45e3          	blt	s4,s2,20000960 <forward+0x258>
200009da:	84d6                	mv	s1,s5
200009dc:	8ae2                	mv	s5,s8
200009de:	8c52                	mv	s8,s4
200009e0:	49b6                	lw	s3,76(sp)
200009e2:	5786                	lw	a5,96(sp)
200009e4:	4a26                	lw	s4,72(sp)
200009e6:	09ac5163          	bge	s8,s10,20000a68 <forward+0x360>
200009ea:	4716                	lw	a4,68(sp)
200009ec:	002c1913          	sll	s2,s8,0x2
200009f0:	c2be                	sw	a5,68(sp)
200009f2:	01472c07          	flw	fs8,20(a4) # 20014014 <__clz_tab+0x5cc>
200009f6:	4762                	lw	a4,24(sp)
200009f8:	87d6                	mv	a5,s5
200009fa:	995e                	add	s2,s2,s7
200009fc:	01072b87          	flw	fs7,16(a4)
20000a00:	8aa6                	mv	s5,s1
20000a02:	84e2                	mv	s1,s8
20000a04:	8c3e                	mv	s8,a5
20000a06:	0284e733          	rem	a4,s1,s0
20000a0a:	218c0553          	fmv.s	fa0,fs8
20000a0e:	0921                	add	s2,s2,8
20000a10:	0489                	add	s1,s1,2
20000a12:	d00775d3          	fcvt.s.w	fa1,a4
20000a16:	1895f5d3          	fdiv.s	fa1,fa1,fs1
20000a1a:	0ce0a0ef          	jal	2000aae8 <powf>
20000a1e:	18abf453          	fdiv.s	fs0,fs7,fa0
20000a22:	11647453          	fmul.s	fs0,fs0,fs6
20000a26:	20840553          	fmv.s	fa0,fs0
20000a2a:	6af090ef          	jal	2000a8d8 <cosf>
20000a2e:	20a507d3          	fmv.s	fa5,fa0
20000a32:	20840553          	fmv.s	fa0,fs0
20000a36:	20f78453          	fmv.s	fs0,fa5
20000a3a:	3720a0ef          	jal	2000adac <sinf>
20000a3e:	ffc92787          	flw	fa5,-4(s2)
20000a42:	ff892707          	flw	fa4,-8(s2)
20000a46:	10a7f6d3          	fmul.s	fa3,fa5,fa0
20000a4a:	1087f653          	fmul.s	fa2,fa5,fs0
20000a4e:	60a777c3          	fmadd.s	fa5,fa4,fa0,fa2
20000a52:	68877747          	fmsub.s	fa4,fa4,fs0,fa3
20000a56:	fef92e27          	fsw	fa5,-4(s2)
20000a5a:	fee92c27          	fsw	fa4,-8(s2)
20000a5e:	fba4c4e3          	blt	s1,s10,20000a06 <forward+0x2fe>
20000a62:	4796                	lw	a5,68(sp)
20000a64:	84d6                	mv	s1,s5
20000a66:	8ae2                	mv	s5,s8
20000a68:	44d8                	lw	a4,12(s1)
20000a6a:	54e05163          	blez	a4,20000fac <forward+0x8a4>
20000a6e:	4772                	lw	a4,28(sp)
20000a70:	4901                	li	s2,0
20000a72:	d4ee                	sw	s11,104(sp)
20000a74:	0711                	add	a4,a4,4
20000a76:	8dca                	mv	s11,s2
20000a78:	cc3a                	sw	a4,24(sp)
20000a7a:	02fd8733          	mul	a4,s11,a5
20000a7e:	d0d2                	sw	s4,96(sp)
20000a80:	8a4e                	mv	s4,s3
20000a82:	89a6                	mv	s3,s1
20000a84:	06c9a783          	lw	a5,108(s3)
20000a88:	4a81                	li	s5,0
20000a8a:	d2ea                	sw	s10,100(sp)
20000a8c:	f00004d3          	fmv.w.x	fs1,zero
20000a90:	8d22                	mv	s10,s0
20000a92:	002a9913          	sll	s2,s5,0x2
20000a96:	070a                	sll	a4,a4,0x2
20000a98:	00e78cb3          	add	s9,a5,a4
20000a9c:	47a2                	lw	a5,8(sp)
20000a9e:	1407cc63          	bltz	a5,20000bf6 <forward+0x4ee>
20000aa2:	47d2                	lw	a5,20(sp)
20000aa4:	012b82b3          	add	t0,s7,s2
20000aa8:	d00d7b53          	fcvt.s.w	fs6,s10
20000aac:	02fdc833          	div	a6,s11,a5
20000ab0:	47e2                	lw	a5,24(sp)
20000ab2:	0749a383          	lw	t2,116(s3)
20000ab6:	84e6                	mv	s1,s9
20000ab8:	01978bb3          	add	s7,a5,s9
20000abc:	47b2                	lw	a5,12(sp)
20000abe:	01628c33          	add	s8,t0,s6
20000ac2:	03a80833          	mul	a6,a6,s10
20000ac6:	00f80433          	add	s0,a6,a5
20000aca:	47a05063          	blez	s10,20000f2a <forward+0x822>
20000ace:	8f66                	mv	t5,s9
20000ad0:	8fa2                	mv	t6,s0
20000ad2:	f0000453          	fmv.w.x	fs0,zero
20000ad6:	002f9713          	sll	a4,t6,0x2
20000ada:	971e                	add	a4,a4,t2
20000adc:	8796                	mv	a5,t0
20000ade:	6398                	flw	fa4,0(a5)
20000ae0:	631c                	flw	fa5,0(a4)
20000ae2:	0791                	add	a5,a5,4
20000ae4:	0711                	add	a4,a4,4
20000ae6:	40f77443          	fmadd.s	fs0,fa4,fa5,fs0
20000aea:	fefc1ae3          	bne	s8,a5,20000ade <forward+0x3d6>
20000aee:	00102773          	frflags	a4
20000af2:	a09b17d3          	flt.s	a5,fs6,fs1
20000af6:	00171073          	fsflags	a4
20000afa:	44079463          	bnez	a5,20000f42 <forward+0x83a>
20000afe:	580b7753          	fsqrt.s	fa4,fs6
20000b02:	0f11                	add	t5,t5,4
20000b04:	9fd2                	add	t6,t6,s4
20000b06:	18e477d3          	fdiv.s	fa5,fs0,fa4
20000b0a:	f0000453          	fmv.w.x	fs0,zero
20000b0e:	feff2e27          	fsw	fa5,-4(t5)
20000b12:	01eb8e63          	beq	s7,t5,20000b2e <forward+0x426>
20000b16:	fba04ee3          	bgtz	s10,20000ad2 <forward+0x3ca>
20000b1a:	18e477d3          	fdiv.s	fa5,fs0,fa4
20000b1e:	0f11                	add	t5,t5,4
20000b20:	f0000453          	fmv.w.x	fs0,zero
20000b24:	9fd2                	add	t6,t6,s4
20000b26:	feff2e27          	fsw	fa5,-4(t5)
20000b2a:	ffeb96e3          	bne	s7,t5,20000b16 <forward+0x40e>
20000b2e:	47c2                	lw	a5,16(sp)
20000b30:	4705                	li	a4,1
20000b32:	000caa87          	flw	fs5,0(s9)
20000b36:	00f75f63          	bge	a4,a5,20000b54 <forward+0x44c>
20000b3a:	47f2                	lw	a5,28(sp)
20000b3c:	00fc8633          	add	a2,s9,a5
20000b40:	87e6                	mv	a5,s9
20000b42:	63dc                	flw	fa5,4(a5)
20000b44:	0791                	add	a5,a5,4
20000b46:	a0fa9753          	flt.s	a4,fs5,fa5
20000b4a:	c319                	beqz	a4,20000b50 <forward+0x448>
20000b4c:	20f78ad3          	fmv.s	fs5,fa5
20000b50:	fef619e3          	bne	a2,a5,20000b42 <forward+0x43a>
20000b54:	f0000453          	fmv.w.x	fs0,zero
20000b58:	8c66                	mv	s8,s9
20000b5a:	000c2507          	flw	fa0,0(s8)
20000b5e:	0c11                	add	s8,s8,4
20000b60:	09557553          	fsub.s	fa0,fa0,fs5
20000b64:	6af090ef          	jal	2000aa12 <expf>
20000b68:	feac2e27          	fsw	fa0,-4(s8)
20000b6c:	00a47453          	fadd.s	fs0,fs0,fa0
20000b70:	ff8b95e3          	bne	s7,s8,20000b5a <forward+0x452>
20000b74:	87e6                	mv	a5,s9
20000b76:	639c                	flw	fa5,0(a5)
20000b78:	0791                	add	a5,a5,4
20000b7a:	1887f7d3          	fdiv.s	fa5,fa5,fs0
20000b7e:	fef7ae27          	fsw	fa5,-4(a5)
20000b82:	fefb9ae3          	bne	s7,a5,20000b76 <forward+0x46e>
20000b86:	0509af03          	lw	t5,80(s3)
20000b8a:	4581                	li	a1,0
20000b8c:	865a                	mv	a2,s6
20000b8e:	9f4a                	add	t5,t5,s2
20000b90:	857a                	mv	a0,t5
20000b92:	7b50c0ef          	jal	2000db46 <memset>
20000b96:	0789a583          	lw	a1,120(s3)
20000b9a:	8f2a                	mv	t5,a0
20000b9c:	03a05763          	blez	s10,20000bca <forward+0x4c2>
20000ba0:	01650633          	add	a2,a0,s6
20000ba4:	6094                	flw	fa3,0(s1)
20000ba6:	00241713          	sll	a4,s0,0x2
20000baa:	972e                	add	a4,a4,a1
20000bac:	87fa                	mv	a5,t5
20000bae:	631c                	flw	fa5,0(a4)
20000bb0:	6398                	flw	fa4,0(a5)
20000bb2:	0791                	add	a5,a5,4
20000bb4:	0711                	add	a4,a4,4
20000bb6:	70d7f7c3          	fmadd.s	fa5,fa5,fa3,fa4
20000bba:	fef7ae27          	fsw	fa5,-4(a5)
20000bbe:	fef618e3          	bne	a2,a5,20000bae <forward+0x4a6>
20000bc2:	0491                	add	s1,s1,4
20000bc4:	9452                	add	s0,s0,s4
20000bc6:	fc9b9fe3          	bne	s7,s1,20000ba4 <forward+0x49c>
20000bca:	00c9a783          	lw	a5,12(s3)
20000bce:	0d85                	add	s11,s11,1
20000bd0:	9aea                	add	s5,s5,s10
20000bd2:	02fddf63          	bge	s11,a5,20000c10 <forward+0x508>
20000bd6:	0189a783          	lw	a5,24(s3)
20000bda:	0609ab83          	lw	s7,96(s3)
20000bde:	002a9913          	sll	s2,s5,0x2
20000be2:	02fd8733          	mul	a4,s11,a5
20000be6:	06c9a783          	lw	a5,108(s3)
20000bea:	070a                	sll	a4,a4,0x2
20000bec:	00e78cb3          	add	s9,a5,a4
20000bf0:	47a2                	lw	a5,8(sp)
20000bf2:	ea07d8e3          	bgez	a5,20000aa2 <forward+0x39a>
20000bf6:	0509a503          	lw	a0,80(s3)
20000bfa:	865a                	mv	a2,s6
20000bfc:	4581                	li	a1,0
20000bfe:	954a                	add	a0,a0,s2
20000c00:	7470c0ef          	jal	2000db46 <memset>
20000c04:	00c9a783          	lw	a5,12(s3)
20000c08:	0d85                	add	s11,s11,1
20000c0a:	9aea                	add	s5,s5,s10
20000c0c:	fcfdc5e3          	blt	s11,a5,20000bd6 <forward+0x4ce>
20000c10:	84ce                	mv	s1,s3
20000c12:	0504ac83          	lw	s9,80(s1)
20000c16:	846a                	mv	s0,s10
20000c18:	89d2                	mv	s3,s4
20000c1a:	5d16                	lw	s10,100(sp)
20000c1c:	5a06                	lw	s4,96(sp)
20000c1e:	200147b7          	lui	a5,0x20014
20000c22:	cc3e                	sw	a5,24(sp)
20000c24:	5da6                	lw	s11,104(sp)
20000c26:	48ec                	lw	a1,84(s1)
20000c28:	58c8                	lw	a0,52(s1)
20000c2a:	019a0ab3          	add	s5,s4,s9
20000c2e:	37a05463          	blez	s10,20000f96 <forward+0x88e>
20000c32:	5792                	lw	a5,36(sp)
20000c34:	01458e33          	add	t3,a1,s4
20000c38:	862e                	mv	a2,a1
20000c3a:	078a                	sll	a5,a5,0x2
20000c3c:	953e                	add	a0,a0,a5
20000c3e:	f00007d3          	fmv.w.x	fa5,zero
20000c42:	87e6                	mv	a5,s9
20000c44:	872a                	mv	a4,a0
20000c46:	6314                	flw	fa3,0(a4)
20000c48:	6398                	flw	fa4,0(a5)
20000c4a:	0791                	add	a5,a5,4 # 20014004 <__clz_tab+0x5bc>
20000c4c:	0711                	add	a4,a4,4
20000c4e:	78e6f7c3          	fmadd.s	fa5,fa3,fa4,fa5
20000c52:	fefa9ae3          	bne	s5,a5,20000c46 <forward+0x53e>
20000c56:	e21c                	fsw	fa5,0(a2)
20000c58:	0611                	add	a2,a2,4
20000c5a:	9552                	add	a0,a0,s4
20000c5c:	fece11e3          	bne	t3,a2,20000c3e <forward+0x536>
20000c60:	5782                	lw	a5,32(sp)
20000c62:	639c                	flw	fa5,0(a5)
20000c64:	6198                	flw	fa4,0(a1)
20000c66:	0791                	add	a5,a5,4
20000c68:	0591                	add	a1,a1,4
20000c6a:	00e7f7d3          	fadd.s	fa5,fa5,fa4
20000c6e:	fef7ae27          	fsw	fa5,-4(a5)
20000c72:	fefd98e3          	bne	s11,a5,20000c62 <forward+0x55a>
20000c76:	0244a903          	lw	s2,36(s1)
20000c7a:	f0000753          	fmv.w.x	fa4,zero
20000c7e:	5782                	lw	a5,32(sp)
20000c80:	639c                	flw	fa5,0(a5)
20000c82:	0791                	add	a5,a5,4
20000c84:	70f7f743          	fmadd.s	fa4,fa5,fa5,fa4
20000c88:	fefd9ce3          	bne	s11,a5,20000c80 <forward+0x578>
20000c8c:	19977753          	fdiv.s	fa4,fa4,fs9
20000c90:	01477553          	fadd.s	fa0,fa4,fs4
20000c94:	00102773          	frflags	a4
20000c98:	f00007d3          	fmv.w.x	fa5,zero
20000c9c:	a0f517d3          	flt.s	a5,fa0,fa5
20000ca0:	00171073          	fsflags	a4
20000ca4:	34079863          	bnez	a5,20000ff4 <forward+0x8ec>
20000ca8:	58057553          	fsqrt.s	fa0,fa0
20000cac:	47e2                	lw	a5,24(sp)
20000cae:	0107a687          	flw	fa3,16(a5)
20000cb2:	18a6f6d3          	fdiv.s	fa3,fa3,fa0
20000cb6:	2fa05063          	blez	s10,20000f96 <forward+0x88e>
20000cba:	57a2                	lw	a5,40(sp)
20000cbc:	8666                	mv	a2,s9
20000cbe:	00f90733          	add	a4,s2,a5
20000cc2:	5782                	lw	a5,32(sp)
20000cc4:	639c                	flw	fa5,0(a5)
20000cc6:	6318                	flw	fa4,0(a4)
20000cc8:	0611                	add	a2,a2,4
20000cca:	10f6f7d3          	fmul.s	fa5,fa3,fa5
20000cce:	0791                	add	a5,a5,4
20000cd0:	0711                	add	a4,a4,4
20000cd2:	10e7f7d3          	fmul.s	fa5,fa5,fa4
20000cd6:	fef62e27          	fsw	fa5,-4(a2)
20000cda:	fefd95e3          	bne	s11,a5,20000cc4 <forward+0x5bc>
20000cde:	57e2                	lw	a5,56(sp)
20000ce0:	4ca8                	lw	a0,88(s1)
20000ce2:	5c8c                	lw	a1,56(s1)
20000ce4:	28f05e63          	blez	a5,20000f80 <forward+0x878>
20000ce8:	57b2                	lw	a5,44(sp)
20000cea:	8c2a                	mv	s8,a0
20000cec:	862a                	mv	a2,a0
20000cee:	00279e13          	sll	t3,a5,0x2
20000cf2:	57c2                	lw	a5,48(sp)
20000cf4:	95f2                	add	a1,a1,t3
20000cf6:	00a78933          	add	s2,a5,a0
20000cfa:	f00007d3          	fmv.w.x	fa5,zero
20000cfe:	87e6                	mv	a5,s9
20000d00:	872e                	mv	a4,a1
20000d02:	01a05a63          	blez	s10,20000d16 <forward+0x60e>
20000d06:	6314                	flw	fa3,0(a4)
20000d08:	6398                	flw	fa4,0(a5)
20000d0a:	0791                	add	a5,a5,4
20000d0c:	0711                	add	a4,a4,4
20000d0e:	78e6f7c3          	fmadd.s	fa5,fa3,fa4,fa5
20000d12:	fefa9ae3          	bne	s5,a5,20000d06 <forward+0x5fe>
20000d16:	e21c                	fsw	fa5,0(a2)
20000d18:	0611                	add	a2,a2,4
20000d1a:	95d2                	add	a1,a1,s4
20000d1c:	fcc91fe3          	bne	s2,a2,20000cfa <forward+0x5f2>
20000d20:	05c4ab83          	lw	s7,92(s1)
20000d24:	40ac                	lw	a1,64(s1)
20000d26:	57c2                	lw	a5,48(sp)
20000d28:	865e                	mv	a2,s7
20000d2a:	95f2                	add	a1,a1,t3
20000d2c:	01778eb3          	add	t4,a5,s7
20000d30:	f00007d3          	fmv.w.x	fa5,zero
20000d34:	87e6                	mv	a5,s9
20000d36:	872e                	mv	a4,a1
20000d38:	01a05a63          	blez	s10,20000d4c <forward+0x644>
20000d3c:	6314                	flw	fa3,0(a4)
20000d3e:	6398                	flw	fa4,0(a5)
20000d40:	0791                	add	a5,a5,4
20000d42:	0711                	add	a4,a4,4
20000d44:	78e6f7c3          	fmadd.s	fa5,fa3,fa4,fa5
20000d48:	fefa9ae3          	bne	s5,a5,20000d3c <forward+0x634>
20000d4c:	e21c                	fsw	fa5,0(a2)
20000d4e:	0611                	add	a2,a2,4
20000d50:	95d2                	add	a1,a1,s4
20000d52:	fcce9fe3          	bne	t4,a2,20000d30 <forward+0x628>
20000d56:	47e2                	lw	a5,24(sp)
20000d58:	c62a                	sw	a0,12(sp)
20000d5a:	cc22                	sw	s0,24(sp)
20000d5c:	0107a487          	flw	fs1,16(a5)
20000d60:	87d6                	mv	a5,s5
20000d62:	845e                	mv	s0,s7
20000d64:	8aa6                	mv	s5,s1
20000d66:	8bf2                	mv	s7,t3
20000d68:	84e2                	mv	s1,s8
20000d6a:	8c3e                	mv	s8,a5
20000d6c:	6080                	flw	fs0,0(s1)
20000d6e:	0491                	add	s1,s1,4
20000d70:	0411                	add	s0,s0,4
20000d72:	20841553          	fneg.s	fa0,fs0
20000d76:	49d090ef          	jal	2000aa12 <expf>
20000d7a:	009577d3          	fadd.s	fa5,fa0,fs1
20000d7e:	ffc42707          	flw	fa4,-4(s0)
20000d82:	18f4f7d3          	fdiv.s	fa5,fs1,fa5
20000d86:	1087f7d3          	fmul.s	fa5,fa5,fs0
20000d8a:	10f77753          	fmul.s	fa4,fa4,fa5
20000d8e:	fee4ae27          	fsw	fa4,-4(s1)
20000d92:	fc991de3          	bne	s2,s1,20000d6c <forward+0x664>
20000d96:	84d6                	mv	s1,s5
20000d98:	4532                	lw	a0,12(sp)
20000d9a:	4462                	lw	s0,24(sp)
20000d9c:	5ccc                	lw	a1,60(s1)
20000d9e:	8e5e                	mv	t3,s7
20000da0:	8ae2                	mv	s5,s8
20000da2:	05a05563          	blez	s10,20000dec <forward+0x6e4>
20000da6:	5862                	lw	a6,56(sp)
20000da8:	58c2                	lw	a7,48(sp)
20000daa:	86e6                	mv	a3,s9
20000dac:	95f2                	add	a1,a1,t3
20000dae:	8666                	mv	a2,s9
20000db0:	f00007d3          	fmv.w.x	fa5,zero
20000db4:	87aa                	mv	a5,a0
20000db6:	872e                	mv	a4,a1
20000db8:	01005a63          	blez	a6,20000dcc <forward+0x6c4>
20000dbc:	6314                	flw	fa3,0(a4)
20000dbe:	6398                	flw	fa4,0(a5)
20000dc0:	0791                	add	a5,a5,4
20000dc2:	0711                	add	a4,a4,4
20000dc4:	78e6f7c3          	fmadd.s	fa5,fa3,fa4,fa5
20000dc8:	fef91ae3          	bne	s2,a5,20000dbc <forward+0x6b4>
20000dcc:	e21c                	fsw	fa5,0(a2)
20000dce:	0611                	add	a2,a2,4
20000dd0:	95c6                	add	a1,a1,a7
20000dd2:	fcca9fe3          	bne	s5,a2,20000db0 <forward+0x6a8>
20000dd6:	5782                	lw	a5,32(sp)
20000dd8:	639c                	flw	fa5,0(a5)
20000dda:	6298                	flw	fa4,0(a3)
20000ddc:	0791                	add	a5,a5,4
20000dde:	0691                	add	a3,a3,4
20000de0:	00e7f7d3          	fadd.s	fa5,fa5,fa4
20000de4:	fef7ae27          	fsw	fa5,-4(a5)
20000de8:	ffb798e3          	bne	a5,s11,20000dd8 <forward+0x6d0>
20000dec:	5752                	lw	a4,52(sp)
20000dee:	45f6                	lw	a1,92(sp)
20000df0:	4606                	lw	a2,64(sp)
20000df2:	00170693          	add	a3,a4,1
20000df6:	00e6b733          	sltu	a4,a3,a4
20000dfa:	da36                	sw	a3,52(sp)
20000dfc:	56b2                	lw	a3,44(sp)
20000dfe:	449c                	lw	a5,8(s1)
20000e00:	963a                	add	a2,a2,a4
20000e02:	96ae                	add	a3,a3,a1
20000e04:	d636                	sw	a3,44(sp)
20000e06:	56a2                	lw	a3,40(sp)
20000e08:	45e6                	lw	a1,88(sp)
20000e0a:	c0b2                	sw	a2,64(sp)
20000e0c:	96d2                	add	a3,a3,s4
20000e0e:	d436                	sw	a3,40(sp)
20000e10:	56f2                	lw	a3,60(sp)
20000e12:	41f7d713          	sra	a4,a5,0x1f
20000e16:	96ae                	add	a3,a3,a1
20000e18:	de36                	sw	a3,60(sp)
20000e1a:	45d6                	lw	a1,84(sp)
20000e1c:	5692                	lw	a3,36(sp)
20000e1e:	96ae                	add	a3,a3,a1
20000e20:	d236                	sw	a3,36(sp)
20000e22:	9ce668e3          	bltu	a2,a4,200007f2 <forward+0xea>
20000e26:	00c71563          	bne	a4,a2,20000e30 <forward+0x728>
20000e2a:	5752                	lw	a4,52(sp)
20000e2c:	9cf763e3          	bltu	a4,a5,200007f2 <forward+0xea>
20000e30:	219c8ad3          	fmv.s	fs5,fs9
20000e34:	8dea                	mv	s11,s10
20000e36:	5b0e                	lw	s6,224(sp)
20000e38:	4c6e                	lw	s8,216(sp)
20000e3a:	4cde                	lw	s9,212(sp)
20000e3c:	4d4e                	lw	s10,208(sp)
20000e3e:	346a                	fld	fs0,184(sp)
20000e40:	34ca                	fld	fs1,176(sp)
20000e42:	392a                	fld	fs2,168(sp)
20000e44:	398a                	fld	fs3,160(sp)
20000e46:	2a6a                	fld	fs4,152(sp)
20000e48:	2b2a                	fld	fs6,136(sp)
20000e4a:	2b8a                	fld	fs7,128(sp)
20000e4c:	3c66                	fld	fs8,120(sp)
20000e4e:	3cc6                	fld	fs9,112(sp)
20000e50:	8452                	mv	s0,s4
20000e52:	89a6                	mv	s3,s1
20000e54:	0449a483          	lw	s1,68(s3)
20000e58:	07b05563          	blez	s11,20000ec2 <forward+0x7ba>
20000e5c:	5782                	lw	a5,32(sp)
20000e5e:	f00007d3          	fmv.w.x	fa5,zero
20000e62:	893e                	mv	s2,a5
20000e64:	943e                	add	s0,s0,a5
20000e66:	6398                	flw	fa4,0(a5)
20000e68:	0791                	add	a5,a5,4
20000e6a:	78e777c3          	fmadd.s	fa5,fa4,fa4,fa5
20000e6e:	fe879ce3          	bne	a5,s0,20000e66 <forward+0x75e>
20000e72:	1957f7d3          	fdiv.s	fa5,fa5,fs5
20000e76:	200147b7          	lui	a5,0x20014
20000e7a:	00c7a707          	flw	fa4,12(a5) # 2001400c <__clz_tab+0x5c4>
20000e7e:	00e7f553          	fadd.s	fa0,fa5,fa4
20000e82:	00102773          	frflags	a4
20000e86:	f00007d3          	fmv.w.x	fa5,zero
20000e8a:	a0f517d3          	flt.s	a5,fa0,fa5
20000e8e:	00171073          	fsflags	a4
20000e92:	14079e63          	bnez	a5,20000fee <forward+0x8e6>
20000e96:	58057553          	fsqrt.s	fa0,fa0
20000e9a:	20014737          	lui	a4,0x20014
20000e9e:	01072707          	flw	fa4,16(a4) # 20014010 <__clz_tab+0x5c8>
20000ea2:	87a6                	mv	a5,s1
20000ea4:	18a77753          	fdiv.s	fa4,fa4,fa0
20000ea8:	00092787          	flw	fa5,0(s2)
20000eac:	6394                	flw	fa3,0(a5)
20000eae:	0911                	add	s2,s2,4
20000eb0:	10f777d3          	fmul.s	fa5,fa4,fa5
20000eb4:	0791                	add	a5,a5,4
20000eb6:	10d7f7d3          	fmul.s	fa5,fa5,fa3
20000eba:	fef92e27          	fsw	fa5,-4(s2)
20000ebe:	fe8915e3          	bne	s2,s0,20000ea8 <forward+0x7a0>
20000ec2:	0149a783          	lw	a5,20(s3)
20000ec6:	0709a503          	lw	a0,112(s3)
20000eca:	0489a303          	lw	t1,72(s3)
20000ece:	0009a883          	lw	a7,0(s3)
20000ed2:	04f05063          	blez	a5,20000f12 <forward+0x80a>
20000ed6:	078a                	sll	a5,a5,0x2
20000ed8:	00a78633          	add	a2,a5,a0
20000edc:	5782                	lw	a5,32(sp)
20000ede:	00289693          	sll	a3,a7,0x2
20000ee2:	85aa                	mv	a1,a0
20000ee4:	96be                	add	a3,a3,a5
20000ee6:	4801                	li	a6,0
20000ee8:	f00007d3          	fmv.w.x	fa5,zero
20000eec:	01105e63          	blez	a7,20000f08 <forward+0x800>
20000ef0:	5782                	lw	a5,32(sp)
20000ef2:	00281713          	sll	a4,a6,0x2
20000ef6:	971a                	add	a4,a4,t1
20000ef8:	6314                	flw	fa3,0(a4)
20000efa:	6398                	flw	fa4,0(a5)
20000efc:	0791                	add	a5,a5,4
20000efe:	0711                	add	a4,a4,4
20000f00:	78e6f7c3          	fmadd.s	fa5,fa3,fa4,fa5
20000f04:	fef69ae3          	bne	a3,a5,20000ef8 <forward+0x7f0>
20000f08:	e19c                	fsw	fa5,0(a1)
20000f0a:	0591                	add	a1,a1,4
20000f0c:	9846                	add	a6,a6,a7
20000f0e:	fcb61de3          	bne	a2,a1,20000ee8 <forward+0x7e0>
20000f12:	50fe                	lw	ra,252(sp)
20000f14:	546e                	lw	s0,248(sp)
20000f16:	54de                	lw	s1,244(sp)
20000f18:	594e                	lw	s2,240(sp)
20000f1a:	59be                	lw	s3,236(sp)
20000f1c:	5a2e                	lw	s4,232(sp)
20000f1e:	5a9e                	lw	s5,228(sp)
20000f20:	4bfe                	lw	s7,220(sp)
20000f22:	4dbe                	lw	s11,204(sp)
20000f24:	2aca                	fld	fs5,144(sp)
20000f26:	6111                	add	sp,sp,256
20000f28:	8082                	ret
20000f2a:	f0000453          	fmv.w.x	fs0,zero
20000f2e:	8f66                	mv	t5,s9
20000f30:	8fa2                	mv	t6,s0
20000f32:	00102773          	frflags	a4
20000f36:	a09b17d3          	flt.s	a5,fs6,fs1
20000f3a:	00171073          	fsflags	a4
20000f3e:	bc0780e3          	beqz	a5,20000afe <forward+0x3f6>
20000f42:	c2a2                	sw	s0,68(sp)
20000f44:	c4a6                	sw	s1,72(sp)
20000f46:	c6ce                	sw	s3,76(sp)
20000f48:	84fe                	mv	s1,t6
20000f4a:	847a                	mv	s0,t5
20000f4c:	8996                	mv	s3,t0
20000f4e:	216b0553          	fmv.s	fa0,fs6
20000f52:	d69e                	sw	t2,108(sp)
20000f54:	0411                	add	s0,s0,4
20000f56:	651090ef          	jal	2000ada6 <sqrtf>
20000f5a:	18a477d3          	fdiv.s	fa5,fs0,fa0
20000f5e:	94d2                	add	s1,s1,s4
20000f60:	f0000453          	fmv.w.x	fs0,zero
20000f64:	fef42e27          	fsw	fa5,-4(s0)
20000f68:	07740a63          	beq	s0,s7,20000fdc <forward+0x8d4>
20000f6c:	53b6                	lw	t2,108(sp)
20000f6e:	ffa050e3          	blez	s10,20000f4e <forward+0x846>
20000f72:	82ce                	mv	t0,s3
20000f74:	8fa6                	mv	t6,s1
20000f76:	8f22                	mv	t5,s0
20000f78:	44a6                	lw	s1,72(sp)
20000f7a:	4416                	lw	s0,68(sp)
20000f7c:	49b6                	lw	s3,76(sp)
20000f7e:	be91                	j	20000ad2 <forward+0x3ca>
20000f80:	57b2                	lw	a5,44(sp)
20000f82:	5ccc                	lw	a1,60(s1)
20000f84:	00279e13          	sll	t3,a5,0x2
20000f88:	57c2                	lw	a5,48(sp)
20000f8a:	00a78933          	add	s2,a5,a0
20000f8e:	bd21                	j	20000da6 <forward+0x69e>
20000f90:	44d8                	lw	a4,12(s1)
20000f92:	ace04ee3          	bgtz	a4,20000a6e <forward+0x366>
20000f96:	200147b7          	lui	a5,0x20014
20000f9a:	cc3e                	sw	a5,24(sp)
20000f9c:	57e2                	lw	a5,56(sp)
20000f9e:	4ca8                	lw	a0,88(s1)
20000fa0:	5c8c                	lw	a1,56(s1)
20000fa2:	019a0ab3          	add	s5,s4,s9
20000fa6:	d4f041e3          	bgtz	a5,20000ce8 <forward+0x5e0>
20000faa:	b589                	j	20000dec <forward+0x6e4>
20000fac:	48ec                	lw	a1,84(s1)
20000fae:	58c8                	lw	a0,52(s1)
20000fb0:	b149                	j	20000c32 <forward+0x52a>
20000fb2:	fd305fe3          	blez	s3,20000f90 <forward+0x888>
20000fb6:	019a0ab3          	add	s5,s4,s9
20000fba:	b221                	j	200008c2 <forward+0x1ba>
20000fbc:	4722                	lw	a4,8(sp)
20000fbe:	d00474d3          	fcvt.s.w	fs1,s0
20000fc2:	4c01                	li	s8,0
20000fc4:	d0077b53          	fcvt.s.w	fs6,a4
20000fc8:	20014737          	lui	a4,0x20014
20000fcc:	cc3a                	sw	a4,24(sp)
20000fce:	20014737          	lui	a4,0x20014
20000fd2:	c2ba                	sw	a4,68(sp)
20000fd4:	bc19                	j	200009ea <forward+0x2e2>
20000fd6:	d00dfad3          	fcvt.s.w	fs5,s11
20000fda:	bdad                	j	20000e54 <forward+0x74c>
20000fdc:	4416                	lw	s0,68(sp)
20000fde:	44a6                	lw	s1,72(sp)
20000fe0:	49b6                	lw	s3,76(sp)
20000fe2:	b6b1                	j	20000b2e <forward+0x426>
20000fe4:	5c3090ef          	jal	2000ada6 <sqrtf>
20000fe8:	20a50753          	fmv.s	fa4,fa0
20000fec:	b091                	j	20000830 <forward+0x128>
20000fee:	5b9090ef          	jal	2000ada6 <sqrtf>
20000ff2:	b565                	j	20000e9a <forward+0x792>
20000ff4:	5b3090ef          	jal	2000ada6 <sqrtf>
20000ff8:	47e2                	lw	a5,24(sp)
20000ffa:	0107a687          	flw	fa3,16(a5) # 20014010 <__clz_tab+0x5c8>
20000ffe:	18a6f6d3          	fdiv.s	fa3,fa3,fa0
20001002:	b965                	j	20000cba <forward+0x5b2>

20001004 <build_tokenizer>:
20001004:	200147b7          	lui	a5,0x20014
20001008:	94c78793          	add	a5,a5,-1716 # 2001394c <__mremap+0xa0>
2000100c:	0a87a683          	lw	a3,168(a5)
20001010:	0ac7d703          	lhu	a4,172(a5)
20001014:	09c7a883          	lw	a7,156(a5)
20001018:	0a07a803          	lw	a6,160(a5)
2000101c:	0a47a583          	lw	a1,164(a5)
20001020:	0ae7c783          	lbu	a5,174(a5)
20001024:	711d                	add	sp,sp,-96
20001026:	caa6                	sw	s1,84(sp)
20001028:	c6ce                	sw	s3,76(sp)
2000102a:	84aa                	mv	s1,a0
2000102c:	89b2                	mv	s3,a2
2000102e:	0028                	add	a0,sp,8
20001030:	ca36                	sw	a3,20(sp)
20001032:	00e11c23          	sh	a4,24(sp)
20001036:	00f10d23          	sb	a5,26(sp)
2000103a:	ce86                	sw	ra,92(sp)
2000103c:	c446                	sw	a7,8(sp)
2000103e:	c642                	sw	a6,12(sp)
20001040:	c82e                	sw	a1,16(sp)
20001042:	cca2                	sw	s0,88(sp)
20001044:	c0da                	sw	s6,64(sp)
20001046:	00299413          	sll	s0,s3,0x2
2000104a:	00010da3          	sb	zero,27(sp)
2000104e:	626010ef          	jal	20002674 <print_s>
20001052:	8522                	mv	a0,s0
20001054:	0134a623          	sw	s3,12(s1)
20001058:	5b4080ef          	jal	2000960c <malloc>
2000105c:	c088                	sw	a0,0(s1)
2000105e:	8522                	mv	a0,s0
20001060:	5ac080ef          	jal	2000960c <malloc>
20001064:	c0c8                	sw	a0,4(s1)
20001066:	0004a423          	sw	zero,8(s1)
2000106a:	01448713          	add	a4,s1,20
2000106e:	4781                	li	a5,0
20001070:	10000693          	li	a3,256
20001074:	00f70023          	sb	a5,0(a4) # 20014000 <__clz_tab+0x5b8>
20001078:	000700a3          	sb	zero,1(a4)
2000107c:	0785                	add	a5,a5,1
2000107e:	0709                	add	a4,a4,2
20001080:	fed79ae3          	bne	a5,a3,20001074 <build_tokenizer+0x70>
20001084:	35f6eb37          	lui	s6,0x35f6e
20001088:	4691                	li	a3,4
2000108a:	4601                	li	a2,0
2000108c:	a54b0593          	add	a1,s6,-1452 # 35f6da54 <tokenizer_str>
20001090:	01048513          	add	a0,s1,16
20001094:	43a010ef          	jal	200024ce <convert_n_hex2mem_from>
20001098:	07305a63          	blez	s3,2000110c <build_tokenizer+0x108>
2000109c:	c8ca                	sw	s2,80(sp)
2000109e:	c4d2                	sw	s4,72(sp)
200010a0:	c2d6                	sw	s5,68(sp)
200010a2:	de5e                	sw	s7,60(sp)
200010a4:	4901                	li	s2,0
200010a6:	4411                	li	s0,4
200010a8:	40c8                	lw	a0,4(s1)
200010aa:	00291a13          	sll	s4,s2,0x2
200010ae:	8622                	mv	a2,s0
200010b0:	4691                	li	a3,4
200010b2:	a54b0593          	add	a1,s6,-1452
200010b6:	9552                	add	a0,a0,s4
200010b8:	416010ef          	jal	200024ce <convert_n_hex2mem_from>
200010bc:	00440613          	add	a2,s0,4
200010c0:	4691                	li	a3,4
200010c2:	a54b0593          	add	a1,s6,-1452
200010c6:	0048                	add	a0,sp,4
200010c8:	406010ef          	jal	200024ce <convert_n_hex2mem_from>
200010cc:	4b92                	lw	s7,4(sp)
200010ce:	0004aa83          	lw	s5,0(s1)
200010d2:	0421                	add	s0,s0,8
200010d4:	001b8513          	add	a0,s7,1
200010d8:	534080ef          	jal	2000960c <malloc>
200010dc:	9ad2                	add	s5,s5,s4
200010de:	8622                	mv	a2,s0
200010e0:	00aaa023          	sw	a0,0(s5)
200010e4:	86de                	mv	a3,s7
200010e6:	a54b0593          	add	a1,s6,-1452
200010ea:	3e4010ef          	jal	200024ce <convert_n_hex2mem_from>
200010ee:	409c                	lw	a5,0(s1)
200010f0:	4712                	lw	a4,4(sp)
200010f2:	0905                	add	s2,s2,1
200010f4:	97d2                	add	a5,a5,s4
200010f6:	439c                	lw	a5,0(a5)
200010f8:	943a                	add	s0,s0,a4
200010fa:	97ba                	add	a5,a5,a4
200010fc:	00078023          	sb	zero,0(a5)
20001100:	fb2994e3          	bne	s3,s2,200010a8 <build_tokenizer+0xa4>
20001104:	4946                	lw	s2,80(sp)
20001106:	4a26                	lw	s4,72(sp)
20001108:	4a96                	lw	s5,68(sp)
2000110a:	5bf2                	lw	s7,60(sp)
2000110c:	200147b7          	lui	a5,0x20014
20001110:	bb078793          	add	a5,a5,-1104 # 20013bb0 <__clz_tab+0x168>
20001114:	438c                	lw	a1,0(a5)
20001116:	43d0                	lw	a2,4(a5)
20001118:	4794                	lw	a3,8(a5)
2000111a:	47d8                	lw	a4,12(a5)
2000111c:	4b9c                	lw	a5,16(a5)
2000111e:	0868                	add	a0,sp,28
20001120:	ce2e                	sw	a1,28(sp)
20001122:	d032                	sw	a2,32(sp)
20001124:	d236                	sw	a3,36(sp)
20001126:	d43a                	sw	a4,40(sp)
20001128:	d63e                	sw	a5,44(sp)
2000112a:	54a010ef          	jal	20002674 <print_s>
2000112e:	40f6                	lw	ra,92(sp)
20001130:	4466                	lw	s0,88(sp)
20001132:	44d6                	lw	s1,84(sp)
20001134:	49b6                	lw	s3,76(sp)
20001136:	4b06                	lw	s6,64(sp)
20001138:	6125                	add	sp,sp,96
2000113a:	8082                	ret

2000113c <free_tokenizer>:
2000113c:	455c                	lw	a5,12(a0)
2000113e:	1141                	add	sp,sp,-16
20001140:	c226                	sw	s1,4(sp)
20001142:	c606                	sw	ra,12(sp)
20001144:	84aa                	mv	s1,a0
20001146:	02f05063          	blez	a5,20001166 <free_tokenizer+0x2a>
2000114a:	c422                	sw	s0,8(sp)
2000114c:	4401                	li	s0,0
2000114e:	409c                	lw	a5,0(s1)
20001150:	00241713          	sll	a4,s0,0x2
20001154:	0405                	add	s0,s0,1
20001156:	97ba                	add	a5,a5,a4
20001158:	4388                	lw	a0,0(a5)
2000115a:	282080ef          	jal	200093dc <free>
2000115e:	44dc                	lw	a5,12(s1)
20001160:	fef447e3          	blt	s0,a5,2000114e <free_tokenizer+0x12>
20001164:	4422                	lw	s0,8(sp)
20001166:	4088                	lw	a0,0(s1)
20001168:	274080ef          	jal	200093dc <free>
2000116c:	40c8                	lw	a0,4(s1)
2000116e:	26e080ef          	jal	200093dc <free>
20001172:	4488                	lw	a0,8(s1)
20001174:	40b2                	lw	ra,12(sp)
20001176:	4492                	lw	s1,4(sp)
20001178:	0141                	add	sp,sp,16
2000117a:	2620806f          	j	200093dc <free>

2000117e <decode>:
2000117e:	411c                	lw	a5,0(a0)
20001180:	1101                	add	sp,sp,-32
20001182:	060a                	sll	a2,a2,0x2
20001184:	cc22                	sw	s0,24(sp)
20001186:	ca26                	sw	s1,20(sp)
20001188:	97b2                	add	a5,a5,a2
2000118a:	ce06                	sw	ra,28(sp)
2000118c:	4705                	li	a4,1
2000118e:	4380                	lw	s0,0(a5)
20001190:	84aa                	mv	s1,a0
20001192:	00e59863          	bne	a1,a4,200011a2 <decode+0x24>
20001196:	00044783          	lbu	a5,0(s0)
2000119a:	1781                	add	a5,a5,-32
2000119c:	0017b793          	seqz	a5,a5
200011a0:	943e                	add	s0,s0,a5
200011a2:	200145b7          	lui	a1,0x20014
200011a6:	00f10613          	add	a2,sp,15
200011aa:	bc458593          	add	a1,a1,-1084 # 20013bc4 <__clz_tab+0x17c>
200011ae:	8522                	mv	a0,s0
200011b0:	2220a0ef          	jal	2000b3d2 <sscanf>
200011b4:	4785                	li	a5,1
200011b6:	00f51763          	bne	a0,a5,200011c4 <decode+0x46>
200011ba:	00f14403          	lbu	s0,15(sp)
200011be:	04d1                	add	s1,s1,20
200011c0:	0406                	sll	s0,s0,0x1
200011c2:	9426                	add	s0,s0,s1
200011c4:	40f2                	lw	ra,28(sp)
200011c6:	8522                	mv	a0,s0
200011c8:	4462                	lw	s0,24(sp)
200011ca:	44d2                	lw	s1,20(sp)
200011cc:	6105                	add	sp,sp,32
200011ce:	8082                	ret

200011d0 <safe_printf>:
200011d0:	c11d                	beqz	a0,200011f6 <safe_printf+0x26>
200011d2:	00054783          	lbu	a5,0(a0)
200011d6:	c385                	beqz	a5,200011f6 <safe_printf+0x26>
200011d8:	00154703          	lbu	a4,1(a0)
200011dc:	eb19                	bnez	a4,200011f2 <safe_printf+0x22>
200011de:	fe078713          	add	a4,a5,-32
200011e2:	05e00693          	li	a3,94
200011e6:	00e6f663          	bgeu	a3,a4,200011f2 <safe_printf+0x22>
200011ea:	17dd                	add	a5,a5,-9
200011ec:	4711                	li	a4,4
200011ee:	00f76463          	bltu	a4,a5,200011f6 <safe_printf+0x26>
200011f2:	4820106f          	j	20002674 <print_s>
200011f6:	8082                	ret

200011f8 <str_lookup>:
200011f8:	1101                	add	sp,sp,-32
200011fa:	20000737          	lui	a4,0x20000
200011fe:	87aa                	mv	a5,a0
20001200:	08a70713          	add	a4,a4,138 # 2000008a <compare_tokens>
20001204:	46a1                	li	a3,8
20001206:	0028                	add	a0,sp,8
20001208:	ce06                	sw	ra,28(sp)
2000120a:	c602                	sw	zero,12(sp)
2000120c:	c43e                	sw	a5,8(sp)
2000120e:	3940c0ef          	jal	2000d5a2 <bsearch>
20001212:	c509                	beqz	a0,2000121c <str_lookup+0x24>
20001214:	4148                	lw	a0,4(a0)
20001216:	40f2                	lw	ra,28(sp)
20001218:	6105                	add	sp,sp,32
2000121a:	8082                	ret
2000121c:	557d                	li	a0,-1
2000121e:	bfe5                	j	20001216 <str_lookup+0x1e>

20001220 <encode>:
20001220:	7159                	add	sp,sp,-112
20001222:	d686                	sw	ra,108(sp)
20001224:	d4a2                	sw	s0,104(sp)
20001226:	d2a6                	sw	s1,100(sp)
20001228:	d0ca                	sw	s2,96(sp)
2000122a:	cece                	sw	s3,92(sp)
2000122c:	ccd2                	sw	s4,88(sp)
2000122e:	cad6                	sw	s5,84(sp)
20001230:	c8da                	sw	s6,80(sp)
20001232:	c6de                	sw	s7,76(sp)
20001234:	c4e2                	sw	s8,72(sp)
20001236:	c2e6                	sw	s9,68(sp)
20001238:	c0ea                	sw	s10,64(sp)
2000123a:	de6e                	sw	s11,60(sp)
2000123c:	b422                	fsd	fs0,40(sp)
2000123e:	b026                	fsd	fs1,32(sp)
20001240:	c636                	sw	a3,12(sp)
20001242:	2e058363          	beqz	a1,20001528 <encode+0x308>
20001246:	8cbe                	mv	s9,a5
20001248:	451c                	lw	a5,8(a0)
2000124a:	84ae                	mv	s1,a1
2000124c:	8d2a                	mv	s10,a0
2000124e:	89b2                	mv	s3,a2
20001250:	8a3a                	mv	s4,a4
20001252:	28078963          	beqz	a5,200014e4 <encode+0x2c4>
20001256:	010d2503          	lw	a0,16(s10)
2000125a:	0506                	sll	a0,a0,0x1
2000125c:	050d                	add	a0,a0,3
2000125e:	3ae080ef          	jal	2000960c <malloc>
20001262:	842a                	mv	s0,a0
20001264:	10099a63          	bnez	s3,20001378 <encode+0x158>
20001268:	000ca023          	sw	zero,0(s9)
2000126c:	0004c783          	lbu	a5,0(s1)
20001270:	10079d63          	bnez	a5,2000138a <encode+0x16a>
20001274:	000ca603          	lw	a2,0(s9)
20001278:	200147b7          	lui	a5,0x20014
2000127c:	4a85                	li	s5,1
2000127e:	0187a487          	flw	fs1,24(a5) # 20014018 <__clz_tab+0x5d0>
20001282:	54fd                	li	s1,-1
20001284:	200009b7          	lui	s3,0x20000
20001288:	20014937          	lui	s2,0x20014
2000128c:	0acad863          	bge	s5,a2,2000133c <encode+0x11c>
20001290:	20948453          	fmv.s	fs0,fs1
20001294:	8dd2                	mv	s11,s4
20001296:	4b01                	li	s6,0
20001298:	5bfd                	li	s7,-1
2000129a:	5c7d                	li	s8,-1
2000129c:	004da603          	lw	a2,4(s11)
200012a0:	000da783          	lw	a5,0(s11)
200012a4:	000d2703          	lw	a4,0(s10)
200012a8:	060a                	sll	a2,a2,0x2
200012aa:	078a                	sll	a5,a5,0x2
200012ac:	963a                	add	a2,a2,a4
200012ae:	973e                	add	a4,a4,a5
200012b0:	4214                	lw	a3,0(a2)
200012b2:	4310                	lw	a2,0(a4)
200012b4:	bec90593          	add	a1,s2,-1044 # 20013bec <__clz_tab+0x1a4>
200012b8:	8522                	mv	a0,s0
200012ba:	0f60a0ef          	jal	2000b3b0 <sprintf>
200012be:	00cd2603          	lw	a2,12(s10)
200012c2:	008d2583          	lw	a1,8(s10)
200012c6:	08a98713          	add	a4,s3,138 # 2000008a <compare_tokens>
200012ca:	46a1                	li	a3,8
200012cc:	0828                	add	a0,sp,24
200012ce:	ce02                	sw	zero,28(sp)
200012d0:	cc22                	sw	s0,24(sp)
200012d2:	2d00c0ef          	jal	2000d5a2 <bsearch>
200012d6:	c10d                	beqz	a0,200012f8 <encode+0xd8>
200012d8:	415c                	lw	a5,4(a0)
200012da:	00978f63          	beq	a5,s1,200012f8 <encode+0xd8>
200012de:	004d2703          	lw	a4,4(s10)
200012e2:	00279693          	sll	a3,a5,0x2
200012e6:	9736                	add	a4,a4,a3
200012e8:	631c                	flw	fa5,0(a4)
200012ea:	a0f41753          	flt.s	a4,fs0,fa5
200012ee:	c709                	beqz	a4,200012f8 <encode+0xd8>
200012f0:	20f78453          	fmv.s	fs0,fa5
200012f4:	8bda                	mv	s7,s6
200012f6:	8c3e                	mv	s8,a5
200012f8:	000ca603          	lw	a2,0(s9)
200012fc:	0b05                	add	s6,s6,1
200012fe:	0d91                	add	s11,s11,4
20001300:	fff60793          	add	a5,a2,-1
20001304:	f8fb4ce3          	blt	s6,a5,2000129c <encode+0x7c>
20001308:	029b8a63          	beq	s7,s1,2000133c <encode+0x11c>
2000130c:	002b9713          	sll	a4,s7,0x2
20001310:	9752                	add	a4,a4,s4
20001312:	01872023          	sw	s8,0(a4)
20001316:	000ca603          	lw	a2,0(s9)
2000131a:	0b85                	add	s7,s7,1
2000131c:	167d                	add	a2,a2,-1
2000131e:	00cbdb63          	bge	s7,a2,20001334 <encode+0x114>
20001322:	471c                	lw	a5,8(a4)
20001324:	0b85                	add	s7,s7,1
20001326:	0711                	add	a4,a4,4
20001328:	c31c                	sw	a5,0(a4)
2000132a:	000ca603          	lw	a2,0(s9)
2000132e:	167d                	add	a2,a2,-1
20001330:	fecbc9e3          	blt	s7,a2,20001322 <encode+0x102>
20001334:	00cca023          	sw	a2,0(s9)
20001338:	f4cacce3          	blt	s5,a2,20001290 <encode+0x70>
2000133c:	47b2                	lw	a5,12(sp)
2000133e:	cb91                	beqz	a5,20001352 <encode+0x132>
20001340:	00160793          	add	a5,a2,1
20001344:	060a                	sll	a2,a2,0x2
20001346:	00fca023          	sw	a5,0(s9)
2000134a:	9a32                	add	s4,s4,a2
2000134c:	4789                	li	a5,2
2000134e:	00fa2023          	sw	a5,0(s4)
20001352:	8522                	mv	a0,s0
20001354:	5426                	lw	s0,104(sp)
20001356:	50b6                	lw	ra,108(sp)
20001358:	5496                	lw	s1,100(sp)
2000135a:	5906                	lw	s2,96(sp)
2000135c:	49f6                	lw	s3,92(sp)
2000135e:	4a66                	lw	s4,88(sp)
20001360:	4ad6                	lw	s5,84(sp)
20001362:	4b46                	lw	s6,80(sp)
20001364:	4bb6                	lw	s7,76(sp)
20001366:	4c26                	lw	s8,72(sp)
20001368:	4c96                	lw	s9,68(sp)
2000136a:	4d06                	lw	s10,64(sp)
2000136c:	5df2                	lw	s11,60(sp)
2000136e:	3422                	fld	fs0,40(sp)
20001370:	3482                	fld	fs1,32(sp)
20001372:	6165                	add	sp,sp,112
20001374:	0680806f          	j	200093dc <free>
20001378:	4785                	li	a5,1
2000137a:	00fca023          	sw	a5,0(s9)
2000137e:	00fa2023          	sw	a5,0(s4)
20001382:	0004c783          	lbu	a5,0(s1)
20001386:	ee0787e3          	beqz	a5,20001274 <encode+0x54>
2000138a:	00cd2603          	lw	a2,12(s10)
2000138e:	008d2583          	lw	a1,8(s10)
20001392:	20000937          	lui	s2,0x20000
20001396:	200147b7          	lui	a5,0x20014
2000139a:	fbc78793          	add	a5,a5,-68 # 20013fbc <__clz_tab+0x574>
2000139e:	08a90713          	add	a4,s2,138 # 2000008a <compare_tokens>
200013a2:	46a1                	li	a3,8
200013a4:	0828                	add	a0,sp,24
200013a6:	ce02                	sw	zero,28(sp)
200013a8:	cc3e                	sw	a5,24(sp)
200013aa:	1f80c0ef          	jal	2000d5a2 <bsearch>
200013ae:	18050c63          	beqz	a0,20001546 <encode+0x326>
200013b2:	4154                	lw	a3,4(a0)
200013b4:	000ca783          	lw	a5,0(s9)
200013b8:	00178713          	add	a4,a5,1
200013bc:	078a                	sll	a5,a5,0x2
200013be:	00eca023          	sw	a4,0(s9)
200013c2:	97d2                	add	a5,a5,s4
200013c4:	c394                	sw	a3,0(a5)
200013c6:	0004c783          	lbu	a5,0(s1)
200013ca:	ea0785e3          	beqz	a5,20001274 <encode+0x54>
200013ce:	08000b93          	li	s7,128
200013d2:	4a91                	li	s5,4
200013d4:	59fd                	li	s3,-1
200013d6:	a081                	j	20001416 <encode+0x1f6>
200013d8:	00cd2603          	lw	a2,12(s10)
200013dc:	008d2583          	lw	a1,8(s10)
200013e0:	08a90713          	add	a4,s2,138
200013e4:	46a1                	li	a3,8
200013e6:	0828                	add	a0,sp,24
200013e8:	ce02                	sw	zero,28(sp)
200013ea:	cc22                	sw	s0,24(sp)
200013ec:	1b60c0ef          	jal	2000d5a2 <bsearch>
200013f0:	000ca703          	lw	a4,0(s9)
200013f4:	cd25                	beqz	a0,2000146c <encode+0x24c>
200013f6:	4154                	lw	a3,4(a0)
200013f8:	00271793          	sll	a5,a4,0x2
200013fc:	00170613          	add	a2,a4,1
20001400:	97d2                	add	a5,a5,s4
20001402:	07368563          	beq	a3,s3,2000146c <encode+0x24c>
20001406:	00cca023          	sw	a2,0(s9)
2000140a:	c394                	sw	a3,0(a5)
2000140c:	0014c783          	lbu	a5,1(s1)
20001410:	0485                	add	s1,s1,1
20001412:	e60781e3          	beqz	a5,20001274 <encode+0x54>
20001416:	0014c603          	lbu	a2,1(s1)
2000141a:	0c07f713          	and	a4,a5,192
2000141e:	0c067693          	and	a3,a2,192
20001422:	0f770f63          	beq	a4,s7,20001520 <encode+0x300>
20001426:	00f40023          	sb	a5,0(s0)
2000142a:	000400a3          	sb	zero,1(s0)
2000142e:	4c05                	li	s8,1
20001430:	fb7694e3          	bne	a3,s7,200013d8 <encode+0x1b8>
20001434:	0024c583          	lbu	a1,2(s1)
20001438:	4705                	li	a4,1
2000143a:	0485                	add	s1,s1,1
2000143c:	0c05f693          	and	a3,a1,192
20001440:	00170c13          	add	s8,a4,1
20001444:	9722                	add	a4,a4,s0
20001446:	00c70023          	sb	a2,0(a4)
2000144a:	018407b3          	add	a5,s0,s8
2000144e:	00078023          	sb	zero,0(a5)
20001452:	f97693e3          	bne	a3,s7,200013d8 <encode+0x1b8>
20001456:	f95c01e3          	beq	s8,s5,200013d8 <encode+0x1b8>
2000145a:	0024c783          	lbu	a5,2(s1)
2000145e:	862e                	mv	a2,a1
20001460:	0485                	add	s1,s1,1
20001462:	0c07f693          	and	a3,a5,192
20001466:	8762                	mv	a4,s8
20001468:	85be                	mv	a1,a5
2000146a:	bfd9                	j	20001440 <encode+0x220>
2000146c:	00044683          	lbu	a3,0(s0)
20001470:	00170613          	add	a2,a4,1
20001474:	00271793          	sll	a5,a4,0x2
20001478:	97d2                	add	a5,a5,s4
2000147a:	00cca023          	sw	a2,0(s9)
2000147e:	00368713          	add	a4,a3,3
20001482:	c398                	sw	a4,0(a5)
20001484:	4785                	li	a5,1
20001486:	04fc0c63          	beq	s8,a5,200014de <encode+0x2be>
2000148a:	000ca783          	lw	a5,0(s9)
2000148e:	00144703          	lbu	a4,1(s0)
20001492:	4689                	li	a3,2
20001494:	00178613          	add	a2,a5,1
20001498:	078a                	sll	a5,a5,0x2
2000149a:	00cca023          	sw	a2,0(s9)
2000149e:	97d2                	add	a5,a5,s4
200014a0:	070d                	add	a4,a4,3
200014a2:	c398                	sw	a4,0(a5)
200014a4:	02dc0d63          	beq	s8,a3,200014de <encode+0x2be>
200014a8:	000ca783          	lw	a5,0(s9)
200014ac:	00244703          	lbu	a4,2(s0)
200014b0:	4691                	li	a3,4
200014b2:	00178613          	add	a2,a5,1
200014b6:	078a                	sll	a5,a5,0x2
200014b8:	00cca023          	sw	a2,0(s9)
200014bc:	97d2                	add	a5,a5,s4
200014be:	070d                	add	a4,a4,3
200014c0:	c398                	sw	a4,0(a5)
200014c2:	00dc1e63          	bne	s8,a3,200014de <encode+0x2be>
200014c6:	000ca783          	lw	a5,0(s9)
200014ca:	00344703          	lbu	a4,3(s0)
200014ce:	00178693          	add	a3,a5,1
200014d2:	078a                	sll	a5,a5,0x2
200014d4:	00dca023          	sw	a3,0(s9)
200014d8:	97d2                	add	a5,a5,s4
200014da:	070d                	add	a4,a4,3
200014dc:	c398                	sw	a4,0(a5)
200014de:	0014c783          	lbu	a5,1(s1)
200014e2:	b73d                	j	20001410 <encode+0x1f0>
200014e4:	4540                	lw	s0,12(a0)
200014e6:	00341513          	sll	a0,s0,0x3
200014ea:	122080ef          	jal	2000960c <malloc>
200014ee:	00ad2423          	sw	a0,8(s10)
200014f2:	00805e63          	blez	s0,2000150e <encode+0x2ee>
200014f6:	000d2683          	lw	a3,0(s10)
200014fa:	872a                	mv	a4,a0
200014fc:	4781                	li	a5,0
200014fe:	4290                	lw	a2,0(a3)
20001500:	c35c                	sw	a5,4(a4)
20001502:	0785                	add	a5,a5,1
20001504:	c310                	sw	a2,0(a4)
20001506:	0691                	add	a3,a3,4
20001508:	0721                	add	a4,a4,8
2000150a:	fef41ae3          	bne	s0,a5,200014fe <encode+0x2de>
2000150e:	20000937          	lui	s2,0x20000
20001512:	08a90693          	add	a3,s2,138 # 2000008a <compare_tokens>
20001516:	4621                	li	a2,8
20001518:	85a2                	mv	a1,s0
2000151a:	0e80c0ef          	jal	2000d602 <qsort>
2000151e:	bb25                	j	20001256 <encode+0x36>
20001520:	85b2                	mv	a1,a2
20001522:	4701                	li	a4,0
20001524:	863e                	mv	a2,a5
20001526:	bf29                	j	20001440 <encode+0x220>
20001528:	200147b7          	lui	a5,0x20014
2000152c:	3647a683          	lw	a3,868(a5) # 20014364 <stderr>
20001530:	20014537          	lui	a0,0x20014
20001534:	4661                	li	a2,24
20001536:	4585                	li	a1,1
20001538:	bd050513          	add	a0,a0,-1072 # 20013bd0 <__clz_tab+0x188>
2000153c:	5a7090ef          	jal	2000b2e2 <fwrite>
20001540:	4505                	li	a0,1
20001542:	5cb070ef          	jal	2000930c <exit>
20001546:	56fd                	li	a3,-1
20001548:	b5b5                	j	200013b4 <encode+0x194>

2000154a <sample_argmax>:
2000154a:	4785                	li	a5,1
2000154c:	6118                	flw	fa4,0(a0)
2000154e:	02b7d263          	bge	a5,a1,20001572 <sample_argmax+0x28>
20001552:	00450793          	add	a5,a0,4
20001556:	4705                	li	a4,1
20001558:	4501                	li	a0,0
2000155a:	639c                	flw	fa5,0(a5)
2000155c:	0791                	add	a5,a5,4
2000155e:	a0f716d3          	flt.s	a3,fa4,fa5
20001562:	c681                	beqz	a3,2000156a <sample_argmax+0x20>
20001564:	20f78753          	fmv.s	fa4,fa5
20001568:	853a                	mv	a0,a4
2000156a:	0705                	add	a4,a4,1
2000156c:	fee597e3          	bne	a1,a4,2000155a <sample_argmax+0x10>
20001570:	8082                	ret
20001572:	4501                	li	a0,0
20001574:	8082                	ret

20001576 <sample_mult>:
20001576:	02b05263          	blez	a1,2000159a <sample_mult+0x24>
2000157a:	87aa                	mv	a5,a0
2000157c:	f00007d3          	fmv.w.x	fa5,zero
20001580:	4501                	li	a0,0
20001582:	a021                	j	2000158a <sample_mult+0x14>
20001584:	0505                	add	a0,a0,1
20001586:	00a58a63          	beq	a1,a0,2000159a <sample_mult+0x24>
2000158a:	6398                	flw	fa4,0(a5)
2000158c:	0791                	add	a5,a5,4
2000158e:	00e7f7d3          	fadd.s	fa5,fa5,fa4
20001592:	a0f51753          	flt.s	a4,fa0,fa5
20001596:	d77d                	beqz	a4,20001584 <sample_mult+0xe>
20001598:	8082                	ret
2000159a:	fff58513          	add	a0,a1,-1
2000159e:	8082                	ret

200015a0 <sample_topp>:
200015a0:	200147b7          	lui	a5,0x20014
200015a4:	0107a707          	flw	fa4,16(a5) # 20014010 <__clz_tab+0x5c8>
200015a8:	fff58793          	add	a5,a1,-1
200015ac:	d007f7d3          	fcvt.s.w	fa5,a5
200015b0:	08a77753          	fsub.s	fa4,fa4,fa0
200015b4:	1101                	add	sp,sp,-32
200015b6:	ca26                	sw	s1,20(sp)
200015b8:	ce06                	sw	ra,28(sp)
200015ba:	84b2                	mv	s1,a2
200015bc:	18f77753          	fdiv.s	fa4,fa4,fa5
200015c0:	0ab05c63          	blez	a1,20001678 <sample_topp+0xd8>
200015c4:	a422                	fsd	fs0,8(sp)
200015c6:	a026                	fsd	fs1,0(sp)
200015c8:	20a50453          	fmv.s	fs0,fa0
200015cc:	20b584d3          	fmv.s	fs1,fa1
200015d0:	cc22                	sw	s0,24(sp)
200015d2:	86aa                	mv	a3,a0
200015d4:	4701                	li	a4,0
200015d6:	4401                	li	s0,0
200015d8:	629c                	flw	fa5,0(a3)
200015da:	00341793          	sll	a5,s0,0x3
200015de:	97a6                	add	a5,a5,s1
200015e0:	a0f70853          	fle.s	a6,fa4,fa5
200015e4:	0691                	add	a3,a3,4
200015e6:	00080563          	beqz	a6,200015f0 <sample_topp+0x50>
200015ea:	c3d8                	sw	a4,4(a5)
200015ec:	e39c                	fsw	fa5,0(a5)
200015ee:	0405                	add	s0,s0,1
200015f0:	0705                	add	a4,a4,1
200015f2:	fee593e3          	bne	a1,a4,200015d8 <sample_topp+0x38>
200015f6:	200006b7          	lui	a3,0x20000
200015fa:	4621                	li	a2,8
200015fc:	07668693          	add	a3,a3,118 # 20000076 <compare>
20001600:	85a2                	mv	a1,s0
20001602:	8526                	mv	a0,s1
20001604:	7ff0b0ef          	jal	2000d602 <qsort>
20001608:	fff40613          	add	a2,s0,-1
2000160c:	08805163          	blez	s0,2000168e <sample_topp+0xee>
20001610:	f00007d3          	fmv.w.x	fa5,zero
20001614:	8726                	mv	a4,s1
20001616:	4781                	li	a5,0
20001618:	a021                	j	20001620 <sample_topp+0x80>
2000161a:	0785                	add	a5,a5,1
2000161c:	04f40263          	beq	s0,a5,20001660 <sample_topp+0xc0>
20001620:	6318                	flw	fa4,0(a4)
20001622:	0721                	add	a4,a4,8
20001624:	00e7f7d3          	fadd.s	fa5,fa5,fa4
20001628:	a0f416d3          	flt.s	a3,fs0,fa5
2000162c:	d6fd                	beqz	a3,2000161a <sample_topp+0x7a>
2000162e:	1097f7d3          	fmul.s	fa5,fa5,fs1
20001632:	f0000753          	fmv.w.x	fa4,zero
20001636:	86a6                	mv	a3,s1
20001638:	4701                	li	a4,0
2000163a:	a021                	j	20001642 <sample_topp+0xa2>
2000163c:	06a1                	add	a3,a3,8
2000163e:	02e7c363          	blt	a5,a4,20001664 <sample_topp+0xc4>
20001642:	6294                	flw	fa3,0(a3)
20001644:	0705                	add	a4,a4,1
20001646:	00d77753          	fadd.s	fa4,fa4,fa3
2000164a:	a0e795d3          	flt.s	a1,fa5,fa4
2000164e:	d5fd                	beqz	a1,2000163c <sample_topp+0x9c>
20001650:	4462                	lw	s0,24(sp)
20001652:	40f2                	lw	ra,28(sp)
20001654:	42c8                	lw	a0,4(a3)
20001656:	2422                	fld	fs0,8(sp)
20001658:	2482                	fld	fs1,0(sp)
2000165a:	44d2                	lw	s1,20(sp)
2000165c:	6105                	add	sp,sp,32
2000165e:	8082                	ret
20001660:	87b2                	mv	a5,a2
20001662:	b7f1                	j	2000162e <sample_topp+0x8e>
20001664:	4462                	lw	s0,24(sp)
20001666:	2422                	fld	fs0,8(sp)
20001668:	2482                	fld	fs1,0(sp)
2000166a:	078e                	sll	a5,a5,0x3
2000166c:	40f2                	lw	ra,28(sp)
2000166e:	94be                	add	s1,s1,a5
20001670:	40c8                	lw	a0,4(s1)
20001672:	44d2                	lw	s1,20(sp)
20001674:	6105                	add	sp,sp,32
20001676:	8082                	ret
20001678:	200006b7          	lui	a3,0x20000
2000167c:	07668693          	add	a3,a3,118 # 20000076 <compare>
20001680:	4621                	li	a2,8
20001682:	4581                	li	a1,0
20001684:	8526                	mv	a0,s1
20001686:	77d0b0ef          	jal	2000d602 <qsort>
2000168a:	57e1                	li	a5,-8
2000168c:	b7c5                	j	2000166c <sample_topp+0xcc>
2000168e:	4462                	lw	s0,24(sp)
20001690:	2422                	fld	fs0,8(sp)
20001692:	2482                	fld	fs1,0(sp)
20001694:	00361793          	sll	a5,a2,0x3
20001698:	bfd1                	j	2000166c <sample_topp+0xcc>

2000169a <sample.part.0>:
2000169a:	7179                	add	sp,sp,-48
2000169c:	ca56                	sw	s5,20(sp)
2000169e:	00052a83          	lw	s5,0(a0)
200016a2:	ce4e                	sw	s3,28(sp)
200016a4:	cc52                	sw	s4,24(sp)
200016a6:	d606                	sw	ra,44(sp)
200016a8:	8a2a                	mv	s4,a0
200016aa:	89ae                	mv	s3,a1
200016ac:	09505263          	blez	s5,20001730 <sample.part.0+0x96>
200016b0:	d04a                	sw	s2,32(sp)
200016b2:	002a9913          	sll	s2,s5,0x2
200016b6:	d422                	sw	s0,40(sp)
200016b8:	d226                	sw	s1,36(sp)
200016ba:	a422                	fsd	fs0,8(sp)
200016bc:	a026                	fsd	fs1,0(sp)
200016be:	842e                	mv	s0,a1
200016c0:	992e                	add	s2,s2,a1
200016c2:	87ae                	mv	a5,a1
200016c4:	639c                	flw	fa5,0(a5)
200016c6:	008a2707          	flw	fa4,8(s4)
200016ca:	0791                	add	a5,a5,4
200016cc:	18e7f7d3          	fdiv.s	fa5,fa5,fa4
200016d0:	fef7ae27          	fsw	fa5,-4(a5)
200016d4:	fef918e3          	bne	s2,a5,200016c4 <sample.part.0+0x2a>
200016d8:	4785                	li	a5,1
200016da:	0009a487          	flw	fs1,0(s3)
200016de:	00fa8d63          	beq	s5,a5,200016f8 <sample.part.0+0x5e>
200016e2:	00498793          	add	a5,s3,4
200016e6:	639c                	flw	fa5,0(a5)
200016e8:	0791                	add	a5,a5,4
200016ea:	a0f49753          	flt.s	a4,fs1,fa5
200016ee:	c319                	beqz	a4,200016f4 <sample.part.0+0x5a>
200016f0:	20f784d3          	fmv.s	fs1,fa5
200016f4:	fef919e3          	bne	s2,a5,200016e6 <sample.part.0+0x4c>
200016f8:	f0000453          	fmv.w.x	fs0,zero
200016fc:	84ce                	mv	s1,s3
200016fe:	6088                	flw	fa0,0(s1)
20001700:	0491                	add	s1,s1,4
20001702:	08957553          	fsub.s	fa0,fa0,fs1
20001706:	30c090ef          	jal	2000aa12 <expf>
2000170a:	fea4ae27          	fsw	fa0,-4(s1)
2000170e:	00a47453          	fadd.s	fs0,fs0,fa0
20001712:	fe9916e3          	bne	s2,s1,200016fe <sample.part.0+0x64>
20001716:	601c                	flw	fa5,0(s0)
20001718:	0411                	add	s0,s0,4
2000171a:	1887f7d3          	fdiv.s	fa5,fa5,fs0
2000171e:	fef42e27          	fsw	fa5,-4(s0)
20001722:	fe891ae3          	bne	s2,s0,20001716 <sample.part.0+0x7c>
20001726:	5422                	lw	s0,40(sp)
20001728:	5492                	lw	s1,36(sp)
2000172a:	5902                	lw	s2,32(sp)
2000172c:	2422                	fld	fs0,8(sp)
2000172e:	2482                	fld	fs1,0(sp)
20001730:	014a2703          	lw	a4,20(s4)
20001734:	010a2583          	lw	a1,16(s4)
20001738:	4f6ce637          	lui	a2,0x4f6ce
2000173c:	01471693          	sll	a3,a4,0x14
20001740:	00c5d793          	srl	a5,a1,0xc
20001744:	8fd5                	or	a5,a5,a3
20001746:	00c75693          	srl	a3,a4,0xc
2000174a:	8fad                	xor	a5,a5,a1
2000174c:	8eb9                	xor	a3,a3,a4
2000174e:	0077d593          	srl	a1,a5,0x7
20001752:	01969713          	sll	a4,a3,0x19
20001756:	8f4d                	or	a4,a4,a1
20001758:	01979513          	sll	a0,a5,0x19
2000175c:	8f35                	xor	a4,a4,a3
2000175e:	8d3d                	xor	a0,a0,a5
20001760:	00571693          	sll	a3,a4,0x5
20001764:	01b55793          	srl	a5,a0,0x1b
20001768:	8fd5                	or	a5,a5,a3
2000176a:	01b75593          	srl	a1,a4,0x1b
2000176e:	2545f6b7          	lui	a3,0x2545f
20001772:	8fa9                	xor	a5,a5,a0
20001774:	8db9                	xor	a1,a1,a4
20001776:	d1d60613          	add	a2,a2,-739 # 4f6cdd1d <dummy_file+0x1968b8dd>
2000177a:	49168693          	add	a3,a3,1169 # 2545f491 <checkpoint_data+0x543f051>
2000177e:	02d786b3          	mul	a3,a5,a3
20001782:	00fa2823          	sw	a5,16(s4)
20001786:	f00007d3          	fmv.w.x	fa5,zero
2000178a:	00ca2507          	flw	fa0,12(s4)
2000178e:	00ba2a23          	sw	a1,20(s4)
20001792:	a0f50553          	fle.s	a0,fa0,fa5
20001796:	02c58733          	mul	a4,a1,a2
2000179a:	02c7b7b3          	mulhu	a5,a5,a2
2000179e:	9736                	add	a4,a4,a3
200017a0:	97ba                	add	a5,a5,a4
200017a2:	83a1                	srl	a5,a5,0x8
200017a4:	d007f5d3          	fcvt.s.w	fa1,a5
200017a8:	200147b7          	lui	a5,0x20014
200017ac:	01c7a787          	flw	fa5,28(a5) # 2001401c <__clz_tab+0x5d4>
200017b0:	10f5f5d3          	fmul.s	fa1,fa1,fa5
200017b4:	e901                	bnez	a0,200017c4 <sample.part.0+0x12a>
200017b6:	200147b7          	lui	a5,0x20014
200017ba:	0107a787          	flw	fa5,16(a5) # 20014010 <__clz_tab+0x5c8>
200017be:	a0a787d3          	fle.s	a5,fa5,fa0
200017c2:	c3a1                	beqz	a5,20001802 <sample.part.0+0x168>
200017c4:	03505763          	blez	s5,200017f2 <sample.part.0+0x158>
200017c8:	f00007d3          	fmv.w.x	fa5,zero
200017cc:	85ce                	mv	a1,s3
200017ce:	4501                	li	a0,0
200017d0:	a021                	j	200017d8 <sample.part.0+0x13e>
200017d2:	0505                	add	a0,a0,1
200017d4:	01550f63          	beq	a0,s5,200017f2 <sample.part.0+0x158>
200017d8:	6198                	flw	fa4,0(a1)
200017da:	0591                	add	a1,a1,4
200017dc:	00e7f7d3          	fadd.s	fa5,fa5,fa4
200017e0:	a0f597d3          	flt.s	a5,fa1,fa5
200017e4:	d7fd                	beqz	a5,200017d2 <sample.part.0+0x138>
200017e6:	50b2                	lw	ra,44(sp)
200017e8:	49f2                	lw	s3,28(sp)
200017ea:	4a62                	lw	s4,24(sp)
200017ec:	4ad2                	lw	s5,20(sp)
200017ee:	6145                	add	sp,sp,48
200017f0:	8082                	ret
200017f2:	50b2                	lw	ra,44(sp)
200017f4:	49f2                	lw	s3,28(sp)
200017f6:	4a62                	lw	s4,24(sp)
200017f8:	fffa8513          	add	a0,s5,-1
200017fc:	4ad2                	lw	s5,20(sp)
200017fe:	6145                	add	sp,sp,48
20001800:	8082                	ret
20001802:	004a2603          	lw	a2,4(s4)
20001806:	50b2                	lw	ra,44(sp)
20001808:	4a62                	lw	s4,24(sp)
2000180a:	85d6                	mv	a1,s5
2000180c:	854e                	mv	a0,s3
2000180e:	4ad2                	lw	s5,20(sp)
20001810:	49f2                	lw	s3,28(sp)
20001812:	6145                	add	sp,sp,48
20001814:	b371                	j	200015a0 <sample_topp>

20001816 <build_sampler>:
20001816:	1141                	add	sp,sp,-16
20001818:	c422                	sw	s0,8(sp)
2000181a:	c606                	sw	ra,12(sp)
2000181c:	842a                	mv	s0,a0
2000181e:	c10c                	sw	a1,0(a0)
20001820:	e508                	fsw	fa0,8(a0)
20001822:	e54c                	fsw	fa1,12(a0)
20001824:	c910                	sw	a2,16(a0)
20001826:	c954                	sw	a3,20(a0)
20001828:	00359513          	sll	a0,a1,0x3
2000182c:	5e1070ef          	jal	2000960c <malloc>
20001830:	40b2                	lw	ra,12(sp)
20001832:	c048                	sw	a0,4(s0)
20001834:	4422                	lw	s0,8(sp)
20001836:	0141                	add	sp,sp,16
20001838:	8082                	ret

2000183a <free_sampler>:
2000183a:	4148                	lw	a0,4(a0)
2000183c:	3a10706f          	j	200093dc <free>

20001840 <random_u32>:
20001840:	4158                	lw	a4,4(a0)
20001842:	410c                	lw	a1,0(a0)
20001844:	4f6ce637          	lui	a2,0x4f6ce
20001848:	01471693          	sll	a3,a4,0x14
2000184c:	00c5d793          	srl	a5,a1,0xc
20001850:	8fd5                	or	a5,a5,a3
20001852:	00c75693          	srl	a3,a4,0xc
20001856:	8fad                	xor	a5,a5,a1
20001858:	8eb9                	xor	a3,a3,a4
2000185a:	0077d593          	srl	a1,a5,0x7
2000185e:	01969713          	sll	a4,a3,0x19
20001862:	8f4d                	or	a4,a4,a1
20001864:	01979813          	sll	a6,a5,0x19
20001868:	8f35                	xor	a4,a4,a3
2000186a:	00f84833          	xor	a6,a6,a5
2000186e:	00571693          	sll	a3,a4,0x5
20001872:	01b85793          	srl	a5,a6,0x1b
20001876:	8fd5                	or	a5,a5,a3
20001878:	01b75593          	srl	a1,a4,0x1b
2000187c:	2545f6b7          	lui	a3,0x2545f
20001880:	0107c7b3          	xor	a5,a5,a6
20001884:	8f2d                	xor	a4,a4,a1
20001886:	d1d60613          	add	a2,a2,-739 # 4f6cdd1d <dummy_file+0x1968b8dd>
2000188a:	49168693          	add	a3,a3,1169 # 2545f491 <checkpoint_data+0x543f051>
2000188e:	02d786b3          	mul	a3,a5,a3
20001892:	c11c                	sw	a5,0(a0)
20001894:	c158                	sw	a4,4(a0)
20001896:	02c705b3          	mul	a1,a4,a2
2000189a:	02c7b7b3          	mulhu	a5,a5,a2
2000189e:	00d58533          	add	a0,a1,a3
200018a2:	953e                	add	a0,a0,a5
200018a4:	8082                	ret

200018a6 <random_f32>:
200018a6:	4158                	lw	a4,4(a0)
200018a8:	410c                	lw	a1,0(a0)
200018aa:	4f6ce637          	lui	a2,0x4f6ce
200018ae:	01471693          	sll	a3,a4,0x14
200018b2:	00c5d793          	srl	a5,a1,0xc
200018b6:	8fd5                	or	a5,a5,a3
200018b8:	00c75693          	srl	a3,a4,0xc
200018bc:	8fad                	xor	a5,a5,a1
200018be:	8eb9                	xor	a3,a3,a4
200018c0:	0077d593          	srl	a1,a5,0x7
200018c4:	01969713          	sll	a4,a3,0x19
200018c8:	8f4d                	or	a4,a4,a1
200018ca:	01979813          	sll	a6,a5,0x19
200018ce:	8f35                	xor	a4,a4,a3
200018d0:	00f84833          	xor	a6,a6,a5
200018d4:	00571693          	sll	a3,a4,0x5
200018d8:	01b85793          	srl	a5,a6,0x1b
200018dc:	8fd5                	or	a5,a5,a3
200018de:	01b75593          	srl	a1,a4,0x1b
200018e2:	2545f6b7          	lui	a3,0x2545f
200018e6:	0107c7b3          	xor	a5,a5,a6
200018ea:	8db9                	xor	a1,a1,a4
200018ec:	d1d60613          	add	a2,a2,-739 # 4f6cdd1d <dummy_file+0x1968b8dd>
200018f0:	49168693          	add	a3,a3,1169 # 2545f491 <checkpoint_data+0x543f051>
200018f4:	02d786b3          	mul	a3,a5,a3
200018f8:	c11c                	sw	a5,0(a0)
200018fa:	c14c                	sw	a1,4(a0)
200018fc:	02c58733          	mul	a4,a1,a2
20001900:	02c7b7b3          	mulhu	a5,a5,a2
20001904:	9736                	add	a4,a4,a3
20001906:	97ba                	add	a5,a5,a4
20001908:	83a1                	srl	a5,a5,0x8
2000190a:	d007f553          	fcvt.s.w	fa0,a5
2000190e:	200147b7          	lui	a5,0x20014
20001912:	01c7a787          	flw	fa5,28(a5) # 2001401c <__clz_tab+0x5d4>
20001916:	10f57553          	fmul.s	fa0,fa0,fa5
2000191a:	8082                	ret

2000191c <sample>:
2000191c:	6518                	flw	fa4,8(a0)
2000191e:	f00007d3          	fmv.w.x	fa5,zero
20001922:	a0f726d3          	feq.s	a3,fa4,fa5
20001926:	c68d                	beqz	a3,20001950 <sample+0x34>
20001928:	4114                	lw	a3,0(a0)
2000192a:	4705                	li	a4,1
2000192c:	6198                	flw	fa4,0(a1)
2000192e:	02d75263          	bge	a4,a3,20001952 <sample+0x36>
20001932:	0591                	add	a1,a1,4
20001934:	4501                	li	a0,0
20001936:	4785                	li	a5,1
20001938:	619c                	flw	fa5,0(a1)
2000193a:	0591                	add	a1,a1,4
2000193c:	a0f71753          	flt.s	a4,fa4,fa5
20001940:	c701                	beqz	a4,20001948 <sample+0x2c>
20001942:	20f78753          	fmv.s	fa4,fa5
20001946:	853e                	mv	a0,a5
20001948:	0785                	add	a5,a5,1
2000194a:	fef697e3          	bne	a3,a5,20001938 <sample+0x1c>
2000194e:	8082                	ret
20001950:	b3a9                	j	2000169a <sample.part.0>
20001952:	4501                	li	a0,0
20001954:	8082                	ret

20001956 <time_in_ms>:
20001956:	1101                	add	sp,sp,-32
20001958:	858a                	mv	a1,sp
2000195a:	4501                	li	a0,0
2000195c:	ce06                	sw	ra,28(sp)
2000195e:	4720c0ef          	jal	2000ddd0 <__clock_gettime>
20001962:	47a2                	lw	a5,8(sp)
20001964:	000f4737          	lui	a4,0xf4
20001968:	24070713          	add	a4,a4,576 # f4240 <_start-0x1ff0bdc0>
2000196c:	02e7c7b3          	div	a5,a5,a4
20001970:	4702                	lw	a4,0(sp)
20001972:	3e800513          	li	a0,1000
20001976:	40f2                	lw	ra,28(sp)
20001978:	6105                	add	sp,sp,32
2000197a:	02e50533          	mul	a0,a0,a4
2000197e:	953e                	add	a0,a0,a5
20001980:	8082                	ret

20001982 <generate>:
20001982:	7135                	add	sp,sp,-160
20001984:	672078b7          	lui	a7,0x67207
20001988:	72657837          	lui	a6,0x72657
2000198c:	006577b7          	lui	a5,0x657
20001990:	cd22                	sw	s0,152(sp)
20001992:	dae6                	sw	s9,116(sp)
20001994:	e6988893          	add	a7,a7,-407 # 67206e69 <dummy_file+0x311c4a29>
20001998:	8caa                	mv	s9,a0
2000199a:	e6580813          	add	a6,a6,-411 # 72656e65 <dummy_file+0x3c614a25>
2000199e:	46178793          	add	a5,a5,1121 # 657461 <_start-0x1f9a8b9f>
200019a2:	8436                	mv	s0,a3
200019a4:	1048                	add	a0,sp,36
200019a6:	c15a                	sw	s6,128(sp)
200019a8:	dce2                	sw	s8,120(sp)
200019aa:	cf06                	sw	ra,156(sp)
200019ac:	dede                	sw	s7,124(sp)
200019ae:	c466                	sw	s9,8(sp)
200019b0:	8b2e                	mv	s6,a1
200019b2:	c832                	sw	a2,16(sp)
200019b4:	8c3a                	mv	s8,a4
200019b6:	d246                	sw	a7,36(sp)
200019b8:	d442                	sw	a6,40(sp)
200019ba:	d63e                	sw	a5,44(sp)
200019bc:	d802                	sw	zero,48(sp)
200019be:	da02                	sw	zero,52(sp)
200019c0:	4b5000ef          	jal	20002674 <print_s>
200019c4:	22040f63          	beqz	s0,20001c02 <generate+0x280>
200019c8:	8522                	mv	a0,s0
200019ca:	d002                	sw	zero,32(sp)
200019cc:	2660c0ef          	jal	2000dc32 <strlen>
200019d0:	050d                	add	a0,a0,3
200019d2:	050a                	sll	a0,a0,0x2
200019d4:	439070ef          	jal	2000960c <malloc>
200019d8:	872a                	mv	a4,a0
200019da:	ce2a                	sw	a0,28(sp)
200019dc:	101c                	add	a5,sp,32
200019de:	4681                	li	a3,0
200019e0:	4605                	li	a2,1
200019e2:	85a2                	mv	a1,s0
200019e4:	855a                	mv	a0,s6
200019e6:	83bff0ef          	jal	20001220 <encode>
200019ea:	5b82                	lw	s7,32(sp)
200019ec:	23705c63          	blez	s7,20001c24 <generate+0x2a2>
200019f0:	47f2                	lw	a5,28(sp)
200019f2:	0007ac83          	lw	s9,0(a5)
200019f6:	21805e63          	blez	s8,20001c12 <generate+0x290>
200019fa:	c74e                	sw	s3,140(sp)
200019fc:	4522                	lw	a0,8(sp)
200019fe:	00478993          	add	s3,a5,4
20001a02:	183c                	add	a5,sp,56
20001a04:	000f4737          	lui	a4,0xf4
20001a08:	4401                	li	s0,0
20001a0a:	c23e                	sw	a5,4(sp)
20001a0c:	014b0793          	add	a5,s6,20
20001a10:	ca3e                	sw	a5,20(sp)
20001a12:	8622                	mv	a2,s0
20001a14:	24070793          	add	a5,a4,576 # f4240 <_start-0x1ff0bdc0>
20001a18:	85e6                	mv	a1,s9
20001a1a:	1bfd                	add	s7,s7,-1
20001a1c:	cb26                	sw	s1,148(sp)
20001a1e:	c94a                	sw	s2,144(sp)
20001a20:	c552                	sw	s4,136(sp)
20001a22:	d8ea                	sw	s10,112(sp)
20001a24:	aca2                	fsd	fs0,88(sp)
20001a26:	c356                	sw	s5,132(sp)
20001a28:	d6ee                	sw	s11,108(sp)
20001a2a:	cc3e                	sw	a5,24(sp)
20001a2c:	f0000453          	fmv.w.x	fs0,zero
20001a30:	4a01                	li	s4,0
20001a32:	4485                	li	s1,1
20001a34:	20014d37          	lui	s10,0x20014
20001a38:	cd1fe0ef          	jal	20000708 <forward>
20001a3c:	00140913          	add	s2,s0,1
20001a40:	05745963          	bge	s0,s7,20001a92 <generate+0x110>
20001a44:	0009aa83          	lw	s5,0(s3)
20001a48:	069a8f63          	beq	s5,s1,20001ac6 <generate+0x144>
20001a4c:	002a9613          	sll	a2,s5,0x2
20001a50:	000b2783          	lw	a5,0(s6)
20001a54:	97b2                	add	a5,a5,a2
20001a56:	0007ad83          	lw	s11,0(a5)
20001a5a:	129c8263          	beq	s9,s1,20001b7e <generate+0x1fc>
20001a5e:	4612                	lw	a2,4(sp)
20001a60:	bc4d0593          	add	a1,s10,-1084 # 20013bc4 <__clz_tab+0x17c>
20001a64:	856e                	mv	a0,s11
20001a66:	16d090ef          	jal	2000b3d2 <sscanf>
20001a6a:	12950963          	beq	a0,s1,20001b9c <generate+0x21a>
20001a6e:	120d9d63          	bnez	s11,20001ba8 <generate+0x226>
20001a72:	160a0163          	beqz	s4,20001bd4 <generate+0x252>
20001a76:	0991                	add	s3,s3,4
20001a78:	052c0763          	beq	s8,s2,20001ac6 <generate+0x144>
20001a7c:	4522                	lw	a0,8(sp)
20001a7e:	844a                	mv	s0,s2
20001a80:	8cd6                	mv	s9,s5
20001a82:	8622                	mv	a2,s0
20001a84:	85e6                	mv	a1,s9
20001a86:	c83fe0ef          	jal	20000708 <forward>
20001a8a:	00140913          	add	s2,s0,1
20001a8e:	fb744be3          	blt	s0,s7,20001a44 <generate+0xc2>
20001a92:	4742                	lw	a4,16(sp)
20001a94:	671c                	flw	fa5,8(a4)
20001a96:	a087a7d3          	feq.s	a5,fa5,fs0
20001a9a:	14078f63          	beqz	a5,20001bf8 <generate+0x276>
20001a9e:	430c                	lw	a1,0(a4)
20001aa0:	6118                	flw	fa4,0(a0)
20001aa2:	16b4d563          	bge	s1,a1,20001c0c <generate+0x28a>
20001aa6:	0511                	add	a0,a0,4
20001aa8:	4a81                	li	s5,0
20001aaa:	4785                	li	a5,1
20001aac:	611c                	flw	fa5,0(a0)
20001aae:	a0f71653          	flt.s	a2,fa4,fa5
20001ab2:	c601                	beqz	a2,20001aba <generate+0x138>
20001ab4:	20f78753          	fmv.s	fa4,fa5
20001ab8:	8abe                	mv	s5,a5
20001aba:	0785                	add	a5,a5,1
20001abc:	0511                	add	a0,a0,4
20001abe:	feb797e3          	bne	a5,a1,20001aac <generate+0x12a>
20001ac2:	f89a95e3          	bne	s5,s1,20001a4c <generate+0xca>
20001ac6:	20014537          	lui	a0,0x20014
20001aca:	f5c50513          	add	a0,a0,-164 # 20013f5c <__clz_tab+0x514>
20001ace:	3a7000ef          	jal	20002674 <print_s>
20001ad2:	4785                	li	a5,1
20001ad4:	04f90e63          	beq	s2,a5,20001b30 <generate+0x1ae>
20001ad8:	4592                	lw	a1,4(sp)
20001ada:	4501                	li	a0,0
20001adc:	2f40c0ef          	jal	2000ddd0 <__clock_gettime>
20001ae0:	4706                	lw	a4,64(sp)
20001ae2:	000f47b7          	lui	a5,0xf4
20001ae6:	24078793          	add	a5,a5,576 # f4240 <_start-0x1ff0bdc0>
20001aea:	02f74733          	div	a4,a4,a5
20001aee:	56e2                	lw	a3,56(sp)
20001af0:	200147b7          	lui	a5,0x20014
20001af4:	3647a503          	lw	a0,868(a5) # 20014364 <stderr>
20001af8:	3e800793          	li	a5,1000
20001afc:	d20407d3          	fcvt.d.w	fa5,s0
20001b00:	200145b7          	lui	a1,0x20014
20001b04:	c2c58593          	add	a1,a1,-980 # 20013c2c <__clz_tab+0x1e4>
20001b08:	02d787b3          	mul	a5,a5,a3
20001b0c:	97ba                	add	a5,a5,a4
20001b0e:	414787b3          	sub	a5,a5,s4
20001b12:	d2078753          	fcvt.d.w	fa4,a5
20001b16:	200147b7          	lui	a5,0x20014
20001b1a:	1ae7f7d3          	fdiv.d	fa5,fa5,fa4
20001b1e:	0487b707          	fld	fa4,72(a5) # 20014048 <__clz_tab+0x600>
20001b22:	12e7f7d3          	fmul.d	fa5,fa5,fa4
20001b26:	a43e                	fsd	fa5,8(sp)
20001b28:	4622                	lw	a2,8(sp)
20001b2a:	46b2                	lw	a3,12(sp)
20001b2c:	6e6090ef          	jal	2000b212 <fprintf>
20001b30:	44da                	lw	s1,148(sp)
20001b32:	494a                	lw	s2,144(sp)
20001b34:	49ba                	lw	s3,140(sp)
20001b36:	4a2a                	lw	s4,136(sp)
20001b38:	4a9a                	lw	s5,132(sp)
20001b3a:	5d46                	lw	s10,112(sp)
20001b3c:	5db6                	lw	s11,108(sp)
20001b3e:	2466                	fld	fs0,88(sp)
20001b40:	4572                	lw	a0,28(sp)
20001b42:	09b070ef          	jal	200093dc <free>
20001b46:	4512                	lw	a0,4(sp)
20001b48:	207476b7          	lui	a3,0x20747
20001b4c:	656e6737          	lui	a4,0x656e6
20001b50:	657467b7          	lui	a5,0x65746
20001b54:	56f68693          	add	a3,a3,1391 # 2074756f <checkpoint_data+0x72712f>
20001b58:	56770713          	add	a4,a4,1383 # 656e6567 <dummy_file+0x2f6a4127>
20001b5c:	17278793          	add	a5,a5,370 # 65746172 <dummy_file+0x2f703d32>
20001b60:	dc36                	sw	a3,56(sp)
20001b62:	de3a                	sw	a4,60(sp)
20001b64:	c0be                	sw	a5,64(sp)
20001b66:	c282                	sw	zero,68(sp)
20001b68:	c482                	sw	zero,72(sp)
20001b6a:	30b000ef          	jal	20002674 <print_s>
20001b6e:	40fa                	lw	ra,156(sp)
20001b70:	446a                	lw	s0,152(sp)
20001b72:	4b0a                	lw	s6,128(sp)
20001b74:	5bf6                	lw	s7,124(sp)
20001b76:	5c66                	lw	s8,120(sp)
20001b78:	5cd6                	lw	s9,116(sp)
20001b7a:	610d                	add	sp,sp,160
20001b7c:	8082                	ret
20001b7e:	000dc603          	lbu	a2,0(s11)
20001b82:	02000693          	li	a3,32
20001b86:	00d61363          	bne	a2,a3,20001b8c <generate+0x20a>
20001b8a:	0d85                	add	s11,s11,1
20001b8c:	4612                	lw	a2,4(sp)
20001b8e:	bc4d0593          	add	a1,s10,-1084
20001b92:	856e                	mv	a0,s11
20001b94:	03f090ef          	jal	2000b3d2 <sscanf>
20001b98:	00951863          	bne	a0,s1,20001ba8 <generate+0x226>
20001b9c:	03814783          	lbu	a5,56(sp)
20001ba0:	4752                	lw	a4,20(sp)
20001ba2:	0786                	sll	a5,a5,0x1
20001ba4:	00f70db3          	add	s11,a4,a5
20001ba8:	000dc683          	lbu	a3,0(s11)
20001bac:	ec0683e3          	beqz	a3,20001a72 <generate+0xf0>
20001bb0:	001dc603          	lbu	a2,1(s11)
20001bb4:	ea19                	bnez	a2,20001bca <generate+0x248>
20001bb6:	fe068613          	add	a2,a3,-32
20001bba:	05e00793          	li	a5,94
20001bbe:	00c7f663          	bgeu	a5,a2,20001bca <generate+0x248>
20001bc2:	16dd                	add	a3,a3,-9
20001bc4:	4791                	li	a5,4
20001bc6:	ead7e6e3          	bltu	a5,a3,20001a72 <generate+0xf0>
20001bca:	856e                	mv	a0,s11
20001bcc:	2a9000ef          	jal	20002674 <print_s>
20001bd0:	ea0a13e3          	bnez	s4,20001a76 <generate+0xf4>
20001bd4:	4592                	lw	a1,4(sp)
20001bd6:	4501                	li	a0,0
20001bd8:	3e800a13          	li	s4,1000
20001bdc:	1f40c0ef          	jal	2000ddd0 <__clock_gettime>
20001be0:	4786                	lw	a5,64(sp)
20001be2:	4762                	lw	a4,24(sp)
20001be4:	56e2                	lw	a3,56(sp)
20001be6:	0991                	add	s3,s3,4
20001be8:	02e7c7b3          	div	a5,a5,a4
20001bec:	02da0a33          	mul	s4,s4,a3
20001bf0:	9a3e                	add	s4,s4,a5
20001bf2:	e92c15e3          	bne	s8,s2,20001a7c <generate+0xfa>
20001bf6:	bdc1                	j	20001ac6 <generate+0x144>
20001bf8:	85aa                	mv	a1,a0
20001bfa:	4542                	lw	a0,16(sp)
20001bfc:	3c79                	jal	2000169a <sample.part.0>
20001bfe:	8aaa                	mv	s5,a0
20001c00:	b5a1                	j	20001a48 <generate+0xc6>
20001c02:	20014437          	lui	s0,0x20014
20001c06:	f8c40413          	add	s0,s0,-116 # 20013f8c <__clz_tab+0x544>
20001c0a:	bb7d                	j	200019c8 <generate+0x46>
20001c0c:	4601                	li	a2,0
20001c0e:	4a81                	li	s5,0
20001c10:	b581                	j	20001a50 <generate+0xce>
20001c12:	20014537          	lui	a0,0x20014
20001c16:	f5c50513          	add	a0,a0,-164 # 20013f5c <__clz_tab+0x514>
20001c1a:	25b000ef          	jal	20002674 <print_s>
20001c1e:	183c                	add	a5,sp,56
20001c20:	c23e                	sw	a5,4(sp)
20001c22:	bf39                	j	20001b40 <generate+0x1be>
20001c24:	200147b7          	lui	a5,0x20014
20001c28:	3647a683          	lw	a3,868(a5) # 20014364 <stderr>
20001c2c:	20014537          	lui	a0,0x20014
20001c30:	03500613          	li	a2,53
20001c34:	4585                	li	a1,1
20001c36:	bf450513          	add	a0,a0,-1036 # 20013bf4 <__clz_tab+0x1ac>
20001c3a:	cb26                	sw	s1,148(sp)
20001c3c:	c94a                	sw	s2,144(sp)
20001c3e:	c74e                	sw	s3,140(sp)
20001c40:	c552                	sw	s4,136(sp)
20001c42:	c356                	sw	s5,132(sp)
20001c44:	d8ea                	sw	s10,112(sp)
20001c46:	d6ee                	sw	s11,108(sp)
20001c48:	aca2                	fsd	fs0,88(sp)
20001c4a:	698090ef          	jal	2000b2e2 <fwrite>
20001c4e:	4505                	li	a0,1
20001c50:	6bc070ef          	jal	2000930c <exit>

20001c54 <read_stdin>:
20001c54:	1141                	add	sp,sp,-16
20001c56:	c422                	sw	s0,8(sp)
20001c58:	842e                	mv	s0,a1
20001c5a:	85aa                	mv	a1,a0
20001c5c:	20014537          	lui	a0,0x20014
20001c60:	c4050513          	add	a0,a0,-960 # 20013c40 <__clz_tab+0x1f8>
20001c64:	c226                	sw	s1,4(sp)
20001c66:	c606                	sw	ra,12(sp)
20001c68:	84b2                	mv	s1,a2
20001c6a:	718090ef          	jal	2000b382 <printf>
20001c6e:	200147b7          	lui	a5,0x20014
20001c72:	3687a603          	lw	a2,872(a5) # 20014368 <stdin>
20001c76:	85a6                	mv	a1,s1
20001c78:	8522                	mv	a0,s0
20001c7a:	476090ef          	jal	2000b0f0 <fgets>
20001c7e:	cd01                	beqz	a0,20001c96 <read_stdin+0x42>
20001c80:	8522                	mv	a0,s0
20001c82:	7b10b0ef          	jal	2000dc32 <strlen>
20001c86:	c901                	beqz	a0,20001c96 <read_stdin+0x42>
20001c88:	157d                	add	a0,a0,-1
20001c8a:	942a                	add	s0,s0,a0
20001c8c:	00044703          	lbu	a4,0(s0)
20001c90:	47a9                	li	a5,10
20001c92:	00f70763          	beq	a4,a5,20001ca0 <read_stdin+0x4c>
20001c96:	40b2                	lw	ra,12(sp)
20001c98:	4422                	lw	s0,8(sp)
20001c9a:	4492                	lw	s1,4(sp)
20001c9c:	0141                	add	sp,sp,16
20001c9e:	8082                	ret
20001ca0:	00040023          	sb	zero,0(s0)
20001ca4:	40b2                	lw	ra,12(sp)
20001ca6:	4422                	lw	s0,8(sp)
20001ca8:	4492                	lw	s1,4(sp)
20001caa:	0141                	add	sp,sp,16
20001cac:	8082                	ret

20001cae <chat>:
20001cae:	81010113          	add	sp,sp,-2032
20001cb2:	7d712623          	sw	s7,1996(sp)
20001cb6:	8bbe                	mv	s7,a5
20001cb8:	6785                	lui	a5,0x1
20001cba:	7e812423          	sw	s0,2024(sp)
20001cbe:	7e912223          	sw	s1,2020(sp)
20001cc2:	7d412c23          	sw	s4,2008(sp)
20001cc6:	7d612823          	sw	s6,2000(sp)
20001cca:	7da12023          	sw	s10,1984(sp)
20001cce:	7e112623          	sw	ra,2028(sp)
20001cd2:	7f212023          	sw	s2,2016(sp)
20001cd6:	7d312e23          	sw	s3,2012(sp)
20001cda:	7d512a23          	sw	s5,2004(sp)
20001cde:	7d812423          	sw	s8,1992(sp)
20001ce2:	7d912223          	sw	s9,1988(sp)
20001ce6:	7bb12e23          	sw	s11,1980(sp)
20001cea:	7a813427          	fsd	fs0,1960(sp)
20001cee:	787d                	lui	a6,0xfffff
20001cf0:	712d                	add	sp,sp,-288
20001cf2:	8b078793          	add	a5,a5,-1872 # 8b0 <_start-0x1ffff750>
20001cf6:	88aa                	mv	a7,a0
20001cf8:	97c2                	add	a5,a5,a6
20001cfa:	6505                	lui	a0,0x1
20001cfc:	843a                	mv	s0,a4
20001cfe:	0818                	add	a4,sp,16
20001d00:	97ba                	add	a5,a5,a4
20001d02:	20050513          	add	a0,a0,512 # 1200 <_start-0x1fffee00>
20001d06:	c246                	sw	a7,4(sp)
20001d08:	8d2e                	mv	s10,a1
20001d0a:	8a32                	mv	s4,a2
20001d0c:	84b6                	mv	s1,a3
20001d0e:	c03e                	sw	a5,0(sp)
20001d10:	7407aa23          	sw	zero,1876(a5)
20001d14:	0f9070ef          	jal	2000960c <malloc>
20001d18:	8b2a                	mv	s6,a0
20001d1a:	43705b63          	blez	s7,20002150 <chat+0x4a2>
20001d1e:	3c040763          	beqz	s0,200020ec <chat+0x43e>
20001d22:	757d                	lui	a0,0xfffff
20001d24:	6785                	lui	a5,0x1
20001d26:	78050513          	add	a0,a0,1920 # fffff780 <dummy_file+0xc9fbd340>
20001d2a:	8b078793          	add	a5,a5,-1872 # 8b0 <_start-0x1ffff750>
20001d2e:	97aa                	add	a5,a5,a0
20001d30:	0818                	add	a4,sp,16
20001d32:	85a2                	mv	a1,s0
20001d34:	00e78533          	add	a0,a5,a4
20001d38:	6e50b0ef          	jal	2000dc1c <strcpy>
20001d3c:	2c048163          	beqz	s1,20001ffe <chat+0x350>
20001d40:	24010a93          	add	s5,sp,576
20001d44:	85a6                	mv	a1,s1
20001d46:	8556                	mv	a0,s5
20001d48:	6d50b0ef          	jal	2000dc1c <strcpy>
20001d4c:	6705                	lui	a4,0x1
20001d4e:	77fd                	lui	a5,0xfffff
20001d50:	8b070713          	add	a4,a4,-1872 # 8b0 <_start-0x1ffff750>
20001d54:	973e                	add	a4,a4,a5
20001d56:	081c                	add	a5,sp,16
20001d58:	97ba                	add	a5,a5,a4
20001d5a:	c03e                	sw	a5,0(sp)
20001d5c:	7807c783          	lbu	a5,1920(a5) # fffff780 <dummy_file+0xc9fbd340>
20001d60:	2e079663          	bnez	a5,2000204c <chat+0x39e>
20001d64:	200147b7          	lui	a5,0x20014
20001d68:	c43e                	sw	a5,8(sp)
20001d6a:	200147b7          	lui	a5,0x20014
20001d6e:	4401                	li	s0,0
20001d70:	44010c93          	add	s9,sp,1088
20001d74:	c63e                	sw	a5,12(sp)
20001d76:	6485                	lui	s1,0x1
20001d78:	767d                	lui	a2,0xfffff
20001d7a:	8b048513          	add	a0,s1,-1872 # 8b0 <_start-0x1ffff750>
20001d7e:	9532                	add	a0,a0,a2
20001d80:	0810                	add	a2,sp,16
20001d82:	962a                	add	a2,a2,a0
20001d84:	200147b7          	lui	a5,0x20014
20001d88:	c7c78793          	add	a5,a5,-900 # 20013c7c <__clz_tab+0x234>
20001d8c:	c032                	sw	a2,0(sp)
20001d8e:	0007a883          	lw	a7,0(a5)
20001d92:	0047a803          	lw	a6,4(a5)
20001d96:	4794                	lw	a3,8(a5)
20001d98:	47d8                	lw	a4,12(a5)
20001d9a:	8b048513          	add	a0,s1,-1872
20001d9e:	0107d783          	lhu	a5,16(a5)
20001da2:	4482                	lw	s1,0(sp)
20001da4:	75fd                	lui	a1,0xfffff
20001da6:	75858593          	add	a1,a1,1880 # fffff758 <dummy_file+0xc9fbd318>
20001daa:	952e                	add	a0,a0,a1
20001dac:	080c                	add	a1,sp,16
20001dae:	95aa                	add	a1,a1,a0
20001db0:	8656                	mv	a2,s5
20001db2:	8566                	mv	a0,s9
20001db4:	7514ac23          	sw	a7,1880(s1)
20001db8:	7504ae23          	sw	a6,1884(s1)
20001dbc:	76d4a023          	sw	a3,1888(s1)
20001dc0:	76e4a223          	sw	a4,1892(s1)
20001dc4:	76f49423          	sh	a5,1896(s1)
20001dc8:	5e8090ef          	jal	2000b3b0 <sprintf>
20001dcc:	6485                	lui	s1,0x1
20001dce:	77fd                	lui	a5,0xfffff
20001dd0:	75478793          	add	a5,a5,1876 # fffff754 <dummy_file+0xc9fbd314>
20001dd4:	8b048713          	add	a4,s1,-1872 # 8b0 <_start-0x1ffff750>
20001dd8:	973e                	add	a4,a4,a5
20001dda:	081c                	add	a5,sp,16
20001ddc:	97ba                	add	a5,a5,a4
20001dde:	4681                	li	a3,0
20001de0:	875a                	mv	a4,s6
20001de2:	4605                	li	a2,1
20001de4:	85e6                	mv	a1,s9
20001de6:	856a                	mv	a0,s10
20001de8:	c38ff0ef          	jal	20001220 <encode>
20001dec:	47b2                	lw	a5,12(sp)
20001dee:	f0000453          	fmv.w.x	fs0,zero
20001df2:	4c09                	li	s8,2
20001df4:	c6878513          	add	a0,a5,-920
20001df8:	58a090ef          	jal	2000b382 <printf>
20001dfc:	77fd                	lui	a5,0xfffff
20001dfe:	8b048713          	add	a4,s1,-1872
20001e02:	973e                	add	a4,a4,a5
20001e04:	081c                	add	a5,sp,16
20001e06:	97ba                	add	a5,a5,a4
20001e08:	7547a983          	lw	s3,1876(a5) # fffff754 <dummy_file+0xc9fbd314>
20001e0c:	c03e                	sw	a5,0(sp)
20001e0e:	4481                	li	s1,0
20001e10:	0134d863          	bge	s1,s3,20001e20 <chat+0x172>
20001e14:	00249793          	sll	a5,s1,0x2
20001e18:	97da                	add	a5,a5,s6
20001e1a:	0007a903          	lw	s2,0(a5)
20001e1e:	0485                	add	s1,s1,1
20001e20:	4512                	lw	a0,4(sp)
20001e22:	8622                	mv	a2,s0
20001e24:	85ca                	mv	a1,s2
20001e26:	8e3fe0ef          	jal	20000708 <forward>
20001e2a:	008a2787          	flw	fa5,8(s4)
20001e2e:	85aa                	mv	a1,a0
20001e30:	0405                	add	s0,s0,1
20001e32:	a087a7d3          	feq.s	a5,fa5,fs0
20001e36:	cfc1                	beqz	a5,20001ece <chat+0x220>
20001e38:	000a2603          	lw	a2,0(s4)
20001e3c:	4705                	li	a4,1
20001e3e:	6118                	flw	fa4,0(a0)
20001e40:	00450593          	add	a1,a0,4
20001e44:	4d81                	li	s11,0
20001e46:	4785                	li	a5,1
20001e48:	0ec75763          	bge	a4,a2,20001f36 <chat+0x288>
20001e4c:	619c                	flw	fa5,0(a1)
20001e4e:	0591                	add	a1,a1,4
20001e50:	a0f71753          	flt.s	a4,fa4,fa5
20001e54:	c701                	beqz	a4,20001e5c <chat+0x1ae>
20001e56:	20f78753          	fmv.s	fa4,fa5
20001e5a:	8dbe                	mv	s11,a5
20001e5c:	0785                	add	a5,a5,1
20001e5e:	fef617e3          	bne	a2,a5,20001e4c <chat+0x19e>
20001e62:	4789                	li	a5,2
20001e64:	0734cc63          	blt	s1,s3,20001edc <chat+0x22e>
20001e68:	002d9613          	sll	a2,s11,0x2
20001e6c:	0cfd9863          	bne	s11,a5,20001f3c <chat+0x28e>
20001e70:	47a2                	lw	a5,8(sp)
20001e72:	4d89                	li	s11,2
20001e74:	f5c78513          	add	a0,a5,-164
20001e78:	50a090ef          	jal	2000b382 <printf>
20001e7c:	068b8463          	beq	s7,s0,20001ee4 <chat+0x236>
20001e80:	0b891963          	bne	s2,s8,20001f32 <chat+0x284>
20001e84:	200145b7          	lui	a1,0x20014
20001e88:	20014537          	lui	a0,0x20014
20001e8c:	c7458593          	add	a1,a1,-908 # 20013c74 <__clz_tab+0x22c>
20001e90:	c4050513          	add	a0,a0,-960 # 20013c40 <__clz_tab+0x1f8>
20001e94:	4ee090ef          	jal	2000b382 <printf>
20001e98:	200147b7          	lui	a5,0x20014
20001e9c:	3687a603          	lw	a2,872(a5) # 20014368 <stdin>
20001ea0:	20000593          	li	a1,512
20001ea4:	8556                	mv	a0,s5
20001ea6:	24a090ef          	jal	2000b0f0 <fgets>
20001eaa:	c509                	beqz	a0,20001eb4 <chat+0x206>
20001eac:	8556                	mv	a0,s5
20001eae:	5850b0ef          	jal	2000dc32 <strlen>
20001eb2:	e119                	bnez	a0,20001eb8 <chat+0x20a>
20001eb4:	896e                	mv	s2,s11
20001eb6:	b5c1                	j	20001d76 <chat+0xc8>
20001eb8:	157d                	add	a0,a0,-1
20001eba:	9556                	add	a0,a0,s5
20001ebc:	00054703          	lbu	a4,0(a0)
20001ec0:	47a9                	li	a5,10
20001ec2:	fef719e3          	bne	a4,a5,20001eb4 <chat+0x206>
20001ec6:	00050023          	sb	zero,0(a0)
20001eca:	896e                	mv	s2,s11
20001ecc:	b56d                	j	20001d76 <chat+0xc8>
20001ece:	8552                	mv	a0,s4
20001ed0:	fcaff0ef          	jal	2000169a <sample.part.0>
20001ed4:	8daa                	mv	s11,a0
20001ed6:	4789                	li	a5,2
20001ed8:	f934d8e3          	bge	s1,s3,20001e68 <chat+0x1ba>
20001edc:	f8fd8ae3          	beq	s11,a5,20001e70 <chat+0x1c2>
20001ee0:	fa8b90e3          	bne	s7,s0,20001e80 <chat+0x1d2>
20001ee4:	47a2                	lw	a5,8(sp)
20001ee6:	f5c78513          	add	a0,a5,-164
20001eea:	498090ef          	jal	2000b382 <printf>
20001eee:	6115                	add	sp,sp,288
20001ef0:	7ec12083          	lw	ra,2028(sp)
20001ef4:	7e812403          	lw	s0,2024(sp)
20001ef8:	7e412483          	lw	s1,2020(sp)
20001efc:	7e012903          	lw	s2,2016(sp)
20001f00:	7dc12983          	lw	s3,2012(sp)
20001f04:	7d812a03          	lw	s4,2008(sp)
20001f08:	7d412a83          	lw	s5,2004(sp)
20001f0c:	7cc12b83          	lw	s7,1996(sp)
20001f10:	7c812c03          	lw	s8,1992(sp)
20001f14:	7c412c83          	lw	s9,1988(sp)
20001f18:	7c012d03          	lw	s10,1984(sp)
20001f1c:	7bc12d83          	lw	s11,1980(sp)
20001f20:	7a813407          	fld	fs0,1960(sp)
20001f24:	855a                	mv	a0,s6
20001f26:	7d012b03          	lw	s6,2000(sp)
20001f2a:	7f010113          	add	sp,sp,2032
20001f2e:	4ae0706f          	j	200093dc <free>
20001f32:	896e                	mv	s2,s11
20001f34:	bdf1                	j	20001e10 <chat+0x162>
20001f36:	f534c3e3          	blt	s1,s3,20001e7c <chat+0x1ce>
20001f3a:	4601                	li	a2,0
20001f3c:	000d2783          	lw	a5,0(s10)
20001f40:	4705                	li	a4,1
20001f42:	97b2                	add	a5,a5,a2
20001f44:	439c                	lw	a5,0(a5)
20001f46:	04e90063          	beq	s2,a4,20001f86 <chat+0x2d8>
20001f4a:	767d                	lui	a2,0xfffff
20001f4c:	6705                	lui	a4,0x1
20001f4e:	75860613          	add	a2,a2,1880 # fffff758 <dummy_file+0xc9fbd318>
20001f52:	8b070713          	add	a4,a4,-1872 # 8b0 <_start-0x1ffff750>
20001f56:	9732                	add	a4,a4,a2
20001f58:	0814                	add	a3,sp,16
20001f5a:	200145b7          	lui	a1,0x20014
20001f5e:	00d70633          	add	a2,a4,a3
20001f62:	bc458593          	add	a1,a1,-1084 # 20013bc4 <__clz_tab+0x17c>
20001f66:	853e                	mv	a0,a5
20001f68:	c03e                	sw	a5,0(sp)
20001f6a:	468090ef          	jal	2000b3d2 <sscanf>
20001f6e:	4705                	li	a4,1
20001f70:	04e50663          	beq	a0,a4,20001fbc <chat+0x30e>
20001f74:	4782                	lw	a5,0(sp)
20001f76:	e3ad                	bnez	a5,20001fd8 <chat+0x32a>
20001f78:	200147b7          	lui	a5,0x20014
20001f7c:	36c7a503          	lw	a0,876(a5) # 2001436c <stdout>
20001f80:	07e090ef          	jal	2000affe <fflush>
20001f84:	bde5                	j	20001e7c <chat+0x1ce>
20001f86:	0007c603          	lbu	a2,0(a5)
20001f8a:	02000713          	li	a4,32
20001f8e:	1ae60e63          	beq	a2,a4,2000214a <chat+0x49c>
20001f92:	767d                	lui	a2,0xfffff
20001f94:	6705                	lui	a4,0x1
20001f96:	75860613          	add	a2,a2,1880 # fffff758 <dummy_file+0xc9fbd318>
20001f9a:	8b070713          	add	a4,a4,-1872 # 8b0 <_start-0x1ffff750>
20001f9e:	9732                	add	a4,a4,a2
20001fa0:	0814                	add	a3,sp,16
20001fa2:	200145b7          	lui	a1,0x20014
20001fa6:	853e                	mv	a0,a5
20001fa8:	00d70633          	add	a2,a4,a3
20001fac:	bc458593          	add	a1,a1,-1084 # 20013bc4 <__clz_tab+0x17c>
20001fb0:	c03e                	sw	a5,0(sp)
20001fb2:	420090ef          	jal	2000b3d2 <sscanf>
20001fb6:	4782                	lw	a5,0(sp)
20001fb8:	03251063          	bne	a0,s2,20001fd8 <chat+0x32a>
20001fbc:	6705                	lui	a4,0x1
20001fbe:	77fd                	lui	a5,0xfffff
20001fc0:	8b070713          	add	a4,a4,-1872 # 8b0 <_start-0x1ffff750>
20001fc4:	973e                	add	a4,a4,a5
20001fc6:	081c                	add	a5,sp,16
20001fc8:	97ba                	add	a5,a5,a4
20001fca:	7587c703          	lbu	a4,1880(a5) # fffff758 <dummy_file+0xc9fbd318>
20001fce:	c03e                	sw	a5,0(sp)
20001fd0:	014d0793          	add	a5,s10,20
20001fd4:	0706                	sll	a4,a4,0x1
20001fd6:	97ba                	add	a5,a5,a4
20001fd8:	0007c703          	lbu	a4,0(a5)
20001fdc:	df51                	beqz	a4,20001f78 <chat+0x2ca>
20001fde:	0017c603          	lbu	a2,1(a5)
20001fe2:	ea19                	bnez	a2,20001ff8 <chat+0x34a>
20001fe4:	fe070613          	add	a2,a4,-32
20001fe8:	05e00593          	li	a1,94
20001fec:	00c5f663          	bgeu	a1,a2,20001ff8 <chat+0x34a>
20001ff0:	175d                	add	a4,a4,-9
20001ff2:	4611                	li	a2,4
20001ff4:	f8e662e3          	bltu	a2,a4,20001f78 <chat+0x2ca>
20001ff8:	853e                	mv	a0,a5
20001ffa:	2dad                	jal	20002674 <print_s>
20001ffc:	bfb5                	j	20001f78 <chat+0x2ca>
20001ffe:	200145b7          	lui	a1,0x20014
20002002:	20014537          	lui	a0,0x20014
20002006:	c7458593          	add	a1,a1,-908 # 20013c74 <__clz_tab+0x22c>
2000200a:	c4050513          	add	a0,a0,-960 # 20013c40 <__clz_tab+0x1f8>
2000200e:	374090ef          	jal	2000b382 <printf>
20002012:	200147b7          	lui	a5,0x20014
20002016:	3687a603          	lw	a2,872(a5) # 20014368 <stdin>
2000201a:	24010a93          	add	s5,sp,576
2000201e:	20000593          	li	a1,512
20002022:	8556                	mv	a0,s5
20002024:	0cc090ef          	jal	2000b0f0 <fgets>
20002028:	d20502e3          	beqz	a0,20001d4c <chat+0x9e>
2000202c:	8556                	mv	a0,s5
2000202e:	4050b0ef          	jal	2000dc32 <strlen>
20002032:	d0050de3          	beqz	a0,20001d4c <chat+0x9e>
20002036:	fff50793          	add	a5,a0,-1
2000203a:	97d6                	add	a5,a5,s5
2000203c:	0007c683          	lbu	a3,0(a5)
20002040:	4729                	li	a4,10
20002042:	d0e695e3          	bne	a3,a4,20001d4c <chat+0x9e>
20002046:	00078023          	sb	zero,0(a5)
2000204a:	b309                	j	20001d4c <chat+0x9e>
2000204c:	6405                	lui	s0,0x1
2000204e:	767d                	lui	a2,0xfffff
20002050:	78060613          	add	a2,a2,1920 # fffff780 <dummy_file+0xc9fbd340>
20002054:	8b040513          	add	a0,s0,-1872 # 8b0 <_start-0x1ffff750>
20002058:	200147b7          	lui	a5,0x20014
2000205c:	c9078793          	add	a5,a5,-880 # 20013c90 <__clz_tab+0x248>
20002060:	9532                	add	a0,a0,a2
20002062:	0810                	add	a2,sp,16
20002064:	0007a383          	lw	t2,0(a5)
20002068:	0047a283          	lw	t0,4(a5)
2000206c:	0087af83          	lw	t6,8(a5)
20002070:	00c7af03          	lw	t5,12(a5)
20002074:	0107ae83          	lw	t4,16(a5)
20002078:	0147ae03          	lw	t3,20(a5)
2000207c:	0187a303          	lw	t1,24(a5)
20002080:	01c7a883          	lw	a7,28(a5)
20002084:	0207a803          	lw	a6,32(a5)
20002088:	0247d703          	lhu	a4,36(a5)
2000208c:	962a                	add	a2,a2,a0
2000208e:	0267c783          	lbu	a5,38(a5)
20002092:	8b040513          	add	a0,s0,-1872
20002096:	75fd                	lui	a1,0xfffff
20002098:	4402                	lw	s0,0(sp)
2000209a:	75858593          	add	a1,a1,1880 # fffff758 <dummy_file+0xc9fbd318>
2000209e:	952e                	add	a0,a0,a1
200020a0:	44010c93          	add	s9,sp,1088
200020a4:	080c                	add	a1,sp,16
200020a6:	76f40f23          	sb	a5,1918(s0)
200020aa:	95aa                	add	a1,a1,a0
200020ac:	74742c23          	sw	t2,1880(s0)
200020b0:	74542e23          	sw	t0,1884(s0)
200020b4:	77f42023          	sw	t6,1888(s0)
200020b8:	77e42223          	sw	t5,1892(s0)
200020bc:	77d42423          	sw	t4,1896(s0)
200020c0:	77c42623          	sw	t3,1900(s0)
200020c4:	76642823          	sw	t1,1904(s0)
200020c8:	77142a23          	sw	a7,1908(s0)
200020cc:	77042c23          	sw	a6,1912(s0)
200020d0:	76e41e23          	sh	a4,1916(s0)
200020d4:	86d6                	mv	a3,s5
200020d6:	8566                	mv	a0,s9
200020d8:	2d8090ef          	jal	2000b3b0 <sprintf>
200020dc:	200147b7          	lui	a5,0x20014
200020e0:	c43e                	sw	a5,8(sp)
200020e2:	200147b7          	lui	a5,0x20014
200020e6:	4401                	li	s0,0
200020e8:	c63e                	sw	a5,12(sp)
200020ea:	b1cd                	j	20001dcc <chat+0x11e>
200020ec:	200145b7          	lui	a1,0x20014
200020f0:	20014537          	lui	a0,0x20014
200020f4:	c4458593          	add	a1,a1,-956 # 20013c44 <__clz_tab+0x1fc>
200020f8:	c4050513          	add	a0,a0,-960 # 20013c40 <__clz_tab+0x1f8>
200020fc:	286090ef          	jal	2000b382 <printf>
20002100:	20014737          	lui	a4,0x20014
20002104:	36872603          	lw	a2,872(a4) # 20014368 <stdin>
20002108:	77fd                	lui	a5,0xfffff
2000210a:	6705                	lui	a4,0x1
2000210c:	78078793          	add	a5,a5,1920 # fffff780 <dummy_file+0xc9fbd340>
20002110:	8b070713          	add	a4,a4,-1872 # 8b0 <_start-0x1ffff750>
20002114:	973e                	add	a4,a4,a5
20002116:	081c                	add	a5,sp,16
20002118:	97ba                	add	a5,a5,a4
2000211a:	20000593          	li	a1,512
2000211e:	853e                	mv	a0,a5
20002120:	c03e                	sw	a5,0(sp)
20002122:	7cf080ef          	jal	2000b0f0 <fgets>
20002126:	c0050be3          	beqz	a0,20001d3c <chat+0x8e>
2000212a:	4502                	lw	a0,0(sp)
2000212c:	3070b0ef          	jal	2000dc32 <strlen>
20002130:	c00506e3          	beqz	a0,20001d3c <chat+0x8e>
20002134:	4782                	lw	a5,0(sp)
20002136:	157d                	add	a0,a0,-1
20002138:	4729                	li	a4,10
2000213a:	97aa                	add	a5,a5,a0
2000213c:	0007c683          	lbu	a3,0(a5)
20002140:	bee69ee3          	bne	a3,a4,20001d3c <chat+0x8e>
20002144:	00078023          	sb	zero,0(a5)
20002148:	bed5                	j	20001d3c <chat+0x8e>
2000214a:	767d                	lui	a2,0xfffff
2000214c:	0785                	add	a5,a5,1
2000214e:	b599                	j	20001f94 <chat+0x2e6>
20002150:	200147b7          	lui	a5,0x20014
20002154:	c43e                	sw	a5,8(sp)
20002156:	b379                	j	20001ee4 <chat+0x236>

20002158 <error_usage>:
20002158:	1141                	add	sp,sp,-16
2000215a:	200147b7          	lui	a5,0x20014
2000215e:	c422                	sw	s0,8(sp)
20002160:	3647a403          	lw	s0,868(a5) # 20014364 <stderr>
20002164:	20014537          	lui	a0,0x20014
20002168:	02400613          	li	a2,36
2000216c:	86a2                	mv	a3,s0
2000216e:	4585                	li	a1,1
20002170:	cb850513          	add	a0,a0,-840 # 20013cb8 <__clz_tab+0x270>
20002174:	c606                	sw	ra,12(sp)
20002176:	16c090ef          	jal	2000b2e2 <fwrite>
2000217a:	20014537          	lui	a0,0x20014
2000217e:	86a2                	mv	a3,s0
20002180:	03400613          	li	a2,52
20002184:	4585                	li	a1,1
20002186:	ce050513          	add	a0,a0,-800 # 20013ce0 <__clz_tab+0x298>
2000218a:	158090ef          	jal	2000b2e2 <fwrite>
2000218e:	20014537          	lui	a0,0x20014
20002192:	86a2                	mv	a3,s0
20002194:	4625                	li	a2,9
20002196:	4585                	li	a1,1
20002198:	d1850513          	add	a0,a0,-744 # 20013d18 <__clz_tab+0x2d0>
2000219c:	146090ef          	jal	2000b2e2 <fwrite>
200021a0:	20014537          	lui	a0,0x20014
200021a4:	86a2                	mv	a3,s0
200021a6:	03200613          	li	a2,50
200021aa:	4585                	li	a1,1
200021ac:	d2450513          	add	a0,a0,-732 # 20013d24 <__clz_tab+0x2dc>
200021b0:	132090ef          	jal	2000b2e2 <fwrite>
200021b4:	20014537          	lui	a0,0x20014
200021b8:	86a2                	mv	a3,s0
200021ba:	04700613          	li	a2,71
200021be:	4585                	li	a1,1
200021c0:	d5850513          	add	a0,a0,-680 # 20013d58 <__clz_tab+0x310>
200021c4:	11e090ef          	jal	2000b2e2 <fwrite>
200021c8:	20014537          	lui	a0,0x20014
200021cc:	86a2                	mv	a3,s0
200021ce:	02e00613          	li	a2,46
200021d2:	4585                	li	a1,1
200021d4:	da050513          	add	a0,a0,-608 # 20013da0 <__clz_tab+0x358>
200021d8:	10a090ef          	jal	2000b2e2 <fwrite>
200021dc:	20014537          	lui	a0,0x20014
200021e0:	86a2                	mv	a3,s0
200021e2:	04700613          	li	a2,71
200021e6:	4585                	li	a1,1
200021e8:	dd050513          	add	a0,a0,-560 # 20013dd0 <__clz_tab+0x388>
200021ec:	0f6090ef          	jal	2000b2e2 <fwrite>
200021f0:	20014537          	lui	a0,0x20014
200021f4:	86a2                	mv	a3,s0
200021f6:	466d                	li	a2,27
200021f8:	4585                	li	a1,1
200021fa:	e1850513          	add	a0,a0,-488 # 20013e18 <__clz_tab+0x3d0>
200021fe:	0e4090ef          	jal	2000b2e2 <fwrite>
20002202:	20014537          	lui	a0,0x20014
20002206:	86a2                	mv	a3,s0
20002208:	03000613          	li	a2,48
2000220c:	4585                	li	a1,1
2000220e:	e3450513          	add	a0,a0,-460 # 20013e34 <__clz_tab+0x3ec>
20002212:	0d0090ef          	jal	2000b2e2 <fwrite>
20002216:	20014537          	lui	a0,0x20014
2000221a:	86a2                	mv	a3,s0
2000221c:	03500613          	li	a2,53
20002220:	4585                	li	a1,1
20002222:	e6850513          	add	a0,a0,-408 # 20013e68 <__clz_tab+0x420>
20002226:	0bc090ef          	jal	2000b2e2 <fwrite>
2000222a:	20014537          	lui	a0,0x20014
2000222e:	86a2                	mv	a3,s0
20002230:	03400613          	li	a2,52
20002234:	4585                	li	a1,1
20002236:	ea050513          	add	a0,a0,-352 # 20013ea0 <__clz_tab+0x458>
2000223a:	0a8090ef          	jal	2000b2e2 <fwrite>
2000223e:	4505                	li	a0,1
20002240:	0cc070ef          	jal	2000930c <exit>

20002244 <hexCharToValue>:
20002244:	87aa                	mv	a5,a0
20002246:	fd050513          	add	a0,a0,-48
2000224a:	0ff57513          	zext.b	a0,a0
2000224e:	4725                	li	a4,9
20002250:	02a77063          	bgeu	a4,a0,20002270 <hexCharToValue+0x2c>
20002254:	f9f78713          	add	a4,a5,-97
20002258:	0ff77713          	zext.b	a4,a4
2000225c:	4695                	li	a3,5
2000225e:	00e6fa63          	bgeu	a3,a4,20002272 <hexCharToValue+0x2e>
20002262:	fbf78713          	add	a4,a5,-65
20002266:	0ff77713          	zext.b	a4,a4
2000226a:	4501                	li	a0,0
2000226c:	00e6f863          	bgeu	a3,a4,2000227c <hexCharToValue+0x38>
20002270:	8082                	ret
20002272:	fa978793          	add	a5,a5,-87
20002276:	0ff7f513          	zext.b	a0,a5
2000227a:	8082                	ret
2000227c:	fc978793          	add	a5,a5,-55
20002280:	0ff7f513          	zext.b	a0,a5
20002284:	8082                	ret

20002286 <hexStringToBytes>:
20002286:	4801                	li	a6,0
20002288:	4325                	li	t1,9
2000228a:	4895                	li	a7,5
2000228c:	ee05                	bnez	a2,200022c4 <hexStringToBytes+0x3e>
2000228e:	8082                	ret
20002290:	f9f68713          	add	a4,a3,-97
20002294:	0ff77713          	zext.b	a4,a4
20002298:	08e8f763          	bgeu	a7,a4,20002326 <hexStringToBytes+0xa0>
2000229c:	fbf68713          	add	a4,a3,-65
200022a0:	0ff77713          	zext.b	a4,a4
200022a4:	00e8e763          	bltu	a7,a4,200022b2 <hexStringToBytes+0x2c>
200022a8:	fc968693          	add	a3,a3,-55
200022ac:	8fd5                	or	a5,a5,a3
200022ae:	0ff7f793          	zext.b	a5,a5
200022b2:	00185713          	srl	a4,a6,0x1
200022b6:	972e                	add	a4,a4,a1
200022b8:	00f70023          	sb	a5,0(a4)
200022bc:	0809                	add	a6,a6,2 # fffff002 <dummy_file+0xc9fbcbc2>
200022be:	0509                	add	a0,a0,2
200022c0:	04c87e63          	bgeu	a6,a2,2000231c <hexStringToBytes+0x96>
200022c4:	00054703          	lbu	a4,0(a0)
200022c8:	fd070793          	add	a5,a4,-48
200022cc:	0ff7f793          	zext.b	a5,a5
200022d0:	04f37763          	bgeu	t1,a5,2000231e <hexStringToBytes+0x98>
200022d4:	f9f70793          	add	a5,a4,-97
200022d8:	0ff7f793          	zext.b	a5,a5
200022dc:	04f8fb63          	bgeu	a7,a5,20002332 <hexStringToBytes+0xac>
200022e0:	fbf70693          	add	a3,a4,-65
200022e4:	0ff6f693          	zext.b	a3,a3
200022e8:	4781                	li	a5,0
200022ea:	00d8e763          	bltu	a7,a3,200022f8 <hexStringToBytes+0x72>
200022ee:	fc970713          	add	a4,a4,-55
200022f2:	0712                	sll	a4,a4,0x4
200022f4:	0ff77793          	zext.b	a5,a4
200022f8:	00154683          	lbu	a3,1(a0)
200022fc:	fd068713          	add	a4,a3,-48
20002300:	0ff77713          	zext.b	a4,a4
20002304:	f8e366e3          	bltu	t1,a4,20002290 <hexStringToBytes+0xa>
20002308:	8fd9                	or	a5,a5,a4
2000230a:	00185713          	srl	a4,a6,0x1
2000230e:	972e                	add	a4,a4,a1
20002310:	00f70023          	sb	a5,0(a4)
20002314:	0809                	add	a6,a6,2
20002316:	0509                	add	a0,a0,2
20002318:	fac866e3          	bltu	a6,a2,200022c4 <hexStringToBytes+0x3e>
2000231c:	8082                	ret
2000231e:	0792                	sll	a5,a5,0x4
20002320:	0ff7f793          	zext.b	a5,a5
20002324:	bfd1                	j	200022f8 <hexStringToBytes+0x72>
20002326:	fa968693          	add	a3,a3,-87
2000232a:	8fd5                	or	a5,a5,a3
2000232c:	0ff7f793          	zext.b	a5,a5
20002330:	b749                	j	200022b2 <hexStringToBytes+0x2c>
20002332:	fa970713          	add	a4,a4,-87
20002336:	0712                	sll	a4,a4,0x4
20002338:	0ff77793          	zext.b	a5,a4
2000233c:	bf75                	j	200022f8 <hexStringToBytes+0x72>

2000233e <convert_hex2mem>:
2000233e:	1141                	add	sp,sp,-16
20002340:	c422                	sw	s0,8(sp)
20002342:	842a                	mv	s0,a0
20002344:	852e                	mv	a0,a1
20002346:	c226                	sw	s1,4(sp)
20002348:	c606                	sw	ra,12(sp)
2000234a:	84ae                	mv	s1,a1
2000234c:	0e70b0ef          	jal	2000dc32 <strlen>
20002350:	cd41                	beqz	a0,200023e8 <convert_hex2mem+0xaa>
20002352:	85a6                	mv	a1,s1
20002354:	4601                	li	a2,0
20002356:	48a5                	li	a7,9
20002358:	4815                	li	a6,5
2000235a:	a81d                	j	20002390 <convert_hex2mem+0x52>
2000235c:	f9f68713          	add	a4,a3,-97
20002360:	0ff77713          	zext.b	a4,a4
20002364:	08e87b63          	bgeu	a6,a4,200023fa <convert_hex2mem+0xbc>
20002368:	fbf68713          	add	a4,a3,-65
2000236c:	0ff77713          	zext.b	a4,a4
20002370:	00e86763          	bltu	a6,a4,2000237e <convert_hex2mem+0x40>
20002374:	fc968693          	add	a3,a3,-55
20002378:	8fd5                	or	a5,a5,a3
2000237a:	0ff7f793          	zext.b	a5,a5
2000237e:	40165713          	sra	a4,a2,0x1
20002382:	9722                	add	a4,a4,s0
20002384:	00f70023          	sb	a5,0(a4)
20002388:	0609                	add	a2,a2,2 # fffff002 <dummy_file+0xc9fbcbc2>
2000238a:	0589                	add	a1,a1,2
2000238c:	04a65e63          	bge	a2,a0,200023e8 <convert_hex2mem+0xaa>
20002390:	0005c703          	lbu	a4,0(a1)
20002394:	fd070793          	add	a5,a4,-48
20002398:	0ff7f793          	zext.b	a5,a5
2000239c:	04f8fb63          	bgeu	a7,a5,200023f2 <convert_hex2mem+0xb4>
200023a0:	f9f70793          	add	a5,a4,-97
200023a4:	0ff7f793          	zext.b	a5,a5
200023a8:	04f87f63          	bgeu	a6,a5,20002406 <convert_hex2mem+0xc8>
200023ac:	fbf70693          	add	a3,a4,-65
200023b0:	0ff6f693          	zext.b	a3,a3
200023b4:	4781                	li	a5,0
200023b6:	00d86763          	bltu	a6,a3,200023c4 <convert_hex2mem+0x86>
200023ba:	fc970713          	add	a4,a4,-55
200023be:	0712                	sll	a4,a4,0x4
200023c0:	0ff77793          	zext.b	a5,a4
200023c4:	0015c683          	lbu	a3,1(a1)
200023c8:	fd068713          	add	a4,a3,-48
200023cc:	0ff77713          	zext.b	a4,a4
200023d0:	f8e8e6e3          	bltu	a7,a4,2000235c <convert_hex2mem+0x1e>
200023d4:	8fd9                	or	a5,a5,a4
200023d6:	40165713          	sra	a4,a2,0x1
200023da:	9722                	add	a4,a4,s0
200023dc:	00f70023          	sb	a5,0(a4)
200023e0:	0609                	add	a2,a2,2
200023e2:	0589                	add	a1,a1,2
200023e4:	faa646e3          	blt	a2,a0,20002390 <convert_hex2mem+0x52>
200023e8:	40b2                	lw	ra,12(sp)
200023ea:	4422                	lw	s0,8(sp)
200023ec:	4492                	lw	s1,4(sp)
200023ee:	0141                	add	sp,sp,16
200023f0:	8082                	ret
200023f2:	0792                	sll	a5,a5,0x4
200023f4:	0ff7f793          	zext.b	a5,a5
200023f8:	b7f1                	j	200023c4 <convert_hex2mem+0x86>
200023fa:	fa968693          	add	a3,a3,-87
200023fe:	8fd5                	or	a5,a5,a3
20002400:	0ff7f793          	zext.b	a5,a5
20002404:	bfad                	j	2000237e <convert_hex2mem+0x40>
20002406:	fa970713          	add	a4,a4,-87
2000240a:	0712                	sll	a4,a4,0x4
2000240c:	0ff77793          	zext.b	a5,a4
20002410:	bf55                	j	200023c4 <convert_hex2mem+0x86>

20002412 <convert_n_hex2mem>:
20002412:	0606                	sll	a2,a2,0x1
20002414:	4801                	li	a6,0
20002416:	4325                	li	t1,9
20002418:	4895                	li	a7,5
2000241a:	02c04d63          	bgtz	a2,20002454 <convert_n_hex2mem+0x42>
2000241e:	8082                	ret
20002420:	f9f68713          	add	a4,a3,-97
20002424:	0ff77713          	zext.b	a4,a4
20002428:	08e8f763          	bgeu	a7,a4,200024b6 <convert_n_hex2mem+0xa4>
2000242c:	fbf68713          	add	a4,a3,-65
20002430:	0ff77713          	zext.b	a4,a4
20002434:	00e8e763          	bltu	a7,a4,20002442 <convert_n_hex2mem+0x30>
20002438:	fc968693          	add	a3,a3,-55
2000243c:	8fd5                	or	a5,a5,a3
2000243e:	0ff7f793          	zext.b	a5,a5
20002442:	40185713          	sra	a4,a6,0x1
20002446:	972a                	add	a4,a4,a0
20002448:	00f70023          	sb	a5,0(a4)
2000244c:	0809                	add	a6,a6,2
2000244e:	0589                	add	a1,a1,2
20002450:	04c85e63          	bge	a6,a2,200024ac <convert_n_hex2mem+0x9a>
20002454:	0005c703          	lbu	a4,0(a1)
20002458:	fd070793          	add	a5,a4,-48
2000245c:	0ff7f793          	zext.b	a5,a5
20002460:	04f37763          	bgeu	t1,a5,200024ae <convert_n_hex2mem+0x9c>
20002464:	f9f70793          	add	a5,a4,-97
20002468:	0ff7f793          	zext.b	a5,a5
2000246c:	04f8fb63          	bgeu	a7,a5,200024c2 <convert_n_hex2mem+0xb0>
20002470:	fbf70693          	add	a3,a4,-65
20002474:	0ff6f693          	zext.b	a3,a3
20002478:	4781                	li	a5,0
2000247a:	00d8e763          	bltu	a7,a3,20002488 <convert_n_hex2mem+0x76>
2000247e:	fc970713          	add	a4,a4,-55
20002482:	0712                	sll	a4,a4,0x4
20002484:	0ff77793          	zext.b	a5,a4
20002488:	0015c683          	lbu	a3,1(a1)
2000248c:	fd068713          	add	a4,a3,-48
20002490:	0ff77713          	zext.b	a4,a4
20002494:	f8e366e3          	bltu	t1,a4,20002420 <convert_n_hex2mem+0xe>
20002498:	8fd9                	or	a5,a5,a4
2000249a:	40185713          	sra	a4,a6,0x1
2000249e:	972a                	add	a4,a4,a0
200024a0:	00f70023          	sb	a5,0(a4)
200024a4:	0809                	add	a6,a6,2
200024a6:	0589                	add	a1,a1,2
200024a8:	fac846e3          	blt	a6,a2,20002454 <convert_n_hex2mem+0x42>
200024ac:	8082                	ret
200024ae:	0792                	sll	a5,a5,0x4
200024b0:	0ff7f793          	zext.b	a5,a5
200024b4:	bfd1                	j	20002488 <convert_n_hex2mem+0x76>
200024b6:	fa968693          	add	a3,a3,-87
200024ba:	8fd5                	or	a5,a5,a3
200024bc:	0ff7f793          	zext.b	a5,a5
200024c0:	b749                	j	20002442 <convert_n_hex2mem+0x30>
200024c2:	fa970713          	add	a4,a4,-87
200024c6:	0712                	sll	a4,a4,0x4
200024c8:	0ff77793          	zext.b	a5,a4
200024cc:	bf75                	j	20002488 <convert_n_hex2mem+0x76>

200024ce <convert_n_hex2mem_from>:
200024ce:	0606                	sll	a2,a2,0x1
200024d0:	0686                	sll	a3,a3,0x1
200024d2:	95b2                	add	a1,a1,a2
200024d4:	4801                	li	a6,0
200024d6:	4325                	li	t1,9
200024d8:	4895                	li	a7,5
200024da:	02d04d63          	bgtz	a3,20002514 <convert_n_hex2mem_from+0x46>
200024de:	8082                	ret
200024e0:	f9f60713          	add	a4,a2,-97
200024e4:	0ff77713          	zext.b	a4,a4
200024e8:	08e8f763          	bgeu	a7,a4,20002576 <convert_n_hex2mem_from+0xa8>
200024ec:	fbf60713          	add	a4,a2,-65
200024f0:	0ff77713          	zext.b	a4,a4
200024f4:	00e8e763          	bltu	a7,a4,20002502 <convert_n_hex2mem_from+0x34>
200024f8:	fc960613          	add	a2,a2,-55
200024fc:	8fd1                	or	a5,a5,a2
200024fe:	0ff7f793          	zext.b	a5,a5
20002502:	40185713          	sra	a4,a6,0x1
20002506:	972a                	add	a4,a4,a0
20002508:	00f70023          	sb	a5,0(a4)
2000250c:	0809                	add	a6,a6,2
2000250e:	0589                	add	a1,a1,2
20002510:	04d85e63          	bge	a6,a3,2000256c <convert_n_hex2mem_from+0x9e>
20002514:	0005c703          	lbu	a4,0(a1)
20002518:	fd070793          	add	a5,a4,-48
2000251c:	0ff7f793          	zext.b	a5,a5
20002520:	04f37763          	bgeu	t1,a5,2000256e <convert_n_hex2mem_from+0xa0>
20002524:	f9f70793          	add	a5,a4,-97
20002528:	0ff7f793          	zext.b	a5,a5
2000252c:	04f8fb63          	bgeu	a7,a5,20002582 <convert_n_hex2mem_from+0xb4>
20002530:	fbf70613          	add	a2,a4,-65
20002534:	0ff67613          	zext.b	a2,a2
20002538:	4781                	li	a5,0
2000253a:	00c8e763          	bltu	a7,a2,20002548 <convert_n_hex2mem_from+0x7a>
2000253e:	fc970713          	add	a4,a4,-55
20002542:	0712                	sll	a4,a4,0x4
20002544:	0ff77793          	zext.b	a5,a4
20002548:	0015c603          	lbu	a2,1(a1)
2000254c:	fd060713          	add	a4,a2,-48
20002550:	0ff77713          	zext.b	a4,a4
20002554:	f8e366e3          	bltu	t1,a4,200024e0 <convert_n_hex2mem_from+0x12>
20002558:	8fd9                	or	a5,a5,a4
2000255a:	40185713          	sra	a4,a6,0x1
2000255e:	972a                	add	a4,a4,a0
20002560:	00f70023          	sb	a5,0(a4)
20002564:	0809                	add	a6,a6,2
20002566:	0589                	add	a1,a1,2
20002568:	fad846e3          	blt	a6,a3,20002514 <convert_n_hex2mem_from+0x46>
2000256c:	8082                	ret
2000256e:	0792                	sll	a5,a5,0x4
20002570:	0ff7f793          	zext.b	a5,a5
20002574:	bfd1                	j	20002548 <convert_n_hex2mem_from+0x7a>
20002576:	fa960613          	add	a2,a2,-87
2000257a:	8fd1                	or	a5,a5,a2
2000257c:	0ff7f793          	zext.b	a5,a5
20002580:	b749                	j	20002502 <convert_n_hex2mem_from+0x34>
20002582:	fa970713          	add	a4,a4,-87
20002586:	0712                	sll	a4,a4,0x4
20002588:	0ff77793          	zext.b	a5,a4
2000258c:	bf75                	j	20002548 <convert_n_hex2mem_from+0x7a>

2000258e <uart_put_c>:
2000258e:	10000737          	lui	a4,0x10000
20002592:	471c                	lw	a5,8(a4)
20002594:	8ba1                	and	a5,a5,8
20002596:	fff5                	bnez	a5,20002592 <uart_put_c+0x4>
20002598:	c348                	sw	a0,4(a4)
2000259a:	8082                	ret

2000259c <uart_check_read>:
2000259c:	100007b7          	lui	a5,0x10000
200025a0:	4788                	lw	a0,8(a5)
200025a2:	8905                	and	a0,a0,1
200025a4:	8082                	ret

200025a6 <uart_get_c>:
200025a6:	100007b7          	lui	a5,0x10000
200025aa:	4388                	lw	a0,0(a5)
200025ac:	0ff57513          	zext.b	a0,a0
200025b0:	8082                	ret

200025b2 <get>:
200025b2:	657476b7          	lui	a3,0x65747
200025b6:	65672737          	lui	a4,0x65672
200025ba:	002937b7          	lui	a5,0x293
200025be:	1101                	add	sp,sp,-32
200025c0:	e4568693          	add	a3,a3,-443 # 65746e45 <dummy_file+0x2f704a05>
200025c4:	07270713          	add	a4,a4,114 # 65672072 <dummy_file+0x2f62fc32>
200025c8:	87478793          	add	a5,a5,-1932 # 292874 <_start-0x1fd6d78c>
200025cc:	c636                	sw	a3,12(sp)
200025ce:	c83a                	sw	a4,16(sp)
200025d0:	88aa                	mv	a7,a0
200025d2:	832e                	mv	t1,a1
200025d4:	ca3e                	sw	a5,20(sp)
200025d6:	cc02                	sw	zero,24(sp)
200025d8:	ce02                	sw	zero,28(sp)
200025da:	0070                	add	a2,sp,12
200025dc:	04500693          	li	a3,69
200025e0:	10000737          	lui	a4,0x10000
200025e4:	471c                	lw	a5,8(a4)
200025e6:	8ba1                	and	a5,a5,8
200025e8:	fff5                	bnez	a5,200025e4 <get+0x32>
200025ea:	c354                	sw	a3,4(a4)
200025ec:	00164683          	lbu	a3,1(a2)
200025f0:	0605                	add	a2,a2,1
200025f2:	faed                	bnez	a3,200025e4 <get+0x32>
200025f4:	10000737          	lui	a4,0x10000
200025f8:	471c                	lw	a5,8(a4)
200025fa:	8b85                	and	a5,a5,1
200025fc:	dff5                	beqz	a5,200025f8 <get+0x46>
200025fe:	471c                	lw	a5,8(a4)
20002600:	8b85                	and	a5,a5,1
20002602:	c7bd                	beqz	a5,20002670 <get+0xbe>
20002604:	fff88513          	add	a0,a7,-1
20002608:	4805                	li	a6,1
2000260a:	951a                	add	a0,a0,t1
2000260c:	85c6                	mv	a1,a7
2000260e:	06685163          	bge	a6,t1,20002670 <get+0xbe>
20002612:	10000737          	lui	a4,0x10000
20002616:	4e35                	li	t3,13
20002618:	4329                	li	t1,10
2000261a:	41180833          	sub	a6,a6,a7
2000261e:	0070                	add	a2,sp,12
20002620:	04500693          	li	a3,69
20002624:	471c                	lw	a5,8(a4)
20002626:	8ba1                	and	a5,a5,8
20002628:	fff5                	bnez	a5,20002624 <get+0x72>
2000262a:	c354                	sw	a3,4(a4)
2000262c:	00164683          	lbu	a3,1(a2)
20002630:	0605                	add	a2,a2,1
20002632:	faed                	bnez	a3,20002624 <get+0x72>
20002634:	4314                	lw	a3,0(a4)
20002636:	0ff6f613          	zext.b	a2,a3
2000263a:	471c                	lw	a5,8(a4)
2000263c:	8ba1                	and	a5,a5,8
2000263e:	fff5                	bnez	a5,2000263a <get+0x88>
20002640:	0ff6f693          	zext.b	a3,a3
20002644:	c354                	sw	a3,4(a4)
20002646:	87ae                	mv	a5,a1
20002648:	03c60063          	beq	a2,t3,20002668 <get+0xb6>
2000264c:	00660e63          	beq	a2,t1,20002668 <get+0xb6>
20002650:	00c58023          	sb	a2,0(a1)
20002654:	4714                	lw	a3,8(a4)
20002656:	00b80633          	add	a2,a6,a1
2000265a:	8a85                	and	a3,a3,1
2000265c:	c681                	beqz	a3,20002664 <get+0xb2>
2000265e:	0585                	add	a1,a1,1
20002660:	fab51fe3          	bne	a0,a1,2000261e <get+0x6c>
20002664:	00c887b3          	add	a5,a7,a2
20002668:	00078023          	sb	zero,0(a5)
2000266c:	6105                	add	sp,sp,32
2000266e:	8082                	ret
20002670:	87c6                	mv	a5,a7
20002672:	bfdd                	j	20002668 <get+0xb6>

20002674 <print_s>:
20002674:	00054683          	lbu	a3,0(a0)
20002678:	ca99                	beqz	a3,2000268e <print_s+0x1a>
2000267a:	10000737          	lui	a4,0x10000
2000267e:	471c                	lw	a5,8(a4)
20002680:	8ba1                	and	a5,a5,8
20002682:	fff5                	bnez	a5,2000267e <print_s+0xa>
20002684:	c354                	sw	a3,4(a4)
20002686:	00154683          	lbu	a3,1(a0)
2000268a:	0505                	add	a0,a0,1
2000268c:	faed                	bnez	a3,2000267e <print_s+0xa>
2000268e:	8082                	ret

20002690 <print_long>:
20002690:	04054963          	bltz	a0,200026e2 <print_long+0x52>
20002694:	10000737          	lui	a4,0x10000
20002698:	cd15                	beqz	a0,200026d4 <print_long+0x44>
2000269a:	1101                	add	sp,sp,-32
2000269c:	4701                	li	a4,0
2000269e:	858a                	mv	a1,sp
200026a0:	4629                	li	a2,10
200026a2:	02c567b3          	rem	a5,a0,a2
200026a6:	0705                	add	a4,a4,1 # 10000001 <_start-0xfffffff>
200026a8:	00e586b3          	add	a3,a1,a4
200026ac:	02c54533          	div	a0,a0,a2
200026b0:	03078793          	add	a5,a5,48
200026b4:	fef68fa3          	sb	a5,-1(a3)
200026b8:	f56d                	bnez	a0,200026a2 <print_long+0x12>
200026ba:	10000737          	lui	a4,0x10000
200026be:	fff6c603          	lbu	a2,-1(a3)
200026c2:	471c                	lw	a5,8(a4)
200026c4:	8ba1                	and	a5,a5,8
200026c6:	fff5                	bnez	a5,200026c2 <print_long+0x32>
200026c8:	c350                	sw	a2,4(a4)
200026ca:	16fd                	add	a3,a3,-1
200026cc:	fed599e3          	bne	a1,a3,200026be <print_long+0x2e>
200026d0:	6105                	add	sp,sp,32
200026d2:	8082                	ret
200026d4:	471c                	lw	a5,8(a4)
200026d6:	8ba1                	and	a5,a5,8
200026d8:	fff5                	bnez	a5,200026d4 <print_long+0x44>
200026da:	03000793          	li	a5,48
200026de:	c35c                	sw	a5,4(a4)
200026e0:	8082                	ret
200026e2:	10000737          	lui	a4,0x10000
200026e6:	471c                	lw	a5,8(a4)
200026e8:	8ba1                	and	a5,a5,8
200026ea:	fff5                	bnez	a5,200026e6 <print_long+0x56>
200026ec:	02d00793          	li	a5,45
200026f0:	c35c                	sw	a5,4(a4)
200026f2:	40a00533          	neg	a0,a0
200026f6:	b755                	j	2000269a <print_long+0xa>

200026f8 <print_digit>:
200026f8:	03050513          	add	a0,a0,48
200026fc:	0ff57513          	zext.b	a0,a0
20002700:	10000737          	lui	a4,0x10000
20002704:	471c                	lw	a5,8(a4)
20002706:	8ba1                	and	a5,a5,8
20002708:	fff5                	bnez	a5,20002704 <print_digit+0xc>
2000270a:	c348                	sw	a0,4(a4)
2000270c:	8082                	ret

2000270e <dump_hex>:
2000270e:	1141                	add	sp,sp,-16
20002710:	10000737          	lui	a4,0x10000
20002714:	471c                	lw	a5,8(a4)
20002716:	8ba1                	and	a5,a5,8
20002718:	fff5                	bnez	a5,20002714 <dump_hex+0x6>
2000271a:	03000793          	li	a5,48
2000271e:	c35c                	sw	a5,4(a4)
20002720:	10000737          	lui	a4,0x10000
20002724:	471c                	lw	a5,8(a4)
20002726:	8ba1                	and	a5,a5,8
20002728:	fff5                	bnez	a5,20002724 <dump_hex+0x16>
2000272a:	07800793          	li	a5,120
2000272e:	00f57693          	and	a3,a0,15
20002732:	c35c                	sw	a5,4(a4)
20002734:	4625                	li	a2,9
20002736:	03068713          	add	a4,a3,48
2000273a:	00d67463          	bgeu	a2,a3,20002742 <dump_hex+0x34>
2000273e:	05768713          	add	a4,a3,87
20002742:	00455793          	srl	a5,a0,0x4
20002746:	00f7f693          	and	a3,a5,15
2000274a:	00e10023          	sb	a4,0(sp)
2000274e:	4625                	li	a2,9
20002750:	03068713          	add	a4,a3,48
20002754:	00d67463          	bgeu	a2,a3,2000275c <dump_hex+0x4e>
20002758:	05768713          	add	a4,a3,87
2000275c:	00855793          	srl	a5,a0,0x8
20002760:	00f7f693          	and	a3,a5,15
20002764:	00e100a3          	sb	a4,1(sp)
20002768:	4625                	li	a2,9
2000276a:	03068713          	add	a4,a3,48
2000276e:	00d67463          	bgeu	a2,a3,20002776 <dump_hex+0x68>
20002772:	05768713          	add	a4,a3,87
20002776:	00c55793          	srl	a5,a0,0xc
2000277a:	00f7f693          	and	a3,a5,15
2000277e:	00e10123          	sb	a4,2(sp)
20002782:	4625                	li	a2,9
20002784:	03068713          	add	a4,a3,48
20002788:	00d67463          	bgeu	a2,a3,20002790 <dump_hex+0x82>
2000278c:	05768713          	add	a4,a3,87
20002790:	01055793          	srl	a5,a0,0x10
20002794:	00f7f693          	and	a3,a5,15
20002798:	00e101a3          	sb	a4,3(sp)
2000279c:	4625                	li	a2,9
2000279e:	03068713          	add	a4,a3,48
200027a2:	00d67463          	bgeu	a2,a3,200027aa <dump_hex+0x9c>
200027a6:	05768713          	add	a4,a3,87
200027aa:	01455793          	srl	a5,a0,0x14
200027ae:	00f7f693          	and	a3,a5,15
200027b2:	00e10223          	sb	a4,4(sp)
200027b6:	4625                	li	a2,9
200027b8:	03068713          	add	a4,a3,48
200027bc:	00d67463          	bgeu	a2,a3,200027c4 <dump_hex+0xb6>
200027c0:	05768713          	add	a4,a3,87
200027c4:	01855793          	srl	a5,a0,0x18
200027c8:	00f7f693          	and	a3,a5,15
200027cc:	00e102a3          	sb	a4,5(sp)
200027d0:	4625                	li	a2,9
200027d2:	03068713          	add	a4,a3,48
200027d6:	00d67463          	bgeu	a2,a3,200027de <dump_hex+0xd0>
200027da:	05768713          	add	a4,a3,87
200027de:	01c55793          	srl	a5,a0,0x1c
200027e2:	00e10323          	sb	a4,6(sp)
200027e6:	46a5                	li	a3,9
200027e8:	03078713          	add	a4,a5,48
200027ec:	00f6f463          	bgeu	a3,a5,200027f4 <dump_hex+0xe6>
200027f0:	05778713          	add	a4,a5,87
200027f4:	303037b7          	lui	a5,0x30303
200027f8:	03078793          	add	a5,a5,48 # 30303030 <checkpoint_str+0x1794b18>
200027fc:	00e103a3          	sb	a4,7(sp)
20002800:	c43e                	sw	a5,8(sp)
20002802:	c63e                	sw	a5,12(sp)
20002804:	858a                	mv	a1,sp
20002806:	00f10693          	add	a3,sp,15
2000280a:	10000737          	lui	a4,0x10000
2000280e:	0006c603          	lbu	a2,0(a3)
20002812:	471c                	lw	a5,8(a4)
20002814:	8ba1                	and	a5,a5,8
20002816:	fff5                	bnez	a5,20002812 <dump_hex+0x104>
20002818:	c350                	sw	a2,4(a4)
2000281a:	fff68793          	add	a5,a3,-1
2000281e:	00d58463          	beq	a1,a3,20002826 <dump_hex+0x118>
20002822:	86be                	mv	a3,a5
20002824:	b7ed                	j	2000280e <dump_hex+0x100>
20002826:	10000737          	lui	a4,0x10000
2000282a:	471c                	lw	a5,8(a4)
2000282c:	8ba1                	and	a5,a5,8
2000282e:	fff5                	bnez	a5,2000282a <dump_hex+0x11c>
20002830:	47b5                	li	a5,13
20002832:	c35c                	sw	a5,4(a4)
20002834:	10000737          	lui	a4,0x10000
20002838:	471c                	lw	a5,8(a4)
2000283a:	8ba1                	and	a5,a5,8
2000283c:	fff5                	bnez	a5,20002838 <dump_hex+0x12a>
2000283e:	47a9                	li	a5,10
20002840:	c35c                	sw	a5,4(a4)
20002842:	0141                	add	sp,sp,16
20002844:	8082                	ret
	...

20002848 <trap_handler>:
20002848:	1141                	add	sp,sp,-16
2000284a:	c606                	sw	ra,12(sp)
2000284c:	c422                	sw	s0,8(sp)
2000284e:	c226                	sw	s1,4(sp)
20002850:	c04a                	sw	s2,0(sp)
20002852:	34202973          	csrr	s2,mcause
20002856:	343024f3          	csrr	s1,mtval
2000285a:	34102473          	csrr	s0,mepc
2000285e:	20014537          	lui	a0,0x20014
20002862:	fa850513          	add	a0,a0,-88 # 20013fa8 <__clz_tab+0x560>
20002866:	3539                	jal	20002674 <print_s>
20002868:	20014537          	lui	a0,0x20014
2000286c:	fb450513          	add	a0,a0,-76 # 20013fb4 <__clz_tab+0x56c>
20002870:	3511                	jal	20002674 <print_s>
20002872:	854a                	mv	a0,s2
20002874:	3d69                	jal	2000270e <dump_hex>
20002876:	20014537          	lui	a0,0x20014
2000287a:	fc050513          	add	a0,a0,-64 # 20013fc0 <__clz_tab+0x578>
2000287e:	3bdd                	jal	20002674 <print_s>
20002880:	8526                	mv	a0,s1
20002882:	3571                	jal	2000270e <dump_hex>
20002884:	20014537          	lui	a0,0x20014
20002888:	fc850513          	add	a0,a0,-56 # 20013fc8 <__clz_tab+0x580>
2000288c:	33e5                	jal	20002674 <print_s>
2000288e:	8522                	mv	a0,s0
20002890:	3dbd                	jal	2000270e <dump_hex>
20002892:	a001                	j	20002892 <trap_handler+0x4a>

20002894 <setup_mtvec>:
20002894:	20014537          	lui	a0,0x20014
20002898:	1141                	add	sp,sp,-16
2000289a:	fd050513          	add	a0,a0,-48 # 20013fd0 <__clz_tab+0x588>
2000289e:	c606                	sw	ra,12(sp)
200028a0:	c422                	sw	s0,8(sp)
200028a2:	3bc9                	jal	20002674 <print_s>
200028a4:	20003437          	lui	s0,0x20003
200028a8:	84840513          	add	a0,s0,-1976 # 20002848 <trap_handler>
200028ac:	358d                	jal	2000270e <dump_hex>
200028ae:	20014537          	lui	a0,0x20014
200028b2:	f5c50513          	add	a0,a0,-164 # 20013f5c <__clz_tab+0x514>
200028b6:	84840413          	add	s0,s0,-1976
200028ba:	3b6d                	jal	20002674 <print_s>
200028bc:	00347793          	and	a5,s0,3
200028c0:	e799                	bnez	a5,200028ce <setup_mtvec+0x3a>
200028c2:	30541073          	csrw	mtvec,s0
200028c6:	40b2                	lw	ra,12(sp)
200028c8:	4422                	lw	s0,8(sp)
200028ca:	0141                	add	sp,sp,16
200028cc:	8082                	ret
200028ce:	20014537          	lui	a0,0x20014
200028d2:	fe450513          	add	a0,a0,-28 # 20013fe4 <__clz_tab+0x59c>
200028d6:	3b79                	jal	20002674 <print_s>
200028d8:	30541073          	csrw	mtvec,s0
200028dc:	40b2                	lw	ra,12(sp)
200028de:	4422                	lw	s0,8(sp)
200028e0:	0141                	add	sp,sp,16
200028e2:	8082                	ret

200028e4 <enter_smode>:
200028e4:	6789                	lui	a5,0x2
200028e6:	80078793          	add	a5,a5,-2048 # 1800 <_start-0x1fffe800>
200028ea:	3007b073          	csrc	mstatus,a5
200028ee:	6785                	lui	a5,0x1
200028f0:	80078793          	add	a5,a5,-2048 # 800 <_start-0x1ffff800>
200028f4:	3007a073          	csrs	mstatus,a5
200028f8:	00000517          	auipc	a0,0x0
200028fc:	01050513          	add	a0,a0,16 # 20002908 <enter_smode+0x24>
20002900:	34151073          	csrw	mepc,a0
20002904:	30200073          	mret
20002908:	00008067          	ret

2000290c <__divdi3>:
2000290c:	4801                	li	a6,0
2000290e:	0e05c863          	bltz	a1,200029fe <__divdi3+0xf2>
20002912:	0006db63          	bgez	a3,20002928 <__divdi3+0x1c>
20002916:	00c037b3          	snez	a5,a2
2000291a:	40d006b3          	neg	a3,a3
2000291e:	fff84813          	not	a6,a6
20002922:	8e9d                	sub	a3,a3,a5
20002924:	40c00633          	neg	a2,a2
20002928:	88b2                	mv	a7,a2
2000292a:	872a                	mv	a4,a0
2000292c:	832e                	mv	t1,a1
2000292e:	e2f9                	bnez	a3,200029f4 <__divdi3+0xe8>
20002930:	12c5f163          	bgeu	a1,a2,20002a52 <__divdi3+0x146>
20002934:	67c1                	lui	a5,0x10
20002936:	1af66c63          	bltu	a2,a5,20002aee <__divdi3+0x1e2>
2000293a:	010007b7          	lui	a5,0x1000
2000293e:	46e1                	li	a3,24
20002940:	00f67363          	bgeu	a2,a5,20002946 <__divdi3+0x3a>
20002944:	46c1                	li	a3,16
20002946:	200147b7          	lui	a5,0x20014
2000294a:	00d65e33          	srl	t3,a2,a3
2000294e:	a4878793          	add	a5,a5,-1464 # 20013a48 <__clz_tab>
20002952:	97f2                	add	a5,a5,t3
20002954:	0007c783          	lbu	a5,0(a5)
20002958:	02000e13          	li	t3,32
2000295c:	97b6                	add	a5,a5,a3
2000295e:	40fe06b3          	sub	a3,t3,a5
20002962:	00fe0c63          	beq	t3,a5,2000297a <__divdi3+0x6e>
20002966:	00d59333          	sll	t1,a1,a3
2000296a:	00f557b3          	srl	a5,a0,a5
2000296e:	00d618b3          	sll	a7,a2,a3
20002972:	0067e333          	or	t1,a5,t1
20002976:	00d51733          	sll	a4,a0,a3
2000297a:	0108d613          	srl	a2,a7,0x10
2000297e:	02c35533          	divu	a0,t1,a2
20002982:	01089693          	sll	a3,a7,0x10
20002986:	82c1                	srl	a3,a3,0x10
20002988:	01075793          	srl	a5,a4,0x10
2000298c:	02c37333          	remu	t1,t1,a2
20002990:	02a685b3          	mul	a1,a3,a0
20002994:	0342                	sll	t1,t1,0x10
20002996:	0067e7b3          	or	a5,a5,t1
2000299a:	00b7fa63          	bgeu	a5,a1,200029ae <__divdi3+0xa2>
2000299e:	97c6                	add	a5,a5,a7
200029a0:	fff50313          	add	t1,a0,-1
200029a4:	0117e463          	bltu	a5,a7,200029ac <__divdi3+0xa0>
200029a8:	30b7ee63          	bltu	a5,a1,20002cc4 <__divdi3+0x3b8>
200029ac:	851a                	mv	a0,t1
200029ae:	8f8d                	sub	a5,a5,a1
200029b0:	02c7d5b3          	divu	a1,a5,a2
200029b4:	0742                	sll	a4,a4,0x10
200029b6:	8341                	srl	a4,a4,0x10
200029b8:	02c7f7b3          	remu	a5,a5,a2
200029bc:	02b686b3          	mul	a3,a3,a1
200029c0:	07c2                	sll	a5,a5,0x10
200029c2:	8f5d                	or	a4,a4,a5
200029c4:	00d77b63          	bgeu	a4,a3,200029da <__divdi3+0xce>
200029c8:	9746                	add	a4,a4,a7
200029ca:	fff58793          	add	a5,a1,-1
200029ce:	01176563          	bltu	a4,a7,200029d8 <__divdi3+0xcc>
200029d2:	15f9                	add	a1,a1,-2
200029d4:	00d76363          	bltu	a4,a3,200029da <__divdi3+0xce>
200029d8:	85be                	mv	a1,a5
200029da:	0542                	sll	a0,a0,0x10
200029dc:	8d4d                	or	a0,a0,a1
200029de:	4581                	li	a1,0
200029e0:	00080963          	beqz	a6,200029f2 <__divdi3+0xe6>
200029e4:	00a037b3          	snez	a5,a0
200029e8:	40b005b3          	neg	a1,a1
200029ec:	8d9d                	sub	a1,a1,a5
200029ee:	40a00533          	neg	a0,a0
200029f2:	8082                	ret
200029f4:	00d5fe63          	bgeu	a1,a3,20002a10 <__divdi3+0x104>
200029f8:	4581                	li	a1,0
200029fa:	4501                	li	a0,0
200029fc:	b7d5                	j	200029e0 <__divdi3+0xd4>
200029fe:	00a037b3          	snez	a5,a0
20002a02:	40b005b3          	neg	a1,a1
20002a06:	8d9d                	sub	a1,a1,a5
20002a08:	40a00533          	neg	a0,a0
20002a0c:	587d                	li	a6,-1
20002a0e:	b711                	j	20002912 <__divdi3+0x6>
20002a10:	67c1                	lui	a5,0x10
20002a12:	18f6e663          	bltu	a3,a5,20002b9e <__divdi3+0x292>
20002a16:	010007b7          	lui	a5,0x1000
20002a1a:	48e1                	li	a7,24
20002a1c:	00f6f363          	bgeu	a3,a5,20002a22 <__divdi3+0x116>
20002a20:	48c1                	li	a7,16
20002a22:	200147b7          	lui	a5,0x20014
20002a26:	0116d733          	srl	a4,a3,a7
20002a2a:	a4878793          	add	a5,a5,-1464 # 20013a48 <__clz_tab>
20002a2e:	97ba                	add	a5,a5,a4
20002a30:	0007c703          	lbu	a4,0(a5)
20002a34:	02000793          	li	a5,32
20002a38:	9746                	add	a4,a4,a7
20002a3a:	40e788b3          	sub	a7,a5,a4
20002a3e:	16e79663          	bne	a5,a4,20002baa <__divdi3+0x29e>
20002a42:	26b6e363          	bltu	a3,a1,20002ca8 <__divdi3+0x39c>
20002a46:	00c53533          	sltu	a0,a0,a2
20002a4a:	00153513          	seqz	a0,a0
20002a4e:	4581                	li	a1,0
20002a50:	bf41                	j	200029e0 <__divdi3+0xd4>
20002a52:	c645                	beqz	a2,20002afa <__divdi3+0x1ee>
20002a54:	67c1                	lui	a5,0x10
20002a56:	24f67163          	bgeu	a2,a5,20002c98 <__divdi3+0x38c>
20002a5a:	10063313          	sltiu	t1,a2,256
20002a5e:	00133313          	seqz	t1,t1
20002a62:	030e                	sll	t1,t1,0x3
20002a64:	006656b3          	srl	a3,a2,t1
20002a68:	200147b7          	lui	a5,0x20014
20002a6c:	a4878793          	add	a5,a5,-1464 # 20013a48 <__clz_tab>
20002a70:	97b6                	add	a5,a5,a3
20002a72:	0007c683          	lbu	a3,0(a5)
20002a76:	02000793          	li	a5,32
20002a7a:	969a                	add	a3,a3,t1
20002a7c:	40d78eb3          	sub	t4,a5,a3
20002a80:	08d79d63          	bne	a5,a3,20002b1a <__divdi3+0x20e>
20002a84:	40c586b3          	sub	a3,a1,a2
20002a88:	01065313          	srl	t1,a2,0x10
20002a8c:	0642                	sll	a2,a2,0x10
20002a8e:	8241                	srl	a2,a2,0x10
20002a90:	4585                	li	a1,1
20002a92:	0266d533          	divu	a0,a3,t1
20002a96:	01075793          	srl	a5,a4,0x10
20002a9a:	0266f6b3          	remu	a3,a3,t1
20002a9e:	02c50e33          	mul	t3,a0,a2
20002aa2:	06c2                	sll	a3,a3,0x10
20002aa4:	8fd5                	or	a5,a5,a3
20002aa6:	01c7fa63          	bgeu	a5,t3,20002aba <__divdi3+0x1ae>
20002aaa:	97c6                	add	a5,a5,a7
20002aac:	fff50693          	add	a3,a0,-1
20002ab0:	0117e463          	bltu	a5,a7,20002ab8 <__divdi3+0x1ac>
20002ab4:	21c7e563          	bltu	a5,t3,20002cbe <__divdi3+0x3b2>
20002ab8:	8536                	mv	a0,a3
20002aba:	41c787b3          	sub	a5,a5,t3
20002abe:	0267d6b3          	divu	a3,a5,t1
20002ac2:	0742                	sll	a4,a4,0x10
20002ac4:	8341                	srl	a4,a4,0x10
20002ac6:	0267f7b3          	remu	a5,a5,t1
20002aca:	02c68633          	mul	a2,a3,a2
20002ace:	07c2                	sll	a5,a5,0x10
20002ad0:	8f5d                	or	a4,a4,a5
20002ad2:	00c77b63          	bgeu	a4,a2,20002ae8 <__divdi3+0x1dc>
20002ad6:	9746                	add	a4,a4,a7
20002ad8:	fff68793          	add	a5,a3,-1
20002adc:	01176563          	bltu	a4,a7,20002ae6 <__divdi3+0x1da>
20002ae0:	16f9                	add	a3,a3,-2
20002ae2:	00c76363          	bltu	a4,a2,20002ae8 <__divdi3+0x1dc>
20002ae6:	86be                	mv	a3,a5
20002ae8:	0542                	sll	a0,a0,0x10
20002aea:	8d55                	or	a0,a0,a3
20002aec:	bdd5                	j	200029e0 <__divdi3+0xd4>
20002aee:	10063693          	sltiu	a3,a2,256
20002af2:	0016b693          	seqz	a3,a3
20002af6:	068e                	sll	a3,a3,0x3
20002af8:	b5b9                	j	20002946 <__divdi3+0x3a>
20002afa:	200147b7          	lui	a5,0x20014
20002afe:	4681                	li	a3,0
20002b00:	a4878793          	add	a5,a5,-1464 # 20013a48 <__clz_tab>
20002b04:	97b6                	add	a5,a5,a3
20002b06:	0007c683          	lbu	a3,0(a5)
20002b0a:	4301                	li	t1,0
20002b0c:	02000793          	li	a5,32
20002b10:	969a                	add	a3,a3,t1
20002b12:	40d78eb3          	sub	t4,a5,a3
20002b16:	f6d787e3          	beq	a5,a3,20002a84 <__divdi3+0x178>
20002b1a:	01d618b3          	sll	a7,a2,t4
20002b1e:	00d5de33          	srl	t3,a1,a3
20002b22:	0108d313          	srl	t1,a7,0x10
20002b26:	026e57b3          	divu	a5,t3,t1
20002b2a:	01089613          	sll	a2,a7,0x10
20002b2e:	8241                	srl	a2,a2,0x10
20002b30:	00d556b3          	srl	a3,a0,a3
20002b34:	01d51733          	sll	a4,a0,t4
20002b38:	01d595b3          	sll	a1,a1,t4
20002b3c:	8ecd                	or	a3,a3,a1
20002b3e:	0106d593          	srl	a1,a3,0x10
20002b42:	026e7e33          	remu	t3,t3,t1
20002b46:	02f60533          	mul	a0,a2,a5
20002b4a:	0e42                	sll	t3,t3,0x10
20002b4c:	01c5e5b3          	or	a1,a1,t3
20002b50:	00a5fb63          	bgeu	a1,a0,20002b66 <__divdi3+0x25a>
20002b54:	95c6                	add	a1,a1,a7
20002b56:	fff78e13          	add	t3,a5,-1
20002b5a:	1515ee63          	bltu	a1,a7,20002cb6 <__divdi3+0x3aa>
20002b5e:	14a5fc63          	bgeu	a1,a0,20002cb6 <__divdi3+0x3aa>
20002b62:	17f9                	add	a5,a5,-2
20002b64:	95c6                	add	a1,a1,a7
20002b66:	8d89                	sub	a1,a1,a0
20002b68:	0265d533          	divu	a0,a1,t1
20002b6c:	06c2                	sll	a3,a3,0x10
20002b6e:	82c1                	srl	a3,a3,0x10
20002b70:	0265f5b3          	remu	a1,a1,t1
20002b74:	02a60e33          	mul	t3,a2,a0
20002b78:	05c2                	sll	a1,a1,0x10
20002b7a:	8ecd                	or	a3,a3,a1
20002b7c:	01c6fb63          	bgeu	a3,t3,20002b92 <__divdi3+0x286>
20002b80:	96c6                	add	a3,a3,a7
20002b82:	fff50593          	add	a1,a0,-1
20002b86:	1316e463          	bltu	a3,a7,20002cae <__divdi3+0x3a2>
20002b8a:	13c6f263          	bgeu	a3,t3,20002cae <__divdi3+0x3a2>
20002b8e:	1579                	add	a0,a0,-2
20002b90:	96c6                	add	a3,a3,a7
20002b92:	01079593          	sll	a1,a5,0x10
20002b96:	41c686b3          	sub	a3,a3,t3
20002b9a:	8dc9                	or	a1,a1,a0
20002b9c:	bddd                	j	20002a92 <__divdi3+0x186>
20002b9e:	1006b893          	sltiu	a7,a3,256
20002ba2:	0018b893          	seqz	a7,a7
20002ba6:	088e                	sll	a7,a7,0x3
20002ba8:	bdad                	j	20002a22 <__divdi3+0x116>
20002baa:	00e65eb3          	srl	t4,a2,a4
20002bae:	011696b3          	sll	a3,a3,a7
20002bb2:	00deeeb3          	or	t4,t4,a3
20002bb6:	00e5d333          	srl	t1,a1,a4
20002bba:	010edf13          	srl	t5,t4,0x10
20002bbe:	03e357b3          	divu	a5,t1,t5
20002bc2:	010e9e13          	sll	t3,t4,0x10
20002bc6:	011595b3          	sll	a1,a1,a7
20002bca:	010e5e13          	srl	t3,t3,0x10
20002bce:	00e55733          	srl	a4,a0,a4
20002bd2:	8f4d                	or	a4,a4,a1
20002bd4:	01075693          	srl	a3,a4,0x10
20002bd8:	01161633          	sll	a2,a2,a7
20002bdc:	03e37333          	remu	t1,t1,t5
20002be0:	02fe05b3          	mul	a1,t3,a5
20002be4:	0342                	sll	t1,t1,0x10
20002be6:	0066e6b3          	or	a3,a3,t1
20002bea:	00b6fb63          	bgeu	a3,a1,20002c00 <__divdi3+0x2f4>
20002bee:	96f6                	add	a3,a3,t4
20002bf0:	fff78313          	add	t1,a5,-1
20002bf4:	0dd6e363          	bltu	a3,t4,20002cba <__divdi3+0x3ae>
20002bf8:	0cb6f163          	bgeu	a3,a1,20002cba <__divdi3+0x3ae>
20002bfc:	17f9                	add	a5,a5,-2
20002bfe:	96f6                	add	a3,a3,t4
20002c00:	8e8d                	sub	a3,a3,a1
20002c02:	03e6d5b3          	divu	a1,a3,t5
20002c06:	0742                	sll	a4,a4,0x10
20002c08:	8341                	srl	a4,a4,0x10
20002c0a:	03e6f6b3          	remu	a3,a3,t5
20002c0e:	02be0333          	mul	t1,t3,a1
20002c12:	06c2                	sll	a3,a3,0x10
20002c14:	8f55                	or	a4,a4,a3
20002c16:	00677b63          	bgeu	a4,t1,20002c2c <__divdi3+0x320>
20002c1a:	9776                	add	a4,a4,t4
20002c1c:	fff58693          	add	a3,a1,-1
20002c20:	09d76963          	bltu	a4,t4,20002cb2 <__divdi3+0x3a6>
20002c24:	08677763          	bgeu	a4,t1,20002cb2 <__divdi3+0x3a6>
20002c28:	15f9                	add	a1,a1,-2
20002c2a:	9776                	add	a4,a4,t4
20002c2c:	07c2                	sll	a5,a5,0x10
20002c2e:	6f41                	lui	t5,0x10
20002c30:	8fcd                	or	a5,a5,a1
20002c32:	ffff0693          	add	a3,t5,-1 # ffff <_start-0x1fff0001>
20002c36:	00d7f5b3          	and	a1,a5,a3
20002c3a:	0107de13          	srl	t3,a5,0x10
20002c3e:	8ef1                	and	a3,a3,a2
20002c40:	8241                	srl	a2,a2,0x10
20002c42:	02d58eb3          	mul	t4,a1,a3
20002c46:	40670733          	sub	a4,a4,t1
20002c4a:	02de06b3          	mul	a3,t3,a3
20002c4e:	010ed313          	srl	t1,t4,0x10
20002c52:	02c585b3          	mul	a1,a1,a2
20002c56:	95b6                	add	a1,a1,a3
20002c58:	959a                	add	a1,a1,t1
20002c5a:	02ce0e33          	mul	t3,t3,a2
20002c5e:	00d5f363          	bgeu	a1,a3,20002c64 <__divdi3+0x358>
20002c62:	9e7a                	add	t3,t3,t5
20002c64:	0105d693          	srl	a3,a1,0x10
20002c68:	96f2                	add	a3,a3,t3
20002c6a:	02d76363          	bltu	a4,a3,20002c90 <__divdi3+0x384>
20002c6e:	00d70563          	beq	a4,a3,20002c78 <__divdi3+0x36c>
20002c72:	853e                	mv	a0,a5
20002c74:	4581                	li	a1,0
20002c76:	b3ad                	j	200029e0 <__divdi3+0xd4>
20002c78:	66c1                	lui	a3,0x10
20002c7a:	16fd                	add	a3,a3,-1 # ffff <_start-0x1fff0001>
20002c7c:	00d5f733          	and	a4,a1,a3
20002c80:	0742                	sll	a4,a4,0x10
20002c82:	00defeb3          	and	t4,t4,a3
20002c86:	01151533          	sll	a0,a0,a7
20002c8a:	9776                	add	a4,a4,t4
20002c8c:	fee573e3          	bgeu	a0,a4,20002c72 <__divdi3+0x366>
20002c90:	fff78513          	add	a0,a5,-1
20002c94:	4581                	li	a1,0
20002c96:	b3a9                	j	200029e0 <__divdi3+0xd4>
20002c98:	010007b7          	lui	a5,0x1000
20002c9c:	02f67763          	bgeu	a2,a5,20002cca <__divdi3+0x3be>
20002ca0:	01065693          	srl	a3,a2,0x10
20002ca4:	4341                	li	t1,16
20002ca6:	b3c9                	j	20002a68 <__divdi3+0x15c>
20002ca8:	4581                	li	a1,0
20002caa:	4505                	li	a0,1
20002cac:	bb15                	j	200029e0 <__divdi3+0xd4>
20002cae:	852e                	mv	a0,a1
20002cb0:	b5cd                	j	20002b92 <__divdi3+0x286>
20002cb2:	85b6                	mv	a1,a3
20002cb4:	bfa5                	j	20002c2c <__divdi3+0x320>
20002cb6:	87f2                	mv	a5,t3
20002cb8:	b57d                	j	20002b66 <__divdi3+0x25a>
20002cba:	879a                	mv	a5,t1
20002cbc:	b791                	j	20002c00 <__divdi3+0x2f4>
20002cbe:	1579                	add	a0,a0,-2
20002cc0:	97c6                	add	a5,a5,a7
20002cc2:	bbe5                	j	20002aba <__divdi3+0x1ae>
20002cc4:	1579                	add	a0,a0,-2
20002cc6:	97c6                	add	a5,a5,a7
20002cc8:	b1dd                	j	200029ae <__divdi3+0xa2>
20002cca:	01865693          	srl	a3,a2,0x18
20002cce:	4361                	li	t1,24
20002cd0:	bb61                	j	20002a68 <__divdi3+0x15c>

20002cd2 <__moddi3>:
20002cd2:	4701                	li	a4,0
20002cd4:	1205c663          	bltz	a1,20002e00 <__moddi3+0x12e>
20002cd8:	0006d963          	bgez	a3,20002cea <__moddi3+0x18>
20002cdc:	00c037b3          	snez	a5,a2
20002ce0:	40d006b3          	neg	a3,a3
20002ce4:	8e9d                	sub	a3,a3,a5
20002ce6:	40c00633          	neg	a2,a2
20002cea:	8832                	mv	a6,a2
20002cec:	8e2a                	mv	t3,a0
20002cee:	832e                	mv	t1,a1
20002cf0:	eed5                	bnez	a3,20002dac <__moddi3+0xda>
20002cf2:	12c5f063          	bgeu	a1,a2,20002e12 <__moddi3+0x140>
20002cf6:	67c1                	lui	a5,0x10
20002cf8:	18f66f63          	bltu	a2,a5,20002e96 <__moddi3+0x1c4>
20002cfc:	010007b7          	lui	a5,0x1000
20002d00:	46e1                	li	a3,24
20002d02:	00f67363          	bgeu	a2,a5,20002d08 <__moddi3+0x36>
20002d06:	46c1                	li	a3,16
20002d08:	200147b7          	lui	a5,0x20014
20002d0c:	00d658b3          	srl	a7,a2,a3
20002d10:	a4878793          	add	a5,a5,-1464 # 20013a48 <__clz_tab>
20002d14:	97c6                	add	a5,a5,a7
20002d16:	0007c783          	lbu	a5,0(a5)
20002d1a:	02000e93          	li	t4,32
20002d1e:	97b6                	add	a5,a5,a3
20002d20:	40fe88b3          	sub	a7,t4,a5
20002d24:	00fe8c63          	beq	t4,a5,20002d3c <__moddi3+0x6a>
20002d28:	01159333          	sll	t1,a1,a7
20002d2c:	00f557b3          	srl	a5,a0,a5
20002d30:	01161833          	sll	a6,a2,a7
20002d34:	0067e333          	or	t1,a5,t1
20002d38:	01151e33          	sll	t3,a0,a7
20002d3c:	01085613          	srl	a2,a6,0x10
20002d40:	02c356b3          	divu	a3,t1,a2
20002d44:	01081593          	sll	a1,a6,0x10
20002d48:	81c1                	srl	a1,a1,0x10
20002d4a:	010e5793          	srl	a5,t3,0x10
20002d4e:	02c37333          	remu	t1,t1,a2
20002d52:	02b686b3          	mul	a3,a3,a1
20002d56:	0342                	sll	t1,t1,0x10
20002d58:	0067e7b3          	or	a5,a5,t1
20002d5c:	00d7f763          	bgeu	a5,a3,20002d6a <__moddi3+0x98>
20002d60:	97c2                	add	a5,a5,a6
20002d62:	0107e463          	bltu	a5,a6,20002d6a <__moddi3+0x98>
20002d66:	30d7e363          	bltu	a5,a3,2000306c <__moddi3+0x39a>
20002d6a:	8f95                	sub	a5,a5,a3
20002d6c:	02c7d6b3          	divu	a3,a5,a2
20002d70:	010e1513          	sll	a0,t3,0x10
20002d74:	8141                	srl	a0,a0,0x10
20002d76:	02c7f7b3          	remu	a5,a5,a2
20002d7a:	02b686b3          	mul	a3,a3,a1
20002d7e:	07c2                	sll	a5,a5,0x10
20002d80:	8d5d                	or	a0,a0,a5
20002d82:	00d57863          	bgeu	a0,a3,20002d92 <__moddi3+0xc0>
20002d86:	9542                	add	a0,a0,a6
20002d88:	01056563          	bltu	a0,a6,20002d92 <__moddi3+0xc0>
20002d8c:	00d57363          	bgeu	a0,a3,20002d92 <__moddi3+0xc0>
20002d90:	9542                	add	a0,a0,a6
20002d92:	8d15                	sub	a0,a0,a3
20002d94:	01155533          	srl	a0,a0,a7
20002d98:	4581                	li	a1,0
20002d9a:	cb01                	beqz	a4,20002daa <__moddi3+0xd8>
20002d9c:	00a037b3          	snez	a5,a0
20002da0:	40b005b3          	neg	a1,a1
20002da4:	8d9d                	sub	a1,a1,a5
20002da6:	40a00533          	neg	a0,a0
20002daa:	8082                	ret
20002dac:	832a                	mv	t1,a0
20002dae:	fed5e6e3          	bltu	a1,a3,20002d9a <__moddi3+0xc8>
20002db2:	67c1                	lui	a5,0x10
20002db4:	16f6ef63          	bltu	a3,a5,20002f32 <__moddi3+0x260>
20002db8:	010007b7          	lui	a5,0x1000
20002dbc:	48e1                	li	a7,24
20002dbe:	00f6f363          	bgeu	a3,a5,20002dc4 <__moddi3+0xf2>
20002dc2:	48c1                	li	a7,16
20002dc4:	200147b7          	lui	a5,0x20014
20002dc8:	0116d833          	srl	a6,a3,a7
20002dcc:	a4878793          	add	a5,a5,-1464 # 20013a48 <__clz_tab>
20002dd0:	97c2                	add	a5,a5,a6
20002dd2:	0007c803          	lbu	a6,0(a5)
20002dd6:	02000793          	li	a5,32
20002dda:	9846                	add	a6,a6,a7
20002ddc:	410788b3          	sub	a7,a5,a6
20002de0:	15079f63          	bne	a5,a6,20002f3e <__moddi3+0x26c>
20002de4:	00b6e463          	bltu	a3,a1,20002dec <__moddi3+0x11a>
20002de8:	00c56a63          	bltu	a0,a2,20002dfc <__moddi3+0x12a>
20002dec:	40c50333          	sub	t1,a0,a2
20002df0:	40d586b3          	sub	a3,a1,a3
20002df4:	006535b3          	sltu	a1,a0,t1
20002df8:	40b685b3          	sub	a1,a3,a1
20002dfc:	851a                	mv	a0,t1
20002dfe:	bf71                	j	20002d9a <__moddi3+0xc8>
20002e00:	00a037b3          	snez	a5,a0
20002e04:	40b005b3          	neg	a1,a1
20002e08:	8d9d                	sub	a1,a1,a5
20002e0a:	40a00533          	neg	a0,a0
20002e0e:	577d                	li	a4,-1
20002e10:	b5e1                	j	20002cd8 <__moddi3+0x6>
20002e12:	ca41                	beqz	a2,20002ea2 <__moddi3+0x1d0>
20002e14:	67c1                	lui	a5,0x10
20002e16:	22f67f63          	bgeu	a2,a5,20003054 <__moddi3+0x382>
20002e1a:	10063693          	sltiu	a3,a2,256
20002e1e:	0016b693          	seqz	a3,a3
20002e22:	068e                	sll	a3,a3,0x3
20002e24:	00d658b3          	srl	a7,a2,a3
20002e28:	200147b7          	lui	a5,0x20014
20002e2c:	a4878793          	add	a5,a5,-1464 # 20013a48 <__clz_tab>
20002e30:	97c6                	add	a5,a5,a7
20002e32:	0007c783          	lbu	a5,0(a5)
20002e36:	02000313          	li	t1,32
20002e3a:	97b6                	add	a5,a5,a3
20002e3c:	40f308b3          	sub	a7,t1,a5
20002e40:	08f31163          	bne	t1,a5,20002ec2 <__moddi3+0x1f0>
20002e44:	40c586b3          	sub	a3,a1,a2
20002e48:	01065313          	srl	t1,a2,0x10
20002e4c:	0642                	sll	a2,a2,0x10
20002e4e:	8241                	srl	a2,a2,0x10
20002e50:	0266d5b3          	divu	a1,a3,t1
20002e54:	010e5793          	srl	a5,t3,0x10
20002e58:	0266f6b3          	remu	a3,a3,t1
20002e5c:	02c585b3          	mul	a1,a1,a2
20002e60:	06c2                	sll	a3,a3,0x10
20002e62:	8fd5                	or	a5,a5,a3
20002e64:	00b7f863          	bgeu	a5,a1,20002e74 <__moddi3+0x1a2>
20002e68:	97c2                	add	a5,a5,a6
20002e6a:	0107e563          	bltu	a5,a6,20002e74 <__moddi3+0x1a2>
20002e6e:	00b7f363          	bgeu	a5,a1,20002e74 <__moddi3+0x1a2>
20002e72:	97c2                	add	a5,a5,a6
20002e74:	8f8d                	sub	a5,a5,a1
20002e76:	0267d6b3          	divu	a3,a5,t1
20002e7a:	0e42                	sll	t3,t3,0x10
20002e7c:	010e5e13          	srl	t3,t3,0x10
20002e80:	0267f7b3          	remu	a5,a5,t1
20002e84:	02c686b3          	mul	a3,a3,a2
20002e88:	01079513          	sll	a0,a5,0x10
20002e8c:	00ae6533          	or	a0,t3,a0
20002e90:	f0d571e3          	bgeu	a0,a3,20002d92 <__moddi3+0xc0>
20002e94:	bdcd                	j	20002d86 <__moddi3+0xb4>
20002e96:	10063693          	sltiu	a3,a2,256
20002e9a:	0016b693          	seqz	a3,a3
20002e9e:	068e                	sll	a3,a3,0x3
20002ea0:	b5a5                	j	20002d08 <__moddi3+0x36>
20002ea2:	200147b7          	lui	a5,0x20014
20002ea6:	4881                	li	a7,0
20002ea8:	a4878793          	add	a5,a5,-1464 # 20013a48 <__clz_tab>
20002eac:	97c6                	add	a5,a5,a7
20002eae:	0007c783          	lbu	a5,0(a5)
20002eb2:	4681                	li	a3,0
20002eb4:	02000313          	li	t1,32
20002eb8:	97b6                	add	a5,a5,a3
20002eba:	40f308b3          	sub	a7,t1,a5
20002ebe:	f8f303e3          	beq	t1,a5,20002e44 <__moddi3+0x172>
20002ec2:	01161833          	sll	a6,a2,a7
20002ec6:	00f5deb3          	srl	t4,a1,a5
20002eca:	01085313          	srl	t1,a6,0x10
20002ece:	026edf33          	divu	t5,t4,t1
20002ed2:	01081613          	sll	a2,a6,0x10
20002ed6:	011595b3          	sll	a1,a1,a7
20002eda:	00f556b3          	srl	a3,a0,a5
20002ede:	8241                	srl	a2,a2,0x10
20002ee0:	8ecd                	or	a3,a3,a1
20002ee2:	0106d793          	srl	a5,a3,0x10
20002ee6:	01151e33          	sll	t3,a0,a7
20002eea:	026efeb3          	remu	t4,t4,t1
20002eee:	02cf05b3          	mul	a1,t5,a2
20002ef2:	0ec2                	sll	t4,t4,0x10
20002ef4:	01d7e7b3          	or	a5,a5,t4
20002ef8:	00b7f863          	bgeu	a5,a1,20002f08 <__moddi3+0x236>
20002efc:	97c2                	add	a5,a5,a6
20002efe:	0107e563          	bltu	a5,a6,20002f08 <__moddi3+0x236>
20002f02:	00b7f363          	bgeu	a5,a1,20002f08 <__moddi3+0x236>
20002f06:	97c2                	add	a5,a5,a6
20002f08:	8f8d                	sub	a5,a5,a1
20002f0a:	0267d5b3          	divu	a1,a5,t1
20002f0e:	06c2                	sll	a3,a3,0x10
20002f10:	82c1                	srl	a3,a3,0x10
20002f12:	0267f7b3          	remu	a5,a5,t1
20002f16:	02c585b3          	mul	a1,a1,a2
20002f1a:	07c2                	sll	a5,a5,0x10
20002f1c:	8edd                	or	a3,a3,a5
20002f1e:	00b6f863          	bgeu	a3,a1,20002f2e <__moddi3+0x25c>
20002f22:	96c2                	add	a3,a3,a6
20002f24:	0106e563          	bltu	a3,a6,20002f2e <__moddi3+0x25c>
20002f28:	00b6f363          	bgeu	a3,a1,20002f2e <__moddi3+0x25c>
20002f2c:	96c2                	add	a3,a3,a6
20002f2e:	8e8d                	sub	a3,a3,a1
20002f30:	b705                	j	20002e50 <__moddi3+0x17e>
20002f32:	1006b893          	sltiu	a7,a3,256
20002f36:	0018b893          	seqz	a7,a7
20002f3a:	088e                	sll	a7,a7,0x3
20002f3c:	b561                	j	20002dc4 <__moddi3+0xf2>
20002f3e:	011696b3          	sll	a3,a3,a7
20002f42:	01065333          	srl	t1,a2,a6
20002f46:	00d36333          	or	t1,t1,a3
20002f4a:	0105deb3          	srl	t4,a1,a6
20002f4e:	01035f93          	srl	t6,t1,0x10
20002f52:	03fed7b3          	divu	a5,t4,t6
20002f56:	01031f13          	sll	t5,t1,0x10
20002f5a:	010f5f13          	srl	t5,t5,0x10
20002f5e:	010556b3          	srl	a3,a0,a6
20002f62:	01151e33          	sll	t3,a0,a7
20002f66:	011595b3          	sll	a1,a1,a7
20002f6a:	8dd5                	or	a1,a1,a3
20002f6c:	0105d693          	srl	a3,a1,0x10
20002f70:	01161633          	sll	a2,a2,a7
20002f74:	03fefeb3          	remu	t4,t4,t6
20002f78:	02ff0533          	mul	a0,t5,a5
20002f7c:	0ec2                	sll	t4,t4,0x10
20002f7e:	01d6e6b3          	or	a3,a3,t4
20002f82:	00a6fb63          	bgeu	a3,a0,20002f98 <__moddi3+0x2c6>
20002f86:	969a                	add	a3,a3,t1
20002f88:	fff78e93          	add	t4,a5,-1
20002f8c:	0c66ee63          	bltu	a3,t1,20003068 <__moddi3+0x396>
20002f90:	0ca6fc63          	bgeu	a3,a0,20003068 <__moddi3+0x396>
20002f94:	17f9                	add	a5,a5,-2
20002f96:	969a                	add	a3,a3,t1
20002f98:	8e89                	sub	a3,a3,a0
20002f9a:	03f6d533          	divu	a0,a3,t6
20002f9e:	05c2                	sll	a1,a1,0x10
20002fa0:	81c1                	srl	a1,a1,0x10
20002fa2:	03f6f6b3          	remu	a3,a3,t6
20002fa6:	02af0f33          	mul	t5,t5,a0
20002faa:	06c2                	sll	a3,a3,0x10
20002fac:	8dd5                	or	a1,a1,a3
20002fae:	01e5fb63          	bgeu	a1,t5,20002fc4 <__moddi3+0x2f2>
20002fb2:	959a                	add	a1,a1,t1
20002fb4:	fff50693          	add	a3,a0,-1
20002fb8:	0a65e663          	bltu	a1,t1,20003064 <__moddi3+0x392>
20002fbc:	0be5f463          	bgeu	a1,t5,20003064 <__moddi3+0x392>
20002fc0:	1579                	add	a0,a0,-2
20002fc2:	959a                	add	a1,a1,t1
20002fc4:	01079693          	sll	a3,a5,0x10
20002fc8:	63c1                	lui	t2,0x10
20002fca:	8ec9                	or	a3,a3,a0
20002fcc:	fff38513          	add	a0,t2,-1 # ffff <_start-0x1fff0001>
20002fd0:	00a6feb3          	and	t4,a3,a0
20002fd4:	01065293          	srl	t0,a2,0x10
20002fd8:	82c1                	srl	a3,a3,0x10
20002fda:	8d71                	and	a0,a0,a2
20002fdc:	02ae8fb3          	mul	t6,t4,a0
20002fe0:	41e585b3          	sub	a1,a1,t5
20002fe4:	02a68533          	mul	a0,a3,a0
20002fe8:	010fd793          	srl	a5,t6,0x10
20002fec:	025e8eb3          	mul	t4,t4,t0
20002ff0:	9eaa                	add	t4,t4,a0
20002ff2:	97f6                	add	a5,a5,t4
20002ff4:	025686b3          	mul	a3,a3,t0
20002ff8:	00a7f363          	bgeu	a5,a0,20002ffe <__moddi3+0x32c>
20002ffc:	969e                	add	a3,a3,t2
20002ffe:	6f41                	lui	t5,0x10
20003000:	1f7d                	add	t5,t5,-1 # ffff <_start-0x1fff0001>
20003002:	01e7f533          	and	a0,a5,t5
20003006:	0107de93          	srl	t4,a5,0x10
2000300a:	0542                	sll	a0,a0,0x10
2000300c:	01efffb3          	and	t6,t6,t5
20003010:	00de87b3          	add	a5,t4,a3
20003014:	957e                	add	a0,a0,t6
20003016:	02f5e663          	bltu	a1,a5,20003042 <__moddi3+0x370>
2000301a:	02f58263          	beq	a1,a5,2000303e <__moddi3+0x36c>
2000301e:	40ae0533          	sub	a0,t3,a0
20003022:	00ae3e33          	sltu	t3,t3,a0
20003026:	8d9d                	sub	a1,a1,a5
20003028:	41c585b3          	sub	a1,a1,t3
2000302c:	01059833          	sll	a6,a1,a6
20003030:	01155533          	srl	a0,a0,a7
20003034:	00a86533          	or	a0,a6,a0
20003038:	0115d5b3          	srl	a1,a1,a7
2000303c:	bbb9                	j	20002d9a <__moddi3+0xc8>
2000303e:	feae70e3          	bgeu	t3,a0,2000301e <__moddi3+0x34c>
20003042:	40c50633          	sub	a2,a0,a2
20003046:	00c53533          	sltu	a0,a0,a2
2000304a:	932a                	add	t1,t1,a0
2000304c:	406787b3          	sub	a5,a5,t1
20003050:	8532                	mv	a0,a2
20003052:	b7f1                	j	2000301e <__moddi3+0x34c>
20003054:	010007b7          	lui	a5,0x1000
20003058:	00f67c63          	bgeu	a2,a5,20003070 <__moddi3+0x39e>
2000305c:	01065893          	srl	a7,a2,0x10
20003060:	46c1                	li	a3,16
20003062:	b3d9                	j	20002e28 <__moddi3+0x156>
20003064:	8536                	mv	a0,a3
20003066:	bfb9                	j	20002fc4 <__moddi3+0x2f2>
20003068:	87f6                	mv	a5,t4
2000306a:	b73d                	j	20002f98 <__moddi3+0x2c6>
2000306c:	97c2                	add	a5,a5,a6
2000306e:	b9f5                	j	20002d6a <__moddi3+0x98>
20003070:	01865893          	srl	a7,a2,0x18
20003074:	46e1                	li	a3,24
20003076:	bb4d                	j	20002e28 <__moddi3+0x156>

20003078 <__udivdi3>:
20003078:	8832                	mv	a6,a2
2000307a:	88aa                	mv	a7,a0
2000307c:	872e                	mv	a4,a1
2000307e:	ead5                	bnez	a3,20003132 <__udivdi3+0xba>
20003080:	0ec5ff63          	bgeu	a1,a2,2000317e <__udivdi3+0x106>
20003084:	67c1                	lui	a5,0x10
20003086:	18f66c63          	bltu	a2,a5,2000321e <__udivdi3+0x1a6>
2000308a:	010007b7          	lui	a5,0x1000
2000308e:	46e1                	li	a3,24
20003090:	00f67363          	bgeu	a2,a5,20003096 <__udivdi3+0x1e>
20003094:	46c1                	li	a3,16
20003096:	200147b7          	lui	a5,0x20014
2000309a:	00d65333          	srl	t1,a2,a3
2000309e:	a4878793          	add	a5,a5,-1464 # 20013a48 <__clz_tab>
200030a2:	979a                	add	a5,a5,t1
200030a4:	0007c783          	lbu	a5,0(a5)
200030a8:	02000313          	li	t1,32
200030ac:	97b6                	add	a5,a5,a3
200030ae:	40f306b3          	sub	a3,t1,a5
200030b2:	00f30b63          	beq	t1,a5,200030c8 <__udivdi3+0x50>
200030b6:	00d59733          	sll	a4,a1,a3
200030ba:	00f557b3          	srl	a5,a0,a5
200030be:	00d61833          	sll	a6,a2,a3
200030c2:	8f5d                	or	a4,a4,a5
200030c4:	00d518b3          	sll	a7,a0,a3
200030c8:	01085613          	srl	a2,a6,0x10
200030cc:	02c75533          	divu	a0,a4,a2
200030d0:	01081693          	sll	a3,a6,0x10
200030d4:	82c1                	srl	a3,a3,0x10
200030d6:	0108d793          	srl	a5,a7,0x10
200030da:	02c77733          	remu	a4,a4,a2
200030de:	02a685b3          	mul	a1,a3,a0
200030e2:	0742                	sll	a4,a4,0x10
200030e4:	8fd9                	or	a5,a5,a4
200030e6:	00b7fa63          	bgeu	a5,a1,200030fa <__udivdi3+0x82>
200030ea:	97c2                	add	a5,a5,a6
200030ec:	fff50713          	add	a4,a0,-1
200030f0:	0107e463          	bltu	a5,a6,200030f8 <__udivdi3+0x80>
200030f4:	30b7e063          	bltu	a5,a1,200033f4 <__udivdi3+0x37c>
200030f8:	853a                	mv	a0,a4
200030fa:	8f8d                	sub	a5,a5,a1
200030fc:	02c7d733          	divu	a4,a5,a2
20003100:	08c2                	sll	a7,a7,0x10
20003102:	0108d893          	srl	a7,a7,0x10
20003106:	02c7f7b3          	remu	a5,a5,a2
2000310a:	02e686b3          	mul	a3,a3,a4
2000310e:	07c2                	sll	a5,a5,0x10
20003110:	00f8e8b3          	or	a7,a7,a5
20003114:	00d8fb63          	bgeu	a7,a3,2000312a <__udivdi3+0xb2>
20003118:	98c2                	add	a7,a7,a6
2000311a:	fff70793          	add	a5,a4,-1 # fffffff <_start-0x10000001>
2000311e:	0108e563          	bltu	a7,a6,20003128 <__udivdi3+0xb0>
20003122:	1779                	add	a4,a4,-2
20003124:	00d8e363          	bltu	a7,a3,2000312a <__udivdi3+0xb2>
20003128:	873e                	mv	a4,a5
2000312a:	0542                	sll	a0,a0,0x10
2000312c:	8d59                	or	a0,a0,a4
2000312e:	4581                	li	a1,0
20003130:	8082                	ret
20003132:	00d5f563          	bgeu	a1,a3,2000313c <__udivdi3+0xc4>
20003136:	4581                	li	a1,0
20003138:	4501                	li	a0,0
2000313a:	8082                	ret
2000313c:	67c1                	lui	a5,0x10
2000313e:	18f6e863          	bltu	a3,a5,200032ce <__udivdi3+0x256>
20003142:	010007b7          	lui	a5,0x1000
20003146:	4861                	li	a6,24
20003148:	00f6f363          	bgeu	a3,a5,2000314e <__udivdi3+0xd6>
2000314c:	4841                	li	a6,16
2000314e:	200147b7          	lui	a5,0x20014
20003152:	0106d733          	srl	a4,a3,a6
20003156:	a4878793          	add	a5,a5,-1464 # 20013a48 <__clz_tab>
2000315a:	97ba                	add	a5,a5,a4
2000315c:	0007c703          	lbu	a4,0(a5)
20003160:	02000793          	li	a5,32
20003164:	9742                	add	a4,a4,a6
20003166:	40e78833          	sub	a6,a5,a4
2000316a:	16e79863          	bne	a5,a4,200032da <__udivdi3+0x262>
2000316e:	26b6e563          	bltu	a3,a1,200033d8 <__udivdi3+0x360>
20003172:	00c53533          	sltu	a0,a0,a2
20003176:	00153513          	seqz	a0,a0
2000317a:	4581                	li	a1,0
2000317c:	8082                	ret
2000317e:	c655                	beqz	a2,2000322a <__udivdi3+0x1b2>
20003180:	67c1                	lui	a5,0x10
20003182:	24f67363          	bgeu	a2,a5,200033c8 <__udivdi3+0x350>
20003186:	10063713          	sltiu	a4,a2,256
2000318a:	00173713          	seqz	a4,a4
2000318e:	070e                	sll	a4,a4,0x3
20003190:	00e656b3          	srl	a3,a2,a4
20003194:	200147b7          	lui	a5,0x20014
20003198:	a4878793          	add	a5,a5,-1464 # 20013a48 <__clz_tab>
2000319c:	97b6                	add	a5,a5,a3
2000319e:	0007c783          	lbu	a5,0(a5)
200031a2:	02000693          	li	a3,32
200031a6:	97ba                	add	a5,a5,a4
200031a8:	40f68eb3          	sub	t4,a3,a5
200031ac:	08f69f63          	bne	a3,a5,2000324a <__udivdi3+0x1d2>
200031b0:	40c587b3          	sub	a5,a1,a2
200031b4:	01065693          	srl	a3,a2,0x10
200031b8:	0642                	sll	a2,a2,0x10
200031ba:	8241                	srl	a2,a2,0x10
200031bc:	4585                	li	a1,1
200031be:	02d7d533          	divu	a0,a5,a3
200031c2:	0108d713          	srl	a4,a7,0x10
200031c6:	02d7f7b3          	remu	a5,a5,a3
200031ca:	02c50333          	mul	t1,a0,a2
200031ce:	07c2                	sll	a5,a5,0x10
200031d0:	8fd9                	or	a5,a5,a4
200031d2:	0067fa63          	bgeu	a5,t1,200031e6 <__udivdi3+0x16e>
200031d6:	97c2                	add	a5,a5,a6
200031d8:	fff50713          	add	a4,a0,-1
200031dc:	0107e463          	bltu	a5,a6,200031e4 <__udivdi3+0x16c>
200031e0:	2067e763          	bltu	a5,t1,200033ee <__udivdi3+0x376>
200031e4:	853a                	mv	a0,a4
200031e6:	406787b3          	sub	a5,a5,t1
200031ea:	02d7d733          	divu	a4,a5,a3
200031ee:	08c2                	sll	a7,a7,0x10
200031f0:	0108d893          	srl	a7,a7,0x10
200031f4:	02d7f7b3          	remu	a5,a5,a3
200031f8:	02c70633          	mul	a2,a4,a2
200031fc:	07c2                	sll	a5,a5,0x10
200031fe:	00f8e8b3          	or	a7,a7,a5
20003202:	00c8fb63          	bgeu	a7,a2,20003218 <__udivdi3+0x1a0>
20003206:	98c2                	add	a7,a7,a6
20003208:	fff70793          	add	a5,a4,-1
2000320c:	0108e563          	bltu	a7,a6,20003216 <__udivdi3+0x19e>
20003210:	1779                	add	a4,a4,-2
20003212:	00c8e363          	bltu	a7,a2,20003218 <__udivdi3+0x1a0>
20003216:	873e                	mv	a4,a5
20003218:	0542                	sll	a0,a0,0x10
2000321a:	8d59                	or	a0,a0,a4
2000321c:	8082                	ret
2000321e:	10063693          	sltiu	a3,a2,256
20003222:	0016b693          	seqz	a3,a3
20003226:	068e                	sll	a3,a3,0x3
20003228:	b5bd                	j	20003096 <__udivdi3+0x1e>
2000322a:	200147b7          	lui	a5,0x20014
2000322e:	4681                	li	a3,0
20003230:	a4878793          	add	a5,a5,-1464 # 20013a48 <__clz_tab>
20003234:	97b6                	add	a5,a5,a3
20003236:	0007c783          	lbu	a5,0(a5)
2000323a:	4701                	li	a4,0
2000323c:	02000693          	li	a3,32
20003240:	97ba                	add	a5,a5,a4
20003242:	40f68eb3          	sub	t4,a3,a5
20003246:	f6f685e3          	beq	a3,a5,200031b0 <__udivdi3+0x138>
2000324a:	01d61833          	sll	a6,a2,t4
2000324e:	00f5d333          	srl	t1,a1,a5
20003252:	01085693          	srl	a3,a6,0x10
20003256:	02d35e33          	divu	t3,t1,a3
2000325a:	01081613          	sll	a2,a6,0x10
2000325e:	01d595b3          	sll	a1,a1,t4
20003262:	8241                	srl	a2,a2,0x10
20003264:	00f557b3          	srl	a5,a0,a5
20003268:	8fcd                	or	a5,a5,a1
2000326a:	0107d713          	srl	a4,a5,0x10
2000326e:	01d518b3          	sll	a7,a0,t4
20003272:	02d37333          	remu	t1,t1,a3
20003276:	03c605b3          	mul	a1,a2,t3
2000327a:	0342                	sll	t1,t1,0x10
2000327c:	00676733          	or	a4,a4,t1
20003280:	00b77b63          	bgeu	a4,a1,20003296 <__udivdi3+0x21e>
20003284:	9742                	add	a4,a4,a6
20003286:	fffe0513          	add	a0,t3,-1
2000328a:	15076e63          	bltu	a4,a6,200033e6 <__udivdi3+0x36e>
2000328e:	14b77c63          	bgeu	a4,a1,200033e6 <__udivdi3+0x36e>
20003292:	1e79                	add	t3,t3,-2
20003294:	9742                	add	a4,a4,a6
20003296:	8f0d                	sub	a4,a4,a1
20003298:	02d75533          	divu	a0,a4,a3
2000329c:	07c2                	sll	a5,a5,0x10
2000329e:	83c1                	srl	a5,a5,0x10
200032a0:	02d77733          	remu	a4,a4,a3
200032a4:	02a60333          	mul	t1,a2,a0
200032a8:	0742                	sll	a4,a4,0x10
200032aa:	8fd9                	or	a5,a5,a4
200032ac:	0067fb63          	bgeu	a5,t1,200032c2 <__udivdi3+0x24a>
200032b0:	97c2                	add	a5,a5,a6
200032b2:	fff50713          	add	a4,a0,-1
200032b6:	1307e463          	bltu	a5,a6,200033de <__udivdi3+0x366>
200032ba:	1267f263          	bgeu	a5,t1,200033de <__udivdi3+0x366>
200032be:	1579                	add	a0,a0,-2
200032c0:	97c2                	add	a5,a5,a6
200032c2:	010e1593          	sll	a1,t3,0x10
200032c6:	406787b3          	sub	a5,a5,t1
200032ca:	8dc9                	or	a1,a1,a0
200032cc:	bdcd                	j	200031be <__udivdi3+0x146>
200032ce:	1006b813          	sltiu	a6,a3,256
200032d2:	00183813          	seqz	a6,a6
200032d6:	080e                	sll	a6,a6,0x3
200032d8:	bd9d                	j	2000314e <__udivdi3+0xd6>
200032da:	00e65e33          	srl	t3,a2,a4
200032de:	010696b3          	sll	a3,a3,a6
200032e2:	00de6e33          	or	t3,t3,a3
200032e6:	00e5d8b3          	srl	a7,a1,a4
200032ea:	010e5e93          	srl	t4,t3,0x10
200032ee:	03d8d7b3          	divu	a5,a7,t4
200032f2:	010e1313          	sll	t1,t3,0x10
200032f6:	010595b3          	sll	a1,a1,a6
200032fa:	01035313          	srl	t1,t1,0x10
200032fe:	00e55733          	srl	a4,a0,a4
20003302:	8f4d                	or	a4,a4,a1
20003304:	01075693          	srl	a3,a4,0x10
20003308:	01061633          	sll	a2,a2,a6
2000330c:	03d8f8b3          	remu	a7,a7,t4
20003310:	02f305b3          	mul	a1,t1,a5
20003314:	08c2                	sll	a7,a7,0x10
20003316:	0116e6b3          	or	a3,a3,a7
2000331a:	00b6fb63          	bgeu	a3,a1,20003330 <__udivdi3+0x2b8>
2000331e:	96f2                	add	a3,a3,t3
20003320:	fff78893          	add	a7,a5,-1
20003324:	0dc6e363          	bltu	a3,t3,200033ea <__udivdi3+0x372>
20003328:	0cb6f163          	bgeu	a3,a1,200033ea <__udivdi3+0x372>
2000332c:	17f9                	add	a5,a5,-2
2000332e:	96f2                	add	a3,a3,t3
20003330:	8e8d                	sub	a3,a3,a1
20003332:	03d6d5b3          	divu	a1,a3,t4
20003336:	0742                	sll	a4,a4,0x10
20003338:	8341                	srl	a4,a4,0x10
2000333a:	03d6f6b3          	remu	a3,a3,t4
2000333e:	02b308b3          	mul	a7,t1,a1
20003342:	06c2                	sll	a3,a3,0x10
20003344:	8f55                	or	a4,a4,a3
20003346:	01177b63          	bgeu	a4,a7,2000335c <__udivdi3+0x2e4>
2000334a:	9772                	add	a4,a4,t3
2000334c:	fff58693          	add	a3,a1,-1
20003350:	09c76963          	bltu	a4,t3,200033e2 <__udivdi3+0x36a>
20003354:	09177763          	bgeu	a4,a7,200033e2 <__udivdi3+0x36a>
20003358:	15f9                	add	a1,a1,-2
2000335a:	9772                	add	a4,a4,t3
2000335c:	07c2                	sll	a5,a5,0x10
2000335e:	6ec1                	lui	t4,0x10
20003360:	8fcd                	or	a5,a5,a1
20003362:	fffe8693          	add	a3,t4,-1 # ffff <_start-0x1fff0001>
20003366:	00d7f5b3          	and	a1,a5,a3
2000336a:	0107d313          	srl	t1,a5,0x10
2000336e:	8ef1                	and	a3,a3,a2
20003370:	8241                	srl	a2,a2,0x10
20003372:	02d58e33          	mul	t3,a1,a3
20003376:	41170733          	sub	a4,a4,a7
2000337a:	02d306b3          	mul	a3,t1,a3
2000337e:	010e5893          	srl	a7,t3,0x10
20003382:	02c585b3          	mul	a1,a1,a2
20003386:	95b6                	add	a1,a1,a3
20003388:	95c6                	add	a1,a1,a7
2000338a:	02c30333          	mul	t1,t1,a2
2000338e:	00d5f363          	bgeu	a1,a3,20003394 <__udivdi3+0x31c>
20003392:	9376                	add	t1,t1,t4
20003394:	0105d693          	srl	a3,a1,0x10
20003398:	969a                	add	a3,a3,t1
2000339a:	02d76363          	bltu	a4,a3,200033c0 <__udivdi3+0x348>
2000339e:	00d70563          	beq	a4,a3,200033a8 <__udivdi3+0x330>
200033a2:	853e                	mv	a0,a5
200033a4:	4581                	li	a1,0
200033a6:	8082                	ret
200033a8:	66c1                	lui	a3,0x10
200033aa:	16fd                	add	a3,a3,-1 # ffff <_start-0x1fff0001>
200033ac:	00d5f733          	and	a4,a1,a3
200033b0:	0742                	sll	a4,a4,0x10
200033b2:	00de7e33          	and	t3,t3,a3
200033b6:	01051533          	sll	a0,a0,a6
200033ba:	9772                	add	a4,a4,t3
200033bc:	fee573e3          	bgeu	a0,a4,200033a2 <__udivdi3+0x32a>
200033c0:	fff78513          	add	a0,a5,-1
200033c4:	4581                	li	a1,0
200033c6:	8082                	ret
200033c8:	010007b7          	lui	a5,0x1000
200033cc:	02f67763          	bgeu	a2,a5,200033fa <__udivdi3+0x382>
200033d0:	01065693          	srl	a3,a2,0x10
200033d4:	4741                	li	a4,16
200033d6:	bb7d                	j	20003194 <__udivdi3+0x11c>
200033d8:	4581                	li	a1,0
200033da:	4505                	li	a0,1
200033dc:	8082                	ret
200033de:	853a                	mv	a0,a4
200033e0:	b5cd                	j	200032c2 <__udivdi3+0x24a>
200033e2:	85b6                	mv	a1,a3
200033e4:	bfa5                	j	2000335c <__udivdi3+0x2e4>
200033e6:	8e2a                	mv	t3,a0
200033e8:	b57d                	j	20003296 <__udivdi3+0x21e>
200033ea:	87c6                	mv	a5,a7
200033ec:	b791                	j	20003330 <__udivdi3+0x2b8>
200033ee:	1579                	add	a0,a0,-2
200033f0:	97c2                	add	a5,a5,a6
200033f2:	bbd5                	j	200031e6 <__udivdi3+0x16e>
200033f4:	1579                	add	a0,a0,-2
200033f6:	97c2                	add	a5,a5,a6
200033f8:	b309                	j	200030fa <__udivdi3+0x82>
200033fa:	01865693          	srl	a3,a2,0x18
200033fe:	4761                	li	a4,24
20003400:	bb51                	j	20003194 <__udivdi3+0x11c>

20003402 <__umoddi3>:
20003402:	8832                	mv	a6,a2
20003404:	88aa                	mv	a7,a0
20003406:	832e                	mv	t1,a1
20003408:	872e                	mv	a4,a1
2000340a:	e6cd                	bnez	a3,200034b4 <__umoddi3+0xb2>
2000340c:	0ec5ff63          	bgeu	a1,a2,2000350a <__umoddi3+0x108>
20003410:	67c1                	lui	a5,0x10
20003412:	18f66263          	bltu	a2,a5,20003596 <__umoddi3+0x194>
20003416:	010007b7          	lui	a5,0x1000
2000341a:	46e1                	li	a3,24
2000341c:	00f67363          	bgeu	a2,a5,20003422 <__umoddi3+0x20>
20003420:	46c1                	li	a3,16
20003422:	200147b7          	lui	a5,0x20014
20003426:	00d65333          	srl	t1,a2,a3
2000342a:	a4878793          	add	a5,a5,-1464 # 20013a48 <__clz_tab>
2000342e:	979a                	add	a5,a5,t1
20003430:	0007c783          	lbu	a5,0(a5)
20003434:	02000313          	li	t1,32
20003438:	97b6                	add	a5,a5,a3
2000343a:	40f306b3          	sub	a3,t1,a5
2000343e:	00f30b63          	beq	t1,a5,20003454 <__umoddi3+0x52>
20003442:	00d59733          	sll	a4,a1,a3
20003446:	00f557b3          	srl	a5,a0,a5
2000344a:	00d61833          	sll	a6,a2,a3
2000344e:	8f5d                	or	a4,a4,a5
20003450:	00d518b3          	sll	a7,a0,a3
20003454:	01085593          	srl	a1,a6,0x10
20003458:	02b75633          	divu	a2,a4,a1
2000345c:	01081313          	sll	t1,a6,0x10
20003460:	01035313          	srl	t1,t1,0x10
20003464:	0108d793          	srl	a5,a7,0x10
20003468:	02b77733          	remu	a4,a4,a1
2000346c:	02660633          	mul	a2,a2,t1
20003470:	0742                	sll	a4,a4,0x10
20003472:	8fd9                	or	a5,a5,a4
20003474:	00c7f763          	bgeu	a5,a2,20003482 <__umoddi3+0x80>
20003478:	97c2                	add	a5,a5,a6
2000347a:	0107e463          	bltu	a5,a6,20003482 <__umoddi3+0x80>
2000347e:	2ec7e663          	bltu	a5,a2,2000376a <__umoddi3+0x368>
20003482:	8f91                	sub	a5,a5,a2
20003484:	02b7d733          	divu	a4,a5,a1
20003488:	01089513          	sll	a0,a7,0x10
2000348c:	8141                	srl	a0,a0,0x10
2000348e:	02b7f7b3          	remu	a5,a5,a1
20003492:	02670733          	mul	a4,a4,t1
20003496:	07c2                	sll	a5,a5,0x10
20003498:	8d5d                	or	a0,a0,a5
2000349a:	00e57863          	bgeu	a0,a4,200034aa <__umoddi3+0xa8>
2000349e:	9542                	add	a0,a0,a6
200034a0:	01056563          	bltu	a0,a6,200034aa <__umoddi3+0xa8>
200034a4:	00e57363          	bgeu	a0,a4,200034aa <__umoddi3+0xa8>
200034a8:	9542                	add	a0,a0,a6
200034aa:	8d19                	sub	a0,a0,a4
200034ac:	00d55533          	srl	a0,a0,a3
200034b0:	4581                	li	a1,0
200034b2:	8082                	ret
200034b4:	00d5f363          	bgeu	a1,a3,200034ba <__umoddi3+0xb8>
200034b8:	8082                	ret
200034ba:	67c1                	lui	a5,0x10
200034bc:	16f6eb63          	bltu	a3,a5,20003632 <__umoddi3+0x230>
200034c0:	010007b7          	lui	a5,0x1000
200034c4:	4861                	li	a6,24
200034c6:	00f6f363          	bgeu	a3,a5,200034cc <__umoddi3+0xca>
200034ca:	4841                	li	a6,16
200034cc:	200147b7          	lui	a5,0x20014
200034d0:	0106d733          	srl	a4,a3,a6
200034d4:	a4878793          	add	a5,a5,-1464 # 20013a48 <__clz_tab>
200034d8:	97ba                	add	a5,a5,a4
200034da:	0007c703          	lbu	a4,0(a5)
200034de:	02000793          	li	a5,32
200034e2:	9742                	add	a4,a4,a6
200034e4:	40e78833          	sub	a6,a5,a4
200034e8:	14e79b63          	bne	a5,a4,2000363e <__umoddi3+0x23c>
200034ec:	00b6e463          	bltu	a3,a1,200034f4 <__umoddi3+0xf2>
200034f0:	00c56a63          	bltu	a0,a2,20003504 <__umoddi3+0x102>
200034f4:	40c508b3          	sub	a7,a0,a2
200034f8:	40d586b3          	sub	a3,a1,a3
200034fc:	01153333          	sltu	t1,a0,a7
20003500:	40668333          	sub	t1,a3,t1
20003504:	8546                	mv	a0,a7
20003506:	859a                	mv	a1,t1
20003508:	8082                	ret
2000350a:	ce41                	beqz	a2,200035a2 <__umoddi3+0x1a0>
2000350c:	67c1                	lui	a5,0x10
2000350e:	24f67263          	bgeu	a2,a5,20003752 <__umoddi3+0x350>
20003512:	10063713          	sltiu	a4,a2,256
20003516:	00173713          	seqz	a4,a4
2000351a:	070e                	sll	a4,a4,0x3
2000351c:	00e656b3          	srl	a3,a2,a4
20003520:	200147b7          	lui	a5,0x20014
20003524:	a4878793          	add	a5,a5,-1464 # 20013a48 <__clz_tab>
20003528:	97b6                	add	a5,a5,a3
2000352a:	0007c783          	lbu	a5,0(a5)
2000352e:	02000313          	li	t1,32
20003532:	97ba                	add	a5,a5,a4
20003534:	40f306b3          	sub	a3,t1,a5
20003538:	08f31563          	bne	t1,a5,200035c2 <__umoddi3+0x1c0>
2000353c:	40c58733          	sub	a4,a1,a2
20003540:	01065313          	srl	t1,a2,0x10
20003544:	0642                	sll	a2,a2,0x10
20003546:	8241                	srl	a2,a2,0x10
20003548:	026755b3          	divu	a1,a4,t1
2000354c:	0108d793          	srl	a5,a7,0x10
20003550:	02677733          	remu	a4,a4,t1
20003554:	02c585b3          	mul	a1,a1,a2
20003558:	0742                	sll	a4,a4,0x10
2000355a:	8fd9                	or	a5,a5,a4
2000355c:	00b7f863          	bgeu	a5,a1,2000356c <__umoddi3+0x16a>
20003560:	97c2                	add	a5,a5,a6
20003562:	0107e563          	bltu	a5,a6,2000356c <__umoddi3+0x16a>
20003566:	00b7f363          	bgeu	a5,a1,2000356c <__umoddi3+0x16a>
2000356a:	97c2                	add	a5,a5,a6
2000356c:	8f8d                	sub	a5,a5,a1
2000356e:	0267d733          	divu	a4,a5,t1
20003572:	08c2                	sll	a7,a7,0x10
20003574:	0108d893          	srl	a7,a7,0x10
20003578:	0267f7b3          	remu	a5,a5,t1
2000357c:	02c70733          	mul	a4,a4,a2
20003580:	01079513          	sll	a0,a5,0x10
20003584:	00a8e533          	or	a0,a7,a0
20003588:	f0e56be3          	bltu	a0,a4,2000349e <__umoddi3+0x9c>
2000358c:	8d19                	sub	a0,a0,a4
2000358e:	00d55533          	srl	a0,a0,a3
20003592:	4581                	li	a1,0
20003594:	8082                	ret
20003596:	10063693          	sltiu	a3,a2,256
2000359a:	0016b693          	seqz	a3,a3
2000359e:	068e                	sll	a3,a3,0x3
200035a0:	b549                	j	20003422 <__umoddi3+0x20>
200035a2:	200147b7          	lui	a5,0x20014
200035a6:	4681                	li	a3,0
200035a8:	a4878793          	add	a5,a5,-1464 # 20013a48 <__clz_tab>
200035ac:	97b6                	add	a5,a5,a3
200035ae:	0007c783          	lbu	a5,0(a5)
200035b2:	4701                	li	a4,0
200035b4:	02000313          	li	t1,32
200035b8:	97ba                	add	a5,a5,a4
200035ba:	40f306b3          	sub	a3,t1,a5
200035be:	f6f30fe3          	beq	t1,a5,2000353c <__umoddi3+0x13a>
200035c2:	00d61833          	sll	a6,a2,a3
200035c6:	00f5de33          	srl	t3,a1,a5
200035ca:	01085313          	srl	t1,a6,0x10
200035ce:	026e5eb3          	divu	t4,t3,t1
200035d2:	01081613          	sll	a2,a6,0x10
200035d6:	00d595b3          	sll	a1,a1,a3
200035da:	00f55733          	srl	a4,a0,a5
200035de:	8241                	srl	a2,a2,0x10
200035e0:	8f4d                	or	a4,a4,a1
200035e2:	01075793          	srl	a5,a4,0x10
200035e6:	00d518b3          	sll	a7,a0,a3
200035ea:	026e7e33          	remu	t3,t3,t1
200035ee:	02ce85b3          	mul	a1,t4,a2
200035f2:	0e42                	sll	t3,t3,0x10
200035f4:	01c7e7b3          	or	a5,a5,t3
200035f8:	00b7f863          	bgeu	a5,a1,20003608 <__umoddi3+0x206>
200035fc:	97c2                	add	a5,a5,a6
200035fe:	0107e563          	bltu	a5,a6,20003608 <__umoddi3+0x206>
20003602:	00b7f363          	bgeu	a5,a1,20003608 <__umoddi3+0x206>
20003606:	97c2                	add	a5,a5,a6
20003608:	8f8d                	sub	a5,a5,a1
2000360a:	0267d5b3          	divu	a1,a5,t1
2000360e:	0742                	sll	a4,a4,0x10
20003610:	8341                	srl	a4,a4,0x10
20003612:	0267f7b3          	remu	a5,a5,t1
20003616:	02c585b3          	mul	a1,a1,a2
2000361a:	07c2                	sll	a5,a5,0x10
2000361c:	8f5d                	or	a4,a4,a5
2000361e:	00b77863          	bgeu	a4,a1,2000362e <__umoddi3+0x22c>
20003622:	9742                	add	a4,a4,a6
20003624:	01076563          	bltu	a4,a6,2000362e <__umoddi3+0x22c>
20003628:	00b77363          	bgeu	a4,a1,2000362e <__umoddi3+0x22c>
2000362c:	9742                	add	a4,a4,a6
2000362e:	8f0d                	sub	a4,a4,a1
20003630:	bf21                	j	20003548 <__umoddi3+0x146>
20003632:	1006b813          	sltiu	a6,a3,256
20003636:	00183813          	seqz	a6,a6
2000363a:	080e                	sll	a6,a6,0x3
2000363c:	bd41                	j	200034cc <__umoddi3+0xca>
2000363e:	010696b3          	sll	a3,a3,a6
20003642:	00e658b3          	srl	a7,a2,a4
20003646:	00d8e8b3          	or	a7,a7,a3
2000364a:	00e5de33          	srl	t3,a1,a4
2000364e:	0108df13          	srl	t5,a7,0x10
20003652:	03ee57b3          	divu	a5,t3,t5
20003656:	01089e93          	sll	t4,a7,0x10
2000365a:	010ede93          	srl	t4,t4,0x10
2000365e:	00e556b3          	srl	a3,a0,a4
20003662:	01051333          	sll	t1,a0,a6
20003666:	010595b3          	sll	a1,a1,a6
2000366a:	8dd5                	or	a1,a1,a3
2000366c:	0105d693          	srl	a3,a1,0x10
20003670:	01061633          	sll	a2,a2,a6
20003674:	03ee7e33          	remu	t3,t3,t5
20003678:	02fe8533          	mul	a0,t4,a5
2000367c:	0e42                	sll	t3,t3,0x10
2000367e:	01c6e6b3          	or	a3,a3,t3
20003682:	00a6fb63          	bgeu	a3,a0,20003698 <__umoddi3+0x296>
20003686:	96c6                	add	a3,a3,a7
20003688:	fff78e13          	add	t3,a5,-1
2000368c:	0d16ed63          	bltu	a3,a7,20003766 <__umoddi3+0x364>
20003690:	0ca6fb63          	bgeu	a3,a0,20003766 <__umoddi3+0x364>
20003694:	17f9                	add	a5,a5,-2
20003696:	96c6                	add	a3,a3,a7
20003698:	8e89                	sub	a3,a3,a0
2000369a:	03e6d533          	divu	a0,a3,t5
2000369e:	05c2                	sll	a1,a1,0x10
200036a0:	81c1                	srl	a1,a1,0x10
200036a2:	03e6f6b3          	remu	a3,a3,t5
200036a6:	02ae8eb3          	mul	t4,t4,a0
200036aa:	06c2                	sll	a3,a3,0x10
200036ac:	8dd5                	or	a1,a1,a3
200036ae:	01d5fb63          	bgeu	a1,t4,200036c4 <__umoddi3+0x2c2>
200036b2:	95c6                	add	a1,a1,a7
200036b4:	fff50693          	add	a3,a0,-1
200036b8:	0b15e563          	bltu	a1,a7,20003762 <__umoddi3+0x360>
200036bc:	0bd5f363          	bgeu	a1,t4,20003762 <__umoddi3+0x360>
200036c0:	1579                	add	a0,a0,-2
200036c2:	95c6                	add	a1,a1,a7
200036c4:	01079693          	sll	a3,a5,0x10
200036c8:	62c1                	lui	t0,0x10
200036ca:	8ec9                	or	a3,a3,a0
200036cc:	fff28513          	add	a0,t0,-1 # ffff <_start-0x1fff0001>
200036d0:	00a6fe33          	and	t3,a3,a0
200036d4:	01065f93          	srl	t6,a2,0x10
200036d8:	82c1                	srl	a3,a3,0x10
200036da:	8d71                	and	a0,a0,a2
200036dc:	02ae0f33          	mul	t5,t3,a0
200036e0:	41d585b3          	sub	a1,a1,t4
200036e4:	02a68533          	mul	a0,a3,a0
200036e8:	010f5793          	srl	a5,t5,0x10
200036ec:	03fe0e33          	mul	t3,t3,t6
200036f0:	9e2a                	add	t3,t3,a0
200036f2:	97f2                	add	a5,a5,t3
200036f4:	03f686b3          	mul	a3,a3,t6
200036f8:	00a7f363          	bgeu	a5,a0,200036fe <__umoddi3+0x2fc>
200036fc:	9696                	add	a3,a3,t0
200036fe:	6ec1                	lui	t4,0x10
20003700:	1efd                	add	t4,t4,-1 # ffff <_start-0x1fff0001>
20003702:	01d7f533          	and	a0,a5,t4
20003706:	0107de13          	srl	t3,a5,0x10
2000370a:	0542                	sll	a0,a0,0x10
2000370c:	01df7f33          	and	t5,t5,t4
20003710:	00de07b3          	add	a5,t3,a3
20003714:	957a                	add	a0,a0,t5
20003716:	02f5e563          	bltu	a1,a5,20003740 <__umoddi3+0x33e>
2000371a:	02f58163          	beq	a1,a5,2000373c <__umoddi3+0x33a>
2000371e:	40a30533          	sub	a0,t1,a0
20003722:	00a33333          	sltu	t1,t1,a0
20003726:	8d9d                	sub	a1,a1,a5
20003728:	406585b3          	sub	a1,a1,t1
2000372c:	00e59733          	sll	a4,a1,a4
20003730:	01055533          	srl	a0,a0,a6
20003734:	8d59                	or	a0,a0,a4
20003736:	0105d5b3          	srl	a1,a1,a6
2000373a:	8082                	ret
2000373c:	fea371e3          	bgeu	t1,a0,2000371e <__umoddi3+0x31c>
20003740:	40c50633          	sub	a2,a0,a2
20003744:	00c53533          	sltu	a0,a0,a2
20003748:	98aa                	add	a7,a7,a0
2000374a:	411787b3          	sub	a5,a5,a7
2000374e:	8532                	mv	a0,a2
20003750:	b7f9                	j	2000371e <__umoddi3+0x31c>
20003752:	010007b7          	lui	a5,0x1000
20003756:	00f67c63          	bgeu	a2,a5,2000376e <__umoddi3+0x36c>
2000375a:	01065693          	srl	a3,a2,0x10
2000375e:	4741                	li	a4,16
20003760:	b3c1                	j	20003520 <__umoddi3+0x11e>
20003762:	8536                	mv	a0,a3
20003764:	b785                	j	200036c4 <__umoddi3+0x2c2>
20003766:	87f2                	mv	a5,t3
20003768:	bf05                	j	20003698 <__umoddi3+0x296>
2000376a:	97c2                	add	a5,a5,a6
2000376c:	bb19                	j	20003482 <__umoddi3+0x80>
2000376e:	01865693          	srl	a3,a2,0x18
20003772:	4761                	li	a4,24
20003774:	b375                	j	20003520 <__umoddi3+0x11e>

20003776 <__addtf3>:
20003776:	711d                	add	sp,sp,-96
20003778:	cca2                	sw	s0,88(sp)
2000377a:	caa6                	sw	s1,84(sp)
2000377c:	ce86                	sw	ra,92(sp)
2000377e:	84aa                	mv	s1,a0
20003780:	c8ca                	sw	s2,80(sp)
20003782:	c6ce                	sw	s3,76(sp)
20003784:	4194                	lw	a3,0(a1)
20003786:	41d8                	lw	a4,4(a1)
20003788:	459c                	lw	a5,8(a1)
2000378a:	45c0                	lw	s0,12(a1)
2000378c:	00062303          	lw	t1,0(a2)
20003790:	00462f03          	lw	t5,4(a2)
20003794:	00862883          	lw	a7,8(a2)
20003798:	4648                	lw	a0,12(a2)
2000379a:	002029f3          	frrm	s3
2000379e:	01041613          	sll	a2,s0,0x10
200037a2:	00141913          	sll	s2,s0,0x1
200037a6:	8241                	srl	a2,a2,0x10
200037a8:	dc3e                	sw	a5,56(sp)
200037aa:	de22                	sw	s0,60(sp)
200037ac:	c43e                	sw	a5,8(sp)
200037ae:	d836                	sw	a3,48(sp)
200037b0:	da3a                	sw	a4,52(sp)
200037b2:	c036                	sw	a3,0(sp)
200037b4:	c23a                	sw	a4,4(sp)
200037b6:	c632                	sw	a2,12(sp)
200037b8:	01195913          	srl	s2,s2,0x11
200037bc:	807d                	srl	s0,s0,0x1f
200037be:	8e0a                	mv	t3,sp
200037c0:	007c                	add	a5,sp,12
200037c2:	00361593          	sll	a1,a2,0x3
200037c6:	ffc7a603          	lw	a2,-4(a5) # fffffc <_start-0x1f000004>
200037ca:	8ebe                	mv	t4,a5
200037cc:	17f1                	add	a5,a5,-4
200037ce:	01d65713          	srl	a4,a2,0x1d
200037d2:	8f4d                	or	a4,a4,a1
200037d4:	c3d8                	sw	a4,4(a5)
200037d6:	fefe16e3          	bne	t3,a5,200037c2 <__addtf3+0x4c>
200037da:	01051593          	sll	a1,a0,0x10
200037de:	068e                	sll	a3,a3,0x3
200037e0:	81c1                	srl	a1,a1,0x10
200037e2:	00151813          	sll	a6,a0,0x1
200037e6:	da7a                	sw	t5,52(sp)
200037e8:	dc46                	sw	a7,56(sp)
200037ea:	ca7a                	sw	t5,20(sp)
200037ec:	cc46                	sw	a7,24(sp)
200037ee:	c036                	sw	a3,0(sp)
200037f0:	d81a                	sw	t1,48(sp)
200037f2:	de2a                	sw	a0,60(sp)
200037f4:	c81a                	sw	t1,16(sp)
200037f6:	ce2e                	sw	a1,28(sp)
200037f8:	01185813          	srl	a6,a6,0x11
200037fc:	01f55893          	srl	a7,a0,0x1f
20003800:	01010f13          	add	t5,sp,16
20003804:	0878                	add	a4,sp,28
20003806:	00359513          	sll	a0,a1,0x3
2000380a:	ffc72583          	lw	a1,-4(a4)
2000380e:	1771                	add	a4,a4,-4
20003810:	01d5d613          	srl	a2,a1,0x1d
20003814:	8e49                	or	a2,a2,a0
20003816:	c350                	sw	a2,4(a4)
20003818:	feef17e3          	bne	t5,a4,20003806 <__addtf3+0x90>
2000381c:	030e                	sll	t1,t1,0x3
2000381e:	c81a                	sw	t1,16(sp)
20003820:	41090633          	sub	a2,s2,a6
20003824:	23140c63          	beq	s0,a7,20003a5c <__addtf3+0x2e6>
20003828:	16c05563          	blez	a2,20003992 <__addtf3+0x21c>
2000382c:	4892                	lw	a7,4(sp)
2000382e:	4e22                	lw	t3,8(sp)
20003830:	45b2                	lw	a1,12(sp)
20003832:	2e080f63          	beqz	a6,20003b30 <__addtf3+0x3ba>
20003836:	67a1                	lui	a5,0x8
20003838:	17fd                	add	a5,a5,-1 # 7fff <_start-0x1fff8001>
2000383a:	6af908e3          	beq	s2,a5,200046ea <__addtf3+0xf74>
2000383e:	4572                	lw	a0,28(sp)
20003840:	00080837          	lui	a6,0x80
20003844:	07400793          	li	a5,116
20003848:	01056533          	or	a0,a0,a6
2000384c:	ce2a                	sw	a0,28(sp)
2000384e:	30c7d863          	bge	a5,a2,20003b5e <__addtf3+0x3e8>
20003852:	4801                	li	a6,0
20003854:	4601                	li	a2,0
20003856:	4301                	li	t1,0
20003858:	4785                	li	a5,1
2000385a:	40f687b3          	sub	a5,a3,a5
2000385e:	40688733          	sub	a4,a7,t1
20003862:	00f6b533          	sltu	a0,a3,a5
20003866:	00e8beb3          	sltu	t4,a7,a4
2000386a:	86be                	mv	a3,a5
2000386c:	8f76                	mv	t5,t4
2000386e:	8f09                	sub	a4,a4,a0
20003870:	c119                	beqz	a0,20003876 <__addtf3+0x100>
20003872:	69130e63          	beq	t1,a7,20003f0e <__addtf3+0x798>
20003876:	40ce07b3          	sub	a5,t3,a2
2000387a:	00fe3533          	sltu	a0,t3,a5
2000387e:	41e787b3          	sub	a5,a5,t5
20003882:	680e9b63          	bnez	t4,20003f18 <__addtf3+0x7a2>
20003886:	00a80633          	add	a2,a6,a0
2000388a:	8d91                	sub	a1,a1,a2
2000388c:	d43e                	sw	a5,40(sp)
2000388e:	d62e                	sw	a1,44(sp)
20003890:	d23a                	sw	a4,36(sp)
20003892:	d036                	sw	a3,32(sp)
20003894:	00c59793          	sll	a5,a1,0xc
20003898:	4e07c463          	bltz	a5,20003d80 <__addtf3+0x60a>
2000389c:	101c                	add	a5,sp,32
2000389e:	02c10e13          	add	t3,sp,44
200038a2:	0076f713          	and	a4,a3,7
200038a6:	4805                	li	a6,1
200038a8:	e319                	bnez	a4,200038ae <__addtf3+0x138>
200038aa:	4a20106f          	j	20004d4c <__addtf3+0x15d6>
200038ae:	4709                	li	a4,2
200038b0:	6ce98363          	beq	s3,a4,20003f76 <__addtf3+0x800>
200038b4:	470d                	li	a4,3
200038b6:	48e98863          	beq	s3,a4,20003d46 <__addtf3+0x5d0>
200038ba:	48099863          	bnez	s3,20003d4a <__addtf3+0x5d4>
200038be:	00f6f713          	and	a4,a3,15
200038c2:	4611                	li	a2,4
200038c4:	4881                	li	a7,0
200038c6:	48c70263          	beq	a4,a2,20003d4a <__addtf3+0x5d4>
200038ca:	5712                	lw	a4,36(sp)
200038cc:	0691                	add	a3,a3,4
200038ce:	5522                	lw	a0,40(sp)
200038d0:	0046b613          	sltiu	a2,a3,4
200038d4:	963a                	add	a2,a2,a4
200038d6:	00e63733          	sltu	a4,a2,a4
200038da:	972a                	add	a4,a4,a0
200038dc:	00a73533          	sltu	a0,a4,a0
200038e0:	95aa                	add	a1,a1,a0
200038e2:	d036                	sw	a3,32(sp)
200038e4:	d232                	sw	a2,36(sp)
200038e6:	d43a                	sw	a4,40(sp)
200038e8:	d62e                	sw	a1,44(sp)
200038ea:	46088063          	beqz	a7,20003d4a <__addtf3+0x5d4>
200038ee:	00286813          	or	a6,a6,2
200038f2:	864a                	mv	a2,s2
200038f4:	00080737          	lui	a4,0x80
200038f8:	8f6d                	and	a4,a4,a1
200038fa:	3c070b63          	beqz	a4,20003cd0 <__addtf3+0x55a>
200038fe:	6721                	lui	a4,0x8
20003900:	0605                	add	a2,a2,1
20003902:	177d                	add	a4,a4,-1 # 7fff <_start-0x1fff8001>
20003904:	62e61063          	bne	a2,a4,20003f24 <__addtf3+0x7ae>
20003908:	5a098563          	beqz	s3,20003eb2 <__addtf3+0x73c>
2000390c:	470d                	li	a4,3
2000390e:	5ae98063          	beq	s3,a4,20003eae <__addtf3+0x738>
20003912:	4709                	li	a4,2
20003914:	36e98de3          	beq	s3,a4,2000448e <__addtf3+0xd18>
20003918:	6621                	lui	a2,0x8
2000391a:	1679                	add	a2,a2,-2 # 7ffe <_start-0x1fff8002>
2000391c:	20000737          	lui	a4,0x20000
20003920:	56fd                	li	a3,-1
20003922:	fff70513          	add	a0,a4,-1 # 1fffffff <_start-0x1>
20003926:	85b2                	mv	a1,a2
20003928:	d636                	sw	a3,44(sp)
2000392a:	d436                	sw	a3,40(sp)
2000392c:	d236                	sw	a3,36(sp)
2000392e:	d036                	sw	a3,32(sp)
20003930:	00586813          	or	a6,a6,5
20003934:	5682                	lw	a3,32(sp)
20003936:	0036d893          	srl	a7,a3,0x3
2000393a:	43d4                	lw	a3,4(a5)
2000393c:	0791                	add	a5,a5,4
2000393e:	01d69713          	sll	a4,a3,0x1d
20003942:	01176733          	or	a4,a4,a7
20003946:	fee7ae23          	sw	a4,-4(a5)
2000394a:	ffc796e3          	bne	a5,t3,20003936 <__addtf3+0x1c0>
2000394e:	67a1                	lui	a5,0x8
20003950:	17fd                	add	a5,a5,-1 # 7fff <_start-0x1fff8001>
20003952:	5682                	lw	a3,32(sp)
20003954:	5312                	lw	t1,36(sp)
20003956:	58a2                	lw	a7,40(sp)
20003958:	3ef60e63          	beq	a2,a5,20003d54 <__addtf3+0x5de>
2000395c:	01051713          	sll	a4,a0,0x10
20003960:	8341                	srl	a4,a4,0x10
20003962:	043e                	sll	s0,s0,0xf
20003964:	0085e7b3          	or	a5,a1,s0
20003968:	02e11e23          	sh	a4,60(sp)
2000396c:	02f11f23          	sh	a5,62(sp)
20003970:	57f2                	lw	a5,60(sp)
20003972:	40081463          	bnez	a6,20003d7a <__addtf3+0x604>
20003976:	40f6                	lw	ra,92(sp)
20003978:	4466                	lw	s0,88(sp)
2000397a:	c094                	sw	a3,0(s1)
2000397c:	0064a223          	sw	t1,4(s1)
20003980:	0114a423          	sw	a7,8(s1)
20003984:	c4dc                	sw	a5,12(s1)
20003986:	4946                	lw	s2,80(sp)
20003988:	49b6                	lw	s3,76(sp)
2000398a:	8526                	mv	a0,s1
2000398c:	44d6                	lw	s1,84(sp)
2000398e:	6125                	add	sp,sp,96
20003990:	8082                	ret
20003992:	4f52                	lw	t5,20(sp)
20003994:	4fe2                	lw	t6,24(sp)
20003996:	45f2                	lw	a1,28(sp)
20003998:	24060c63          	beqz	a2,20003bf0 <__addtf3+0x47a>
2000399c:	41280633          	sub	a2,a6,s2
200039a0:	70091463          	bnez	s2,200040a8 <__addtf3+0x932>
200039a4:	4392                	lw	t2,4(sp)
200039a6:	4422                	lw	s0,8(sp)
200039a8:	4532                	lw	a0,12(sp)
200039aa:	0083e733          	or	a4,t2,s0
200039ae:	8f49                	or	a4,a4,a0
200039b0:	8f55                	or	a4,a4,a3
200039b2:	3a0704e3          	beqz	a4,2000455a <__addtf3+0xde4>
200039b6:	fff60293          	add	t0,a2,-1
200039ba:	74028de3          	beqz	t0,20004914 <__addtf3+0x119e>
200039be:	6721                	lui	a4,0x8
200039c0:	177d                	add	a4,a4,-1 # 7fff <_start-0x1fff8001>
200039c2:	62e60fe3          	beq	a2,a4,20004800 <__addtf3+0x108a>
200039c6:	07400713          	li	a4,116
200039ca:	6e574c63          	blt	a4,t0,200040c2 <__addtf3+0x94c>
200039ce:	477d                	li	a4,31
200039d0:	00574463          	blt	a4,t0,200039d8 <__addtf3+0x262>
200039d4:	34c0106f          	j	20004d20 <__addtf3+0x15aa>
200039d8:	4052d713          	sra	a4,t0,0x5
200039dc:	8616                	mv	a2,t0
200039de:	83be                	mv	t2,a5
200039e0:	4681                	li	a3,0
200039e2:	4281                	li	t0,0
200039e4:	0003a403          	lw	s0,0(t2)
200039e8:	0285                	add	t0,t0,1
200039ea:	0391                	add	t2,t2,4
200039ec:	8ec1                	or	a3,a3,s0
200039ee:	fee2cbe3          	blt	t0,a4,200039e4 <__addtf3+0x26e>
200039f2:	893a                	mv	s2,a4
200039f4:	438d                	li	t2,3
200039f6:	01f67293          	and	t0,a2,31
200039fa:	412383b3          	sub	t2,t2,s2
200039fe:	620290e3          	bnez	t0,2000481e <__addtf3+0x10a8>
20003a02:	00291613          	sll	a2,s2,0x2
20003a06:	00c78733          	add	a4,a5,a2
20003a0a:	4318                	lw	a4,0(a4)
20003a0c:	0285                	add	t0,t0,1
20003a0e:	0791                	add	a5,a5,4
20003a10:	fee7ae23          	sw	a4,-4(a5)
20003a14:	fe53d9e3          	bge	t2,t0,20003a06 <__addtf3+0x290>
20003a18:	4791                	li	a5,4
20003a1a:	412787b3          	sub	a5,a5,s2
20003a1e:	470d                	li	a4,3
20003a20:	4282                	lw	t0,0(sp)
20003a22:	02f74563          	blt	a4,a5,20003a4c <__addtf3+0x2d6>
20003a26:	4711                	li	a4,4
20003a28:	8f1d                	sub	a4,a4,a5
20003a2a:	070a                	sll	a4,a4,0x2
20003a2c:	078a                	sll	a5,a5,0x2
20003a2e:	4621                	li	a2,8
20003a30:	97f2                	add	a5,a5,t3
20003a32:	00c76863          	bltu	a4,a2,20003a42 <__addtf3+0x2cc>
20003a36:	0007a023          	sw	zero,0(a5)
20003a3a:	0007a223          	sw	zero,4(a5)
20003a3e:	1761                	add	a4,a4,-8
20003a40:	07a1                	add	a5,a5,8
20003a42:	4611                	li	a2,4
20003a44:	00c76463          	bltu	a4,a2,20003a4c <__addtf3+0x2d6>
20003a48:	0007a023          	sw	zero,0(a5)
20003a4c:	00d036b3          	snez	a3,a3
20003a50:	4792                	lw	a5,4(sp)
20003a52:	4622                	lw	a2,8(sp)
20003a54:	43b2                	lw	t2,12(sp)
20003a56:	0056e6b3          	or	a3,a3,t0
20003a5a:	ad85                	j	200040ca <__addtf3+0x954>
20003a5c:	38c05363          	blez	a2,20003de2 <__addtf3+0x66c>
20003a60:	4e92                	lw	t4,4(sp)
20003a62:	48a2                	lw	a7,8(sp)
20003a64:	45b2                	lw	a1,12(sp)
20003a66:	26081c63          	bnez	a6,20003cde <__addtf3+0x568>
20003a6a:	47d2                	lw	a5,20(sp)
20003a6c:	4fe2                	lw	t6,24(sp)
20003a6e:	4572                	lw	a0,28(sp)
20003a70:	01f7ee33          	or	t3,a5,t6
20003a74:	00ae6e33          	or	t3,t3,a0
20003a78:	006e6e33          	or	t3,t3,t1
20003a7c:	4a0e05e3          	beqz	t3,20004726 <__addtf3+0xfb0>
20003a80:	fff60e13          	add	t3,a2,-1
20003a84:	300e07e3          	beqz	t3,20004592 <__addtf3+0xe1c>
20003a88:	67a1                	lui	a5,0x8
20003a8a:	17fd                	add	a5,a5,-1 # 7fff <_start-0x1fff8001>
20003a8c:	4ef608e3          	beq	a2,a5,2000477c <__addtf3+0x1006>
20003a90:	07400793          	li	a5,116
20003a94:	27c7c363          	blt	a5,t3,20003cfa <__addtf3+0x584>
20003a98:	8672                	mv	a2,t3
20003a9a:	40565293          	sra	t0,a2,0x5
20003a9e:	8a7d                	and	a2,a2,31
20003aa0:	320284e3          	beqz	t0,200045c8 <__addtf3+0xe52>
20003aa4:	00229e13          	sll	t3,t0,0x2
20003aa8:	00ee0fb3          	add	t6,t3,a4
20003aac:	87ba                	mv	a5,a4
20003aae:	4801                	li	a6,0
20003ab0:	0007a303          	lw	t1,0(a5)
20003ab4:	0791                	add	a5,a5,4
20003ab6:	00686833          	or	a6,a6,t1
20003aba:	fff79be3          	bne	a5,t6,20003ab0 <__addtf3+0x33a>
20003abe:	478d                	li	a5,3
20003ac0:	405787b3          	sub	a5,a5,t0
20003ac4:	0c060be3          	beqz	a2,2000439a <__addtf3+0xc24>
20003ac8:	040e0313          	add	t1,t3,64
20003acc:	930a                	add	t1,t1,sp
20003ace:	fd032303          	lw	t1,-48(t1)
20003ad2:	02000393          	li	t2,32
20003ad6:	40c383b3          	sub	t2,t2,a2
20003ada:	00731333          	sll	t1,t1,t2
20003ade:	00686833          	or	a6,a6,t1
20003ae2:	00c55533          	srl	a0,a0,a2
20003ae6:	e399                	bnez	a5,20003aec <__addtf3+0x376>
20003ae8:	0e20106f          	j	20004bca <__addtf3+0x1454>
20003aec:	c4d2                	sw	s4,72(sp)
20003aee:	00279313          	sll	t1,a5,0x2
20003af2:	9e7a                	add	t3,t3,t5
20003af4:	00e30a33          	add	s4,t1,a4
20003af8:	000e2783          	lw	a5,0(t3)
20003afc:	004e2f83          	lw	t6,4(t3)
20003b00:	0711                	add	a4,a4,4
20003b02:	00c7d7b3          	srl	a5,a5,a2
20003b06:	007f9fb3          	sll	t6,t6,t2
20003b0a:	01f7e7b3          	or	a5,a5,t6
20003b0e:	fef72e23          	sw	a5,-4(a4)
20003b12:	0e11                	add	t3,t3,4
20003b14:	ff4712e3          	bne	a4,s4,20003af8 <__addtf3+0x382>
20003b18:	04030793          	add	a5,t1,64
20003b1c:	00278333          	add	t1,a5,sp
20003b20:	4791                	li	a5,4
20003b22:	4a26                	lw	s4,72(sp)
20003b24:	405787b3          	sub	a5,a5,t0
20003b28:	fca32823          	sw	a0,-48(t1)
20003b2c:	0870006f          	j	200043b2 <__addtf3+0xc3c>
20003b30:	42d2                	lw	t0,20(sp)
20003b32:	4fe2                	lw	t6,24(sp)
20003b34:	4572                	lw	a0,28(sp)
20003b36:	01f2e7b3          	or	a5,t0,t6
20003b3a:	8fc9                	or	a5,a5,a0
20003b3c:	0067e7b3          	or	a5,a5,t1
20003b40:	5c078263          	beqz	a5,20004104 <__addtf3+0x98e>
20003b44:	fff60793          	add	a5,a2,-1
20003b48:	360782e3          	beqz	a5,200046ac <__addtf3+0xf36>
20003b4c:	6321                	lui	t1,0x8
20003b4e:	137d                	add	t1,t1,-1 # 7fff <_start-0x1fff8001>
20003b50:	5c660863          	beq	a2,t1,20004120 <__addtf3+0x9aa>
20003b54:	07400613          	li	a2,116
20003b58:	cef64de3          	blt	a2,a5,20003852 <__addtf3+0xdc>
20003b5c:	863e                	mv	a2,a5
20003b5e:	40565f93          	sra	t6,a2,0x5
20003b62:	8a7d                	and	a2,a2,31
20003b64:	660f84e3          	beqz	t6,200049cc <__addtf3+0x1256>
20003b68:	002f9e93          	sll	t4,t6,0x2
20003b6c:	00ee82b3          	add	t0,t4,a4
20003b70:	87ba                	mv	a5,a4
20003b72:	4801                	li	a6,0
20003b74:	0007a303          	lw	t1,0(a5)
20003b78:	0791                	add	a5,a5,4
20003b7a:	00686833          	or	a6,a6,t1
20003b7e:	fef29be3          	bne	t0,a5,20003b74 <__addtf3+0x3fe>
20003b82:	478d                	li	a5,3
20003b84:	41f787b3          	sub	a5,a5,t6
20003b88:	32060963          	beqz	a2,20003eba <__addtf3+0x744>
20003b8c:	040e8313          	add	t1,t4,64
20003b90:	930a                	add	t1,t1,sp
20003b92:	fd032303          	lw	t1,-48(t1)
20003b96:	02000393          	li	t2,32
20003b9a:	40c383b3          	sub	t2,t2,a2
20003b9e:	00731333          	sll	t1,t1,t2
20003ba2:	00686833          	or	a6,a6,t1
20003ba6:	00c55533          	srl	a0,a0,a2
20003baa:	62078fe3          	beqz	a5,200049e8 <__addtf3+0x1272>
20003bae:	c4d2                	sw	s4,72(sp)
20003bb0:	00279313          	sll	t1,a5,0x2
20003bb4:	9efa                	add	t4,t4,t5
20003bb6:	00e30a33          	add	s4,t1,a4
20003bba:	000ea783          	lw	a5,0(t4)
20003bbe:	004ea283          	lw	t0,4(t4)
20003bc2:	0711                	add	a4,a4,4
20003bc4:	00c7d7b3          	srl	a5,a5,a2
20003bc8:	007292b3          	sll	t0,t0,t2
20003bcc:	0057e7b3          	or	a5,a5,t0
20003bd0:	fef72e23          	sw	a5,-4(a4)
20003bd4:	0e91                	add	t4,t4,4
20003bd6:	feea12e3          	bne	s4,a4,20003bba <__addtf3+0x444>
20003bda:	04030793          	add	a5,t1,64
20003bde:	00278333          	add	t1,a5,sp
20003be2:	4791                	li	a5,4
20003be4:	4a26                	lw	s4,72(sp)
20003be6:	41f787b3          	sub	a5,a5,t6
20003bea:	fca32823          	sw	a0,-48(t1)
20003bee:	a4d5                	j	20003ed2 <__addtf3+0x75c>
20003bf0:	67a1                	lui	a5,0x8
20003bf2:	00190713          	add	a4,s2,1
20003bf6:	17f9                	add	a5,a5,-2 # 7ffe <_start-0x1fff8002>
20003bf8:	00f772b3          	and	t0,a4,a5
20003bfc:	4e92                	lw	t4,4(sp)
20003bfe:	4e22                	lw	t3,8(sp)
20003c00:	4732                	lw	a4,12(sp)
20003c02:	42029563          	bnez	t0,2000402c <__addtf3+0x8b6>
20003c06:	01cee7b3          	or	a5,t4,t3
20003c0a:	01ff6533          	or	a0,t5,t6
20003c0e:	8fd9                	or	a5,a5,a4
20003c10:	8d4d                	or	a0,a0,a1
20003c12:	8fd5                	or	a5,a5,a3
20003c14:	00656533          	or	a0,a0,t1
20003c18:	14091ce3          	bnez	s2,20004570 <__addtf3+0xdfa>
20003c1c:	4e0781e3          	beqz	a5,200048fe <__addtf3+0x1188>
20003c20:	380501e3          	beqz	a0,200047a2 <__addtf3+0x102c>
20003c24:	41ee87b3          	sub	a5,t4,t5
20003c28:	406682b3          	sub	t0,a3,t1
20003c2c:	0056b3b3          	sltu	t2,a3,t0
20003c30:	00feb533          	sltu	a0,t4,a5
20003c34:	c2d6                	sw	s5,68(sp)
20003c36:	407787b3          	sub	a5,a5,t2
20003c3a:	882a                	mv	a6,a0
20003c3c:	41fe0ab3          	sub	s5,t3,t6
20003c40:	01fe33b3          	sltu	t2,t3,t6
20003c44:	0056f463          	bgeu	a3,t0,20003c4c <__addtf3+0x4d6>
20003c48:	77ee89e3          	beq	t4,t5,20004bba <__addtf3+0x1444>
20003c4c:	410a8833          	sub	a6,s5,a6
20003c50:	760517e3          	bnez	a0,20004bbe <__addtf3+0x1448>
20003c54:	40b70533          	sub	a0,a4,a1
20003c58:	40750533          	sub	a0,a0,t2
20003c5c:	d62a                	sw	a0,44(sp)
20003c5e:	d442                	sw	a6,40(sp)
20003c60:	d23e                	sw	a5,36(sp)
20003c62:	d016                	sw	t0,32(sp)
20003c64:	00c51393          	sll	t2,a0,0xc
20003c68:	7203dce3          	bgez	t2,20004ba0 <__addtf3+0x142a>
20003c6c:	40d30833          	sub	a6,t1,a3
20003c70:	41df07b3          	sub	a5,t5,t4
20003c74:	01033633          	sltu	a2,t1,a6
20003c78:	00ff32b3          	sltu	t0,t5,a5
20003c7c:	86c2                	mv	a3,a6
20003c7e:	8f91                	sub	a5,a5,a2
20003c80:	8396                	mv	t2,t0
20003c82:	41cf8633          	sub	a2,t6,t3
20003c86:	01cfb533          	sltu	a0,t6,t3
20003c8a:	01037663          	bgeu	t1,a6,20003c96 <__addtf3+0x520>
20003c8e:	01ee9463          	bne	t4,t5,20003c96 <__addtf3+0x520>
20003c92:	0340106f          	j	20004cc6 <__addtf3+0x1550>
20003c96:	40760633          	sub	a2,a2,t2
20003c9a:	00028463          	beqz	t0,20003ca2 <__addtf3+0x52c>
20003c9e:	02a0106f          	j	20004cc8 <__addtf3+0x1552>
20003ca2:	40e58733          	sub	a4,a1,a4
20003ca6:	4a96                	lw	s5,68(sp)
20003ca8:	8f09                	sub	a4,a4,a0
20003caa:	d23e                	sw	a5,36(sp)
20003cac:	8f3e                	mv	t5,a5
20003cae:	8fb2                	mv	t6,a2
20003cb0:	d63a                	sw	a4,44(sp)
20003cb2:	d432                	sw	a2,40(sp)
20003cb4:	d042                	sw	a6,32(sp)
20003cb6:	8446                	mv	s0,a7
20003cb8:	101c                	add	a5,sp,32
20003cba:	01e6e5b3          	or	a1,a3,t5
20003cbe:	01f5e5b3          	or	a1,a1,t6
20003cc2:	8dd9                	or	a1,a1,a4
20003cc4:	62059363          	bnez	a1,200042ea <__addtf3+0xb74>
20003cc8:	4601                	li	a2,0
20003cca:	4801                	li	a6,0
20003ccc:	02c10e13          	add	t3,sp,44
20003cd0:	01161713          	sll	a4,a2,0x11
20003cd4:	0035d513          	srl	a0,a1,0x3
20003cd8:	01175593          	srl	a1,a4,0x11
20003cdc:	b9a1                	j	20003934 <__addtf3+0x1be>
20003cde:	67a1                	lui	a5,0x8
20003ce0:	17fd                	add	a5,a5,-1 # 7fff <_start-0x1fff8001>
20003ce2:	2ef900e3          	beq	s2,a5,200047c2 <__addtf3+0x104c>
20003ce6:	4572                	lw	a0,28(sp)
20003ce8:	00080837          	lui	a6,0x80
20003cec:	07400793          	li	a5,116
20003cf0:	01056533          	or	a0,a0,a6
20003cf4:	ce2a                	sw	a0,28(sp)
20003cf6:	dac7d2e3          	bge	a5,a2,20003a9a <__addtf3+0x324>
20003cfa:	4301                	li	t1,0
20003cfc:	4601                	li	a2,0
20003cfe:	4781                	li	a5,0
20003d00:	4805                	li	a6,1
20003d02:	9836                	add	a6,a6,a3
20003d04:	01d78533          	add	a0,a5,t4
20003d08:	00d83733          	sltu	a4,a6,a3
20003d0c:	972a                	add	a4,a4,a0
20003d0e:	00f537b3          	sltu	a5,a0,a5
20003d12:	00a73533          	sltu	a0,a4,a0
20003d16:	011606b3          	add	a3,a2,a7
20003d1a:	8fc9                	or	a5,a5,a0
20003d1c:	97b6                	add	a5,a5,a3
20003d1e:	00c6b633          	sltu	a2,a3,a2
20003d22:	00d7b6b3          	sltu	a3,a5,a3
20003d26:	8e55                	or	a2,a2,a3
20003d28:	959a                	add	a1,a1,t1
20003d2a:	86c2                	mv	a3,a6
20003d2c:	95b2                	add	a1,a1,a2
20003d2e:	d43e                	sw	a5,40(sp)
20003d30:	d036                	sw	a3,32(sp)
20003d32:	d23a                	sw	a4,36(sp)
20003d34:	00c59793          	sll	a5,a1,0xc
20003d38:	0e07cee3          	bltz	a5,20004634 <__addtf3+0xebe>
20003d3c:	d62e                	sw	a1,44(sp)
20003d3e:	101c                	add	a5,sp,32
20003d40:	02c10e13          	add	t3,sp,44
20003d44:	beb9                	j	200038a2 <__addtf3+0x12c>
20003d46:	20040163          	beqz	s0,20003f48 <__addtf3+0x7d2>
20003d4a:	00080737          	lui	a4,0x80
20003d4e:	8f6d                	and	a4,a4,a1
20003d50:	864a                	mv	a2,s2
20003d52:	b665                	j	200038fa <__addtf3+0x184>
20003d54:	0066e6b3          	or	a3,a3,t1
20003d58:	0116e6b3          	or	a3,a3,a7
20003d5c:	8ec9                	or	a3,a3,a0
20003d5e:	eea5                	bnez	a3,20003dd6 <__addtf3+0x660>
20003d60:	043e                	sll	s0,s0,0xf
20003d62:	0085e7b3          	or	a5,a1,s0
20003d66:	4701                	li	a4,0
20003d68:	02e11e23          	sh	a4,60(sp)
20003d6c:	02f11f23          	sh	a5,62(sp)
20003d70:	57f2                	lw	a5,60(sp)
20003d72:	4881                	li	a7,0
20003d74:	4301                	li	t1,0
20003d76:	c00800e3          	beqz	a6,20003976 <__addtf3+0x200>
20003d7a:	00182073          	csrs	fflags,a6
20003d7e:	bee5                	j	20003976 <__addtf3+0x200>
20003d80:	00080537          	lui	a0,0x80
20003d84:	157d                	add	a0,a0,-1 # 7ffff <_start-0x1ff80001>
20003d86:	8d6d                	and	a0,a0,a1
20003d88:	d62a                	sw	a0,44(sp)
20003d8a:	3c051e63          	bnez	a0,20004166 <__addtf3+0x9f0>
20003d8e:	5522                	lw	a0,40(sp)
20003d90:	3a050563          	beqz	a0,2000413a <__addtf3+0x9c4>
20003d94:	1ca050ef          	jal	20008f5e <__clzsi2>
20003d98:	01450713          	add	a4,a0,20
20003d9c:	01f77813          	and	a6,a4,31
20003da0:	6a081063          	bnez	a6,20004440 <__addtf3+0xcca>
20003da4:	4505                	li	a0,1
20003da6:	02000713          	li	a4,32
20003daa:	40a00633          	neg	a2,a0
20003dae:	060a                	sll	a2,a2,0x2
20003db0:	00c60693          	add	a3,a2,12
20003db4:	101c                	add	a5,sp,32
20003db6:	96be                	add	a3,a3,a5
20003db8:	40c00633          	neg	a2,a2
20003dbc:	0006a883          	lw	a7,0(a3)
20003dc0:	00c68833          	add	a6,a3,a2
20003dc4:	85b6                	mv	a1,a3
20003dc6:	01182023          	sw	a7,0(a6) # 80000 <_start-0x1ff80000>
20003dca:	16f1                	add	a3,a3,-4
20003dcc:	fef598e3          	bne	a1,a5,20003dbc <__addtf3+0x646>
20003dd0:	fff50693          	add	a3,a0,-1
20003dd4:	aed5                	j	200041c8 <__addtf3+0xa52>
20003dd6:	4401                	li	s0,0
20003dd8:	6721                	lui	a4,0x8
20003dda:	4881                	li	a7,0
20003ddc:	4301                	li	t1,0
20003dde:	4681                	li	a3,0
20003de0:	b649                	j	20003962 <__addtf3+0x1ec>
20003de2:	4f52                	lw	t5,20(sp)
20003de4:	4fe2                	lw	t6,24(sp)
20003de6:	45f2                	lw	a1,28(sp)
20003de8:	1c060263          	beqz	a2,20003fac <__addtf3+0x836>
20003dec:	41280633          	sub	a2,a6,s2
20003df0:	60091063          	bnez	s2,200043f0 <__addtf3+0xc7a>
20003df4:	4712                	lw	a4,4(sp)
20003df6:	42a2                	lw	t0,8(sp)
20003df8:	4532                	lw	a0,12(sp)
20003dfa:	005768b3          	or	a7,a4,t0
20003dfe:	00a8e8b3          	or	a7,a7,a0
20003e02:	00d8e8b3          	or	a7,a7,a3
20003e06:	3e0884e3          	beqz	a7,200049ee <__addtf3+0x1278>
20003e0a:	fff60893          	add	a7,a2,-1
20003e0e:	4e0888e3          	beqz	a7,20004afe <__addtf3+0x1388>
20003e12:	6721                	lui	a4,0x8
20003e14:	177d                	add	a4,a4,-1 # 7fff <_start-0x1fff8001>
20003e16:	62e606e3          	beq	a2,a4,20004c42 <__addtf3+0x14cc>
20003e1a:	07400713          	li	a4,116
20003e1e:	5f174663          	blt	a4,a7,2000440a <__addtf3+0xc94>
20003e22:	477d                	li	a4,31
20003e24:	3f175fe3          	bge	a4,a7,20004a22 <__addtf3+0x12ac>
20003e28:	4058d713          	sra	a4,a7,0x5
20003e2c:	8646                	mv	a2,a7
20003e2e:	82be                	mv	t0,a5
20003e30:	4681                	li	a3,0
20003e32:	4881                	li	a7,0
20003e34:	0002a383          	lw	t2,0(t0)
20003e38:	0885                	add	a7,a7,1
20003e3a:	0291                	add	t0,t0,4
20003e3c:	0076e6b3          	or	a3,a3,t2
20003e40:	fee8cae3          	blt	a7,a4,20003e34 <__addtf3+0x6be>
20003e44:	893a                	mv	s2,a4
20003e46:	428d                	li	t0,3
20003e48:	01f67893          	and	a7,a2,31
20003e4c:	412282b3          	sub	t0,t0,s2
20003e50:	3c089de3          	bnez	a7,20004a2a <__addtf3+0x12b4>
20003e54:	00291613          	sll	a2,s2,0x2
20003e58:	00c78733          	add	a4,a5,a2
20003e5c:	4318                	lw	a4,0(a4)
20003e5e:	0885                	add	a7,a7,1
20003e60:	0791                	add	a5,a5,4
20003e62:	fee7ae23          	sw	a4,-4(a5)
20003e66:	ff12d9e3          	bge	t0,a7,20003e58 <__addtf3+0x6e2>
20003e6a:	4791                	li	a5,4
20003e6c:	412787b3          	sub	a5,a5,s2
20003e70:	470d                	li	a4,3
20003e72:	4882                	lw	a7,0(sp)
20003e74:	02f74563          	blt	a4,a5,20003e9e <__addtf3+0x728>
20003e78:	4711                	li	a4,4
20003e7a:	8f1d                	sub	a4,a4,a5
20003e7c:	070a                	sll	a4,a4,0x2
20003e7e:	078a                	sll	a5,a5,0x2
20003e80:	4621                	li	a2,8
20003e82:	97f2                	add	a5,a5,t3
20003e84:	00c76863          	bltu	a4,a2,20003e94 <__addtf3+0x71e>
20003e88:	0007a023          	sw	zero,0(a5)
20003e8c:	0007a223          	sw	zero,4(a5)
20003e90:	1761                	add	a4,a4,-8
20003e92:	07a1                	add	a5,a5,8
20003e94:	4611                	li	a2,4
20003e96:	00c76463          	bltu	a4,a2,20003e9e <__addtf3+0x728>
20003e9a:	0007a023          	sw	zero,0(a5)
20003e9e:	00d036b3          	snez	a3,a3
20003ea2:	4792                	lw	a5,4(sp)
20003ea4:	4622                	lw	a2,8(sp)
20003ea6:	4532                	lw	a0,12(sp)
20003ea8:	0116e6b3          	or	a3,a3,a7
20003eac:	a39d                	j	20004412 <__addtf3+0xc9c>
20003eae:	a60415e3          	bnez	s0,20003918 <__addtf3+0x1a2>
20003eb2:	4681                	li	a3,0
20003eb4:	4501                	li	a0,0
20003eb6:	85b2                	mv	a1,a2
20003eb8:	bc85                	j	20003928 <__addtf3+0x1b2>
20003eba:	01d70533          	add	a0,a4,t4
20003ebe:	4108                	lw	a0,0(a0)
20003ec0:	0605                	add	a2,a2,1
20003ec2:	0711                	add	a4,a4,4
20003ec4:	fea72e23          	sw	a0,-4(a4)
20003ec8:	fec7d9e3          	bge	a5,a2,20003eba <__addtf3+0x744>
20003ecc:	4791                	li	a5,4
20003ece:	41f787b3          	sub	a5,a5,t6
20003ed2:	4711                	li	a4,4
20003ed4:	4542                	lw	a0,16(sp)
20003ed6:	02e78563          	beq	a5,a4,20003f00 <__addtf3+0x78a>
20003eda:	4711                	li	a4,4
20003edc:	8f1d                	sub	a4,a4,a5
20003ede:	070a                	sll	a4,a4,0x2
20003ee0:	078a                	sll	a5,a5,0x2
20003ee2:	4621                	li	a2,8
20003ee4:	97fa                	add	a5,a5,t5
20003ee6:	00c76863          	bltu	a4,a2,20003ef6 <__addtf3+0x780>
20003eea:	0007a023          	sw	zero,0(a5)
20003eee:	0007a223          	sw	zero,4(a5)
20003ef2:	1761                	add	a4,a4,-8
20003ef4:	07a1                	add	a5,a5,8
20003ef6:	4611                	li	a2,4
20003ef8:	00c76463          	bltu	a4,a2,20003f00 <__addtf3+0x78a>
20003efc:	0007a023          	sw	zero,0(a5)
20003f00:	010037b3          	snez	a5,a6
20003f04:	4352                	lw	t1,20(sp)
20003f06:	4662                	lw	a2,24(sp)
20003f08:	4872                	lw	a6,28(sp)
20003f0a:	8fc9                	or	a5,a5,a0
20003f0c:	b2b9                	j	2000385a <__addtf3+0xe4>
20003f0e:	fffe0793          	add	a5,t3,-1
20003f12:	00ce3533          	sltu	a0,t3,a2
20003f16:	8f91                	sub	a5,a5,a2
20003f18:	41c60633          	sub	a2,a2,t3
20003f1c:	00163613          	seqz	a2,a2
20003f20:	8d51                	or	a0,a0,a2
20003f22:	b295                	j	20003886 <__addtf3+0x110>
20003f24:	fff80737          	lui	a4,0xfff80
20003f28:	177d                	add	a4,a4,-1 # fff7ffff <dummy_file+0xc9f3dbbf>
20003f2a:	8f6d                	and	a4,a4,a1
20003f2c:	d63a                	sw	a4,44(sp)
20003f2e:	01161593          	sll	a1,a2,0x11
20003f32:	00375513          	srl	a0,a4,0x3
20003f36:	81c5                	srl	a1,a1,0x11
20003f38:	baf5                	j	20003934 <__addtf3+0x1be>
20003f3a:	04041ee3          	bnez	s0,20004796 <__addtf3+0x1020>
20003f3e:	4901                	li	s2,0
20003f40:	4405                	li	s0,1
20003f42:	4805                	li	a6,1
20003f44:	02c10e13          	add	t3,sp,44
20003f48:	5712                	lw	a4,36(sp)
20003f4a:	06a1                	add	a3,a3,8
20003f4c:	5522                	lw	a0,40(sp)
20003f4e:	0086b613          	sltiu	a2,a3,8
20003f52:	963a                	add	a2,a2,a4
20003f54:	00e63733          	sltu	a4,a2,a4
20003f58:	972a                	add	a4,a4,a0
20003f5a:	00a73533          	sltu	a0,a4,a0
20003f5e:	95aa                	add	a1,a1,a0
20003f60:	d036                	sw	a3,32(sp)
20003f62:	d232                	sw	a2,36(sp)
20003f64:	d43a                	sw	a4,40(sp)
20003f66:	d62e                	sw	a1,44(sp)
20003f68:	de0401e3          	beqz	s0,20003d4a <__addtf3+0x5d4>
20003f6c:	00286813          	or	a6,a6,2
20003f70:	864a                	mv	a2,s2
20003f72:	4401                	li	s0,0
20003f74:	b241                	j	200038f4 <__addtf3+0x17e>
20003f76:	dc040ae3          	beqz	s0,20003d4a <__addtf3+0x5d4>
20003f7a:	4401                	li	s0,0
20003f7c:	5712                	lw	a4,36(sp)
20003f7e:	06a1                	add	a3,a3,8
20003f80:	5522                	lw	a0,40(sp)
20003f82:	0086b613          	sltiu	a2,a3,8
20003f86:	963a                	add	a2,a2,a4
20003f88:	00e63733          	sltu	a4,a2,a4
20003f8c:	972a                	add	a4,a4,a0
20003f8e:	00a73533          	sltu	a0,a4,a0
20003f92:	95aa                	add	a1,a1,a0
20003f94:	d036                	sw	a3,32(sp)
20003f96:	d232                	sw	a2,36(sp)
20003f98:	d43a                	sw	a4,40(sp)
20003f9a:	d62e                	sw	a1,44(sp)
20003f9c:	940419e3          	bnez	s0,200038ee <__addtf3+0x178>
20003fa0:	00080737          	lui	a4,0x80
20003fa4:	8f6d                	and	a4,a4,a1
20003fa6:	864a                	mv	a2,s2
20003fa8:	4405                	li	s0,1
20003faa:	ba81                	j	200038fa <__addtf3+0x184>
20003fac:	67a1                	lui	a5,0x8
20003fae:	00190513          	add	a0,s2,1
20003fb2:	17f9                	add	a5,a5,-2 # 7ffe <_start-0x1fff8002>
20003fb4:	00f578b3          	and	a7,a0,a5
20003fb8:	4e92                	lw	t4,4(sp)
20003fba:	4e22                	lw	t3,8(sp)
20003fbc:	4732                	lw	a4,12(sp)
20003fbe:	4c089c63          	bnez	a7,20004496 <__addtf3+0xd20>
20003fc2:	01cee633          	or	a2,t4,t3
20003fc6:	8e59                	or	a2,a2,a4
20003fc8:	8e55                	or	a2,a2,a3
20003fca:	0c091de3          	bnez	s2,200048a4 <__addtf3+0x112e>
20003fce:	240601e3          	beqz	a2,20004a10 <__addtf3+0x129a>
20003fd2:	01ff67b3          	or	a5,t5,t6
20003fd6:	8fcd                	or	a5,a5,a1
20003fd8:	0067e7b3          	or	a5,a5,t1
20003fdc:	7c078363          	beqz	a5,200047a2 <__addtf3+0x102c>
20003fe0:	9336                	add	t1,t1,a3
20003fe2:	01ee8633          	add	a2,t4,t5
20003fe6:	00d33f33          	sltu	t5,t1,a3
20003fea:	9f32                	add	t5,t5,a2
20003fec:	01d637b3          	sltu	a5,a2,t4
20003ff0:	00cf3633          	sltu	a2,t5,a2
20003ff4:	9ff2                	add	t6,t6,t3
20003ff6:	8fd1                	or	a5,a5,a2
20003ff8:	97fe                	add	a5,a5,t6
20003ffa:	01cfb633          	sltu	a2,t6,t3
20003ffe:	01f7bfb3          	sltu	t6,a5,t6
20004002:	01f66633          	or	a2,a2,t6
20004006:	972e                	add	a4,a4,a1
20004008:	9732                	add	a4,a4,a2
2000400a:	d43e                	sw	a5,40(sp)
2000400c:	8fbe                	mv	t6,a5
2000400e:	d01a                	sw	t1,32(sp)
20004010:	d27a                	sw	t5,36(sp)
20004012:	00c71793          	sll	a5,a4,0xc
20004016:	869a                	mv	a3,t1
20004018:	3e07dbe3          	bgez	a5,20004c0e <__addtf3+0x1498>
2000401c:	fff807b7          	lui	a5,0xfff80
20004020:	17fd                	add	a5,a5,-1 # fff7ffff <dummy_file+0xc9f3dbbf>
20004022:	8f7d                	and	a4,a4,a5
20004024:	85ba                	mv	a1,a4
20004026:	4801                	li	a6,0
20004028:	4605                	li	a2,1
2000402a:	a0ed                	j	20004114 <__addtf3+0x99e>
2000402c:	41ee8533          	sub	a0,t4,t5
20004030:	406687b3          	sub	a5,a3,t1
20004034:	c4d2                	sw	s4,72(sp)
20004036:	c2d6                	sw	s5,68(sp)
20004038:	00f6b833          	sltu	a6,a3,a5
2000403c:	00aeba33          	sltu	s4,t4,a0
20004040:	82d2                	mv	t0,s4
20004042:	41050833          	sub	a6,a0,a6
20004046:	41fe0ab3          	sub	s5,t3,t6
2000404a:	01fe33b3          	sltu	t2,t3,t6
2000404e:	04f6f863          	bgeu	a3,a5,2000409e <__addtf3+0x928>
20004052:	05ee9663          	bne	t4,t5,2000409e <__addtf3+0x928>
20004056:	fffa8293          	add	t0,s5,-1
2000405a:	001ab513          	seqz	a0,s5
2000405e:	00a3e3b3          	or	t2,t2,a0
20004062:	40b70533          	sub	a0,a4,a1
20004066:	40750533          	sub	a0,a0,t2
2000406a:	d62a                	sw	a0,44(sp)
2000406c:	d416                	sw	t0,40(sp)
2000406e:	d242                	sw	a6,36(sp)
20004070:	d03e                	sw	a5,32(sp)
20004072:	00c51393          	sll	t2,a0,0xc
20004076:	4803c563          	bltz	t2,20004500 <__addtf3+0xd8a>
2000407a:	0107e7b3          	or	a5,a5,a6
2000407e:	0057e7b3          	or	a5,a5,t0
20004082:	8fc9                	or	a5,a5,a0
20004084:	4a079d63          	bnez	a5,2000453e <__addtf3+0xdc8>
20004088:	4a26                	lw	s4,72(sp)
2000408a:	4a96                	lw	s5,68(sp)
2000408c:	19f9                	add	s3,s3,-2
2000408e:	0019b413          	seqz	s0,s3
20004092:	4801                	li	a6,0
20004094:	4581                	li	a1,0
20004096:	101c                	add	a5,sp,32
20004098:	02c10e13          	add	t3,sp,44
2000409c:	b915                	j	20003cd0 <__addtf3+0x55a>
2000409e:	405a82b3          	sub	t0,s5,t0
200040a2:	fc0a00e3          	beqz	s4,20004062 <__addtf3+0x8ec>
200040a6:	bf55                	j	2000405a <__addtf3+0x8e4>
200040a8:	6721                	lui	a4,0x8
200040aa:	177d                	add	a4,a4,-1 # 7fff <_start-0x1fff8001>
200040ac:	0ae803e3          	beq	a6,a4,20004952 <__addtf3+0x11dc>
200040b0:	4532                	lw	a0,12(sp)
200040b2:	000806b7          	lui	a3,0x80
200040b6:	07400713          	li	a4,116
200040ba:	8d55                	or	a0,a0,a3
200040bc:	c62a                	sw	a0,12(sp)
200040be:	3ac75b63          	bge	a4,a2,20004474 <__addtf3+0xcfe>
200040c2:	4381                	li	t2,0
200040c4:	4601                	li	a2,0
200040c6:	4781                	li	a5,0
200040c8:	4685                	li	a3,1
200040ca:	40ff0733          	sub	a4,t5,a5
200040ce:	40d306b3          	sub	a3,t1,a3
200040d2:	00ef3e33          	sltu	t3,t5,a4
200040d6:	00d33533          	sltu	a0,t1,a3
200040da:	8ef2                	mv	t4,t3
200040dc:	8f09                	sub	a4,a4,a0
200040de:	00d37463          	bgeu	t1,a3,200040e6 <__addtf3+0x970>
200040e2:	63e78763          	beq	a5,t5,20004710 <__addtf3+0xf9a>
200040e6:	40cf87b3          	sub	a5,t6,a2
200040ea:	00ffb533          	sltu	a0,t6,a5
200040ee:	41d787b3          	sub	a5,a5,t4
200040f2:	620e1463          	bnez	t3,2000471a <__addtf3+0xfa4>
200040f6:	00a38633          	add	a2,t2,a0
200040fa:	8d91                	sub	a1,a1,a2
200040fc:	8942                	mv	s2,a6
200040fe:	8446                	mv	s0,a7
20004100:	f8cff06f          	j	2000388c <__addtf3+0x116>
20004104:	67a1                	lui	a5,0x8
20004106:	17fd                	add	a5,a5,-1 # 7fff <_start-0x1fff8001>
20004108:	00f60c63          	beq	a2,a5,20004120 <__addtf3+0x9aa>
2000410c:	d036                	sw	a3,32(sp)
2000410e:	d246                	sw	a7,36(sp)
20004110:	d472                	sw	t3,40(sp)
20004112:	872e                	mv	a4,a1
20004114:	d63a                	sw	a4,44(sp)
20004116:	101c                	add	a5,sp,32
20004118:	02c10e13          	add	t3,sp,44
2000411c:	fd8ff06f          	j	200038f4 <__addtf3+0x17e>
20004120:	01c8e7b3          	or	a5,a7,t3
20004124:	8fcd                	or	a5,a5,a1
20004126:	8fd5                	or	a5,a5,a3
20004128:	d3f5                	beqz	a5,2000410c <__addtf3+0x996>
2000412a:	0125d813          	srl	a6,a1,0x12
2000412e:	00184813          	xor	a6,a6,1
20004132:	00187813          	and	a6,a6,1
20004136:	0812                	sll	a6,a6,0x4
20004138:	bfd1                	j	2000410c <__addtf3+0x996>
2000413a:	5512                	lw	a0,36(sp)
2000413c:	30050d63          	beqz	a0,20004456 <__addtf3+0xce0>
20004140:	61f040ef          	jal	20008f5e <__clzsi2>
20004144:	03450713          	add	a4,a0,52
20004148:	01f77813          	and	a6,a4,31
2000414c:	40575513          	sra	a0,a4,0x5
20004150:	c4080de3          	beqz	a6,20003daa <__addtf3+0x634>
20004154:	c4d2                	sw	s4,72(sp)
20004156:	5a02                	lw	s4,32(sp)
20004158:	02000e13          	li	t3,32
2000415c:	410e0e33          	sub	t3,t3,a6
20004160:	010a1a33          	sll	s4,s4,a6
20004164:	a839                	j	20004182 <__addtf3+0xa0c>
20004166:	c4d2                	sw	s4,72(sp)
20004168:	5f7040ef          	jal	20008f5e <__clzsi2>
2000416c:	ff450813          	add	a6,a0,-12
20004170:	8742                	mv	a4,a6
20004172:	5a02                	lw	s4,32(sp)
20004174:	02000e13          	li	t3,32
20004178:	40ee0e33          	sub	t3,t3,a4
2000417c:	4501                	li	a0,0
2000417e:	010a1a33          	sll	s4,s4,a6
20004182:	40a008b3          	neg	a7,a0
20004186:	088a                	sll	a7,a7,0x2
20004188:	00c88693          	add	a3,a7,12
2000418c:	101c                	add	a5,sp,32
2000418e:	96be                	add	a3,a3,a5
20004190:	411008b3          	neg	a7,a7
20004194:	4290                	lw	a2,0(a3)
20004196:	ffc6a583          	lw	a1,-4(a3) # 7fffc <_start-0x1ff80004>
2000419a:	01168333          	add	t1,a3,a7
2000419e:	01061633          	sll	a2,a2,a6
200041a2:	01c5d5b3          	srl	a1,a1,t3
200041a6:	8e4d                	or	a2,a2,a1
200041a8:	00c32023          	sw	a2,0(t1)
200041ac:	16f1                	add	a3,a3,-4
200041ae:	fed793e3          	bne	a5,a3,20004194 <__addtf3+0xa1e>
200041b2:	00251613          	sll	a2,a0,0x2
200041b6:	04060693          	add	a3,a2,64
200041ba:	00268633          	add	a2,a3,sp
200041be:	ff462023          	sw	s4,-32(a2)
200041c2:	4a26                	lw	s4,72(sp)
200041c4:	fff50693          	add	a3,a0,-1
200041c8:	567d                	li	a2,-1
200041ca:	02c68263          	beq	a3,a2,200041ee <__addtf3+0xa78>
200041ce:	0685                	add	a3,a3,1
200041d0:	068a                	sll	a3,a3,0x2
200041d2:	45a1                	li	a1,8
200041d4:	863e                	mv	a2,a5
200041d6:	00b6e763          	bltu	a3,a1,200041e4 <__addtf3+0xa6e>
200041da:	d002                	sw	zero,32(sp)
200041dc:	0007a223          	sw	zero,4(a5)
200041e0:	1030                	add	a2,sp,40
200041e2:	16e1                	add	a3,a3,-8
200041e4:	4591                	li	a1,4
200041e6:	00b6e463          	bltu	a3,a1,200041ee <__addtf3+0xa78>
200041ea:	00062023          	sw	zero,0(a2)
200041ee:	19274963          	blt	a4,s2,20004380 <__addtf3+0xc0a>
200041f2:	41270733          	sub	a4,a4,s2
200041f6:	0705                	add	a4,a4,1
200041f8:	40575313          	sra	t1,a4,0x5
200041fc:	01f77893          	and	a7,a4,31
20004200:	7a030963          	beqz	t1,200049b2 <__addtf3+0x123c>
20004204:	00231613          	sll	a2,t1,0x2
20004208:	873e                	mv	a4,a5
2000420a:	00f60533          	add	a0,a2,a5
2000420e:	4681                	li	a3,0
20004210:	430c                	lw	a1,0(a4)
20004212:	0711                	add	a4,a4,4
20004214:	8ecd                	or	a3,a3,a1
20004216:	fee51de3          	bne	a0,a4,20004210 <__addtf3+0xa9a>
2000421a:	458d                	li	a1,3
2000421c:	406585b3          	sub	a1,a1,t1
20004220:	06088263          	beqz	a7,20004284 <__addtf3+0xb0e>
20004224:	04060713          	add	a4,a2,64
20004228:	970a                	add	a4,a4,sp
2000422a:	fe072703          	lw	a4,-32(a4)
2000422e:	5eb2                	lw	t4,44(sp)
20004230:	02000e13          	li	t3,32
20004234:	411e0e33          	sub	t3,t3,a7
20004238:	01c71733          	sll	a4,a4,t3
2000423c:	8ed9                	or	a3,a3,a4
2000423e:	011edeb3          	srl	t4,t4,a7
20004242:	74058b63          	beqz	a1,20004998 <__addtf3+0x1222>
20004246:	058a                	sll	a1,a1,0x2
20004248:	00c78733          	add	a4,a5,a2
2000424c:	853e                	mv	a0,a5
2000424e:	00b78f33          	add	t5,a5,a1
20004252:	4310                	lw	a2,0(a4)
20004254:	00472803          	lw	a6,4(a4)
20004258:	0511                	add	a0,a0,4
2000425a:	01165633          	srl	a2,a2,a7
2000425e:	01c81833          	sll	a6,a6,t3
20004262:	01066633          	or	a2,a2,a6
20004266:	fec52e23          	sw	a2,-4(a0)
2000426a:	0711                	add	a4,a4,4
2000426c:	feaf13e3          	bne	t5,a0,20004252 <__addtf3+0xadc>
20004270:	04058713          	add	a4,a1,64
20004274:	002705b3          	add	a1,a4,sp
20004278:	4711                	li	a4,4
2000427a:	40670733          	sub	a4,a4,t1
2000427e:	ffd5a023          	sw	t4,-32(a1)
20004282:	a831                	j	2000429e <__addtf3+0xb28>
20004284:	873e                	mv	a4,a5
20004286:	00c70533          	add	a0,a4,a2
2000428a:	4108                	lw	a0,0(a0)
2000428c:	0885                	add	a7,a7,1
2000428e:	0711                	add	a4,a4,4
20004290:	fea72e23          	sw	a0,-4(a4)
20004294:	ff15d9e3          	bge	a1,a7,20004286 <__addtf3+0xb10>
20004298:	4711                	li	a4,4
2000429a:	40670733          	sub	a4,a4,t1
2000429e:	4611                	li	a2,4
200042a0:	5e82                	lw	t4,32(sp)
200042a2:	02c70563          	beq	a4,a2,200042cc <__addtf3+0xb56>
200042a6:	4611                	li	a2,4
200042a8:	8e19                	sub	a2,a2,a4
200042aa:	060a                	sll	a2,a2,0x2
200042ac:	070a                	sll	a4,a4,0x2
200042ae:	45a1                	li	a1,8
200042b0:	973e                	add	a4,a4,a5
200042b2:	00b66863          	bltu	a2,a1,200042c2 <__addtf3+0xb4c>
200042b6:	00072023          	sw	zero,0(a4)
200042ba:	00072223          	sw	zero,4(a4)
200042be:	1661                	add	a2,a2,-8
200042c0:	0721                	add	a4,a4,8
200042c2:	4591                	li	a1,4
200042c4:	00b66463          	bltu	a2,a1,200042cc <__addtf3+0xb56>
200042c8:	00072023          	sw	zero,0(a4)
200042cc:	5f12                	lw	t5,36(sp)
200042ce:	5fa2                	lw	t6,40(sp)
200042d0:	00d036b3          	snez	a3,a3
200042d4:	01d6e6b3          	or	a3,a3,t4
200042d8:	5732                	lw	a4,44(sp)
200042da:	01e6e5b3          	or	a1,a3,t5
200042de:	01f5e5b3          	or	a1,a1,t6
200042e2:	d036                	sw	a3,32(sp)
200042e4:	8dd9                	or	a1,a1,a4
200042e6:	9e0581e3          	beqz	a1,20003cc8 <__addtf3+0x552>
200042ea:	d836                	sw	a3,48(sp)
200042ec:	da7a                	sw	t5,52(sp)
200042ee:	dc7e                	sw	t6,56(sp)
200042f0:	de3a                	sw	a4,60(sp)
200042f2:	03010813          	add	a6,sp,48
200042f6:	1870                	add	a2,sp,60
200042f8:	00171513          	sll	a0,a4,0x1
200042fc:	ffc62703          	lw	a4,-4(a2)
20004300:	1671                	add	a2,a2,-4
20004302:	01f75593          	srl	a1,a4,0x1f
20004306:	8dc9                	or	a1,a1,a0
20004308:	c24c                	sw	a1,4(a2)
2000430a:	fec817e3          	bne	a6,a2,200042f8 <__addtf3+0xb82>
2000430e:	00169713          	sll	a4,a3,0x1
20004312:	00777613          	and	a2,a4,7
20004316:	55f2                	lw	a1,60(sp)
20004318:	4801                	li	a6,0
2000431a:	ca1d                	beqz	a2,20004350 <__addtf3+0xbda>
2000431c:	4609                	li	a2,2
2000431e:	42c98e63          	beq	s3,a2,2000475a <__addtf3+0xfe4>
20004322:	460d                	li	a2,3
20004324:	40c98a63          	beq	s3,a2,20004738 <__addtf3+0xfc2>
20004328:	4805                	li	a6,1
2000432a:	02099363          	bnez	s3,20004350 <__addtf3+0xbda>
2000432e:	00f77613          	and	a2,a4,15
20004332:	4511                	li	a0,4
20004334:	00a60e63          	beq	a2,a0,20004350 <__addtf3+0xbda>
20004338:	5652                	lw	a2,52(sp)
2000433a:	0711                	add	a4,a4,4
2000433c:	00473713          	sltiu	a4,a4,4
20004340:	963a                	add	a2,a2,a4
20004342:	00e63733          	sltu	a4,a2,a4
20004346:	5662                	lw	a2,56(sp)
20004348:	963a                	add	a2,a2,a4
2000434a:	00e63733          	sltu	a4,a2,a4
2000434e:	95ba                	add	a1,a1,a4
20004350:	00b59613          	sll	a2,a1,0xb
20004354:	0076f713          	and	a4,a3,7
20004358:	55b2                	lw	a1,44(sp)
2000435a:	2a065063          	bgez	a2,200045fa <__addtf3+0xe84>
2000435e:	34071163          	bnez	a4,200046a0 <__addtf3+0xf2a>
20004362:	00080737          	lui	a4,0x80
20004366:	8f6d                	and	a4,a4,a1
20004368:	4601                	li	a2,0
2000436a:	02c10e13          	add	t3,sp,44
2000436e:	960701e3          	beqz	a4,20003cd0 <__addtf3+0x55a>
20004372:	fff80737          	lui	a4,0xfff80
20004376:	177d                	add	a4,a4,-1 # fff7ffff <dummy_file+0xc9f3dbbf>
20004378:	8f6d                	and	a4,a4,a1
2000437a:	d63a                	sw	a4,44(sp)
2000437c:	0605                	add	a2,a2,1
2000437e:	be45                	j	20003f2e <__addtf3+0x7b8>
20004380:	55b2                	lw	a1,44(sp)
20004382:	fff80637          	lui	a2,0xfff80
20004386:	167d                	add	a2,a2,-1 # fff7ffff <dummy_file+0xc9f3dbbf>
20004388:	8df1                	and	a1,a1,a2
2000438a:	5682                	lw	a3,32(sp)
2000438c:	40e90933          	sub	s2,s2,a4
20004390:	d62e                	sw	a1,44(sp)
20004392:	02c10e13          	add	t3,sp,44
20004396:	d0cff06f          	j	200038a2 <__addtf3+0x12c>
2000439a:	01c70533          	add	a0,a4,t3
2000439e:	4108                	lw	a0,0(a0)
200043a0:	0605                	add	a2,a2,1
200043a2:	0711                	add	a4,a4,4
200043a4:	fea72e23          	sw	a0,-4(a4)
200043a8:	fec7d9e3          	bge	a5,a2,2000439a <__addtf3+0xc24>
200043ac:	4791                	li	a5,4
200043ae:	405787b3          	sub	a5,a5,t0
200043b2:	4711                	li	a4,4
200043b4:	4542                	lw	a0,16(sp)
200043b6:	02e78563          	beq	a5,a4,200043e0 <__addtf3+0xc6a>
200043ba:	4711                	li	a4,4
200043bc:	8f1d                	sub	a4,a4,a5
200043be:	070a                	sll	a4,a4,0x2
200043c0:	078a                	sll	a5,a5,0x2
200043c2:	4621                	li	a2,8
200043c4:	97fa                	add	a5,a5,t5
200043c6:	00c76863          	bltu	a4,a2,200043d6 <__addtf3+0xc60>
200043ca:	0007a023          	sw	zero,0(a5)
200043ce:	0007a223          	sw	zero,4(a5)
200043d2:	1761                	add	a4,a4,-8
200043d4:	07a1                	add	a5,a5,8
200043d6:	4611                	li	a2,4
200043d8:	00c76463          	bltu	a4,a2,200043e0 <__addtf3+0xc6a>
200043dc:	0007a023          	sw	zero,0(a5)
200043e0:	01003833          	snez	a6,a6
200043e4:	47d2                	lw	a5,20(sp)
200043e6:	4662                	lw	a2,24(sp)
200043e8:	4372                	lw	t1,28(sp)
200043ea:	00a86833          	or	a6,a6,a0
200043ee:	ba11                	j	20003d02 <__addtf3+0x58c>
200043f0:	6721                	lui	a4,0x8
200043f2:	177d                	add	a4,a4,-1 # 7fff <_start-0x1fff8001>
200043f4:	78e80163          	beq	a6,a4,20004b76 <__addtf3+0x1400>
200043f8:	4532                	lw	a0,12(sp)
200043fa:	000806b7          	lui	a3,0x80
200043fe:	07400713          	li	a4,116
20004402:	8d55                	or	a0,a0,a3
20004404:	c62a                	sw	a0,12(sp)
20004406:	56c75c63          	bge	a4,a2,2000497e <__addtf3+0x1208>
2000440a:	4501                	li	a0,0
2000440c:	4601                	li	a2,0
2000440e:	4781                	li	a5,0
20004410:	4685                	li	a3,1
20004412:	969a                	add	a3,a3,t1
20004414:	9f3e                	add	t5,t5,a5
20004416:	0066b733          	sltu	a4,a3,t1
2000441a:	977a                	add	a4,a4,t5
2000441c:	00ff37b3          	sltu	a5,t5,a5
20004420:	01e73f33          	sltu	t5,a4,t5
20004424:	9fb2                	add	t6,t6,a2
20004426:	01e7e7b3          	or	a5,a5,t5
2000442a:	97fe                	add	a5,a5,t6
2000442c:	00cfb633          	sltu	a2,t6,a2
20004430:	01f7bfb3          	sltu	t6,a5,t6
20004434:	01f66633          	or	a2,a2,t6
20004438:	95aa                	add	a1,a1,a0
2000443a:	95b2                	add	a1,a1,a2
2000443c:	8942                	mv	s2,a6
2000443e:	b8c5                	j	20003d2e <__addtf3+0x5b8>
20004440:	c4d2                	sw	s4,72(sp)
20004442:	5a02                	lw	s4,32(sp)
20004444:	02000e13          	li	t3,32
20004448:	40575513          	sra	a0,a4,0x5
2000444c:	410e0e33          	sub	t3,t3,a6
20004450:	010a1a33          	sll	s4,s4,a6
20004454:	b33d                	j	20004182 <__addtf3+0xa0c>
20004456:	c4d2                	sw	s4,72(sp)
20004458:	5a02                	lw	s4,32(sp)
2000445a:	8552                	mv	a0,s4
2000445c:	303040ef          	jal	20008f5e <__clzsi2>
20004460:	05450713          	add	a4,a0,84
20004464:	01f77813          	and	a6,a4,31
20004468:	52081a63          	bnez	a6,2000499c <__addtf3+0x1226>
2000446c:	4a26                	lw	s4,72(sp)
2000446e:	40575513          	sra	a0,a4,0x5
20004472:	ba25                	j	20003daa <__addtf3+0x634>
20004474:	41f65713          	sra	a4,a2,0x1f
20004478:	8b7d                	and	a4,a4,31
2000447a:	9732                	add	a4,a4,a2
2000447c:	46fd                	li	a3,31
2000447e:	8715                	sra	a4,a4,0x5
20004480:	d4c6cf63          	blt	a3,a2,200039de <__addtf3+0x268>
20004484:	893a                	mv	s2,a4
20004486:	4681                	li	a3,0
20004488:	4701                	li	a4,0
2000448a:	d6aff06f          	j	200039f4 <__addtf3+0x27e>
2000448e:	a20412e3          	bnez	s0,20003eb2 <__addtf3+0x73c>
20004492:	c86ff06f          	j	20003918 <__addtf3+0x1a2>
20004496:	9336                	add	t1,t1,a3
20004498:	9f76                	add	t5,t5,t4
2000449a:	00d336b3          	sltu	a3,t1,a3
2000449e:	00df0833          	add	a6,t5,a3
200044a2:	01df36b3          	sltu	a3,t5,t4
200044a6:	01e83f33          	sltu	t5,a6,t5
200044aa:	9ff2                	add	t6,t6,t3
200044ac:	01e6e6b3          	or	a3,a3,t5
200044b0:	96fe                	add	a3,a3,t6
200044b2:	01cfb633          	sltu	a2,t6,t3
200044b6:	01f6bfb3          	sltu	t6,a3,t6
200044ba:	972e                	add	a4,a4,a1
200044bc:	01f66633          	or	a2,a2,t6
200044c0:	963a                	add	a2,a2,a4
200044c2:	101c                	add	a5,sp,32
200044c4:	d01a                	sw	t1,32(sp)
200044c6:	d242                	sw	a6,36(sp)
200044c8:	d436                	sw	a3,40(sp)
200044ca:	d632                	sw	a2,44(sp)
200044cc:	873e                	mv	a4,a5
200044ce:	02c10e13          	add	t3,sp,44
200044d2:	00135593          	srl	a1,t1,0x1
200044d6:	00472303          	lw	t1,4(a4)
200044da:	0711                	add	a4,a4,4
200044dc:	01f31693          	sll	a3,t1,0x1f
200044e0:	8ecd                	or	a3,a3,a1
200044e2:	fed72e23          	sw	a3,-4(a4)
200044e6:	ffc716e3          	bne	a4,t3,200044d2 <__addtf3+0xd5c>
200044ea:	00165593          	srl	a1,a2,0x1
200044ee:	6721                	lui	a4,0x8
200044f0:	d62e                	sw	a1,44(sp)
200044f2:	177d                	add	a4,a4,-1 # 7fff <_start-0x1fff8001>
200044f4:	18e50263          	beq	a0,a4,20004678 <__addtf3+0xf02>
200044f8:	5682                	lw	a3,32(sp)
200044fa:	892a                	mv	s2,a0
200044fc:	ba6ff06f          	j	200038a2 <__addtf3+0x12c>
20004500:	41df0633          	sub	a2,t5,t4
20004504:	40d306b3          	sub	a3,t1,a3
20004508:	00cf3533          	sltu	a0,t5,a2
2000450c:	00d337b3          	sltu	a5,t1,a3
20004510:	41cf8833          	sub	a6,t6,t3
20004514:	82aa                	mv	t0,a0
20004516:	8e1d                	sub	a2,a2,a5
20004518:	01cfbe33          	sltu	t3,t6,t3
2000451c:	00d37463          	bgeu	t1,a3,20004524 <__addtf3+0xdae>
20004520:	4fee8263          	beq	t4,t5,20004a04 <__addtf3+0x128e>
20004524:	40580833          	sub	a6,a6,t0
20004528:	4c051f63          	bnez	a0,20004a06 <__addtf3+0x1290>
2000452c:	40e58533          	sub	a0,a1,a4
20004530:	41c50533          	sub	a0,a0,t3
20004534:	d62a                	sw	a0,44(sp)
20004536:	d442                	sw	a6,40(sp)
20004538:	d232                	sw	a2,36(sp)
2000453a:	d036                	sw	a3,32(sp)
2000453c:	8446                	mv	s0,a7
2000453e:	020507e3          	beqz	a0,20004d6c <__addtf3+0x15f6>
20004542:	21d040ef          	jal	20008f5e <__clzsi2>
20004546:	ff450793          	add	a5,a0,-12
2000454a:	01f7f713          	and	a4,a5,31
2000454e:	4501                	li	a0,0
20004550:	000719e3          	bnez	a4,20004d62 <__addtf3+0x15ec>
20004554:	4a26                	lw	s4,72(sp)
20004556:	4a96                	lw	s5,68(sp)
20004558:	b889                	j	20003daa <__addtf3+0x634>
2000455a:	67a1                	lui	a5,0x8
2000455c:	17fd                	add	a5,a5,-1 # 7fff <_start-0x1fff8001>
2000455e:	2af60163          	beq	a2,a5,20004800 <__addtf3+0x108a>
20004562:	d01a                	sw	t1,32(sp)
20004564:	d27a                	sw	t5,36(sp)
20004566:	d47e                	sw	t6,40(sp)
20004568:	872e                	mv	a4,a1
2000456a:	8446                	mv	s0,a7
2000456c:	884a                	mv	a6,s2
2000456e:	b65d                	j	20004114 <__addtf3+0x99e>
20004570:	6621                	lui	a2,0x8
20004572:	167d                	add	a2,a2,-1 # 7fff <_start-0x1fff8001>
20004574:	52c90863          	beq	s2,a2,20004aa4 <__addtf3+0x132e>
20004578:	64c80c63          	beq	a6,a2,20004bd0 <__addtf3+0x145a>
2000457c:	c7a5                	beqz	a5,200045e4 <__addtf3+0xe6e>
2000457e:	54051563          	bnez	a0,20004ac8 <__addtf3+0x1352>
20004582:	6621                	lui	a2,0x8
20004584:	d036                	sw	a3,32(sp)
20004586:	d276                	sw	t4,36(sp)
20004588:	d472                	sw	t3,40(sp)
2000458a:	85ba                	mv	a1,a4
2000458c:	8816                	mv	a6,t0
2000458e:	167d                	add	a2,a2,-1 # 7fff <_start-0x1fff8001>
20004590:	b651                	j	20004114 <__addtf3+0x99e>
20004592:	00668833          	add	a6,a3,t1
20004596:	9ebe                	add	t4,t4,a5
20004598:	00d83733          	sltu	a4,a6,a3
2000459c:	9776                	add	a4,a4,t4
2000459e:	00feb7b3          	sltu	a5,t4,a5
200045a2:	01d73eb3          	sltu	t4,a4,t4
200045a6:	011f86b3          	add	a3,t6,a7
200045aa:	01d7e7b3          	or	a5,a5,t4
200045ae:	97b6                	add	a5,a5,a3
200045b0:	01f6b633          	sltu	a2,a3,t6
200045b4:	00d7b6b3          	sltu	a3,a5,a3
200045b8:	8e55                	or	a2,a2,a3
200045ba:	952e                	add	a0,a0,a1
200045bc:	86c2                	mv	a3,a6
200045be:	00a605b3          	add	a1,a2,a0
200045c2:	4905                	li	s2,1
200045c4:	f6aff06f          	j	20003d2e <__addtf3+0x5b8>
200045c8:	4842                	lw	a6,16(sp)
200045ca:	02000393          	li	t2,32
200045ce:	40c383b3          	sub	t2,t2,a2
200045d2:	c4d2                	sw	s4,72(sp)
200045d4:	00781833          	sll	a6,a6,t2
200045d8:	00c55533          	srl	a0,a0,a2
200045dc:	478d                	li	a5,3
200045de:	4e01                	li	t3,0
200045e0:	d0eff06f          	j	20003aee <__addtf3+0x378>
200045e4:	5e050a63          	beqz	a0,20004bd8 <__addtf3+0x1462>
200045e8:	6621                	lui	a2,0x8
200045ea:	d01a                	sw	t1,32(sp)
200045ec:	d27a                	sw	t5,36(sp)
200045ee:	d47e                	sw	t6,40(sp)
200045f0:	872e                	mv	a4,a1
200045f2:	8446                	mv	s0,a7
200045f4:	8816                	mv	a6,t0
200045f6:	167d                	add	a2,a2,-1 # 7fff <_start-0x1fff8001>
200045f8:	be31                	j	20004114 <__addtf3+0x99e>
200045fa:	c705                	beqz	a4,20004622 <__addtf3+0xeac>
200045fc:	4709                	li	a4,2
200045fe:	28e98b63          	beq	s3,a4,20004894 <__addtf3+0x111e>
20004602:	470d                	li	a4,3
20004604:	92e98be3          	beq	s3,a4,20003f3a <__addtf3+0x7c4>
20004608:	18099763          	bnez	s3,20004796 <__addtf3+0x1020>
2000460c:	00f6f713          	and	a4,a3,15
20004610:	4611                	li	a2,4
20004612:	74c71163          	bne	a4,a2,20004d54 <__addtf3+0x15de>
20004616:	4601                	li	a2,0
20004618:	480d                	li	a6,3
2000461a:	02c10e13          	add	t3,sp,44
2000461e:	ad6ff06f          	j	200038f4 <__addtf3+0x17e>
20004622:	00080737          	lui	a4,0x80
20004626:	8f6d                	and	a4,a4,a1
20004628:	16081763          	bnez	a6,20004796 <__addtf3+0x1020>
2000462c:	4601                	li	a2,0
2000462e:	02c10e13          	add	t3,sp,44
20004632:	bb35                	j	2000436e <__addtf3+0xbf8>
20004634:	fff807b7          	lui	a5,0xfff80
20004638:	17fd                	add	a5,a5,-1 # fff7ffff <dummy_file+0xc9f3dbbf>
2000463a:	8dfd                	and	a1,a1,a5
2000463c:	101c                	add	a5,sp,32
2000463e:	d62e                	sw	a1,44(sp)
20004640:	0905                	add	s2,s2,1
20004642:	01f69813          	sll	a6,a3,0x1f
20004646:	873e                	mv	a4,a5
20004648:	02c10e13          	add	t3,sp,44
2000464c:	0016d513          	srl	a0,a3,0x1
20004650:	4354                	lw	a3,4(a4)
20004652:	0711                	add	a4,a4,4 # 80004 <_start-0x1ff7fffc>
20004654:	01f69613          	sll	a2,a3,0x1f
20004658:	8e49                	or	a2,a2,a0
2000465a:	fec72e23          	sw	a2,-4(a4)
2000465e:	ffc717e3          	bne	a4,t3,2000464c <__addtf3+0xed6>
20004662:	5682                	lw	a3,32(sp)
20004664:	01003733          	snez	a4,a6
20004668:	8185                	srl	a1,a1,0x1
2000466a:	8ed9                	or	a3,a3,a4
2000466c:	6721                	lui	a4,0x8
2000466e:	d62e                	sw	a1,44(sp)
20004670:	d036                	sw	a3,32(sp)
20004672:	177d                	add	a4,a4,-1 # 7fff <_start-0x1fff8001>
20004674:	a2e91763          	bne	s2,a4,200038a2 <__addtf3+0x12c>
20004678:	16098a63          	beqz	s3,200047ec <__addtf3+0x1076>
2000467c:	470d                	li	a4,3
2000467e:	16e98563          	beq	s3,a4,200047e8 <__addtf3+0x1072>
20004682:	4709                	li	a4,2
20004684:	5ee98363          	beq	s3,a4,20004c6a <__addtf3+0x14f4>
20004688:	577d                	li	a4,-1
2000468a:	6921                	lui	s2,0x8
2000468c:	d63a                	sw	a4,44(sp)
2000468e:	d43a                	sw	a4,40(sp)
20004690:	d23a                	sw	a4,36(sp)
20004692:	d03a                	sw	a4,32(sp)
20004694:	55fd                	li	a1,-1
20004696:	4815                	li	a6,5
20004698:	1979                	add	s2,s2,-2 # 7ffe <_start-0x1fff8002>
2000469a:	56fd                	li	a3,-1
2000469c:	a12ff06f          	j	200038ae <__addtf3+0x138>
200046a0:	4805                	li	a6,1
200046a2:	4901                	li	s2,0
200046a4:	02c10e13          	add	t3,sp,44
200046a8:	a06ff06f          	j	200038ae <__addtf3+0x138>
200046ac:	40668333          	sub	t1,a3,t1
200046b0:	40588733          	sub	a4,a7,t0
200046b4:	0066beb3          	sltu	t4,a3,t1
200046b8:	00e8b633          	sltu	a2,a7,a4
200046bc:	869a                	mv	a3,t1
200046be:	41d70733          	sub	a4,a4,t4
200046c2:	8332                	mv	t1,a2
200046c4:	41fe07b3          	sub	a5,t3,t6
200046c8:	01fe3833          	sltu	a6,t3,t6
200046cc:	000e8463          	beqz	t4,200046d4 <__addtf3+0xf5e>
200046d0:	0f128163          	beq	t0,a7,200047b2 <__addtf3+0x103c>
200046d4:	406787b3          	sub	a5,a5,t1
200046d8:	ee71                	bnez	a2,200047b4 <__addtf3+0x103e>
200046da:	8642                	mv	a2,a6
200046dc:	40a58533          	sub	a0,a1,a0
200046e0:	40c505b3          	sub	a1,a0,a2
200046e4:	4905                	li	s2,1
200046e6:	9a6ff06f          	j	2000388c <__addtf3+0x116>
200046ea:	01c8e7b3          	or	a5,a7,t3
200046ee:	8fcd                	or	a5,a5,a1
200046f0:	8fd5                	or	a5,a5,a3
200046f2:	4801                	li	a6,0
200046f4:	cb81                	beqz	a5,20004704 <__addtf3+0xf8e>
200046f6:	0125d813          	srl	a6,a1,0x12
200046fa:	00184813          	xor	a6,a6,1
200046fe:	00187813          	and	a6,a6,1
20004702:	0812                	sll	a6,a6,0x4
20004704:	d036                	sw	a3,32(sp)
20004706:	d246                	sw	a7,36(sp)
20004708:	d472                	sw	t3,40(sp)
2000470a:	872e                	mv	a4,a1
2000470c:	864a                	mv	a2,s2
2000470e:	b419                	j	20004114 <__addtf3+0x99e>
20004710:	ffff8793          	add	a5,t6,-1
20004714:	00cfb533          	sltu	a0,t6,a2
20004718:	8f91                	sub	a5,a5,a2
2000471a:	41f60633          	sub	a2,a2,t6
2000471e:	00163613          	seqz	a2,a2
20004722:	8d51                	or	a0,a0,a2
20004724:	bac9                	j	200040f6 <__addtf3+0x980>
20004726:	67a1                	lui	a5,0x8
20004728:	17fd                	add	a5,a5,-1 # 7fff <_start-0x1fff8001>
2000472a:	04f60963          	beq	a2,a5,2000477c <__addtf3+0x1006>
2000472e:	d036                	sw	a3,32(sp)
20004730:	d276                	sw	t4,36(sp)
20004732:	d446                	sw	a7,40(sp)
20004734:	872e                	mv	a4,a1
20004736:	baf9                	j	20004114 <__addtf3+0x99e>
20004738:	8822                	mv	a6,s0
2000473a:	c0041be3          	bnez	s0,20004350 <__addtf3+0xbda>
2000473e:	5652                	lw	a2,52(sp)
20004740:	0721                	add	a4,a4,8
20004742:	00873713          	sltiu	a4,a4,8
20004746:	963a                	add	a2,a2,a4
20004748:	00e63733          	sltu	a4,a2,a4
2000474c:	5662                	lw	a2,56(sp)
2000474e:	4805                	li	a6,1
20004750:	963a                	add	a2,a2,a4
20004752:	00e63733          	sltu	a4,a2,a4
20004756:	95ba                	add	a1,a1,a4
20004758:	bee5                	j	20004350 <__addtf3+0xbda>
2000475a:	4805                	li	a6,1
2000475c:	be040ae3          	beqz	s0,20004350 <__addtf3+0xbda>
20004760:	5652                	lw	a2,52(sp)
20004762:	0721                	add	a4,a4,8
20004764:	00873713          	sltiu	a4,a4,8
20004768:	963a                	add	a2,a2,a4
2000476a:	00e63733          	sltu	a4,a2,a4
2000476e:	5662                	lw	a2,56(sp)
20004770:	8822                	mv	a6,s0
20004772:	963a                	add	a2,a2,a4
20004774:	00e63733          	sltu	a4,a2,a4
20004778:	95ba                	add	a1,a1,a4
2000477a:	bed9                	j	20004350 <__addtf3+0xbda>
2000477c:	011ee7b3          	or	a5,t4,a7
20004780:	8fcd                	or	a5,a5,a1
20004782:	8fd5                	or	a5,a5,a3
20004784:	d7cd                	beqz	a5,2000472e <__addtf3+0xfb8>
20004786:	0125d813          	srl	a6,a1,0x12
2000478a:	00184813          	xor	a6,a6,1
2000478e:	00187813          	and	a6,a6,1
20004792:	0812                	sll	a6,a6,0x4
20004794:	bf69                	j	2000472e <__addtf3+0xfb8>
20004796:	480d                	li	a6,3
20004798:	4601                	li	a2,0
2000479a:	02c10e13          	add	t3,sp,44
2000479e:	956ff06f          	j	200038f4 <__addtf3+0x17e>
200047a2:	d036                	sw	a3,32(sp)
200047a4:	d276                	sw	t4,36(sp)
200047a6:	d472                	sw	t3,40(sp)
200047a8:	d63a                	sw	a4,44(sp)
200047aa:	8f76                	mv	t5,t4
200047ac:	8ff2                	mv	t6,t3
200047ae:	101c                	add	a5,sp,32
200047b0:	be2d                	j	200042ea <__addtf3+0xb74>
200047b2:	17fd                	add	a5,a5,-1
200047b4:	41cf8633          	sub	a2,t6,t3
200047b8:	00163613          	seqz	a2,a2
200047bc:	00c86633          	or	a2,a6,a2
200047c0:	bf31                	j	200046dc <__addtf3+0xf66>
200047c2:	011ee7b3          	or	a5,t4,a7
200047c6:	8fcd                	or	a5,a5,a1
200047c8:	8fd5                	or	a5,a5,a3
200047ca:	4801                	li	a6,0
200047cc:	cb81                	beqz	a5,200047dc <__addtf3+0x1066>
200047ce:	0125d813          	srl	a6,a1,0x12
200047d2:	00184813          	xor	a6,a6,1
200047d6:	00187813          	and	a6,a6,1
200047da:	0812                	sll	a6,a6,0x4
200047dc:	d036                	sw	a3,32(sp)
200047de:	d276                	sw	t4,36(sp)
200047e0:	d446                	sw	a7,40(sp)
200047e2:	872e                	mv	a4,a1
200047e4:	864a                	mv	a2,s2
200047e6:	b23d                	j	20004114 <__addtf3+0x99e>
200047e8:	ea0410e3          	bnez	s0,20004688 <__addtf3+0xf12>
200047ec:	6621                	lui	a2,0x8
200047ee:	d602                	sw	zero,44(sp)
200047f0:	d402                	sw	zero,40(sp)
200047f2:	d202                	sw	zero,36(sp)
200047f4:	d002                	sw	zero,32(sp)
200047f6:	4581                	li	a1,0
200047f8:	167d                	add	a2,a2,-1 # 7fff <_start-0x1fff8001>
200047fa:	4815                	li	a6,5
200047fc:	cd4ff06f          	j	20003cd0 <__addtf3+0x55a>
20004800:	01ff67b3          	or	a5,t5,t6
20004804:	8fcd                	or	a5,a5,a1
20004806:	0067e7b3          	or	a5,a5,t1
2000480a:	d4078ce3          	beqz	a5,20004562 <__addtf3+0xdec>
2000480e:	0125d913          	srl	s2,a1,0x12
20004812:	00194913          	xor	s2,s2,1
20004816:	00197913          	and	s2,s2,1
2000481a:	0912                	sll	s2,s2,0x4
2000481c:	b399                	j	20004562 <__addtf3+0xdec>
2000481e:	c4d2                	sw	s4,72(sp)
20004820:	00271793          	sll	a5,a4,0x2
20004824:	41f65413          	sra	s0,a2,0x1f
20004828:	806d                	srl	s0,s0,0x1b
2000482a:	04078793          	add	a5,a5,64
2000482e:	00860733          	add	a4,a2,s0
20004832:	978a                	add	a5,a5,sp
20004834:	fc07a783          	lw	a5,-64(a5)
20004838:	8b7d                	and	a4,a4,31
2000483a:	8c19                	sub	s0,s0,a4
2000483c:	02040a13          	add	s4,s0,32
20004840:	014797b3          	sll	a5,a5,s4
20004844:	8edd                	or	a3,a3,a5
20004846:	48038763          	beqz	t2,20004cd4 <__addtf3+0x155e>
2000484a:	00291413          	sll	s0,s2,0x2
2000484e:	008e07b3          	add	a5,t3,s0
20004852:	0ea1                	add	t4,t4,8
20004854:	40800433          	neg	s0,s0
20004858:	4398                	lw	a4,0(a5)
2000485a:	43d0                	lw	a2,4(a5)
2000485c:	00878533          	add	a0,a5,s0
20004860:	00575733          	srl	a4,a4,t0
20004864:	01461633          	sll	a2,a2,s4
20004868:	8f51                	or	a4,a4,a2
2000486a:	c118                	sw	a4,0(a0)
2000486c:	0791                	add	a5,a5,4
2000486e:	fefe95e3          	bne	t4,a5,20004858 <__addtf3+0x10e2>
20004872:	4632                	lw	a2,12(sp)
20004874:	00239713          	sll	a4,t2,0x2
20004878:	04070793          	add	a5,a4,64
2000487c:	00278733          	add	a4,a5,sp
20004880:	00565633          	srl	a2,a2,t0
20004884:	4791                	li	a5,4
20004886:	4a26                	lw	s4,72(sp)
20004888:	412787b3          	sub	a5,a5,s2
2000488c:	fcc72023          	sw	a2,-64(a4)
20004890:	98eff06f          	j	20003a1e <__addtf3+0x2a8>
20004894:	d80401e3          	beqz	s0,20004616 <__addtf3+0xea0>
20004898:	8822                	mv	a6,s0
2000489a:	4901                	li	s2,0
2000489c:	02c10e13          	add	t3,sp,44
200048a0:	edcff06f          	j	20003f7c <__addtf3+0x806>
200048a4:	67a1                	lui	a5,0x8
200048a6:	17fd                	add	a5,a5,-1 # 7fff <_start-0x1fff8001>
200048a8:	36f90763          	beq	s2,a5,20004c16 <__addtf3+0x14a0>
200048ac:	28f80563          	beq	a6,a5,20004b36 <__addtf3+0x13c0>
200048b0:	28060c63          	beqz	a2,20004b48 <__addtf3+0x13d2>
200048b4:	01ff67b3          	or	a5,t5,t6
200048b8:	8fcd                	or	a5,a5,a1
200048ba:	0067e7b3          	or	a5,a5,t1
200048be:	3e078363          	beqz	a5,20004ca4 <__addtf3+0x152e>
200048c2:	67a1                	lui	a5,0x8
200048c4:	02c10e13          	add	t3,sp,44
200048c8:	d63e                	sw	a5,44(sp)
200048ca:	d402                	sw	zero,40(sp)
200048cc:	d202                	sw	zero,36(sp)
200048ce:	d002                	sw	zero,32(sp)
200048d0:	101c                	add	a5,sp,32
200048d2:	8772                	mv	a4,t3
200048d4:	6621                	lui	a2,0x8
200048d6:	00361593          	sll	a1,a2,0x3
200048da:	ffc72603          	lw	a2,-4(a4)
200048de:	1771                	add	a4,a4,-4
200048e0:	01d65693          	srl	a3,a2,0x1d
200048e4:	8ecd                	or	a3,a3,a1
200048e6:	c354                	sw	a3,4(a4)
200048e8:	fee797e3          	bne	a5,a4,200048d6 <__addtf3+0x1160>
200048ec:	55b2                	lw	a1,44(sp)
200048ee:	00080737          	lui	a4,0x80
200048f2:	8846                	mv	a6,a7
200048f4:	8f6d                	and	a4,a4,a1
200048f6:	6621                	lui	a2,0x8
200048f8:	167d                	add	a2,a2,-1 # 7fff <_start-0x1fff8001>
200048fa:	4401                	li	s0,0
200048fc:	bc8d                	j	2000436e <__addtf3+0xbf8>
200048fe:	d01a                	sw	t1,32(sp)
20004900:	d27a                	sw	t5,36(sp)
20004902:	d47e                	sw	t6,40(sp)
20004904:	d62e                	sw	a1,44(sp)
20004906:	26051263          	bnez	a0,20004b6a <__addtf3+0x13f4>
2000490a:	19f9                	add	s3,s3,-2
2000490c:	0019b413          	seqz	s0,s3
20004910:	f82ff06f          	j	20004092 <__addtf3+0x91c>
20004914:	407f0733          	sub	a4,t5,t2
20004918:	40d306b3          	sub	a3,t1,a3
2000491c:	00d337b3          	sltu	a5,t1,a3
20004920:	00ef3633          	sltu	a2,t5,a4
20004924:	8e32                	mv	t3,a2
20004926:	8f1d                	sub	a4,a4,a5
20004928:	008fb833          	sltu	a6,t6,s0
2000492c:	408f87b3          	sub	a5,t6,s0
20004930:	00d37463          	bgeu	t1,a3,20004938 <__addtf3+0x11c2>
20004934:	23e38363          	beq	t2,t5,20004b5a <__addtf3+0x13e4>
20004938:	41c787b3          	sub	a5,a5,t3
2000493c:	22061063          	bnez	a2,20004b5c <__addtf3+0x13e6>
20004940:	8642                	mv	a2,a6
20004942:	40a58533          	sub	a0,a1,a0
20004946:	40c505b3          	sub	a1,a0,a2
2000494a:	8446                	mv	s0,a7
2000494c:	4905                	li	s2,1
2000494e:	f3ffe06f          	j	2000388c <__addtf3+0x116>
20004952:	01ff67b3          	or	a5,t5,t6
20004956:	8fcd                	or	a5,a5,a1
20004958:	0067e7b3          	or	a5,a5,t1
2000495c:	4681                	li	a3,0
2000495e:	c799                	beqz	a5,2000496c <__addtf3+0x11f6>
20004960:	0125d693          	srl	a3,a1,0x12
20004964:	0016c693          	xor	a3,a3,1
20004968:	8a85                	and	a3,a3,1
2000496a:	0692                	sll	a3,a3,0x4
2000496c:	8642                	mv	a2,a6
2000496e:	d01a                	sw	t1,32(sp)
20004970:	d27a                	sw	t5,36(sp)
20004972:	d47e                	sw	t6,40(sp)
20004974:	872e                	mv	a4,a1
20004976:	8446                	mv	s0,a7
20004978:	8836                	mv	a6,a3
2000497a:	f9aff06f          	j	20004114 <__addtf3+0x99e>
2000497e:	41f65713          	sra	a4,a2,0x1f
20004982:	8b7d                	and	a4,a4,31
20004984:	9732                	add	a4,a4,a2
20004986:	46fd                	li	a3,31
20004988:	8715                	sra	a4,a4,0x5
2000498a:	cac6c263          	blt	a3,a2,20003e2e <__addtf3+0x6b8>
2000498e:	893a                	mv	s2,a4
20004990:	4681                	li	a3,0
20004992:	4701                	li	a4,0
20004994:	cb2ff06f          	j	20003e46 <__addtf3+0x6d0>
20004998:	4705                	li	a4,1
2000499a:	b231                	j	200042a6 <__addtf3+0xb30>
2000499c:	05f00793          	li	a5,95
200049a0:	010a1a33          	sll	s4,s4,a6
200049a4:	32e7de63          	bge	a5,a4,20004ce0 <__addtf3+0x156a>
200049a8:	d652                	sw	s4,44(sp)
200049aa:	4689                	li	a3,2
200049ac:	4a26                	lw	s4,72(sp)
200049ae:	101c                	add	a5,sp,32
200049b0:	b839                	j	200041ce <__addtf3+0xa58>
200049b2:	5682                	lw	a3,32(sp)
200049b4:	5eb2                	lw	t4,44(sp)
200049b6:	02000e13          	li	t3,32
200049ba:	411e0e33          	sub	t3,t3,a7
200049be:	01c696b3          	sll	a3,a3,t3
200049c2:	011edeb3          	srl	t4,t4,a7
200049c6:	458d                	li	a1,3
200049c8:	4601                	li	a2,0
200049ca:	b8b5                	j	20004246 <__addtf3+0xad0>
200049cc:	47c2                	lw	a5,16(sp)
200049ce:	02000393          	li	t2,32
200049d2:	40c383b3          	sub	t2,t2,a2
200049d6:	00779833          	sll	a6,a5,t2
200049da:	c4d2                	sw	s4,72(sp)
200049dc:	00c55533          	srl	a0,a0,a2
200049e0:	478d                	li	a5,3
200049e2:	4e81                	li	t4,0
200049e4:	9ccff06f          	j	20003bb0 <__addtf3+0x43a>
200049e8:	4785                	li	a5,1
200049ea:	cf0ff06f          	j	20003eda <__addtf3+0x764>
200049ee:	67a1                	lui	a5,0x8
200049f0:	17fd                	add	a5,a5,-1 # 7fff <_start-0x1fff8001>
200049f2:	28f60a63          	beq	a2,a5,20004c86 <__addtf3+0x1510>
200049f6:	d01a                	sw	t1,32(sp)
200049f8:	d27a                	sw	t5,36(sp)
200049fa:	d47e                	sw	t6,40(sp)
200049fc:	872e                	mv	a4,a1
200049fe:	884a                	mv	a6,s2
20004a00:	f14ff06f          	j	20004114 <__addtf3+0x99e>
20004a04:	187d                	add	a6,a6,-1
20004a06:	001ab793          	seqz	a5,s5
20004a0a:	00fe6e33          	or	t3,t3,a5
20004a0e:	be39                	j	2000452c <__addtf3+0xdb6>
20004a10:	d01a                	sw	t1,32(sp)
20004a12:	d27a                	sw	t5,36(sp)
20004a14:	d47e                	sw	t6,40(sp)
20004a16:	d62e                	sw	a1,44(sp)
20004a18:	872e                	mv	a4,a1
20004a1a:	869a                	mv	a3,t1
20004a1c:	101c                	add	a5,sp,32
20004a1e:	a9cff06f          	j	20003cba <__addtf3+0x544>
20004a22:	8646                	mv	a2,a7
20004a24:	4701                	li	a4,0
20004a26:	428d                	li	t0,3
20004a28:	4681                	li	a3,0
20004a2a:	00271793          	sll	a5,a4,0x2
20004a2e:	41f65393          	sra	t2,a2,0x1f
20004a32:	01b3d393          	srl	t2,t2,0x1b
20004a36:	04078793          	add	a5,a5,64
20004a3a:	00760733          	add	a4,a2,t2
20004a3e:	978a                	add	a5,a5,sp
20004a40:	fc07a783          	lw	a5,-64(a5)
20004a44:	8b7d                	and	a4,a4,31
20004a46:	40e383b3          	sub	t2,t2,a4
20004a4a:	02038393          	add	t2,t2,32
20004a4e:	007797b3          	sll	a5,a5,t2
20004a52:	8edd                	or	a3,a3,a5
20004a54:	2c028c63          	beqz	t0,20004d2c <__addtf3+0x15b6>
20004a58:	c4d2                	sw	s4,72(sp)
20004a5a:	00291a13          	sll	s4,s2,0x2
20004a5e:	014e07b3          	add	a5,t3,s4
20004a62:	0ea1                	add	t4,t4,8
20004a64:	41400a33          	neg	s4,s4
20004a68:	4398                	lw	a4,0(a5)
20004a6a:	43d0                	lw	a2,4(a5)
20004a6c:	01478533          	add	a0,a5,s4
20004a70:	01175733          	srl	a4,a4,a7
20004a74:	00761633          	sll	a2,a2,t2
20004a78:	8f51                	or	a4,a4,a2
20004a7a:	c118                	sw	a4,0(a0)
20004a7c:	0791                	add	a5,a5,4
20004a7e:	ffd795e3          	bne	a5,t4,20004a68 <__addtf3+0x12f2>
20004a82:	4632                	lw	a2,12(sp)
20004a84:	00229713          	sll	a4,t0,0x2
20004a88:	04070793          	add	a5,a4,64 # 80040 <_start-0x1ff7ffc0>
20004a8c:	00278733          	add	a4,a5,sp
20004a90:	01165633          	srl	a2,a2,a7
20004a94:	4791                	li	a5,4
20004a96:	4a26                	lw	s4,72(sp)
20004a98:	412787b3          	sub	a5,a5,s2
20004a9c:	fcc72023          	sw	a2,-64(a4)
20004aa0:	bd0ff06f          	j	20003e70 <__addtf3+0x6fa>
20004aa4:	1c078663          	beqz	a5,20004c70 <__addtf3+0x14fa>
20004aa8:	01275293          	srl	t0,a4,0x12
20004aac:	0012c293          	xor	t0,t0,1
20004ab0:	0012f293          	and	t0,t0,1
20004ab4:	0292                	sll	t0,t0,0x4
20004ab6:	ad2814e3          	bne	a6,s2,2000457e <__addtf3+0xe08>
20004aba:	ac0504e3          	beqz	a0,20004582 <__addtf3+0xe0c>
20004abe:	00d59793          	sll	a5,a1,0xd
20004ac2:	0007c363          	bltz	a5,20004ac8 <__addtf3+0x1352>
20004ac6:	42c1                	li	t0,16
20004ac8:	67a1                	lui	a5,0x8
20004aca:	02c10e13          	add	t3,sp,44
20004ace:	d63e                	sw	a5,44(sp)
20004ad0:	d402                	sw	zero,40(sp)
20004ad2:	d202                	sw	zero,36(sp)
20004ad4:	d002                	sw	zero,32(sp)
20004ad6:	101c                	add	a5,sp,32
20004ad8:	8772                	mv	a4,t3
20004ada:	6621                	lui	a2,0x8
20004adc:	00361593          	sll	a1,a2,0x3
20004ae0:	ffc72603          	lw	a2,-4(a4)
20004ae4:	1771                	add	a4,a4,-4
20004ae6:	01d65693          	srl	a3,a2,0x1d
20004aea:	8ecd                	or	a3,a3,a1
20004aec:	c354                	sw	a3,4(a4)
20004aee:	fee797e3          	bne	a5,a4,20004adc <__addtf3+0x1366>
20004af2:	55b2                	lw	a1,44(sp)
20004af4:	00080737          	lui	a4,0x80
20004af8:	8816                	mv	a6,t0
20004afa:	8f6d                	and	a4,a4,a1
20004afc:	bbed                	j	200048f6 <__addtf3+0x1180>
20004afe:	006688b3          	add	a7,a3,t1
20004b02:	9f3a                	add	t5,t5,a4
20004b04:	00d8b633          	sltu	a2,a7,a3
20004b08:	967a                	add	a2,a2,t5
20004b0a:	00ef37b3          	sltu	a5,t5,a4
20004b0e:	01e63f33          	sltu	t5,a2,t5
20004b12:	9f96                	add	t6,t6,t0
20004b14:	01e7e7b3          	or	a5,a5,t5
20004b18:	97fe                	add	a5,a5,t6
20004b1a:	005fb833          	sltu	a6,t6,t0
20004b1e:	01f7bfb3          	sltu	t6,a5,t6
20004b22:	01f86833          	or	a6,a6,t6
20004b26:	952e                	add	a0,a0,a1
20004b28:	86c6                	mv	a3,a7
20004b2a:	8732                	mv	a4,a2
20004b2c:	00a805b3          	add	a1,a6,a0
20004b30:	4905                	li	s2,1
20004b32:	9fcff06f          	j	20003d2e <__addtf3+0x5b8>
20004b36:	01ff67b3          	or	a5,t5,t6
20004b3a:	8fcd                	or	a5,a5,a1
20004b3c:	0067e7b3          	or	a5,a5,t1
20004b40:	1e079b63          	bnez	a5,20004d36 <__addtf3+0x15c0>
20004b44:	16061063          	bnez	a2,20004ca4 <__addtf3+0x152e>
20004b48:	6621                	lui	a2,0x8
20004b4a:	d01a                	sw	t1,32(sp)
20004b4c:	d27a                	sw	t5,36(sp)
20004b4e:	d47e                	sw	t6,40(sp)
20004b50:	872e                	mv	a4,a1
20004b52:	8846                	mv	a6,a7
20004b54:	167d                	add	a2,a2,-1 # 7fff <_start-0x1fff8001>
20004b56:	dbeff06f          	j	20004114 <__addtf3+0x99e>
20004b5a:	17fd                	add	a5,a5,-1 # 7fff <_start-0x1fff8001>
20004b5c:	41f40633          	sub	a2,s0,t6
20004b60:	00163613          	seqz	a2,a2
20004b64:	00c86633          	or	a2,a6,a2
20004b68:	bbe9                	j	20004942 <__addtf3+0x11cc>
20004b6a:	869a                	mv	a3,t1
20004b6c:	872e                	mv	a4,a1
20004b6e:	8446                	mv	s0,a7
20004b70:	101c                	add	a5,sp,32
20004b72:	f78ff06f          	j	200042ea <__addtf3+0xb74>
20004b76:	01ff6733          	or	a4,t5,t6
20004b7a:	8f4d                	or	a4,a4,a1
20004b7c:	00676733          	or	a4,a4,t1
20004b80:	4781                	li	a5,0
20004b82:	c719                	beqz	a4,20004b90 <__addtf3+0x141a>
20004b84:	0125d793          	srl	a5,a1,0x12
20004b88:	0017c793          	xor	a5,a5,1
20004b8c:	8b85                	and	a5,a5,1
20004b8e:	0792                	sll	a5,a5,0x4
20004b90:	8642                	mv	a2,a6
20004b92:	d01a                	sw	t1,32(sp)
20004b94:	d27a                	sw	t5,36(sp)
20004b96:	d47e                	sw	t6,40(sp)
20004b98:	872e                	mv	a4,a1
20004b9a:	883e                	mv	a6,a5
20004b9c:	d78ff06f          	j	20004114 <__addtf3+0x99e>
20004ba0:	00f2e733          	or	a4,t0,a5
20004ba4:	01076733          	or	a4,a4,a6
20004ba8:	8f49                	or	a4,a4,a0
20004baa:	10071663          	bnez	a4,20004cb6 <__addtf3+0x1540>
20004bae:	19f9                	add	s3,s3,-2
20004bb0:	4a96                	lw	s5,68(sp)
20004bb2:	0019b413          	seqz	s0,s3
20004bb6:	cdcff06f          	j	20004092 <__addtf3+0x91c>
20004bba:	fffa8813          	add	a6,s5,-1
20004bbe:	001ab513          	seqz	a0,s5
20004bc2:	00a3e3b3          	or	t2,t2,a0
20004bc6:	88eff06f          	j	20003c54 <__addtf3+0x4de>
20004bca:	4785                	li	a5,1
20004bcc:	feeff06f          	j	200043ba <__addtf3+0xc44>
20004bd0:	14051063          	bnez	a0,20004d10 <__addtf3+0x159a>
20004bd4:	9a0797e3          	bnez	a5,20004582 <__addtf3+0xe0c>
20004bd8:	67a1                	lui	a5,0x8
20004bda:	02c10e13          	add	t3,sp,44
20004bde:	d63e                	sw	a5,44(sp)
20004be0:	d402                	sw	zero,40(sp)
20004be2:	d202                	sw	zero,36(sp)
20004be4:	d002                	sw	zero,32(sp)
20004be6:	101c                	add	a5,sp,32
20004be8:	8772                	mv	a4,t3
20004bea:	6621                	lui	a2,0x8
20004bec:	00361593          	sll	a1,a2,0x3
20004bf0:	ffc72603          	lw	a2,-4(a4) # 7fffc <_start-0x1ff80004>
20004bf4:	1771                	add	a4,a4,-4
20004bf6:	01d65693          	srl	a3,a2,0x1d
20004bfa:	8ecd                	or	a3,a3,a1
20004bfc:	c354                	sw	a3,4(a4)
20004bfe:	fee797e3          	bne	a5,a4,20004bec <__addtf3+0x1476>
20004c02:	55b2                	lw	a1,44(sp)
20004c04:	00080737          	lui	a4,0x80
20004c08:	4841                	li	a6,16
20004c0a:	8f6d                	and	a4,a4,a1
20004c0c:	b1ed                	j	200048f6 <__addtf3+0x1180>
20004c0e:	d63a                	sw	a4,44(sp)
20004c10:	101c                	add	a5,sp,32
20004c12:	8a8ff06f          	j	20003cba <__addtf3+0x544>
20004c16:	ce61                	beqz	a2,20004cee <__addtf3+0x1578>
20004c18:	01275793          	srl	a5,a4,0x12
20004c1c:	0017c793          	xor	a5,a5,1
20004c20:	8b85                	and	a5,a5,1
20004c22:	00479893          	sll	a7,a5,0x4
20004c26:	c92817e3          	bne	a6,s2,200048b4 <__addtf3+0x113e>
20004c2a:	01ff67b3          	or	a5,t5,t6
20004c2e:	8fcd                	or	a5,a5,a1
20004c30:	0067e7b3          	or	a5,a5,t1
20004c34:	cba5                	beqz	a5,20004ca4 <__addtf3+0x152e>
20004c36:	00d59793          	sll	a5,a1,0xd
20004c3a:	c807c4e3          	bltz	a5,200048c2 <__addtf3+0x114c>
20004c3e:	48c1                	li	a7,16
20004c40:	b149                	j	200048c2 <__addtf3+0x114c>
20004c42:	01ff67b3          	or	a5,t5,t6
20004c46:	8fcd                	or	a5,a5,a1
20004c48:	0067e7b3          	or	a5,a5,t1
20004c4c:	4801                	li	a6,0
20004c4e:	cb81                	beqz	a5,20004c5e <__addtf3+0x14e8>
20004c50:	0125d813          	srl	a6,a1,0x12
20004c54:	00184813          	xor	a6,a6,1
20004c58:	00187813          	and	a6,a6,1
20004c5c:	0812                	sll	a6,a6,0x4
20004c5e:	d01a                	sw	t1,32(sp)
20004c60:	d27a                	sw	t5,36(sp)
20004c62:	d47e                	sw	t6,40(sp)
20004c64:	872e                	mv	a4,a1
20004c66:	caeff06f          	j	20004114 <__addtf3+0x99e>
20004c6a:	a0040fe3          	beqz	s0,20004688 <__addtf3+0xf12>
20004c6e:	bebd                	j	200047ec <__addtf3+0x1076>
20004c70:	97281ae3          	bne	a6,s2,200045e4 <__addtf3+0xe6e>
20004c74:	d135                	beqz	a0,20004bd8 <__addtf3+0x1462>
20004c76:	0125d713          	srl	a4,a1,0x12
20004c7a:	00174713          	xor	a4,a4,1
20004c7e:	8b05                	and	a4,a4,1
20004c80:	00471293          	sll	t0,a4,0x4
20004c84:	b295                	j	200045e8 <__addtf3+0xe72>
20004c86:	01ff67b3          	or	a5,t5,t6
20004c8a:	8fcd                	or	a5,a5,a1
20004c8c:	0067e7b3          	or	a5,a5,t1
20004c90:	d60783e3          	beqz	a5,200049f6 <__addtf3+0x1280>
20004c94:	0125d913          	srl	s2,a1,0x12
20004c98:	00194913          	xor	s2,s2,1
20004c9c:	00197913          	and	s2,s2,1
20004ca0:	0912                	sll	s2,s2,0x4
20004ca2:	bb91                	j	200049f6 <__addtf3+0x1280>
20004ca4:	6621                	lui	a2,0x8
20004ca6:	d036                	sw	a3,32(sp)
20004ca8:	d276                	sw	t4,36(sp)
20004caa:	d472                	sw	t3,40(sp)
20004cac:	85ba                	mv	a1,a4
20004cae:	8846                	mv	a6,a7
20004cb0:	167d                	add	a2,a2,-1 # 7fff <_start-0x1fff8001>
20004cb2:	c62ff06f          	j	20004114 <__addtf3+0x99e>
20004cb6:	8f3e                	mv	t5,a5
20004cb8:	4a96                	lw	s5,68(sp)
20004cba:	8696                	mv	a3,t0
20004cbc:	8fc2                	mv	t6,a6
20004cbe:	872a                	mv	a4,a0
20004cc0:	101c                	add	a5,sp,32
20004cc2:	e28ff06f          	j	200042ea <__addtf3+0xb74>
20004cc6:	167d                	add	a2,a2,-1
20004cc8:	001aba93          	seqz	s5,s5
20004ccc:	01556533          	or	a0,a0,s5
20004cd0:	fd3fe06f          	j	20003ca2 <__addtf3+0x52c>
20004cd4:	4a26                	lw	s4,72(sp)
20004cd6:	005552b3          	srl	t0,a0,t0
20004cda:	4785                	li	a5,1
20004cdc:	d4bfe06f          	j	20003a26 <__addtf3+0x2b0>
20004ce0:	02000e13          	li	t3,32
20004ce4:	410e0e33          	sub	t3,t3,a6
20004ce8:	4509                	li	a0,2
20004cea:	c98ff06f          	j	20004182 <__addtf3+0xa0c>
20004cee:	e5281de3          	bne	a6,s2,20004b48 <__addtf3+0x13d2>
20004cf2:	01ff67b3          	or	a5,t5,t6
20004cf6:	8fcd                	or	a5,a5,a1
20004cf8:	0067e7b3          	or	a5,a5,t1
20004cfc:	e40786e3          	beqz	a5,20004b48 <__addtf3+0x13d2>
20004d00:	0125d793          	srl	a5,a1,0x12
20004d04:	0017c793          	xor	a5,a5,1
20004d08:	8b85                	and	a5,a5,1
20004d0a:	00479893          	sll	a7,a5,0x4
20004d0e:	bd2d                	j	20004b48 <__addtf3+0x13d2>
20004d10:	00d59713          	sll	a4,a1,0xd
20004d14:	00074363          	bltz	a4,20004d1a <__addtf3+0x15a4>
20004d18:	42c1                	li	t0,16
20004d1a:	da0797e3          	bnez	a5,20004ac8 <__addtf3+0x1352>
20004d1e:	b0e9                	j	200045e8 <__addtf3+0xe72>
20004d20:	c4d2                	sw	s4,72(sp)
20004d22:	8616                	mv	a2,t0
20004d24:	4701                	li	a4,0
20004d26:	438d                	li	t2,3
20004d28:	4681                	li	a3,0
20004d2a:	bcdd                	j	20004820 <__addtf3+0x10aa>
20004d2c:	011558b3          	srl	a7,a0,a7
20004d30:	4785                	li	a5,1
20004d32:	946ff06f          	j	20003e78 <__addtf3+0x702>
20004d36:	00d59793          	sll	a5,a1,0xd
20004d3a:	0007d563          	bgez	a5,20004d44 <__addtf3+0x15ce>
20004d3e:	b80612e3          	bnez	a2,200048c2 <__addtf3+0x114c>
20004d42:	b519                	j	20004b48 <__addtf3+0x13d2>
20004d44:	ee061de3          	bnez	a2,20004c3e <__addtf3+0x14c8>
20004d48:	48c1                	li	a7,16
20004d4a:	bbfd                	j	20004b48 <__addtf3+0x13d2>
20004d4c:	864a                	mv	a2,s2
20004d4e:	4801                	li	a6,0
20004d50:	ba5fe06f          	j	200038f4 <__addtf3+0x17e>
20004d54:	4901                	li	s2,0
20004d56:	4885                	li	a7,1
20004d58:	4805                	li	a6,1
20004d5a:	02c10e13          	add	t3,sp,44
20004d5e:	b6dfe06f          	j	200038ca <__addtf3+0x154>
20004d62:	883a                	mv	a6,a4
20004d64:	4a96                	lw	s5,68(sp)
20004d66:	873e                	mv	a4,a5
20004d68:	c0aff06f          	j	20004172 <__addtf3+0x9fc>
20004d6c:	4a26                	lw	s4,72(sp)
20004d6e:	4a96                	lw	s5,68(sp)
20004d70:	81eff06f          	j	20003d8e <__addtf3+0x618>

20004d74 <__divtf3>:
20004d74:	7171                	add	sp,sp,-176
20004d76:	d522                	sw	s0,168(sp)
20004d78:	d14a                	sw	s2,160(sp)
20004d7a:	cd52                	sw	s4,152(sp)
20004d7c:	cb56                	sw	s5,148(sp)
20004d7e:	c75e                	sw	s7,140(sp)
20004d80:	c562                	sw	s8,136(sp)
20004d82:	c366                	sw	s9,132(sp)
20004d84:	4180                	lw	s0,0(a1)
20004d86:	41dc                	lw	a5,4(a1)
20004d88:	4594                	lw	a3,8(a1)
20004d8a:	00c5aa83          	lw	s5,12(a1)
20004d8e:	00062c03          	lw	s8,0(a2)
20004d92:	00462b83          	lw	s7,4(a2)
20004d96:	00862c83          	lw	s9,8(a2)
20004d9a:	00c62a03          	lw	s4,12(a2)
20004d9e:	d706                	sw	ra,172(sp)
20004da0:	d326                	sw	s1,164(sp)
20004da2:	cf4e                	sw	s3,156(sp)
20004da4:	c95a                	sw	s6,144(sp)
20004da6:	c16a                	sw	s10,128(sp)
20004da8:	892a                	mv	s2,a0
20004daa:	00202b73          	frrm	s6
20004dae:	6721                	lui	a4,0x8
20004db0:	010a9513          	sll	a0,s5,0x10
20004db4:	010ad493          	srl	s1,s5,0x10
20004db8:	8141                	srl	a0,a0,0x10
20004dba:	177d                	add	a4,a4,-1 # 7fff <_start-0x1fff8001>
20004dbc:	d6d6                	sw	s5,108(sp)
20004dbe:	d0a2                	sw	s0,96(sp)
20004dc0:	d2be                	sw	a5,100(sp)
20004dc2:	d4b6                	sw	a3,104(sp)
20004dc4:	d822                	sw	s0,48(sp)
20004dc6:	da3e                	sw	a5,52(sp)
20004dc8:	dc36                	sw	a3,56(sp)
20004dca:	de2a                	sw	a0,60(sp)
20004dcc:	8cf9                	and	s1,s1,a4
20004dce:	01fada93          	srl	s5,s5,0x1f
20004dd2:	1e048963          	beqz	s1,20004fc4 <__divtf3+0x250>
20004dd6:	0ae48463          	beq	s1,a4,20004e7e <__divtf3+0x10a>
20004dda:	67c1                	lui	a5,0x10
20004ddc:	8d5d                	or	a0,a0,a5
20004dde:	de2a                	sw	a0,60(sp)
20004de0:	1810                	add	a2,sp,48
20004de2:	187c                	add	a5,sp,60
20004de4:	00351693          	sll	a3,a0,0x3
20004de8:	ffc7a503          	lw	a0,-4(a5) # fffc <_start-0x1fff0004>
20004dec:	17f1                	add	a5,a5,-4
20004dee:	01d55713          	srl	a4,a0,0x1d
20004df2:	8f55                	or	a4,a4,a3
20004df4:	c3d8                	sw	a4,4(a5)
20004df6:	fef617e3          	bne	a2,a5,20004de4 <__divtf3+0x70>
20004dfa:	77f1                	lui	a5,0xffffc
20004dfc:	040e                	sll	s0,s0,0x3
20004dfe:	0785                	add	a5,a5,1 # ffffc001 <dummy_file+0xc9fb9bc1>
20004e00:	d822                	sw	s0,48(sp)
20004e02:	94be                	add	s1,s1,a5
20004e04:	4981                	li	s3,0
20004e06:	4d01                	li	s10,0
20004e08:	4401                	li	s0,0
20004e0a:	010a1513          	sll	a0,s4,0x10
20004e0e:	6721                	lui	a4,0x8
20004e10:	010a5793          	srl	a5,s4,0x10
20004e14:	8141                	srl	a0,a0,0x10
20004e16:	177d                	add	a4,a4,-1 # 7fff <_start-0x1fff8001>
20004e18:	d6d2                	sw	s4,108(sp)
20004e1a:	d0e2                	sw	s8,96(sp)
20004e1c:	d2de                	sw	s7,100(sp)
20004e1e:	d4e6                	sw	s9,104(sp)
20004e20:	c0e2                	sw	s8,64(sp)
20004e22:	c2de                	sw	s7,68(sp)
20004e24:	c4e6                	sw	s9,72(sp)
20004e26:	c6aa                	sw	a0,76(sp)
20004e28:	8ff9                	and	a5,a5,a4
20004e2a:	01fa5a13          	srl	s4,s4,0x1f
20004e2e:	cfe5                	beqz	a5,20004f26 <__divtf3+0x1b2>
20004e30:	0ce78963          	beq	a5,a4,20004f02 <__divtf3+0x18e>
20004e34:	6741                	lui	a4,0x10
20004e36:	8d59                	or	a0,a0,a4
20004e38:	c6aa                	sw	a0,76(sp)
20004e3a:	008c                	add	a1,sp,64
20004e3c:	00f8                	add	a4,sp,76
20004e3e:	00351613          	sll	a2,a0,0x3
20004e42:	ffc72503          	lw	a0,-4(a4) # fffc <_start-0x1fff0004>
20004e46:	1771                	add	a4,a4,-4
20004e48:	01d55693          	srl	a3,a0,0x1d
20004e4c:	8ed1                	or	a3,a3,a2
20004e4e:	c354                	sw	a3,4(a4)
20004e50:	fee597e3          	bne	a1,a4,20004e3e <__divtf3+0xca>
20004e54:	7771                	lui	a4,0xffffc
20004e56:	0705                	add	a4,a4,1 # ffffc001 <dummy_file+0xc9fb9bc1>
20004e58:	97ba                	add	a5,a5,a4
20004e5a:	0c0e                	sll	s8,s8,0x3
20004e5c:	c0e2                	sw	s8,64(sp)
20004e5e:	8c9d                	sub	s1,s1,a5
20004e60:	4701                	li	a4,0
20004e62:	47bd                	li	a5,15
20004e64:	014ac5b3          	xor	a1,s5,s4
20004e68:	2537ef63          	bltu	a5,s3,200050c6 <__divtf3+0x352>
20004e6c:	200147b7          	lui	a5,0x20014
20004e70:	a0878793          	add	a5,a5,-1528 # 20013a08 <__mremap+0x15c>
20004e74:	098a                	sll	s3,s3,0x2
20004e76:	99be                	add	s3,s3,a5
20004e78:	0009a783          	lw	a5,0(s3)
20004e7c:	8782                	jr	a5
20004e7e:	8fc1                	or	a5,a5,s0
20004e80:	8fd5                	or	a5,a5,a3
20004e82:	8fc9                	or	a5,a5,a0
20004e84:	20079b63          	bnez	a5,2000509a <__divtf3+0x326>
20004e88:	49a1                	li	s3,8
20004e8a:	4d09                	li	s10,2
20004e8c:	4401                	li	s0,0
20004e8e:	bfb5                	j	20004e0a <__divtf3+0x96>
20004e90:	001a7593          	and	a1,s4,1
20004e94:	4781                	li	a5,0
20004e96:	4701                	li	a4,0
20004e98:	4501                	li	a0,0
20004e9a:	4601                	li	a2,0
20004e9c:	4681                	li	a3,0
20004e9e:	05be                	sll	a1,a1,0xf
20004ea0:	8ddd                	or	a1,a1,a5
20004ea2:	06e11623          	sh	a4,108(sp)
20004ea6:	06b11723          	sh	a1,110(sp)
20004eaa:	57b6                	lw	a5,108(sp)
20004eac:	28041063          	bnez	s0,2000512c <__divtf3+0x3b8>
20004eb0:	50ba                	lw	ra,172(sp)
20004eb2:	542a                	lw	s0,168(sp)
20004eb4:	00a92423          	sw	a0,8(s2)
20004eb8:	00d92023          	sw	a3,0(s2)
20004ebc:	00c92223          	sw	a2,4(s2)
20004ec0:	00f92623          	sw	a5,12(s2)
20004ec4:	549a                	lw	s1,164(sp)
20004ec6:	49fa                	lw	s3,156(sp)
20004ec8:	4a6a                	lw	s4,152(sp)
20004eca:	4ada                	lw	s5,148(sp)
20004ecc:	4b4a                	lw	s6,144(sp)
20004ece:	4bba                	lw	s7,140(sp)
20004ed0:	4c2a                	lw	s8,136(sp)
20004ed2:	4c9a                	lw	s9,132(sp)
20004ed4:	4d0a                	lw	s10,128(sp)
20004ed6:	854a                	mv	a0,s2
20004ed8:	590a                	lw	s2,160(sp)
20004eda:	614d                	add	sp,sp,176
20004edc:	8082                	ret
20004ede:	00846413          	or	s0,s0,8
20004ee2:	67a1                	lui	a5,0x8
20004ee4:	17fd                	add	a5,a5,-1 # 7fff <_start-0x1fff8001>
20004ee6:	4701                	li	a4,0
20004ee8:	4501                	li	a0,0
20004eea:	4601                	li	a2,0
20004eec:	4681                	li	a3,0
20004eee:	bf45                	j	20004e9e <__divtf3+0x12a>
20004ef0:	4441                	li	s0,16
20004ef2:	67a1                	lui	a5,0x8
20004ef4:	4581                	li	a1,0
20004ef6:	17fd                	add	a5,a5,-1 # 7fff <_start-0x1fff8001>
20004ef8:	6721                	lui	a4,0x8
20004efa:	4501                	li	a0,0
20004efc:	4601                	li	a2,0
20004efe:	4681                	li	a3,0
20004f00:	bf79                	j	20004e9e <__divtf3+0x12a>
20004f02:	018bebb3          	or	s7,s7,s8
20004f06:	019bebb3          	or	s7,s7,s9
20004f0a:	00abebb3          	or	s7,s7,a0
20004f0e:	8c9d                	sub	s1,s1,a5
20004f10:	1a0b8763          	beqz	s7,200050be <__divtf3+0x34a>
20004f14:	0542                	sll	a0,a0,0x10
20004f16:	8541                	sra	a0,a0,0x10
20004f18:	0039e993          	or	s3,s3,3
20004f1c:	470d                	li	a4,3
20004f1e:	f40542e3          	bltz	a0,20004e62 <__divtf3+0xee>
20004f22:	4441                	li	s0,16
20004f24:	bf3d                	j	20004e62 <__divtf3+0xee>
20004f26:	018be7b3          	or	a5,s7,s8
20004f2a:	0197e7b3          	or	a5,a5,s9
20004f2e:	8fc9                	or	a5,a5,a0
20004f30:	18078363          	beqz	a5,200050b6 <__divtf3+0x342>
20004f34:	24050663          	beqz	a0,20005180 <__divtf3+0x40c>
20004f38:	026040ef          	jal	20008f5e <__clzsi2>
20004f3c:	ff450893          	add	a7,a0,-12
20004f40:	02000e13          	li	t3,32
20004f44:	411e0e33          	sub	t3,t3,a7
20004f48:	4681                	li	a3,0
20004f4a:	011c1c33          	sll	s8,s8,a7
20004f4e:	40d00333          	neg	t1,a3
20004f52:	030a                	sll	t1,t1,0x2
20004f54:	0090                	add	a2,sp,64
20004f56:	00660733          	add	a4,a2,t1
20004f5a:	480d                	li	a6,3
20004f5c:	40600333          	neg	t1,t1
20004f60:	475c                	lw	a5,12(a4)
20004f62:	470c                	lw	a1,8(a4)
20004f64:	00670eb3          	add	t4,a4,t1
20004f68:	011797b3          	sll	a5,a5,a7
20004f6c:	01c5d5b3          	srl	a1,a1,t3
20004f70:	8fcd                	or	a5,a5,a1
20004f72:	00fea623          	sw	a5,12(t4)
20004f76:	187d                	add	a6,a6,-1
20004f78:	1771                	add	a4,a4,-4 # 7ffc <_start-0x1fff8004>
20004f7a:	ff06c3e3          	blt	a3,a6,20004f60 <__divtf3+0x1ec>
20004f7e:	00269713          	sll	a4,a3,0x2
20004f82:	04070793          	add	a5,a4,64
20004f86:	1818                	add	a4,sp,48
20004f88:	973e                	add	a4,a4,a5
20004f8a:	fd872823          	sw	s8,-48(a4)
20004f8e:	fff68793          	add	a5,a3,-1 # 7ffff <_start-0x1ff80001>
20004f92:	577d                	li	a4,-1
20004f94:	02e78263          	beq	a5,a4,20004fb8 <__divtf3+0x244>
20004f98:	0785                	add	a5,a5,1
20004f9a:	078a                	sll	a5,a5,0x2
20004f9c:	46a1                	li	a3,8
20004f9e:	8732                	mv	a4,a2
20004fa0:	00d7e763          	bltu	a5,a3,20004fae <__divtf3+0x23a>
20004fa4:	c082                	sw	zero,64(sp)
20004fa6:	00062223          	sw	zero,4(a2)
20004faa:	17e1                	add	a5,a5,-8
20004fac:	00b8                	add	a4,sp,72
20004fae:	4691                	li	a3,4
20004fb0:	00d7e463          	bltu	a5,a3,20004fb8 <__divtf3+0x244>
20004fb4:	00072023          	sw	zero,0(a4)
20004fb8:	77f1                	lui	a5,0xffffc
20004fba:	07c5                	add	a5,a5,17 # ffffc011 <dummy_file+0xc9fb9bd1>
20004fbc:	8f89                	sub	a5,a5,a0
20004fbe:	8c9d                	sub	s1,s1,a5
20004fc0:	4701                	li	a4,0
20004fc2:	b545                	j	20004e62 <__divtf3+0xee>
20004fc4:	0087e733          	or	a4,a5,s0
20004fc8:	8f55                	or	a4,a4,a3
20004fca:	8f49                	or	a4,a4,a0
20004fcc:	c365                	beqz	a4,200050ac <__divtf3+0x338>
20004fce:	16050263          	beqz	a0,20005132 <__divtf3+0x3be>
20004fd2:	78d030ef          	jal	20008f5e <__clzsi2>
20004fd6:	ff450893          	add	a7,a0,-12
20004fda:	02000e13          	li	t3,32
20004fde:	411e0e33          	sub	t3,t3,a7
20004fe2:	4681                	li	a3,0
20004fe4:	01141433          	sll	s0,s0,a7
20004fe8:	40d00333          	neg	t1,a3
20004fec:	030a                	sll	t1,t1,0x2
20004fee:	1810                	add	a2,sp,48
20004ff0:	00660733          	add	a4,a2,t1
20004ff4:	480d                	li	a6,3
20004ff6:	40600333          	neg	t1,t1
20004ffa:	475c                	lw	a5,12(a4)
20004ffc:	470c                	lw	a1,8(a4)
20004ffe:	00670eb3          	add	t4,a4,t1
20005002:	011797b3          	sll	a5,a5,a7
20005006:	01c5d5b3          	srl	a1,a1,t3
2000500a:	8fcd                	or	a5,a5,a1
2000500c:	00fea623          	sw	a5,12(t4)
20005010:	187d                	add	a6,a6,-1
20005012:	1771                	add	a4,a4,-4
20005014:	ff06c3e3          	blt	a3,a6,20004ffa <__divtf3+0x286>
20005018:	00269713          	sll	a4,a3,0x2
2000501c:	04070793          	add	a5,a4,64
20005020:	1818                	add	a4,sp,48
20005022:	973e                	add	a4,a4,a5
20005024:	fc872023          	sw	s0,-64(a4)
20005028:	fff68793          	add	a5,a3,-1
2000502c:	577d                	li	a4,-1
2000502e:	02e78263          	beq	a5,a4,20005052 <__divtf3+0x2de>
20005032:	0785                	add	a5,a5,1
20005034:	078a                	sll	a5,a5,0x2
20005036:	46a1                	li	a3,8
20005038:	8732                	mv	a4,a2
2000503a:	00d7e763          	bltu	a5,a3,20005048 <__divtf3+0x2d4>
2000503e:	d802                	sw	zero,48(sp)
20005040:	00062223          	sw	zero,4(a2)
20005044:	17e1                	add	a5,a5,-8
20005046:	1838                	add	a4,sp,56
20005048:	4691                	li	a3,4
2000504a:	00d7e463          	bltu	a5,a3,20005052 <__divtf3+0x2de>
2000504e:	00072023          	sw	zero,0(a4)
20005052:	74f1                	lui	s1,0xffffc
20005054:	04c5                	add	s1,s1,17 # ffffc011 <dummy_file+0xc9fb9bd1>
20005056:	8c89                	sub	s1,s1,a0
20005058:	4981                	li	s3,0
2000505a:	4d01                	li	s10,0
2000505c:	4401                	li	s0,0
2000505e:	b375                	j	20004e0a <__divtf3+0x96>
20005060:	5742                	lw	a4,48(sp)
20005062:	57f2                	lw	a5,60(sp)
20005064:	8a56                	mv	s4,s5
20005066:	c8ba                	sw	a4,80(sp)
20005068:	5752                	lw	a4,52(sp)
2000506a:	caba                	sw	a4,84(sp)
2000506c:	5762                	lw	a4,56(sp)
2000506e:	ccba                	sw	a4,88(sp)
20005070:	cebe                	sw	a5,92(sp)
20005072:	4785                	li	a5,1
20005074:	e0fd0ee3          	beq	s10,a5,20004e90 <__divtf3+0x11c>
20005078:	720d0663          	beqz	s10,200057a4 <__divtf3+0xa30>
2000507c:	4789                	li	a5,2
2000507e:	001a7593          	and	a1,s4,1
20005082:	e6fd18e3          	bne	s10,a5,20004ef2 <__divtf3+0x17e>
20005086:	bdb1                	j	20004ee2 <__divtf3+0x16e>
20005088:	4686                	lw	a3,64(sp)
2000508a:	47b6                	lw	a5,76(sp)
2000508c:	8d3a                	mv	s10,a4
2000508e:	c8b6                	sw	a3,80(sp)
20005090:	4696                	lw	a3,68(sp)
20005092:	cab6                	sw	a3,84(sp)
20005094:	46a6                	lw	a3,72(sp)
20005096:	ccb6                	sw	a3,88(sp)
20005098:	bfe1                	j	20005070 <__divtf3+0x2fc>
2000509a:	0542                	sll	a0,a0,0x10
2000509c:	8541                	sra	a0,a0,0x10
2000509e:	fff54413          	not	s0,a0
200050a2:	807d                	srl	s0,s0,0x1f
200050a4:	0412                	sll	s0,s0,0x4
200050a6:	49b1                	li	s3,12
200050a8:	4d0d                	li	s10,3
200050aa:	b385                	j	20004e0a <__divtf3+0x96>
200050ac:	4991                	li	s3,4
200050ae:	4481                	li	s1,0
200050b0:	4d05                	li	s10,1
200050b2:	4401                	li	s0,0
200050b4:	bb99                	j	20004e0a <__divtf3+0x96>
200050b6:	0019e993          	or	s3,s3,1
200050ba:	4705                	li	a4,1
200050bc:	b35d                	j	20004e62 <__divtf3+0xee>
200050be:	0029e993          	or	s3,s3,2
200050c2:	4709                	li	a4,2
200050c4:	bb79                	j	20004e62 <__divtf3+0xee>
200050c6:	56c2                	lw	a3,48(sp)
200050c8:	57f2                	lw	a5,60(sp)
200050ca:	4836                	lw	a6,76(sp)
200050cc:	deee                	sw	s11,124(sp)
200050ce:	d682                	sw	zero,108(sp)
200050d0:	d482                	sw	zero,104(sp)
200050d2:	d282                	sw	zero,100(sp)
200050d4:	d082                	sw	zero,96(sp)
200050d6:	5652                	lw	a2,52(sp)
200050d8:	4e86                	lw	t4,64(sp)
200050da:	4726                	lw	a4,72(sp)
200050dc:	8536                	mv	a0,a3
200050de:	10f86363          	bltu	a6,a5,200051e4 <__divtf3+0x470>
200050e2:	5f62                	lw	t5,56(sp)
200050e4:	0f078563          	beq	a5,a6,200051ce <__divtf3+0x45a>
200050e8:	14fd                	add	s1,s1,-1
200050ea:	a20d                	j	2000520c <__divtf3+0x498>
200050ec:	4785                	li	a5,1
200050ee:	40d786b3          	sub	a3,a5,a3
200050f2:	07400713          	li	a4,116
200050f6:	74d75e63          	bge	a4,a3,20005852 <__divtf3+0xade>
200050fa:	4756                	lw	a4,84(sp)
200050fc:	46c6                	lw	a3,80(sp)
200050fe:	8ed9                	or	a3,a3,a4
20005100:	4766                	lw	a4,88(sp)
20005102:	8ed9                	or	a3,a3,a4
20005104:	4776                	lw	a4,92(sp)
20005106:	8ed9                	or	a3,a3,a4
20005108:	70069a63          	bnez	a3,2000581c <__divtf3+0xaa8>
2000510c:	00246413          	or	s0,s0,2
20005110:	4801                	li	a6,0
20005112:	4701                	li	a4,0
20005114:	4501                	li	a0,0
20005116:	4601                	li	a2,0
20005118:	01071793          	sll	a5,a4,0x10
2000511c:	83c1                	srl	a5,a5,0x10
2000511e:	0842                	sll	a6,a6,0x10
20005120:	05fe                	sll	a1,a1,0x1f
20005122:	0107e7b3          	or	a5,a5,a6
20005126:	06e11623          	sh	a4,108(sp)
2000512a:	8fcd                	or	a5,a5,a1
2000512c:	00142073          	csrs	fflags,s0
20005130:	b341                	j	20004eb0 <__divtf3+0x13c>
20005132:	6a069763          	bnez	a3,200057e0 <__divtf3+0xa6c>
20005136:	7c078863          	beqz	a5,20005906 <__divtf3+0xb92>
2000513a:	853e                	mv	a0,a5
2000513c:	623030ef          	jal	20008f5e <__clzsi2>
20005140:	04050513          	add	a0,a0,64
20005144:	ff450793          	add	a5,a0,-12
20005148:	01f7f893          	and	a7,a5,31
2000514c:	4057d693          	sra	a3,a5,0x5
20005150:	0c0899e3          	bnez	a7,20005a22 <__divtf3+0xcae>
20005154:	40d00733          	neg	a4,a3
20005158:	070a                	sll	a4,a4,0x2
2000515a:	00c70793          	add	a5,a4,12
2000515e:	1810                	add	a2,sp,48
20005160:	97b2                	add	a5,a5,a2
20005162:	40e00733          	neg	a4,a4
20005166:	0007a883          	lw	a7,0(a5)
2000516a:	00e78833          	add	a6,a5,a4
2000516e:	85be                	mv	a1,a5
20005170:	01182023          	sw	a7,0(a6)
20005174:	17f1                	add	a5,a5,-4
20005176:	feb618e3          	bne	a2,a1,20005166 <__divtf3+0x3f2>
2000517a:	fff68793          	add	a5,a3,-1
2000517e:	b57d                	j	2000502c <__divtf3+0x2b8>
20005180:	640c9a63          	bnez	s9,200057d4 <__divtf3+0xa60>
20005184:	7a0b8963          	beqz	s7,20005936 <__divtf3+0xbc2>
20005188:	855e                	mv	a0,s7
2000518a:	5d5030ef          	jal	20008f5e <__clzsi2>
2000518e:	04050513          	add	a0,a0,64
20005192:	ff450793          	add	a5,a0,-12
20005196:	01f7f893          	and	a7,a5,31
2000519a:	4057d693          	sra	a3,a5,0x5
2000519e:	060896e3          	bnez	a7,20005a0a <__divtf3+0xc96>
200051a2:	40d00733          	neg	a4,a3
200051a6:	070a                	sll	a4,a4,0x2
200051a8:	00c70793          	add	a5,a4,12
200051ac:	0090                	add	a2,sp,64
200051ae:	97b2                	add	a5,a5,a2
200051b0:	40e00733          	neg	a4,a4
200051b4:	0007a883          	lw	a7,0(a5)
200051b8:	00e78833          	add	a6,a5,a4
200051bc:	85be                	mv	a1,a5
200051be:	01182023          	sw	a7,0(a6)
200051c2:	17f1                	add	a5,a5,-4
200051c4:	feb618e3          	bne	a2,a1,200051b4 <__divtf3+0x440>
200051c8:	fff68793          	add	a5,a3,-1
200051cc:	b3d9                	j	20004f92 <__divtf3+0x21e>
200051ce:	01e76b63          	bltu	a4,t5,200051e4 <__divtf3+0x470>
200051d2:	f0ef1be3          	bne	t5,a4,200050e8 <__divtf3+0x374>
200051d6:	4716                	lw	a4,68(sp)
200051d8:	00c76663          	bltu	a4,a2,200051e4 <__divtf3+0x470>
200051dc:	f0c716e3          	bne	a4,a2,200050e8 <__divtf3+0x374>
200051e0:	f1d6e4e3          	bltu	a3,t4,200050e8 <__divtf3+0x374>
200051e4:	06fe                	sll	a3,a3,0x1f
200051e6:	d6b6                	sw	a3,108(sp)
200051e8:	1818                	add	a4,sp,48
200051ea:	03c10893          	add	a7,sp,60
200051ee:	00155613          	srl	a2,a0,0x1
200051f2:	4348                	lw	a0,4(a4)
200051f4:	0711                	add	a4,a4,4
200051f6:	01f51693          	sll	a3,a0,0x1f
200051fa:	8ed1                	or	a3,a3,a2
200051fc:	fed72e23          	sw	a3,-4(a4)
20005200:	fee897e3          	bne	a7,a4,200051ee <__divtf3+0x47a>
20005204:	5652                	lw	a2,52(sp)
20005206:	5f62                	lw	t5,56(sp)
20005208:	56c2                	lw	a3,48(sp)
2000520a:	8385                	srl	a5,a5,0x1
2000520c:	04010313          	add	t1,sp,64
20005210:	00f8                	add	a4,sp,76
20005212:	00c81893          	sll	a7,a6,0xc
20005216:	ffc72803          	lw	a6,-4(a4)
2000521a:	1771                	add	a4,a4,-4
2000521c:	01485513          	srl	a0,a6,0x14
20005220:	01156533          	or	a0,a0,a7
20005224:	c348                	sw	a0,4(a4)
20005226:	fee316e3          	bne	t1,a4,20005212 <__divtf3+0x49e>
2000522a:	4ca6                	lw	s9,72(sp)
2000522c:	6841                	lui	a6,0x10
2000522e:	4396                	lw	t2,68(sp)
20005230:	187d                	add	a6,a6,-1 # ffff <_start-0x1fff0001>
20005232:	0eb2                	sll	t4,t4,0xc
20005234:	4fb6                	lw	t6,76(sp)
20005236:	010cfe33          	and	t3,s9,a6
2000523a:	c672                	sw	t3,12(sp)
2000523c:	010efe33          	and	t3,t4,a6
20005240:	c872                	sw	t3,16(sp)
20005242:	41d38e33          	sub	t3,t2,t4
20005246:	010ff733          	and	a4,t6,a6
2000524a:	ca72                	sw	t3,20(sp)
2000524c:	407c8e33          	sub	t3,s9,t2
20005250:	c43a                	sw	a4,8(sp)
20005252:	0103d513          	srl	a0,t2,0x10
20005256:	010ed713          	srl	a4,t4,0x10
2000525a:	0103f8b3          	and	a7,t2,a6
2000525e:	010cd313          	srl	t1,s9,0x10
20005262:	d05a                	sw	s6,32(sp)
20005264:	d22e                	sw	a1,36(sp)
20005266:	d426                	sw	s1,40(sp)
20005268:	d64a                	sw	s2,44(sp)
2000526a:	cc72                	sw	t3,24(sp)
2000526c:	ce22                	sw	s0,28(sp)
2000526e:	010fdb93          	srl	s7,t6,0x10
20005272:	05010993          	add	s3,sp,80
20005276:	06010d13          	add	s10,sp,96
2000527a:	4c0d                	li	s8,3
2000527c:	8b46                	mv	s6,a7
2000527e:	85ba                	mv	a1,a4
20005280:	84aa                	mv	s1,a0
20005282:	891a                	mv	s2,t1
20005284:	16ff8863          	beq	t6,a5,200053f4 <__divtf3+0x680>
20005288:	0377d733          	divu	a4,a5,s7
2000528c:	010f5893          	srl	a7,t5,0x10
20005290:	0377f533          	remu	a0,a5,s7
20005294:	47a2                	lw	a5,8(sp)
20005296:	02e78333          	mul	t1,a5,a4
2000529a:	0542                	sll	a0,a0,0x10
2000529c:	00a8e7b3          	or	a5,a7,a0
200052a0:	0067fa63          	bgeu	a5,t1,200052b4 <__divtf3+0x540>
200052a4:	97fe                	add	a5,a5,t6
200052a6:	fff70513          	add	a0,a4,-1
200052aa:	01f7e463          	bltu	a5,t6,200052b2 <__divtf3+0x53e>
200052ae:	5467e263          	bltu	a5,t1,200057f2 <__divtf3+0xa7e>
200052b2:	872a                	mv	a4,a0
200052b4:	406787b3          	sub	a5,a5,t1
200052b8:	0377d8b3          	divu	a7,a5,s7
200052bc:	4522                	lw	a0,8(sp)
200052be:	010f7f33          	and	t5,t5,a6
200052c2:	0377f7b3          	remu	a5,a5,s7
200052c6:	03150533          	mul	a0,a0,a7
200052ca:	07c2                	sll	a5,a5,0x10
200052cc:	00ff6f33          	or	t5,t5,a5
200052d0:	00af7a63          	bgeu	t5,a0,200052e4 <__divtf3+0x570>
200052d4:	9f7e                	add	t5,t5,t6
200052d6:	fff88793          	add	a5,a7,-1
200052da:	01ff6463          	bltu	t5,t6,200052e2 <__divtf3+0x56e>
200052de:	50af6763          	bltu	t5,a0,200057ec <__divtf3+0xa78>
200052e2:	88be                	mv	a7,a5
200052e4:	4442                	lw	s0,16(sp)
200052e6:	01071793          	sll	a5,a4,0x10
200052ea:	0117e7b3          	or	a5,a5,a7
200052ee:	0107d293          	srl	t0,a5,0x10
200052f2:	0107f733          	and	a4,a5,a6
200052f6:	02e40333          	mul	t1,s0,a4
200052fa:	40af0533          	sub	a0,t5,a0
200052fe:	00f9a623          	sw	a5,12(s3)
20005302:	02828f33          	mul	t5,t0,s0
20005306:	01035893          	srl	a7,t1,0x10
2000530a:	02e58e33          	mul	t3,a1,a4
2000530e:	9e7a                	add	t3,t3,t5
20005310:	98f2                	add	a7,a7,t3
20005312:	02b28e33          	mul	t3,t0,a1
20005316:	01e8f463          	bgeu	a7,t5,2000531e <__divtf3+0x5aa>
2000531a:	6441                	lui	s0,0x10
2000531c:	9e22                	add	t3,t3,s0
2000531e:	0108f433          	and	s0,a7,a6
20005322:	01037333          	and	t1,t1,a6
20005326:	0442                	sll	s0,s0,0x10
20005328:	941a                	add	s0,s0,t1
2000532a:	0108d893          	srl	a7,a7,0x10
2000532e:	98f2                	add	a7,a7,t3
20005330:	02eb0f33          	mul	t5,s6,a4
20005334:	03628333          	mul	t1,t0,s6
20005338:	010f5e13          	srl	t3,t5,0x10
2000533c:	02e48a33          	mul	s4,s1,a4
20005340:	9a1a                	add	s4,s4,t1
20005342:	9e52                	add	t3,t3,s4
20005344:	02928a33          	mul	s4,t0,s1
20005348:	006e7463          	bgeu	t3,t1,20005350 <__divtf3+0x5dc>
2000534c:	6341                	lui	t1,0x10
2000534e:	9a1a                	add	s4,s4,t1
20005350:	010e7333          	and	t1,t3,a6
20005354:	010f7f33          	and	t5,t5,a6
20005358:	0342                	sll	t1,t1,0x10
2000535a:	4ab2                	lw	s5,12(sp)
2000535c:	937a                	add	t1,t1,t5
2000535e:	9346                	add	t1,t1,a7
20005360:	011338b3          	sltu	a7,t1,a7
20005364:	010e5e13          	srl	t3,t3,0x10
20005368:	02ea8f33          	mul	t5,s5,a4
2000536c:	9e46                	add	t3,t3,a7
2000536e:	9e52                	add	t3,t3,s4
20005370:	035288b3          	mul	a7,t0,s5
20005374:	010f5a13          	srl	s4,t5,0x10
20005378:	02e90733          	mul	a4,s2,a4
2000537c:	9746                	add	a4,a4,a7
2000537e:	9752                	add	a4,a4,s4
20005380:	032282b3          	mul	t0,t0,s2
20005384:	01177463          	bgeu	a4,a7,2000538c <__divtf3+0x618>
20005388:	68c1                	lui	a7,0x10
2000538a:	92c6                	add	t0,t0,a7
2000538c:	010778b3          	and	a7,a4,a6
20005390:	08c2                	sll	a7,a7,0x10
20005392:	010f7f33          	and	t5,t5,a6
20005396:	98fa                	add	a7,a7,t5
20005398:	98f2                	add	a7,a7,t3
2000539a:	8341                	srl	a4,a4,0x10
2000539c:	01c8be33          	sltu	t3,a7,t3
200053a0:	9772                	add	a4,a4,t3
200053a2:	9716                	add	a4,a4,t0
200053a4:	00cd2283          	lw	t0,12(s10)
200053a8:	0ee56f63          	bltu	a0,a4,200054a6 <__divtf3+0x732>
200053ac:	8e32                	mv	t3,a2
200053ae:	8a36                	mv	s4,a3
200053b0:	0ea70963          	beq	a4,a0,200054a2 <__divtf3+0x72e>
200053b4:	408286b3          	sub	a3,t0,s0
200053b8:	406a0633          	sub	a2,s4,t1
200053bc:	00d2bf33          	sltu	t5,t0,a3
200053c0:	00ca37b3          	sltu	a5,s4,a2
200053c4:	41e60633          	sub	a2,a2,t5
200053c8:	00d2f463          	bgeu	t0,a3,200053d0 <__divtf3+0x65c>
200053cc:	166a0563          	beq	s4,t1,20005536 <__divtf3+0x7c2>
200053d0:	411e0f33          	sub	t5,t3,a7
200053d4:	01ee32b3          	sltu	t0,t3,t5
200053d8:	40ff0f33          	sub	t5,t5,a5
200053dc:	16079263          	bnez	a5,20005540 <__divtf3+0x7cc>
200053e0:	8d19                	sub	a0,a0,a4
200053e2:	405507b3          	sub	a5,a0,t0
200053e6:	160c0463          	beqz	s8,2000554e <__divtf3+0x7da>
200053ea:	1c7d                	add	s8,s8,-1
200053ec:	19f1                	add	s3,s3,-4
200053ee:	1d71                	add	s10,s10,-4
200053f0:	e8ff9ce3          	bne	t6,a5,20005288 <__divtf3+0x514>
200053f4:	577d                	li	a4,-1
200053f6:	00e9a623          	sw	a4,12(s3)
200053fa:	4a0c0963          	beqz	s8,200058ac <__divtf3+0xb38>
200053fe:	00cd2503          	lw	a0,12(s10)
20005402:	40de8333          	sub	t1,t4,a3
20005406:	40c388b3          	sub	a7,t2,a2
2000540a:	006eb733          	sltu	a4,t4,t1
2000540e:	00a032b3          	snez	t0,a0
20005412:	843a                	mv	s0,a4
20005414:	0113be33          	sltu	t3,t2,a7
20005418:	c119                	beqz	a0,2000541e <__divtf3+0x6aa>
2000541a:	38de8863          	beq	t4,a3,200057aa <__divtf3+0xa36>
2000541e:	408888b3          	sub	a7,a7,s0
20005422:	38071563          	bnez	a4,200057ac <__divtf3+0xa38>
20005426:	8732                	mv	a4,a2
20005428:	4652                	lw	a2,20(sp)
2000542a:	4462                	lw	s0,24(sp)
2000542c:	9576                	add	a0,a0,t4
2000542e:	96b2                	add	a3,a3,a2
20005430:	9696                	add	a3,a3,t0
20005432:	00aeb633          	sltu	a2,t4,a0
20005436:	9722                	add	a4,a4,s0
20005438:	00d3ba33          	sltu	s4,t2,a3
2000543c:	40c68633          	sub	a2,a3,a2
20005440:	00ecb433          	sltu	s0,s9,a4
20005444:	00aef663          	bgeu	t4,a0,20005450 <__divtf3+0x6dc>
20005448:	40530333          	sub	t1,t1,t0
2000544c:	36730d63          	beq	t1,t2,200057c6 <__divtf3+0xa52>
20005450:	41470733          	sub	a4,a4,s4
20005454:	36d3ea63          	bltu	t2,a3,200057c8 <__divtf3+0xa54>
20005458:	86a2                	mv	a3,s0
2000545a:	419788b3          	sub	a7,a5,s9
2000545e:	98fa                	add	a7,a7,t5
20005460:	98f2                	add	a7,a7,t3
20005462:	40d888b3          	sub	a7,a7,a3
20005466:	3517fc63          	bgeu	a5,a7,200057be <__divtf3+0xa4a>
2000546a:	9576                	add	a0,a0,t4
2000546c:	007606b3          	add	a3,a2,t2
20005470:	01d53333          	sltu	t1,a0,t4
20005474:	9336                	add	t1,t1,a3
20005476:	00c6bf33          	sltu	t5,a3,a2
2000547a:	00d336b3          	sltu	a3,t1,a3
2000547e:	9766                	add	a4,a4,s9
20005480:	00df6f33          	or	t5,t5,a3
20005484:	9f3a                	add	t5,t5,a4
20005486:	019736b3          	sltu	a3,a4,s9
2000548a:	00ef3733          	sltu	a4,t5,a4
2000548e:	8f55                	or	a4,a4,a3
20005490:	98be                	add	a7,a7,a5
20005492:	57f9                	li	a5,-2
20005494:	00f9a623          	sw	a5,12(s3)
20005498:	86aa                	mv	a3,a0
2000549a:	861a                	mv	a2,t1
2000549c:	011707b3          	add	a5,a4,a7
200054a0:	b7a9                	j	200053ea <__divtf3+0x676>
200054a2:	35167b63          	bgeu	a2,a7,200057f8 <__divtf3+0xa84>
200054a6:	005e8db3          	add	s11,t4,t0
200054aa:	969e                	add	a3,a3,t2
200054ac:	01ddbab3          	sltu	s5,s11,t4
200054b0:	9ab6                	add	s5,s5,a3
200054b2:	0076bf33          	sltu	t5,a3,t2
200054b6:	00dab6b3          	sltu	a3,s5,a3
200054ba:	01960e33          	add	t3,a2,s9
200054be:	00df6f33          	or	t5,t5,a3
200054c2:	9f72                	add	t5,t5,t3
200054c4:	00ce3633          	sltu	a2,t3,a2
200054c8:	01cf3e33          	sltu	t3,t5,t3
200054cc:	01c66e33          	or	t3,a2,t3
200054d0:	fff78693          	add	a3,a5,-1
200054d4:	9e7e                	add	t3,t3,t6
200054d6:	00d9a623          	sw	a3,12(s3)
200054da:	9572                	add	a0,a0,t3
200054dc:	01ddb6b3          	sltu	a3,s11,t4
200054e0:	82ee                	mv	t0,s11
200054e2:	8a56                	mv	s4,s5
200054e4:	8e7a                	mv	t3,t5
200054e6:	00afee63          	bltu	t6,a0,20005502 <__divtf3+0x78e>
200054ea:	ecaf95e3          	bne	t6,a0,200053b4 <__divtf3+0x640>
200054ee:	01ecea63          	bltu	s9,t5,20005502 <__divtf3+0x78e>
200054f2:	edec91e3          	bne	s9,t5,200053b4 <__divtf3+0x640>
200054f6:	0153e663          	bltu	t2,s5,20005502 <__divtf3+0x78e>
200054fa:	eb539de3          	bne	t2,s5,200053b4 <__divtf3+0x640>
200054fe:	ea069be3          	bnez	a3,200053b4 <__divtf3+0x640>
20005502:	26e56763          	bltu	a0,a4,20005770 <__divtf3+0x9fc>
20005506:	eaa717e3          	bne	a4,a0,200053b4 <__divtf3+0x640>
2000550a:	271f6363          	bltu	t5,a7,20005770 <__divtf3+0x9fc>
2000550e:	eb1f13e3          	bne	t5,a7,200053b4 <__divtf3+0x640>
20005512:	246aef63          	bltu	s5,t1,20005770 <__divtf3+0x9fc>
20005516:	86d6                	mv	a3,s5
20005518:	2e6a9663          	bne	s5,t1,20005804 <__divtf3+0xa90>
2000551c:	248dea63          	bltu	s11,s0,20005770 <__divtf3+0x9fc>
20005520:	408286b3          	sub	a3,t0,s0
20005524:	406a07b3          	sub	a5,s4,t1
20005528:	00d2b633          	sltu	a2,t0,a3
2000552c:	40c78633          	sub	a2,a5,a2
20005530:	00fa37b3          	sltu	a5,s4,a5
20005534:	bd71                	j	200053d0 <__divtf3+0x65c>
20005536:	411e0f33          	sub	t5,t3,a7
2000553a:	01ee32b3          	sltu	t0,t3,t5
2000553e:	1f7d                	add	t5,t5,-1
20005540:	41c88e33          	sub	t3,a7,t3
20005544:	001e3e13          	seqz	t3,t3
20005548:	01c2e2b3          	or	t0,t0,t3
2000554c:	bd51                	j	200053e0 <__divtf3+0x66c>
2000554e:	8522                	mv	a0,s0
20005550:	5b02                	lw	s6,32(sp)
20005552:	4472                	lw	s0,28(sp)
20005554:	5592                	lw	a1,36(sp)
20005556:	54a2                	lw	s1,40(sp)
20005558:	5932                	lw	s2,44(sp)
2000555a:	34d50f63          	beq	a0,a3,200058b8 <__divtf3+0xb44>
2000555e:	47c6                	lw	a5,80(sp)
20005560:	0017e793          	or	a5,a5,1
20005564:	c8be                	sw	a5,80(sp)
20005566:	5df6                	lw	s11,124(sp)
20005568:	8a2e                	mv	s4,a1
2000556a:	6691                	lui	a3,0x4
2000556c:	16fd                	add	a3,a3,-1 # 3fff <_start-0x1fffc001>
2000556e:	96a6                	add	a3,a3,s1
20005570:	0ad05163          	blez	a3,20005612 <__divtf3+0x89e>
20005574:	47c6                	lw	a5,80(sp)
20005576:	4776                	lw	a4,92(sp)
20005578:	0077f613          	and	a2,a5,7
2000557c:	c221                	beqz	a2,200055bc <__divtf3+0x848>
2000557e:	4509                	li	a0,2
20005580:	4656                	lw	a2,84(sp)
20005582:	00146413          	or	s0,s0,1
20005586:	3eab0d63          	beq	s6,a0,20005980 <__divtf3+0xc0c>
2000558a:	450d                	li	a0,3
2000558c:	2aab0c63          	beq	s6,a0,20005844 <__divtf3+0xad0>
20005590:	020b1663          	bnez	s6,200055bc <__divtf3+0x848>
20005594:	00f7f513          	and	a0,a5,15
20005598:	4811                	li	a6,4
2000559a:	03050163          	beq	a0,a6,200055bc <__divtf3+0x848>
2000559e:	4866                	lw	a6,88(sp)
200055a0:	0791                	add	a5,a5,4
200055a2:	0047b513          	sltiu	a0,a5,4
200055a6:	962a                	add	a2,a2,a0
200055a8:	00a63533          	sltu	a0,a2,a0
200055ac:	9542                	add	a0,a0,a6
200055ae:	01053833          	sltu	a6,a0,a6
200055b2:	9742                	add	a4,a4,a6
200055b4:	c8be                	sw	a5,80(sp)
200055b6:	cab2                	sw	a2,84(sp)
200055b8:	ccaa                	sw	a0,88(sp)
200055ba:	ceba                	sw	a4,92(sp)
200055bc:	00b71793          	sll	a5,a4,0xb
200055c0:	0007d963          	bgez	a5,200055d2 <__divtf3+0x85e>
200055c4:	fff007b7          	lui	a5,0xfff00
200055c8:	17fd                	add	a5,a5,-1 # ffefffff <dummy_file+0xc9ebdbbf>
200055ca:	8f7d                	and	a4,a4,a5
200055cc:	6691                	lui	a3,0x4
200055ce:	ceba                	sw	a4,92(sp)
200055d0:	96a6                	add	a3,a3,s1
200055d2:	4546                	lw	a0,80(sp)
200055d4:	089c                	add	a5,sp,80
200055d6:	05c10893          	add	a7,sp,92
200055da:	00355813          	srl	a6,a0,0x3
200055de:	43c8                	lw	a0,4(a5)
200055e0:	0791                	add	a5,a5,4
200055e2:	01d51613          	sll	a2,a0,0x1d
200055e6:	01066633          	or	a2,a2,a6
200055ea:	fec7ae23          	sw	a2,-4(a5)
200055ee:	ff1796e3          	bne	a5,a7,200055da <__divtf3+0x866>
200055f2:	6621                	lui	a2,0x8
200055f4:	1679                	add	a2,a2,-2 # 7ffe <_start-0x1fff8002>
200055f6:	67a1                	lui	a5,0x8
200055f8:	14d64b63          	blt	a2,a3,2000574e <__divtf3+0x9da>
200055fc:	17fd                	add	a5,a5,-1 # 7fff <_start-0x1fff8001>
200055fe:	8ff5                	and	a5,a5,a3
20005600:	830d                	srl	a4,a4,0x3
20005602:	0742                	sll	a4,a4,0x10
20005604:	07c2                	sll	a5,a5,0x10
20005606:	46c6                	lw	a3,80(sp)
20005608:	4656                	lw	a2,84(sp)
2000560a:	4566                	lw	a0,88(sp)
2000560c:	8341                	srl	a4,a4,0x10
2000560e:	83c1                	srl	a5,a5,0x10
20005610:	b079                	j	20004e9e <__divtf3+0x12a>
20005612:	ac069de3          	bnez	a3,200050ec <__divtf3+0x378>
20005616:	47c6                	lw	a5,80(sp)
20005618:	48f6                	lw	a7,92(sp)
2000561a:	0077f613          	and	a2,a5,7
2000561e:	8746                	mv	a4,a7
20005620:	ce15                	beqz	a2,2000565c <__divtf3+0x8e8>
20005622:	4509                	li	a0,2
20005624:	4656                	lw	a2,84(sp)
20005626:	4866                	lw	a6,88(sp)
20005628:	00146413          	or	s0,s0,1
2000562c:	3aab0d63          	beq	s6,a0,200059e6 <__divtf3+0xc72>
20005630:	450d                	li	a0,3
20005632:	3aab0363          	beq	s6,a0,200059d8 <__divtf3+0xc64>
20005636:	020b1363          	bnez	s6,2000565c <__divtf3+0x8e8>
2000563a:	00f7f513          	and	a0,a5,15
2000563e:	4311                	li	t1,4
20005640:	00650e63          	beq	a0,t1,2000565c <__divtf3+0x8e8>
20005644:	00478713          	add	a4,a5,4
20005648:	00473713          	sltiu	a4,a4,4
2000564c:	963a                	add	a2,a2,a4
2000564e:	00e63633          	sltu	a2,a2,a4
20005652:	00c80733          	add	a4,a6,a2
20005656:	00c73733          	sltu	a4,a4,a2
2000565a:	9746                	add	a4,a4,a7
2000565c:	01475813          	srl	a6,a4,0x14
20005660:	00184813          	xor	a6,a6,1
20005664:	00187813          	and	a6,a6,1
20005668:	07fe                	sll	a5,a5,0x1f
2000566a:	0018d893          	srl	a7,a7,0x1
2000566e:	4e0d                	li	t3,3
20005670:	4efd                	li	t4,31
20005672:	4505                	li	a0,1
20005674:	0890                	add	a2,sp,80
20005676:	068a                	sll	a3,a3,0x2
20005678:	002e1f93          	sll	t6,t3,0x2
2000567c:	96b2                	add	a3,a3,a2
2000567e:	8332                	mv	t1,a2
20005680:	01f60f33          	add	t5,a2,t6
20005684:	4298                	lw	a4,0(a3)
20005686:	0046a283          	lw	t0,4(a3) # 4004 <_start-0x1fffbffc>
2000568a:	0311                	add	t1,t1,4 # 10004 <_start-0x1ffefffc>
2000568c:	00a75733          	srl	a4,a4,a0
20005690:	01d292b3          	sll	t0,t0,t4
20005694:	00576733          	or	a4,a4,t0
20005698:	fee32e23          	sw	a4,-4(t1)
2000569c:	0691                	add	a3,a3,4
2000569e:	fe6f13e3          	bne	t5,t1,20005684 <__divtf3+0x910>
200056a2:	040f8713          	add	a4,t6,64
200056a6:	1814                	add	a3,sp,48
200056a8:	00d70fb3          	add	t6,a4,a3
200056ac:	ff1fa023          	sw	a7,-32(t6)
200056b0:	001e0713          	add	a4,t3,1
200056b4:	4691                	li	a3,4
200056b6:	48c6                	lw	a7,80(sp)
200056b8:	02d70563          	beq	a4,a3,200056e2 <__divtf3+0x96e>
200056bc:	4691                	li	a3,4
200056be:	8e99                	sub	a3,a3,a4
200056c0:	068a                	sll	a3,a3,0x2
200056c2:	070a                	sll	a4,a4,0x2
200056c4:	4521                	li	a0,8
200056c6:	9732                	add	a4,a4,a2
200056c8:	00a6e863          	bltu	a3,a0,200056d8 <__divtf3+0x964>
200056cc:	00072023          	sw	zero,0(a4)
200056d0:	00072223          	sw	zero,4(a4)
200056d4:	16e1                	add	a3,a3,-8
200056d6:	0721                	add	a4,a4,8
200056d8:	4511                	li	a0,4
200056da:	00a6e463          	bltu	a3,a0,200056e2 <__divtf3+0x96e>
200056de:	00072023          	sw	zero,0(a4)
200056e2:	00f037b3          	snez	a5,a5
200056e6:	0117e7b3          	or	a5,a5,a7
200056ea:	c8be                	sw	a5,80(sp)
200056ec:	0077f693          	and	a3,a5,7
200056f0:	4776                	lw	a4,92(sp)
200056f2:	c2a1                	beqz	a3,20005732 <__divtf3+0x9be>
200056f4:	4689                	li	a3,2
200056f6:	00146413          	or	s0,s0,1
200056fa:	2adb0a63          	beq	s6,a3,200059ae <__divtf3+0xc3a>
200056fe:	468d                	li	a3,3
20005700:	28db0f63          	beq	s6,a3,2000599e <__divtf3+0xc2a>
20005704:	020b1763          	bnez	s6,20005732 <__divtf3+0x9be>
20005708:	00f7f693          	and	a3,a5,15
2000570c:	4511                	li	a0,4
2000570e:	02a68263          	beq	a3,a0,20005732 <__divtf3+0x9be>
20005712:	46d6                	lw	a3,84(sp)
20005714:	48e6                	lw	a7,88(sp)
20005716:	0791                	add	a5,a5,4
20005718:	0047b513          	sltiu	a0,a5,4
2000571c:	9536                	add	a0,a0,a3
2000571e:	00d536b3          	sltu	a3,a0,a3
20005722:	96c6                	add	a3,a3,a7
20005724:	0116b8b3          	sltu	a7,a3,a7
20005728:	9746                	add	a4,a4,a7
2000572a:	c8be                	sw	a5,80(sp)
2000572c:	caaa                	sw	a0,84(sp)
2000572e:	ccb6                	sw	a3,88(sp)
20005730:	ceba                	sw	a4,92(sp)
20005732:	00c71793          	sll	a5,a4,0xc
20005736:	1807d863          	bgez	a5,200058c6 <__divtf3+0xb52>
2000573a:	00146413          	or	s0,s0,1
2000573e:	24081763          	bnez	a6,2000598c <__divtf3+0xc18>
20005742:	4805                	li	a6,1
20005744:	4701                	li	a4,0
20005746:	4501                	li	a0,0
20005748:	4601                	li	a2,0
2000574a:	4681                	li	a3,0
2000574c:	b2f1                	j	20005118 <__divtf3+0x3a4>
2000574e:	4709                	li	a4,2
20005750:	22eb0563          	beq	s6,a4,2000597a <__divtf3+0xc06>
20005754:	470d                	li	a4,3
20005756:	0eeb0063          	beq	s6,a4,20005836 <__divtf3+0xac2>
2000575a:	0e0b0063          	beqz	s6,2000583a <__divtf3+0xac6>
2000575e:	6741                	lui	a4,0x10
20005760:	8832                	mv	a6,a2
20005762:	177d                	add	a4,a4,-1 # ffff <_start-0x1fff0001>
20005764:	56fd                	li	a3,-1
20005766:	00546413          	or	s0,s0,5
2000576a:	8536                	mv	a0,a3
2000576c:	8636                	mv	a2,a3
2000576e:	b26d                	j	20005118 <__divtf3+0x3a4>
20005770:	01be82b3          	add	t0,t4,s11
20005774:	9a9e                	add	s5,s5,t2
20005776:	01d2ba33          	sltu	s4,t0,t4
2000577a:	9a56                	add	s4,s4,s5
2000577c:	007abe33          	sltu	t3,s5,t2
20005780:	015a3ab3          	sltu	s5,s4,s5
20005784:	9f66                	add	t5,t5,s9
20005786:	015e6e33          	or	t3,t3,s5
2000578a:	9e7a                	add	t3,t3,t5
2000578c:	019f3633          	sltu	a2,t5,s9
20005790:	01ee3f33          	sltu	t5,t3,t5
20005794:	01e666b3          	or	a3,a2,t5
20005798:	17f9                	add	a5,a5,-2
2000579a:	96fe                	add	a3,a3,t6
2000579c:	00f9a623          	sw	a5,12(s3)
200057a0:	9536                	add	a0,a0,a3
200057a2:	b909                	j	200053b4 <__divtf3+0x640>
200057a4:	001a7593          	and	a1,s4,1
200057a8:	b3c9                	j	2000556a <__divtf3+0x7f6>
200057aa:	18fd                	add	a7,a7,-1 # ffff <_start-0x1fff0001>
200057ac:	40760433          	sub	s0,a2,t2
200057b0:	00143413          	seqz	s0,s0
200057b4:	00160713          	add	a4,a2,1
200057b8:	008e6e33          	or	t3,t3,s0
200057bc:	b1b5                	j	20005428 <__divtf3+0x6b4>
200057be:	8f3a                	mv	t5,a4
200057c0:	86aa                	mv	a3,a0
200057c2:	87c6                	mv	a5,a7
200057c4:	b11d                	j	200053ea <__divtf3+0x676>
200057c6:	177d                	add	a4,a4,-1
200057c8:	411c86b3          	sub	a3,s9,a7
200057cc:	0016b693          	seqz	a3,a3
200057d0:	8ec1                	or	a3,a3,s0
200057d2:	b161                	j	2000545a <__divtf3+0x6e6>
200057d4:	8566                	mv	a0,s9
200057d6:	788030ef          	jal	20008f5e <__clzsi2>
200057da:	02050513          	add	a0,a0,32
200057de:	ba55                	j	20005192 <__divtf3+0x41e>
200057e0:	8536                	mv	a0,a3
200057e2:	77c030ef          	jal	20008f5e <__clzsi2>
200057e6:	02050513          	add	a0,a0,32
200057ea:	baa9                	j	20005144 <__divtf3+0x3d0>
200057ec:	18f9                	add	a7,a7,-2
200057ee:	9f7e                	add	t5,t5,t6
200057f0:	bcd5                	j	200052e4 <__divtf3+0x570>
200057f2:	1779                	add	a4,a4,-2
200057f4:	97fe                	add	a5,a5,t6
200057f6:	bc7d                	j	200052b4 <__divtf3+0x540>
200057f8:	bb161ee3          	bne	a2,a7,200053b4 <__divtf3+0x640>
200057fc:	ca66e5e3          	bltu	a3,t1,200054a6 <__divtf3+0x732>
20005800:	20668263          	beq	a3,t1,20005a04 <__divtf3+0xc90>
20005804:	40828f33          	sub	t5,t0,s0
20005808:	40668633          	sub	a2,a3,t1
2000580c:	01e2b2b3          	sltu	t0,t0,t5
20005810:	00c6b7b3          	sltu	a5,a3,a2
20005814:	40560633          	sub	a2,a2,t0
20005818:	86fa                	mv	a3,t5
2000581a:	be5d                	j	200053d0 <__divtf3+0x65c>
2000581c:	4709                	li	a4,2
2000581e:	00146413          	or	s0,s0,1
20005822:	86d2                	mv	a3,s4
20005824:	8eeb04e3          	beq	s6,a4,2000510c <__divtf3+0x398>
20005828:	470d                	li	a4,3
2000582a:	4681                	li	a3,0
2000582c:	8eeb10e3          	bne	s6,a4,2000510c <__divtf3+0x398>
20005830:	414786b3          	sub	a3,a5,s4
20005834:	b8e1                	j	2000510c <__divtf3+0x398>
20005836:	f20a14e3          	bnez	s4,2000575e <__divtf3+0x9ea>
2000583a:	fff78813          	add	a6,a5,-1
2000583e:	4701                	li	a4,0
20005840:	4681                	li	a3,0
20005842:	b715                	j	20005766 <__divtf3+0x9f2>
20005844:	d60a1ce3          	bnez	s4,200055bc <__divtf3+0x848>
20005848:	07a1                	add	a5,a5,8
2000584a:	4866                	lw	a6,88(sp)
2000584c:	0087b513          	sltiu	a0,a5,8
20005850:	bb99                	j	200055a6 <__divtf3+0x832>
20005852:	01f6f513          	and	a0,a3,31
20005856:	02000e93          	li	t4,32
2000585a:	8695                	sra	a3,a3,0x5
2000585c:	40ae8eb3          	sub	t4,t4,a0
20005860:	1a068d63          	beqz	a3,20005a1a <__divtf3+0xca6>
20005864:	0890                	add	a2,sp,80
20005866:	00269893          	sll	a7,a3,0x2
2000586a:	8732                	mv	a4,a2
2000586c:	98b2                	add	a7,a7,a2
2000586e:	4781                	li	a5,0
20005870:	00072803          	lw	a6,0(a4)
20005874:	0711                	add	a4,a4,4
20005876:	0107e7b3          	or	a5,a5,a6
2000587a:	fee89be3          	bne	a7,a4,20005870 <__divtf3+0xafc>
2000587e:	8736                	mv	a4,a3
20005880:	4e0d                	li	t3,3
20005882:	40de0e33          	sub	t3,t3,a3
20005886:	12051763          	bnez	a0,200059b4 <__divtf3+0xc40>
2000588a:	8732                	mv	a4,a2
2000588c:	00269893          	sll	a7,a3,0x2
20005890:	01170833          	add	a6,a4,a7
20005894:	00082803          	lw	a6,0(a6)
20005898:	0505                	add	a0,a0,1
2000589a:	0711                	add	a4,a4,4
2000589c:	ff072e23          	sw	a6,-4(a4)
200058a0:	feae58e3          	bge	t3,a0,20005890 <__divtf3+0xb1c>
200058a4:	4711                	li	a4,4
200058a6:	8f15                	sub	a4,a4,a3
200058a8:	4805                	li	a6,1
200058aa:	b529                	j	200056b4 <__divtf3+0x940>
200058ac:	4472                	lw	s0,28(sp)
200058ae:	5b02                	lw	s6,32(sp)
200058b0:	5592                	lw	a1,36(sp)
200058b2:	54a2                	lw	s1,40(sp)
200058b4:	5932                	lw	s2,44(sp)
200058b6:	b945                	j	20005566 <__divtf3+0x7f2>
200058b8:	cac313e3          	bne	t1,a2,2000555e <__divtf3+0x7ea>
200058bc:	cbe891e3          	bne	a7,t5,2000555e <__divtf3+0x7ea>
200058c0:	c8f71fe3          	bne	a4,a5,2000555e <__divtf3+0x7ea>
200058c4:	b14d                	j	20005566 <__divtf3+0x7f2>
200058c6:	4546                	lw	a0,80(sp)
200058c8:	87b2                	mv	a5,a2
200058ca:	05c10893          	add	a7,sp,92
200058ce:	00355613          	srl	a2,a0,0x3
200058d2:	43c8                	lw	a0,4(a5)
200058d4:	0791                	add	a5,a5,4
200058d6:	01d51693          	sll	a3,a0,0x1d
200058da:	8ed1                	or	a3,a3,a2
200058dc:	fed7ae23          	sw	a3,-4(a5)
200058e0:	ff1797e3          	bne	a5,a7,200058ce <__divtf3+0xb5a>
200058e4:	830d                	srl	a4,a4,0x3
200058e6:	0742                	sll	a4,a4,0x10
200058e8:	46c6                	lw	a3,80(sp)
200058ea:	4656                	lw	a2,84(sp)
200058ec:	4566                	lw	a0,88(sp)
200058ee:	8341                	srl	a4,a4,0x10
200058f0:	08080b63          	beqz	a6,20005986 <__divtf3+0xc12>
200058f4:	00147813          	and	a6,s0,1
200058f8:	4781                	li	a5,0
200058fa:	da080263          	beqz	a6,20004e9e <__divtf3+0x12a>
200058fe:	4801                	li	a6,0
20005900:	00246413          	or	s0,s0,2
20005904:	b811                	j	20005118 <__divtf3+0x3a4>
20005906:	8522                	mv	a0,s0
20005908:	656030ef          	jal	20008f5e <__clzsi2>
2000590c:	05450793          	add	a5,a0,84
20005910:	01f7f893          	and	a7,a5,31
20005914:	06050513          	add	a0,a0,96
20005918:	4057d693          	sra	a3,a5,0x5
2000591c:	82088ce3          	beqz	a7,20005154 <__divtf3+0x3e0>
20005920:	4789                	li	a5,2
20005922:	01141433          	sll	s0,s0,a7
20005926:	04f69063          	bne	a3,a5,20005966 <__divtf3+0xbf2>
2000592a:	02000e13          	li	t3,32
2000592e:	411e0e33          	sub	t3,t3,a7
20005932:	eb6ff06f          	j	20004fe8 <__divtf3+0x274>
20005936:	8562                	mv	a0,s8
20005938:	626030ef          	jal	20008f5e <__clzsi2>
2000593c:	05450793          	add	a5,a0,84
20005940:	01f7f893          	and	a7,a5,31
20005944:	06050513          	add	a0,a0,96
20005948:	4057d693          	sra	a3,a5,0x5
2000594c:	84088be3          	beqz	a7,200051a2 <__divtf3+0x42e>
20005950:	4789                	li	a5,2
20005952:	011c1c33          	sll	s8,s8,a7
20005956:	00f69d63          	bne	a3,a5,20005970 <__divtf3+0xbfc>
2000595a:	02000e13          	li	t3,32
2000595e:	411e0e33          	sub	t3,t3,a7
20005962:	decff06f          	j	20004f4e <__divtf3+0x1da>
20005966:	de22                	sw	s0,60(sp)
20005968:	4789                	li	a5,2
2000596a:	1810                	add	a2,sp,48
2000596c:	ec6ff06f          	j	20005032 <__divtf3+0x2be>
20005970:	c6e2                	sw	s8,76(sp)
20005972:	4789                	li	a5,2
20005974:	0090                	add	a2,sp,64
20005976:	e22ff06f          	j	20004f98 <__divtf3+0x224>
2000597a:	ec0a10e3          	bnez	s4,2000583a <__divtf3+0xac6>
2000597e:	b3c5                	j	2000575e <__divtf3+0x9ea>
20005980:	c20a0ee3          	beqz	s4,200055bc <__divtf3+0x848>
20005984:	b5d1                	j	20005848 <__divtf3+0xad4>
20005986:	4781                	li	a5,0
20005988:	d16ff06f          	j	20004e9e <__divtf3+0x12a>
2000598c:	4805                	li	a6,1
2000598e:	4701                	li	a4,0
20005990:	4501                	li	a0,0
20005992:	4601                	li	a2,0
20005994:	4681                	li	a3,0
20005996:	00246413          	or	s0,s0,2
2000599a:	f7eff06f          	j	20005118 <__divtf3+0x3a4>
2000599e:	d80a1ae3          	bnez	s4,20005732 <__divtf3+0x9be>
200059a2:	07a1                	add	a5,a5,8
200059a4:	46d6                	lw	a3,84(sp)
200059a6:	48e6                	lw	a7,88(sp)
200059a8:	0087b513          	sltiu	a0,a5,8
200059ac:	bb85                	j	2000571c <__divtf3+0x9a8>
200059ae:	d80a02e3          	beqz	s4,20005732 <__divtf3+0x9be>
200059b2:	bfc5                	j	200059a2 <__divtf3+0xc2e>
200059b4:	070a                	sll	a4,a4,0x2
200059b6:	04070713          	add	a4,a4,64
200059ba:	1804                	add	s1,sp,48
200059bc:	9726                	add	a4,a4,s1
200059be:	fe072703          	lw	a4,-32(a4)
200059c2:	48f6                	lw	a7,92(sp)
200059c4:	4805                	li	a6,1
200059c6:	01d71733          	sll	a4,a4,t4
200059ca:	8fd9                	or	a5,a5,a4
200059cc:	00a8d8b3          	srl	a7,a7,a0
200059d0:	4705                	li	a4,1
200059d2:	ce0e05e3          	beqz	t3,200056bc <__divtf3+0x948>
200059d6:	b145                	j	20005676 <__divtf3+0x902>
200059d8:	c80a12e3          	bnez	s4,2000565c <__divtf3+0x8e8>
200059dc:	00878713          	add	a4,a5,8
200059e0:	00873713          	sltiu	a4,a4,8
200059e4:	b1a5                	j	2000564c <__divtf3+0x8d8>
200059e6:	c60a0be3          	beqz	s4,2000565c <__divtf3+0x8e8>
200059ea:	00878513          	add	a0,a5,8
200059ee:	00853513          	sltiu	a0,a0,8
200059f2:	00a60733          	add	a4,a2,a0
200059f6:	00a73733          	sltu	a4,a4,a0
200059fa:	983a                	add	a6,a6,a4
200059fc:	00e83733          	sltu	a4,a6,a4
20005a00:	9746                	add	a4,a4,a7
20005a02:	b9a9                	j	2000565c <__divtf3+0x8e8>
20005a04:	b082fee3          	bgeu	t0,s0,20005520 <__divtf3+0x7ac>
20005a08:	bc79                	j	200054a6 <__divtf3+0x732>
20005a0a:	02000e13          	li	t3,32
20005a0e:	411e0e33          	sub	t3,t3,a7
20005a12:	011c1c33          	sll	s8,s8,a7
20005a16:	d38ff06f          	j	20004f4e <__divtf3+0x1da>
20005a1a:	4701                	li	a4,0
20005a1c:	4781                	li	a5,0
20005a1e:	0890                	add	a2,sp,80
20005a20:	b585                	j	20005880 <__divtf3+0xb0c>
20005a22:	02000e13          	li	t3,32
20005a26:	411e0e33          	sub	t3,t3,a7
20005a2a:	01141433          	sll	s0,s0,a7
20005a2e:	dbaff06f          	j	20004fe8 <__divtf3+0x274>

20005a32 <__eqtf2>:
20005a32:	00052803          	lw	a6,0(a0)
20005a36:	00452e83          	lw	t4,4(a0)
20005a3a:	00852f83          	lw	t6,8(a0)
20005a3e:	4558                	lw	a4,12(a0)
20005a40:	0005a883          	lw	a7,0(a1)
20005a44:	0045af03          	lw	t5,4(a1)
20005a48:	0085a283          	lw	t0,8(a1)
20005a4c:	45d4                	lw	a3,12(a1)
20005a4e:	1141                	add	sp,sp,-16
20005a50:	002027f3          	frrm	a5
20005a54:	67a1                	lui	a5,0x8
20005a56:	17fd                	add	a5,a5,-1 # 7fff <_start-0x1fff8001>
20005a58:	01075613          	srl	a2,a4,0x10
20005a5c:	0106d593          	srl	a1,a3,0x10
20005a60:	01071313          	sll	t1,a4,0x10
20005a64:	01069e13          	sll	t3,a3,0x10
20005a68:	8e7d                	and	a2,a2,a5
20005a6a:	01035313          	srl	t1,t1,0x10
20005a6e:	837d                	srl	a4,a4,0x1f
20005a70:	010e5e13          	srl	t3,t3,0x10
20005a74:	8dfd                	and	a1,a1,a5
20005a76:	82fd                	srl	a3,a3,0x1f
20005a78:	02f60d63          	beq	a2,a5,20005ab2 <__eqtf2+0x80>
20005a7c:	00f58963          	beq	a1,a5,20005a8e <__eqtf2+0x5c>
20005a80:	4505                	li	a0,1
20005a82:	00c59463          	bne	a1,a2,20005a8a <__eqtf2+0x58>
20005a86:	07180c63          	beq	a6,a7,20005afe <__eqtf2+0xcc>
20005a8a:	0141                	add	sp,sp,16
20005a8c:	8082                	ret
20005a8e:	01e8e8b3          	or	a7,a7,t5
20005a92:	0058e8b3          	or	a7,a7,t0
20005a96:	01c8e8b3          	or	a7,a7,t3
20005a9a:	00088963          	beqz	a7,20005aac <__eqtf2+0x7a>
20005a9e:	0e42                	sll	t3,t3,0x10
20005aa0:	410e5e13          	sra	t3,t3,0x10
20005aa4:	000e4463          	bltz	t3,20005aac <__eqtf2+0x7a>
20005aa8:	00186073          	csrs	fflags,16
20005aac:	4505                	li	a0,1
20005aae:	0141                	add	sp,sp,16
20005ab0:	8082                	ret
20005ab2:	01d86833          	or	a6,a6,t4
20005ab6:	01f86833          	or	a6,a6,t6
20005aba:	00686833          	or	a6,a6,t1
20005abe:	02081063          	bnez	a6,20005ade <__eqtf2+0xac>
20005ac2:	4505                	li	a0,1
20005ac4:	fcc593e3          	bne	a1,a2,20005a8a <__eqtf2+0x58>
20005ac8:	01e8e7b3          	or	a5,a7,t5
20005acc:	0057e7b3          	or	a5,a5,t0
20005ad0:	01c7e7b3          	or	a5,a5,t3
20005ad4:	f7e9                	bnez	a5,20005a9e <__eqtf2+0x6c>
20005ad6:	8f15                	sub	a4,a4,a3
20005ad8:	00e03533          	snez	a0,a4
20005adc:	b77d                	j	20005a8a <__eqtf2+0x58>
20005ade:	0342                	sll	t1,t1,0x10
20005ae0:	41035313          	sra	t1,t1,0x10
20005ae4:	fc0352e3          	bgez	t1,20005aa8 <__eqtf2+0x76>
20005ae8:	4505                	li	a0,1
20005aea:	fac590e3          	bne	a1,a2,20005a8a <__eqtf2+0x58>
20005aee:	01e8e7b3          	or	a5,a7,t5
20005af2:	0057e7b3          	or	a5,a5,t0
20005af6:	01c7e7b3          	or	a5,a5,t3
20005afa:	dbc1                	beqz	a5,20005a8a <__eqtf2+0x58>
20005afc:	b74d                	j	20005a9e <__eqtf2+0x6c>
20005afe:	f9ee96e3          	bne	t4,t5,20005a8a <__eqtf2+0x58>
20005b02:	f85f94e3          	bne	t6,t0,20005a8a <__eqtf2+0x58>
20005b06:	f9c312e3          	bne	t1,t3,20005a8a <__eqtf2+0x58>
20005b0a:	00d70c63          	beq	a4,a3,20005b22 <__eqtf2+0xf0>
20005b0e:	fdb5                	bnez	a1,20005a8a <__eqtf2+0x58>
20005b10:	01d867b3          	or	a5,a6,t4
20005b14:	01f7e7b3          	or	a5,a5,t6
20005b18:	0067e7b3          	or	a5,a5,t1
20005b1c:	00f03533          	snez	a0,a5
20005b20:	b7ad                	j	20005a8a <__eqtf2+0x58>
20005b22:	4501                	li	a0,0
20005b24:	b79d                	j	20005a8a <__eqtf2+0x58>

20005b26 <__getf2>:
20005b26:	00052883          	lw	a7,0(a0)
20005b2a:	00452303          	lw	t1,4(a0)
20005b2e:	00852f83          	lw	t6,8(a0)
20005b32:	4550                	lw	a2,12(a0)
20005b34:	0005a803          	lw	a6,0(a1)
20005b38:	0045ae83          	lw	t4,4(a1)
20005b3c:	0085ae03          	lw	t3,8(a1)
20005b40:	45d4                	lw	a3,12(a1)
20005b42:	1141                	add	sp,sp,-16
20005b44:	002027f3          	frrm	a5
20005b48:	67a1                	lui	a5,0x8
20005b4a:	17fd                	add	a5,a5,-1 # 7fff <_start-0x1fff8001>
20005b4c:	01065713          	srl	a4,a2,0x10
20005b50:	0106d513          	srl	a0,a3,0x10
20005b54:	01061f13          	sll	t5,a2,0x10
20005b58:	01069593          	sll	a1,a3,0x10
20005b5c:	8f7d                	and	a4,a4,a5
20005b5e:	010f5f13          	srl	t5,t5,0x10
20005b62:	827d                	srl	a2,a2,0x1f
20005b64:	81c1                	srl	a1,a1,0x10
20005b66:	8d7d                	and	a0,a0,a5
20005b68:	82fd                	srl	a3,a3,0x1f
20005b6a:	04f70b63          	beq	a4,a5,20005bc0 <__getf2+0x9a>
20005b6e:	02f50563          	beq	a0,a5,20005b98 <__getf2+0x72>
20005b72:	e755                	bnez	a4,20005c1e <__getf2+0xf8>
20005b74:	011367b3          	or	a5,t1,a7
20005b78:	01f7e7b3          	or	a5,a5,t6
20005b7c:	01e7e7b3          	or	a5,a5,t5
20005b80:	ed45                	bnez	a0,20005c38 <__getf2+0x112>
20005b82:	01d86733          	or	a4,a6,t4
20005b86:	01c76733          	or	a4,a4,t3
20005b8a:	8f4d                	or	a4,a4,a1
20005b8c:	e325                	bnez	a4,20005bec <__getf2+0xc6>
20005b8e:	c399                	beqz	a5,20005b94 <__getf2+0x6e>
20005b90:	e615                	bnez	a2,20005bbc <__getf2+0x96>
20005b92:	4505                	li	a0,1
20005b94:	0141                	add	sp,sp,16
20005b96:	8082                	ret
20005b98:	01d86833          	or	a6,a6,t4
20005b9c:	01c86833          	or	a6,a6,t3
20005ba0:	00b86833          	or	a6,a6,a1
20005ba4:	08081563          	bnez	a6,20005c2e <__getf2+0x108>
20005ba8:	eb25                	bnez	a4,20005c18 <__getf2+0xf2>
20005baa:	011367b3          	or	a5,t1,a7
20005bae:	01f7e7b3          	or	a5,a5,t6
20005bb2:	01e7e7b3          	or	a5,a5,t5
20005bb6:	e3ad                	bnez	a5,20005c18 <__getf2+0xf2>
20005bb8:	4505                	li	a0,1
20005bba:	fee9                	bnez	a3,20005b94 <__getf2+0x6e>
20005bbc:	557d                	li	a0,-1
20005bbe:	bfd9                	j	20005b94 <__getf2+0x6e>
20005bc0:	011368b3          	or	a7,t1,a7
20005bc4:	01f8e8b3          	or	a7,a7,t6
20005bc8:	01e8e8b3          	or	a7,a7,t5
20005bcc:	06089163          	bnez	a7,20005c2e <__getf2+0x108>
20005bd0:	fce510e3          	bne	a0,a4,20005b90 <__getf2+0x6a>
20005bd4:	01d86833          	or	a6,a6,t4
20005bd8:	01c86833          	or	a6,a6,t3
20005bdc:	00b86833          	or	a6,a6,a1
20005be0:	04081763          	bnez	a6,20005c2e <__getf2+0x108>
20005be4:	fac696e3          	bne	a3,a2,20005b90 <__getf2+0x6a>
20005be8:	4501                	li	a0,0
20005bea:	b76d                	j	20005b94 <__getf2+0x6e>
20005bec:	d7f1                	beqz	a5,20005bb8 <__getf2+0x92>
20005bee:	fac691e3          	bne	a3,a2,20005b90 <__getf2+0x6a>
20005bf2:	f9e5efe3          	bltu	a1,t5,20005b90 <__getf2+0x6a>
20005bf6:	00bf1e63          	bne	t5,a1,20005c12 <__getf2+0xec>
20005bfa:	f9fe6be3          	bltu	t3,t6,20005b90 <__getf2+0x6a>
20005bfe:	01cf9a63          	bne	t6,t3,20005c12 <__getf2+0xec>
20005c02:	f86ee7e3          	bltu	t4,t1,20005b90 <__getf2+0x6a>
20005c06:	01d31663          	bne	t1,t4,20005c12 <__getf2+0xec>
20005c0a:	f91863e3          	bltu	a6,a7,20005b90 <__getf2+0x6a>
20005c0e:	fd08fde3          	bgeu	a7,a6,20005be8 <__getf2+0xc2>
20005c12:	4505                	li	a0,1
20005c14:	f241                	bnez	a2,20005b94 <__getf2+0x6e>
20005c16:	b75d                	j	20005bbc <__getf2+0x96>
20005c18:	f6c69ce3          	bne	a3,a2,20005b90 <__getf2+0x6a>
20005c1c:	bfdd                	j	20005c12 <__getf2+0xec>
20005c1e:	d92d                	beqz	a0,20005b90 <__getf2+0x6a>
20005c20:	f6c698e3          	bne	a3,a2,20005b90 <__getf2+0x6a>
20005c24:	f6e546e3          	blt	a0,a4,20005b90 <__getf2+0x6a>
20005c28:	fca755e3          	bge	a4,a0,20005bf2 <__getf2+0xcc>
20005c2c:	b7dd                	j	20005c12 <__getf2+0xec>
20005c2e:	00186073          	csrs	fflags,16
20005c32:	5579                	li	a0,-2
20005c34:	0141                	add	sp,sp,16
20005c36:	8082                	ret
20005c38:	d3c1                	beqz	a5,20005bb8 <__getf2+0x92>
20005c3a:	f4c69be3          	bne	a3,a2,20005b90 <__getf2+0x6a>
20005c3e:	faa75ae3          	bge	a4,a0,20005bf2 <__getf2+0xcc>
20005c42:	bfc1                	j	20005c12 <__getf2+0xec>

20005c44 <__letf2>:
20005c44:	00052303          	lw	t1,0(a0)
20005c48:	00452e03          	lw	t3,4(a0)
20005c4c:	00852f83          	lw	t6,8(a0)
20005c50:	00c52803          	lw	a6,12(a0)
20005c54:	4194                	lw	a3,0(a1)
20005c56:	0045af03          	lw	t5,4(a1)
20005c5a:	0085ae83          	lw	t4,8(a1)
20005c5e:	45d0                	lw	a2,12(a1)
20005c60:	1141                	add	sp,sp,-16
20005c62:	002027f3          	frrm	a5
20005c66:	67a1                	lui	a5,0x8
20005c68:	17fd                	add	a5,a5,-1 # 7fff <_start-0x1fff8001>
20005c6a:	01085713          	srl	a4,a6,0x10
20005c6e:	01065513          	srl	a0,a2,0x10
20005c72:	01081293          	sll	t0,a6,0x10
20005c76:	01061593          	sll	a1,a2,0x10
20005c7a:	8f7d                	and	a4,a4,a5
20005c7c:	0102d293          	srl	t0,t0,0x10
20005c80:	01f85813          	srl	a6,a6,0x1f
20005c84:	81c1                	srl	a1,a1,0x10
20005c86:	8d7d                	and	a0,a0,a5
20005c88:	827d                	srl	a2,a2,0x1f
20005c8a:	06f70163          	beq	a4,a5,20005cec <__letf2+0xa8>
20005c8e:	02f50463          	beq	a0,a5,20005cb6 <__letf2+0x72>
20005c92:	e341                	bnez	a4,20005d12 <__letf2+0xce>
20005c94:	006e68b3          	or	a7,t3,t1
20005c98:	01f8e8b3          	or	a7,a7,t6
20005c9c:	0058e8b3          	or	a7,a7,t0
20005ca0:	e121                	bnez	a0,20005ce0 <__letf2+0x9c>
20005ca2:	01e6e7b3          	or	a5,a3,t5
20005ca6:	01d7e7b3          	or	a5,a5,t4
20005caa:	8fcd                	or	a5,a5,a1
20005cac:	eb95                	bnez	a5,20005ce0 <__letf2+0x9c>
20005cae:	02089463          	bnez	a7,20005cd6 <__letf2+0x92>
20005cb2:	0141                	add	sp,sp,16
20005cb4:	8082                	ret
20005cb6:	01e6e6b3          	or	a3,a3,t5
20005cba:	01d6e6b3          	or	a3,a3,t4
20005cbe:	8ecd                	or	a3,a3,a1
20005cc0:	e6c1                	bnez	a3,20005d48 <__letf2+0x104>
20005cc2:	eb01                	bnez	a4,20005cd2 <__letf2+0x8e>
20005cc4:	006e67b3          	or	a5,t3,t1
20005cc8:	01f7e7b3          	or	a5,a5,t6
20005ccc:	0057e7b3          	or	a5,a5,t0
20005cd0:	cb91                	beqz	a5,20005ce4 <__letf2+0xa0>
20005cd2:	07060763          	beq	a2,a6,20005d40 <__letf2+0xfc>
20005cd6:	00081963          	bnez	a6,20005ce8 <__letf2+0xa4>
20005cda:	4505                	li	a0,1
20005cdc:	0141                	add	sp,sp,16
20005cde:	8082                	ret
20005ce0:	06089963          	bnez	a7,20005d52 <__letf2+0x10e>
20005ce4:	4505                	li	a0,1
20005ce6:	f671                	bnez	a2,20005cb2 <__letf2+0x6e>
20005ce8:	557d                	li	a0,-1
20005cea:	b7e1                	j	20005cb2 <__letf2+0x6e>
20005cec:	006e67b3          	or	a5,t3,t1
20005cf0:	01f7e7b3          	or	a5,a5,t6
20005cf4:	0057e7b3          	or	a5,a5,t0
20005cf8:	eba1                	bnez	a5,20005d48 <__letf2+0x104>
20005cfa:	fce51ee3          	bne	a0,a4,20005cd6 <__letf2+0x92>
20005cfe:	01e6e6b3          	or	a3,a3,t5
20005d02:	01d6e6b3          	or	a3,a3,t4
20005d06:	8ecd                	or	a3,a3,a1
20005d08:	e2a1                	bnez	a3,20005d48 <__letf2+0x104>
20005d0a:	fd0616e3          	bne	a2,a6,20005cd6 <__letf2+0x92>
20005d0e:	4501                	li	a0,0
20005d10:	b74d                	j	20005cb2 <__letf2+0x6e>
20005d12:	d171                	beqz	a0,20005cd6 <__letf2+0x92>
20005d14:	fd0611e3          	bne	a2,a6,20005cd6 <__letf2+0x92>
20005d18:	fae54fe3          	blt	a0,a4,20005cd6 <__letf2+0x92>
20005d1c:	02a74263          	blt	a4,a0,20005d40 <__letf2+0xfc>
20005d20:	fa55ebe3          	bltu	a1,t0,20005cd6 <__letf2+0x92>
20005d24:	00b29e63          	bne	t0,a1,20005d40 <__letf2+0xfc>
20005d28:	fbfee7e3          	bltu	t4,t6,20005cd6 <__letf2+0x92>
20005d2c:	01df9a63          	bne	t6,t4,20005d40 <__letf2+0xfc>
20005d30:	fbcf63e3          	bltu	t5,t3,20005cd6 <__letf2+0x92>
20005d34:	01ee1663          	bne	t3,t5,20005d40 <__letf2+0xfc>
20005d38:	f866efe3          	bltu	a3,t1,20005cd6 <__letf2+0x92>
20005d3c:	fcd379e3          	bgeu	t1,a3,20005d0e <__letf2+0xca>
20005d40:	4505                	li	a0,1
20005d42:	f60818e3          	bnez	a6,20005cb2 <__letf2+0x6e>
20005d46:	b74d                	j	20005ce8 <__letf2+0xa4>
20005d48:	00186073          	csrs	fflags,16
20005d4c:	4509                	li	a0,2
20005d4e:	0141                	add	sp,sp,16
20005d50:	8082                	ret
20005d52:	f90612e3          	bne	a2,a6,20005cd6 <__letf2+0x92>
20005d56:	b7d9                	j	20005d1c <__letf2+0xd8>

20005d58 <__multf3>:
20005d58:	7131                	add	sp,sp,-192
20005d5a:	dd22                	sw	s0,184(sp)
20005d5c:	db26                	sw	s1,180(sp)
20005d5e:	d552                	sw	s4,168(sp)
20005d60:	d356                	sw	s5,164(sp)
20005d62:	d15a                	sw	s6,160(sp)
20005d64:	cf5e                	sw	s7,156(sp)
20005d66:	4180                	lw	s0,0(a1)
20005d68:	41d8                	lw	a4,4(a1)
20005d6a:	0085a803          	lw	a6,8(a1)
20005d6e:	45dc                	lw	a5,12(a1)
20005d70:	00062b03          	lw	s6,0(a2)
20005d74:	00462a83          	lw	s5,4(a2)
20005d78:	00862b83          	lw	s7,8(a2)
20005d7c:	00c62a03          	lw	s4,12(a2)
20005d80:	df06                	sw	ra,188(sp)
20005d82:	d94a                	sw	s2,176(sp)
20005d84:	d74e                	sw	s3,172(sp)
20005d86:	cd62                	sw	s8,152(sp)
20005d88:	cb66                	sw	s9,148(sp)
20005d8a:	84aa                	mv	s1,a0
20005d8c:	002026f3          	frrm	a3
20005d90:	6621                	lui	a2,0x8
20005d92:	01079513          	sll	a0,a5,0x10
20005d96:	c636                	sw	a3,12(sp)
20005d98:	8141                	srl	a0,a0,0x10
20005d9a:	0107d693          	srl	a3,a5,0x10
20005d9e:	167d                	add	a2,a2,-1 # 7fff <_start-0x1fff8001>
20005da0:	d0a2                	sw	s0,96(sp)
20005da2:	d2ba                	sw	a4,100(sp)
20005da4:	d4c2                	sw	a6,104(sp)
20005da6:	d6be                	sw	a5,108(sp)
20005da8:	d822                	sw	s0,48(sp)
20005daa:	da3a                	sw	a4,52(sp)
20005dac:	dc42                	sw	a6,56(sp)
20005dae:	de2a                	sw	a0,60(sp)
20005db0:	8ef1                	and	a3,a3,a2
20005db2:	01f7d993          	srl	s3,a5,0x1f
20005db6:	0a0682e3          	beqz	a3,2000665a <__multf3+0x902>
20005dba:	72c68963          	beq	a3,a2,200064ec <__multf3+0x794>
20005dbe:	67c1                	lui	a5,0x10
20005dc0:	8d5d                	or	a0,a0,a5
20005dc2:	de2a                	sw	a0,60(sp)
20005dc4:	180c                	add	a1,sp,48
20005dc6:	187c                	add	a5,sp,60
20005dc8:	00351613          	sll	a2,a0,0x3
20005dcc:	ffc7a503          	lw	a0,-4(a5) # fffc <_start-0x1fff0004>
20005dd0:	17f1                	add	a5,a5,-4
20005dd2:	01d55713          	srl	a4,a0,0x1d
20005dd6:	8f51                	or	a4,a4,a2
20005dd8:	c3d8                	sw	a4,4(a5)
20005dda:	fef597e3          	bne	a1,a5,20005dc8 <__multf3+0x70>
20005dde:	77f1                	lui	a5,0xffffc
20005de0:	040e                	sll	s0,s0,0x3
20005de2:	0785                	add	a5,a5,1 # ffffc001 <dummy_file+0xc9fb9bc1>
20005de4:	d822                	sw	s0,48(sp)
20005de6:	00f68933          	add	s2,a3,a5
20005dea:	4c01                	li	s8,0
20005dec:	4c81                	li	s9,0
20005dee:	4401                	li	s0,0
20005df0:	010a1513          	sll	a0,s4,0x10
20005df4:	67a1                	lui	a5,0x8
20005df6:	010a5713          	srl	a4,s4,0x10
20005dfa:	8141                	srl	a0,a0,0x10
20005dfc:	17fd                	add	a5,a5,-1 # 7fff <_start-0x1fff8001>
20005dfe:	d6d2                	sw	s4,108(sp)
20005e00:	d0da                	sw	s6,96(sp)
20005e02:	d2d6                	sw	s5,100(sp)
20005e04:	d4de                	sw	s7,104(sp)
20005e06:	c0da                	sw	s6,64(sp)
20005e08:	c2d6                	sw	s5,68(sp)
20005e0a:	c4de                	sw	s7,72(sp)
20005e0c:	c6aa                	sw	a0,76(sp)
20005e0e:	8f7d                	and	a4,a4,a5
20005e10:	01fa5a13          	srl	s4,s4,0x1f
20005e14:	78070b63          	beqz	a4,200065aa <__multf3+0x852>
20005e18:	6ef70563          	beq	a4,a5,20006502 <__multf3+0x7aa>
20005e1c:	67c1                	lui	a5,0x10
20005e1e:	8d5d                	or	a0,a0,a5
20005e20:	c6aa                	sw	a0,76(sp)
20005e22:	008c                	add	a1,sp,64
20005e24:	00f4                	add	a3,sp,76
20005e26:	00351613          	sll	a2,a0,0x3
20005e2a:	ffc6a503          	lw	a0,-4(a3)
20005e2e:	16f1                	add	a3,a3,-4
20005e30:	01d55793          	srl	a5,a0,0x1d
20005e34:	8fd1                	or	a5,a5,a2
20005e36:	c2dc                	sw	a5,4(a3)
20005e38:	fed597e3          	bne	a1,a3,20005e26 <__multf3+0xce>
20005e3c:	77f1                	lui	a5,0xffffc
20005e3e:	0785                	add	a5,a5,1 # ffffc001 <dummy_file+0xc9fb9bc1>
20005e40:	0b0e                	sll	s6,s6,0x3
20005e42:	973e                	add	a4,a4,a5
20005e44:	c0da                	sw	s6,64(sp)
20005e46:	974a                	add	a4,a4,s2
20005e48:	4601                	li	a2,0
20005e4a:	00170693          	add	a3,a4,1
20005e4e:	47a9                	li	a5,10
20005e50:	c836                	sw	a3,16(sp)
20005e52:	0187c2e3          	blt	a5,s8,20006656 <__multf3+0x8fe>
20005e56:	0149c7b3          	xor	a5,s3,s4
20005e5a:	4689                	li	a3,2
20005e5c:	c43e                	sw	a5,8(sp)
20005e5e:	0d86d5e3          	bge	a3,s8,20006728 <__multf3+0x9d0>
20005e62:	4685                	li	a3,1
20005e64:	018696b3          	sll	a3,a3,s8
20005e68:	5306f593          	and	a1,a3,1328
20005e6c:	6c059c63          	bnez	a1,20006544 <__multf3+0x7ec>
20005e70:	0886f593          	and	a1,a3,136
20005e74:	10059be3          	bnez	a1,2000678a <__multf3+0xa32>
20005e78:	2406f693          	and	a3,a3,576
20005e7c:	0e069ee3          	bnez	a3,20006778 <__multf3+0xa20>
20005e80:	5ec2                	lw	t4,48(sp)
20005e82:	4f86                	lw	t6,64(sp)
20005e84:	6841                	lui	a6,0x10
20005e86:	fff80693          	add	a3,a6,-1 # ffff <_start-0x1fff0001>
20005e8a:	010ed993          	srl	s3,t4,0x10
20005e8e:	010fd913          	srl	s2,t6,0x10
20005e92:	00defeb3          	and	t4,t4,a3
20005e96:	00dfffb3          	and	t6,t6,a3
20005e9a:	03df86b3          	mul	a3,t6,t4
20005e9e:	c96a                	sw	s10,144(sp)
20005ea0:	c76e                	sw	s11,140(sp)
20005ea2:	03f98533          	mul	a0,s3,t6
20005ea6:	0106da93          	srl	s5,a3,0x10
20005eaa:	03d90633          	mul	a2,s2,t4
20005eae:	962a                	add	a2,a2,a0
20005eb0:	9ab2                	add	s5,s5,a2
20005eb2:	032985b3          	mul	a1,s3,s2
20005eb6:	00aaf363          	bgeu	s5,a0,20005ebc <__multf3+0x164>
20005eba:	95c2                	add	a1,a1,a6
20005ebc:	4616                	lw	a2,68(sp)
20005ebe:	6841                	lui	a6,0x10
20005ec0:	fff80893          	add	a7,a6,-1 # ffff <_start-0x1fff0001>
20005ec4:	01065313          	srl	t1,a2,0x10
20005ec8:	01167e33          	and	t3,a2,a7
20005ecc:	011af633          	and	a2,s5,a7
20005ed0:	0642                	sll	a2,a2,0x10
20005ed2:	0116f6b3          	and	a3,a3,a7
20005ed6:	96b2                	add	a3,a3,a2
20005ed8:	03de0533          	mul	a0,t3,t4
20005edc:	d636                	sw	a3,44(sp)
20005ede:	d0b6                	sw	a3,96(sp)
20005ee0:	cc1a                	sw	t1,24(sp)
20005ee2:	d072                	sw	t3,32(sp)
20005ee4:	010ada93          	srl	s5,s5,0x10
20005ee8:	03c988b3          	mul	a7,s3,t3
20005eec:	01055613          	srl	a2,a0,0x10
20005ef0:	03d306b3          	mul	a3,t1,t4
20005ef4:	96c6                	add	a3,a3,a7
20005ef6:	9636                	add	a2,a2,a3
20005ef8:	02698cb3          	mul	s9,s3,t1
20005efc:	01167363          	bgeu	a2,a7,20005f02 <__multf3+0x1aa>
20005f00:	9cc2                	add	s9,s9,a6
20005f02:	5e52                	lw	t3,52(sp)
20005f04:	6841                	lui	a6,0x10
20005f06:	fff80893          	add	a7,a6,-1 # ffff <_start-0x1fff0001>
20005f0a:	01167a33          	and	s4,a2,a7
20005f0e:	010e5393          	srl	t2,t3,0x10
20005f12:	01157533          	and	a0,a0,a7
20005f16:	011e7e33          	and	t3,t3,a7
20005f1a:	0a42                	sll	s4,s4,0x10
20005f1c:	9a2a                	add	s4,s4,a0
20005f1e:	03fe06b3          	mul	a3,t3,t6
20005f22:	8241                	srl	a2,a2,0x10
20005f24:	9ad2                	add	s5,s5,s4
20005f26:	03f38333          	mul	t1,t2,t6
20005f2a:	0106d893          	srl	a7,a3,0x10
20005f2e:	03c90533          	mul	a0,s2,t3
20005f32:	951a                	add	a0,a0,t1
20005f34:	98aa                	add	a7,a7,a0
20005f36:	02790533          	mul	a0,s2,t2
20005f3a:	0068f363          	bgeu	a7,t1,20005f40 <__multf3+0x1e8>
20005f3e:	9542                	add	a0,a0,a6
20005f40:	6341                	lui	t1,0x10
20005f42:	fff30813          	add	a6,t1,-1 # ffff <_start-0x1fff0001>
20005f46:	0108fb33          	and	s6,a7,a6
20005f4a:	0108d893          	srl	a7,a7,0x10
20005f4e:	42e2                	lw	t0,24(sp)
20005f50:	98aa                	add	a7,a7,a0
20005f52:	5502                	lw	a0,32(sp)
20005f54:	0106f6b3          	and	a3,a3,a6
20005f58:	03c28f33          	mul	t5,t0,t3
20005f5c:	0b42                	sll	s6,s6,0x10
20005f5e:	9b36                	add	s6,s6,a3
20005f60:	03c50833          	mul	a6,a0,t3
20005f64:	02a38533          	mul	a0,t2,a0
20005f68:	01085693          	srl	a3,a6,0x10
20005f6c:	9f2a                	add	t5,t5,a0
20005f6e:	96fa                	add	a3,a3,t5
20005f70:	027282b3          	mul	t0,t0,t2
20005f74:	00a6f363          	bgeu	a3,a0,20005f7a <__multf3+0x222>
20005f78:	929a                	add	t0,t0,t1
20005f7a:	4526                	lw	a0,72(sp)
20005f7c:	6341                	lui	t1,0x10
20005f7e:	fff30b93          	add	s7,t1,-1 # ffff <_start-0x1fff0001>
20005f82:	01055c13          	srl	s8,a0,0x10
20005f86:	01757d33          	and	s10,a0,s7
20005f8a:	0176f533          	and	a0,a3,s7
20005f8e:	82c1                	srl	a3,a3,0x10
20005f90:	9696                	add	a3,a3,t0
20005f92:	03dd0f33          	mul	t5,s10,t4
20005f96:	d436                	sw	a3,40(sp)
20005f98:	01787833          	and	a6,a6,s7
20005f9c:	0542                	sll	a0,a0,0x10
20005f9e:	9542                	add	a0,a0,a6
20005fa0:	ce62                	sw	s8,28(sp)
20005fa2:	ca6a                	sw	s10,20(sp)
20005fa4:	03dc02b3          	mul	t0,s8,t4
20005fa8:	010f5813          	srl	a6,t5,0x10
20005fac:	03a986b3          	mul	a3,s3,s10
20005fb0:	92b6                	add	t0,t0,a3
20005fb2:	9816                	add	a6,a6,t0
20005fb4:	03898c33          	mul	s8,s3,s8
20005fb8:	00d87363          	bgeu	a6,a3,20005fbe <__multf3+0x266>
20005fbc:	9c1a                	add	s8,s8,t1
20005fbe:	5362                	lw	t1,56(sp)
20005fc0:	6d41                	lui	s10,0x10
20005fc2:	fffd0d93          	add	s11,s10,-1 # ffff <_start-0x1fff0001>
20005fc6:	01035293          	srl	t0,t1,0x10
20005fca:	01b876b3          	and	a3,a6,s11
20005fce:	01b37333          	and	t1,t1,s11
20005fd2:	01085813          	srl	a6,a6,0x10
20005fd6:	01bf7f33          	and	t5,t5,s11
20005fda:	03f30bb3          	mul	s7,t1,t6
20005fde:	9862                	add	a6,a6,s8
20005fe0:	06c2                	sll	a3,a3,0x10
20005fe2:	96fa                	add	a3,a3,t5
20005fe4:	03f28db3          	mul	s11,t0,t6
20005fe8:	010bdf13          	srl	t5,s7,0x10
20005fec:	02690c33          	mul	s8,s2,t1
20005ff0:	9c6e                	add	s8,s8,s11
20005ff2:	9f62                	add	t5,t5,s8
20005ff4:	02590c33          	mul	s8,s2,t0
20005ff8:	01bf7363          	bgeu	t5,s11,20005ffe <__multf3+0x2a6>
20005ffc:	9c6a                	add	s8,s8,s10
20005ffe:	95d6                	add	a1,a1,s5
20006000:	0145ba33          	sltu	s4,a1,s4
20006004:	9652                	add	a2,a2,s4
20006006:	9666                	add	a2,a2,s9
20006008:	9b2e                	add	s6,s6,a1
2000600a:	98b2                	add	a7,a7,a2
2000600c:	00bb35b3          	sltu	a1,s6,a1
20006010:	95c6                	add	a1,a1,a7
20006012:	4ab6                	lw	s5,76(sp)
20006014:	d25a                	sw	s6,36(sp)
20006016:	00c8bb33          	sltu	s6,a7,a2
2000601a:	0115b8b3          	sltu	a7,a1,a7
2000601e:	011b68b3          	or	a7,s6,a7
20006022:	6d41                	lui	s10,0x10
20006024:	01463633          	sltu	a2,a2,s4
20006028:	fffd0d93          	add	s11,s10,-1 # ffff <_start-0x1fff0001>
2000602c:	9646                	add	a2,a2,a7
2000602e:	58a2                	lw	a7,40(sp)
20006030:	010add13          	srl	s10,s5,0x10
20006034:	01bafcb3          	and	s9,s5,s11
20006038:	952e                	add	a0,a0,a1
2000603a:	03dc8ab3          	mul	s5,s9,t4
2000603e:	98b2                	add	a7,a7,a2
20006040:	01bf7a33          	and	s4,t5,s11
20006044:	00b535b3          	sltu	a1,a0,a1
20006048:	95c6                	add	a1,a1,a7
2000604a:	96aa                	add	a3,a3,a0
2000604c:	0a42                	sll	s4,s4,0x10
2000604e:	01bbfdb3          	and	s11,s7,s11
20006052:	982e                	add	a6,a6,a1
20006054:	9dd2                	add	s11,s11,s4
20006056:	03998b33          	mul	s6,s3,s9
2000605a:	00a6b533          	sltu	a0,a3,a0
2000605e:	010f5f13          	srl	t5,t5,0x10
20006062:	9542                	add	a0,a0,a6
20006064:	9db6                	add	s11,s11,a3
20006066:	9f62                	add	t5,t5,s8
20006068:	9f2a                	add	t5,t5,a0
2000606a:	00ddb6b3          	sltu	a3,s11,a3
2000606e:	00df0a33          	add	s4,t5,a3
20006072:	01ea36b3          	sltu	a3,s4,t5
20006076:	03dd0eb3          	mul	t4,s10,t4
2000607a:	00c8b633          	sltu	a2,a7,a2
2000607e:	0115b8b3          	sltu	a7,a1,a7
20006082:	00b835b3          	sltu	a1,a6,a1
20006086:	01053833          	sltu	a6,a0,a6
2000608a:	00af3533          	sltu	a0,t5,a0
2000608e:	8d55                	or	a0,a0,a3
20006090:	5692                	lw	a3,36(sp)
20006092:	011668b3          	or	a7,a2,a7
20006096:	0105e833          	or	a6,a1,a6
2000609a:	9eda                	add	t4,t4,s6
2000609c:	010adf13          	srl	t5,s5,0x10
200060a0:	98c2                	add	a7,a7,a6
200060a2:	d2b6                	sw	a3,100(sp)
200060a4:	d4ee                	sw	s11,104(sp)
200060a6:	9f76                	add	t5,t5,t4
200060a8:	03a989b3          	mul	s3,s3,s10
200060ac:	01150c33          	add	s8,a0,a7
200060b0:	016f7463          	bgeu	t5,s6,200060b8 <__multf3+0x360>
200060b4:	66c1                	lui	a3,0x10
200060b6:	99b6                	add	s3,s3,a3
200060b8:	5672                	lw	a2,60(sp)
200060ba:	6541                	lui	a0,0x10
200060bc:	fff50693          	add	a3,a0,-1 # ffff <_start-0x1fff0001>
200060c0:	01065b13          	srl	s6,a2,0x10
200060c4:	8e75                	and	a2,a2,a3
200060c6:	03f605b3          	mul	a1,a2,t6
200060ca:	00df7eb3          	and	t4,t5,a3
200060ce:	00dafab3          	and	s5,s5,a3
200060d2:	010f5f13          	srl	t5,t5,0x10
200060d6:	0ec2                	sll	t4,t4,0x10
200060d8:	9f4e                	add	t5,t5,s3
200060da:	9ed6                	add	t4,t4,s5
200060dc:	02c90833          	mul	a6,s2,a2
200060e0:	0105d693          	srl	a3,a1,0x10
200060e4:	03fb0fb3          	mul	t6,s6,t6
200060e8:	987e                	add	a6,a6,t6
200060ea:	96c2                	add	a3,a3,a6
200060ec:	03690933          	mul	s2,s2,s6
200060f0:	01f6f363          	bgeu	a3,t6,200060f6 <__multf3+0x39e>
200060f4:	992a                	add	s2,s2,a0
200060f6:	6fc1                	lui	t6,0x10
200060f8:	ffff8513          	add	a0,t6,-1 # ffff <_start-0x1fff0001>
200060fc:	00a6f8b3          	and	a7,a3,a0
20006100:	8de9                	and	a1,a1,a0
20006102:	49f2                	lw	s3,28(sp)
20006104:	4552                	lw	a0,20(sp)
20006106:	82c1                	srl	a3,a3,0x10
20006108:	08c2                	sll	a7,a7,0x10
2000610a:	02ae0833          	mul	a6,t3,a0
2000610e:	96ca                	add	a3,a3,s2
20006110:	98ae                	add	a7,a7,a1
20006112:	03c98933          	mul	s2,s3,t3
20006116:	02a385b3          	mul	a1,t2,a0
2000611a:	01085513          	srl	a0,a6,0x10
2000611e:	992e                	add	s2,s2,a1
20006120:	954a                	add	a0,a0,s2
20006122:	033389b3          	mul	s3,t2,s3
20006126:	00b57363          	bgeu	a0,a1,2000612c <__multf3+0x3d4>
2000612a:	99fe                	add	s3,s3,t6
2000612c:	6941                	lui	s2,0x10
2000612e:	fff90f93          	add	t6,s2,-1 # ffff <_start-0x1fff0001>
20006132:	01f575b3          	and	a1,a0,t6
20006136:	01f87833          	and	a6,a6,t6
2000613a:	4be2                	lw	s7,24(sp)
2000613c:	5f82                	lw	t6,32(sp)
2000613e:	8141                	srl	a0,a0,0x10
20006140:	954e                	add	a0,a0,s3
20006142:	026f8ab3          	mul	s5,t6,t1
20006146:	05c2                	sll	a1,a1,0x10
20006148:	95c2                	add	a1,a1,a6
2000614a:	026b89b3          	mul	s3,s7,t1
2000614e:	010ad813          	srl	a6,s5,0x10
20006152:	03f28fb3          	mul	t6,t0,t6
20006156:	99fe                	add	s3,s3,t6
20006158:	984e                	add	a6,a6,s3
2000615a:	025b8bb3          	mul	s7,s7,t0
2000615e:	01f87363          	bgeu	a6,t6,20006164 <__multf3+0x40c>
20006162:	9bca                	add	s7,s7,s2
20006164:	6941                	lui	s2,0x10
20006166:	9ed2                	add	t4,t4,s4
20006168:	197d                	add	s2,s2,-1 # ffff <_start-0x1fff0001>
2000616a:	014ebfb3          	sltu	t6,t4,s4
2000616e:	01287a33          	and	s4,a6,s2
20006172:	9f62                	add	t5,t5,s8
20006174:	0a42                	sll	s4,s4,0x10
20006176:	012af933          	and	s2,s5,s2
2000617a:	98f6                	add	a7,a7,t4
2000617c:	9952                	add	s2,s2,s4
2000617e:	49d2                	lw	s3,20(sp)
20006180:	018f3a33          	sltu	s4,t5,s8
20006184:	4ad2                	lw	s5,20(sp)
20006186:	4c72                	lw	s8,28(sp)
20006188:	95c6                	add	a1,a1,a7
2000618a:	992e                	add	s2,s2,a1
2000618c:	d44a                	sw	s2,40(sp)
2000618e:	033309b3          	mul	s3,t1,s3
20006192:	9ffa                	add	t6,t6,t5
20006194:	96fe                	add	a3,a3,t6
20006196:	01d8beb3          	sltu	t4,a7,t4
2000619a:	01085813          	srl	a6,a6,0x10
2000619e:	9eb6                	add	t4,t4,a3
200061a0:	985e                	add	a6,a6,s7
200061a2:	5ba2                	lw	s7,40(sp)
200061a4:	9576                	add	a0,a0,t4
200061a6:	0115b8b3          	sltu	a7,a1,a7
200061aa:	03528ab3          	mul	s5,t0,s5
200061ae:	98aa                	add	a7,a7,a0
200061b0:	9846                	add	a6,a6,a7
200061b2:	01efbf33          	sltu	t5,t6,t5
200061b6:	00bbb5b3          	sltu	a1,s7,a1
200061ba:	01f6bfb3          	sltu	t6,a3,t6
200061be:	00deb6b3          	sltu	a3,t4,a3
200061c2:	01ea6a33          	or	s4,s4,t5
200061c6:	01d53eb3          	sltu	t4,a0,t4
200061ca:	00dfe6b3          	or	a3,t6,a3
200061ce:	026c0933          	mul	s2,s8,t1
200061d2:	00a8b533          	sltu	a0,a7,a0
200061d6:	95c2                	add	a1,a1,a6
200061d8:	96d2                	add	a3,a3,s4
200061da:	00aee533          	or	a0,t4,a0
200061de:	011838b3          	sltu	a7,a6,a7
200061e2:	0109de93          	srl	t4,s3,0x10
200061e6:	0105b833          	sltu	a6,a1,a6
200061ea:	9536                	add	a0,a0,a3
200061ec:	0108e833          	or	a6,a7,a6
200061f0:	9956                	add	s2,s2,s5
200061f2:	d6de                	sw	s7,108(sp)
200061f4:	9976                	add	s2,s2,t4
200061f6:	025c06b3          	mul	a3,s8,t0
200061fa:	8ede                	mv	t4,s7
200061fc:	00a80bb3          	add	s7,a6,a0
20006200:	01597463          	bgeu	s2,s5,20006208 <__multf3+0x4b0>
20006204:	6541                	lui	a0,0x10
20006206:	96aa                	add	a3,a3,a0
20006208:	6fc1                	lui	t6,0x10
2000620a:	ffff8893          	add	a7,t6,-1 # ffff <_start-0x1fff0001>
2000620e:	01197833          	and	a6,s2,a7
20006212:	01095913          	srl	s2,s2,0x10
20006216:	03cc8533          	mul	a0,s9,t3
2000621a:	00d90a33          	add	s4,s2,a3
2000621e:	0842                	sll	a6,a6,0x10
20006220:	0119f9b3          	and	s3,s3,a7
20006224:	99c2                	add	s3,s3,a6
20006226:	039386b3          	mul	a3,t2,s9
2000622a:	01055f13          	srl	t5,a0,0x10
2000622e:	03cd0e33          	mul	t3,s10,t3
20006232:	9e36                	add	t3,t3,a3
20006234:	9f72                	add	t5,t5,t3
20006236:	03a383b3          	mul	t2,t2,s10
2000623a:	00df7363          	bgeu	t5,a3,20006240 <__multf3+0x4e8>
2000623e:	93fe                	add	t2,t2,t6
20006240:	6e41                	lui	t3,0x10
20006242:	fffe0813          	add	a6,t3,-1 # ffff <_start-0x1fff0001>
20006246:	010f76b3          	and	a3,t5,a6
2000624a:	010f5f13          	srl	t5,t5,0x10
2000624e:	01057533          	and	a0,a0,a6
20006252:	9f1e                	add	t5,t5,t2
20006254:	5802                	lw	a6,32(sp)
20006256:	43e2                	lw	t2,24(sp)
20006258:	06c2                	sll	a3,a3,0x10
2000625a:	030608b3          	mul	a7,a2,a6
2000625e:	96aa                	add	a3,a3,a0
20006260:	02c38fb3          	mul	t6,t2,a2
20006264:	030b0533          	mul	a0,s6,a6
20006268:	0108d813          	srl	a6,a7,0x10
2000626c:	9faa                	add	t6,t6,a0
2000626e:	987e                	add	a6,a6,t6
20006270:	03638fb3          	mul	t6,t2,s6
20006274:	00a87363          	bgeu	a6,a0,2000627a <__multf3+0x522>
20006278:	9ff2                	add	t6,t6,t3
2000627a:	6541                	lui	a0,0x10
2000627c:	fff50e13          	add	t3,a0,-1 # ffff <_start-0x1fff0001>
20006280:	01c87933          	and	s2,a6,t3
20006284:	01c8f8b3          	and	a7,a7,t3
20006288:	01085813          	srl	a6,a6,0x10
2000628c:	0942                	sll	s2,s2,0x10
2000628e:	987e                	add	a6,a6,t6
20006290:	9946                	add	s2,s2,a7
20006292:	03930fb3          	mul	t6,t1,s9
20006296:	039288b3          	mul	a7,t0,s9
2000629a:	010fde13          	srl	t3,t6,0x10
2000629e:	026d0333          	mul	t1,s10,t1
200062a2:	9346                	add	t1,t1,a7
200062a4:	9e1a                	add	t3,t3,t1
200062a6:	03a282b3          	mul	t0,t0,s10
200062aa:	011e7363          	bgeu	t3,a7,200062b0 <__multf3+0x558>
200062ae:	92aa                	add	t0,t0,a0
200062b0:	6541                	lui	a0,0x10
200062b2:	fff50313          	add	t1,a0,-1 # ffff <_start-0x1fff0001>
200062b6:	006e78b3          	and	a7,t3,t1
200062ba:	006fffb3          	and	t6,t6,t1
200062be:	4af2                	lw	s5,28(sp)
200062c0:	4352                	lw	t1,20(sp)
200062c2:	010e5e13          	srl	t3,t3,0x10
200062c6:	08c2                	sll	a7,a7,0x10
200062c8:	02ca83b3          	mul	t2,s5,a2
200062cc:	9e16                	add	t3,t3,t0
200062ce:	98fe                	add	a7,a7,t6
200062d0:	026602b3          	mul	t0,a2,t1
200062d4:	026b0fb3          	mul	t6,s6,t1
200062d8:	0102d313          	srl	t1,t0,0x10
200062dc:	93fe                	add	t2,t2,t6
200062de:	931e                	add	t1,t1,t2
200062e0:	036a83b3          	mul	t2,s5,s6
200062e4:	01f37363          	bgeu	t1,t6,200062ea <__multf3+0x592>
200062e8:	93aa                	add	t2,t2,a0
200062ea:	01358533          	add	a0,a1,s3
200062ee:	014b8fb3          	add	t6,s7,s4
200062f2:	00b535b3          	sltu	a1,a0,a1
200062f6:	95fe                	add	a1,a1,t6
200062f8:	96aa                	add	a3,a3,a0
200062fa:	9f2e                	add	t5,t5,a1
200062fc:	00a6b533          	sltu	a0,a3,a0
20006300:	039609b3          	mul	s3,a2,s9
20006304:	957a                	add	a0,a0,t5
20006306:	9936                	add	s2,s2,a3
20006308:	982a                	add	a6,a6,a0
2000630a:	00d936b3          	sltu	a3,s2,a3
2000630e:	96c2                	add	a3,a3,a6
20006310:	017fbab3          	sltu	s5,t6,s7
20006314:	6a41                	lui	s4,0x10
20006316:	01f5bbb3          	sltu	s7,a1,t6
2000631a:	00bf35b3          	sltu	a1,t5,a1
2000631e:	039b0c33          	mul	s8,s6,s9
20006322:	01e53f33          	sltu	t5,a0,t5
20006326:	fffa0f93          	add	t6,s4,-1 # ffff <_start-0x1fff0001>
2000632a:	01e5ef33          	or	t5,a1,t5
2000632e:	00a83533          	sltu	a0,a6,a0
20006332:	017aebb3          	or	s7,s5,s7
20006336:	0106b833          	sltu	a6,a3,a6
2000633a:	01f375b3          	and	a1,t1,t6
2000633e:	9bfa                	add	s7,s7,t5
20006340:	01056833          	or	a6,a0,a6
20006344:	02cd0633          	mul	a2,s10,a2
20006348:	98b6                	add	a7,a7,a3
2000634a:	985e                	add	a6,a6,s7
2000634c:	05c2                	sll	a1,a1,0x10
2000634e:	01f2ffb3          	and	t6,t0,t6
20006352:	9e42                	add	t3,t3,a6
20006354:	9fae                	add	t6,t6,a1
20006356:	00d8b6b3          	sltu	a3,a7,a3
2000635a:	01035313          	srl	t1,t1,0x10
2000635e:	96f2                	add	a3,a3,t3
20006360:	9fc6                	add	t6,t6,a7
20006362:	931e                	add	t1,t1,t2
20006364:	9336                	add	t1,t1,a3
20006366:	011fb8b3          	sltu	a7,t6,a7
2000636a:	989a                	add	a7,a7,t1
2000636c:	9662                	add	a2,a2,s8
2000636e:	0109d593          	srl	a1,s3,0x10
20006372:	010e3833          	sltu	a6,t3,a6
20006376:	d8ca                	sw	s2,112(sp)
20006378:	01c6be33          	sltu	t3,a3,t3
2000637c:	dafe                	sw	t6,116(sp)
2000637e:	00d336b3          	sltu	a3,t1,a3
20006382:	962e                	add	a2,a2,a1
20006384:	0068b333          	sltu	t1,a7,t1
20006388:	036d0b33          	mul	s6,s10,s6
2000638c:	01c86e33          	or	t3,a6,t3
20006390:	0066e333          	or	t1,a3,t1
20006394:	01867363          	bgeu	a2,s8,2000639a <__multf3+0x642>
20006398:	9b52                	add	s6,s6,s4
2000639a:	65c1                	lui	a1,0x10
2000639c:	15fd                	add	a1,a1,-1 # ffff <_start-0x1fff0001>
2000639e:	00b676b3          	and	a3,a2,a1
200063a2:	8241                	srl	a2,a2,0x10
200063a4:	9672                	add	a2,a2,t3
200063a6:	00b9f9b3          	and	s3,s3,a1
200063aa:	9332                	add	t1,t1,a2
200063ac:	5592                	lw	a1,36(sp)
200063ae:	5632                	lw	a2,44(sp)
200063b0:	06c2                	sll	a3,a3,0x10
200063b2:	96ce                	add	a3,a3,s3
200063b4:	96c6                	add	a3,a3,a7
200063b6:	8e4d                	or	a2,a2,a1
200063b8:	55a2                	lw	a1,40(sp)
200063ba:	0116b8b3          	sltu	a7,a3,a7
200063be:	989a                	add	a7,a7,t1
200063c0:	98da                	add	a7,a7,s6
200063c2:	00cde633          	or	a2,s11,a2
200063c6:	00d59d13          	sll	s10,a1,0xd
200063ca:	dcb6                	sw	a3,120(sp)
200063cc:	dec6                	sw	a7,124(sp)
200063ce:	00cd6d33          	or	s10,s10,a2
200063d2:	1094                	add	a3,sp,96
200063d4:	1888                	add	a0,sp,112
200063d6:	013ed593          	srl	a1,t4,0x13
200063da:	0106ae83          	lw	t4,16(a3) # 10010 <_start-0x1ffefff0>
200063de:	0691                	add	a3,a3,4
200063e0:	00de9613          	sll	a2,t4,0xd
200063e4:	8e4d                	or	a2,a2,a1
200063e6:	fec6ae23          	sw	a2,-4(a3)
200063ea:	fea696e3          	bne	a3,a0,200063d6 <__multf3+0x67e>
200063ee:	5606                	lw	a2,96(sp)
200063f0:	01a036b3          	snez	a3,s10
200063f4:	55b6                	lw	a1,108(sp)
200063f6:	8ed1                	or	a3,a3,a2
200063f8:	5626                	lw	a2,104(sp)
200063fa:	ceae                	sw	a1,92(sp)
200063fc:	c8b6                	sw	a3,80(sp)
200063fe:	ccb2                	sw	a2,88(sp)
20006400:	5616                	lw	a2,100(sp)
20006402:	cab2                	sw	a2,84(sp)
20006404:	00b59613          	sll	a2,a1,0xb
20006408:	5c065e63          	bgez	a2,200069e4 <__multf3+0xc8c>
2000640c:	01f69513          	sll	a0,a3,0x1f
20006410:	0898                	add	a4,sp,80
20006412:	05c10813          	add	a6,sp,92
20006416:	0016d893          	srl	a7,a3,0x1
2000641a:	4354                	lw	a3,4(a4)
2000641c:	0711                	add	a4,a4,4
2000641e:	01f69613          	sll	a2,a3,0x1f
20006422:	01166633          	or	a2,a2,a7
20006426:	fec72e23          	sw	a2,-4(a4)
2000642a:	fee816e3          	bne	a6,a4,20006416 <__multf3+0x6be>
2000642e:	4746                	lw	a4,80(sp)
20006430:	00a036b3          	snez	a3,a0
20006434:	4d4a                	lw	s10,144(sp)
20006436:	8f55                	or	a4,a4,a3
20006438:	c8ba                	sw	a4,80(sp)
2000643a:	4dba                	lw	s11,140(sp)
2000643c:	4742                	lw	a4,16(sp)
2000643e:	8185                	srl	a1,a1,0x1
20006440:	ceae                	sw	a1,92(sp)
20006442:	6611                	lui	a2,0x4
20006444:	167d                	add	a2,a2,-1 # 3fff <_start-0x1fffc001>
20006446:	963a                	add	a2,a2,a4
20006448:	34c05a63          	blez	a2,2000679c <__multf3+0xa44>
2000644c:	45c6                	lw	a1,80(sp)
2000644e:	46f6                	lw	a3,92(sp)
20006450:	0075f513          	and	a0,a1,7
20006454:	c129                	beqz	a0,20006496 <__multf3+0x73e>
20006456:	48b2                	lw	a7,12(sp)
20006458:	4809                	li	a6,2
2000645a:	4556                	lw	a0,84(sp)
2000645c:	00146413          	or	s0,s0,1
20006460:	6f088963          	beq	a7,a6,20006b52 <__multf3+0xdfa>
20006464:	480d                	li	a6,3
20006466:	5b088d63          	beq	a7,a6,20006a20 <__multf3+0xcc8>
2000646a:	02089663          	bnez	a7,20006496 <__multf3+0x73e>
2000646e:	00f5f813          	and	a6,a1,15
20006472:	4891                	li	a7,4
20006474:	03180163          	beq	a6,a7,20006496 <__multf3+0x73e>
20006478:	48e6                	lw	a7,88(sp)
2000647a:	0591                	add	a1,a1,4
2000647c:	0045b813          	sltiu	a6,a1,4
20006480:	9542                	add	a0,a0,a6
20006482:	01053833          	sltu	a6,a0,a6
20006486:	9846                	add	a6,a6,a7
20006488:	011838b3          	sltu	a7,a6,a7
2000648c:	96c6                	add	a3,a3,a7
2000648e:	c8ae                	sw	a1,80(sp)
20006490:	caaa                	sw	a0,84(sp)
20006492:	ccc2                	sw	a6,88(sp)
20006494:	ceb6                	sw	a3,92(sp)
20006496:	00b69593          	sll	a1,a3,0xb
2000649a:	0005d963          	bgez	a1,200064ac <__multf3+0x754>
2000649e:	fff00637          	lui	a2,0xfff00
200064a2:	167d                	add	a2,a2,-1 # ffefffff <dummy_file+0xc9ebdbbf>
200064a4:	8ef1                	and	a3,a3,a2
200064a6:	6611                	lui	a2,0x4
200064a8:	ceb6                	sw	a3,92(sp)
200064aa:	963a                	add	a2,a2,a4
200064ac:	4546                	lw	a0,80(sp)
200064ae:	0898                	add	a4,sp,80
200064b0:	05c10893          	add	a7,sp,92
200064b4:	00355813          	srl	a6,a0,0x3
200064b8:	4348                	lw	a0,4(a4)
200064ba:	0711                	add	a4,a4,4
200064bc:	01d51593          	sll	a1,a0,0x1d
200064c0:	0105e5b3          	or	a1,a1,a6
200064c4:	feb72e23          	sw	a1,-4(a4)
200064c8:	ff1716e3          	bne	a4,a7,200064b4 <__multf3+0x75c>
200064cc:	65a1                	lui	a1,0x8
200064ce:	15f9                	add	a1,a1,-2 # 7ffe <_start-0x1fff8002>
200064d0:	6721                	lui	a4,0x8
200064d2:	4ec5c963          	blt	a1,a2,200069c4 <__multf3+0xc6c>
200064d6:	177d                	add	a4,a4,-1 # 7fff <_start-0x1fff8001>
200064d8:	8f71                	and	a4,a4,a2
200064da:	828d                	srl	a3,a3,0x3
200064dc:	06c2                	sll	a3,a3,0x10
200064de:	0742                	sll	a4,a4,0x10
200064e0:	4646                	lw	a2,80(sp)
200064e2:	45d6                	lw	a1,84(sp)
200064e4:	4566                	lw	a0,88(sp)
200064e6:	82c1                	srl	a3,a3,0x10
200064e8:	8341                	srl	a4,a4,0x10
200064ea:	a069                	j	20006574 <__multf3+0x81c>
200064ec:	8f41                	or	a4,a4,s0
200064ee:	01076733          	or	a4,a4,a6
200064f2:	8f49                	or	a4,a4,a0
200064f4:	26071763          	bnez	a4,20006762 <__multf3+0xa0a>
200064f8:	4c21                	li	s8,8
200064fa:	8936                	mv	s2,a3
200064fc:	4c89                	li	s9,2
200064fe:	4401                	li	s0,0
20006500:	b8c5                	j	20005df0 <__multf3+0x98>
20006502:	015b6ab3          	or	s5,s6,s5
20006506:	017aeab3          	or	s5,s5,s7
2000650a:	00aaeab3          	or	s5,s5,a0
2000650e:	974a                	add	a4,a4,s2
20006510:	240a8463          	beqz	s5,20006758 <__multf3+0xa00>
20006514:	0542                	sll	a0,a0,0x10
20006516:	8541                	sra	a0,a0,0x10
20006518:	003c6c13          	or	s8,s8,3
2000651c:	00054363          	bltz	a0,20006522 <__multf3+0x7ca>
20006520:	4441                	li	s0,16
20006522:	6621                	lui	a2,0x8
20006524:	0149c7b3          	xor	a5,s3,s4
20006528:	964a                	add	a2,a2,s2
2000652a:	46a9                	li	a3,10
2000652c:	c43e                	sw	a5,8(sp)
2000652e:	c832                	sw	a2,16(sp)
20006530:	1f86c063          	blt	a3,s8,20006710 <__multf3+0x9b8>
20006534:	4685                	li	a3,1
20006536:	018696b3          	sll	a3,a3,s8
2000653a:	5306f593          	and	a1,a3,1328
2000653e:	460d                	li	a2,3
20006540:	920588e3          	beqz	a1,20005e70 <__multf3+0x118>
20006544:	5752                	lw	a4,52(sp)
20006546:	57f2                	lw	a5,60(sp)
20006548:	8666                	mv	a2,s9
2000654a:	caba                	sw	a4,84(sp)
2000654c:	5742                	lw	a4,48(sp)
2000654e:	c8ba                	sw	a4,80(sp)
20006550:	5762                	lw	a4,56(sp)
20006552:	ccba                	sw	a4,88(sp)
20006554:	cebe                	sw	a5,92(sp)
20006556:	4789                	li	a5,2
20006558:	1af60463          	beq	a2,a5,20006700 <__multf3+0x9a8>
2000655c:	478d                	li	a5,3
2000655e:	1af60d63          	beq	a2,a5,20006718 <__multf3+0x9c0>
20006562:	4785                	li	a5,1
20006564:	44f61d63          	bne	a2,a5,200069be <__multf3+0xc66>
20006568:	47a2                	lw	a5,8(sp)
2000656a:	4701                	li	a4,0
2000656c:	4681                	li	a3,0
2000656e:	4501                	li	a0,0
20006570:	4581                	li	a1,0
20006572:	4601                	li	a2,0
20006574:	07be                	sll	a5,a5,0xf
20006576:	8fd9                	or	a5,a5,a4
20006578:	06d11623          	sh	a3,108(sp)
2000657c:	06f11723          	sh	a5,110(sp)
20006580:	57b6                	lw	a5,108(sp)
20006582:	38041d63          	bnez	s0,2000691c <__multf3+0xbc4>
20006586:	50fa                	lw	ra,188(sp)
20006588:	546a                	lw	s0,184(sp)
2000658a:	c488                	sw	a0,8(s1)
2000658c:	c090                	sw	a2,0(s1)
2000658e:	c0cc                	sw	a1,4(s1)
20006590:	c4dc                	sw	a5,12(s1)
20006592:	594a                	lw	s2,176(sp)
20006594:	59ba                	lw	s3,172(sp)
20006596:	5a2a                	lw	s4,168(sp)
20006598:	5a9a                	lw	s5,164(sp)
2000659a:	5b0a                	lw	s6,160(sp)
2000659c:	4bfa                	lw	s7,156(sp)
2000659e:	4c6a                	lw	s8,152(sp)
200065a0:	4cda                	lw	s9,148(sp)
200065a2:	8526                	mv	a0,s1
200065a4:	54da                	lw	s1,180(sp)
200065a6:	6129                	add	sp,sp,192
200065a8:	8082                	ret
200065aa:	015b67b3          	or	a5,s6,s5
200065ae:	0177e7b3          	or	a5,a5,s7
200065b2:	8fc9                	or	a5,a5,a0
200065b4:	18078c63          	beqz	a5,2000674c <__multf3+0x9f4>
200065b8:	3a050c63          	beqz	a0,20006970 <__multf3+0xc18>
200065bc:	1a3020ef          	jal	20008f5e <__clzsi2>
200065c0:	ff450813          	add	a6,a0,-12
200065c4:	02000313          	li	t1,32
200065c8:	41030333          	sub	t1,t1,a6
200065cc:	4681                	li	a3,0
200065ce:	010b1b33          	sll	s6,s6,a6
200065d2:	40d008b3          	neg	a7,a3
200065d6:	088a                	sll	a7,a7,0x2
200065d8:	0090                	add	a2,sp,64
200065da:	01160733          	add	a4,a2,a7
200065de:	458d                	li	a1,3
200065e0:	411008b3          	neg	a7,a7
200065e4:	475c                	lw	a5,12(a4)
200065e6:	00872e03          	lw	t3,8(a4)
200065ea:	01170eb3          	add	t4,a4,a7
200065ee:	010797b3          	sll	a5,a5,a6
200065f2:	006e5e33          	srl	t3,t3,t1
200065f6:	01c7e7b3          	or	a5,a5,t3
200065fa:	00fea623          	sw	a5,12(t4)
200065fe:	15fd                	add	a1,a1,-1
20006600:	1771                	add	a4,a4,-4
20006602:	feb6c1e3          	blt	a3,a1,200065e4 <__multf3+0x88c>
20006606:	00269713          	sll	a4,a3,0x2
2000660a:	05070793          	add	a5,a4,80
2000660e:	1818                	add	a4,sp,48
20006610:	973e                	add	a4,a4,a5
20006612:	fd672023          	sw	s6,-64(a4)
20006616:	fff68793          	add	a5,a3,-1
2000661a:	577d                	li	a4,-1
2000661c:	02e78263          	beq	a5,a4,20006640 <__multf3+0x8e8>
20006620:	0785                	add	a5,a5,1
20006622:	078a                	sll	a5,a5,0x2
20006624:	46a1                	li	a3,8
20006626:	8732                	mv	a4,a2
20006628:	00d7e763          	bltu	a5,a3,20006636 <__multf3+0x8de>
2000662c:	c082                	sw	zero,64(sp)
2000662e:	00062223          	sw	zero,4(a2) # 8004 <_start-0x1fff7ffc>
20006632:	17e1                	add	a5,a5,-8
20006634:	00b8                	add	a4,sp,72
20006636:	4691                	li	a3,4
20006638:	00d7e463          	bltu	a5,a3,20006640 <__multf3+0x8e8>
2000663c:	00072023          	sw	zero,0(a4)
20006640:	7771                	lui	a4,0xffffc
20006642:	0745                	add	a4,a4,17 # ffffc011 <dummy_file+0xc9fb9bd1>
20006644:	8f09                	sub	a4,a4,a0
20006646:	974a                	add	a4,a4,s2
20006648:	00170693          	add	a3,a4,1
2000664c:	47a9                	li	a5,10
2000664e:	c836                	sw	a3,16(sp)
20006650:	4601                	li	a2,0
20006652:	8187d2e3          	bge	a5,s8,20005e56 <__multf3+0xfe>
20006656:	c44e                	sw	s3,8(sp)
20006658:	b5f5                	j	20006544 <__multf3+0x7ec>
2000665a:	00e467b3          	or	a5,s0,a4
2000665e:	0107e7b3          	or	a5,a5,a6
20006662:	8fc9                	or	a5,a5,a0
20006664:	cff1                	beqz	a5,20006740 <__multf3+0x9e8>
20006666:	2a050e63          	beqz	a0,20006922 <__multf3+0xbca>
2000666a:	0f5020ef          	jal	20008f5e <__clzsi2>
2000666e:	ff450813          	add	a6,a0,-12
20006672:	02000313          	li	t1,32
20006676:	41030333          	sub	t1,t1,a6
2000667a:	4681                	li	a3,0
2000667c:	01041433          	sll	s0,s0,a6
20006680:	40d008b3          	neg	a7,a3
20006684:	088a                	sll	a7,a7,0x2
20006686:	1810                	add	a2,sp,48
20006688:	01160733          	add	a4,a2,a7
2000668c:	458d                	li	a1,3
2000668e:	411008b3          	neg	a7,a7
20006692:	475c                	lw	a5,12(a4)
20006694:	00872e03          	lw	t3,8(a4)
20006698:	01170eb3          	add	t4,a4,a7
2000669c:	010797b3          	sll	a5,a5,a6
200066a0:	006e5e33          	srl	t3,t3,t1
200066a4:	01c7e7b3          	or	a5,a5,t3
200066a8:	00fea623          	sw	a5,12(t4)
200066ac:	15fd                	add	a1,a1,-1
200066ae:	1771                	add	a4,a4,-4
200066b0:	feb6c1e3          	blt	a3,a1,20006692 <__multf3+0x93a>
200066b4:	00269713          	sll	a4,a3,0x2
200066b8:	05070793          	add	a5,a4,80
200066bc:	1818                	add	a4,sp,48
200066be:	973e                	add	a4,a4,a5
200066c0:	fa872823          	sw	s0,-80(a4)
200066c4:	fff68793          	add	a5,a3,-1
200066c8:	577d                	li	a4,-1
200066ca:	02e78263          	beq	a5,a4,200066ee <__multf3+0x996>
200066ce:	0785                	add	a5,a5,1
200066d0:	078a                	sll	a5,a5,0x2
200066d2:	46a1                	li	a3,8
200066d4:	8732                	mv	a4,a2
200066d6:	00d7e763          	bltu	a5,a3,200066e4 <__multf3+0x98c>
200066da:	d802                	sw	zero,48(sp)
200066dc:	00062223          	sw	zero,4(a2)
200066e0:	17e1                	add	a5,a5,-8
200066e2:	1838                	add	a4,sp,56
200066e4:	4691                	li	a3,4
200066e6:	00d7e463          	bltu	a5,a3,200066ee <__multf3+0x996>
200066ea:	00072023          	sw	zero,0(a4)
200066ee:	76f1                	lui	a3,0xffffc
200066f0:	06c5                	add	a3,a3,17 # ffffc011 <dummy_file+0xc9fb9bd1>
200066f2:	40a68933          	sub	s2,a3,a0
200066f6:	4c01                	li	s8,0
200066f8:	4c81                	li	s9,0
200066fa:	4401                	li	s0,0
200066fc:	ef4ff06f          	j	20005df0 <__multf3+0x98>
20006700:	6721                	lui	a4,0x8
20006702:	47a2                	lw	a5,8(sp)
20006704:	177d                	add	a4,a4,-1 # 7fff <_start-0x1fff8001>
20006706:	4681                	li	a3,0
20006708:	4501                	li	a0,0
2000670a:	4581                	li	a1,0
2000670c:	4601                	li	a2,0
2000670e:	b59d                	j	20006574 <__multf3+0x81c>
20006710:	47bd                	li	a5,15
20006712:	460d                	li	a2,3
20006714:	06fc1b63          	bne	s8,a5,2000678a <__multf3+0xa32>
20006718:	6721                	lui	a4,0x8
2000671a:	4781                	li	a5,0
2000671c:	177d                	add	a4,a4,-1 # 7fff <_start-0x1fff8001>
2000671e:	66a1                	lui	a3,0x8
20006720:	4501                	li	a0,0
20006722:	4581                	li	a1,0
20006724:	4601                	li	a2,0
20006726:	b5b9                	j	20006574 <__multf3+0x81c>
20006728:	1c7d                	add	s8,s8,-1
2000672a:	4685                	li	a3,1
2000672c:	f586ea63          	bltu	a3,s8,20005e80 <__multf3+0x128>
20006730:	4716                	lw	a4,68(sp)
20006732:	47b6                	lw	a5,76(sp)
20006734:	caba                	sw	a4,84(sp)
20006736:	4706                	lw	a4,64(sp)
20006738:	c8ba                	sw	a4,80(sp)
2000673a:	4726                	lw	a4,72(sp)
2000673c:	ccba                	sw	a4,88(sp)
2000673e:	bd19                	j	20006554 <__multf3+0x7fc>
20006740:	4c11                	li	s8,4
20006742:	4901                	li	s2,0
20006744:	4c85                	li	s9,1
20006746:	4401                	li	s0,0
20006748:	ea8ff06f          	j	20005df0 <__multf3+0x98>
2000674c:	001c6c13          	or	s8,s8,1
20006750:	874a                	mv	a4,s2
20006752:	4605                	li	a2,1
20006754:	ef6ff06f          	j	20005e4a <__multf3+0xf2>
20006758:	002c6c13          	or	s8,s8,2
2000675c:	4609                	li	a2,2
2000675e:	eecff06f          	j	20005e4a <__multf3+0xf2>
20006762:	0542                	sll	a0,a0,0x10
20006764:	8541                	sra	a0,a0,0x10
20006766:	fff54413          	not	s0,a0
2000676a:	807d                	srl	s0,s0,0x1f
2000676c:	0412                	sll	s0,s0,0x4
2000676e:	4c31                	li	s8,12
20006770:	8936                	mv	s2,a3
20006772:	4c8d                	li	s9,3
20006774:	e7cff06f          	j	20005df0 <__multf3+0x98>
20006778:	6721                	lui	a4,0x8
2000677a:	4441                	li	s0,16
2000677c:	4781                	li	a5,0
2000677e:	177d                	add	a4,a4,-1 # 7fff <_start-0x1fff8001>
20006780:	66a1                	lui	a3,0x8
20006782:	4501                	li	a0,0
20006784:	4581                	li	a1,0
20006786:	4601                	li	a2,0
20006788:	b3f5                	j	20006574 <__multf3+0x81c>
2000678a:	4716                	lw	a4,68(sp)
2000678c:	47b6                	lw	a5,76(sp)
2000678e:	c452                	sw	s4,8(sp)
20006790:	caba                	sw	a4,84(sp)
20006792:	4706                	lw	a4,64(sp)
20006794:	c8ba                	sw	a4,80(sp)
20006796:	4726                	lw	a4,72(sp)
20006798:	ccba                	sw	a4,88(sp)
2000679a:	bb6d                	j	20006554 <__multf3+0x7fc>
2000679c:	12061f63          	bnez	a2,200068da <__multf3+0xb82>
200067a0:	4746                	lw	a4,80(sp)
200067a2:	48f6                	lw	a7,92(sp)
200067a4:	00777593          	and	a1,a4,7
200067a8:	86c6                	mv	a3,a7
200067aa:	cd9d                	beqz	a1,200067e8 <__multf3+0xa90>
200067ac:	4332                	lw	t1,12(sp)
200067ae:	4509                	li	a0,2
200067b0:	45d6                	lw	a1,84(sp)
200067b2:	4866                	lw	a6,88(sp)
200067b4:	00146413          	or	s0,s0,1
200067b8:	40a30363          	beq	t1,a0,20006bbe <__multf3+0xe66>
200067bc:	450d                	li	a0,3
200067be:	3ea30863          	beq	t1,a0,20006bae <__multf3+0xe56>
200067c2:	02031363          	bnez	t1,200067e8 <__multf3+0xa90>
200067c6:	00f77513          	and	a0,a4,15
200067ca:	4311                	li	t1,4
200067cc:	00650e63          	beq	a0,t1,200067e8 <__multf3+0xa90>
200067d0:	00470693          	add	a3,a4,4
200067d4:	0046b693          	sltiu	a3,a3,4
200067d8:	95b6                	add	a1,a1,a3
200067da:	00d5b5b3          	sltu	a1,a1,a3
200067de:	00b806b3          	add	a3,a6,a1
200067e2:	00b6b6b3          	sltu	a3,a3,a1
200067e6:	96c6                	add	a3,a3,a7
200067e8:	0146d813          	srl	a6,a3,0x14
200067ec:	00184813          	xor	a6,a6,1
200067f0:	00187813          	and	a6,a6,1
200067f4:	077e                	sll	a4,a4,0x1f
200067f6:	0018d893          	srl	a7,a7,0x1
200067fa:	4e0d                	li	t3,3
200067fc:	4505                	li	a0,1
200067fe:	4efd                	li	t4,31
20006800:	088c                	add	a1,sp,80
20006802:	060a                	sll	a2,a2,0x2
20006804:	002e1f93          	sll	t6,t3,0x2
20006808:	962e                	add	a2,a2,a1
2000680a:	832e                	mv	t1,a1
2000680c:	01f58f33          	add	t5,a1,t6
20006810:	4214                	lw	a3,0(a2)
20006812:	00462283          	lw	t0,4(a2)
20006816:	0311                	add	t1,t1,4
20006818:	00a6d6b3          	srl	a3,a3,a0
2000681c:	01d292b3          	sll	t0,t0,t4
20006820:	0056e6b3          	or	a3,a3,t0
20006824:	fed32e23          	sw	a3,-4(t1)
20006828:	0611                	add	a2,a2,4
2000682a:	ffe313e3          	bne	t1,t5,20006810 <__multf3+0xab8>
2000682e:	050f8693          	add	a3,t6,80
20006832:	1810                	add	a2,sp,48
20006834:	00c68fb3          	add	t6,a3,a2
20006838:	fd1fa823          	sw	a7,-48(t6)
2000683c:	001e0693          	add	a3,t3,1
20006840:	4611                	li	a2,4
20006842:	48c6                	lw	a7,80(sp)
20006844:	02c68563          	beq	a3,a2,2000686e <__multf3+0xb16>
20006848:	4611                	li	a2,4
2000684a:	8e15                	sub	a2,a2,a3
2000684c:	060a                	sll	a2,a2,0x2
2000684e:	068a                	sll	a3,a3,0x2
20006850:	4521                	li	a0,8
20006852:	96ae                	add	a3,a3,a1
20006854:	00a66863          	bltu	a2,a0,20006864 <__multf3+0xb0c>
20006858:	0006a023          	sw	zero,0(a3) # 8000 <_start-0x1fff8000>
2000685c:	0006a223          	sw	zero,4(a3)
20006860:	1661                	add	a2,a2,-8
20006862:	06a1                	add	a3,a3,8
20006864:	4511                	li	a0,4
20006866:	00a66463          	bltu	a2,a0,2000686e <__multf3+0xb16>
2000686a:	0006a023          	sw	zero,0(a3)
2000686e:	00e03733          	snez	a4,a4
20006872:	01176733          	or	a4,a4,a7
20006876:	c8ba                	sw	a4,80(sp)
20006878:	00777613          	and	a2,a4,7
2000687c:	46f6                	lw	a3,92(sp)
2000687e:	c221                	beqz	a2,200068be <__multf3+0xb66>
20006880:	4532                	lw	a0,12(sp)
20006882:	4609                	li	a2,2
20006884:	00146413          	or	s0,s0,1
20006888:	30c50f63          	beq	a0,a2,20006ba6 <__multf3+0xe4e>
2000688c:	460d                	li	a2,3
2000688e:	30c50363          	beq	a0,a2,20006b94 <__multf3+0xe3c>
20006892:	e515                	bnez	a0,200068be <__multf3+0xb66>
20006894:	00f77613          	and	a2,a4,15
20006898:	4511                	li	a0,4
2000689a:	02a60263          	beq	a2,a0,200068be <__multf3+0xb66>
2000689e:	4656                	lw	a2,84(sp)
200068a0:	48e6                	lw	a7,88(sp)
200068a2:	0711                	add	a4,a4,4
200068a4:	00473513          	sltiu	a0,a4,4
200068a8:	9532                	add	a0,a0,a2
200068aa:	00c53633          	sltu	a2,a0,a2
200068ae:	9646                	add	a2,a2,a7
200068b0:	011638b3          	sltu	a7,a2,a7
200068b4:	96c6                	add	a3,a3,a7
200068b6:	c8ba                	sw	a4,80(sp)
200068b8:	caaa                	sw	a0,84(sp)
200068ba:	ccb2                	sw	a2,88(sp)
200068bc:	ceb6                	sw	a3,92(sp)
200068be:	00c69713          	sll	a4,a3,0xc
200068c2:	1e075263          	bgez	a4,20006aa6 <__multf3+0xd4e>
200068c6:	00146413          	or	s0,s0,1
200068ca:	28081a63          	bnez	a6,20006b5e <__multf3+0xe06>
200068ce:	4805                	li	a6,1
200068d0:	4681                	li	a3,0
200068d2:	4501                	li	a0,0
200068d4:	4581                	li	a1,0
200068d6:	4601                	li	a2,0
200068d8:	a03d                	j	20006906 <__multf3+0xbae>
200068da:	4705                	li	a4,1
200068dc:	40c70633          	sub	a2,a4,a2
200068e0:	07400693          	li	a3,116
200068e4:	14c6dd63          	bge	a3,a2,20006a3e <__multf3+0xce6>
200068e8:	46d6                	lw	a3,84(sp)
200068ea:	4646                	lw	a2,80(sp)
200068ec:	8e55                	or	a2,a2,a3
200068ee:	46e6                	lw	a3,88(sp)
200068f0:	8e55                	or	a2,a2,a3
200068f2:	46f6                	lw	a3,92(sp)
200068f4:	8e55                	or	a2,a2,a3
200068f6:	10061663          	bnez	a2,20006a02 <__multf3+0xcaa>
200068fa:	00246413          	or	s0,s0,2
200068fe:	4801                	li	a6,0
20006900:	4681                	li	a3,0
20006902:	4501                	li	a0,0
20006904:	4581                	li	a1,0
20006906:	01069713          	sll	a4,a3,0x10
2000690a:	8341                	srl	a4,a4,0x10
2000690c:	0842                	sll	a6,a6,0x10
2000690e:	06d11623          	sh	a3,108(sp)
20006912:	01f79693          	sll	a3,a5,0x1f
20006916:	010767b3          	or	a5,a4,a6
2000691a:	8fd5                	or	a5,a5,a3
2000691c:	00142073          	csrs	fflags,s0
20006920:	b19d                	j	20006586 <__multf3+0x82e>
20006922:	0c081a63          	bnez	a6,200069f6 <__multf3+0xc9e>
20006926:	1e070763          	beqz	a4,20006b14 <__multf3+0xdbc>
2000692a:	853a                	mv	a0,a4
2000692c:	632020ef          	jal	20008f5e <__clzsi2>
20006930:	04050513          	add	a0,a0,64
20006934:	ff450793          	add	a5,a0,-12
20006938:	01f7f813          	and	a6,a5,31
2000693c:	4057d693          	sra	a3,a5,0x5
20006940:	2a081a63          	bnez	a6,20006bf4 <__multf3+0xe9c>
20006944:	40d00733          	neg	a4,a3
20006948:	070a                	sll	a4,a4,0x2
2000694a:	00c70793          	add	a5,a4,12
2000694e:	1810                	add	a2,sp,48
20006950:	97b2                	add	a5,a5,a2
20006952:	40e00733          	neg	a4,a4
20006956:	0007a883          	lw	a7,0(a5)
2000695a:	00e78833          	add	a6,a5,a4
2000695e:	85be                	mv	a1,a5
20006960:	01182023          	sw	a7,0(a6)
20006964:	17f1                	add	a5,a5,-4
20006966:	feb618e3          	bne	a2,a1,20006956 <__multf3+0xbfe>
2000696a:	fff68793          	add	a5,a3,-1
2000696e:	bba9                	j	200066c8 <__multf3+0x970>
20006970:	060b9d63          	bnez	s7,200069ea <__multf3+0xc92>
20006974:	160a8963          	beqz	s5,20006ae6 <__multf3+0xd8e>
20006978:	8556                	mv	a0,s5
2000697a:	5e4020ef          	jal	20008f5e <__clzsi2>
2000697e:	04050513          	add	a0,a0,64
20006982:	ff450793          	add	a5,a0,-12
20006986:	01f7f813          	and	a6,a5,31
2000698a:	4057d693          	sra	a3,a5,0x5
2000698e:	24081c63          	bnez	a6,20006be6 <__multf3+0xe8e>
20006992:	40d00733          	neg	a4,a3
20006996:	070a                	sll	a4,a4,0x2
20006998:	00c70793          	add	a5,a4,12
2000699c:	0090                	add	a2,sp,64
2000699e:	97b2                	add	a5,a5,a2
200069a0:	40e00733          	neg	a4,a4
200069a4:	0007a883          	lw	a7,0(a5)
200069a8:	00e78833          	add	a6,a5,a4
200069ac:	85be                	mv	a1,a5
200069ae:	01182023          	sw	a7,0(a6)
200069b2:	17f1                	add	a5,a5,-4
200069b4:	feb618e3          	bne	a2,a1,200069a4 <__multf3+0xc4c>
200069b8:	fff68793          	add	a5,a3,-1
200069bc:	b9b9                	j	2000661a <__multf3+0x8c2>
200069be:	47a2                	lw	a5,8(sp)
200069c0:	4742                	lw	a4,16(sp)
200069c2:	b441                	j	20006442 <__multf3+0x6ea>
200069c4:	4632                	lw	a2,12(sp)
200069c6:	4689                	li	a3,2
200069c8:	0cd60863          	beq	a2,a3,20006a98 <__multf3+0xd40>
200069cc:	468d                	li	a3,3
200069ce:	06d60163          	beq	a2,a3,20006a30 <__multf3+0xcd8>
200069d2:	e669                	bnez	a2,20006a9c <__multf3+0xd44>
200069d4:	fff70813          	add	a6,a4,-1
200069d8:	4681                	li	a3,0
200069da:	00546413          	or	s0,s0,5
200069de:	8532                	mv	a0,a2
200069e0:	85b2                	mv	a1,a2
200069e2:	b715                	j	20006906 <__multf3+0xbae>
200069e4:	4d4a                	lw	s10,144(sp)
200069e6:	4dba                	lw	s11,140(sp)
200069e8:	bca9                	j	20006442 <__multf3+0x6ea>
200069ea:	855e                	mv	a0,s7
200069ec:	572020ef          	jal	20008f5e <__clzsi2>
200069f0:	02050513          	add	a0,a0,32
200069f4:	b779                	j	20006982 <__multf3+0xc2a>
200069f6:	8542                	mv	a0,a6
200069f8:	566020ef          	jal	20008f5e <__clzsi2>
200069fc:	02050513          	add	a0,a0,32
20006a00:	bf15                	j	20006934 <__multf3+0xbdc>
20006a02:	45b2                	lw	a1,12(sp)
20006a04:	4689                	li	a3,2
20006a06:	4622                	lw	a2,8(sp)
20006a08:	00146413          	or	s0,s0,1
20006a0c:	eed587e3          	beq	a1,a3,200068fa <__multf3+0xba2>
20006a10:	468d                	li	a3,3
20006a12:	4601                	li	a2,0
20006a14:	eed593e3          	bne	a1,a3,200068fa <__multf3+0xba2>
20006a18:	46a2                	lw	a3,8(sp)
20006a1a:	40d70633          	sub	a2,a4,a3
20006a1e:	bdf1                	j	200068fa <__multf3+0xba2>
20006a20:	4822                	lw	a6,8(sp)
20006a22:	a6081ae3          	bnez	a6,20006496 <__multf3+0x73e>
20006a26:	05a1                	add	a1,a1,8
20006a28:	48e6                	lw	a7,88(sp)
20006a2a:	0085b813          	sltiu	a6,a1,8
20006a2e:	bc89                	j	20006480 <__multf3+0x728>
20006a30:	46a2                	lw	a3,8(sp)
20006a32:	e6ad                	bnez	a3,20006a9c <__multf3+0xd44>
20006a34:	fff70813          	add	a6,a4,-1
20006a38:	4681                	li	a3,0
20006a3a:	4601                	li	a2,0
20006a3c:	bf79                	j	200069da <__multf3+0xc82>
20006a3e:	01f67513          	and	a0,a2,31
20006a42:	02000e93          	li	t4,32
20006a46:	8615                	sra	a2,a2,0x5
20006a48:	40ae8eb3          	sub	t4,t4,a0
20006a4c:	18060963          	beqz	a2,20006bde <__multf3+0xe86>
20006a50:	088c                	add	a1,sp,80
20006a52:	00261893          	sll	a7,a2,0x2
20006a56:	86ae                	mv	a3,a1
20006a58:	98ae                	add	a7,a7,a1
20006a5a:	4701                	li	a4,0
20006a5c:	0006a803          	lw	a6,0(a3)
20006a60:	0691                	add	a3,a3,4
20006a62:	01076733          	or	a4,a4,a6
20006a66:	fed89be3          	bne	a7,a3,20006a5c <__multf3+0xd04>
20006a6a:	86b2                	mv	a3,a2
20006a6c:	4e0d                	li	t3,3
20006a6e:	40ce0e33          	sub	t3,t3,a2
20006a72:	0e051e63          	bnez	a0,20006b6e <__multf3+0xe16>
20006a76:	86ae                	mv	a3,a1
20006a78:	00261893          	sll	a7,a2,0x2
20006a7c:	01168833          	add	a6,a3,a7
20006a80:	00082803          	lw	a6,0(a6)
20006a84:	0505                	add	a0,a0,1
20006a86:	0691                	add	a3,a3,4
20006a88:	ff06ae23          	sw	a6,-4(a3)
20006a8c:	feae58e3          	bge	t3,a0,20006a7c <__multf3+0xd24>
20006a90:	4691                	li	a3,4
20006a92:	8e91                	sub	a3,a3,a2
20006a94:	4805                	li	a6,1
20006a96:	b36d                	j	20006840 <__multf3+0xae8>
20006a98:	46a2                	lw	a3,8(sp)
20006a9a:	fec9                	bnez	a3,20006a34 <__multf3+0xcdc>
20006a9c:	66c1                	lui	a3,0x10
20006a9e:	882e                	mv	a6,a1
20006aa0:	16fd                	add	a3,a3,-1 # ffff <_start-0x1fff0001>
20006aa2:	567d                	li	a2,-1
20006aa4:	bf1d                	j	200069da <__multf3+0xc82>
20006aa6:	4546                	lw	a0,80(sp)
20006aa8:	872e                	mv	a4,a1
20006aaa:	05c10893          	add	a7,sp,92
20006aae:	00355593          	srl	a1,a0,0x3
20006ab2:	4348                	lw	a0,4(a4)
20006ab4:	0711                	add	a4,a4,4
20006ab6:	01d51613          	sll	a2,a0,0x1d
20006aba:	8e4d                	or	a2,a2,a1
20006abc:	fec72e23          	sw	a2,-4(a4)
20006ac0:	ff1717e3          	bne	a4,a7,20006aae <__multf3+0xd56>
20006ac4:	828d                	srl	a3,a3,0x3
20006ac6:	06c2                	sll	a3,a3,0x10
20006ac8:	4646                	lw	a2,80(sp)
20006aca:	45d6                	lw	a1,84(sp)
20006acc:	4566                	lw	a0,88(sp)
20006ace:	82c1                	srl	a3,a3,0x10
20006ad0:	08080563          	beqz	a6,20006b5a <__multf3+0xe02>
20006ad4:	00147813          	and	a6,s0,1
20006ad8:	4701                	li	a4,0
20006ada:	a8080de3          	beqz	a6,20006574 <__multf3+0x81c>
20006ade:	4801                	li	a6,0
20006ae0:	00246413          	or	s0,s0,2
20006ae4:	b50d                	j	20006906 <__multf3+0xbae>
20006ae6:	855a                	mv	a0,s6
20006ae8:	476020ef          	jal	20008f5e <__clzsi2>
20006aec:	05450793          	add	a5,a0,84
20006af0:	01f7f813          	and	a6,a5,31
20006af4:	06050513          	add	a0,a0,96
20006af8:	4057d693          	sra	a3,a5,0x5
20006afc:	e8080be3          	beqz	a6,20006992 <__multf3+0xc3a>
20006b00:	4789                	li	a5,2
20006b02:	010b1b33          	sll	s6,s6,a6
20006b06:	02f69e63          	bne	a3,a5,20006b42 <__multf3+0xdea>
20006b0a:	02000313          	li	t1,32
20006b0e:	41030333          	sub	t1,t1,a6
20006b12:	b4c1                	j	200065d2 <__multf3+0x87a>
20006b14:	8522                	mv	a0,s0
20006b16:	448020ef          	jal	20008f5e <__clzsi2>
20006b1a:	05450793          	add	a5,a0,84
20006b1e:	01f7f813          	and	a6,a5,31
20006b22:	06050513          	add	a0,a0,96
20006b26:	4057d693          	sra	a3,a5,0x5
20006b2a:	e0080de3          	beqz	a6,20006944 <__multf3+0xbec>
20006b2e:	4789                	li	a5,2
20006b30:	01041433          	sll	s0,s0,a6
20006b34:	00f69b63          	bne	a3,a5,20006b4a <__multf3+0xdf2>
20006b38:	02000313          	li	t1,32
20006b3c:	41030333          	sub	t1,t1,a6
20006b40:	b681                	j	20006680 <__multf3+0x928>
20006b42:	c6da                	sw	s6,76(sp)
20006b44:	4789                	li	a5,2
20006b46:	0090                	add	a2,sp,64
20006b48:	bce1                	j	20006620 <__multf3+0x8c8>
20006b4a:	de22                	sw	s0,60(sp)
20006b4c:	4789                	li	a5,2
20006b4e:	1810                	add	a2,sp,48
20006b50:	bebd                	j	200066ce <__multf3+0x976>
20006b52:	4822                	lw	a6,8(sp)
20006b54:	940801e3          	beqz	a6,20006496 <__multf3+0x73e>
20006b58:	b5f9                	j	20006a26 <__multf3+0xcce>
20006b5a:	4701                	li	a4,0
20006b5c:	bc21                	j	20006574 <__multf3+0x81c>
20006b5e:	4805                	li	a6,1
20006b60:	4681                	li	a3,0
20006b62:	4501                	li	a0,0
20006b64:	4581                	li	a1,0
20006b66:	4601                	li	a2,0
20006b68:	00246413          	or	s0,s0,2
20006b6c:	bb69                	j	20006906 <__multf3+0xbae>
20006b6e:	068a                	sll	a3,a3,0x2
20006b70:	03010813          	add	a6,sp,48
20006b74:	05068693          	add	a3,a3,80
20006b78:	96c2                	add	a3,a3,a6
20006b7a:	fd06a683          	lw	a3,-48(a3)
20006b7e:	48f6                	lw	a7,92(sp)
20006b80:	4805                	li	a6,1
20006b82:	01d696b3          	sll	a3,a3,t4
20006b86:	8f55                	or	a4,a4,a3
20006b88:	00a8d8b3          	srl	a7,a7,a0
20006b8c:	4685                	li	a3,1
20006b8e:	ca0e0de3          	beqz	t3,20006848 <__multf3+0xaf0>
20006b92:	b985                	j	20006802 <__multf3+0xaaa>
20006b94:	4622                	lw	a2,8(sp)
20006b96:	d20614e3          	bnez	a2,200068be <__multf3+0xb66>
20006b9a:	0721                	add	a4,a4,8
20006b9c:	4656                	lw	a2,84(sp)
20006b9e:	48e6                	lw	a7,88(sp)
20006ba0:	00873513          	sltiu	a0,a4,8
20006ba4:	b311                	j	200068a8 <__multf3+0xb50>
20006ba6:	4622                	lw	a2,8(sp)
20006ba8:	d0060be3          	beqz	a2,200068be <__multf3+0xb66>
20006bac:	b7fd                	j	20006b9a <__multf3+0xe42>
20006bae:	4522                	lw	a0,8(sp)
20006bb0:	c2051ce3          	bnez	a0,200067e8 <__multf3+0xa90>
20006bb4:	00870693          	add	a3,a4,8
20006bb8:	0086b693          	sltiu	a3,a3,8
20006bbc:	b931                	j	200067d8 <__multf3+0xa80>
20006bbe:	4522                	lw	a0,8(sp)
20006bc0:	c20504e3          	beqz	a0,200067e8 <__multf3+0xa90>
20006bc4:	00870513          	add	a0,a4,8
20006bc8:	00853513          	sltiu	a0,a0,8
20006bcc:	00a586b3          	add	a3,a1,a0
20006bd0:	00a6b6b3          	sltu	a3,a3,a0
20006bd4:	9836                	add	a6,a6,a3
20006bd6:	00d836b3          	sltu	a3,a6,a3
20006bda:	96c6                	add	a3,a3,a7
20006bdc:	b131                	j	200067e8 <__multf3+0xa90>
20006bde:	4681                	li	a3,0
20006be0:	4701                	li	a4,0
20006be2:	088c                	add	a1,sp,80
20006be4:	b561                	j	20006a6c <__multf3+0xd14>
20006be6:	02000313          	li	t1,32
20006bea:	41030333          	sub	t1,t1,a6
20006bee:	010b1b33          	sll	s6,s6,a6
20006bf2:	b2c5                	j	200065d2 <__multf3+0x87a>
20006bf4:	02000313          	li	t1,32
20006bf8:	41030333          	sub	t1,t1,a6
20006bfc:	01041433          	sll	s0,s0,a6
20006c00:	b441                	j	20006680 <__multf3+0x928>

20006c02 <__subtf3>:
20006c02:	711d                	add	sp,sp,-96
20006c04:	cca2                	sw	s0,88(sp)
20006c06:	c8ca                	sw	s2,80(sp)
20006c08:	ce86                	sw	ra,92(sp)
20006c0a:	892a                	mv	s2,a0
20006c0c:	caa6                	sw	s1,84(sp)
20006c0e:	c6ce                	sw	s3,76(sp)
20006c10:	4194                	lw	a3,0(a1)
20006c12:	41d8                	lw	a4,4(a1)
20006c14:	459c                	lw	a5,8(a1)
20006c16:	45c0                	lw	s0,12(a1)
20006c18:	00062883          	lw	a7,0(a2)
20006c1c:	00462e03          	lw	t3,4(a2)
20006c20:	00862303          	lw	t1,8(a2)
20006c24:	4648                	lw	a0,12(a2)
20006c26:	002029f3          	frrm	s3
20006c2a:	01041613          	sll	a2,s0,0x10
20006c2e:	00141493          	sll	s1,s0,0x1
20006c32:	8241                	srl	a2,a2,0x10
20006c34:	da3a                	sw	a4,52(sp)
20006c36:	de22                	sw	s0,60(sp)
20006c38:	c23a                	sw	a4,4(sp)
20006c3a:	d836                	sw	a3,48(sp)
20006c3c:	dc3e                	sw	a5,56(sp)
20006c3e:	c036                	sw	a3,0(sp)
20006c40:	c43e                	sw	a5,8(sp)
20006c42:	c632                	sw	a2,12(sp)
20006c44:	80c5                	srl	s1,s1,0x11
20006c46:	807d                	srl	s0,s0,0x1f
20006c48:	8e8a                	mv	t4,sp
20006c4a:	0078                	add	a4,sp,12
20006c4c:	00361593          	sll	a1,a2,0x3
20006c50:	ffc72603          	lw	a2,-4(a4)
20006c54:	8f3a                	mv	t5,a4
20006c56:	1771                	add	a4,a4,-4
20006c58:	01d65793          	srl	a5,a2,0x1d
20006c5c:	8fcd                	or	a5,a5,a1
20006c5e:	c35c                	sw	a5,4(a4)
20006c60:	feee96e3          	bne	t4,a4,20006c4c <__subtf3+0x4a>
20006c64:	01051593          	sll	a1,a0,0x10
20006c68:	00151813          	sll	a6,a0,0x1
20006c6c:	068e                	sll	a3,a3,0x3
20006c6e:	81c1                	srl	a1,a1,0x10
20006c70:	da72                	sw	t3,52(sp)
20006c72:	de2a                	sw	a0,60(sp)
20006c74:	ca72                	sw	t3,20(sp)
20006c76:	c036                	sw	a3,0(sp)
20006c78:	d846                	sw	a7,48(sp)
20006c7a:	dc1a                	sw	t1,56(sp)
20006c7c:	c846                	sw	a7,16(sp)
20006c7e:	cc1a                	sw	t1,24(sp)
20006c80:	ce2e                	sw	a1,28(sp)
20006c82:	01185813          	srl	a6,a6,0x11
20006c86:	817d                	srl	a0,a0,0x1f
20006c88:	01010e13          	add	t3,sp,16
20006c8c:	087c                	add	a5,sp,28
20006c8e:	00359313          	sll	t1,a1,0x3
20006c92:	ffc7a583          	lw	a1,-4(a5)
20006c96:	17f1                	add	a5,a5,-4
20006c98:	01d5d613          	srl	a2,a1,0x1d
20006c9c:	00666633          	or	a2,a2,t1
20006ca0:	c3d0                	sw	a2,4(a5)
20006ca2:	fefe16e3          	bne	t3,a5,20006c8e <__subtf3+0x8c>
20006ca6:	088e                	sll	a7,a7,0x3
20006ca8:	65a1                	lui	a1,0x8
20006caa:	c846                	sw	a7,16(sp)
20006cac:	15fd                	add	a1,a1,-1 # 7fff <_start-0x1fff8001>
20006cae:	24b80763          	beq	a6,a1,20006efc <__subtf3+0x2fa>
20006cb2:	00154613          	xor	a2,a0,1
20006cb6:	41048333          	sub	t1,s1,a6
20006cba:	16c40763          	beq	s0,a2,20006e28 <__subtf3+0x226>
20006cbe:	00604463          	bgtz	t1,20006cc6 <__subtf3+0xc4>
20006cc2:	50a0106f          	j	200081cc <__subtf3+0x15ca>
20006cc6:	4e92                	lw	t4,4(sp)
20006cc8:	4f22                	lw	t5,8(sp)
20006cca:	4732                	lw	a4,12(sp)
20006ccc:	32080363          	beqz	a6,20006ff2 <__subtf3+0x3f0>
20006cd0:	5cb48ee3          	beq	s1,a1,20007aac <__subtf3+0xeaa>
20006cd4:	4572                	lw	a0,28(sp)
20006cd6:	000805b7          	lui	a1,0x80
20006cda:	07400613          	li	a2,116
20006cde:	8d4d                	or	a0,a0,a1
20006ce0:	ce2a                	sw	a0,28(sp)
20006ce2:	32665d63          	bge	a2,t1,2000701c <__subtf3+0x41a>
20006ce6:	4801                	li	a6,0
20006ce8:	4581                	li	a1,0
20006cea:	4881                	li	a7,0
20006cec:	4785                	li	a5,1
20006cee:	40f687b3          	sub	a5,a3,a5
20006cf2:	411e8633          	sub	a2,t4,a7
20006cf6:	00f6b533          	sltu	a0,a3,a5
20006cfa:	00ceb333          	sltu	t1,t4,a2
20006cfe:	86be                	mv	a3,a5
20006d00:	8e1a                	mv	t3,t1
20006d02:	40a607b3          	sub	a5,a2,a0
20006d06:	c119                	beqz	a0,20006d0c <__subtf3+0x10a>
20006d08:	63d88e63          	beq	a7,t4,20007344 <__subtf3+0x742>
20006d0c:	40bf08b3          	sub	a7,t5,a1
20006d10:	011f3633          	sltu	a2,t5,a7
20006d14:	41c888b3          	sub	a7,a7,t3
20006d18:	62031c63          	bnez	t1,20007350 <__subtf3+0x74e>
20006d1c:	9642                	add	a2,a2,a6
20006d1e:	8f11                	sub	a4,a4,a2
20006d20:	d23e                	sw	a5,36(sp)
20006d22:	d63a                	sw	a4,44(sp)
20006d24:	d446                	sw	a7,40(sp)
20006d26:	d036                	sw	a3,32(sp)
20006d28:	00c71793          	sll	a5,a4,0xc
20006d2c:	5007c863          	bltz	a5,2000723c <__subtf3+0x63a>
20006d30:	101c                	add	a5,sp,32
20006d32:	02c10893          	add	a7,sp,44
20006d36:	0076f613          	and	a2,a3,7
20006d3a:	4805                	li	a6,1
20006d3c:	e219                	bnez	a2,20006d42 <__subtf3+0x140>
20006d3e:	4b00106f          	j	200081ee <__subtf3+0x15ec>
20006d42:	4609                	li	a2,2
20006d44:	64c98a63          	beq	s3,a2,20007398 <__subtf3+0x796>
20006d48:	460d                	li	a2,3
20006d4a:	60c98f63          	beq	s3,a2,20007368 <__subtf3+0x766>
20006d4e:	02099c63          	bnez	s3,20006d86 <__subtf3+0x184>
20006d52:	00f6f613          	and	a2,a3,15
20006d56:	4591                	li	a1,4
20006d58:	4301                	li	t1,0
20006d5a:	02b60663          	beq	a2,a1,20006d86 <__subtf3+0x184>
20006d5e:	5612                	lw	a2,36(sp)
20006d60:	0691                	add	a3,a3,4
20006d62:	5522                	lw	a0,40(sp)
20006d64:	0046b593          	sltiu	a1,a3,4
20006d68:	95b2                	add	a1,a1,a2
20006d6a:	00c5b633          	sltu	a2,a1,a2
20006d6e:	962a                	add	a2,a2,a0
20006d70:	00a63533          	sltu	a0,a2,a0
20006d74:	972a                	add	a4,a4,a0
20006d76:	d036                	sw	a3,32(sp)
20006d78:	d22e                	sw	a1,36(sp)
20006d7a:	d432                	sw	a2,40(sp)
20006d7c:	d63a                	sw	a4,44(sp)
20006d7e:	00030463          	beqz	t1,20006d86 <__subtf3+0x184>
20006d82:	00286813          	or	a6,a6,2
20006d86:	000806b7          	lui	a3,0x80
20006d8a:	8ef9                	and	a3,a3,a4
20006d8c:	46068c63          	beqz	a3,20007204 <__subtf3+0x602>
20006d90:	66a1                	lui	a3,0x8
20006d92:	0485                	add	s1,s1,1
20006d94:	16fd                	add	a3,a3,-1 # 7fff <_start-0x1fff8001>
20006d96:	5cd49363          	bne	s1,a3,2000735c <__subtf3+0x75a>
20006d9a:	54098763          	beqz	s3,200072e8 <__subtf3+0x6e6>
20006d9e:	470d                	li	a4,3
20006da0:	54e98263          	beq	s3,a4,200072e4 <__subtf3+0x6e2>
20006da4:	4709                	li	a4,2
20006da6:	3ee98ae3          	beq	s3,a4,2000799a <__subtf3+0xd98>
20006daa:	64a1                	lui	s1,0x8
20006dac:	14f9                	add	s1,s1,-2 # 7ffe <_start-0x1fff8002>
20006dae:	20000737          	lui	a4,0x20000
20006db2:	56fd                	li	a3,-1
20006db4:	fff70593          	add	a1,a4,-1 # 1fffffff <_start-0x1>
20006db8:	8626                	mv	a2,s1
20006dba:	d636                	sw	a3,44(sp)
20006dbc:	d436                	sw	a3,40(sp)
20006dbe:	d236                	sw	a3,36(sp)
20006dc0:	d036                	sw	a3,32(sp)
20006dc2:	00586813          	or	a6,a6,5
20006dc6:	5682                	lw	a3,32(sp)
20006dc8:	0036d513          	srl	a0,a3,0x3
20006dcc:	43d4                	lw	a3,4(a5)
20006dce:	0791                	add	a5,a5,4
20006dd0:	01d69713          	sll	a4,a3,0x1d
20006dd4:	8f49                	or	a4,a4,a0
20006dd6:	fee7ae23          	sw	a4,-4(a5)
20006dda:	ff1797e3          	bne	a5,a7,20006dc8 <__subtf3+0x1c6>
20006dde:	67a1                	lui	a5,0x8
20006de0:	17fd                	add	a5,a5,-1 # 7fff <_start-0x1fff8001>
20006de2:	5682                	lw	a3,32(sp)
20006de4:	5892                	lw	a7,36(sp)
20006de6:	5522                	lw	a0,40(sp)
20006de8:	42f48463          	beq	s1,a5,20007210 <__subtf3+0x60e>
20006dec:	01059713          	sll	a4,a1,0x10
20006df0:	8341                	srl	a4,a4,0x10
20006df2:	8805                	and	s0,s0,1
20006df4:	043e                	sll	s0,s0,0xf
20006df6:	008667b3          	or	a5,a2,s0
20006dfa:	02e11e23          	sh	a4,60(sp)
20006dfe:	02f11f23          	sh	a5,62(sp)
20006e02:	57f2                	lw	a5,60(sp)
20006e04:	42081963          	bnez	a6,20007236 <__subtf3+0x634>
20006e08:	40f6                	lw	ra,92(sp)
20006e0a:	4466                	lw	s0,88(sp)
20006e0c:	00a92423          	sw	a0,8(s2)
20006e10:	00d92023          	sw	a3,0(s2)
20006e14:	01192223          	sw	a7,4(s2)
20006e18:	00f92623          	sw	a5,12(s2)
20006e1c:	44d6                	lw	s1,84(sp)
20006e1e:	49b6                	lw	s3,76(sp)
20006e20:	854a                	mv	a0,s2
20006e22:	4946                	lw	s2,80(sp)
20006e24:	6125                	add	sp,sp,96
20006e26:	8082                	ret
20006e28:	00604463          	bgtz	t1,20006e30 <__subtf3+0x22e>
20006e2c:	3aa0106f          	j	200081d6 <__subtf3+0x15d4>
20006e30:	4f92                	lw	t6,4(sp)
20006e32:	4ea2                	lw	t4,8(sp)
20006e34:	4732                	lw	a4,12(sp)
20006e36:	34081763          	bnez	a6,20007184 <__subtf3+0x582>
20006e3a:	4652                	lw	a2,20(sp)
20006e3c:	42e2                	lw	t0,24(sp)
20006e3e:	4572                	lw	a0,28(sp)
20006e40:	00566f33          	or	t5,a2,t0
20006e44:	00af6f33          	or	t5,t5,a0
20006e48:	011f6f33          	or	t5,t5,a7
20006e4c:	480f0ce3          	beqz	t5,20007ae4 <__subtf3+0xee2>
20006e50:	fff30f13          	add	t5,t1,-1
20006e54:	300f08e3          	beqz	t5,20007964 <__subtf3+0xd62>
20006e58:	4eb300e3          	beq	t1,a1,20007b38 <__subtf3+0xf36>
20006e5c:	07400613          	li	a2,116
20006e60:	33e64d63          	blt	a2,t5,2000719a <__subtf3+0x598>
20006e64:	837a                	mv	t1,t5
20006e66:	40535293          	sra	t0,t1,0x5
20006e6a:	01f37313          	and	t1,t1,31
20006e6e:	320289e3          	beqz	t0,200079a0 <__subtf3+0xd9e>
20006e72:	00229893          	sll	a7,t0,0x2
20006e76:	00f88f33          	add	t5,a7,a5
20006e7a:	863e                	mv	a2,a5
20006e7c:	4801                	li	a6,0
20006e7e:	420c                	lw	a1,0(a2)
20006e80:	0611                	add	a2,a2,4
20006e82:	00b86833          	or	a6,a6,a1
20006e86:	ffe61ce3          	bne	a2,t5,20006e7e <__subtf3+0x27c>
20006e8a:	460d                	li	a2,3
20006e8c:	40560633          	sub	a2,a2,t0
20006e90:	0e0305e3          	beqz	t1,2000777a <__subtf3+0xb78>
20006e94:	04088593          	add	a1,a7,64
20006e98:	958a                	add	a1,a1,sp
20006e9a:	fd05a583          	lw	a1,-48(a1) # 7ffd0 <_start-0x1ff80030>
20006e9e:	02000393          	li	t2,32
20006ea2:	406383b3          	sub	t2,t2,t1
20006ea6:	007595b3          	sll	a1,a1,t2
20006eaa:	00b86833          	or	a6,a6,a1
20006eae:	00655533          	srl	a0,a0,t1
20006eb2:	e219                	bnez	a2,20006eb8 <__subtf3+0x2b6>
20006eb4:	1ce0106f          	j	20008082 <__subtf3+0x1480>
20006eb8:	c4d2                	sw	s4,72(sp)
20006eba:	00261593          	sll	a1,a2,0x2
20006ebe:	98f2                	add	a7,a7,t3
20006ec0:	00f58a33          	add	s4,a1,a5
20006ec4:	0008a603          	lw	a2,0(a7)
20006ec8:	0048af03          	lw	t5,4(a7)
20006ecc:	0791                	add	a5,a5,4
20006ece:	00665633          	srl	a2,a2,t1
20006ed2:	007f1f33          	sll	t5,t5,t2
20006ed6:	01e66633          	or	a2,a2,t5
20006eda:	fec7ae23          	sw	a2,-4(a5)
20006ede:	0891                	add	a7,a7,4
20006ee0:	ff4792e3          	bne	a5,s4,20006ec4 <__subtf3+0x2c2>
20006ee4:	04058793          	add	a5,a1,64
20006ee8:	00278633          	add	a2,a5,sp
20006eec:	4791                	li	a5,4
20006eee:	4a26                	lw	s4,72(sp)
20006ef0:	405787b3          	sub	a5,a5,t0
20006ef4:	fca62823          	sw	a0,-48(a2)
20006ef8:	09b0006f          	j	20007792 <__subtf3+0xb90>
20006efc:	47d2                	lw	a5,20(sp)
20006efe:	4fe2                	lw	t6,24(sp)
20006f00:	45f2                	lw	a1,28(sp)
20006f02:	41048333          	sub	t1,s1,a6
20006f06:	01f7ee33          	or	t3,a5,t6
20006f0a:	00be6e33          	or	t3,t3,a1
20006f0e:	011e6e33          	or	t3,t3,a7
20006f12:	180e1f63          	bnez	t3,200070b0 <__subtf3+0x4ae>
20006f16:	00154613          	xor	a2,a0,1
20006f1a:	4581                	li	a1,0
20006f1c:	4f81                	li	t6,0
20006f1e:	18c40d63          	beq	s0,a2,200070b8 <__subtf3+0x4b6>
20006f22:	36030e63          	beqz	t1,2000729e <__subtf3+0x69c>
20006f26:	409802b3          	sub	t0,a6,s1
20006f2a:	5e049463          	bnez	s1,20007512 <__subtf3+0x910>
20006f2e:	4412                	lw	s0,4(sp)
20006f30:	43a2                	lw	t2,8(sp)
20006f32:	4532                	lw	a0,12(sp)
20006f34:	007467b3          	or	a5,s0,t2
20006f38:	8fc9                	or	a5,a5,a0
20006f3a:	8fd5                	or	a5,a5,a3
20006f3c:	200788e3          	beqz	a5,2000794c <__subtf3+0xd4a>
20006f40:	fff28313          	add	t1,t0,-1
20006f44:	560300e3          	beqz	t1,20007ca4 <__subtf3+0x10a2>
20006f48:	67a1                	lui	a5,0x8
20006f4a:	17fd                	add	a5,a5,-1 # 7fff <_start-0x1fff8001>
20006f4c:	44f288e3          	beq	t0,a5,20007b9c <__subtf3+0xf9a>
20006f50:	07400793          	li	a5,116
20006f54:	5c67cc63          	blt	a5,t1,2000752c <__subtf3+0x92a>
20006f58:	47fd                	li	a5,31
20006f5a:	0067c463          	blt	a5,t1,20006f62 <__subtf3+0x360>
20006f5e:	2440106f          	j	200081a2 <__subtf3+0x15a0>
20006f62:	40535493          	sra	s1,t1,0x5
20006f66:	829a                	mv	t0,t1
20006f68:	833a                	mv	t1,a4
20006f6a:	4681                	li	a3,0
20006f6c:	4781                	li	a5,0
20006f6e:	00032383          	lw	t2,0(t1)
20006f72:	0785                	add	a5,a5,1
20006f74:	0311                	add	t1,t1,4
20006f76:	0076e6b3          	or	a3,a3,t2
20006f7a:	fe97cae3          	blt	a5,s1,20006f6e <__subtf3+0x36c>
20006f7e:	83a6                	mv	t2,s1
20006f80:	440d                	li	s0,3
20006f82:	01f2f313          	and	t1,t0,31
20006f86:	40740433          	sub	s0,s0,t2
20006f8a:	480315e3          	bnez	t1,20007c14 <__subtf3+0x1012>
20006f8e:	00239513          	sll	a0,t2,0x2
20006f92:	00a707b3          	add	a5,a4,a0
20006f96:	439c                	lw	a5,0(a5)
20006f98:	0305                	add	t1,t1,1
20006f9a:	0711                	add	a4,a4,4
20006f9c:	fef72e23          	sw	a5,-4(a4)
20006fa0:	fe6459e3          	bge	s0,t1,20006f92 <__subtf3+0x390>
20006fa4:	4791                	li	a5,4
20006fa6:	407787b3          	sub	a5,a5,t2
20006faa:	470d                	li	a4,3
20006fac:	4302                	lw	t1,0(sp)
20006fae:	02f74563          	blt	a4,a5,20006fd8 <__subtf3+0x3d6>
20006fb2:	4711                	li	a4,4
20006fb4:	8f1d                	sub	a4,a4,a5
20006fb6:	070a                	sll	a4,a4,0x2
20006fb8:	078a                	sll	a5,a5,0x2
20006fba:	4521                	li	a0,8
20006fbc:	97f6                	add	a5,a5,t4
20006fbe:	00a76863          	bltu	a4,a0,20006fce <__subtf3+0x3cc>
20006fc2:	0007a023          	sw	zero,0(a5)
20006fc6:	0007a223          	sw	zero,4(a5)
20006fca:	1761                	add	a4,a4,-8
20006fcc:	07a1                	add	a5,a5,8
20006fce:	4511                	li	a0,4
20006fd0:	00a76463          	bltu	a4,a0,20006fd8 <__subtf3+0x3d6>
20006fd4:	0007a023          	sw	zero,0(a5)
20006fd8:	4712                	lw	a4,4(sp)
20006fda:	4522                	lw	a0,8(sp)
20006fdc:	47b2                	lw	a5,12(sp)
20006fde:	00d036b3          	snez	a3,a3
20006fe2:	0066e6b3          	or	a3,a3,t1
20006fe6:	40af8eb3          	sub	t4,t6,a0
20006fea:	40ee0333          	sub	t1,t3,a4
20006fee:	8d9d                	sub	a1,a1,a5
20006ff0:	a399                	j	20007536 <__subtf3+0x934>
20006ff2:	43d2                	lw	t2,20(sp)
20006ff4:	42e2                	lw	t0,24(sp)
20006ff6:	4572                	lw	a0,28(sp)
20006ff8:	0053e633          	or	a2,t2,t0
20006ffc:	8e49                	or	a2,a2,a0
20006ffe:	01166633          	or	a2,a2,a7
20007002:	56060263          	beqz	a2,20007566 <__subtf3+0x964>
20007006:	fff30f93          	add	t6,t1,-1
2000700a:	260f82e3          	beqz	t6,20007a6e <__subtf3+0xe6c>
2000700e:	56b30b63          	beq	t1,a1,20007584 <__subtf3+0x982>
20007012:	07400613          	li	a2,116
20007016:	cdf648e3          	blt	a2,t6,20006ce6 <__subtf3+0xe4>
2000701a:	837e                	mv	t1,t6
2000701c:	40535f93          	sra	t6,t1,0x5
20007020:	01f37313          	and	t1,t1,31
20007024:	600f84e3          	beqz	t6,20007e2c <__subtf3+0x122a>
20007028:	002f9893          	sll	a7,t6,0x2
2000702c:	00f882b3          	add	t0,a7,a5
20007030:	863e                	mv	a2,a5
20007032:	4581                	li	a1,0
20007034:	00062803          	lw	a6,0(a2)
20007038:	0611                	add	a2,a2,4
2000703a:	0105e5b3          	or	a1,a1,a6
2000703e:	fec29be3          	bne	t0,a2,20007034 <__subtf3+0x432>
20007042:	460d                	li	a2,3
20007044:	41f60633          	sub	a2,a2,t6
20007048:	2a030463          	beqz	t1,200072f0 <__subtf3+0x6ee>
2000704c:	04088813          	add	a6,a7,64
20007050:	980a                	add	a6,a6,sp
20007052:	fd082803          	lw	a6,-48(a6)
20007056:	02000393          	li	t2,32
2000705a:	406383b3          	sub	t2,t2,t1
2000705e:	00781833          	sll	a6,a6,t2
20007062:	0105e5b3          	or	a1,a1,a6
20007066:	00655533          	srl	a0,a0,t1
2000706a:	5a060ee3          	beqz	a2,20007e26 <__subtf3+0x1224>
2000706e:	c4d2                	sw	s4,72(sp)
20007070:	00261813          	sll	a6,a2,0x2
20007074:	98f2                	add	a7,a7,t3
20007076:	00f80a33          	add	s4,a6,a5
2000707a:	0008a603          	lw	a2,0(a7)
2000707e:	0048a283          	lw	t0,4(a7)
20007082:	0791                	add	a5,a5,4
20007084:	00665633          	srl	a2,a2,t1
20007088:	007292b3          	sll	t0,t0,t2
2000708c:	00566633          	or	a2,a2,t0
20007090:	fec7ae23          	sw	a2,-4(a5)
20007094:	0891                	add	a7,a7,4
20007096:	fefa12e3          	bne	s4,a5,2000707a <__subtf3+0x478>
2000709a:	04080793          	add	a5,a6,64
2000709e:	00278633          	add	a2,a5,sp
200070a2:	4791                	li	a5,4
200070a4:	4a26                	lw	s4,72(sp)
200070a6:	41f787b3          	sub	a5,a5,t6
200070aa:	fca62823          	sw	a0,-48(a2)
200070ae:	aca9                	j	20007308 <__subtf3+0x706>
200070b0:	862a                	mv	a2,a0
200070b2:	8e3e                	mv	t3,a5
200070b4:	e6a417e3          	bne	s0,a0,20006f22 <__subtf3+0x320>
200070b8:	30030a63          	beqz	t1,200073cc <__subtf3+0x7ca>
200070bc:	409802b3          	sub	t0,a6,s1
200070c0:	70049863          	bnez	s1,200077d0 <__subtf3+0xbce>
200070c4:	4792                	lw	a5,4(sp)
200070c6:	43a2                	lw	t2,8(sp)
200070c8:	4532                	lw	a0,12(sp)
200070ca:	0077e633          	or	a2,a5,t2
200070ce:	8e49                	or	a2,a2,a0
200070d0:	8e55                	or	a2,a2,a3
200070d2:	56060be3          	beqz	a2,20007e48 <__subtf3+0x1246>
200070d6:	fff28313          	add	t1,t0,-1
200070da:	680309e3          	beqz	t1,20007f6c <__subtf3+0x136a>
200070de:	67a1                	lui	a5,0x8
200070e0:	17fd                	add	a5,a5,-1 # 7fff <_start-0x1fff8001>
200070e2:	7ef282e3          	beq	t0,a5,200080c6 <__subtf3+0x14c4>
200070e6:	07400793          	li	a5,116
200070ea:	7067c063          	blt	a5,t1,200077ea <__subtf3+0xbe8>
200070ee:	c4d2                	sw	s4,72(sp)
200070f0:	47fd                	li	a5,31
200070f2:	6067d0e3          	bge	a5,t1,20007ef2 <__subtf3+0x12f0>
200070f6:	40535493          	sra	s1,t1,0x5
200070fa:	829a                	mv	t0,t1
200070fc:	863a                	mv	a2,a4
200070fe:	4681                	li	a3,0
20007100:	4781                	li	a5,0
20007102:	00062303          	lw	t1,0(a2)
20007106:	0785                	add	a5,a5,1
20007108:	0611                	add	a2,a2,4
2000710a:	0066e6b3          	or	a3,a3,t1
2000710e:	fe97cae3          	blt	a5,s1,20007102 <__subtf3+0x500>
20007112:	83a6                	mv	t2,s1
20007114:	4a0d                	li	s4,3
20007116:	01f2f313          	and	t1,t0,31
2000711a:	407a0a33          	sub	s4,s4,t2
2000711e:	5c031ee3          	bnez	t1,20007efa <__subtf3+0x12f8>
20007122:	00239613          	sll	a2,t2,0x2
20007126:	00c707b3          	add	a5,a4,a2
2000712a:	439c                	lw	a5,0(a5)
2000712c:	0305                	add	t1,t1,1
2000712e:	0711                	add	a4,a4,4
20007130:	fef72e23          	sw	a5,-4(a4)
20007134:	fe6a59e3          	bge	s4,t1,20007126 <__subtf3+0x524>
20007138:	4791                	li	a5,4
2000713a:	407787b3          	sub	a5,a5,t2
2000713e:	470d                	li	a4,3
20007140:	4302                	lw	t1,0(sp)
20007142:	02f74563          	blt	a4,a5,2000716c <__subtf3+0x56a>
20007146:	4711                	li	a4,4
20007148:	8f1d                	sub	a4,a4,a5
2000714a:	070a                	sll	a4,a4,0x2
2000714c:	078a                	sll	a5,a5,0x2
2000714e:	4621                	li	a2,8
20007150:	97f6                	add	a5,a5,t4
20007152:	00c76863          	bltu	a4,a2,20007162 <__subtf3+0x560>
20007156:	0007a023          	sw	zero,0(a5)
2000715a:	0007a223          	sw	zero,4(a5)
2000715e:	1761                	add	a4,a4,-8
20007160:	07a1                	add	a5,a5,8
20007162:	4611                	li	a2,4
20007164:	00c76463          	bltu	a4,a2,2000716c <__subtf3+0x56a>
20007168:	0007a023          	sw	zero,0(a5)
2000716c:	4792                	lw	a5,4(sp)
2000716e:	4522                	lw	a0,8(sp)
20007170:	4732                	lw	a4,12(sp)
20007172:	00d036b3          	snez	a3,a3
20007176:	4a26                	lw	s4,72(sp)
20007178:	0066e6b3          	or	a3,a3,t1
2000717c:	97f2                	add	a5,a5,t3
2000717e:	957e                	add	a0,a0,t6
20007180:	95ba                	add	a1,a1,a4
20007182:	a5bd                	j	200077f0 <__subtf3+0xbee>
20007184:	1cb48ee3          	beq	s1,a1,20007b60 <__subtf3+0xf5e>
20007188:	4572                	lw	a0,28(sp)
2000718a:	000805b7          	lui	a1,0x80
2000718e:	07400613          	li	a2,116
20007192:	8d4d                	or	a0,a0,a1
20007194:	ce2a                	sw	a0,28(sp)
20007196:	cc6658e3          	bge	a2,t1,20006e66 <__subtf3+0x264>
2000719a:	4881                	li	a7,0
2000719c:	4581                	li	a1,0
2000719e:	4781                	li	a5,0
200071a0:	4805                	li	a6,1
200071a2:	9836                	add	a6,a6,a3
200071a4:	01f78533          	add	a0,a5,t6
200071a8:	00d83633          	sltu	a2,a6,a3
200071ac:	962a                	add	a2,a2,a0
200071ae:	00f537b3          	sltu	a5,a0,a5
200071b2:	00a63533          	sltu	a0,a2,a0
200071b6:	01d586b3          	add	a3,a1,t4
200071ba:	8fc9                	or	a5,a5,a0
200071bc:	97b6                	add	a5,a5,a3
200071be:	00b6b5b3          	sltu	a1,a3,a1
200071c2:	00d7b6b3          	sltu	a3,a5,a3
200071c6:	8dd5                	or	a1,a1,a3
200071c8:	9746                	add	a4,a4,a7
200071ca:	86c2                	mv	a3,a6
200071cc:	972e                	add	a4,a4,a1
200071ce:	d43e                	sw	a5,40(sp)
200071d0:	d036                	sw	a3,32(sp)
200071d2:	d232                	sw	a2,36(sp)
200071d4:	00c71793          	sll	a5,a4,0xc
200071d8:	0007cee3          	bltz	a5,200079f4 <__subtf3+0xdf2>
200071dc:	d63a                	sw	a4,44(sp)
200071de:	101c                	add	a5,sp,32
200071e0:	02c10893          	add	a7,sp,44
200071e4:	be89                	j	20006d36 <__subtf3+0x134>
200071e6:	000806b7          	lui	a3,0x80
200071ea:	8ef9                	and	a3,a3,a4
200071ec:	7e081e63          	bnez	a6,200079e8 <__subtf3+0xde6>
200071f0:	4481                	li	s1,0
200071f2:	02c10893          	add	a7,sp,44
200071f6:	c699                	beqz	a3,20007204 <__subtf3+0x602>
200071f8:	fff805b7          	lui	a1,0xfff80
200071fc:	15fd                	add	a1,a1,-1 # fff7ffff <dummy_file+0xc9f3dbbf>
200071fe:	8f6d                	and	a4,a4,a1
20007200:	d63a                	sw	a4,44(sp)
20007202:	0485                	add	s1,s1,1
20007204:	01149613          	sll	a2,s1,0x11
20007208:	00375593          	srl	a1,a4,0x3
2000720c:	8245                	srl	a2,a2,0x11
2000720e:	be65                	j	20006dc6 <__subtf3+0x1c4>
20007210:	0116e6b3          	or	a3,a3,a7
20007214:	8ec9                	or	a3,a3,a0
20007216:	8ecd                	or	a3,a3,a1
20007218:	eead                	bnez	a3,20007292 <__subtf3+0x690>
2000721a:	8805                	and	s0,s0,1
2000721c:	043e                	sll	s0,s0,0xf
2000721e:	008667b3          	or	a5,a2,s0
20007222:	4701                	li	a4,0
20007224:	02e11e23          	sh	a4,60(sp)
20007228:	02f11f23          	sh	a5,62(sp)
2000722c:	57f2                	lw	a5,60(sp)
2000722e:	4501                	li	a0,0
20007230:	4881                	li	a7,0
20007232:	bc080be3          	beqz	a6,20006e08 <__subtf3+0x206>
20007236:	00182073          	csrs	fflags,a6
2000723a:	b6f9                	j	20006e08 <__subtf3+0x206>
2000723c:	00080537          	lui	a0,0x80
20007240:	157d                	add	a0,a0,-1 # 7ffff <_start-0x1ff80001>
20007242:	8d79                	and	a0,a0,a4
20007244:	d62a                	sw	a0,44(sp)
20007246:	38051263          	bnez	a0,200075ca <__subtf3+0x9c8>
2000724a:	5522                	lw	a0,40(sp)
2000724c:	34050963          	beqz	a0,2000759e <__subtf3+0x99c>
20007250:	50f010ef          	jal	20008f5e <__clzsi2>
20007254:	01450613          	add	a2,a0,20
20007258:	01f67813          	and	a6,a2,31
2000725c:	5a081f63          	bnez	a6,2000781a <__subtf3+0xc18>
20007260:	4585                	li	a1,1
20007262:	02000613          	li	a2,32
20007266:	40b006b3          	neg	a3,a1
2000726a:	068a                	sll	a3,a3,0x2
2000726c:	00c68713          	add	a4,a3,12 # 8000c <_start-0x1ff7fff4>
20007270:	101c                	add	a5,sp,32
20007272:	973e                	add	a4,a4,a5
20007274:	40d006b3          	neg	a3,a3
20007278:	00072883          	lw	a7,0(a4)
2000727c:	00d70833          	add	a6,a4,a3
20007280:	853a                	mv	a0,a4
20007282:	01182023          	sw	a7,0(a6)
20007286:	1771                	add	a4,a4,-4
20007288:	fef518e3          	bne	a0,a5,20007278 <__subtf3+0x676>
2000728c:	fff58713          	add	a4,a1,-1
20007290:	ae71                	j	2000762c <__subtf3+0xa2a>
20007292:	4401                	li	s0,0
20007294:	6721                	lui	a4,0x8
20007296:	4501                	li	a0,0
20007298:	4881                	li	a7,0
2000729a:	4681                	li	a3,0
2000729c:	bea1                	j	20006df4 <__subtf3+0x1f2>
2000729e:	67a1                	lui	a5,0x8
200072a0:	00148713          	add	a4,s1,1
200072a4:	17f9                	add	a5,a5,-2 # 7ffe <_start-0x1fff8002>
200072a6:	00f77f33          	and	t5,a4,a5
200072aa:	4e92                	lw	t4,4(sp)
200072ac:	4322                	lw	t1,8(sp)
200072ae:	4732                	lw	a4,12(sp)
200072b0:	1e0f1363          	bnez	t5,20007496 <__subtf3+0x894>
200072b4:	01fe6533          	or	a0,t3,t6
200072b8:	006ee7b3          	or	a5,t4,t1
200072bc:	01156533          	or	a0,a0,a7
200072c0:	8fd9                	or	a5,a5,a4
200072c2:	8d4d                	or	a0,a0,a1
200072c4:	8fd5                	or	a5,a5,a3
200072c6:	66049263          	bnez	s1,2000792a <__subtf3+0xd28>
200072ca:	1c0782e3          	beqz	a5,20007c8e <__subtf3+0x108c>
200072ce:	20051ce3          	bnez	a0,20007ce6 <__subtf3+0x10e4>
200072d2:	d036                	sw	a3,32(sp)
200072d4:	d276                	sw	t4,36(sp)
200072d6:	d41a                	sw	t1,40(sp)
200072d8:	d63a                	sw	a4,44(sp)
200072da:	8f9a                	mv	t6,t1
200072dc:	85ba                	mv	a1,a4
200072de:	8e76                	mv	t3,t4
200072e0:	101c                	add	a5,sp,32
200072e2:	a23d                	j	20007410 <__subtf3+0x80e>
200072e4:	ac0413e3          	bnez	s0,20006daa <__subtf3+0x1a8>
200072e8:	4681                	li	a3,0
200072ea:	4581                	li	a1,0
200072ec:	8626                	mv	a2,s1
200072ee:	b4f1                	j	20006dba <__subtf3+0x1b8>
200072f0:	01178533          	add	a0,a5,a7
200072f4:	4108                	lw	a0,0(a0)
200072f6:	0305                	add	t1,t1,1
200072f8:	0791                	add	a5,a5,4
200072fa:	fea7ae23          	sw	a0,-4(a5)
200072fe:	fe6659e3          	bge	a2,t1,200072f0 <__subtf3+0x6ee>
20007302:	4791                	li	a5,4
20007304:	41f787b3          	sub	a5,a5,t6
20007308:	4611                	li	a2,4
2000730a:	4542                	lw	a0,16(sp)
2000730c:	02c78563          	beq	a5,a2,20007336 <__subtf3+0x734>
20007310:	4611                	li	a2,4
20007312:	8e1d                	sub	a2,a2,a5
20007314:	060a                	sll	a2,a2,0x2
20007316:	078a                	sll	a5,a5,0x2
20007318:	4821                	li	a6,8
2000731a:	97f2                	add	a5,a5,t3
2000731c:	01066863          	bltu	a2,a6,2000732c <__subtf3+0x72a>
20007320:	0007a023          	sw	zero,0(a5)
20007324:	0007a223          	sw	zero,4(a5)
20007328:	1661                	add	a2,a2,-8
2000732a:	07a1                	add	a5,a5,8
2000732c:	4811                	li	a6,4
2000732e:	01066463          	bltu	a2,a6,20007336 <__subtf3+0x734>
20007332:	0007a023          	sw	zero,0(a5)
20007336:	00b037b3          	snez	a5,a1
2000733a:	48d2                	lw	a7,20(sp)
2000733c:	45e2                	lw	a1,24(sp)
2000733e:	4872                	lw	a6,28(sp)
20007340:	8fc9                	or	a5,a5,a0
20007342:	b275                	j	20006cee <__subtf3+0xec>
20007344:	ffff0893          	add	a7,t5,-1
20007348:	00bf3633          	sltu	a2,t5,a1
2000734c:	40b888b3          	sub	a7,a7,a1
20007350:	41e585b3          	sub	a1,a1,t5
20007354:	0015b593          	seqz	a1,a1
20007358:	8e4d                	or	a2,a2,a1
2000735a:	b2c9                	j	20006d1c <__subtf3+0x11a>
2000735c:	fff805b7          	lui	a1,0xfff80
20007360:	15fd                	add	a1,a1,-1 # fff7ffff <dummy_file+0xc9f3dbbf>
20007362:	8f6d                	and	a4,a4,a1
20007364:	d63a                	sw	a4,44(sp)
20007366:	bd79                	j	20007204 <__subtf3+0x602>
20007368:	a0041fe3          	bnez	s0,20006d86 <__subtf3+0x184>
2000736c:	5612                	lw	a2,36(sp)
2000736e:	06a1                	add	a3,a3,8
20007370:	5522                	lw	a0,40(sp)
20007372:	0086b593          	sltiu	a1,a3,8
20007376:	95b2                	add	a1,a1,a2
20007378:	00c5b633          	sltu	a2,a1,a2
2000737c:	962a                	add	a2,a2,a0
2000737e:	00a63533          	sltu	a0,a2,a0
20007382:	972a                	add	a4,a4,a0
20007384:	d036                	sw	a3,32(sp)
20007386:	d22e                	sw	a1,36(sp)
20007388:	d432                	sw	a2,40(sp)
2000738a:	d63a                	sw	a4,44(sp)
2000738c:	9e040de3          	beqz	s0,20006d86 <__subtf3+0x184>
20007390:	00286813          	or	a6,a6,2
20007394:	4401                	li	s0,0
20007396:	bac5                	j	20006d86 <__subtf3+0x184>
20007398:	9e0407e3          	beqz	s0,20006d86 <__subtf3+0x184>
2000739c:	4401                	li	s0,0
2000739e:	5612                	lw	a2,36(sp)
200073a0:	06a1                	add	a3,a3,8
200073a2:	5522                	lw	a0,40(sp)
200073a4:	0086b593          	sltiu	a1,a3,8
200073a8:	95b2                	add	a1,a1,a2
200073aa:	00c5b633          	sltu	a2,a1,a2
200073ae:	962a                	add	a2,a2,a0
200073b0:	00a63533          	sltu	a0,a2,a0
200073b4:	972a                	add	a4,a4,a0
200073b6:	d036                	sw	a3,32(sp)
200073b8:	d22e                	sw	a1,36(sp)
200073ba:	d432                	sw	a2,40(sp)
200073bc:	d63a                	sw	a4,44(sp)
200073be:	9c0412e3          	bnez	s0,20006d82 <__subtf3+0x180>
200073c2:	000806b7          	lui	a3,0x80
200073c6:	8ef9                	and	a3,a3,a4
200073c8:	4405                	li	s0,1
200073ca:	b2c9                	j	20006d8c <__subtf3+0x18a>
200073cc:	67a1                	lui	a5,0x8
200073ce:	17f9                	add	a5,a5,-2 # 7ffe <_start-0x1fff8002>
200073d0:	00148513          	add	a0,s1,1
200073d4:	00f57333          	and	t1,a0,a5
200073d8:	4ea2                	lw	t4,8(sp)
200073da:	4792                	lw	a5,4(sp)
200073dc:	4732                	lw	a4,12(sp)
200073de:	48031563          	bnez	t1,20007868 <__subtf3+0xc66>
200073e2:	01d7e633          	or	a2,a5,t4
200073e6:	8e59                	or	a2,a2,a4
200073e8:	8e55                	or	a2,a2,a3
200073ea:	7c049763          	bnez	s1,20007bb8 <__subtf3+0xfb6>
200073ee:	2a0602e3          	beqz	a2,20007e92 <__subtf3+0x1290>
200073f2:	01fe6633          	or	a2,t3,t6
200073f6:	01166633          	or	a2,a2,a7
200073fa:	8e4d                	or	a2,a2,a1
200073fc:	2a0612e3          	bnez	a2,20007ea0 <__subtf3+0x129e>
20007400:	d23e                	sw	a5,36(sp)
20007402:	8e3e                	mv	t3,a5
20007404:	d036                	sw	a3,32(sp)
20007406:	d476                	sw	t4,40(sp)
20007408:	d63a                	sw	a4,44(sp)
2000740a:	8ff6                	mv	t6,t4
2000740c:	85ba                	mv	a1,a4
2000740e:	101c                	add	a5,sp,32
20007410:	d836                	sw	a3,48(sp)
20007412:	da72                	sw	t3,52(sp)
20007414:	dc7e                	sw	t6,56(sp)
20007416:	de2e                	sw	a1,60(sp)
20007418:	03010813          	add	a6,sp,48
2000741c:	1878                	add	a4,sp,60
2000741e:	00159513          	sll	a0,a1,0x1
20007422:	ffc72583          	lw	a1,-4(a4) # 7ffc <_start-0x1fff8004>
20007426:	1771                	add	a4,a4,-4
20007428:	01f5d613          	srl	a2,a1,0x1f
2000742c:	8e49                	or	a2,a2,a0
2000742e:	c350                	sw	a2,4(a4)
20007430:	fee817e3          	bne	a6,a4,2000741e <__subtf3+0x81c>
20007434:	00169713          	sll	a4,a3,0x1
20007438:	00777613          	and	a2,a4,7
2000743c:	55f2                	lw	a1,60(sp)
2000743e:	4801                	li	a6,0
20007440:	ca1d                	beqz	a2,20007476 <__subtf3+0x874>
20007442:	4609                	li	a2,2
20007444:	6cc98963          	beq	s3,a2,20007b16 <__subtf3+0xf14>
20007448:	460d                	li	a2,3
2000744a:	6ac98563          	beq	s3,a2,20007af4 <__subtf3+0xef2>
2000744e:	4805                	li	a6,1
20007450:	02099363          	bnez	s3,20007476 <__subtf3+0x874>
20007454:	00f77613          	and	a2,a4,15
20007458:	4511                	li	a0,4
2000745a:	00a60e63          	beq	a2,a0,20007476 <__subtf3+0x874>
2000745e:	5652                	lw	a2,52(sp)
20007460:	0711                	add	a4,a4,4
20007462:	00473713          	sltiu	a4,a4,4
20007466:	963a                	add	a2,a2,a4
20007468:	00e63733          	sltu	a4,a2,a4
2000746c:	5662                	lw	a2,56(sp)
2000746e:	963a                	add	a2,a2,a4
20007470:	00e63733          	sltu	a4,a2,a4
20007474:	95ba                	add	a1,a1,a4
20007476:	00b59713          	sll	a4,a1,0xb
2000747a:	0076f613          	and	a2,a3,7
2000747e:	54075a63          	bgez	a4,200079d2 <__subtf3+0xdd0>
20007482:	5732                	lw	a4,44(sp)
20007484:	5c061f63          	bnez	a2,20007a62 <__subtf3+0xe60>
20007488:	000806b7          	lui	a3,0x80
2000748c:	8ef9                	and	a3,a3,a4
2000748e:	4481                	li	s1,0
20007490:	02c10893          	add	a7,sp,44
20007494:	b38d                	j	200071f6 <__subtf3+0x5f4>
20007496:	41ce8533          	sub	a0,t4,t3
2000749a:	411687b3          	sub	a5,a3,a7
2000749e:	c4d2                	sw	s4,72(sp)
200074a0:	00f6b833          	sltu	a6,a3,a5
200074a4:	00aeb3b3          	sltu	t2,t4,a0
200074a8:	8a1e                	mv	s4,t2
200074aa:	41050833          	sub	a6,a0,a6
200074ae:	41f30f33          	sub	t5,t1,t6
200074b2:	01f332b3          	sltu	t0,t1,t6
200074b6:	04f6f963          	bgeu	a3,a5,20007508 <__subtf3+0x906>
200074ba:	05de1763          	bne	t3,t4,20007508 <__subtf3+0x906>
200074be:	1f7d                	add	t5,t5,-1
200074c0:	406f8533          	sub	a0,t6,t1
200074c4:	00153513          	seqz	a0,a0
200074c8:	00a2e2b3          	or	t0,t0,a0
200074cc:	40b70533          	sub	a0,a4,a1
200074d0:	40550533          	sub	a0,a0,t0
200074d4:	d62a                	sw	a0,44(sp)
200074d6:	d47a                	sw	t5,40(sp)
200074d8:	d242                	sw	a6,36(sp)
200074da:	d03e                	sw	a5,32(sp)
200074dc:	00c51293          	sll	t0,a0,0xc
200074e0:	3e02c963          	bltz	t0,200078d2 <__subtf3+0xcd0>
200074e4:	0107e7b3          	or	a5,a5,a6
200074e8:	01e7e7b3          	or	a5,a5,t5
200074ec:	8fc9                	or	a5,a5,a0
200074ee:	42079163          	bnez	a5,20007910 <__subtf3+0xd0e>
200074f2:	4a26                	lw	s4,72(sp)
200074f4:	19f9                	add	s3,s3,-2
200074f6:	0019b413          	seqz	s0,s3
200074fa:	4481                	li	s1,0
200074fc:	4801                	li	a6,0
200074fe:	4701                	li	a4,0
20007500:	101c                	add	a5,sp,32
20007502:	02c10893          	add	a7,sp,44
20007506:	b9fd                	j	20007204 <__subtf3+0x602>
20007508:	414f0f33          	sub	t5,t5,s4
2000750c:	fc0380e3          	beqz	t2,200074cc <__subtf3+0x8ca>
20007510:	bf45                	j	200074c0 <__subtf3+0x8be>
20007512:	67a1                	lui	a5,0x8
20007514:	17fd                	add	a5,a5,-1 # 7fff <_start-0x1fff8001>
20007516:	04f80fe3          	beq	a6,a5,20007d74 <__subtf3+0x1172>
2000751a:	4532                	lw	a0,12(sp)
2000751c:	000806b7          	lui	a3,0x80
20007520:	07400793          	li	a5,116
20007524:	8d55                	or	a0,a0,a3
20007526:	c62a                	sw	a0,12(sp)
20007528:	3257d363          	bge	a5,t0,2000784e <__subtf3+0xc4c>
2000752c:	8efe                	mv	t4,t6
2000752e:	8372                	mv	t1,t3
20007530:	4501                	li	a0,0
20007532:	4701                	li	a4,0
20007534:	4685                	li	a3,1
20007536:	40d886b3          	sub	a3,a7,a3
2000753a:	00d8b7b3          	sltu	a5,a7,a3
2000753e:	006e3f33          	sltu	t5,t3,t1
20007542:	40f307b3          	sub	a5,t1,a5
20007546:	00d8f463          	bgeu	a7,a3,2000754e <__subtf3+0x94c>
2000754a:	58ee0363          	beq	t3,a4,20007ad0 <__subtf3+0xece>
2000754e:	01dfb733          	sltu	a4,t6,t4
20007552:	41ee88b3          	sub	a7,t4,t5
20007556:	586e6163          	bltu	t3,t1,20007ad8 <__subtf3+0xed6>
2000755a:	40e58733          	sub	a4,a1,a4
2000755e:	84c2                	mv	s1,a6
20007560:	8432                	mv	s0,a2
20007562:	fbeff06f          	j	20006d20 <__subtf3+0x11e>
20007566:	00b30f63          	beq	t1,a1,20007584 <__subtf3+0x982>
2000756a:	d036                	sw	a3,32(sp)
2000756c:	d276                	sw	t4,36(sp)
2000756e:	d47a                	sw	t5,40(sp)
20007570:	85ba                	mv	a1,a4
20007572:	849a                	mv	s1,t1
20007574:	000806b7          	lui	a3,0x80
20007578:	d62e                	sw	a1,44(sp)
2000757a:	101c                	add	a5,sp,32
2000757c:	02c10893          	add	a7,sp,44
20007580:	8ef9                	and	a3,a3,a4
20007582:	b029                	j	20006d8c <__subtf3+0x18a>
20007584:	01eee7b3          	or	a5,t4,t5
20007588:	8fd9                	or	a5,a5,a4
2000758a:	8fd5                	or	a5,a5,a3
2000758c:	dff9                	beqz	a5,2000756a <__subtf3+0x968>
2000758e:	01275813          	srl	a6,a4,0x12
20007592:	00184813          	xor	a6,a6,1
20007596:	00187813          	and	a6,a6,1
2000759a:	0812                	sll	a6,a6,0x4
2000759c:	b7f9                	j	2000756a <__subtf3+0x968>
2000759e:	5512                	lw	a0,36(sp)
200075a0:	28050863          	beqz	a0,20007830 <__subtf3+0xc2e>
200075a4:	1bb010ef          	jal	20008f5e <__clzsi2>
200075a8:	03450613          	add	a2,a0,52
200075ac:	01f67813          	and	a6,a2,31
200075b0:	40565593          	sra	a1,a2,0x5
200075b4:	ca0809e3          	beqz	a6,20007266 <__subtf3+0x664>
200075b8:	c4d2                	sw	s4,72(sp)
200075ba:	5a02                	lw	s4,32(sp)
200075bc:	02000e13          	li	t3,32
200075c0:	410e0e33          	sub	t3,t3,a6
200075c4:	010a1a33          	sll	s4,s4,a6
200075c8:	a839                	j	200075e6 <__subtf3+0x9e4>
200075ca:	c4d2                	sw	s4,72(sp)
200075cc:	193010ef          	jal	20008f5e <__clzsi2>
200075d0:	ff450813          	add	a6,a0,-12
200075d4:	8642                	mv	a2,a6
200075d6:	5a02                	lw	s4,32(sp)
200075d8:	02000e13          	li	t3,32
200075dc:	40ce0e33          	sub	t3,t3,a2
200075e0:	4581                	li	a1,0
200075e2:	010a1a33          	sll	s4,s4,a6
200075e6:	40b008b3          	neg	a7,a1
200075ea:	088a                	sll	a7,a7,0x2
200075ec:	00c88713          	add	a4,a7,12
200075f0:	101c                	add	a5,sp,32
200075f2:	973e                	add	a4,a4,a5
200075f4:	411008b3          	neg	a7,a7
200075f8:	4314                	lw	a3,0(a4)
200075fa:	ffc72503          	lw	a0,-4(a4)
200075fe:	01170333          	add	t1,a4,a7
20007602:	010696b3          	sll	a3,a3,a6
20007606:	01c55533          	srl	a0,a0,t3
2000760a:	8ec9                	or	a3,a3,a0
2000760c:	00d32023          	sw	a3,0(t1)
20007610:	1771                	add	a4,a4,-4
20007612:	fee793e3          	bne	a5,a4,200075f8 <__subtf3+0x9f6>
20007616:	00259693          	sll	a3,a1,0x2
2000761a:	04068713          	add	a4,a3,64 # 80040 <_start-0x1ff7ffc0>
2000761e:	002706b3          	add	a3,a4,sp
20007622:	ff46a023          	sw	s4,-32(a3)
20007626:	4a26                	lw	s4,72(sp)
20007628:	fff58713          	add	a4,a1,-1
2000762c:	56fd                	li	a3,-1
2000762e:	02d70263          	beq	a4,a3,20007652 <__subtf3+0xa50>
20007632:	0705                	add	a4,a4,1
20007634:	070a                	sll	a4,a4,0x2
20007636:	45a1                	li	a1,8
20007638:	86be                	mv	a3,a5
2000763a:	00b76763          	bltu	a4,a1,20007648 <__subtf3+0xa46>
2000763e:	d002                	sw	zero,32(sp)
20007640:	0007a223          	sw	zero,4(a5)
20007644:	1034                	add	a3,sp,40
20007646:	1761                	add	a4,a4,-8
20007648:	4591                	li	a1,4
2000764a:	00b76463          	bltu	a4,a1,20007652 <__subtf3+0xa50>
2000764e:	0006a023          	sw	zero,0(a3)
20007652:	10964863          	blt	a2,s1,20007762 <__subtf3+0xb60>
20007656:	40960733          	sub	a4,a2,s1
2000765a:	0705                	add	a4,a4,1
2000765c:	40575313          	sra	t1,a4,0x5
20007660:	8b7d                	and	a4,a4,31
20007662:	78030563          	beqz	t1,20007dec <__subtf3+0x11ea>
20007666:	00231593          	sll	a1,t1,0x2
2000766a:	863e                	mv	a2,a5
2000766c:	00f58833          	add	a6,a1,a5
20007670:	4681                	li	a3,0
20007672:	4208                	lw	a0,0(a2)
20007674:	0611                	add	a2,a2,4
20007676:	8ec9                	or	a3,a3,a0
20007678:	fec81de3          	bne	a6,a2,20007672 <__subtf3+0xa70>
2000767c:	450d                	li	a0,3
2000767e:	40650533          	sub	a0,a0,t1
20007682:	c32d                	beqz	a4,200076e4 <__subtf3+0xae2>
20007684:	04058613          	add	a2,a1,64
20007688:	960a                	add	a2,a2,sp
2000768a:	fe062603          	lw	a2,-32(a2)
2000768e:	5eb2                	lw	t4,44(sp)
20007690:	02000e13          	li	t3,32
20007694:	40ee0e33          	sub	t3,t3,a4
20007698:	01c61633          	sll	a2,a2,t3
2000769c:	8ed1                	or	a3,a3,a2
2000769e:	00eedeb3          	srl	t4,t4,a4
200076a2:	78050063          	beqz	a0,20007e22 <__subtf3+0x1220>
200076a6:	050a                	sll	a0,a0,0x2
200076a8:	00b78633          	add	a2,a5,a1
200076ac:	883e                	mv	a6,a5
200076ae:	00a78f33          	add	t5,a5,a0
200076b2:	420c                	lw	a1,0(a2)
200076b4:	00462883          	lw	a7,4(a2)
200076b8:	0811                	add	a6,a6,4
200076ba:	00e5d5b3          	srl	a1,a1,a4
200076be:	01c898b3          	sll	a7,a7,t3
200076c2:	0115e5b3          	or	a1,a1,a7
200076c6:	feb82e23          	sw	a1,-4(a6)
200076ca:	0611                	add	a2,a2,4
200076cc:	ff0f13e3          	bne	t5,a6,200076b2 <__subtf3+0xab0>
200076d0:	04050713          	add	a4,a0,64
200076d4:	00270533          	add	a0,a4,sp
200076d8:	4711                	li	a4,4
200076da:	40670733          	sub	a4,a4,t1
200076de:	ffd52023          	sw	t4,-32(a0)
200076e2:	a839                	j	20007700 <__subtf3+0xafe>
200076e4:	863e                	mv	a2,a5
200076e6:	00b60833          	add	a6,a2,a1
200076ea:	00082803          	lw	a6,0(a6)
200076ee:	0705                	add	a4,a4,1
200076f0:	0611                	add	a2,a2,4
200076f2:	ff062e23          	sw	a6,-4(a2)
200076f6:	fee558e3          	bge	a0,a4,200076e6 <__subtf3+0xae4>
200076fa:	4711                	li	a4,4
200076fc:	40670733          	sub	a4,a4,t1
20007700:	4611                	li	a2,4
20007702:	5e82                	lw	t4,32(sp)
20007704:	02c70563          	beq	a4,a2,2000772e <__subtf3+0xb2c>
20007708:	4611                	li	a2,4
2000770a:	8e19                	sub	a2,a2,a4
2000770c:	060a                	sll	a2,a2,0x2
2000770e:	070a                	sll	a4,a4,0x2
20007710:	45a1                	li	a1,8
20007712:	973e                	add	a4,a4,a5
20007714:	00b66863          	bltu	a2,a1,20007724 <__subtf3+0xb22>
20007718:	00072023          	sw	zero,0(a4)
2000771c:	00072223          	sw	zero,4(a4)
20007720:	1661                	add	a2,a2,-8
20007722:	0721                	add	a4,a4,8
20007724:	4591                	li	a1,4
20007726:	00b66463          	bltu	a2,a1,2000772e <__subtf3+0xb2c>
2000772a:	00072023          	sw	zero,0(a4)
2000772e:	00d036b3          	snez	a3,a3
20007732:	5e12                	lw	t3,36(sp)
20007734:	5fa2                	lw	t6,40(sp)
20007736:	55b2                	lw	a1,44(sp)
20007738:	01d6e6b3          	or	a3,a3,t4
2000773c:	d036                	sw	a3,32(sp)
2000773e:	01c6e733          	or	a4,a3,t3
20007742:	01f76733          	or	a4,a4,t6
20007746:	8f4d                	or	a4,a4,a1
20007748:	cc0714e3          	bnez	a4,20007410 <__subtf3+0x80e>
2000774c:	4481                	li	s1,0
2000774e:	01149613          	sll	a2,s1,0x11
20007752:	4801                	li	a6,0
20007754:	02c10893          	add	a7,sp,44
20007758:	00375593          	srl	a1,a4,0x3
2000775c:	8245                	srl	a2,a2,0x11
2000775e:	e68ff06f          	j	20006dc6 <__subtf3+0x1c4>
20007762:	5732                	lw	a4,44(sp)
20007764:	fff805b7          	lui	a1,0xfff80
20007768:	15fd                	add	a1,a1,-1 # fff7ffff <dummy_file+0xc9f3dbbf>
2000776a:	8f6d                	and	a4,a4,a1
2000776c:	5682                	lw	a3,32(sp)
2000776e:	8c91                	sub	s1,s1,a2
20007770:	d63a                	sw	a4,44(sp)
20007772:	02c10893          	add	a7,sp,44
20007776:	dc0ff06f          	j	20006d36 <__subtf3+0x134>
2000777a:	011785b3          	add	a1,a5,a7
2000777e:	418c                	lw	a1,0(a1)
20007780:	0305                	add	t1,t1,1
20007782:	0791                	add	a5,a5,4
20007784:	feb7ae23          	sw	a1,-4(a5)
20007788:	fe6659e3          	bge	a2,t1,2000777a <__subtf3+0xb78>
2000778c:	4791                	li	a5,4
2000778e:	405787b3          	sub	a5,a5,t0
20007792:	4611                	li	a2,4
20007794:	4542                	lw	a0,16(sp)
20007796:	02c78563          	beq	a5,a2,200077c0 <__subtf3+0xbbe>
2000779a:	4611                	li	a2,4
2000779c:	8e1d                	sub	a2,a2,a5
2000779e:	060a                	sll	a2,a2,0x2
200077a0:	078a                	sll	a5,a5,0x2
200077a2:	45a1                	li	a1,8
200077a4:	97f2                	add	a5,a5,t3
200077a6:	00b66863          	bltu	a2,a1,200077b6 <__subtf3+0xbb4>
200077aa:	0007a023          	sw	zero,0(a5)
200077ae:	0007a223          	sw	zero,4(a5)
200077b2:	1661                	add	a2,a2,-8
200077b4:	07a1                	add	a5,a5,8
200077b6:	4591                	li	a1,4
200077b8:	00b66463          	bltu	a2,a1,200077c0 <__subtf3+0xbbe>
200077bc:	0007a023          	sw	zero,0(a5)
200077c0:	01003833          	snez	a6,a6
200077c4:	47d2                	lw	a5,20(sp)
200077c6:	45e2                	lw	a1,24(sp)
200077c8:	48f2                	lw	a7,28(sp)
200077ca:	00a86833          	or	a6,a6,a0
200077ce:	bad1                	j	200071a2 <__subtf3+0x5a0>
200077d0:	67a1                	lui	a5,0x8
200077d2:	17fd                	add	a5,a5,-1 # 7fff <_start-0x1fff8001>
200077d4:	04f80ce3          	beq	a6,a5,2000802c <__subtf3+0x142a>
200077d8:	4532                	lw	a0,12(sp)
200077da:	000806b7          	lui	a3,0x80
200077de:	07400793          	li	a5,116
200077e2:	8d55                	or	a0,a0,a3
200077e4:	c62a                	sw	a0,12(sp)
200077e6:	6257d063          	bge	a5,t0,20007e06 <__subtf3+0x1204>
200077ea:	857e                	mv	a0,t6
200077ec:	87f2                	mv	a5,t3
200077ee:	4685                	li	a3,1
200077f0:	96c6                	add	a3,a3,a7
200077f2:	0116b8b3          	sltu	a7,a3,a7
200077f6:	00f88633          	add	a2,a7,a5
200077fa:	011638b3          	sltu	a7,a2,a7
200077fe:	01c7b7b3          	sltu	a5,a5,t3
20007802:	0117e733          	or	a4,a5,a7
20007806:	00a707b3          	add	a5,a4,a0
2000780a:	00e7b733          	sltu	a4,a5,a4
2000780e:	01f53533          	sltu	a0,a0,t6
20007812:	8f49                	or	a4,a4,a0
20007814:	972e                	add	a4,a4,a1
20007816:	84c2                	mv	s1,a6
20007818:	ba5d                	j	200071ce <__subtf3+0x5cc>
2000781a:	c4d2                	sw	s4,72(sp)
2000781c:	5a02                	lw	s4,32(sp)
2000781e:	02000e13          	li	t3,32
20007822:	40565593          	sra	a1,a2,0x5
20007826:	410e0e33          	sub	t3,t3,a6
2000782a:	010a1a33          	sll	s4,s4,a6
2000782e:	bb65                	j	200075e6 <__subtf3+0x9e4>
20007830:	c4d2                	sw	s4,72(sp)
20007832:	5a02                	lw	s4,32(sp)
20007834:	8552                	mv	a0,s4
20007836:	728010ef          	jal	20008f5e <__clzsi2>
2000783a:	05450613          	add	a2,a0,84
2000783e:	01f67813          	and	a6,a2,31
20007842:	58081a63          	bnez	a6,20007dd6 <__subtf3+0x11d4>
20007846:	4a26                	lw	s4,72(sp)
20007848:	40565593          	sra	a1,a2,0x5
2000784c:	bc29                	j	20007266 <__subtf3+0x664>
2000784e:	41f2d493          	sra	s1,t0,0x1f
20007852:	88fd                	and	s1,s1,31
20007854:	9496                	add	s1,s1,t0
20007856:	47fd                	li	a5,31
20007858:	8495                	sra	s1,s1,0x5
2000785a:	f057c763          	blt	a5,t0,20006f68 <__subtf3+0x366>
2000785e:	83a6                	mv	t2,s1
20007860:	4681                	li	a3,0
20007862:	4481                	li	s1,0
20007864:	f1cff06f          	j	20006f80 <__subtf3+0x37e>
20007868:	98b6                	add	a7,a7,a3
2000786a:	97f2                	add	a5,a5,t3
2000786c:	00d8b6b3          	sltu	a3,a7,a3
20007870:	00d78833          	add	a6,a5,a3
20007874:	01c7b633          	sltu	a2,a5,t3
20007878:	00f837b3          	sltu	a5,a6,a5
2000787c:	01df86b3          	add	a3,t6,t4
20007880:	8e5d                	or	a2,a2,a5
20007882:	9636                	add	a2,a2,a3
20007884:	01f6b7b3          	sltu	a5,a3,t6
20007888:	00d636b3          	sltu	a3,a2,a3
2000788c:	8fd5                	or	a5,a5,a3
2000788e:	95ba                	add	a1,a1,a4
20007890:	95be                	add	a1,a1,a5
20007892:	101c                	add	a5,sp,32
20007894:	86c6                	mv	a3,a7
20007896:	d046                	sw	a7,32(sp)
20007898:	d242                	sw	a6,36(sp)
2000789a:	d432                	sw	a2,40(sp)
2000789c:	d62e                	sw	a1,44(sp)
2000789e:	873e                	mv	a4,a5
200078a0:	02c10893          	add	a7,sp,44
200078a4:	0016d813          	srl	a6,a3,0x1
200078a8:	4354                	lw	a3,4(a4)
200078aa:	0711                	add	a4,a4,4
200078ac:	01f69613          	sll	a2,a3,0x1f
200078b0:	01066633          	or	a2,a2,a6
200078b4:	fec72e23          	sw	a2,-4(a4)
200078b8:	fee896e3          	bne	a7,a4,200078a4 <__subtf3+0xca2>
200078bc:	0015d713          	srl	a4,a1,0x1
200078c0:	66a1                	lui	a3,0x8
200078c2:	d63a                	sw	a4,44(sp)
200078c4:	16fd                	add	a3,a3,-1 # 7fff <_start-0x1fff8001>
200078c6:	16d50b63          	beq	a0,a3,20007a3c <__subtf3+0xe3a>
200078ca:	5682                	lw	a3,32(sp)
200078cc:	84aa                	mv	s1,a0
200078ce:	c68ff06f          	j	20006d36 <__subtf3+0x134>
200078d2:	41de07b3          	sub	a5,t3,t4
200078d6:	40d886b3          	sub	a3,a7,a3
200078da:	00fe3f33          	sltu	t5,t3,a5
200078de:	00d8b533          	sltu	a0,a7,a3
200078e2:	406f8333          	sub	t1,t6,t1
200078e6:	887a                	mv	a6,t5
200078e8:	8f89                	sub	a5,a5,a0
200078ea:	006fbfb3          	sltu	t6,t6,t1
200078ee:	00d8f463          	bgeu	a7,a3,200078f6 <__subtf3+0xcf4>
200078f2:	59de0463          	beq	t3,t4,20007e7a <__subtf3+0x1278>
200078f6:	41030833          	sub	a6,t1,a6
200078fa:	580f1263          	bnez	t5,20007e7e <__subtf3+0x127c>
200078fe:	40e58533          	sub	a0,a1,a4
20007902:	41f50533          	sub	a0,a0,t6
20007906:	d62a                	sw	a0,44(sp)
20007908:	d442                	sw	a6,40(sp)
2000790a:	d23e                	sw	a5,36(sp)
2000790c:	d036                	sw	a3,32(sp)
2000790e:	8432                	mv	s0,a2
20007910:	0e0506e3          	beqz	a0,200081fc <__subtf3+0x15fa>
20007914:	64a010ef          	jal	20008f5e <__clzsi2>
20007918:	ff450793          	add	a5,a0,-12
2000791c:	01f7f613          	and	a2,a5,31
20007920:	4581                	li	a1,0
20007922:	0c0619e3          	bnez	a2,200081f4 <__subtf3+0x15f2>
20007926:	4a26                	lw	s4,72(sp)
20007928:	ba3d                	j	20007266 <__subtf3+0x664>
2000792a:	62a1                	lui	t0,0x8
2000792c:	12fd                	add	t0,t0,-1 # 7fff <_start-0x1fff8001>
2000792e:	68548b63          	beq	s1,t0,20007fc4 <__subtf3+0x13c2>
20007932:	74580b63          	beq	a6,t0,20008088 <__subtf3+0x1486>
20007936:	c3d9                	beqz	a5,200079bc <__subtf3+0xdba>
20007938:	6a051863          	bnez	a0,20007fe8 <__subtf3+0x13e6>
2000793c:	64a1                	lui	s1,0x8
2000793e:	d036                	sw	a3,32(sp)
20007940:	d276                	sw	t4,36(sp)
20007942:	d41a                	sw	t1,40(sp)
20007944:	85ba                	mv	a1,a4
20007946:	887a                	mv	a6,t5
20007948:	14fd                	add	s1,s1,-1 # 7fff <_start-0x1fff8001>
2000794a:	b12d                	j	20007574 <__subtf3+0x972>
2000794c:	67a1                	lui	a5,0x8
2000794e:	17fd                	add	a5,a5,-1 # 7fff <_start-0x1fff8001>
20007950:	24f28663          	beq	t0,a5,20007b9c <__subtf3+0xf9a>
20007954:	8826                	mv	a6,s1
20007956:	d046                	sw	a7,32(sp)
20007958:	d272                	sw	t3,36(sp)
2000795a:	d47e                	sw	t6,40(sp)
2000795c:	872e                	mv	a4,a1
2000795e:	8432                	mv	s0,a2
20007960:	8496                	mv	s1,t0
20007962:	b909                	j	20007574 <__subtf3+0x972>
20007964:	98b6                	add	a7,a7,a3
20007966:	9fb2                	add	t6,t6,a2
20007968:	00d8b5b3          	sltu	a1,a7,a3
2000796c:	95fe                	add	a1,a1,t6
2000796e:	00cfb7b3          	sltu	a5,t6,a2
20007972:	01f5bfb3          	sltu	t6,a1,t6
20007976:	01d286b3          	add	a3,t0,t4
2000797a:	01f7e7b3          	or	a5,a5,t6
2000797e:	97b6                	add	a5,a5,a3
20007980:	0056b833          	sltu	a6,a3,t0
20007984:	00d7b6b3          	sltu	a3,a5,a3
20007988:	00d86833          	or	a6,a6,a3
2000798c:	953a                	add	a0,a0,a4
2000798e:	86c6                	mv	a3,a7
20007990:	862e                	mv	a2,a1
20007992:	00a80733          	add	a4,a6,a0
20007996:	4485                	li	s1,1
20007998:	b81d                	j	200071ce <__subtf3+0x5cc>
2000799a:	c0040863          	beqz	s0,20006daa <__subtf3+0x1a8>
2000799e:	b2a9                	j	200072e8 <__subtf3+0x6e6>
200079a0:	4842                	lw	a6,16(sp)
200079a2:	02000393          	li	t2,32
200079a6:	406383b3          	sub	t2,t2,t1
200079aa:	c4d2                	sw	s4,72(sp)
200079ac:	00781833          	sll	a6,a6,t2
200079b0:	00655533          	srl	a0,a0,t1
200079b4:	460d                	li	a2,3
200079b6:	4881                	li	a7,0
200079b8:	d02ff06f          	j	20006eba <__subtf3+0x2b8>
200079bc:	6c050a63          	beqz	a0,20008090 <__subtf3+0x148e>
200079c0:	64a1                	lui	s1,0x8
200079c2:	d046                	sw	a7,32(sp)
200079c4:	d272                	sw	t3,36(sp)
200079c6:	d47e                	sw	t6,40(sp)
200079c8:	872e                	mv	a4,a1
200079ca:	8432                	mv	s0,a2
200079cc:	887a                	mv	a6,t5
200079ce:	14fd                	add	s1,s1,-1 # 7fff <_start-0x1fff8001>
200079d0:	b655                	j	20007574 <__subtf3+0x972>
200079d2:	5732                	lw	a4,44(sp)
200079d4:	800609e3          	beqz	a2,200071e6 <__subtf3+0x5e4>
200079d8:	4609                	li	a2,2
200079da:	3ec98763          	beq	s3,a2,20007dc8 <__subtf3+0x11c6>
200079de:	460d                	li	a2,3
200079e0:	3cc98b63          	beq	s3,a2,20007db6 <__subtf3+0x11b4>
200079e4:	3a098e63          	beqz	s3,20007da0 <__subtf3+0x119e>
200079e8:	480d                	li	a6,3
200079ea:	4481                	li	s1,0
200079ec:	02c10893          	add	a7,sp,44
200079f0:	b96ff06f          	j	20006d86 <__subtf3+0x184>
200079f4:	fff807b7          	lui	a5,0xfff80
200079f8:	17fd                	add	a5,a5,-1 # fff7ffff <dummy_file+0xc9f3dbbf>
200079fa:	00f775b3          	and	a1,a4,a5
200079fe:	101c                	add	a5,sp,32
20007a00:	d62e                	sw	a1,44(sp)
20007a02:	0485                	add	s1,s1,1
20007a04:	01f69813          	sll	a6,a3,0x1f
20007a08:	873e                	mv	a4,a5
20007a0a:	02c10893          	add	a7,sp,44
20007a0e:	0016d513          	srl	a0,a3,0x1
20007a12:	4354                	lw	a3,4(a4)
20007a14:	0711                	add	a4,a4,4
20007a16:	01f69613          	sll	a2,a3,0x1f
20007a1a:	8e49                	or	a2,a2,a0
20007a1c:	fec72e23          	sw	a2,-4(a4)
20007a20:	ff1717e3          	bne	a4,a7,20007a0e <__subtf3+0xe0c>
20007a24:	5682                	lw	a3,32(sp)
20007a26:	01003633          	snez	a2,a6
20007a2a:	0015d713          	srl	a4,a1,0x1
20007a2e:	8ed1                	or	a3,a3,a2
20007a30:	6621                	lui	a2,0x8
20007a32:	d63a                	sw	a4,44(sp)
20007a34:	d036                	sw	a3,32(sp)
20007a36:	167d                	add	a2,a2,-1 # 7fff <_start-0x1fff8001>
20007a38:	aec49f63          	bne	s1,a2,20006d36 <__subtf3+0x134>
20007a3c:	14098663          	beqz	s3,20007b88 <__subtf3+0xf86>
20007a40:	470d                	li	a4,3
20007a42:	14e98163          	beq	s3,a4,20007b84 <__subtf3+0xf82>
20007a46:	4709                	li	a4,2
20007a48:	6ce98963          	beq	s3,a4,2000811a <__subtf3+0x1518>
20007a4c:	577d                	li	a4,-1
20007a4e:	64a1                	lui	s1,0x8
20007a50:	d63a                	sw	a4,44(sp)
20007a52:	d43a                	sw	a4,40(sp)
20007a54:	d23a                	sw	a4,36(sp)
20007a56:	d03a                	sw	a4,32(sp)
20007a58:	4815                	li	a6,5
20007a5a:	14f9                	add	s1,s1,-2 # 7ffe <_start-0x1fff8002>
20007a5c:	56fd                	li	a3,-1
20007a5e:	ae4ff06f          	j	20006d42 <__subtf3+0x140>
20007a62:	4805                	li	a6,1
20007a64:	4481                	li	s1,0
20007a66:	02c10893          	add	a7,sp,44
20007a6a:	ad8ff06f          	j	20006d42 <__subtf3+0x140>
20007a6e:	411688b3          	sub	a7,a3,a7
20007a72:	407e87b3          	sub	a5,t4,t2
20007a76:	0116b833          	sltu	a6,a3,a7
20007a7a:	00feb633          	sltu	a2,t4,a5
20007a7e:	86c6                	mv	a3,a7
20007a80:	8332                	mv	t1,a2
20007a82:	410787b3          	sub	a5,a5,a6
20007a86:	405f08b3          	sub	a7,t5,t0
20007a8a:	005f35b3          	sltu	a1,t5,t0
20007a8e:	00080463          	beqz	a6,20007a96 <__subtf3+0xe94>
20007a92:	0dd38063          	beq	t2,t4,20007b52 <__subtf3+0xf50>
20007a96:	406888b3          	sub	a7,a7,t1
20007a9a:	ee4d                	bnez	a2,20007b54 <__subtf3+0xf52>
20007a9c:	862e                	mv	a2,a1
20007a9e:	40a70533          	sub	a0,a4,a0
20007aa2:	40c50733          	sub	a4,a0,a2
20007aa6:	4485                	li	s1,1
20007aa8:	a78ff06f          	j	20006d20 <__subtf3+0x11e>
20007aac:	01eee7b3          	or	a5,t4,t5
20007ab0:	8fd9                	or	a5,a5,a4
20007ab2:	8fd5                	or	a5,a5,a3
20007ab4:	4801                	li	a6,0
20007ab6:	cb81                	beqz	a5,20007ac6 <__subtf3+0xec4>
20007ab8:	01275813          	srl	a6,a4,0x12
20007abc:	00184813          	xor	a6,a6,1
20007ac0:	00187813          	and	a6,a6,1
20007ac4:	0812                	sll	a6,a6,0x4
20007ac6:	d036                	sw	a3,32(sp)
20007ac8:	d276                	sw	t4,36(sp)
20007aca:	d47a                	sw	t5,40(sp)
20007acc:	85ba                	mv	a1,a4
20007ace:	b45d                	j	20007574 <__subtf3+0x972>
20007ad0:	01dfb733          	sltu	a4,t6,t4
20007ad4:	fffe8893          	add	a7,t4,-1
20007ad8:	40af8533          	sub	a0,t6,a0
20007adc:	00153513          	seqz	a0,a0
20007ae0:	8f49                	or	a4,a4,a0
20007ae2:	bca5                	j	2000755a <__subtf3+0x958>
20007ae4:	04b30a63          	beq	t1,a1,20007b38 <__subtf3+0xf36>
20007ae8:	d036                	sw	a3,32(sp)
20007aea:	d27e                	sw	t6,36(sp)
20007aec:	d476                	sw	t4,40(sp)
20007aee:	85ba                	mv	a1,a4
20007af0:	849a                	mv	s1,t1
20007af2:	b449                	j	20007574 <__subtf3+0x972>
20007af4:	8822                	mv	a6,s0
20007af6:	980410e3          	bnez	s0,20007476 <__subtf3+0x874>
20007afa:	5652                	lw	a2,52(sp)
20007afc:	0721                	add	a4,a4,8
20007afe:	00873713          	sltiu	a4,a4,8
20007b02:	963a                	add	a2,a2,a4
20007b04:	00e63733          	sltu	a4,a2,a4
20007b08:	5662                	lw	a2,56(sp)
20007b0a:	4805                	li	a6,1
20007b0c:	963a                	add	a2,a2,a4
20007b0e:	00e63733          	sltu	a4,a2,a4
20007b12:	95ba                	add	a1,a1,a4
20007b14:	b28d                	j	20007476 <__subtf3+0x874>
20007b16:	4805                	li	a6,1
20007b18:	94040fe3          	beqz	s0,20007476 <__subtf3+0x874>
20007b1c:	5652                	lw	a2,52(sp)
20007b1e:	0721                	add	a4,a4,8
20007b20:	00873713          	sltiu	a4,a4,8
20007b24:	963a                	add	a2,a2,a4
20007b26:	00e63733          	sltu	a4,a2,a4
20007b2a:	5662                	lw	a2,56(sp)
20007b2c:	8822                	mv	a6,s0
20007b2e:	963a                	add	a2,a2,a4
20007b30:	00e63733          	sltu	a4,a2,a4
20007b34:	95ba                	add	a1,a1,a4
20007b36:	b281                	j	20007476 <__subtf3+0x874>
20007b38:	01dfe7b3          	or	a5,t6,t4
20007b3c:	8fd9                	or	a5,a5,a4
20007b3e:	8fd5                	or	a5,a5,a3
20007b40:	d7c5                	beqz	a5,20007ae8 <__subtf3+0xee6>
20007b42:	01275813          	srl	a6,a4,0x12
20007b46:	00184813          	xor	a6,a6,1
20007b4a:	00187813          	and	a6,a6,1
20007b4e:	0812                	sll	a6,a6,0x4
20007b50:	bf61                	j	20007ae8 <__subtf3+0xee6>
20007b52:	18fd                	add	a7,a7,-1
20007b54:	41e28633          	sub	a2,t0,t5
20007b58:	00163613          	seqz	a2,a2
20007b5c:	8e4d                	or	a2,a2,a1
20007b5e:	b781                	j	20007a9e <__subtf3+0xe9c>
20007b60:	01dfe7b3          	or	a5,t6,t4
20007b64:	8fd9                	or	a5,a5,a4
20007b66:	8fd5                	or	a5,a5,a3
20007b68:	4801                	li	a6,0
20007b6a:	cb81                	beqz	a5,20007b7a <__subtf3+0xf78>
20007b6c:	01275813          	srl	a6,a4,0x12
20007b70:	00184813          	xor	a6,a6,1
20007b74:	00187813          	and	a6,a6,1
20007b78:	0812                	sll	a6,a6,0x4
20007b7a:	d036                	sw	a3,32(sp)
20007b7c:	d27e                	sw	t6,36(sp)
20007b7e:	d476                	sw	t4,40(sp)
20007b80:	85ba                	mv	a1,a4
20007b82:	bacd                	j	20007574 <__subtf3+0x972>
20007b84:	ec0414e3          	bnez	s0,20007a4c <__subtf3+0xe4a>
20007b88:	64a1                	lui	s1,0x8
20007b8a:	d602                	sw	zero,44(sp)
20007b8c:	d402                	sw	zero,40(sp)
20007b8e:	d202                	sw	zero,36(sp)
20007b90:	d002                	sw	zero,32(sp)
20007b92:	4701                	li	a4,0
20007b94:	14fd                	add	s1,s1,-1 # 7fff <_start-0x1fff8001>
20007b96:	4815                	li	a6,5
20007b98:	e6cff06f          	j	20007204 <__subtf3+0x602>
20007b9c:	01fe67b3          	or	a5,t3,t6
20007ba0:	0117e7b3          	or	a5,a5,a7
20007ba4:	8fcd                	or	a5,a5,a1
20007ba6:	da0787e3          	beqz	a5,20007954 <__subtf3+0xd52>
20007baa:	0125d493          	srl	s1,a1,0x12
20007bae:	0014c493          	xor	s1,s1,1
20007bb2:	8885                	and	s1,s1,1
20007bb4:	0492                	sll	s1,s1,0x4
20007bb6:	bb79                	j	20007954 <__subtf3+0xd52>
20007bb8:	6521                	lui	a0,0x8
20007bba:	157d                	add	a0,a0,-1 # 7fff <_start-0x1fff8001>
20007bbc:	52a48563          	beq	s1,a0,200080e6 <__subtf3+0x14e4>
20007bc0:	3ea80063          	beq	a6,a0,20007fa0 <__subtf3+0x139e>
20007bc4:	3e060763          	beqz	a2,20007fb2 <__subtf3+0x13b0>
20007bc8:	01fe6633          	or	a2,t3,t6
20007bcc:	01166633          	or	a2,a2,a7
20007bd0:	8e4d                	or	a2,a2,a1
20007bd2:	56060263          	beqz	a2,20008136 <__subtf3+0x1534>
20007bd6:	67a1                	lui	a5,0x8
20007bd8:	02c10893          	add	a7,sp,44
20007bdc:	d63e                	sw	a5,44(sp)
20007bde:	d402                	sw	zero,40(sp)
20007be0:	d202                	sw	zero,36(sp)
20007be2:	d002                	sw	zero,32(sp)
20007be4:	101c                	add	a5,sp,32
20007be6:	8746                	mv	a4,a7
20007be8:	6621                	lui	a2,0x8
20007bea:	00361593          	sll	a1,a2,0x3
20007bee:	ffc72603          	lw	a2,-4(a4)
20007bf2:	1771                	add	a4,a4,-4
20007bf4:	01d65693          	srl	a3,a2,0x1d
20007bf8:	8ecd                	or	a3,a3,a1
20007bfa:	c354                	sw	a3,4(a4)
20007bfc:	fee797e3          	bne	a5,a4,20007bea <__subtf3+0xfe8>
20007c00:	5732                	lw	a4,44(sp)
20007c02:	000806b7          	lui	a3,0x80
20007c06:	881a                	mv	a6,t1
20007c08:	8ef9                	and	a3,a3,a4
20007c0a:	64a1                	lui	s1,0x8
20007c0c:	14fd                	add	s1,s1,-1 # 7fff <_start-0x1fff8001>
20007c0e:	4401                	li	s0,0
20007c10:	de6ff06f          	j	200071f6 <__subtf3+0x5f4>
20007c14:	c4d2                	sw	s4,72(sp)
20007c16:	41f2d793          	sra	a5,t0,0x1f
20007c1a:	00249713          	sll	a4,s1,0x2
20007c1e:	83ed                	srl	a5,a5,0x1b
20007c20:	04070713          	add	a4,a4,64
20007c24:	92be                	add	t0,t0,a5
20007c26:	970a                	add	a4,a4,sp
20007c28:	fc072703          	lw	a4,-64(a4)
20007c2c:	01f2f293          	and	t0,t0,31
20007c30:	405787b3          	sub	a5,a5,t0
20007c34:	02078a13          	add	s4,a5,32 # 8020 <_start-0x1fff7fe0>
20007c38:	014717b3          	sll	a5,a4,s4
20007c3c:	8edd                	or	a3,a3,a5
20007c3e:	50040563          	beqz	s0,20008148 <__subtf3+0x1546>
20007c42:	00239493          	sll	s1,t2,0x2
20007c46:	009e87b3          	add	a5,t4,s1
20007c4a:	0f21                	add	t5,t5,8
20007c4c:	409004b3          	neg	s1,s1
20007c50:	4398                	lw	a4,0(a5)
20007c52:	43c8                	lw	a0,4(a5)
20007c54:	009782b3          	add	t0,a5,s1
20007c58:	00675733          	srl	a4,a4,t1
20007c5c:	01451533          	sll	a0,a0,s4
20007c60:	8f49                	or	a4,a4,a0
20007c62:	00e2a023          	sw	a4,0(t0)
20007c66:	0791                	add	a5,a5,4
20007c68:	feff14e3          	bne	t5,a5,20007c50 <__subtf3+0x104e>
20007c6c:	4532                	lw	a0,12(sp)
20007c6e:	00241713          	sll	a4,s0,0x2
20007c72:	04070793          	add	a5,a4,64
20007c76:	00278733          	add	a4,a5,sp
20007c7a:	00655533          	srl	a0,a0,t1
20007c7e:	4791                	li	a5,4
20007c80:	4a26                	lw	s4,72(sp)
20007c82:	407787b3          	sub	a5,a5,t2
20007c86:	fca72023          	sw	a0,-64(a4)
20007c8a:	b20ff06f          	j	20006faa <__subtf3+0x3a8>
20007c8e:	d046                	sw	a7,32(sp)
20007c90:	d272                	sw	t3,36(sp)
20007c92:	d47e                	sw	t6,40(sp)
20007c94:	d62e                	sw	a1,44(sp)
20007c96:	1e050963          	beqz	a0,20007e88 <__subtf3+0x1286>
20007c9a:	86c6                	mv	a3,a7
20007c9c:	8432                	mv	s0,a2
20007c9e:	101c                	add	a5,sp,32
20007ca0:	f70ff06f          	j	20007410 <__subtf3+0x80e>
20007ca4:	408e07b3          	sub	a5,t3,s0
20007ca8:	40d886b3          	sub	a3,a7,a3
20007cac:	00d8b833          	sltu	a6,a7,a3
20007cb0:	00fe3333          	sltu	t1,t3,a5
20007cb4:	407f8733          	sub	a4,t6,t2
20007cb8:	410787b3          	sub	a5,a5,a6
20007cbc:	8e9a                	mv	t4,t1
20007cbe:	00efb833          	sltu	a6,t6,a4
20007cc2:	00d8f663          	bgeu	a7,a3,20007cce <__subtf3+0x10cc>
20007cc6:	fff70893          	add	a7,a4,-1
20007cca:	35c40a63          	beq	s0,t3,2000801e <__subtf3+0x141c>
20007cce:	41d708b3          	sub	a7,a4,t4
20007cd2:	34031663          	bnez	t1,2000801e <__subtf3+0x141c>
20007cd6:	40a58733          	sub	a4,a1,a0
20007cda:	41070733          	sub	a4,a4,a6
20007cde:	8432                	mv	s0,a2
20007ce0:	4485                	li	s1,1
20007ce2:	83eff06f          	j	20006d20 <__subtf3+0x11e>
20007ce6:	41ce87b3          	sub	a5,t4,t3
20007cea:	41168f33          	sub	t5,a3,a7
20007cee:	01e6b833          	sltu	a6,a3,t5
20007cf2:	00feb533          	sltu	a0,t4,a5
20007cf6:	83aa                	mv	t2,a0
20007cf8:	410787b3          	sub	a5,a5,a6
20007cfc:	01f332b3          	sltu	t0,t1,t6
20007d00:	41f30833          	sub	a6,t1,t6
20007d04:	01e6f463          	bgeu	a3,t5,20007d0c <__subtf3+0x110a>
20007d08:	37de0563          	beq	t3,t4,20008072 <__subtf3+0x1470>
20007d0c:	40780833          	sub	a6,a6,t2
20007d10:	36051263          	bnez	a0,20008074 <__subtf3+0x1472>
20007d14:	40b70533          	sub	a0,a4,a1
20007d18:	40550533          	sub	a0,a0,t0
20007d1c:	d62a                	sw	a0,44(sp)
20007d1e:	d442                	sw	a6,40(sp)
20007d20:	d23e                	sw	a5,36(sp)
20007d22:	d07a                	sw	t5,32(sp)
20007d24:	00c51293          	sll	t0,a0,0xc
20007d28:	3202d763          	bgez	t0,20008056 <__subtf3+0x1454>
20007d2c:	40d88f33          	sub	t5,a7,a3
20007d30:	41de07b3          	sub	a5,t3,t4
20007d34:	01e8b833          	sltu	a6,a7,t5
20007d38:	00fe32b3          	sltu	t0,t3,a5
20007d3c:	406f8333          	sub	t1,t6,t1
20007d40:	410787b3          	sub	a5,a5,a6
20007d44:	86fa                	mv	a3,t5
20007d46:	8516                	mv	a0,t0
20007d48:	006fb833          	sltu	a6,t6,t1
20007d4c:	01e8f463          	bgeu	a7,t5,20007d54 <__subtf3+0x1152>
20007d50:	41de0263          	beq	t3,t4,20008154 <__subtf3+0x1552>
20007d54:	40a30533          	sub	a0,t1,a0
20007d58:	40029063          	bnez	t0,20008158 <__subtf3+0x1556>
20007d5c:	8d99                	sub	a1,a1,a4
20007d5e:	410585b3          	sub	a1,a1,a6
20007d62:	d23e                	sw	a5,36(sp)
20007d64:	8e3e                	mv	t3,a5
20007d66:	8faa                	mv	t6,a0
20007d68:	d62e                	sw	a1,44(sp)
20007d6a:	d42a                	sw	a0,40(sp)
20007d6c:	d07a                	sw	t5,32(sp)
20007d6e:	8432                	mv	s0,a2
20007d70:	101c                	add	a5,sp,32
20007d72:	b2f1                	j	2000773e <__subtf3+0xb3c>
20007d74:	01fe67b3          	or	a5,t3,t6
20007d78:	0117e7b3          	or	a5,a5,a7
20007d7c:	8fcd                	or	a5,a5,a1
20007d7e:	4681                	li	a3,0
20007d80:	c799                	beqz	a5,20007d8e <__subtf3+0x118c>
20007d82:	0125d693          	srl	a3,a1,0x12
20007d86:	0016c693          	xor	a3,a3,1
20007d8a:	8a85                	and	a3,a3,1
20007d8c:	0692                	sll	a3,a3,0x4
20007d8e:	84c2                	mv	s1,a6
20007d90:	d046                	sw	a7,32(sp)
20007d92:	d272                	sw	t3,36(sp)
20007d94:	d47e                	sw	t6,40(sp)
20007d96:	872e                	mv	a4,a1
20007d98:	8432                	mv	s0,a2
20007d9a:	8836                	mv	a6,a3
20007d9c:	fd8ff06f          	j	20007574 <__subtf3+0x972>
20007da0:	00f6f613          	and	a2,a3,15
20007da4:	4591                	li	a1,4
20007da6:	42b61d63          	bne	a2,a1,200081e0 <__subtf3+0x15de>
20007daa:	4481                	li	s1,0
20007dac:	480d                	li	a6,3
20007dae:	02c10893          	add	a7,sp,44
20007db2:	fd5fe06f          	j	20006d86 <__subtf3+0x184>
20007db6:	c20419e3          	bnez	s0,200079e8 <__subtf3+0xde6>
20007dba:	4481                	li	s1,0
20007dbc:	4405                	li	s0,1
20007dbe:	4805                	li	a6,1
20007dc0:	02c10893          	add	a7,sp,44
20007dc4:	da8ff06f          	j	2000736c <__subtf3+0x76a>
20007dc8:	d06d                	beqz	s0,20007daa <__subtf3+0x11a8>
20007dca:	8822                	mv	a6,s0
20007dcc:	4481                	li	s1,0
20007dce:	02c10893          	add	a7,sp,44
20007dd2:	dccff06f          	j	2000739e <__subtf3+0x79c>
20007dd6:	05f00793          	li	a5,95
20007dda:	010a1a33          	sll	s4,s4,a6
20007dde:	3ac7d363          	bge	a5,a2,20008184 <__subtf3+0x1582>
20007de2:	d652                	sw	s4,44(sp)
20007de4:	4709                	li	a4,2
20007de6:	4a26                	lw	s4,72(sp)
20007de8:	101c                	add	a5,sp,32
20007dea:	b0a1                	j	20007632 <__subtf3+0xa30>
20007dec:	5682                	lw	a3,32(sp)
20007dee:	5eb2                	lw	t4,44(sp)
20007df0:	02000e13          	li	t3,32
20007df4:	40ee0e33          	sub	t3,t3,a4
20007df8:	01c696b3          	sll	a3,a3,t3
20007dfc:	00eedeb3          	srl	t4,t4,a4
20007e00:	450d                	li	a0,3
20007e02:	4581                	li	a1,0
20007e04:	b04d                	j	200076a6 <__subtf3+0xaa4>
20007e06:	41f2d493          	sra	s1,t0,0x1f
20007e0a:	88fd                	and	s1,s1,31
20007e0c:	9496                	add	s1,s1,t0
20007e0e:	c4d2                	sw	s4,72(sp)
20007e10:	47fd                	li	a5,31
20007e12:	8495                	sra	s1,s1,0x5
20007e14:	ae57c463          	blt	a5,t0,200070fc <__subtf3+0x4fa>
20007e18:	83a6                	mv	t2,s1
20007e1a:	4681                	li	a3,0
20007e1c:	4481                	li	s1,0
20007e1e:	af6ff06f          	j	20007114 <__subtf3+0x512>
20007e22:	4705                	li	a4,1
20007e24:	b0d5                	j	20007708 <__subtf3+0xb06>
20007e26:	4785                	li	a5,1
20007e28:	ce8ff06f          	j	20007310 <__subtf3+0x70e>
20007e2c:	45c2                	lw	a1,16(sp)
20007e2e:	02000393          	li	t2,32
20007e32:	406383b3          	sub	t2,t2,t1
20007e36:	c4d2                	sw	s4,72(sp)
20007e38:	007595b3          	sll	a1,a1,t2
20007e3c:	00655533          	srl	a0,a0,t1
20007e40:	460d                	li	a2,3
20007e42:	4881                	li	a7,0
20007e44:	a2cff06f          	j	20007070 <__subtf3+0x46e>
20007e48:	67a1                	lui	a5,0x8
20007e4a:	17fd                	add	a5,a5,-1 # 7fff <_start-0x1fff8001>
20007e4c:	00f28a63          	beq	t0,a5,20007e60 <__subtf3+0x125e>
20007e50:	8826                	mv	a6,s1
20007e52:	d046                	sw	a7,32(sp)
20007e54:	d272                	sw	t3,36(sp)
20007e56:	d47e                	sw	t6,40(sp)
20007e58:	872e                	mv	a4,a1
20007e5a:	8496                	mv	s1,t0
20007e5c:	f18ff06f          	j	20007574 <__subtf3+0x972>
20007e60:	01fe67b3          	or	a5,t3,t6
20007e64:	0117e7b3          	or	a5,a5,a7
20007e68:	8fcd                	or	a5,a5,a1
20007e6a:	d3fd                	beqz	a5,20007e50 <__subtf3+0x124e>
20007e6c:	0125d493          	srl	s1,a1,0x12
20007e70:	0014c493          	xor	s1,s1,1
20007e74:	8885                	and	s1,s1,1
20007e76:	0492                	sll	s1,s1,0x4
20007e78:	bfe1                	j	20007e50 <__subtf3+0x124e>
20007e7a:	fff30813          	add	a6,t1,-1
20007e7e:	00133313          	seqz	t1,t1
20007e82:	006fefb3          	or	t6,t6,t1
20007e86:	bca5                	j	200078fe <__subtf3+0xcfc>
20007e88:	19f9                	add	s3,s3,-2
20007e8a:	0019b413          	seqz	s0,s3
20007e8e:	e6cff06f          	j	200074fa <__subtf3+0x8f8>
20007e92:	d046                	sw	a7,32(sp)
20007e94:	d272                	sw	t3,36(sp)
20007e96:	d47e                	sw	t6,40(sp)
20007e98:	d62e                	sw	a1,44(sp)
20007e9a:	86c6                	mv	a3,a7
20007e9c:	101c                	add	a5,sp,32
20007e9e:	b045                	j	2000773e <__subtf3+0xb3c>
20007ea0:	98b6                	add	a7,a7,a3
20007ea2:	00fe0633          	add	a2,t3,a5
20007ea6:	00d8b533          	sltu	a0,a7,a3
20007eaa:	9532                	add	a0,a0,a2
20007eac:	01c637b3          	sltu	a5,a2,t3
20007eb0:	00c53633          	sltu	a2,a0,a2
20007eb4:	01df86b3          	add	a3,t6,t4
20007eb8:	8fd1                	or	a5,a5,a2
20007eba:	97b6                	add	a5,a5,a3
20007ebc:	01f6b633          	sltu	a2,a3,t6
20007ec0:	00d7beb3          	sltu	t4,a5,a3
20007ec4:	8fbe                	mv	t6,a5
20007ec6:	95ba                	add	a1,a1,a4
20007ec8:	01d667b3          	or	a5,a2,t4
20007ecc:	95be                	add	a1,a1,a5
20007ece:	d046                	sw	a7,32(sp)
20007ed0:	d22a                	sw	a0,36(sp)
20007ed2:	d47e                	sw	t6,40(sp)
20007ed4:	00c59793          	sll	a5,a1,0xc
20007ed8:	86c6                	mv	a3,a7
20007eda:	8e2a                	mv	t3,a0
20007edc:	2207db63          	bgez	a5,20008112 <__subtf3+0x1510>
20007ee0:	fff807b7          	lui	a5,0xfff80
20007ee4:	17fd                	add	a5,a5,-1 # fff7ffff <dummy_file+0xc9f3dbbf>
20007ee6:	8dfd                	and	a1,a1,a5
20007ee8:	872e                	mv	a4,a1
20007eea:	4801                	li	a6,0
20007eec:	4485                	li	s1,1
20007eee:	e86ff06f          	j	20007574 <__subtf3+0x972>
20007ef2:	829a                	mv	t0,t1
20007ef4:	4381                	li	t2,0
20007ef6:	4a0d                	li	s4,3
20007ef8:	4681                	li	a3,0
20007efa:	00249713          	sll	a4,s1,0x2
20007efe:	41f2d793          	sra	a5,t0,0x1f
20007f02:	83ed                	srl	a5,a5,0x1b
20007f04:	04070713          	add	a4,a4,64
20007f08:	00f28633          	add	a2,t0,a5
20007f0c:	970a                	add	a4,a4,sp
20007f0e:	fc072703          	lw	a4,-64(a4)
20007f12:	8a7d                	and	a2,a2,31
20007f14:	8f91                	sub	a5,a5,a2
20007f16:	02078493          	add	s1,a5,32
20007f1a:	009717b3          	sll	a5,a4,s1
20007f1e:	8edd                	or	a3,a3,a5
20007f20:	280a0763          	beqz	s4,200081ae <__subtf3+0x15ac>
20007f24:	00239293          	sll	t0,t2,0x2
20007f28:	005e87b3          	add	a5,t4,t0
20007f2c:	0f21                	add	t5,t5,8
20007f2e:	405002b3          	neg	t0,t0
20007f32:	4398                	lw	a4,0(a5)
20007f34:	43d0                	lw	a2,4(a5)
20007f36:	00578533          	add	a0,a5,t0
20007f3a:	00675733          	srl	a4,a4,t1
20007f3e:	00961633          	sll	a2,a2,s1
20007f42:	8f51                	or	a4,a4,a2
20007f44:	c118                	sw	a4,0(a0)
20007f46:	0791                	add	a5,a5,4
20007f48:	ffe795e3          	bne	a5,t5,20007f32 <__subtf3+0x1330>
20007f4c:	4632                	lw	a2,12(sp)
20007f4e:	002a1713          	sll	a4,s4,0x2
20007f52:	04070793          	add	a5,a4,64
20007f56:	00278733          	add	a4,a5,sp
20007f5a:	00665633          	srl	a2,a2,t1
20007f5e:	4791                	li	a5,4
20007f60:	407787b3          	sub	a5,a5,t2
20007f64:	fcc72023          	sw	a2,-64(a4)
20007f68:	9d6ff06f          	j	2000713e <__subtf3+0x53c>
20007f6c:	98b6                	add	a7,a7,a3
20007f6e:	9e3e                	add	t3,t3,a5
20007f70:	00d8b633          	sltu	a2,a7,a3
20007f74:	9672                	add	a2,a2,t3
20007f76:	00fe37b3          	sltu	a5,t3,a5
20007f7a:	01c63e33          	sltu	t3,a2,t3
20007f7e:	9f9e                	add	t6,t6,t2
20007f80:	01c7e7b3          	or	a5,a5,t3
20007f84:	97fe                	add	a5,a5,t6
20007f86:	007fb833          	sltu	a6,t6,t2
20007f8a:	01f7bfb3          	sltu	t6,a5,t6
20007f8e:	01f86833          	or	a6,a6,t6
20007f92:	00b50733          	add	a4,a0,a1
20007f96:	86c6                	mv	a3,a7
20007f98:	9742                	add	a4,a4,a6
20007f9a:	4485                	li	s1,1
20007f9c:	a32ff06f          	j	200071ce <__subtf3+0x5cc>
20007fa0:	01fe6533          	or	a0,t3,t6
20007fa4:	01156533          	or	a0,a0,a7
20007fa8:	8d4d                	or	a0,a0,a1
20007faa:	20051763          	bnez	a0,200081b8 <__subtf3+0x15b6>
20007fae:	18061463          	bnez	a2,20008136 <__subtf3+0x1534>
20007fb2:	64a1                	lui	s1,0x8
20007fb4:	d046                	sw	a7,32(sp)
20007fb6:	d272                	sw	t3,36(sp)
20007fb8:	d47e                	sw	t6,40(sp)
20007fba:	872e                	mv	a4,a1
20007fbc:	881a                	mv	a6,t1
20007fbe:	14fd                	add	s1,s1,-1 # 7fff <_start-0x1fff8001>
20007fc0:	db4ff06f          	j	20007574 <__subtf3+0x972>
20007fc4:	14078e63          	beqz	a5,20008120 <__subtf3+0x151e>
20007fc8:	01275f13          	srl	t5,a4,0x12
20007fcc:	001f4f13          	xor	t5,t5,1
20007fd0:	001f7f13          	and	t5,t5,1
20007fd4:	0f12                	sll	t5,t5,0x4
20007fd6:	969811e3          	bne	a6,s1,20007938 <__subtf3+0xd36>
20007fda:	960501e3          	beqz	a0,2000793c <__subtf3+0xd3a>
20007fde:	00d59793          	sll	a5,a1,0xd
20007fe2:	0007c363          	bltz	a5,20007fe8 <__subtf3+0x13e6>
20007fe6:	4f41                	li	t5,16
20007fe8:	67a1                	lui	a5,0x8
20007fea:	02c10893          	add	a7,sp,44
20007fee:	d63e                	sw	a5,44(sp)
20007ff0:	d402                	sw	zero,40(sp)
20007ff2:	d202                	sw	zero,36(sp)
20007ff4:	d002                	sw	zero,32(sp)
20007ff6:	101c                	add	a5,sp,32
20007ff8:	8746                	mv	a4,a7
20007ffa:	6621                	lui	a2,0x8
20007ffc:	00361593          	sll	a1,a2,0x3
20008000:	ffc72603          	lw	a2,-4(a4)
20008004:	1771                	add	a4,a4,-4
20008006:	01d65693          	srl	a3,a2,0x1d
2000800a:	8ecd                	or	a3,a3,a1
2000800c:	c354                	sw	a3,4(a4)
2000800e:	fee797e3          	bne	a5,a4,20007ffc <__subtf3+0x13fa>
20008012:	5732                	lw	a4,44(sp)
20008014:	000806b7          	lui	a3,0x80
20008018:	887a                	mv	a6,t5
2000801a:	8ef9                	and	a3,a3,a4
2000801c:	b6fd                	j	20007c0a <__subtf3+0x1008>
2000801e:	41f38733          	sub	a4,t2,t6
20008022:	00173713          	seqz	a4,a4
20008026:	00e86833          	or	a6,a6,a4
2000802a:	b175                	j	20007cd6 <__subtf3+0x10d4>
2000802c:	01fe6733          	or	a4,t3,t6
20008030:	01176733          	or	a4,a4,a7
20008034:	8f4d                	or	a4,a4,a1
20008036:	4781                	li	a5,0
20008038:	c719                	beqz	a4,20008046 <__subtf3+0x1444>
2000803a:	0125d793          	srl	a5,a1,0x12
2000803e:	0017c793          	xor	a5,a5,1
20008042:	8b85                	and	a5,a5,1
20008044:	0792                	sll	a5,a5,0x4
20008046:	84c2                	mv	s1,a6
20008048:	d046                	sw	a7,32(sp)
2000804a:	d272                	sw	t3,36(sp)
2000804c:	d47e                	sw	t6,40(sp)
2000804e:	872e                	mv	a4,a1
20008050:	883e                	mv	a6,a5
20008052:	d22ff06f          	j	20007574 <__subtf3+0x972>
20008056:	00ff6733          	or	a4,t5,a5
2000805a:	01076733          	or	a4,a4,a6
2000805e:	8f49                	or	a4,a4,a0
20008060:	e20704e3          	beqz	a4,20007e88 <__subtf3+0x1286>
20008064:	8e3e                	mv	t3,a5
20008066:	8fc2                	mv	t6,a6
20008068:	85aa                	mv	a1,a0
2000806a:	86fa                	mv	a3,t5
2000806c:	101c                	add	a5,sp,32
2000806e:	ba2ff06f          	j	20007410 <__subtf3+0x80e>
20008072:	187d                	add	a6,a6,-1
20008074:	406f8533          	sub	a0,t6,t1
20008078:	00153513          	seqz	a0,a0
2000807c:	00a2e2b3          	or	t0,t0,a0
20008080:	b951                	j	20007d14 <__subtf3+0x1112>
20008082:	4785                	li	a5,1
20008084:	f16ff06f          	j	2000779a <__subtf3+0xb98>
20008088:	10051563          	bnez	a0,20008192 <__subtf3+0x1590>
2000808c:	8a0798e3          	bnez	a5,2000793c <__subtf3+0xd3a>
20008090:	67a1                	lui	a5,0x8
20008092:	02c10893          	add	a7,sp,44
20008096:	d63e                	sw	a5,44(sp)
20008098:	d402                	sw	zero,40(sp)
2000809a:	d202                	sw	zero,36(sp)
2000809c:	d002                	sw	zero,32(sp)
2000809e:	101c                	add	a5,sp,32
200080a0:	8746                	mv	a4,a7
200080a2:	6621                	lui	a2,0x8
200080a4:	00361593          	sll	a1,a2,0x3
200080a8:	ffc72603          	lw	a2,-4(a4)
200080ac:	1771                	add	a4,a4,-4
200080ae:	01d65693          	srl	a3,a2,0x1d
200080b2:	8ecd                	or	a3,a3,a1
200080b4:	c354                	sw	a3,4(a4)
200080b6:	fee797e3          	bne	a5,a4,200080a4 <__subtf3+0x14a2>
200080ba:	5732                	lw	a4,44(sp)
200080bc:	000806b7          	lui	a3,0x80
200080c0:	4841                	li	a6,16
200080c2:	8ef9                	and	a3,a3,a4
200080c4:	b699                	j	20007c0a <__subtf3+0x1008>
200080c6:	01fe67b3          	or	a5,t3,t6
200080ca:	0117e7b3          	or	a5,a5,a7
200080ce:	8fcd                	or	a5,a5,a1
200080d0:	4801                	li	a6,0
200080d2:	d80780e3          	beqz	a5,20007e52 <__subtf3+0x1250>
200080d6:	0125d813          	srl	a6,a1,0x12
200080da:	00184813          	xor	a6,a6,1
200080de:	00187813          	and	a6,a6,1
200080e2:	0812                	sll	a6,a6,0x4
200080e4:	b3bd                	j	20007e52 <__subtf3+0x1250>
200080e6:	ce35                	beqz	a2,20008162 <__subtf3+0x1560>
200080e8:	01275313          	srl	t1,a4,0x12
200080ec:	00134313          	xor	t1,t1,1
200080f0:	00137313          	and	t1,t1,1
200080f4:	0312                	sll	t1,t1,0x4
200080f6:	ac9819e3          	bne	a6,s1,20007bc8 <__subtf3+0xfc6>
200080fa:	01fe6633          	or	a2,t3,t6
200080fe:	01166633          	or	a2,a2,a7
20008102:	8e4d                	or	a2,a2,a1
20008104:	ca0d                	beqz	a2,20008136 <__subtf3+0x1534>
20008106:	00d59793          	sll	a5,a1,0xd
2000810a:	ac07c6e3          	bltz	a5,20007bd6 <__subtf3+0xfd4>
2000810e:	4341                	li	t1,16
20008110:	b4d9                	j	20007bd6 <__subtf3+0xfd4>
20008112:	d62e                	sw	a1,44(sp)
20008114:	101c                	add	a5,sp,32
20008116:	e28ff06f          	j	2000773e <__subtf3+0xb3c>
2000811a:	920409e3          	beqz	s0,20007a4c <__subtf3+0xe4a>
2000811e:	b4ad                	j	20007b88 <__subtf3+0xf86>
20008120:	88981ee3          	bne	a6,s1,200079bc <__subtf3+0xdba>
20008124:	d535                	beqz	a0,20008090 <__subtf3+0x148e>
20008126:	0125d713          	srl	a4,a1,0x12
2000812a:	00174713          	xor	a4,a4,1
2000812e:	8b05                	and	a4,a4,1
20008130:	00471f13          	sll	t5,a4,0x4
20008134:	b071                	j	200079c0 <__subtf3+0xdbe>
20008136:	64a1                	lui	s1,0x8
20008138:	d036                	sw	a3,32(sp)
2000813a:	d23e                	sw	a5,36(sp)
2000813c:	d476                	sw	t4,40(sp)
2000813e:	85ba                	mv	a1,a4
20008140:	881a                	mv	a6,t1
20008142:	14fd                	add	s1,s1,-1 # 7fff <_start-0x1fff8001>
20008144:	c30ff06f          	j	20007574 <__subtf3+0x972>
20008148:	4a26                	lw	s4,72(sp)
2000814a:	00655333          	srl	t1,a0,t1
2000814e:	4785                	li	a5,1
20008150:	e63fe06f          	j	20006fb2 <__subtf3+0x3b0>
20008154:	fff30513          	add	a0,t1,-1
20008158:	00133313          	seqz	t1,t1
2000815c:	00686833          	or	a6,a6,t1
20008160:	bef5                	j	20007d5c <__subtf3+0x115a>
20008162:	e49818e3          	bne	a6,s1,20007fb2 <__subtf3+0x13b0>
20008166:	01fe67b3          	or	a5,t3,t6
2000816a:	0117e7b3          	or	a5,a5,a7
2000816e:	8fcd                	or	a5,a5,a1
20008170:	e40781e3          	beqz	a5,20007fb2 <__subtf3+0x13b0>
20008174:	0125d793          	srl	a5,a1,0x12
20008178:	0017c793          	xor	a5,a5,1
2000817c:	8b85                	and	a5,a5,1
2000817e:	00479313          	sll	t1,a5,0x4
20008182:	bd05                	j	20007fb2 <__subtf3+0x13b0>
20008184:	02000e13          	li	t3,32
20008188:	410e0e33          	sub	t3,t3,a6
2000818c:	4589                	li	a1,2
2000818e:	c58ff06f          	j	200075e6 <__subtf3+0x9e4>
20008192:	00d59713          	sll	a4,a1,0xd
20008196:	00074363          	bltz	a4,2000819c <__subtf3+0x159a>
2000819a:	4f41                	li	t5,16
2000819c:	e40796e3          	bnez	a5,20007fe8 <__subtf3+0x13e6>
200081a0:	b005                	j	200079c0 <__subtf3+0xdbe>
200081a2:	c4d2                	sw	s4,72(sp)
200081a4:	829a                	mv	t0,t1
200081a6:	4381                	li	t2,0
200081a8:	440d                	li	s0,3
200081aa:	4681                	li	a3,0
200081ac:	b4ad                	j	20007c16 <__subtf3+0x1014>
200081ae:	00655333          	srl	t1,a0,t1
200081b2:	4785                	li	a5,1
200081b4:	f93fe06f          	j	20007146 <__subtf3+0x544>
200081b8:	00d59793          	sll	a5,a1,0xd
200081bc:	0007d563          	bgez	a5,200081c6 <__subtf3+0x15c4>
200081c0:	a0061be3          	bnez	a2,20007bd6 <__subtf3+0xfd4>
200081c4:	b3fd                	j	20007fb2 <__subtf3+0x13b0>
200081c6:	f621                	bnez	a2,2000810e <__subtf3+0x150c>
200081c8:	4341                	li	t1,16
200081ca:	b3e5                	j	20007fb2 <__subtf3+0x13b0>
200081cc:	4e52                	lw	t3,20(sp)
200081ce:	4fe2                	lw	t6,24(sp)
200081d0:	45f2                	lw	a1,28(sp)
200081d2:	d51fe06f          	j	20006f22 <__subtf3+0x320>
200081d6:	4e52                	lw	t3,20(sp)
200081d8:	4fe2                	lw	t6,24(sp)
200081da:	45f2                	lw	a1,28(sp)
200081dc:	eddfe06f          	j	200070b8 <__subtf3+0x4b6>
200081e0:	4481                	li	s1,0
200081e2:	4305                	li	t1,1
200081e4:	4805                	li	a6,1
200081e6:	02c10893          	add	a7,sp,44
200081ea:	b75fe06f          	j	20006d5e <__subtf3+0x15c>
200081ee:	4801                	li	a6,0
200081f0:	b97fe06f          	j	20006d86 <__subtf3+0x184>
200081f4:	8832                	mv	a6,a2
200081f6:	863e                	mv	a2,a5
200081f8:	bdeff06f          	j	200075d6 <__subtf3+0x9d4>
200081fc:	4a26                	lw	s4,72(sp)
200081fe:	84cff06f          	j	2000724a <__subtf3+0x648>

20008202 <__fixtfsi>:
20008202:	4118                	lw	a4,0(a0)
20008204:	414c                	lw	a1,4(a0)
20008206:	4510                	lw	a2,8(a0)
20008208:	455c                	lw	a5,12(a0)
2000820a:	1101                	add	sp,sp,-32
2000820c:	002026f3          	frrm	a3
20008210:	6691                	lui	a3,0x4
20008212:	00179513          	sll	a0,a5,0x1
20008216:	01079813          	sll	a6,a5,0x10
2000821a:	c03a                	sw	a4,0(sp)
2000821c:	c22e                	sw	a1,4(sp)
2000821e:	c432                	sw	a2,8(sp)
20008220:	c63e                	sw	a5,12(sp)
20008222:	c83a                	sw	a4,16(sp)
20008224:	ca2e                	sw	a1,20(sp)
20008226:	cc32                	sw	a2,24(sp)
20008228:	8145                	srl	a0,a0,0x11
2000822a:	16f9                	add	a3,a3,-2 # 3ffe <_start-0x1fffc002>
2000822c:	01085813          	srl	a6,a6,0x10
20008230:	00a6cd63          	blt	a3,a0,2000824a <__fixtfsi+0x48>
20008234:	e955                	bnez	a0,200082e8 <__fixtfsi+0xe6>
20008236:	8f4d                	or	a4,a4,a1
20008238:	8f51                	or	a4,a4,a2
2000823a:	01076733          	or	a4,a4,a6
2000823e:	c701                	beqz	a4,20008246 <__fixtfsi+0x44>
20008240:	4885                	li	a7,1
20008242:	0018a073          	csrs	fflags,a7
20008246:	6105                	add	sp,sp,32
20008248:	8082                	ret
2000824a:	6691                	lui	a3,0x4
2000824c:	83fd                	srl	a5,a5,0x1f
2000824e:	06f5                	add	a3,a3,29 # 401d <_start-0x1fffbfe3>
20008250:	88be                	mv	a7,a5
20008252:	08a6c063          	blt	a3,a0,200082d2 <__fixtfsi+0xd0>
20008256:	6711                	lui	a4,0x4
20008258:	06f70713          	add	a4,a4,111 # 406f <_start-0x1fffbf91>
2000825c:	40a706b3          	sub	a3,a4,a0
20008260:	4056de13          	sra	t3,a3,0x5
20008264:	6741                	lui	a4,0x10
20008266:	00e86833          	or	a6,a6,a4
2000826a:	002e1893          	sll	a7,t3,0x2
2000826e:	0818                	add	a4,sp,16
20008270:	ce42                	sw	a6,28(sp)
20008272:	8afd                	and	a3,a3,31
20008274:	00e88333          	add	t1,a7,a4
20008278:	4581                	li	a1,0
2000827a:	4308                	lw	a0,0(a4)
2000827c:	0711                	add	a4,a4,4 # 10004 <_start-0x1ffefffc>
2000827e:	8dc9                	or	a1,a1,a0
20008280:	fee31de3          	bne	t1,a4,2000827a <__fixtfsi+0x78>
20008284:	02088713          	add	a4,a7,32
20008288:	002708b3          	add	a7,a4,sp
2000828c:	ff08a703          	lw	a4,-16(a7)
20008290:	caa5                	beqz	a3,20008300 <__fixtfsi+0xfe>
20008292:	02000513          	li	a0,32
20008296:	8d15                	sub	a0,a0,a3
20008298:	00a71733          	sll	a4,a4,a0
2000829c:	4889                	li	a7,2
2000829e:	8dd9                	or	a1,a1,a4
200082a0:	4701                	li	a4,0
200082a2:	011e1963          	bne	t3,a7,200082b4 <__fixtfsi+0xb2>
200082a6:	00d65633          	srl	a2,a2,a3
200082aa:	00a81533          	sll	a0,a6,a0
200082ae:	8e49                	or	a2,a2,a0
200082b0:	c832                	sw	a2,16(sp)
200082b2:	4705                	li	a4,1
200082b4:	070a                	sll	a4,a4,0x2
200082b6:	02070713          	add	a4,a4,32
200082ba:	970a                	add	a4,a4,sp
200082bc:	00d85833          	srl	a6,a6,a3
200082c0:	ff072823          	sw	a6,-16(a4)
200082c4:	4542                	lw	a0,16(sp)
200082c6:	c399                	beqz	a5,200082cc <__fixtfsi+0xca>
200082c8:	40a00533          	neg	a0,a0
200082cc:	ddad                	beqz	a1,20008246 <__fixtfsi+0x44>
200082ce:	4885                	li	a7,1
200082d0:	bf8d                	j	20008242 <__fixtfsi+0x40>
200082d2:	c385                	beqz	a5,200082f2 <__fixtfsi+0xf0>
200082d4:	6791                	lui	a5,0x4
200082d6:	07f9                	add	a5,a5,30 # 401e <_start-0x1fffbfe2>
200082d8:	02f50663          	beq	a0,a5,20008304 <__fixtfsi+0x102>
200082dc:	80000537          	lui	a0,0x80000
200082e0:	48c1                	li	a7,16
200082e2:	0018a073          	csrs	fflags,a7
200082e6:	b785                	j	20008246 <__fixtfsi+0x44>
200082e8:	4501                	li	a0,0
200082ea:	4885                	li	a7,1
200082ec:	0018a073          	csrs	fflags,a7
200082f0:	bf99                	j	20008246 <__fixtfsi+0x44>
200082f2:	80000537          	lui	a0,0x80000
200082f6:	157d                	add	a0,a0,-1 # 7fffffff <dummy_file+0x49fbdbbf>
200082f8:	48c1                	li	a7,16
200082fa:	0018a073          	csrs	fflags,a7
200082fe:	b7a1                	j	20008246 <__fixtfsi+0x44>
20008300:	c83a                	sw	a4,16(sp)
20008302:	b7c9                	j	200082c4 <__fixtfsi+0xc2>
20008304:	01165793          	srl	a5,a2,0x11
20008308:	083e                	sll	a6,a6,0xf
2000830a:	0107e7b3          	or	a5,a5,a6
2000830e:	f7f9                	bnez	a5,200082dc <__fixtfsi+0xda>
20008310:	8f4d                	or	a4,a4,a1
20008312:	063e                	sll	a2,a2,0xf
20008314:	8e59                	or	a2,a2,a4
20008316:	80000537          	lui	a0,0x80000
2000831a:	d615                	beqz	a2,20008246 <__fixtfsi+0x44>
2000831c:	0018a073          	csrs	fflags,a7
20008320:	b71d                	j	20008246 <__fixtfsi+0x44>

20008322 <__fixunstfsi>:
20008322:	00052803          	lw	a6,0(a0) # 80000000 <dummy_file+0x49fbdbc0>
20008326:	415c                	lw	a5,4(a0)
20008328:	450c                	lw	a1,8(a0)
2000832a:	4558                	lw	a4,12(a0)
2000832c:	1101                	add	sp,sp,-32
2000832e:	002026f3          	frrm	a3
20008332:	6611                	lui	a2,0x4
20008334:	00171693          	sll	a3,a4,0x1
20008338:	01071893          	sll	a7,a4,0x10
2000833c:	c042                	sw	a6,0(sp)
2000833e:	c23e                	sw	a5,4(sp)
20008340:	c42e                	sw	a1,8(sp)
20008342:	c63a                	sw	a4,12(sp)
20008344:	c842                	sw	a6,16(sp)
20008346:	ca3e                	sw	a5,20(sp)
20008348:	cc2e                	sw	a1,24(sp)
2000834a:	82c5                	srl	a3,a3,0x11
2000834c:	1679                	add	a2,a2,-2 # 3ffe <_start-0x1fffc002>
2000834e:	0108d893          	srl	a7,a7,0x10
20008352:	00d64f63          	blt	a2,a3,20008370 <__fixunstfsi+0x4e>
20008356:	e699                	bnez	a3,20008364 <__fixunstfsi+0x42>
20008358:	0107e533          	or	a0,a5,a6
2000835c:	8d4d                	or	a0,a0,a1
2000835e:	01156533          	or	a0,a0,a7
20008362:	c509                	beqz	a0,2000836c <__fixunstfsi+0x4a>
20008364:	4785                	li	a5,1
20008366:	4501                	li	a0,0
20008368:	0017a073          	csrs	fflags,a5
2000836c:	6105                	add	sp,sp,32
2000836e:	8082                	ret
20008370:	837d                	srl	a4,a4,0x1f
20008372:	c711                	beqz	a4,2000837e <__fixunstfsi+0x5c>
20008374:	47c1                	li	a5,16
20008376:	4501                	li	a0,0
20008378:	0017a073          	csrs	fflags,a5
2000837c:	bfc5                	j	2000836c <__fixunstfsi+0x4a>
2000837e:	6791                	lui	a5,0x4
20008380:	07f9                	add	a5,a5,30 # 401e <_start-0x1fffbfe2>
20008382:	04d7c563          	blt	a5,a3,200083cc <__fixunstfsi+0xaa>
20008386:	6791                	lui	a5,0x4
20008388:	06f78793          	add	a5,a5,111 # 406f <_start-0x1fffbf91>
2000838c:	40d78733          	sub	a4,a5,a3
20008390:	40575313          	sra	t1,a4,0x5
20008394:	67c1                	lui	a5,0x10
20008396:	00f8e8b3          	or	a7,a7,a5
2000839a:	00231513          	sll	a0,t1,0x2
2000839e:	081c                	add	a5,sp,16
200083a0:	ce46                	sw	a7,28(sp)
200083a2:	8b7d                	and	a4,a4,31
200083a4:	00f50833          	add	a6,a0,a5
200083a8:	4681                	li	a3,0
200083aa:	4390                	lw	a2,0(a5)
200083ac:	0791                	add	a5,a5,4 # 10004 <_start-0x1ffefffc>
200083ae:	8ed1                	or	a3,a3,a2
200083b0:	fef81de3          	bne	a6,a5,200083aa <__fixunstfsi+0x88>
200083b4:	02050793          	add	a5,a0,32
200083b8:	00278533          	add	a0,a5,sp
200083bc:	ff052783          	lw	a5,-16(a0)
200083c0:	eb19                	bnez	a4,200083d6 <__fixunstfsi+0xb4>
200083c2:	c83e                	sw	a5,16(sp)
200083c4:	4542                	lw	a0,16(sp)
200083c6:	4785                	li	a5,1
200083c8:	f2c5                	bnez	a3,20008368 <__fixunstfsi+0x46>
200083ca:	b74d                	j	2000836c <__fixunstfsi+0x4a>
200083cc:	47c1                	li	a5,16
200083ce:	557d                	li	a0,-1
200083d0:	0017a073          	csrs	fflags,a5
200083d4:	bf61                	j	2000836c <__fixunstfsi+0x4a>
200083d6:	02000613          	li	a2,32
200083da:	8e19                	sub	a2,a2,a4
200083dc:	00c797b3          	sll	a5,a5,a2
200083e0:	4509                	li	a0,2
200083e2:	8edd                	or	a3,a3,a5
200083e4:	4781                	li	a5,0
200083e6:	00a31963          	bne	t1,a0,200083f8 <__fixunstfsi+0xd6>
200083ea:	00e5d5b3          	srl	a1,a1,a4
200083ee:	00c89633          	sll	a2,a7,a2
200083f2:	8dd1                	or	a1,a1,a2
200083f4:	c82e                	sw	a1,16(sp)
200083f6:	4785                	li	a5,1
200083f8:	078a                	sll	a5,a5,0x2
200083fa:	02078793          	add	a5,a5,32
200083fe:	978a                	add	a5,a5,sp
20008400:	00e8d8b3          	srl	a7,a7,a4
20008404:	ff17a823          	sw	a7,-16(a5)
20008408:	bf75                	j	200083c4 <__fixunstfsi+0xa2>

2000840a <__floatsitf>:
2000840a:	7179                	add	sp,sp,-48
2000840c:	d226                	sw	s1,36(sp)
2000840e:	d606                	sw	ra,44(sp)
20008410:	d422                	sw	s0,40(sp)
20008412:	84aa                	mv	s1,a0
20008414:	c9ad                	beqz	a1,20008486 <__floatsitf+0x7c>
20008416:	41f5d793          	sra	a5,a1,0x1f
2000841a:	d04a                	sw	s2,32(sp)
2000841c:	00b7c933          	xor	s2,a5,a1
20008420:	40f90933          	sub	s2,s2,a5
20008424:	854a                	mv	a0,s2
20008426:	01f5d413          	srl	s0,a1,0x1f
2000842a:	335000ef          	jal	20008f5e <__clzsi2>
2000842e:	05150713          	add	a4,a0,81
20008432:	6791                	lui	a5,0x4
20008434:	07f9                	add	a5,a5,30 # 401e <_start-0x1fffbfe2>
20008436:	01f77613          	and	a2,a4,31
2000843a:	c84a                	sw	s2,16(sp)
2000843c:	ca02                	sw	zero,20(sp)
2000843e:	cc02                	sw	zero,24(sp)
20008440:	ce02                	sw	zero,28(sp)
20008442:	8f89                	sub	a5,a5,a0
20008444:	8715                	sra	a4,a4,0x5
20008446:	ea2d                	bnez	a2,200084b8 <__floatsitf+0xae>
20008448:	460d                	li	a2,3
2000844a:	8e19                	sub	a2,a2,a4
2000844c:	060a                	sll	a2,a2,0x2
2000844e:	02060693          	add	a3,a2,32
20008452:	00268633          	add	a2,a3,sp
20008456:	4689                	li	a3,2
20008458:	ff062603          	lw	a2,-16(a2)
2000845c:	00d71463          	bne	a4,a3,20008464 <__floatsitf+0x5a>
20008460:	cc4a                	sw	s2,24(sp)
20008462:	4685                	li	a3,1
20008464:	068a                	sll	a3,a3,0x2
20008466:	c802                	sw	zero,16(sp)
20008468:	ca02                	sw	zero,20(sp)
2000846a:	16f1                	add	a3,a3,-4
2000846c:	4711                	li	a4,4
2000846e:	06e6fa63          	bgeu	a3,a4,200084e2 <__floatsitf+0xd8>
20008472:	07c6                	sll	a5,a5,0x11
20008474:	01061713          	sll	a4,a2,0x10
20008478:	4842                	lw	a6,16(sp)
2000847a:	4552                	lw	a0,20(sp)
2000847c:	46e2                	lw	a3,24(sp)
2000847e:	5902                	lw	s2,32(sp)
20008480:	8341                	srl	a4,a4,0x10
20008482:	83c5                	srl	a5,a5,0x11
20008484:	a039                	j	20008492 <__floatsitf+0x88>
20008486:	4401                	li	s0,0
20008488:	4781                	li	a5,0
2000848a:	4701                	li	a4,0
2000848c:	4681                	li	a3,0
2000848e:	4501                	li	a0,0
20008490:	4801                	li	a6,0
20008492:	00f41593          	sll	a1,s0,0xf
20008496:	8fcd                	or	a5,a5,a1
20008498:	00e11623          	sh	a4,12(sp)
2000849c:	00f11723          	sh	a5,14(sp)
200084a0:	47b2                	lw	a5,12(sp)
200084a2:	50b2                	lw	ra,44(sp)
200084a4:	5422                	lw	s0,40(sp)
200084a6:	c0c8                	sw	a0,4(s1)
200084a8:	0104a023          	sw	a6,0(s1)
200084ac:	c494                	sw	a3,8(s1)
200084ae:	c4dc                	sw	a5,12(s1)
200084b0:	8526                	mv	a0,s1
200084b2:	5492                	lw	s1,36(sp)
200084b4:	6145                	add	sp,sp,48
200084b6:	8082                	ret
200084b8:	4689                	li	a3,2
200084ba:	02d70f63          	beq	a4,a3,200084f8 <__floatsitf+0xee>
200084be:	4689                	li	a3,2
200084c0:	470d                	li	a4,3
200084c2:	070a                	sll	a4,a4,0x2
200084c4:	02070713          	add	a4,a4,32
200084c8:	970a                	add	a4,a4,sp
200084ca:	00c91933          	sll	s2,s2,a2
200084ce:	ff272823          	sw	s2,-16(a4)
200084d2:	068a                	sll	a3,a3,0x2
200084d4:	c802                	sw	zero,16(sp)
200084d6:	ca02                	sw	zero,20(sp)
200084d8:	16f1                	add	a3,a3,-4
200084da:	4711                	li	a4,4
200084dc:	4672                	lw	a2,28(sp)
200084de:	f8e6eae3          	bltu	a3,a4,20008472 <__floatsitf+0x68>
200084e2:	cc02                	sw	zero,24(sp)
200084e4:	07c6                	sll	a5,a5,0x11
200084e6:	01061713          	sll	a4,a2,0x10
200084ea:	4842                	lw	a6,16(sp)
200084ec:	4552                	lw	a0,20(sp)
200084ee:	46e2                	lw	a3,24(sp)
200084f0:	5902                	lw	s2,32(sp)
200084f2:	8341                	srl	a4,a4,0x10
200084f4:	83c5                	srl	a5,a5,0x11
200084f6:	bf71                	j	20008492 <__floatsitf+0x88>
200084f8:	02000693          	li	a3,32
200084fc:	8e91                	sub	a3,a3,a2
200084fe:	00d956b3          	srl	a3,s2,a3
20008502:	ce36                	sw	a3,28(sp)
20008504:	4685                	li	a3,1
20008506:	bf75                	j	200084c2 <__floatsitf+0xb8>

20008508 <__floatunsitf>:
20008508:	7179                	add	sp,sp,-48
2000850a:	d422                	sw	s0,40(sp)
2000850c:	d226                	sw	s1,36(sp)
2000850e:	d606                	sw	ra,44(sp)
20008510:	84ae                	mv	s1,a1
20008512:	842a                	mv	s0,a0
20008514:	cdb9                	beqz	a1,20008572 <__floatunsitf+0x6a>
20008516:	852e                	mv	a0,a1
20008518:	247000ef          	jal	20008f5e <__clzsi2>
2000851c:	05150713          	add	a4,a0,81
20008520:	6791                	lui	a5,0x4
20008522:	07f9                	add	a5,a5,30 # 401e <_start-0x1fffbfe2>
20008524:	01f77613          	and	a2,a4,31
20008528:	c826                	sw	s1,16(sp)
2000852a:	ca02                	sw	zero,20(sp)
2000852c:	cc02                	sw	zero,24(sp)
2000852e:	ce02                	sw	zero,28(sp)
20008530:	8f89                	sub	a5,a5,a0
20008532:	8715                	sra	a4,a4,0x5
20008534:	e235                	bnez	a2,20008598 <__floatunsitf+0x90>
20008536:	460d                	li	a2,3
20008538:	8e19                	sub	a2,a2,a4
2000853a:	060a                	sll	a2,a2,0x2
2000853c:	02060693          	add	a3,a2,32
20008540:	00268633          	add	a2,a3,sp
20008544:	4689                	li	a3,2
20008546:	ff062603          	lw	a2,-16(a2)
2000854a:	00d71463          	bne	a4,a3,20008552 <__floatunsitf+0x4a>
2000854e:	cc26                	sw	s1,24(sp)
20008550:	4685                	li	a3,1
20008552:	068a                	sll	a3,a3,0x2
20008554:	c802                	sw	zero,16(sp)
20008556:	ca02                	sw	zero,20(sp)
20008558:	16f1                	add	a3,a3,-4
2000855a:	4711                	li	a4,4
2000855c:	06e6f363          	bgeu	a3,a4,200085c2 <__floatunsitf+0xba>
20008560:	07c6                	sll	a5,a5,0x11
20008562:	01061713          	sll	a4,a2,0x10
20008566:	44c2                	lw	s1,16(sp)
20008568:	45d2                	lw	a1,20(sp)
2000856a:	46e2                	lw	a3,24(sp)
2000856c:	8341                	srl	a4,a4,0x10
2000856e:	83c5                	srl	a5,a5,0x11
20008570:	a029                	j	2000857a <__floatunsitf+0x72>
20008572:	4681                	li	a3,0
20008574:	4581                	li	a1,0
20008576:	4781                	li	a5,0
20008578:	4701                	li	a4,0
2000857a:	00e11623          	sh	a4,12(sp)
2000857e:	00f11723          	sh	a5,14(sp)
20008582:	47b2                	lw	a5,12(sp)
20008584:	c004                	sw	s1,0(s0)
20008586:	50b2                	lw	ra,44(sp)
20008588:	c04c                	sw	a1,4(s0)
2000858a:	c414                	sw	a3,8(s0)
2000858c:	c45c                	sw	a5,12(s0)
2000858e:	8522                	mv	a0,s0
20008590:	5422                	lw	s0,40(sp)
20008592:	5492                	lw	s1,36(sp)
20008594:	6145                	add	sp,sp,48
20008596:	8082                	ret
20008598:	4689                	li	a3,2
2000859a:	02d70e63          	beq	a4,a3,200085d6 <__floatunsitf+0xce>
2000859e:	4689                	li	a3,2
200085a0:	470d                	li	a4,3
200085a2:	070a                	sll	a4,a4,0x2
200085a4:	02070713          	add	a4,a4,32
200085a8:	970a                	add	a4,a4,sp
200085aa:	00c49633          	sll	a2,s1,a2
200085ae:	fec72823          	sw	a2,-16(a4)
200085b2:	068a                	sll	a3,a3,0x2
200085b4:	c802                	sw	zero,16(sp)
200085b6:	ca02                	sw	zero,20(sp)
200085b8:	16f1                	add	a3,a3,-4
200085ba:	4711                	li	a4,4
200085bc:	4672                	lw	a2,28(sp)
200085be:	fae6e1e3          	bltu	a3,a4,20008560 <__floatunsitf+0x58>
200085c2:	cc02                	sw	zero,24(sp)
200085c4:	07c6                	sll	a5,a5,0x11
200085c6:	01061713          	sll	a4,a2,0x10
200085ca:	44c2                	lw	s1,16(sp)
200085cc:	45d2                	lw	a1,20(sp)
200085ce:	46e2                	lw	a3,24(sp)
200085d0:	8341                	srl	a4,a4,0x10
200085d2:	83c5                	srl	a5,a5,0x11
200085d4:	b75d                	j	2000857a <__floatunsitf+0x72>
200085d6:	02000693          	li	a3,32
200085da:	8e91                	sub	a3,a3,a2
200085dc:	00d4d6b3          	srl	a3,s1,a3
200085e0:	ce36                	sw	a3,28(sp)
200085e2:	4685                	li	a3,1
200085e4:	bf7d                	j	200085a2 <__floatunsitf+0x9a>

200085e6 <__extenddftf2>:
200085e6:	7139                	add	sp,sp,-64
200085e8:	a42a                	fsd	fa0,8(sp)
200085ea:	dc22                	sw	s0,56(sp)
200085ec:	d84a                	sw	s2,48(sp)
200085ee:	4422                	lw	s0,8(sp)
200085f0:	46b2                	lw	a3,12(sp)
200085f2:	de06                	sw	ra,60(sp)
200085f4:	da26                	sw	s1,52(sp)
200085f6:	892a                	mv	s2,a0
200085f8:	002027f3          	frrm	a5
200085fc:	0146d793          	srl	a5,a3,0x14
20008600:	00c69713          	sll	a4,a3,0xc
20008604:	7ff7f793          	and	a5,a5,2047
20008608:	8331                	srl	a4,a4,0xc
2000860a:	00178613          	add	a2,a5,1
2000860e:	d022                	sw	s0,32(sp)
20008610:	d23a                	sw	a4,36(sp)
20008612:	d602                	sw	zero,44(sp)
20008614:	d402                	sw	zero,40(sp)
20008616:	7fe67613          	and	a2,a2,2046
2000861a:	01f6d493          	srl	s1,a3,0x1f
2000861e:	c631                	beqz	a2,2000866a <__extenddftf2+0x84>
20008620:	6691                	lui	a3,0x4
20008622:	00445613          	srl	a2,s0,0x4
20008626:	01c71513          	sll	a0,a4,0x1c
2000862a:	c0068693          	add	a3,a3,-1024 # 3c00 <_start-0x1fffc400>
2000862e:	8d51                	or	a0,a0,a2
20008630:	0472                	sll	s0,s0,0x1c
20008632:	8311                	srl	a4,a4,0x4
20008634:	97b6                	add	a5,a5,a3
20008636:	4601                	li	a2,0
20008638:	00e11e23          	sh	a4,28(sp)
2000863c:	07c6                	sll	a5,a5,0x11
2000863e:	0742                	sll	a4,a4,0x10
20008640:	8341                	srl	a4,a4,0x10
20008642:	8385                	srl	a5,a5,0x1
20008644:	01f49693          	sll	a3,s1,0x1f
20008648:	8fd9                	or	a5,a5,a4
2000864a:	8fd5                	or	a5,a5,a3
2000864c:	00892223          	sw	s0,4(s2)
20008650:	50f2                	lw	ra,60(sp)
20008652:	5462                	lw	s0,56(sp)
20008654:	00a92423          	sw	a0,8(s2)
20008658:	00c92023          	sw	a2,0(s2)
2000865c:	00f92623          	sw	a5,12(s2)
20008660:	54d2                	lw	s1,52(sp)
20008662:	854a                	mv	a0,s2
20008664:	5942                	lw	s2,48(sp)
20008666:	6121                	add	sp,sp,64
20008668:	8082                	ret
2000866a:	00876533          	or	a0,a4,s0
2000866e:	efb5                	bnez	a5,200086ea <__extenddftf2+0x104>
20008670:	c171                	beqz	a0,20008734 <__extenddftf2+0x14e>
20008672:	c771                	beqz	a4,2000873e <__extenddftf2+0x158>
20008674:	853a                	mv	a0,a4
20008676:	0e9000ef          	jal	20008f5e <__clzsi2>
2000867a:	03150793          	add	a5,a0,49
2000867e:	01f7f593          	and	a1,a5,31
20008682:	8795                	sra	a5,a5,0x5
20008684:	edf1                	bnez	a1,20008760 <__extenddftf2+0x17a>
20008686:	40f006b3          	neg	a3,a5
2000868a:	068a                	sll	a3,a3,0x2
2000868c:	1010                	add	a2,sp,32
2000868e:	00d60733          	add	a4,a2,a3
20008692:	01010893          	add	a7,sp,16
20008696:	40d006b3          	neg	a3,a3
2000869a:	00c72803          	lw	a6,12(a4)
2000869e:	00d705b3          	add	a1,a4,a3
200086a2:	1771                	add	a4,a4,-4
200086a4:	0105a623          	sw	a6,12(a1)
200086a8:	fee899e3          	bne	a7,a4,2000869a <__extenddftf2+0xb4>
200086ac:	fff78713          	add	a4,a5,-1
200086b0:	00170793          	add	a5,a4,1
200086b4:	078a                	sll	a5,a5,0x2
200086b6:	46a1                	li	a3,8
200086b8:	8732                	mv	a4,a2
200086ba:	00d7e763          	bltu	a5,a3,200086c8 <__extenddftf2+0xe2>
200086be:	d002                	sw	zero,32(sp)
200086c0:	00062223          	sw	zero,4(a2)
200086c4:	17e1                	add	a5,a5,-8
200086c6:	1038                	add	a4,sp,40
200086c8:	4691                	li	a3,4
200086ca:	00d7e463          	bltu	a5,a3,200086d2 <__extenddftf2+0xec>
200086ce:	00072023          	sw	zero,0(a4)
200086d2:	6791                	lui	a5,0x4
200086d4:	c0c78793          	add	a5,a5,-1012 # 3c0c <_start-0x1fffc3f4>
200086d8:	8f89                	sub	a5,a5,a0
200086da:	07c6                	sll	a5,a5,0x11
200086dc:	02c15703          	lhu	a4,44(sp)
200086e0:	5522                	lw	a0,40(sp)
200086e2:	5602                	lw	a2,32(sp)
200086e4:	5412                	lw	s0,36(sp)
200086e6:	83c5                	srl	a5,a5,0x11
200086e8:	bf81                	j	20008638 <__extenddftf2+0x52>
200086ea:	cd1d                	beqz	a0,20008728 <__extenddftf2+0x142>
200086ec:	66a1                	lui	a3,0x8
200086ee:	00475793          	srl	a5,a4,0x4
200086f2:	8fd5                	or	a5,a5,a3
200086f4:	00f11e23          	sh	a5,28(sp)
200086f8:	47f2                	lw	a5,28(sp)
200086fa:	7fff06b7          	lui	a3,0x7fff0
200086fe:	00445813          	srl	a6,s0,0x4
20008702:	8fd5                	or	a5,a5,a3
20008704:	0786                	sll	a5,a5,0x1
20008706:	01c71513          	sll	a0,a4,0x1c
2000870a:	01f49693          	sll	a3,s1,0x1f
2000870e:	8385                	srl	a5,a5,0x1
20008710:	000805b7          	lui	a1,0x80
20008714:	4601                	li	a2,0
20008716:	0472                	sll	s0,s0,0x1c
20008718:	01056533          	or	a0,a0,a6
2000871c:	8fd5                	or	a5,a5,a3
2000871e:	f2b777e3          	bgeu	a4,a1,2000864c <__extenddftf2+0x66>
20008722:	00186073          	csrs	fflags,16
20008726:	b71d                	j	2000864c <__extenddftf2+0x66>
20008728:	67a1                	lui	a5,0x8
2000872a:	4401                	li	s0,0
2000872c:	4601                	li	a2,0
2000872e:	17fd                	add	a5,a5,-1 # 7fff <_start-0x1fff8001>
20008730:	4701                	li	a4,0
20008732:	b719                	j	20008638 <__extenddftf2+0x52>
20008734:	4401                	li	s0,0
20008736:	4601                	li	a2,0
20008738:	4781                	li	a5,0
2000873a:	4701                	li	a4,0
2000873c:	bdf5                	j	20008638 <__extenddftf2+0x52>
2000873e:	021000ef          	jal	20008f5e <__clzsi2>
20008742:	05150793          	add	a5,a0,81
20008746:	01f7f593          	and	a1,a5,31
2000874a:	02050513          	add	a0,a0,32
2000874e:	8795                	sra	a5,a5,0x5
20008750:	d99d                	beqz	a1,20008686 <__extenddftf2+0xa0>
20008752:	4709                	li	a4,2
20008754:	00e78663          	beq	a5,a4,20008760 <__extenddftf2+0x17a>
20008758:	4709                	li	a4,2
2000875a:	478d                	li	a5,3
2000875c:	1010                	add	a2,sp,32
2000875e:	a081                	j	2000879e <__extenddftf2+0x1b8>
20008760:	40f008b3          	neg	a7,a5
20008764:	088a                	sll	a7,a7,0x2
20008766:	00c88713          	add	a4,a7,12
2000876a:	02000e13          	li	t3,32
2000876e:	1010                	add	a2,sp,32
20008770:	40be0e33          	sub	t3,t3,a1
20008774:	9732                	add	a4,a4,a2
20008776:	411008b3          	neg	a7,a7
2000877a:	4314                	lw	a3,0(a4)
2000877c:	ffc72803          	lw	a6,-4(a4)
20008780:	01170333          	add	t1,a4,a7
20008784:	00b696b3          	sll	a3,a3,a1
20008788:	01c85833          	srl	a6,a6,t3
2000878c:	0106e6b3          	or	a3,a3,a6
20008790:	00d32023          	sw	a3,0(t1)
20008794:	1771                	add	a4,a4,-4
20008796:	fee612e3          	bne	a2,a4,2000877a <__extenddftf2+0x194>
2000879a:	fff78713          	add	a4,a5,-1
2000879e:	078a                	sll	a5,a5,0x2
200087a0:	02078793          	add	a5,a5,32
200087a4:	0814                	add	a3,sp,16
200087a6:	97b6                	add	a5,a5,a3
200087a8:	00b415b3          	sll	a1,s0,a1
200087ac:	feb7a823          	sw	a1,-16(a5)
200087b0:	b701                	j	200086b0 <__extenddftf2+0xca>

200087b2 <__trunctfsf2>:
200087b2:	1101                	add	sp,sp,-32
200087b4:	4110                	lw	a2,0(a0)
200087b6:	414c                	lw	a1,4(a0)
200087b8:	4518                	lw	a4,8(a0)
200087ba:	455c                	lw	a5,12(a0)
200087bc:	00202373          	frrm	t1
200087c0:	01079693          	sll	a3,a5,0x10
200087c4:	00179513          	sll	a0,a5,0x1
200087c8:	82c1                	srl	a3,a3,0x10
200087ca:	01010813          	add	a6,sp,16
200087ce:	c63e                	sw	a5,12(sp)
200087d0:	01f7d893          	srl	a7,a5,0x1f
200087d4:	c032                	sw	a2,0(sp)
200087d6:	c22e                	sw	a1,4(sp)
200087d8:	c43a                	sw	a4,8(sp)
200087da:	c832                	sw	a2,16(sp)
200087dc:	ca2e                	sw	a1,20(sp)
200087de:	cc3a                	sw	a4,24(sp)
200087e0:	ce36                	sw	a3,28(sp)
200087e2:	8145                	srl	a0,a0,0x11
200087e4:	087c                	add	a5,sp,28
200087e6:	8e42                	mv	t3,a6
200087e8:	00369593          	sll	a1,a3,0x3
200087ec:	ffc7a683          	lw	a3,-4(a5)
200087f0:	17f1                	add	a5,a5,-4
200087f2:	01d6d713          	srl	a4,a3,0x1d
200087f6:	8f4d                	or	a4,a4,a1
200087f8:	c3d8                	sw	a4,4(a5)
200087fa:	fef817e3          	bne	a6,a5,200087e8 <__trunctfsf2+0x36>
200087fe:	67a1                	lui	a5,0x8
20008800:	060e                	sll	a2,a2,0x3
20008802:	00150713          	add	a4,a0,1
20008806:	17f9                	add	a5,a5,-2 # 7ffe <_start-0x1fff8002>
20008808:	c832                	sw	a2,16(sp)
2000880a:	8f7d                	and	a4,a4,a5
2000880c:	c715                	beqz	a4,20008838 <__trunctfsf2+0x86>
2000880e:	77f1                	lui	a5,0xffffc
20008810:	08078793          	add	a5,a5,128 # ffffc080 <dummy_file+0xc9fb9c40>
20008814:	97aa                	add	a5,a5,a0
20008816:	0fe00713          	li	a4,254
2000881a:	0af75763          	bge	a4,a5,200088c8 <__trunctfsf2+0x116>
2000881e:	10030b63          	beqz	t1,20008934 <__trunctfsf2+0x182>
20008822:	478d                	li	a5,3
20008824:	10f30663          	beq	t1,a5,20008930 <__trunctfsf2+0x17e>
20008828:	4789                	li	a5,2
2000882a:	22f30663          	beq	t1,a5,20008a56 <__trunctfsf2+0x2a4>
2000882e:	56fd                	li	a3,-1
20008830:	0fe00793          	li	a5,254
20008834:	4715                	li	a4,5
20008836:	a0e1                	j	200088fe <__trunctfsf2+0x14c>
20008838:	47e2                	lw	a5,24(sp)
2000883a:	46d2                	lw	a3,20(sp)
2000883c:	45f2                	lw	a1,28(sp)
2000883e:	8edd                	or	a3,a3,a5
20008840:	8ecd                	or	a3,a3,a1
20008842:	8ed1                	or	a3,a3,a2
20008844:	e915                	bnez	a0,20008878 <__trunctfsf2+0xc6>
20008846:	cef5                	beqz	a3,20008942 <__trunctfsf2+0x190>
20008848:	4789                	li	a5,2
2000884a:	4685                	li	a3,1
2000884c:	20f30863          	beq	t1,a5,20008a5c <__trunctfsf2+0x2aa>
20008850:	478d                	li	a5,3
20008852:	20f30563          	beq	t1,a5,20008a5c <__trunctfsf2+0x2aa>
20008856:	20030363          	beqz	t1,20008a5c <__trunctfsf2+0x2aa>
2000885a:	26030763          	beqz	t1,20008ac8 <__trunctfsf2+0x316>
2000885e:	00569613          	sll	a2,a3,0x5
20008862:	4785                	li	a5,1
20008864:	470d                	li	a4,3
20008866:	20065863          	bgez	a2,20008a76 <__trunctfsf2+0x2c4>
2000886a:	fc000637          	lui	a2,0xfc000
2000886e:	167d                	add	a2,a2,-1 # fbffffff <dummy_file+0xc5fbdbbf>
20008870:	8ef1                	and	a3,a3,a2
20008872:	0ff7f793          	zext.b	a5,a5
20008876:	a81d                	j	200088ac <__trunctfsf2+0xfa>
20008878:	cee9                	beqz	a3,20008952 <__trunctfsf2+0x1a0>
2000887a:	66a1                	lui	a3,0x8
2000887c:	16fd                	add	a3,a3,-1 # 7fff <_start-0x1fff8001>
2000887e:	00d51863          	bne	a0,a3,2000888e <__trunctfsf2+0xdc>
20008882:	0125d713          	srl	a4,a1,0x12
20008886:	00174713          	xor	a4,a4,1
2000888a:	8b05                	and	a4,a4,1
2000888c:	0712                	sll	a4,a4,0x4
2000888e:	059e                	sll	a1,a1,0x7
20008890:	83e5                	srl	a5,a5,0x19
20008892:	00559693          	sll	a3,a1,0x5
20008896:	8fcd                	or	a5,a5,a1
20008898:	2406d863          	bgez	a3,20008ae8 <__trunctfsf2+0x336>
2000889c:	fc0006b7          	lui	a3,0xfc000
200088a0:	16e1                	add	a3,a3,-8 # fbfffff8 <dummy_file+0xc5fbdbb8>
200088a2:	8efd                	and	a3,a3,a5
200088a4:	020007b7          	lui	a5,0x2000
200088a8:	8edd                	or	a3,a3,a5
200088aa:	4781                	li	a5,0
200088ac:	069a                	sll	a3,a3,0x6
200088ae:	82a5                	srl	a3,a3,0x9
200088b0:	07de                	sll	a5,a5,0x17
200088b2:	8fd5                	or	a5,a5,a3
200088b4:	08fe                	sll	a7,a7,0x1f
200088b6:	0117e7b3          	or	a5,a5,a7
200088ba:	c319                	beqz	a4,200088c0 <__trunctfsf2+0x10e>
200088bc:	00172073          	csrs	fflags,a4
200088c0:	f0078553          	fmv.w.x	fa0,a5
200088c4:	6105                	add	sp,sp,32
200088c6:	8082                	ret
200088c8:	08f05e63          	blez	a5,20008964 <__trunctfsf2+0x1b2>
200088cc:	45e2                	lw	a1,24(sp)
200088ce:	4752                	lw	a4,20(sp)
200088d0:	00759693          	sll	a3,a1,0x7
200088d4:	8ed9                	or	a3,a3,a4
200088d6:	4772                	lw	a4,28(sp)
200088d8:	8ed1                	or	a3,a3,a2
200088da:	81e5                	srl	a1,a1,0x19
200088dc:	071e                	sll	a4,a4,0x7
200088de:	8f4d                	or	a4,a4,a1
200088e0:	00d036b3          	snez	a3,a3
200088e4:	8ed9                	or	a3,a3,a4
200088e6:	0076f713          	and	a4,a3,7
200088ea:	cb11                	beqz	a4,200088fe <__trunctfsf2+0x14c>
200088ec:	4709                	li	a4,2
200088ee:	10e30e63          	beq	t1,a4,20008a0a <__trunctfsf2+0x258>
200088f2:	470d                	li	a4,3
200088f4:	12e30163          	beq	t1,a4,20008a16 <__trunctfsf2+0x264>
200088f8:	4705                	li	a4,1
200088fa:	12030463          	beqz	t1,20008a22 <__trunctfsf2+0x270>
200088fe:	00569613          	sll	a2,a3,0x5
20008902:	16065b63          	bgez	a2,20008a78 <__trunctfsf2+0x2c6>
20008906:	0785                	add	a5,a5,1 # 2000001 <_start-0x1dffffff>
20008908:	0ff00613          	li	a2,255
2000890c:	f4c79fe3          	bne	a5,a2,2000886a <__trunctfsf2+0xb8>
20008910:	02030263          	beqz	t1,20008934 <__trunctfsf2+0x182>
20008914:	478d                	li	a5,3
20008916:	1af30663          	beq	t1,a5,20008ac2 <__trunctfsf2+0x310>
2000891a:	4789                	li	a5,2
2000891c:	16f30563          	beq	t1,a5,20008a86 <__trunctfsf2+0x2d4>
20008920:	7f800737          	lui	a4,0x7f800
20008924:	177d                	add	a4,a4,-1 # 7f7fffff <dummy_file+0x497bdbbf>
20008926:	01f89793          	sll	a5,a7,0x1f
2000892a:	8fd9                	or	a5,a5,a4
2000892c:	4715                	li	a4,5
2000892e:	b779                	j	200088bc <__trunctfsf2+0x10a>
20008930:	fe0890e3          	bnez	a7,20008910 <__trunctfsf2+0x15e>
20008934:	7f800737          	lui	a4,0x7f800
20008938:	01f89793          	sll	a5,a7,0x1f
2000893c:	8fd9                	or	a5,a5,a4
2000893e:	4715                	li	a4,5
20008940:	bfb5                	j	200088bc <__trunctfsf2+0x10a>
20008942:	4681                	li	a3,0
20008944:	01f89793          	sll	a5,a7,0x1f
20008948:	8fd5                	or	a5,a5,a3
2000894a:	f0078553          	fmv.w.x	fa0,a5
2000894e:	6105                	add	sp,sp,32
20008950:	8082                	ret
20008952:	01f89793          	sll	a5,a7,0x1f
20008956:	7f800737          	lui	a4,0x7f800
2000895a:	8fd9                	or	a5,a5,a4
2000895c:	f0078553          	fmv.w.x	fa0,a5
20008960:	6105                	add	sp,sp,32
20008962:	8082                	ret
20008964:	5725                	li	a4,-23
20008966:	0ce7c563          	blt	a5,a4,20008a30 <__trunctfsf2+0x27e>
2000896a:	05a00713          	li	a4,90
2000896e:	8f1d                	sub	a4,a4,a5
20008970:	47f2                	lw	a5,28(sp)
20008972:	40575e93          	sra	t4,a4,0x5
20008976:	000805b7          	lui	a1,0x80
2000897a:	8ddd                	or	a1,a1,a5
2000897c:	002e9513          	sll	a0,t4,0x2
20008980:	ce2e                	sw	a1,28(sp)
20008982:	8b7d                	and	a4,a4,31
20008984:	00a807b3          	add	a5,a6,a0
20008988:	4681                	li	a3,0
2000898a:	000e2603          	lw	a2,0(t3)
2000898e:	0e11                	add	t3,t3,4
20008990:	8ed1                	or	a3,a3,a2
20008992:	ffc79ce3          	bne	a5,t3,2000898a <__trunctfsf2+0x1d8>
20008996:	02050793          	add	a5,a0,32
2000899a:	00278533          	add	a0,a5,sp
2000899e:	ff052783          	lw	a5,-16(a0)
200089a2:	c365                	beqz	a4,20008a82 <__trunctfsf2+0x2d0>
200089a4:	02000613          	li	a2,32
200089a8:	8e19                	sub	a2,a2,a4
200089aa:	00c797b3          	sll	a5,a5,a2
200089ae:	4509                	li	a0,2
200089b0:	8edd                	or	a3,a3,a5
200089b2:	4781                	li	a5,0
200089b4:	00ae9a63          	bne	t4,a0,200089c8 <__trunctfsf2+0x216>
200089b8:	4562                	lw	a0,24(sp)
200089ba:	00c59633          	sll	a2,a1,a2
200089be:	4785                	li	a5,1
200089c0:	00e55533          	srl	a0,a0,a4
200089c4:	8e49                	or	a2,a2,a0
200089c6:	c832                	sw	a2,16(sp)
200089c8:	078a                	sll	a5,a5,0x2
200089ca:	02078793          	add	a5,a5,32
200089ce:	978a                	add	a5,a5,sp
200089d0:	00e5d5b3          	srl	a1,a1,a4
200089d4:	feb7a823          	sw	a1,-16(a5)
200089d8:	47c2                	lw	a5,16(sp)
200089da:	00d036b3          	snez	a3,a3
200089de:	8edd                	or	a3,a3,a5
200089e0:	d2ad                	beqz	a3,20008942 <__trunctfsf2+0x190>
200089e2:	00169793          	sll	a5,a3,0x1
200089e6:	0077f713          	and	a4,a5,7
200089ea:	0076f613          	and	a2,a3,7
200089ee:	e721                	bnez	a4,20008a36 <__trunctfsf2+0x284>
200089f0:	00479593          	sll	a1,a5,0x4
200089f4:	0a05db63          	bgez	a1,20008aaa <__trunctfsf2+0x2f8>
200089f8:	e279                	bnez	a2,20008abe <__trunctfsf2+0x30c>
200089fa:	00569793          	sll	a5,a3,0x5
200089fe:	0a07c063          	bltz	a5,20008a9e <__trunctfsf2+0x2ec>
20008a02:	069a                	sll	a3,a3,0x6
20008a04:	82a5                	srl	a3,a3,0x9
20008a06:	4781                	li	a5,0
20008a08:	b565                	j	200088b0 <__trunctfsf2+0xfe>
20008a0a:	4705                	li	a4,1
20008a0c:	ee0889e3          	beqz	a7,200088fe <__trunctfsf2+0x14c>
20008a10:	06a1                	add	a3,a3,8
20008a12:	8746                	mv	a4,a7
20008a14:	b5ed                	j	200088fe <__trunctfsf2+0x14c>
20008a16:	8746                	mv	a4,a7
20008a18:	ee0893e3          	bnez	a7,200088fe <__trunctfsf2+0x14c>
20008a1c:	06a1                	add	a3,a3,8
20008a1e:	4705                	li	a4,1
20008a20:	bdf9                	j	200088fe <__trunctfsf2+0x14c>
20008a22:	00f6f613          	and	a2,a3,15
20008a26:	4591                	li	a1,4
20008a28:	ecb60be3          	beq	a2,a1,200088fe <__trunctfsf2+0x14c>
20008a2c:	0691                	add	a3,a3,4
20008a2e:	bdc1                	j	200088fe <__trunctfsf2+0x14c>
20008a30:	4685                	li	a3,1
20008a32:	4605                	li	a2,1
20008a34:	4789                	li	a5,2
20008a36:	4709                	li	a4,2
20008a38:	0ae30e63          	beq	t1,a4,20008af4 <__trunctfsf2+0x342>
20008a3c:	470d                	li	a4,3
20008a3e:	08e30f63          	beq	t1,a4,20008adc <__trunctfsf2+0x32a>
20008a42:	4705                	li	a4,1
20008a44:	fa0316e3          	bnez	t1,200089f0 <__trunctfsf2+0x23e>
20008a48:	00f7f593          	and	a1,a5,15
20008a4c:	4511                	li	a0,4
20008a4e:	faa581e3          	beq	a1,a0,200089f0 <__trunctfsf2+0x23e>
20008a52:	0791                	add	a5,a5,4
20008a54:	bf71                	j	200089f0 <__trunctfsf2+0x23e>
20008a56:	ec089fe3          	bnez	a7,20008934 <__trunctfsf2+0x182>
20008a5a:	bd5d                	j	20008910 <__trunctfsf2+0x15e>
20008a5c:	4789                	li	a5,2
20008a5e:	02f30c63          	beq	t1,a5,20008a96 <__trunctfsf2+0x2e4>
20008a62:	478d                	li	a5,3
20008a64:	def31be3          	bne	t1,a5,2000885a <__trunctfsf2+0xa8>
20008a68:	02088963          	beqz	a7,20008a9a <__trunctfsf2+0x2e8>
20008a6c:	00569793          	sll	a5,a3,0x5
20008a70:	0607c363          	bltz	a5,20008ad6 <__trunctfsf2+0x324>
20008a74:	470d                	li	a4,3
20008a76:	4781                	li	a5,0
20008a78:	069a                	sll	a3,a3,0x6
20008a7a:	82a5                	srl	a3,a3,0x9
20008a7c:	0ff7f793          	zext.b	a5,a5
20008a80:	bd05                	j	200088b0 <__trunctfsf2+0xfe>
20008a82:	c83e                	sw	a5,16(sp)
20008a84:	bf91                	j	200089d8 <__trunctfsf2+0x226>
20008a86:	ea0897e3          	bnez	a7,20008934 <__trunctfsf2+0x182>
20008a8a:	200147b7          	lui	a5,0x20014
20008a8e:	0407a783          	lw	a5,64(a5) # 20014040 <__clz_tab+0x5f8>
20008a92:	4715                	li	a4,5
20008a94:	b525                	j	200088bc <__trunctfsf2+0x10a>
20008a96:	fc088be3          	beqz	a7,20008a6c <__trunctfsf2+0x2ba>
20008a9a:	06a1                	add	a3,a3,8
20008a9c:	bfc1                	j	20008a6c <__trunctfsf2+0x2ba>
20008a9e:	fc0007b7          	lui	a5,0xfc000
20008aa2:	17fd                	add	a5,a5,-1 # fbffffff <dummy_file+0xc5fbdbbf>
20008aa4:	8efd                	and	a3,a3,a5
20008aa6:	4785                	li	a5,1
20008aa8:	b511                	j	200088ac <__trunctfsf2+0xfa>
20008aaa:	fa4d                	bnez	a2,20008a5c <__trunctfsf2+0x2aa>
20008aac:	040007b7          	lui	a5,0x4000
20008ab0:	8ff5                	and	a5,a5,a3
20008ab2:	da0716e3          	bnez	a4,2000885e <__trunctfsf2+0xac>
20008ab6:	f7e5                	bnez	a5,20008a9e <__trunctfsf2+0x2ec>
20008ab8:	069a                	sll	a3,a3,0x6
20008aba:	82a5                	srl	a3,a3,0x9
20008abc:	b561                	j	20008944 <__trunctfsf2+0x192>
20008abe:	4781                	li	a5,0
20008ac0:	b535                	j	200088ec <__trunctfsf2+0x13a>
20008ac2:	e60889e3          	beqz	a7,20008934 <__trunctfsf2+0x182>
20008ac6:	bda9                	j	20008920 <__trunctfsf2+0x16e>
20008ac8:	00f6f793          	and	a5,a3,15
20008acc:	4711                	li	a4,4
20008ace:	f8e78fe3          	beq	a5,a4,20008a6c <__trunctfsf2+0x2ba>
20008ad2:	0691                	add	a3,a3,4
20008ad4:	bf61                	j	20008a6c <__trunctfsf2+0x2ba>
20008ad6:	4785                	li	a5,1
20008ad8:	470d                	li	a4,3
20008ada:	bb41                	j	2000886a <__trunctfsf2+0xb8>
20008adc:	8746                	mv	a4,a7
20008ade:	f00899e3          	bnez	a7,200089f0 <__trunctfsf2+0x23e>
20008ae2:	07a1                	add	a5,a5,8 # 4000008 <_start-0x1bfffff8>
20008ae4:	4705                	li	a4,1
20008ae6:	b729                	j	200089f0 <__trunctfsf2+0x23e>
20008ae8:	4881                	li	a7,0
20008aea:	0ff00793          	li	a5,255
20008aee:	004006b7          	lui	a3,0x400
20008af2:	bb7d                	j	200088b0 <__trunctfsf2+0xfe>
20008af4:	4705                	li	a4,1
20008af6:	ee088de3          	beqz	a7,200089f0 <__trunctfsf2+0x23e>
20008afa:	07a1                	add	a5,a5,8
20008afc:	8746                	mv	a4,a7
20008afe:	bdcd                	j	200089f0 <__trunctfsf2+0x23e>

20008b00 <__trunctfdf2>:
20008b00:	7179                	add	sp,sp,-48
20008b02:	410c                	lw	a1,0(a0)
20008b04:	4158                	lw	a4,4(a0)
20008b06:	451c                	lw	a5,8(a0)
20008b08:	4550                	lw	a2,12(a0)
20008b0a:	00202373          	frrm	t1
20008b0e:	01061693          	sll	a3,a2,0x10
20008b12:	00161813          	sll	a6,a2,0x1
20008b16:	82c1                	srl	a3,a3,0x10
20008b18:	cc3e                	sw	a5,24(sp)
20008b1a:	ce32                	sw	a2,28(sp)
20008b1c:	d43e                	sw	a5,40(sp)
20008b1e:	c82e                	sw	a1,16(sp)
20008b20:	ca3a                	sw	a4,20(sp)
20008b22:	d02e                	sw	a1,32(sp)
20008b24:	d23a                	sw	a4,36(sp)
20008b26:	d636                	sw	a3,44(sp)
20008b28:	01185813          	srl	a6,a6,0x11
20008b2c:	827d                	srl	a2,a2,0x1f
20008b2e:	02010893          	add	a7,sp,32
20008b32:	107c                	add	a5,sp,44
20008b34:	00369513          	sll	a0,a3,0x3
20008b38:	ffc7a683          	lw	a3,-4(a5)
20008b3c:	17f1                	add	a5,a5,-4
20008b3e:	01d6d713          	srl	a4,a3,0x1d
20008b42:	8f49                	or	a4,a4,a0
20008b44:	c3d8                	sw	a4,4(a5)
20008b46:	fef897e3          	bne	a7,a5,20008b34 <__trunctfdf2+0x34>
20008b4a:	6721                	lui	a4,0x8
20008b4c:	058e                	sll	a1,a1,0x3
20008b4e:	00180513          	add	a0,a6,1
20008b52:	1779                	add	a4,a4,-2 # 7ffe <_start-0x1fff8002>
20008b54:	d02e                	sw	a1,32(sp)
20008b56:	8d79                	and	a0,a0,a4
20008b58:	c915                	beqz	a0,20008b8c <__trunctfdf2+0x8c>
20008b5a:	7771                	lui	a4,0xffffc
20008b5c:	40070713          	add	a4,a4,1024 # ffffc400 <dummy_file+0xc9fb9fc0>
20008b60:	983a                	add	a6,a6,a4
20008b62:	7fe00713          	li	a4,2046
20008b66:	0f075663          	bge	a4,a6,20008c52 <__trunctfdf2+0x152>
20008b6a:	18031463          	bnez	t1,20008cf2 <__trunctfdf2+0x1f2>
20008b6e:	4515                	li	a0,5
20008b70:	7ff00793          	li	a5,2047
20008b74:	4681                	li	a3,0
20008b76:	4701                	li	a4,0
20008b78:	07d2                	sll	a5,a5,0x14
20008b7a:	8fd5                	or	a5,a5,a3
20008b7c:	067e                	sll	a2,a2,0x1f
20008b7e:	8fd1                	or	a5,a5,a2
20008b80:	c43a                	sw	a4,8(sp)
20008b82:	c63e                	sw	a5,12(sp)
20008b84:	2522                	fld	fa0,8(sp)
20008b86:	e171                	bnez	a0,20008c4a <__trunctfdf2+0x14a>
20008b88:	6145                	add	sp,sp,48
20008b8a:	8082                	ret
20008b8c:	5692                	lw	a3,36(sp)
20008b8e:	5722                	lw	a4,40(sp)
20008b90:	5e32                	lw	t3,44(sp)
20008b92:	00e6e7b3          	or	a5,a3,a4
20008b96:	01c7e7b3          	or	a5,a5,t3
20008b9a:	8fcd                	or	a5,a5,a1
20008b9c:	02081f63          	bnez	a6,20008bda <__trunctfdf2+0xda>
20008ba0:	14078363          	beqz	a5,20008ce6 <__trunctfdf2+0x1e6>
20008ba4:	4789                	li	a5,2
20008ba6:	34f30663          	beq	t1,a5,20008ef2 <__trunctfdf2+0x3f2>
20008baa:	478d                	li	a5,3
20008bac:	32f30663          	beq	t1,a5,20008ed8 <__trunctfdf2+0x3d8>
20008bb0:	22031963          	bnez	t1,20008de2 <__trunctfdf2+0x2e2>
20008bb4:	4709                	li	a4,2
20008bb6:	4781                	li	a5,0
20008bb8:	4881                	li	a7,0
20008bba:	4585                	li	a1,1
20008bbc:	4685                	li	a3,1
20008bbe:	ffc73713          	sltiu	a4,a4,-4
20008bc2:	00173713          	seqz	a4,a4
20008bc6:	97ba                	add	a5,a5,a4
20008bc8:	4505                	li	a0,1
20008bca:	00779713          	sll	a4,a5,0x7
20008bce:	2e075b63          	bgez	a4,20008ec4 <__trunctfdf2+0x3c4>
20008bd2:	4781                	li	a5,0
20008bd4:	ce9d                	beqz	a3,20008c12 <__trunctfdf2+0x112>
20008bd6:	4801                	li	a6,0
20008bd8:	a065                	j	20008c80 <__trunctfdf2+0x180>
20008bda:	dbd9                	beqz	a5,20008b70 <__trunctfdf2+0x70>
20008bdc:	67a1                	lui	a5,0x8
20008bde:	17fd                	add	a5,a5,-1 # 7fff <_start-0x1fff8001>
20008be0:	00f81863          	bne	a6,a5,20008bf0 <__trunctfdf2+0xf0>
20008be4:	012e5513          	srl	a0,t3,0x12
20008be8:	00154513          	xor	a0,a0,1
20008bec:	8905                	and	a0,a0,1
20008bee:	0512                	sll	a0,a0,0x4
20008bf0:	00471793          	sll	a5,a4,0x4
20008bf4:	01c6d593          	srl	a1,a3,0x1c
20008bf8:	01c75893          	srl	a7,a4,0x1c
20008bfc:	0e12                	sll	t3,t3,0x4
20008bfe:	8ddd                	or	a1,a1,a5
20008c00:	01c8e8b3          	or	a7,a7,t3
20008c04:	004007b7          	lui	a5,0x400
20008c08:	00f8e8b3          	or	a7,a7,a5
20008c0c:	99e1                	and	a1,a1,-8
20008c0e:	7ff00793          	li	a5,2047
20008c12:	00800737          	lui	a4,0x800
20008c16:	00e8f733          	and	a4,a7,a4
20008c1a:	14070b63          	beqz	a4,20008d70 <__trunctfdf2+0x270>
20008c1e:	ff8006b7          	lui	a3,0xff800
20008c22:	16fd                	add	a3,a3,-1 # ff7fffff <dummy_file+0xc97bdbbf>
20008c24:	00d8f6b3          	and	a3,a7,a3
20008c28:	0785                	add	a5,a5,1 # 400001 <_start-0x1fbfffff>
20008c2a:	01d69713          	sll	a4,a3,0x1d
20008c2e:	7ff7f793          	and	a5,a5,2047
20008c32:	06a6                	sll	a3,a3,0x9
20008c34:	82b1                	srl	a3,a3,0xc
20008c36:	07d2                	sll	a5,a5,0x14
20008c38:	818d                	srl	a1,a1,0x3
20008c3a:	8fd5                	or	a5,a5,a3
20008c3c:	067e                	sll	a2,a2,0x1f
20008c3e:	8f4d                	or	a4,a4,a1
20008c40:	8fd1                	or	a5,a5,a2
20008c42:	c43a                	sw	a4,8(sp)
20008c44:	c63e                	sw	a5,12(sp)
20008c46:	2522                	fld	fa0,8(sp)
20008c48:	d121                	beqz	a0,20008b88 <__trunctfdf2+0x88>
20008c4a:	00152073          	csrs	fflags,a0
20008c4e:	6145                	add	sp,sp,48
20008c50:	8082                	ret
20008c52:	0b005963          	blez	a6,20008d04 <__trunctfdf2+0x204>
20008c56:	5792                	lw	a5,36(sp)
20008c58:	56a2                	lw	a3,40(sp)
20008c5a:	58b2                	lw	a7,44(sp)
20008c5c:	00479713          	sll	a4,a5,0x4
20008c60:	8dd9                	or	a1,a1,a4
20008c62:	83f1                	srl	a5,a5,0x1c
20008c64:	00469713          	sll	a4,a3,0x4
20008c68:	8fd9                	or	a5,a5,a4
20008c6a:	00b035b3          	snez	a1,a1
20008c6e:	8ddd                	or	a1,a1,a5
20008c70:	0892                	sll	a7,a7,0x4
20008c72:	82f1                	srl	a3,a3,0x1c
20008c74:	0075f793          	and	a5,a1,7
20008c78:	00d8e8b3          	or	a7,a7,a3
20008c7c:	4501                	li	a0,0
20008c7e:	c78d                	beqz	a5,20008ca8 <__trunctfdf2+0x1a8>
20008c80:	4789                	li	a5,2
20008c82:	10f30a63          	beq	t1,a5,20008d96 <__trunctfdf2+0x296>
20008c86:	478d                	li	a5,3
20008c88:	12f30063          	beq	t1,a5,20008da8 <__trunctfdf2+0x2a8>
20008c8c:	00031d63          	bnez	t1,20008ca6 <__trunctfdf2+0x1a6>
20008c90:	00f5f793          	and	a5,a1,15
20008c94:	4711                	li	a4,4
20008c96:	00e78863          	beq	a5,a4,20008ca6 <__trunctfdf2+0x1a6>
20008c9a:	00458793          	add	a5,a1,4 # 80004 <_start-0x1ff7fffc>
20008c9e:	00b7b5b3          	sltu	a1,a5,a1
20008ca2:	98ae                	add	a7,a7,a1
20008ca4:	85be                	mv	a1,a5
20008ca6:	4505                	li	a0,1
20008ca8:	00889793          	sll	a5,a7,0x8
20008cac:	2807d863          	bgez	a5,20008f3c <__trunctfdf2+0x43c>
20008cb0:	00180793          	add	a5,a6,1
20008cb4:	7ff00713          	li	a4,2047
20008cb8:	14e79363          	bne	a5,a4,20008dfe <__trunctfdf2+0x2fe>
20008cbc:	ea0309e3          	beqz	t1,20008b6e <__trunctfdf2+0x6e>
20008cc0:	478d                	li	a5,3
20008cc2:	24f30e63          	beq	t1,a5,20008f1e <__trunctfdf2+0x41e>
20008cc6:	4789                	li	a5,2
20008cc8:	1ef30b63          	beq	t1,a5,20008ebe <__trunctfdf2+0x3be>
20008ccc:	200006b7          	lui	a3,0x20000
20008cd0:	16fd                	add	a3,a3,-1 # 1fffffff <_start-0x1>
20008cd2:	4515                	li	a0,5
20008cd4:	7fe00813          	li	a6,2046
20008cd8:	55fd                	li	a1,-1
20008cda:	06b2                	sll	a3,a3,0xc
20008cdc:	82b1                	srl	a3,a3,0xc
20008cde:	7ff87793          	and	a5,a6,2047
20008ce2:	872e                	mv	a4,a1
20008ce4:	bd51                	j	20008b78 <__trunctfdf2+0x78>
20008ce6:	067e                	sll	a2,a2,0x1f
20008ce8:	c402                	sw	zero,8(sp)
20008cea:	c632                	sw	a2,12(sp)
20008cec:	2522                	fld	fa0,8(sp)
20008cee:	6145                	add	sp,sp,48
20008cf0:	8082                	ret
20008cf2:	478d                	li	a5,3
20008cf4:	1cf30f63          	beq	t1,a5,20008ed2 <__trunctfdf2+0x3d2>
20008cf8:	4789                	li	a5,2
20008cfa:	fcf311e3          	bne	t1,a5,20008cbc <__trunctfdf2+0x1bc>
20008cfe:	e60618e3          	bnez	a2,20008b6e <__trunctfdf2+0x6e>
20008d02:	bf6d                	j	20008cbc <__trunctfdf2+0x1bc>
20008d04:	fcc00713          	li	a4,-52
20008d08:	0ae84963          	blt	a6,a4,20008dba <__trunctfdf2+0x2ba>
20008d0c:	56b2                	lw	a3,44(sp)
20008d0e:	03d00713          	li	a4,61
20008d12:	41070733          	sub	a4,a4,a6
20008d16:	40575513          	sra	a0,a4,0x5
20008d1a:	00080f37          	lui	t5,0x80
20008d1e:	00df6f33          	or	t5,t5,a3
20008d22:	00251813          	sll	a6,a0,0x2
20008d26:	d67a                	sw	t5,44(sp)
20008d28:	8b7d                	and	a4,a4,31
20008d2a:	01088e33          	add	t3,a7,a6
20008d2e:	86c6                	mv	a3,a7
20008d30:	4581                	li	a1,0
20008d32:	0006ae83          	lw	t4,0(a3)
20008d36:	0691                	add	a3,a3,4
20008d38:	01d5e5b3          	or	a1,a1,t4
20008d3c:	fede1be3          	bne	t3,a3,20008d32 <__trunctfdf2+0x232>
20008d40:	468d                	li	a3,3
20008d42:	8e89                	sub	a3,a3,a0
20008d44:	e379                	bnez	a4,20008e0a <__trunctfdf2+0x30a>
20008d46:	000e2e03          	lw	t3,0(t3)
20008d4a:	0705                	add	a4,a4,1 # 800001 <_start-0x1f7fffff>
20008d4c:	0791                	add	a5,a5,4
20008d4e:	ffc7ae23          	sw	t3,-4(a5)
20008d52:	00e6cc63          	blt	a3,a4,20008d6a <__trunctfdf2+0x26a>
20008d56:	01078e33          	add	t3,a5,a6
20008d5a:	000e2e03          	lw	t3,0(t3)
20008d5e:	0705                	add	a4,a4,1
20008d60:	0791                	add	a5,a5,4
20008d62:	ffc7ae23          	sw	t3,-4(a5)
20008d66:	fee6d8e3          	bge	a3,a4,20008d56 <__trunctfdf2+0x256>
20008d6a:	4791                	li	a5,4
20008d6c:	8f89                	sub	a5,a5,a0
20008d6e:	a8f5                	j	20008e6a <__trunctfdf2+0x36a>
20008d70:	01d89693          	sll	a3,a7,0x1d
20008d74:	818d                	srl	a1,a1,0x3
20008d76:	7ff00813          	li	a6,2047
20008d7a:	8dd5                	or	a1,a1,a3
20008d7c:	0038d693          	srl	a3,a7,0x3
20008d80:	15079763          	bne	a5,a6,20008ece <__trunctfdf2+0x3ce>
20008d84:	8ecd                	or	a3,a3,a1
20008d86:	de0685e3          	beqz	a3,20008b70 <__trunctfdf2+0x70>
20008d8a:	4601                	li	a2,0
20008d8c:	7ff00793          	li	a5,2047
20008d90:	000806b7          	lui	a3,0x80
20008d94:	b3d5                	j	20008b78 <__trunctfdf2+0x78>
20008d96:	da01                	beqz	a2,20008ca6 <__trunctfdf2+0x1a6>
20008d98:	00858793          	add	a5,a1,8
20008d9c:	00b7b5b3          	sltu	a1,a5,a1
20008da0:	98ae                	add	a7,a7,a1
20008da2:	85be                	mv	a1,a5
20008da4:	8532                	mv	a0,a2
20008da6:	b709                	j	20008ca8 <__trunctfdf2+0x1a8>
20008da8:	fe75                	bnez	a2,20008da4 <__trunctfdf2+0x2a4>
20008daa:	00858793          	add	a5,a1,8
20008dae:	00b7b5b3          	sltu	a1,a5,a1
20008db2:	98ae                	add	a7,a7,a1
20008db4:	4505                	li	a0,1
20008db6:	85be                	mv	a1,a5
20008db8:	bdc5                	j	20008ca8 <__trunctfdf2+0x1a8>
20008dba:	4585                	li	a1,1
20008dbc:	4881                	li	a7,0
20008dbe:	4781                	li	a5,0
20008dc0:	4685                	li	a3,1
20008dc2:	4709                	li	a4,2
20008dc4:	4509                	li	a0,2
20008dc6:	18a30263          	beq	t1,a0,20008f4a <__trunctfdf2+0x44a>
20008dca:	450d                	li	a0,3
20008dcc:	18a30563          	beq	t1,a0,20008f56 <__trunctfdf2+0x456>
20008dd0:	4505                	li	a0,1
20008dd2:	de031ce3          	bnez	t1,20008bca <__trunctfdf2+0xca>
20008dd6:	00f77813          	and	a6,a4,15
20008dda:	4e11                	li	t3,4
20008ddc:	dfc811e3          	bne	a6,t3,20008bbe <__trunctfdf2+0xbe>
20008de0:	b3ed                	j	20008bca <__trunctfdf2+0xca>
20008de2:	4881                	li	a7,0
20008de4:	4585                	li	a1,1
20008de6:	0067c563          	blt	a5,t1,20008df0 <__trunctfdf2+0x2f0>
20008dea:	4789                	li	a5,2
20008dec:	16f30363          	beq	t1,a5,20008f52 <__trunctfdf2+0x452>
20008df0:	00889713          	sll	a4,a7,0x8
20008df4:	4785                	li	a5,1
20008df6:	450d                	li	a0,3
20008df8:	4801                	li	a6,0
20008dfa:	14075163          	bgez	a4,20008f3c <__trunctfdf2+0x43c>
20008dfe:	ff8006b7          	lui	a3,0xff800
20008e02:	16fd                	add	a3,a3,-1 # ff7fffff <dummy_file+0xc97bdbbf>
20008e04:	00d8f6b3          	and	a3,a7,a3
20008e08:	b50d                	j	20008c2a <__trunctfdf2+0x12a>
20008e0a:	02080e13          	add	t3,a6,32
20008e0e:	01010e93          	add	t4,sp,16
20008e12:	9e76                	add	t3,t3,t4
20008e14:	ff0e2e03          	lw	t3,-16(t3)
20008e18:	02000f93          	li	t6,32
20008e1c:	40ef8fb3          	sub	t6,t6,a4
20008e20:	01fe1e33          	sll	t3,t3,t6
20008e24:	01c5e5b3          	or	a1,a1,t3
20008e28:	cef5                	beqz	a3,20008f24 <__trunctfdf2+0x424>
20008e2a:	00269e13          	sll	t3,a3,0x2
20008e2e:	00fe02b3          	add	t0,t3,a5
20008e32:	010886b3          	add	a3,a7,a6
20008e36:	0006a803          	lw	a6,0(a3)
20008e3a:	0046ae83          	lw	t4,4(a3)
20008e3e:	0791                	add	a5,a5,4
20008e40:	00e85833          	srl	a6,a6,a4
20008e44:	01fe9eb3          	sll	t4,t4,t6
20008e48:	01d86833          	or	a6,a6,t4
20008e4c:	ff07ae23          	sw	a6,-4(a5)
20008e50:	0691                	add	a3,a3,4
20008e52:	fef292e3          	bne	t0,a5,20008e36 <__trunctfdf2+0x336>
20008e56:	4791                	li	a5,4
20008e58:	8f89                	sub	a5,a5,a0
20008e5a:	020e0693          	add	a3,t3,32
20008e5e:	0808                	add	a0,sp,16
20008e60:	96aa                	add	a3,a3,a0
20008e62:	00ef5f33          	srl	t5,t5,a4
20008e66:	ffe6a823          	sw	t5,-16(a3)
20008e6a:	4711                	li	a4,4
20008e6c:	8f1d                	sub	a4,a4,a5
20008e6e:	070a                	sll	a4,a4,0x2
20008e70:	078a                	sll	a5,a5,0x2
20008e72:	46a1                	li	a3,8
20008e74:	97c6                	add	a5,a5,a7
20008e76:	00d76863          	bltu	a4,a3,20008e86 <__trunctfdf2+0x386>
20008e7a:	0007a023          	sw	zero,0(a5)
20008e7e:	0007a223          	sw	zero,4(a5)
20008e82:	1761                	add	a4,a4,-8
20008e84:	07a1                	add	a5,a5,8
20008e86:	4691                	li	a3,4
20008e88:	00d76463          	bltu	a4,a3,20008e90 <__trunctfdf2+0x390>
20008e8c:	0007a023          	sw	zero,0(a5)
20008e90:	5782                	lw	a5,32(sp)
20008e92:	5892                	lw	a7,36(sp)
20008e94:	00b035b3          	snez	a1,a1
20008e98:	8ddd                	or	a1,a1,a5
20008e9a:	0115e7b3          	or	a5,a1,a7
20008e9e:	e40784e3          	beqz	a5,20008ce6 <__trunctfdf2+0x1e6>
20008ea2:	00159713          	sll	a4,a1,0x1
20008ea6:	01f5d693          	srl	a3,a1,0x1f
20008eaa:	00189793          	sll	a5,a7,0x1
20008eae:	00777513          	and	a0,a4,7
20008eb2:	97b6                	add	a5,a5,a3
20008eb4:	0075f693          	and	a3,a1,7
20008eb8:	d00509e3          	beqz	a0,20008bca <__trunctfdf2+0xca>
20008ebc:	b721                	j	20008dc4 <__trunctfdf2+0x2c4>
20008ebe:	e00607e3          	beqz	a2,20008ccc <__trunctfdf2+0x1cc>
20008ec2:	b175                	j	20008b6e <__trunctfdf2+0x6e>
20008ec4:	ea95                	bnez	a3,20008ef8 <__trunctfdf2+0x3f8>
20008ec6:	4781                	li	a5,0
20008ec8:	d40505e3          	beqz	a0,20008c12 <__trunctfdf2+0x112>
20008ecc:	b715                	j	20008df0 <__trunctfdf2+0x2f0>
20008ece:	4801                	li	a6,0
20008ed0:	b529                	j	20008cda <__trunctfdf2+0x1da>
20008ed2:	c8060ee3          	beqz	a2,20008b6e <__trunctfdf2+0x6e>
20008ed6:	b3dd                	j	20008cbc <__trunctfdf2+0x1bc>
20008ed8:	ee11                	bnez	a2,20008ef4 <__trunctfdf2+0x3f4>
20008eda:	4709                	li	a4,2
20008edc:	4781                	li	a5,0
20008ede:	4881                	li	a7,0
20008ee0:	4585                	li	a1,1
20008ee2:	4685                	li	a3,1
20008ee4:	ff873713          	sltiu	a4,a4,-8
20008ee8:	00173713          	seqz	a4,a4
20008eec:	97ba                	add	a5,a5,a4
20008eee:	4505                	li	a0,1
20008ef0:	b9e9                	j	20008bca <__trunctfdf2+0xca>
20008ef2:	f665                	bnez	a2,20008eda <__trunctfdf2+0x3da>
20008ef4:	4881                	li	a7,0
20008ef6:	4585                	li	a1,1
20008ef8:	478d                	li	a5,3
20008efa:	02f30863          	beq	t1,a5,20008f2a <__trunctfdf2+0x42a>
20008efe:	ee67c9e3          	blt	a5,t1,20008df0 <__trunctfdf2+0x2f0>
20008f02:	ee0314e3          	bnez	t1,20008dea <__trunctfdf2+0x2ea>
20008f06:	00f5f793          	and	a5,a1,15
20008f0a:	4711                	li	a4,4
20008f0c:	eee782e3          	beq	a5,a4,20008df0 <__trunctfdf2+0x2f0>
20008f10:	00458793          	add	a5,a1,4
20008f14:	00b7b5b3          	sltu	a1,a5,a1
20008f18:	98ae                	add	a7,a7,a1
20008f1a:	85be                	mv	a1,a5
20008f1c:	bdd1                	j	20008df0 <__trunctfdf2+0x2f0>
20008f1e:	c40608e3          	beqz	a2,20008b6e <__trunctfdf2+0x6e>
20008f22:	b36d                	j	20008ccc <__trunctfdf2+0x1cc>
20008f24:	4785                	li	a5,1
20008f26:	4e01                	li	t3,0
20008f28:	bf0d                	j	20008e5a <__trunctfdf2+0x35a>
20008f2a:	ec0613e3          	bnez	a2,20008df0 <__trunctfdf2+0x2f0>
20008f2e:	00858793          	add	a5,a1,8
20008f32:	00b7b5b3          	sltu	a1,a5,a1
20008f36:	98ae                	add	a7,a7,a1
20008f38:	85be                	mv	a1,a5
20008f3a:	bd5d                	j	20008df0 <__trunctfdf2+0x2f0>
20008f3c:	818d                	srl	a1,a1,0x3
20008f3e:	01d89793          	sll	a5,a7,0x1d
20008f42:	8ddd                	or	a1,a1,a5
20008f44:	0038d693          	srl	a3,a7,0x3
20008f48:	bb49                	j	20008cda <__trunctfdf2+0x1da>
20008f4a:	4505                	li	a0,1
20008f4c:	c6060fe3          	beqz	a2,20008bca <__trunctfdf2+0xca>
20008f50:	bf51                	j	20008ee4 <__trunctfdf2+0x3e4>
20008f52:	fe71                	bnez	a2,20008f2e <__trunctfdf2+0x42e>
20008f54:	bd71                	j	20008df0 <__trunctfdf2+0x2f0>
20008f56:	8532                	mv	a0,a2
20008f58:	c60619e3          	bnez	a2,20008bca <__trunctfdf2+0xca>
20008f5c:	b761                	j	20008ee4 <__trunctfdf2+0x3e4>

20008f5e <__clzsi2>:
20008f5e:	67c1                	lui	a5,0x10
20008f60:	02f57663          	bgeu	a0,a5,20008f8c <__clzsi2+0x2e>
20008f64:	10053713          	sltiu	a4,a0,256
20008f68:	00173713          	seqz	a4,a4
20008f6c:	070e                	sll	a4,a4,0x3
20008f6e:	200147b7          	lui	a5,0x20014
20008f72:	00e55533          	srl	a0,a0,a4
20008f76:	a4878793          	add	a5,a5,-1464 # 20013a48 <__clz_tab>
20008f7a:	97aa                	add	a5,a5,a0
20008f7c:	0007c503          	lbu	a0,0(a5)
20008f80:	02000693          	li	a3,32
20008f84:	8e99                	sub	a3,a3,a4
20008f86:	40a68533          	sub	a0,a3,a0
20008f8a:	8082                	ret
20008f8c:	010007b7          	lui	a5,0x1000
20008f90:	02f57063          	bgeu	a0,a5,20008fb0 <__clzsi2+0x52>
20008f94:	4741                	li	a4,16
20008f96:	200147b7          	lui	a5,0x20014
20008f9a:	00e55533          	srl	a0,a0,a4
20008f9e:	a4878793          	add	a5,a5,-1464 # 20013a48 <__clz_tab>
20008fa2:	97aa                	add	a5,a5,a0
20008fa4:	0007c503          	lbu	a0,0(a5)
20008fa8:	46c1                	li	a3,16
20008faa:	40a68533          	sub	a0,a3,a0
20008fae:	8082                	ret
20008fb0:	4761                	li	a4,24
20008fb2:	200147b7          	lui	a5,0x20014
20008fb6:	00e55533          	srl	a0,a0,a4
20008fba:	a4878793          	add	a5,a5,-1464 # 20013a48 <__clz_tab>
20008fbe:	97aa                	add	a5,a5,a0
20008fc0:	0007c503          	lbu	a0,0(a5)
20008fc4:	46a1                	li	a3,8
20008fc6:	40a68533          	sub	a0,a3,a0
20008fca:	8082                	ret
