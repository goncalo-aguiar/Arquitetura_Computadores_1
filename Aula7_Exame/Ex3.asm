	.data
	.text
	
strcopy:
	move $t0,$a0
	move $t1,$a1
	li $t2 ,0
do_strcopy:
	add $t3,$t0,$t2
	add $t4,$t1,$t2
	lb $t3,0($t3)
	sb $t3,0($t4)
	addi $t2,$t2,1
	
	
while_strcopy: bne $t3,'\0',do_strcopy
	move $v0,$t0




	jr $ra
	
	.data
str:	.asciiz "I serodatupmoC ed arutetiuqrA"
str2:	.space 31
	.text
	.globl main
	
main:	addiu $sp,$sp,-4
	sw $ra,0($sp)
	la $a0,str
	la $a1,str2
	jal strcopy
	li $v0,4
	la $a0,str2
	syscall
	lw $ra,0($sp)
	addiu $sp,$sp,4
	jr $ra