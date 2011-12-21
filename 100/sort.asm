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
	ori	$2, $3, 0
# was:	ori	_minus1__46_, n_41_, 0
	ori	$3, $0, 1
# was:	ori	_minus2__47_, 0, 1
	sub	$2, $2, $3
# was:	sub	_assign__45_, _minus1__46_, _minus2__47_
# 	ori	_44_i,_assign__45_,0
# 	ori	0,_assign__45_,0
_whilestart__49_:
	ori	$3, $0, 0
# was:	ori	_less1__51_, 0, 0
# 	ori	_less2__52_,_44_i,0
	slt	$3, $3, $2
# was:	slt	_while__48_, _less1__51_, _less2__52_
	beq	$3, $0, _endwhile__50_
# was:	beq	_while__48_, 0, _endwhile__50_
	ori	$6, $0, 0
# was:	ori	_assign__53_, 0, 0
# 	ori	_43_j,_assign__53_,0
# 	ori	0,_assign__53_,0
_whilestart__55_:
# 	ori	_less1__57_,_43_j,0
# 	ori	_less2__58_,_44_i,0
	slt	$3, $6, $2
# was:	slt	_while__54_, _less1__57_, _less2__58_
	beq	$3, $0, _endwhile__56_
# was:	beq	_while__54_, 0, _endwhile__56_
# 	ori	_plus1__64_,_43_j,0
	ori	$3, $0, 1
# was:	ori	_plus2__65_, 0, 1
	add	$3, $6, $3
# was:	add	_Lval__63_, _plus1__64_, _plus2__65_

# was:	ori	_lookup1__66_, 0, a_40_
	add	$4, $4, $3
# was:	add	_lookup2__67_, _lookup1__66_, _Lval__63_
	add	$4, $4, $3
# was:	add	_lookup2__67_, _lookup2__67_, _Lval__63_
	add	$4, $4, $3
# was:	add	_lookup2__67_, _lookup2__67_, _Lval__63_
	add	$4, $4, $3
# was:	add	_lookup2__67_, _lookup2__67_, _Lval__63_
	lw	$3, 0($4)
# was:	lw	_less1__61_, 0(_lookup2__67_)
# 	ori	_Lval__68_,_43_j,0

# was:	ori	_lookup1__69_, 0, a_40_
	add	$4, $4, $6
# was:	add	_lookup2__70_, _lookup1__69_, _Lval__68_
	add	$4, $4, $6
# was:	add	_lookup2__70_, _lookup2__70_, _Lval__68_
	add	$4, $4, $6
# was:	add	_lookup2__70_, _lookup2__70_, _Lval__68_
	add	$4, $4, $6
# was:	add	_lookup2__70_, _lookup2__70_, _Lval__68_
	lw	$4, 0($4)
# was:	lw	_less2__62_, 0(_lookup2__70_)
	slt	$3, $3, $4
# was:	slt	_if__59_, _less1__61_, _less2__62_
	beq	$3, $0, _endif__60_
# was:	beq	_if__59_, 0, _endif__60_
# 	ori	_Lval__72_,_43_j,0

# was:	ori	_lookup1__73_, 0, a_40_
	add	$3, $3, $6
# was:	add	_lookup2__74_, _lookup1__73_, _Lval__72_
	add	$3, $3, $6
# was:	add	_lookup2__74_, _lookup2__74_, _Lval__72_
	add	$3, $3, $6
# was:	add	_lookup2__74_, _lookup2__74_, _Lval__72_
	add	$3, $3, $6
# was:	add	_lookup2__74_, _lookup2__74_, _Lval__72_
	lw	$3, 0($3)
# was:	lw	_assign__71_, 0(_lookup2__74_)
# 	ori	_42_t,_assign__71_,0
# 	ori	0,_assign__71_,0
# 	ori	_Lval__76_,_43_j,0
	ori	$5, $6, 0
# was:	ori	_plus1__78_, _43_j, 0
	ori	$4, $0, 1
# was:	ori	_plus2__79_, 0, 1
	add	$4, $5, $4
# was:	add	_Lval__77_, _plus1__78_, _plus2__79_

# was:	ori	_lookup1__80_, 0, a_40_
	add	$5, $5, $4
# was:	add	_lookup2__81_, _lookup1__80_, _Lval__77_
	add	$5, $5, $4
# was:	add	_lookup2__81_, _lookup2__81_, _Lval__77_
	add	$5, $5, $4
# was:	add	_lookup2__81_, _lookup2__81_, _Lval__77_
	add	$5, $5, $4
# was:	add	_lookup2__81_, _lookup2__81_, _Lval__77_
	lw	$4, 0($5)
# was:	lw	_assign__75_, 0(_lookup2__81_)

# was:	ori	_lookup1__82_, 0, a_40_
	add	$5, $5, $6
# was:	add	_lookup2__83_, _lookup1__82_, _Lval__76_
	add	$5, $5, $6
# was:	add	_lookup2__83_, _lookup2__83_, _Lval__76_
	add	$5, $5, $6
# was:	add	_lookup2__83_, _lookup2__83_, _Lval__76_
	add	$5, $5, $6
# was:	add	_lookup2__83_, _lookup2__83_, _Lval__76_
	sw	$4, 0($5)
# was:	sw	_assign__75_, 0(_lookup2__83_)
# 	ori	_plus1__86_,_43_j,0
	ori	$4, $0, 1
# was:	ori	_plus2__87_, 0, 1
	add	$4, $6, $4
# was:	add	_Lval__85_, _plus1__86_, _plus2__87_
# 	ori	_assign__84_,_42_t,0

# was:	ori	_lookup1__88_, 0, a_40_
	add	$5, $5, $4
# was:	add	_lookup2__89_, _lookup1__88_, _Lval__85_
	add	$5, $5, $4
# was:	add	_lookup2__89_, _lookup2__89_, _Lval__85_
	add	$5, $5, $4
# was:	add	_lookup2__89_, _lookup2__89_, _Lval__85_
	add	$5, $5, $4
# was:	add	_lookup2__89_, _lookup2__89_, _Lval__85_
	sw	$3, 0($5)
# was:	sw	_assign__84_, 0(_lookup2__89_)
_endif__60_:
# 	ori	_plus1__91_,_43_j,0
	ori	$3, $0, 1
# was:	ori	_plus2__92_, 0, 1
	add	$6, $6, $3
# was:	add	_assign__90_, _plus1__91_, _plus2__92_
# 	ori	_43_j,_assign__90_,0
# 	ori	0,_assign__90_,0
	j	_whilestart__55_
_endwhile__56_:
# 	ori	_minus1__94_,_44_i,0
	ori	$3, $0, 1
# was:	ori	_minus2__95_, 0, 1
	sub	$2, $2, $3
# was:	sub	_assign__93_, _minus1__94_, _minus2__95_
# 	ori	_44_i,_assign__93_,0
# 	ori	0,_assign__93_,0
	j	_whilestart__49_
_endwhile__50_:
	ori	$2, $0, 0
# was:	ori	_return__96_, 0, 0
# 	ori	2,_return__96_,0
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
