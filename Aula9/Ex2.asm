	.data
c1:	.double 5.0
c2:	.double 9.0
c3:	.double 32.0
 
	.text
	
	
f2c:	

	la $t0,c3          #c3= 32
	l.d $f4,0($t0)
	sub.d $f12,$f12, $f4
	
	la $t0,c1
	l.d $f4,0($t0)          #
	mul.d $f0, $f12,$f4
	
	la $t0,c2
	l.d $f4,0($t0)
	
	div.d $f0,$f0,$f4

	
	jr $ra

	
	.data
	.text
	.globl main	

main:	addiu $sp,$sp,-4
	sw $ra,0($sp)
	
	li $v0,5
	syscall
	mtc1 $v0,$f12
	cvt.d.w $f12,$f12
	jal f2c
	mov.d $f12,$f0
	li $v0,3
	syscall
	
	lw $ra,0($sp)
	addiu $sp,$sp,4
	jr $ra