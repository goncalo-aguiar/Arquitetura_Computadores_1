	#f4-val
	#aux-$f6
	#f8-xn
	#i -t0
	.data
const:	.double 0.5
const2:	.double 0.0
	.text
	
sqrt:
	mov.d $f4,$f12  
	
	li $t0,1
	mtc1 $t0,$f6
	mtc1 $t0,$f8
	cvt.d.w $f6,$f6  #double aux, xn = 1.0
	cvt.d.w $f8,$f8  
	
	li $t0,0 #int i = 0; 
	mtc1 $t0,$f10
	
if_sqrt:
	c.le.d $f4,$f10
	bc1t else_sqrt
do_sqrt:
	mov.d $f6,$f8
	div.d $f16,$f4,$f8
	add.d $f8,$f16,$f8
	l.d $f18,const
	mul.d $f8,$f18,$f8

	addi $t0,$t0,1
while_sqrt:
	blt $t0,25,do_sqrt
	c.eq.d $f6,$f8
	bc1f do_sqrt
	
	
	


	j endif_sqrt
else_sqrt:
	l.d $f8,const2



endif_sqrt:

	mov.d $f0,$f8
	
	jr $ra
	
	
	.data
const22:.double 16.0
	.text
	.globl main
	
main:
	addiu $sp,$sp,-4
	sw $ra,0($sp)
	l.d $f12,const22
	jal sqrt
	mov.d $f12,$f0
	li $v0 ,3
	syscall
	lw $ra,0($sp)
	addiu $sp,$sp,4
	jr $ra
	


	