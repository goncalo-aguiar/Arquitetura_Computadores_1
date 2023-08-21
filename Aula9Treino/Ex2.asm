	.data
	.text
	
max:	
	move $t0,$a0					# t0 -> p
	move $t1,$a1					# t1->n
	
	sll $t2,$t1,3
	subu $t2,$t2,8
	addu $t3,$t2,$t0
	
	l.d $f4,0($t0)
	addi $t0,$t0,8
for_max:
	bgt $t0,$t3,end_for_max
	
	l.d $f6,0($t0)
if_max:	c.le.d $f6,$f4
	bc1t endif_max
	mov.d $f4,$f6


endif_max:
	
	addiu $t0,$t0,8
	j for_max
end_for_max:	

	mov.d $f0,$f4
	jr $ra
	
	
	
	
	
	
	.data
	.text
		 # t1->i
		 # f4->sum




average:
	move $t1,$a1
	move $t0,$a0
	mtc1 $0,$f4
for_average:
	blez $t1 end_for_average
	
	sll $t2,$t1,3
	
	addu $t2,$t0,$t2
	subu $t2,$t2,8
	l.d $f6,0($t2)
	add.d $f4,$f4,$f6
	
	addi $t1,$t1,-1
	j for_average
end_for_average:
	
	mtc1 $a1,$f8
	cvt.d.w $f8,$f8
	div.d $f0,$f4,$f8

	jr $ra
	
	
	.data
	.eqv SIZE,3
	.align 2
	
a:	.space 80
	.text
	.globl main
	
main:

	addiu $sp,$sp,-4
	sw $ra,0($sp)
	li $t0,0
	la $t1,a
for_main:
	bge $t0,SIZE,end_for_main
	
	li $v0,5
	syscall
	mtc1 $v0,$f4
	cvt.d.w $f4,$f4
	sll $t2,$t0,3
	add $t2,$t1,$t2
	
	s.d $f4 ,0($t2)
	addi $t0,$t0,1
	j for_main
end_for_main:
	
	la $a0,a
	li $a1,SIZE
	jal average
	mov.d $f12,$f0 
	li $v0,3
	syscall
	
	la $a0,a
	li $a1,SIZE
	jal max
	mov.d $f12,$f0 
	li $v0,3
	syscall
	
	li $v0,0
	lw $ra,0($sp)
	addiu $sp,$sp,4
	jr $ra
	                                                              