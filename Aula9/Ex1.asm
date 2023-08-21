	.data
const:	.float 2.59375
	.text
	.globl main
	
main:

do:
	la $t1,const
	l.s $f4,0($t1)
	
	
	li $v0,5
	syscall
	move $t0,$v0
	mtc1 $t0,$f6
	cvt.s.w $f6,$f6
	
	mul.s $f12 , $f4,$f6
	
	li $v0,2
	syscall
	
	mtc1 $0,$f8
	c.eq.s $f12,$f8
	bc1f do

	jr $ra