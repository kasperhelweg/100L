	.text	0x00400000
	.globl	main
	la	$28, _heap_
	jal	main
	ori	$2, $0, 10
	syscall
# 
main:
	addi	$29, $29, -12
	sw	$31, 8($29)
	sw	$17, 4($29)
	sw	$16, 0($29)
	ori	$2, $0, 100
# was:	ori	_exps__5_, 0, 100
# 	ori	2,_exps__5_,0
	jal	getstring
# was:	jal	getstring, 2
# 	ori	_assign__4_,2,0
	ori	$3, $0, _1_w
# was:	ori	_lookup1__6_, 0, _1_w
	add	$3, $3, $0
# was:	add	_lookup2__7_, _lookup1__6_, 0
	sb	$2, 0($3)
# was:	sb	_assign__4_, 0(_lookup2__7_)
	ori	$16, $0, 0
# was:	ori	_assign__8_, 0, 0
# 	ori	_3_state,_assign__8_,0
# 	ori	0,_assign__8_,0
_whilestart__10_:
	ori	$2, $0, _1_w
# was:	ori	_lookup1__17_, 0, _1_w
	add	$2, $2, $0
# was:	add	_lookup2__18_, _lookup1__17_, 0
	lb	$3, 0($2)
# was:	lb	_assign__16_, 0(_lookup2__18_)
# 	ori	_2_c,_assign__16_,0
	ori	$4, $3, 0
# was:	ori	_equal1__14_, _assign__16_, 0
	ori	$2, $0, 48
# was:	ori	_equal2__15_, 0, 48
	beq	$4, $2, yes
# was:	beq	_equal1__14_, _equal2__15_, yes
	ori	$4, $0, 0
# was:	ori	_plus1__12_, 0, 0
	j	skip
yes:
	ori	$4, $0, 1
# was:	ori	_plus1__12_, 0, 1
skip:
# 	ori	_equal1__19_,_2_c,0
	ori	$2, $0, 49
# was:	ori	_equal2__20_, 0, 49
	beq	$3, $2, yes
# was:	beq	_equal1__19_, _equal2__20_, yes
	ori	$2, $0, 0
# was:	ori	_plus2__13_, 0, 0
	j	skip
yes:
	ori	$2, $0, 1
# was:	ori	_plus2__13_, 0, 1
skip:
	add	$2, $4, $2
# was:	add	_while__9_, _plus1__12_, _plus2__13_
	beq	$2, $0, _endwhile__11_
# was:	beq	_while__9_, 0, _endwhile__11_
# 	ori	_equal1__24_,_3_state,0
	ori	$2, $0, 0
# was:	ori	_equal2__25_, 0, 0
	beq	$16, $2, yes
# was:	beq	_equal1__24_, _equal2__25_, yes
	ori	$2, $0, 0
# was:	ori	_if__21_, 0, 0
	j	skip
yes:
	ori	$2, $0, 1
# was:	ori	_if__21_, 0, 1
skip:
	beq	$2, $0, _else__22_
# was:	beq	_if__21_, 0, _else__22_
# 	ori	_equal1__28_,_2_c,0
	ori	$2, $0, 49
# was:	ori	_equal2__29_, 0, 49
	beq	$3, $2, yes
# was:	beq	_equal1__28_, _equal2__29_, yes
	ori	$2, $0, 0
# was:	ori	_if__26_, 0, 0
	j	skip
yes:
	ori	$2, $0, 1
# was:	ori	_if__26_, 0, 1
skip:
	beq	$2, $0, _endif__27_
# was:	beq	_if__26_, 0, _endif__27_
	ori	$16, $0, 1
# was:	ori	_assign__30_, 0, 1
# 	ori	_3_state,_assign__30_,0
# 	ori	0,_assign__30_,0
_endif__27_:
	j	_endif__23_
_else__22_:
# 	ori	_equal1__34_,_3_state,0
	ori	$2, $0, 1
# was:	ori	_equal2__35_, 0, 1
	beq	$16, $2, yes
# was:	beq	_equal1__34_, _equal2__35_, yes
	ori	$2, $0, 0
# was:	ori	_if__31_, 0, 0
	j	skip
yes:
	ori	$2, $0, 1
# was:	ori	_if__31_, 0, 1
skip:
	beq	$2, $0, _else__32_
# was:	beq	_if__31_, 0, _else__32_
# 	ori	_equal1__39_,_2_c,0
	ori	$2, $0, 48
# was:	ori	_equal2__40_, 0, 48
	beq	$3, $2, yes
# was:	beq	_equal1__39_, _equal2__40_, yes
	ori	$2, $0, 0
# was:	ori	_if__36_, 0, 0
	j	skip
yes:
	ori	$2, $0, 1
# was:	ori	_if__36_, 0, 1
skip:
	beq	$2, $0, _else__37_
# was:	beq	_if__36_, 0, _else__37_
	ori	$16, $0, 2
# was:	ori	_assign__41_, 0, 2
# 	ori	_3_state,_assign__41_,0
# 	ori	0,_assign__41_,0
	j	_endif__38_
_else__37_:
	ori	$16, $0, 0
# was:	ori	_assign__42_, 0, 0
# 	ori	_3_state,_assign__42_,0
# 	ori	0,_assign__42_,0
_endif__38_:
	j	_endif__33_
_else__32_:
# 	ori	_equal1__46_,_2_c,0
	ori	$2, $0, 48
# was:	ori	_equal2__47_, 0, 48
	beq	$3, $2, yes
# was:	beq	_equal1__46_, _equal2__47_, yes
	ori	$2, $0, 0
# was:	ori	_if__43_, 0, 0
	j	skip
yes:
	ori	$2, $0, 1
# was:	ori	_if__43_, 0, 1
skip:
	beq	$2, $0, _else__44_
# was:	beq	_if__43_, 0, _else__44_
	ori	$16, $0, 1
# was:	ori	_assign__48_, 0, 1
# 	ori	_3_state,_assign__48_,0
# 	ori	0,_assign__48_,0
	j	_endif__45_
_else__44_:
	ori	$16, $0, 2
# was:	ori	_assign__49_, 0, 2
# 	ori	_3_state,_assign__49_,0
# 	ori	0,_assign__49_,0
_endif__45_:
_endif__33_:
_endif__23_:
	ori	$2, $0, _1_w
# was:	ori	_lookup1__53_, 0, _1_w
	add	$2, $2, $0
# was:	add	_lookup2__54_, _lookup1__53_, 0
	lb	$2, 0($2)
# was:	lb	_plus1__51_, 0(_lookup2__54_)
	ori	$3, $0, 1
# was:	ori	_plus2__52_, 0, 1
	add	$2, $2, $3
# was:	add	_assign__50_, _plus1__51_, _plus2__52_
	ori	$3, $0, _1_w
# was:	ori	_lookup1__55_, 0, _1_w
	add	$3, $3, $0
# was:	add	_lookup2__56_, _lookup1__55_, 0
	sb	$2, 0($3)
# was:	sb	_assign__50_, 0(_lookup2__56_)
	j	_whilestart__10_
_endwhile__11_:
	ori	$2, $0, 3
# was:	ori	2, 0, 3
	jal	balloc
# was:	jal	balloc, 2
	ori	$4, $2, 0
# was:	ori	_exps__57_, 2, 0
	addi	$3, $0, 101
# was:	addi	_string__58_, 0, 101
	sb	$3, 0($2)
# was:	sb	_string__58_, 0(2)
	addi	$2, $2, 3
# was:	addi	2, 2, 3
	addi	$3, $0, 109
# was:	addi	_string__58_, 0, 109
	sb	$3, 0($2)
# was:	sb	_string__58_, 0(2)
	addi	$2, $2, 3
# was:	addi	2, 2, 3
	addi	$3, $0, 97
# was:	addi	_string__58_, 0, 97
	sb	$3, 0($2)
# was:	sb	_string__58_, 0(2)
	addi	$2, $2, 3
# was:	addi	2, 2, 3
	ori	$2, $4, 0
# was:	ori	2, _exps__57_, 0
	jal	putstring
# was:	jal	putstring, 2
# 	ori	0,2,0
	ori	$2, $16, 0
# was:	ori	_exps__59_, _3_state, 0
# 	ori	2,_exps__59_,0
	jal	putint
# was:	jal	putint, 2
# 	ori	0,2,0
	ori	$2, $0, 0
# was:	ori	_return__60_, 0, 0
# 	ori	2,_return__60_,0
	j	main_exit
main_exit:
	lw	$17, 4($29)
	lw	$16, 0($29)
	lw	$31, 8($29)
	addi	$29, $29, 12
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
