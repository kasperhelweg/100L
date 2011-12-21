	.text	0x00400000
	.globl	main
	la	$28, _heap_
	jal	main
	ori	$2, $0, 10
	syscall
# 
main:
	addi	$29, $29, -20
	sw	$31, 16($29)
	sw	$19, 12($29)
	sw	$18, 8($29)
	sw	$17, 4($29)
	sw	$16, 0($29)
	jal	getint
# was:	jal	getint, 
# 	ori	_assign__4_,2,0
	ori	$17, $2, 0
# was:	ori	_3_n, _assign__4_, 0
# 	ori	0,_assign__4_,0
	ori	$2, $17, 0
# was:	ori	_exps__6_, _3_n, 0
# 	ori	2,_exps__6_,0
	jal	walloc
# was:	jal	walloc, 2
# 	ori	_assign__5_,2,0
	ori	$3, $0, _1_a
# was:	ori	_lookup1__7_, 0, _1_a
	add	$3, $3, $0
# was:	add	_lookup2__8_, _lookup1__7_, 0
	add	$3, $3, $0
# was:	add	_lookup2__8_, _lookup2__8_, 0
	add	$3, $3, $0
# was:	add	_lookup2__8_, _lookup2__8_, 0
	add	$3, $3, $0
# was:	add	_lookup2__8_, _lookup2__8_, 0
	sw	$2, 0($3)
# was:	sw	_assign__5_, 0(_lookup2__8_)
	ori	$18, $0, 0
# was:	ori	_assign__9_, 0, 0
# 	ori	_2_i,_assign__9_,0
# 	ori	0,_assign__9_,0
_whilestart__11_:
# 	ori	_less1__13_,_2_i,0
# 	ori	_less2__14_,_3_n,0
	slt	$3, $18, $17
# was:	slt	_while__10_, _less1__13_, _less2__14_
	beq	$3, $0, _endwhile__12_
# was:	beq	_while__10_, 0, _endwhile__12_
# 	ori	_Lval__16_,_2_i,0
	sll	$3, $18, 2
# was:	sll	_lookup__17_, _Lval__16_, 2
	add	$3, $3, $16
# was:	add	_lookup__17_, _lookup__17_, _1_a
	jal	getint
# was:	jal	getint, 
# 	ori	_assign__15_,2,0
	ori	$3, $0, _1_a
# was:	ori	_lookup1__18_, 0, _1_a
	add	$3, $3, $18
# was:	add	_lookup2__19_, _lookup1__18_, _Lval__16_
	add	$3, $3, $18
# was:	add	_lookup2__19_, _lookup2__19_, _Lval__16_
	add	$3, $3, $18
# was:	add	_lookup2__19_, _lookup2__19_, _Lval__16_
	add	$3, $3, $18
# was:	add	_lookup2__19_, _lookup2__19_, _Lval__16_
	sw	$2, 0($3)
# was:	sw	_assign__15_, 0(_lookup2__19_)
# 	ori	_plus1__21_,_2_i,0
	ori	$3, $0, 1
# was:	ori	_plus2__22_, 0, 1
	add	$18, $18, $3
# was:	add	_assign__20_, _plus1__21_, _plus2__22_
# 	ori	_2_i,_assign__20_,0
# 	ori	0,_assign__20_,0
	j	_whilestart__11_
_endwhile__12_:
	ori	$2, $0, _1_a
# was:	ori	_lookup1__24_, 0, _1_a
	add	$2, $2, $0
# was:	add	_lookup2__25_, _lookup1__24_, 0
	add	$2, $2, $0
# was:	add	_lookup2__25_, _lookup2__25_, 0
	add	$2, $2, $0
# was:	add	_lookup2__25_, _lookup2__25_, 0
	add	$2, $2, $0
# was:	add	_lookup2__25_, _lookup2__25_, 0
	lw	$2, 0($2)
# was:	lw	_exps__23_, 0(_lookup2__25_)
	ori	$3, $17, 0
# was:	ori	_exps__26_, _3_n, 0
# 	ori	2,_exps__23_,0
# 	ori	3,_exps__26_,0
	jal	sort
# was:	jal	sort, 23
# 	ori	0,2,0
	ori	$18, $0, 0
# was:	ori	_assign__27_, 0, 0
# 	ori	_2_i,_assign__27_,0
# 	ori	0,_assign__27_,0
_whilestart__29_:
# 	ori	_less1__31_,_2_i,0
# 	ori	_less2__32_,_3_n,0
	slt	$2, $18, $17
# was:	slt	_while__28_, _less1__31_, _less2__32_
	beq	$2, $0, _endwhile__30_
# was:	beq	_while__28_, 0, _endwhile__30_
# 	ori	_Lval__34_,_2_i,0
	sll	$2, $18, 2
# was:	sll	_lookup__35_, _Lval__34_, 2
	add	$2, $2, $16
# was:	add	_lookup__35_, _lookup__35_, _1_a
	ori	$2, $0, _1_a
# was:	ori	_lookup1__36_, 0, _1_a
	add	$2, $2, $18
# was:	add	_lookup2__37_, _lookup1__36_, _Lval__34_
	add	$2, $2, $18
# was:	add	_lookup2__37_, _lookup2__37_, _Lval__34_
	add	$2, $2, $18
# was:	add	_lookup2__37_, _lookup2__37_, _Lval__34_
	add	$2, $2, $18
# was:	add	_lookup2__37_, _lookup2__37_, _Lval__34_
	lw	$2, 0($2)
# was:	lw	_exps__33_, 0(_lookup2__37_)
# 	ori	2,_exps__33_,0
	jal	putint
# was:	jal	putint, 2
# 	ori	0,2,0
# 	ori	_plus1__39_,_2_i,0
	ori	$2, $0, 1
# was:	ori	_plus2__40_, 0, 1
	add	$18, $18, $2
# was:	add	_assign__38_, _plus1__39_, _plus2__40_
# 	ori	_2_i,_assign__38_,0
# 	ori	0,_assign__38_,0
	j	_whilestart__29_
_endwhile__30_:
	ori	$2, $0, 0
# was:	ori	_return__41_, 0, 0
# 	ori	2,_return__41_,0
	j	main_exit
main_exit:
	lw	$19, 12($29)
	lw	$18, 8($29)
	lw	$17, 4($29)
	lw	$16, 0($29)
	lw	$31, 16($29)
	addi	$29, $29, 20
	jr	$31
# 
sort:
	addi	$29, $29, -8
	sw	$31, 4($29)
	sw	$16, 0($29)
# 	ori	a_42_,2,0
# 	ori	n_43_,3,0
# 	ori	_minus1__48_,n_43_,0
	ori	$4, $0, 1
# was:	ori	_minus2__49_, 0, 1
	sub	$4, $3, $4
# was:	sub	_assign__47_, _minus1__48_, _minus2__49_
# 	ori	_46_i,_assign__47_,0
# 	ori	0,_assign__47_,0
_whilestart__51_:
	ori	$3, $0, 0
# was:	ori	_less1__53_, 0, 0
# 	ori	_less2__54_,_46_i,0
	slt	$3, $3, $4
# was:	slt	_while__50_, _less1__53_, _less2__54_
	beq	$3, $0, _endwhile__52_
# was:	beq	_while__50_, 0, _endwhile__52_
	ori	$7, $0, 0
# was:	ori	_assign__55_, 0, 0
# 	ori	_45_j,_assign__55_,0
# 	ori	0,_assign__55_,0
_whilestart__57_:
# 	ori	_less1__59_,_45_j,0
# 	ori	_less2__60_,_46_i,0
	slt	$3, $7, $4
# was:	slt	_while__56_, _less1__59_, _less2__60_
	beq	$3, $0, _endwhile__58_
# was:	beq	_while__56_, 0, _endwhile__58_
# 	ori	_plus1__66_,_45_j,0
	ori	$3, $0, 1
# was:	ori	_plus2__67_, 0, 1
	add	$3, $7, $3
# was:	add	_Lval__65_, _plus1__66_, _plus2__67_
	sll	$5, $3, 2
# was:	sll	_lookup__68_, _Lval__65_, 2
	add	$5, $5, $2
# was:	add	_lookup__68_, _lookup__68_, a_42_
	ori	$5, $0, a_42_
# was:	ori	_lookup1__69_, 0, a_42_
	add	$5, $5, $3
# was:	add	_lookup2__70_, _lookup1__69_, _Lval__65_
	add	$5, $5, $3
# was:	add	_lookup2__70_, _lookup2__70_, _Lval__65_
	add	$5, $5, $3
# was:	add	_lookup2__70_, _lookup2__70_, _Lval__65_
	add	$5, $5, $3
# was:	add	_lookup2__70_, _lookup2__70_, _Lval__65_
	lw	$5, 0($5)
# was:	lw	_less1__63_, 0(_lookup2__70_)
# 	ori	_Lval__71_,_45_j,0
	sll	$3, $7, 2
# was:	sll	_lookup__72_, _Lval__71_, 2
	add	$3, $3, $2
# was:	add	_lookup__72_, _lookup__72_, a_42_
	ori	$3, $0, a_42_
# was:	ori	_lookup1__73_, 0, a_42_
	add	$3, $3, $7
# was:	add	_lookup2__74_, _lookup1__73_, _Lval__71_
	add	$3, $3, $7
# was:	add	_lookup2__74_, _lookup2__74_, _Lval__71_
	add	$3, $3, $7
# was:	add	_lookup2__74_, _lookup2__74_, _Lval__71_
	add	$3, $3, $7
# was:	add	_lookup2__74_, _lookup2__74_, _Lval__71_
	lw	$3, 0($3)
# was:	lw	_less2__64_, 0(_lookup2__74_)
	slt	$3, $5, $3
# was:	slt	_if__61_, _less1__63_, _less2__64_
	beq	$3, $0, _endif__62_
# was:	beq	_if__61_, 0, _endif__62_
# 	ori	_Lval__76_,_45_j,0
	sll	$3, $7, 2
# was:	sll	_lookup__77_, _Lval__76_, 2
	add	$3, $3, $2
# was:	add	_lookup__77_, _lookup__77_, a_42_
	ori	$3, $0, a_42_
# was:	ori	_lookup1__78_, 0, a_42_
	add	$3, $3, $7
# was:	add	_lookup2__79_, _lookup1__78_, _Lval__76_
	add	$3, $3, $7
# was:	add	_lookup2__79_, _lookup2__79_, _Lval__76_
	add	$3, $3, $7
# was:	add	_lookup2__79_, _lookup2__79_, _Lval__76_
	add	$3, $3, $7
# was:	add	_lookup2__79_, _lookup2__79_, _Lval__76_
	lw	$3, 0($3)
# was:	lw	_assign__75_, 0(_lookup2__79_)
# 	ori	_44_t,_assign__75_,0
# 	ori	0,_assign__75_,0
# 	ori	_Lval__81_,_45_j,0
	sll	$5, $7, 2
# was:	sll	_lookup__82_, _Lval__81_, 2
	add	$5, $5, $2
# was:	add	_lookup__82_, _lookup__82_, a_42_
	ori	$6, $7, 0
# was:	ori	_plus1__84_, _45_j, 0
	ori	$5, $0, 1
# was:	ori	_plus2__85_, 0, 1
	add	$5, $6, $5
# was:	add	_Lval__83_, _plus1__84_, _plus2__85_
	sll	$6, $5, 2
# was:	sll	_lookup__86_, _Lval__83_, 2
	add	$6, $6, $2
# was:	add	_lookup__86_, _lookup__86_, a_42_
	ori	$6, $0, a_42_
# was:	ori	_lookup1__87_, 0, a_42_
	add	$6, $6, $5
# was:	add	_lookup2__88_, _lookup1__87_, _Lval__83_
	add	$6, $6, $5
# was:	add	_lookup2__88_, _lookup2__88_, _Lval__83_
	add	$6, $6, $5
# was:	add	_lookup2__88_, _lookup2__88_, _Lval__83_
	add	$6, $6, $5
# was:	add	_lookup2__88_, _lookup2__88_, _Lval__83_
	lw	$5, 0($6)
# was:	lw	_assign__80_, 0(_lookup2__88_)
	ori	$6, $0, a_42_
# was:	ori	_lookup1__89_, 0, a_42_
	add	$6, $6, $7
# was:	add	_lookup2__90_, _lookup1__89_, _Lval__81_
	add	$6, $6, $7
# was:	add	_lookup2__90_, _lookup2__90_, _Lval__81_
	add	$6, $6, $7
# was:	add	_lookup2__90_, _lookup2__90_, _Lval__81_
	add	$6, $6, $7
# was:	add	_lookup2__90_, _lookup2__90_, _Lval__81_
	sw	$5, 0($6)
# was:	sw	_assign__80_, 0(_lookup2__90_)
# 	ori	_plus1__93_,_45_j,0
	ori	$5, $0, 1
# was:	ori	_plus2__94_, 0, 1
	add	$5, $7, $5
# was:	add	_Lval__92_, _plus1__93_, _plus2__94_
	sll	$6, $5, 2
# was:	sll	_lookup__95_, _Lval__92_, 2
	add	$6, $6, $2
# was:	add	_lookup__95_, _lookup__95_, a_42_
	ori	$6, $3, 0
# was:	ori	_assign__91_, _44_t, 0
	ori	$3, $0, a_42_
# was:	ori	_lookup1__96_, 0, a_42_
	add	$3, $3, $5
# was:	add	_lookup2__97_, _lookup1__96_, _Lval__92_
	add	$3, $3, $5
# was:	add	_lookup2__97_, _lookup2__97_, _Lval__92_
	add	$3, $3, $5
# was:	add	_lookup2__97_, _lookup2__97_, _Lval__92_
	add	$3, $3, $5
# was:	add	_lookup2__97_, _lookup2__97_, _Lval__92_
	sw	$6, 0($3)
# was:	sw	_assign__91_, 0(_lookup2__97_)
_endif__62_:
# 	ori	_plus1__99_,_45_j,0
	ori	$3, $0, 1
# was:	ori	_plus2__100_, 0, 1
	add	$7, $7, $3
# was:	add	_assign__98_, _plus1__99_, _plus2__100_
# 	ori	_45_j,_assign__98_,0
# 	ori	0,_assign__98_,0
	j	_whilestart__57_
_endwhile__58_:
# 	ori	_minus1__102_,_46_i,0
	ori	$3, $0, 1
# was:	ori	_minus2__103_, 0, 1
	sub	$4, $4, $3
# was:	sub	_assign__101_, _minus1__102_, _minus2__103_
# 	ori	_46_i,_assign__101_,0
# 	ori	0,_assign__101_,0
	j	_whilestart__51_
_endwhile__52_:
	ori	$2, $0, 0
# was:	ori	_return__104_, 0, 0
# 	ori	2,_return__104_,0
	j	sort_exit
sort_exit:
	lw	$16, 0($29)
	lw	$31, 4($29)
	addi	$29, $29, 8
	jr	$31
putint:
	addi	$29, $29, -8
	sw	$2, 0($29)
	sw	$4, 4($29)
	ori	$4, $2, 0
	ori	$2, $0, 1
	syscall
	ori	$2, $0, 4
	la	$4, _cr_
	syscall
	lw	$2, 0($29)
	lw	$4, 4($29)
	addi	$29, $29, 8
	jr	$31
getint:
	ori	$2, $0, 5
	syscall
	jr	$31
putstring:
	ori	$4, $2, 0
	ori	$2, $0, 4
	syscall
	jr	$31
getstring:
	ori	$4, $2, 0
	ori	$2, $0, 9
	syscall
	ori	$5, $4, 0
	ori	$4, $2, 0
	ori	$2, $0, 8
	syscall
	ori	$2, $4, 0
	jr	$31
walloc:
	ori	$4, $2, 0
	add	$4, $4, $4
	add	$4, $4, $4
	ori	$2, $0, 9
	syscall
	jr	$31
balloc:
	ori	$4, $2, 0
	ori	$2, $0, 9
	syscall
	jr	$31
	.data	
	.align	2
_cr_:
	.asciiz	"\n"
	.align	2
_heap_:
	.space	100000
