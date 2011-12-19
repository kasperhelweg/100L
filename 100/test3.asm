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
	ori	$2, $0, 2
# was:	ori	_exps__1_, 0, 2
# 	ori	2,_exps__1_,0
	jal	hell
# was:	jal	hell, 2
# 	ori	0,2,0
main_exit:
	lw	$16, 0($29)
	lw	$31, 4($29)
	addi	$29, $29, 8
	jr	$31
# 
hell:
	addi	$29, $29, -8
	sw	$31, 4($29)
	sw	$16, 0($29)
# 	ori	a_2_,2,0
# 	ori	_return__3_,a_2_,0
# 	ori	2,_return__3_,0
	j	hell_exit
hell_exit:
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
	.data	
	.align	2
_cr_:
	.asciiz	"\n"
	.align	2
_heap_:
	.space	100000
