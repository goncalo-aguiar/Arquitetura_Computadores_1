	.data
	.eqv STR_MAX_SIZE ,30 
str:	.asciiz "I serodatupmoC ed arutetiuqrA"
str2:	.space 31
str3 :	.asciiz "\n"
str4:	.asciiz "String too long:"
	.text
	
	.globl main

main:	
	addiu $sp,$sp,-4
	sw $ra,0($sp)
	
	
	la $a0,str
	jal strlen
if:	bgt $v0, STR_MAX_SIZE , else
	la $a0,str2
	la $a1,str
	jal strcopy
	li $v0 ,4
	la $a0,str3
	syscall
	la $a0,str2
	jal strrev
	move $a0,$v0
	li $v0,4
	syscall
	li $t0,0
	
	

	j endif
else:
	li $v0,4
	la $a0,str4
	syscall
	la $a0,str
	jal strlen
	move $a0,$v0
	li $v0,1
	syscall
	li $t0,-1

endif:
	move $v0,$t0
	lw $ra , 0($sp)
	addiu $sp,$sp,4
	jr $ra
	
	.data
	.text
strlen:
	move $t0,$a0							
	li $v0,0
	
while_strlen:
	lb $t1,0($t0)
	beq $t1,'\0',endw_strlen
	addi $v0,$v0,1
	addi $t0,$t0,1
	j while_strlen
endw_strlen:
	
	
	
	
	jr $ra
	
	
	
	
	.data
	.text
	
strcopy:
	move $t0,$a0
	move $t1,$a1
	li $t2 ,0
do_strcopy:
	add $t3,$t0,$t2
	add $t4,$t1,$t2
	lb $t4,0($t4)
	sb $t4,0($t3)
	addi $t2,$t2,1
	
	
while_strcopy: bne $t4,'\0',do_strcopy
	move $v0,$t0




	jr $ra
	
	
	
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
	