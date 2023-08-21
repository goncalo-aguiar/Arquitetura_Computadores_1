	.data
num:	.float 2.59375
	.text
	.globl main
	
main:	
	mtc1 $0,$f10
do:
	li $v0,5
	syscall
	move $t0,$v0
	mtc1 $t0,$f4
	cvt.s.w $f4,$f4
	l.s $f6,num
	mul.s $f8,$f4,$f6
	li $v0,2
	mov.s $f12,$f8
	syscall
while:	c.eq.s $f8,$f10
	bc1f do
	
	jr $ra