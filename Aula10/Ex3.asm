	.data
	.text

var:
	addiu $sp,$sp,-32
	sw $ra,0($sp)
	sw $s1,4($sp)
	s.d $f20,8($sp)
	s.d $f22,16($sp)
	sw $s2,24($sp)
	sw $s0,28($sp)
	
	move $s0,$a0		# array -> s0
	move $s1, $a1        # nval ->s1
	move $a0,$a0
	move $a1,$a1
	jal average
	mov.d $f20,$f0      # media-> f20
	
	li $s2,0           # i -> s2
	li $t0,0
	mtc1 $t0,$f22        # soma-> f22
	li $t1,0
for_var:
	bge $s2,$s1,end_for_var
	sll $t0,$s2,3
	add $t1,$s0,$t0
	l.d $f4, 0($t1)
	sub.d $f12,$f4,$f20
	li $a0,2
	jal xtoy
	
	add.d $f22,$f22,$f0
	addi $s2,$s2,1
	j for_var
end_for_var:
	
	mtc1 $s1,$f6
	cvt.d.w $f6,$f6
	div.d $f0,$f22,$f6
	
	
	lw $ra,0($sp)
	lw $s1,4($sp)
	l.d $f20,8($sp)
	l.d $f22,16($sp)
	lw $s2,24($sp)
	lw $s0,28($sp)
	
	addiu $sp,$sp,32
	jr $ra
	
	
	.data
	.text
	
stdev:
	addiu $sp,$sp,-4
	sw $ra,0($sp)
	
	mov.d $f12,$f12
	move $a0,$a0
	jal var 
	
	mov.d $f12,$f0
	jal sqrt
	
	
	lw $ra, 0($sp)
	addiu $sp,$sp,4
	jr $ra
	
	
	.data
array:	.double 3.0 , 2.0
	.text
	.globl main
	
	
main:
	addiu $sp,$sp,-4
	sw $ra,0($sp)
	la $a0,array
	li $a1,2
	jal var
	li $v0,3
	mov.d $f12,$f0
	syscall
	
	
	la $a0,array
	li $a1,2
	jal stdev
	li $v0,3
	mov.d $f12,$f0
	syscall

	lw $ra, 0($sp)
	addiu $sp,$sp,4
	jr $ra
	
	
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
if_sqrt:	
	c.le.d $f4, $f10
	bc1t else_sqrt
do_sqrt:
	mov.d $f6,$f8
	div.d $f16,$f4,$f8
	add.d $f8,$f16,$f8
	l.d $f16,numero
	mul.d $f8,$f8, $f16
	addi $t0,$t0,1
while_sqrt:
	blt $t0,25,do_sqrt
	
	c.eq.d $f6,$f8
	bc1f do_sqrt
	
	
	j endif_sqrt
else_sqrt:

	mov.d $f8,$f10
endif_sqrt:	
	
	mov.d $f0,$f8
	
	jr $ra
	
	
	.data
	.text
average:
	
	move $t0,$a1
	
	li $t5,0
	mtc1 $t5,$f4
	cvt.d.w $f4,$f4
	move $t1,$a0
for_average:
	ble $t0,0,endfor_average
	sll $t2,$t0,3
	sub $t2,$t2,8
	add $t2,$t1,$t2
	l.d $f6,0($t2)
	add.d $f4,$f4,$f6
	subu $t0,$t0,1
	j for_average
endfor_average:
	mtc1 $a1,$f8
	cvt.d.w $f8,$f8
	div.d $f0,$f4,$f8
	jr $ra
	
	.data
	.text
	
xtoy:
	addiu $sp,$sp,-32
	sw $ra,0($sp)
	sw $s1,4($sp)  
	s.d $f20,8($sp)	 									# y-> s1 , x -> f20 , i-> s0 ,  result -> f22
	sw $s0,24($sp)
	s.d $f22,16($sp)
	sw $s2,28($sp)
	move $s1,$a0        
	mov.d $f20  , $f12									
	
	li $s0,0
	li $t0,1
	mtc1 $t0 ,$f22
	cvt.d.w $f22,$f22
	move $a0,$s1
	jal abs
	move $s2, $v0
	
for_xtoy:
	bge $s0,$s2,end_for_xtoy
	
if_xtoy:ble $s1,0 , else_xtoy

	mul.d $f22,$f22,$f20
	j endif_xtoy
else_xtoy:
	div.d $f22,$f22,$f20

endif_xtoy:
	
	
	
	addi $s0,$s0,1
	j for_xtoy
end_for_xtoy:
	mov.d $f0,$f22
	
	lw $s2,28($sp)
	l.d $f22,16($sp)
	lw $s0,24($sp)
	l.d $f20,8($sp)
	lw $s1,4($sp)
	lw $ra ,0($sp)
	addiu $sp,$sp,32
	jr $ra
	
	
	
	.data
	.text
abs:
	move $t0,$a0
	li $t1,-1
if_abs:	bge $t0,0 ,endif_abs
	
	mult $t0,$t1
	mflo $t0

endif_abs:
	move $v0,$t0

	jr $ra
	