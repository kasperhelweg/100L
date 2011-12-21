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
	jal	getint
# was:	jal	getint, 
# 	ori	_assign__4_,2,0
	ori	$16, $2, 0
# was:	ori	_2_i, _assign__4_, 0
# 	ori	0,_assign__4_,0
	jal	f
# was:	jal	f, 
# 	ori	_assign__5_,2,0

# was:	ori	_lookup1__6_, 0, _3_s
	add	$3, $3, $0
# was:	add	_lookup2__7_, _lookup1__6_, 0
	sb	$2, 0($3)
# was:	sb	_assign__5_, 0(_lookup2__7_)
# 	ori	_Lval__10_,_2_i,0

# was:	ori	_lookup1__11_, 0, _3_s
	add	$2, $2, $16
# was:	add	_lookup2__12_, _lookup1__11_, _Lval__10_
	lb	$2, 0($2)
# was:	lb	_exps__9_, 0(_lookup2__12_)
# 	ori	2,_exps__9_,0
	jal	putint
# was:	jal	putint, 2
# 	ori	_return__8_,2,0
# 	ori	2,_return__8_,0
	j	main_exit
main_exit:
	lw	$17, 4($29)
	lw	$16, 0($29)
	lw	$31, 8($29)
	addi	$29, $29, 12
	jr	$31
# 
f:
	addi	$29, $29, -8
	sw	$31, 4($29)
	sw	$16, 0($29)
	ori	$2, $0, 3
# was:	ori	2, 0, 3
	jal	balloc
# was:	jal	balloc, 2
	ori	$4, $2, 0
# was:	ori	_return__13_, 2, 0
	addi	$3, $0, 98
# was:	addi	_string__14_, 0, 98
	sb	$3, 0($2)
# was:	sb	_string__14_, 0(2)
	addi	$2, $2, 3
# was:	addi	2, 2, 3
	addi	$3, $0, 114
# was:	addi	_string__14_, 0, 114
	sb	$3, 0($2)
# was:	sb	_string__14_, 0(2)
	addi	$2, $2, 3
# was:	addi	2, 2, 3
	addi	$3, $0, 97
# was:	addi	_string__14_, 0, 97
	sb	$3, 0($2)
# was:	sb	_string__14_, 0(2)
	addi	$2, $2, 3
# was:	addi	2, 2, 3
	ori	$2, $4, 0
# was:	ori	2, _return__13_, 0
	j	f_exit
f_exit:
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
