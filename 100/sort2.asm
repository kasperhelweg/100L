	.text	0x00400000
	.globl	main
	la	$28, _heap_
	jal	main
	ori	$2, $0, 10
	syscall
# 
main:
	addi	$29, $29, -16
	sw	$31, 12($29)
	sw	$18, 8($29)
	sw	$17, 4($29)
	sw	$16, 0($29)
	jal	getint
# was:	jal	getint, 
# 	ori	_assign__4_,2,0
	ori	$16, $2, 0
# was:	ori	_3_n, _assign__4_, 0
# 	ori	0,_assign__4_,0
	ori	$2, $16, 0
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
	ori	$17, $0, 0
# was:	ori	_assign__9_, 0, 0
# 	ori	_2_i,_assign__9_,0
# 	ori	0,_assign__9_,0
_whilestart__11_:
# 	ori	_less1__13_,_2_i,0
# 	ori	_less2__14_,_3_n,0
	slt	$3, $17, $16
# was:	slt	_while__10_, _less1__13_, _less2__14_
	beq	$3, $0, _endwhile__12_
# was:	beq	_while__10_, 0, _endwhile__12_
# 	ori	_Lval__16_,_2_i,0
	jal	getint
# was:	jal	getint, 
# 	ori	_assign__15_,2,0
	ori	$3, $0, _1_a
# was:	ori	_lookup1__17_, 0, _1_a
	add	$3, $3, $17
# was:	add	_lookup2__18_, _lookup1__17_, _Lval__16_
	add	$3, $3, $17
# was:	add	_lookup2__18_, _lookup2__18_, _Lval__16_
	add	$3, $3, $17
# was:	add	_lookup2__18_, _lookup2__18_, _Lval__16_
	add	$3, $3, $17
# was:	add	_lookup2__18_, _lookup2__18_, _Lval__16_
	sw	$2, 0($3)
# was:	sw	_assign__15_, 0(_lookup2__18_)
# 	ori	_plus1__20_,_2_i,0
	ori	$3, $0, 1
# was:	ori	_plus2__21_, 0, 1
	add	$17, $17, $3
# was:	add	_assign__19_, _plus1__20_, _plus2__21_
# 	ori	_2_i,_assign__19_,0
# 	ori	0,_assign__19_,0
	j	_whilestart__11_
_endwhile__12_:
	ori	$2, $0, _1_a
# was:	ori	_lookup1__23_, 0, _1_a
	add	$2, $2, $0
# was:	add	_lookup2__24_, _lookup1__23_, 0
	add	$2, $2, $0
# was:	add	_lookup2__24_, _lookup2__24_, 0
	add	$2, $2, $0
# was:	add	_lookup2__24_, _lookup2__24_, 0
	add	$2, $2, $0
# was:	add	_lookup2__24_, _lookup2__24_, 0
	lw	$2, 0($2)
# was:	lw	_exps__22_, 0(_lookup2__24_)
	ori	$3, $16, 0
# was:	ori	_exps__25_, _3_n, 0
# 	ori	2,_exps__22_,0
# 	ori	3,_exps__25_,0
	jal	sort
# was:	jal	sort, 23
# 	ori	0,2,0
	ori	$17, $0, 0
# was:	ori	_assign__26_, 0, 0
# 	ori	_2_i,_assign__26_,0
# 	ori	0,_assign__26_,0
_whilestart__28_:
# 	ori	_less1__30_,_2_i,0
# 	ori	_less2__31_,_3_n,0
	slt	$2, $17, $16
# was:	slt	_while__27_, _less1__30_, _less2__31_
	beq	$2, $0, _endwhile__29_
# was:	beq	_while__27_, 0, _endwhile__29_
# 	ori	_Lval__33_,_2_i,0
	ori	$2, $0, _1_a
# was:	ori	_lookup1__34_, 0, _1_a
	add	$2, $2, $17
# was:	add	_lookup2__35_, _lookup1__34_, _Lval__33_
	add	$2, $2, $17
# was:	add	_lookup2__35_, _lookup2__35_, _Lval__33_
	add	$2, $2, $17
# was:	add	_lookup2__35_, _lookup2__35_, _Lval__33_
	add	$2, $2, $17
# was:	add	_lookup2__35_, _lookup2__35_, _Lval__33_
	lw	$2, 0($2)
# was:	lw	_exps__32_, 0(_lookup2__35_)
# 	ori	2,_exps__32_,0
	jal	putint
# was:	jal	putint, 2
# 	ori	0,2,0
# 	ori	_plus1__37_,_2_i,0
	ori	$2, $0, 1
# was:	ori	_plus2__38_, 0, 1
	add	$17, $17, $2
# was:	add	_assign__36_, _plus1__37_, _plus2__38_
# 	ori	_2_i,_assign__36_,0
# 	ori	0,_assign__36_,0
	j	_whilestart__28_
_endwhile__29_:
	ori	$2, $0, 0
# was:	ori	_return__39_, 0, 0
# 	ori	2,_return__39_,0
	j	main_exit
main_exit:
	lw	$18, 8($29)
	lw	$17, 4($29)
	lw	$16, 0($29)
	lw	$31, 12($29)
	addi	$29, $29, 16
	jr	$31
# 
sort:
	addi	$29, $29, -8
	sw	$31, 4($29)
	sw	$16, 0($29)
# 	ori	a_40_,2,0
# 	ori	n_41_,3,0
	ori	$2, $0, a_40_
# was:	ori	_lookup1__50_, 0, a_40_
	add	$2, $2, $0
# was:	add	_lookup2__51_, _lookup1__50_, 0
	add	$2, $2, $0
# was:	add	_lookup2__51_, _lookup2__51_, 0
	add	$2, $2, $0
# was:	add	_lookup2__51_, _lookup2__51_, 0
	add	$2, $2, $0
# was:	add	_lookup2__51_, _lookup2__51_, 0
	lw	$2, 0($2)
# was:	lw	_plus1__48_, 0(_lookup2__51_)
# 	ori	_plus2__49_,n_41_,0
	add	$3, $2, $3
# was:	add	_minus1__46_, _plus1__48_, _plus2__49_
	ori	$2, $0, 1
# was:	ori	_minus2__47_, 0, 1
	sub	$2, $3, $2
# was:	sub	_assign__45_, _minus1__46_, _minus2__47_
	ori	$3, $0, _42_c
# was:	ori	_lookup1__52_, 0, _42_c
	add	$3, $3, $0
# was:	add	_lookup2__53_, _lookup1__52_, 0
	add	$3, $3, $0
# was:	add	_lookup2__53_, _lookup2__53_, 0
	add	$3, $3, $0
# was:	add	_lookup2__53_, _lookup2__53_, 0
	add	$3, $3, $0
# was:	add	_lookup2__53_, _lookup2__53_, 0
	sw	$2, 0($3)
# was:	sw	_assign__45_, 0(_lookup2__53_)
_whilestart__55_:
	ori	$2, $0, a_40_
# was:	ori	_lookup1__59_, 0, a_40_
	add	$2, $2, $0
# was:	add	_lookup2__60_, _lookup1__59_, 0
	add	$2, $2, $0
# was:	add	_lookup2__60_, _lookup2__60_, 0
	add	$2, $2, $0
# was:	add	_lookup2__60_, _lookup2__60_, 0
	add	$2, $2, $0
# was:	add	_lookup2__60_, _lookup2__60_, 0
	lw	$2, 0($2)
# was:	lw	_less1__57_, 0(_lookup2__60_)
	ori	$3, $0, _42_c
# was:	ori	_lookup1__61_, 0, _42_c
	add	$3, $3, $0
# was:	add	_lookup2__62_, _lookup1__61_, 0
	add	$3, $3, $0
# was:	add	_lookup2__62_, _lookup2__62_, 0
	add	$3, $3, $0
# was:	add	_lookup2__62_, _lookup2__62_, 0
	add	$3, $3, $0
# was:	add	_lookup2__62_, _lookup2__62_, 0
	lw	$3, 0($3)
# was:	lw	_less2__58_, 0(_lookup2__62_)
	slt	$2, $2, $3
# was:	slt	_while__54_, _less1__57_, _less2__58_
	beq	$2, $0, _endwhile__56_
# was:	beq	_while__54_, 0, _endwhile__56_
	ori	$2, $0, a_40_
# was:	ori	_lookup1__64_, 0, a_40_
	add	$2, $2, $0
# was:	add	_lookup2__65_, _lookup1__64_, 0
	add	$2, $2, $0
# was:	add	_lookup2__65_, _lookup2__65_, 0
	add	$2, $2, $0
# was:	add	_lookup2__65_, _lookup2__65_, 0
	add	$2, $2, $0
# was:	add	_lookup2__65_, _lookup2__65_, 0
	lw	$2, 0($2)
# was:	lw	_assign__63_, 0(_lookup2__65_)
	ori	$3, $0, _43_b
# was:	ori	_lookup1__66_, 0, _43_b
	add	$3, $3, $0
# was:	add	_lookup2__67_, _lookup1__66_, 0
	add	$3, $3, $0
# was:	add	_lookup2__67_, _lookup2__67_, 0
	add	$3, $3, $0
# was:	add	_lookup2__67_, _lookup2__67_, 0
	add	$3, $3, $0
# was:	add	_lookup2__67_, _lookup2__67_, 0
	sw	$2, 0($3)
# was:	sw	_assign__63_, 0(_lookup2__67_)
_whilestart__69_:
	ori	$2, $0, _43_b
# was:	ori	_lookup1__73_, 0, _43_b
	add	$2, $2, $0
# was:	add	_lookup2__74_, _lookup1__73_, 0
	add	$2, $2, $0
# was:	add	_lookup2__74_, _lookup2__74_, 0
	add	$2, $2, $0
# was:	add	_lookup2__74_, _lookup2__74_, 0
	add	$2, $2, $0
# was:	add	_lookup2__74_, _lookup2__74_, 0
	lw	$2, 0($2)
# was:	lw	_less1__71_, 0(_lookup2__74_)
	ori	$3, $0, _42_c
# was:	ori	_lookup1__75_, 0, _42_c
	add	$3, $3, $0
# was:	add	_lookup2__76_, _lookup1__75_, 0
	add	$3, $3, $0
# was:	add	_lookup2__76_, _lookup2__76_, 0
	add	$3, $3, $0
# was:	add	_lookup2__76_, _lookup2__76_, 0
	add	$3, $3, $0
# was:	add	_lookup2__76_, _lookup2__76_, 0
	lw	$3, 0($3)
# was:	lw	_less2__72_, 0(_lookup2__76_)
	slt	$2, $2, $3
# was:	slt	_while__68_, _less1__71_, _less2__72_
	beq	$2, $0, _endwhile__70_
# was:	beq	_while__68_, 0, _endwhile__70_
	ori	$2, $0, 1
# was:	ori	_Lval__81_, 0, 1
	ori	$3, $0, _43_b
# was:	ori	_lookup1__82_, 0, _43_b
	add	$3, $3, $2
# was:	add	_lookup2__83_, _lookup1__82_, _Lval__81_
	add	$3, $3, $2
# was:	add	_lookup2__83_, _lookup2__83_, _Lval__81_
	add	$3, $3, $2
# was:	add	_lookup2__83_, _lookup2__83_, _Lval__81_
	add	$3, $3, $2
# was:	add	_lookup2__83_, _lookup2__83_, _Lval__81_
	lw	$2, 0($3)
# was:	lw	_less1__79_, 0(_lookup2__83_)
	ori	$3, $0, _43_b
# was:	ori	_lookup1__84_, 0, _43_b
	add	$3, $3, $0
# was:	add	_lookup2__85_, _lookup1__84_, 0
	add	$3, $3, $0
# was:	add	_lookup2__85_, _lookup2__85_, 0
	add	$3, $3, $0
# was:	add	_lookup2__85_, _lookup2__85_, 0
	add	$3, $3, $0
# was:	add	_lookup2__85_, _lookup2__85_, 0
	lw	$3, 0($3)
# was:	lw	_less2__80_, 0(_lookup2__85_)
	slt	$2, $2, $3
# was:	slt	_if__77_, _less1__79_, _less2__80_
	beq	$2, $0, _endif__78_
# was:	beq	_if__77_, 0, _endif__78_
	ori	$2, $0, _43_b
# was:	ori	_lookup1__87_, 0, _43_b
	add	$2, $2, $0
# was:	add	_lookup2__88_, _lookup1__87_, 0
	add	$2, $2, $0
# was:	add	_lookup2__88_, _lookup2__88_, 0
	add	$2, $2, $0
# was:	add	_lookup2__88_, _lookup2__88_, 0
	add	$2, $2, $0
# was:	add	_lookup2__88_, _lookup2__88_, 0
	lw	$3, 0($2)
# was:	lw	_assign__86_, 0(_lookup2__88_)
# 	ori	_44_t,_assign__86_,0
# 	ori	0,_assign__86_,0
	ori	$2, $0, 1
# was:	ori	_Lval__90_, 0, 1
	ori	$4, $0, _43_b
# was:	ori	_lookup1__91_, 0, _43_b
	add	$4, $4, $2
# was:	add	_lookup2__92_, _lookup1__91_, _Lval__90_
	add	$4, $4, $2
# was:	add	_lookup2__92_, _lookup2__92_, _Lval__90_
	add	$4, $4, $2
# was:	add	_lookup2__92_, _lookup2__92_, _Lval__90_
	add	$4, $4, $2
# was:	add	_lookup2__92_, _lookup2__92_, _Lval__90_
	lw	$2, 0($4)
# was:	lw	_assign__89_, 0(_lookup2__92_)
	ori	$4, $0, _43_b
# was:	ori	_lookup1__93_, 0, _43_b
	add	$4, $4, $0
# was:	add	_lookup2__94_, _lookup1__93_, 0
	add	$4, $4, $0
# was:	add	_lookup2__94_, _lookup2__94_, 0
	add	$4, $4, $0
# was:	add	_lookup2__94_, _lookup2__94_, 0
	add	$4, $4, $0
# was:	add	_lookup2__94_, _lookup2__94_, 0
	sw	$2, 0($4)
# was:	sw	_assign__89_, 0(_lookup2__94_)
	ori	$2, $0, 1
# was:	ori	_Lval__96_, 0, 1
# 	ori	_assign__95_,_44_t,0
	ori	$4, $0, _43_b
# was:	ori	_lookup1__97_, 0, _43_b
	add	$4, $4, $2
# was:	add	_lookup2__98_, _lookup1__97_, _Lval__96_
	add	$4, $4, $2
# was:	add	_lookup2__98_, _lookup2__98_, _Lval__96_
	add	$4, $4, $2
# was:	add	_lookup2__98_, _lookup2__98_, _Lval__96_
	add	$4, $4, $2
# was:	add	_lookup2__98_, _lookup2__98_, _Lval__96_
	sw	$3, 0($4)
# was:	sw	_assign__95_, 0(_lookup2__98_)
_endif__78_:
	ori	$2, $0, _43_b
# was:	ori	_lookup1__102_, 0, _43_b
	add	$2, $2, $0
# was:	add	_lookup2__103_, _lookup1__102_, 0
	add	$2, $2, $0
# was:	add	_lookup2__103_, _lookup2__103_, 0
	add	$2, $2, $0
# was:	add	_lookup2__103_, _lookup2__103_, 0
	add	$2, $2, $0
# was:	add	_lookup2__103_, _lookup2__103_, 0
	lw	$3, 0($2)
# was:	lw	_plus1__100_, 0(_lookup2__103_)
	ori	$2, $0, 1
# was:	ori	_plus2__101_, 0, 1
	add	$2, $3, $2
# was:	add	_assign__99_, _plus1__100_, _plus2__101_
	ori	$3, $0, _43_b
# was:	ori	_lookup1__104_, 0, _43_b
	add	$3, $3, $0
# was:	add	_lookup2__105_, _lookup1__104_, 0
	add	$3, $3, $0
# was:	add	_lookup2__105_, _lookup2__105_, 0
	add	$3, $3, $0
# was:	add	_lookup2__105_, _lookup2__105_, 0
	add	$3, $3, $0
# was:	add	_lookup2__105_, _lookup2__105_, 0
	sw	$2, 0($3)
# was:	sw	_assign__99_, 0(_lookup2__105_)
	j	_whilestart__69_
_endwhile__70_:
	ori	$2, $0, _42_c
# was:	ori	_lookup1__109_, 0, _42_c
	add	$2, $2, $0
# was:	add	_lookup2__110_, _lookup1__109_, 0
	add	$2, $2, $0
# was:	add	_lookup2__110_, _lookup2__110_, 0
	add	$2, $2, $0
# was:	add	_lookup2__110_, _lookup2__110_, 0
	add	$2, $2, $0
# was:	add	_lookup2__110_, _lookup2__110_, 0
	lw	$3, 0($2)
# was:	lw	_minus1__107_, 0(_lookup2__110_)
	ori	$2, $0, 1
# was:	ori	_minus2__108_, 0, 1
	sub	$2, $3, $2
# was:	sub	_assign__106_, _minus1__107_, _minus2__108_
	ori	$3, $0, _42_c
# was:	ori	_lookup1__111_, 0, _42_c
	add	$3, $3, $0
# was:	add	_lookup2__112_, _lookup1__111_, 0
	add	$3, $3, $0
# was:	add	_lookup2__112_, _lookup2__112_, 0
	add	$3, $3, $0
# was:	add	_lookup2__112_, _lookup2__112_, 0
	add	$3, $3, $0
# was:	add	_lookup2__112_, _lookup2__112_, 0
	sw	$2, 0($3)
# was:	sw	_assign__106_, 0(_lookup2__112_)
	j	_whilestart__55_
_endwhile__56_:
	ori	$2, $0, 0
# was:	ori	_return__113_, 0, 0
# 	ori	2,_return__113_,0
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
