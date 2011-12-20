	.text	0x00400000
	.globl	main
	la	$28, _heap_
	jal	main
	ori	$2, $0, 10
	syscall
# 
main:
	addi	$29, $29, -8
	sw	$31, 4($29)
	sw	$16, 0($29)
# 	ori	_plus1__10_,_8_a,0
# 	ori	_plus2__11_,_7_b,0
	add	$3, $3, $4
# was:	add	_assign__9_, _plus1__10_, _plus2__11_
# 	ori	_8_a,_assign__9_,0
# 	ori	0,_assign__9_,0
# 	ori	_plus1__13_,_8_a,0
# 	ori	_plus2__14_,_4_r,0
	add	$2, $3, $2
# was:	add	_assign__12_, _plus1__13_, _plus2__14_
# 	ori	_4_r,_assign__12_,0
# 	ori	0,_assign__12_,0
	ori	$2, $0, 0
# was:	ori	_return__15_, 0, 0
# 	ori	2,_return__15_,0
	j	main_exit
main_exit:
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
