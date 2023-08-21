	.data
	.text
strrev:
	addiu $sp,$sp,-16
	sw $ra,0($sp)
	sw $s0,4($sp)
	sw $s1,8($sp)
	lw $s2,12($sp)
	move $s0,$a0
	move $s1,$a0
	move $s2,$a0
	
while_strrev:
	lb $t0,0($s1)
	beq $t0,'\0',endw_strrev
	addi $s1,$s1,1
	j while_strrev
endw_strrev:
	sub $s1,$s1,1
	
	
while_strrev1:
	bge $s0,$s1,endw_strrev1
	move $a0,$s0
	move $a1,$s1
	jal exchange	
	addi $s0,$s0,1
	addi $s1,$s1,-1
	j while_strrev1
endw_strrev1:
	
	
	
	move $v0,$s2
	
	
	lw $ra,0($sp)
	lw $s0,4($sp)
	lw $s1,8($sp)
	lw $s2,12($sp)
	addiu $sp,$sp,16
	jr $ra
	
	.data
	.text
exchange:
	lb $t0,0($a0)  # char aux = *c1;
	
	lb $t1,0($a1)
	sb $t1,0($a0) #*c1 = *c2; 
	
	sb $t0,0($a1)

	jr $ra
	
	
	.data
str:	.asciiz "ITED - orievA ed edadisrevinU"
	.text
	.globl main
main:	
	
	
	addi $sp ,$sp,-4
	sw $ra ,0($sp)
	la $a0,str
	jal strrev
	move $a0,$v0
	li $v0,4
	syscall
	lw $ra , 0($sp)
	addi $sp,$sp,4
	jr $ra