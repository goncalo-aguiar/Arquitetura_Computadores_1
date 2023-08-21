	.data
	.text
strcat:

	addiu $sp,$sp,-12
	sw $ra, 0($sp)
	sw $s0,4($sp)
	sw $s1,8($sp)
	
	move $s0,$a0
	        
	move $s1,$a1
	
while_strcat:
	lb $t1,0($t0)
	beq $t1,'\0',endw_strcat
	
	addi $s0,$s0,1
endw_strcat:
	move $a0,$s0
	move $a1,$s1
	jal strcopy
	
	
	
	
	
	
	lw $ra,0($sp)
	lw $s0,4($sp)
	lw $s1,8($sp)
	addiu $sp,$sp,12
	jr $ra
	
	
	.data
str:	.asciiz "Arquitetura de "
	.align 2
str2:	.space 50
str3:	.asciiz "Computadores"
	.text
	.globl main
	
main:
	addiu $sp,$sp,-4
	sw $ra,0($sp)
	la $a0,str2
	la $a1,str
	jal strcopy
	la $a0,str2
	li $v0,4
	
	syscall
	la $a0,str2
	la $a1,str3
	jal strcat
	move $a0,$v0
	li $v0,4
	syscall
	
	lw $ra,0($sp)
	addiu $sp,$sp,4
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