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
	
	
	.data
	.text
	.globl main
main:
	addiu $sp,$sp,-4
	sw $ra,0($sp)
	
	li $v0,7
	syscall
	mov.d $f12,$f0
	
	li $v0,5
	syscall
	move $a0,$v0
	jal xtoy
	li $v0,3
	mov.d $f12,$f0
	syscall

	lw $ra,0($sp)
	addiu $sp,$sp,4
	jr $ra
	
	

