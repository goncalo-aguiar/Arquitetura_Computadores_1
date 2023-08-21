	#v0- len
	#a0-s
	
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
str:	.asciiz "Socorro"
	.text
	.globl main
main:
	addiu $sp,$sp,-4
	sw $ra, 0($sp)
	la $a0,str
	jal strlen
	move $a0,$v0
	li $v0,1
	syscall
	lw $ra, 0($sp)
	addiu $sp,$sp,4
	jr $ra