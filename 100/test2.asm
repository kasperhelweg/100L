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
	ori	$2, $0, 2
# was:	ori	_assign__5_, 0, 2
# 	ori	_2_n,_assign__5_,0
# 	ori	0,_assign__5_,0
# 	ori	_exps__7_,_2_n,0
# 	ori	2,_exps__7_,0
	jal	walloc
# was:	jal	walloc, 2
# 	ori	_assign__6_,2,0
	ori	$3, $0, _1_i
# was:	ori	_lookup1__8_, 0, _1_i
	add	$3, $3, $0
# was:	add	_lookup2__9_, _lookup1__8_, 0
	add	$3, $3, $0
# was:	add	_lookup2__9_, _lookup2__9_, 0
	add	$3, $3, $0
# was:	add	_lookup2__9_, _lookup2__9_, 0
	add	$3, $3, $0
# was:	add	_lookup2__9_, _lookup2__9_, 0
	sw	$2, 0($3)
# was:	sw	_assign__6_, 0(_lookup2__9_)
	ori	$3, $0, 10
# was:	ori	_assign__10_, 0, 10
# 	ori	_4_a,_assign__10_,0
# 	ori	0,_assign__10_,0
# 	ori	_equal1__14_,_4_a,0
	ori	$2, $0, 10
# was:	ori	_equal2__15_, 0, 10
	beq	$3, $2, yes
# was:	beq	_equal1__14_, _equal2__15_, yes
	ori	$2, $0, 0
# was:	ori	_if__11_, 0, 0
	j	skip
yes:
	ori	$2, $0, 1
# was:	ori	_if__11_, 0, 1
skip:
	beq	$2, $0, _else__12_
# was:	beq	_if__11_, 0, _else__12_
	ori	$16, $0, 60
# was:	ori	_assign__16_, 0, 60
# 	ori	_3_b,_assign__16_,0
# 	ori	0,_assign__16_,0
	ori	$3, $0, 100
# was:	ori	_assign__17_, 0, 100
# 	ori	_4_a,_assign__17_,0
# 	ori	0,_assign__17_,0
	j	_endif__13_
_else__12_:
	ori	$3, $0, 20
# was:	ori	_assign__18_, 0, 20
# 	ori	_4_a,_assign__18_,0
# 	ori	0,_assign__18_,0
_endif__13_:
# 	ori	_plus1__20_,_4_a,0
# 	ori	_plus2__21_,_3_b,0
	add	$2, $3, $16
# was:	add	_return__19_, _plus1__20_, _plus2__21_
# 	ori	2,_return__19_,0
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
