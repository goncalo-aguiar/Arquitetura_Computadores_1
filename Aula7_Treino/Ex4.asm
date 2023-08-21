	.data

	.text

strcat: addi $sp,$sp,-12
	sw $s2,8($sp)
	sw $s1,4($sp)
	sw $ra,0($sp)
	
	move $s1, $a0
	move $s2, $a1
whilecat: lb $t1, 0($s1)
	beq $t1,'\0' ,endwcat
	addi $s1,$s1,1
	j whilecat
	
		
endwcat: move $a0,$s1
	move $a0,$s2
	jal strcpy
	move $v0,$v0
	sw $s2,8($sp)
	sw $s1,4($sp)
	lw $ra,0($sp)
	addi $sp,$sp,12
	jr $ra
	
	.data
str1:	.asciiz "Arquitetura de "
	.align 2
str2:	.space 50
str4:	.asciiz "\n"
str5:	.asciiz  "Computadores I"
	.text
	.globl main
	
main:  addi $sp,$sp,-4
	sw $ra ,0($sp)
	la $a0,str2
	la $a1,str1
	jal strcpy
	move $a0,$v0
	li $v0,4
	syscall
	la $a0,str4
	li $v0,4
	la $a0,str2
	la $a1,str5
	jal strcat
	move $a0,$v0
	li $v0,4
	syscall
	li $v0,0
	
	lw $ra, 0($sp)
	addi $sp,$sp,4
	jr $ra
	
	
.data
 	.text
 strcpy: move $t0, $a0
 	 move $t1,$a1
 	 li $t2 ,0
 	 
do:	
	add $t4, $t0,$t2
	add $t5, $t1,$t2
	lb $t5,0($t5)
	sb $t5,0($t4)

	addi $t2,$t2,1
	add $t3,$t1,$t2
	lb $t3,0($t3)
while:  bne $t3, '\0' ,do
	move $v0,$t0
 	 jr $ra