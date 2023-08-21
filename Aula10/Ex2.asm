	.data
numero:	.double 0.5
	.text

sqrt:
	
	
	mov.d $f4,$f12                     # double val-> f4
	li $t0,1				
	mtc1 $t0,$f6
	mtc1 $t0,$f8
	cvt.d.w $f6,$f6				#double aux-> f6
	cvt.d.w $f8, $f8			#double xn -> f8
	li $t0,0				#i -> t0
	li $t1,0
	mtc1 $t1,$f10
if:	
	c.le.d $f4, $f10
	bc1t else
do:
	mov.d $f6,$f8
	div.d $f16,$f4,$f8
	add.d $f8,$f16,$f8
	l.d $f16,numero
	mul.d $f8,$f8, $f16
	addi $t0,$t0,1
while:	blt $t0,25,do
	
	c.eq.d $f6,$f8
	bc1f do
	
	
	j endif
else:

	mov.d $f8,$f10
endif:	
	
	mov.d $f0,$f8
	
	jr $ra
	
	
	
	.data
	.text
	.globl main
main:
	addiu $sp,$sp,-4
	sw $ra, 0($sp)
	
	li $v0,7
	syscall
	mov.d $f12,$f0
	jal sqrt
	
	li $v0,3
	mov.d $f12,$f0
	syscall
	lw $ra,0($sp)
	addiu $sp,$sp,4
	jr $ra