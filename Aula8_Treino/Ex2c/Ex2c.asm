	.data
	.text
	.globl main
	
main: 	addiu $sp,$sp,-4
	sw $ra,0($sp)

	li $v0,5
	syscall
	move $a0,$v0
	li $v0,5
	syscall
	move $a1,$v0
	jal print_int_ac1
	
	lw $ra,0($sp)
	addiu $sp,$sp,4
	jr $ra
	
	
	.data
buf:	.space 33
	.text
	.globl print_int_ac1
	
print_int_ac1:
	addiu $sp,$sp,-4
	sw $ra , 0($sp)
	move $s0,$a0
	move $s1,$a1
	
	la $a2,buf
	jal itoa
	move $a0,$v0
	li $v0,4
	syscall
	
	lw $ra,0($sp)
	addiu $sp,$sp,4
	jr $ra
