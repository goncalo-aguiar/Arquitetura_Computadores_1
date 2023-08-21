	.data
const:	.float 2.59375
	.text
	.globl main
	
main:
	li $t0,0
	mtc1 $t0,$f10
do_main:
	li $v0,5
	syscall
	move $t0,$v0       #t0- val
	
	l.s $f4, const
	
	mtc1 $t0,$f6
	cvt.s.w $f6,$f6
	
	mul.s $f8,$f4,$f6
	
	li $v0,2
	mov.s $f12,$f8
	syscall
	
w_main:c.eq.s $f8,$f10
	bc1f do_main
	
	
	



	jr $ra