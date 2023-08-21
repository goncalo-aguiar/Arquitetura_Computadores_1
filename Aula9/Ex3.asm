	.data
	.text
average:
	
	move $t0,$a1
	
	li $t5,0
	mtc1 $t5,$f4
	cvt.d.w $f4,$f4
	move $t1,$a0
for:
	ble $t0,0,endfor
	sll $t2,$t0,3
	sub $t2,$t2,8
	add $t2,$t1,$t2
	l.d $f6,0($t2)
	add.d $f4,$f4,$f6
	subu $t0,$t0,1
	j for
endfor:
	mtc1 $a1,$f8
	cvt.d.w $f8,$f8
	div.d $f0,$f4,$f8
	jr $ra
	
	.data
	.eqv SIZE,10
	.align 2
a:	.space 80
	.text
	.globl main
main:
	addiu $sp,$sp,-12
	sw $ra,0($sp)
	sw $s0,4($sp)
	sw $s1,8($sp)
	
	li $s0,0
	la $s1,a
for2:	bge $s0,SIZE,endfor2
	sll $t0,$s0,3
	li $v0,5
	syscall
	mtc1 $v0,$f4
	cvt.d.w $f4,$f4
	add $t1,$s1,$t0
	s.d $f4, 0($t1)
	addi $s0,$s0,1
	j for2
endfor2:	
	la $a0,a
	li $a1,SIZE
	jal average
	li $v0,3
	mov.d $f12,$f0
	syscall
	li $v0,0

	lw $ra ,0($sp)
	lw $s0,4($sp)
	sw $s1,8($sp)
	addiu $sp,$sp,8
	jr $ra
