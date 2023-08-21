	.data
	.text
	
max:
	move $t0,$a0  #t0-p
	move $t1,$a1  #t1-n
	
	move $t2,$t0
	
	sub $t3,$t1,1
	sll $t3,$t3,3
	add $t2,$t2,$t3  #t2-u
	
	l.d $f4,0($t0)
	addi $t0,$t0,8
	
for_max:
	bgt $t0,$t2,endfor_max
if_max:
	l.d $f6,0($t0)
	c.le.d $f6,$f4
	bc1t endif_max
	mov.d $f4,$f6
	
	

endif_max:

	
	addi $t0,$t0,8
	j for_max
endfor_max:
	
	mov.d $f0,$f4
	
	
	



	jr $ra
	
	
	.data
	.align 3
a:	.space 80
	.eqv SIZE,10
	.text
	.globl main
	
main:
	addiu $sp,$sp,-4
	sw $ra,0($sp)
	li $t0,0
	la $t1,a
for_main:
	bge $t0,SIZE,endfor_main
	sll $t2,$t0,3
	add $t2,$t1,$t2
	li $v0,5
	syscall
	move $t3,$v0
	mtc1 $t3,$f4
	cvt.d.w $f4,$f4
	s.d $f4,0($t2)
	
	
	
	
	addi $t0,$t0,1
	j for_main
endfor_main:
	
	move $a0,$t1
	li $a1,SIZE
	jal average
	li $v0,3
	mov.d $f12,$f0
	syscall
	
	la $a0,a
	li $a1,SIZE
	jal max
	li $v0,3
	mov.d $f12,$f0
	syscall
	
	
	

	lw $ra,0($sp)
	addiu $sp,$sp,4
	jr $ra
	
	.data
const:	.double 0.0
	.text
	
average:
	move $t0,$a0	#t0-array
	move $t1,$a1	#t1-n
	
	move $t2,$t1 #int i = n; 
	l.d $f4,const #double sum = 0.0; 
	
for_average:
	ble $t2,0,endfor_average
	sll $t3,$t2,3
	sub $t3,$t3,8
	add $t3,$t0,$t3
	l.d $f6,0($t3)
	add.d $f4,$f4,$f6
	
	subu $t2,$t2,1
	j for_average
endfor_average:
	
	mtc1 $t1,$f8
	cvt.d.w $f8,$f8
	div.d $f0,$f4,$f8
	jr $ra