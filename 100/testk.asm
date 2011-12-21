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
	ori	$2, $0, 4
# was:	ori	2, 0, 4
	jal	balloc
# was:	jal	balloc, 2
	ori	$3, $2, 0
# was:	ori	_assign__3_, 2, 0
	addi	$4, $0, 97
# was:	addi	_string__4_, 0, 97
	sb	$4, 0($2)
# was:	sb	_string__4_, 0(2)
	addi	$2, $2, 1
# was:	addi	2, 2, 1
	addi	$4, $0, 115
# was:	addi	_string__4_, 0, 115
	sb	$4, 0($2)
# was:	sb	_string__4_, 0(2)
	addi	$2, $2, 1
# was:	addi	2, 2, 1
	addi	$4, $0, 112
# was:	addi	_string__4_, 0, 112
	sb	$4, 0($2)
# was:	sb	_string__4_, 0(2)
	addi	$2, $2, 1
# was:	addi	2, 2, 1
	addi	$4, $0, 0
# was:	addi	_string__4_, 0, 0
	sb	$4, 0($2)
# was:	sb	_string__4_, 0(2)
	ori	$2, $0, 2
# was:	ori	_lookup1__5_, 0, 2
	add	$2, $2, $0
# was:	add	_lookup2__6_, _lookup1__5_, 0
	sb	$3, 0($2)
# was:	sb	_assign__3_, 0(_lookup2__6_)
	ori	$2, $0, 4
# was:	ori	2, 0, 4
	jal	balloc
# was:	jal	balloc, 2
	ori	$3, $2, 0
# was:	ori	_exps__7_, 2, 0
	addi	$4, $0, 105
# was:	addi	_string__8_, 0, 105
	sb	$4, 0($2)
# was:	sb	_string__8_, 0(2)
	addi	$2, $2, 1
# was:	addi	2, 2, 1
	addi	$4, $0, 101
# was:	addi	_string__8_, 0, 101
	sb	$4, 0($2)
# was:	sb	_string__8_, 0(2)
	addi	$2, $2, 1
# was:	addi	2, 2, 1
	addi	$4, $0, 108
# was:	addi	_string__8_, 0, 108
	sb	$4, 0($2)
# was:	sb	_string__8_, 0(2)
	addi	$2, $2, 1
# was:	addi	2, 2, 1
	addi	$4, $0, 0
# was:	addi	_string__8_, 0, 0
	sb	$4, 0($2)
# was:	sb	_string__8_, 0(2)
	ori	$2, $3, 0
# was:	ori	2, _exps__7_, 0
	jal	putstring
# was:	jal	putstring, 2
# 	ori	0,2,0
	ori	$2, $0, 0
# was:	ori	_return__9_, 0, 0
# 	ori	2,_return__9_,0
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
