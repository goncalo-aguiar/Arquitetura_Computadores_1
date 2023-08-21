	.data
const:	.double 9
	.text
f2c:	
	li $t0,32
	mtc1 $t0,$f8
	cvt.d.w $f8,$f8
	sub.d $f8,$f12,$f8
	
	
	
	
	
	
	li $t0,5
	mtc1 $t0,$f4
	cvt.d.w $f4,$f4  #f4- 5
	l.d $f6,const	 #f6-9
	
	
	div.d $f10, $f4,$f6
	mul.d $f0,$f10,$f8
	
	
	
	


	jr $ra
	
	.data
	.text
	.globl main
	
main:
	addiu $sp,$sp,-4
	sw $ra,0($sp)
	
	li $v0,7
	syscall
	mov.d $f12,$f0
	jal f2c
	mov.d $f12,$f0
	li $v0,3
	syscall
	
	
	
	lw $ra,0($sp)
	addiu $sp,$sp,4
	jr $ra