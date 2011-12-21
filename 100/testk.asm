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
	ori	$2, $0, 12
# was:	ori	_assign__3_, 0, 12
	ori	$3, $0, _2_c
# was:	ori	_lookup1__4_, 0, _2_c
	add	$3, $3, $0
# was:	add	_lookup2__5_, _lookup1__4_, 0
	add	$3, $3, $0
# was:	add	_lookup2__5_, _lookup2__5_, 0
	add	$3, $3, $0
# was:	add	_lookup2__5_, _lookup2__5_, 0
	add	$3, $3, $0
# was:	add	_lookup2__5_, _lookup2__5_, 0
	sw	$2, 0($3)
# was:	sw	_assign__3_, 0(_lookup2__5_)
	ori	$16, $0, 2
# was:	ori	_assign__6_, 0, 2
# 	ori	_1_i,_assign__6_,0
# 	ori	0,_assign__6_,0
# 	ori	_plus1__8_,_1_i,0
	ori	$2, $0, 2
# was:	ori	_plus2__9_, 0, 2
	add	$16, $16, $2
# was:	add	_assign__7_, _plus1__8_, _plus2__9_
# 	ori	_1_i,_assign__7_,0
# 	ori	0,_assign__7_,0
	ori	$2, $16, 0
# was:	ori	_exps__10_, _1_i, 0
# 	ori	2,_exps__10_,0
	jal	putint
# was:	jal	putint, 2
# 	ori	0,2,0
	ori	$2, $16, 0
# was:	ori	_return__11_, _1_i, 0
# 	ori	2,_return__11_,0
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
