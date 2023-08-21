
 	
 	
# Mapa de registos
# str: $s0
# val: $s1
# O main é, neste caso, uma sub-rotina intermédia
 	.data
 str1:	.asciiz "\n"
 	.align 2
str: 	.space 33
 	.eqv STR_MAX_SIZE,33
 	.eqv read_int,5
 	.eqv print_string,4
 
 	.text
	 .globl main
main: 	addiu $sp,$sp,-12 # reserva espaço na stack
 	sw $ra,0($sp)# guarda $ra na stack
 	sw $s0,4($sp)
 	sw $s1,8($sp)
 	la $s0,str
do_main: # do {
 	li $v0,read_int
 	syscall #
 	move $s1,$v0 # val = read_int()
 	
 	move $a0,$s1
 	li $a1,2
 	move $a2,$s0
 	jal itoa
 	move $a0,$v0
 	li $v0,print_string
 	syscall
 	
 	li $v0,print_string
 	la $a0,str1
 	syscall
 	
 	move $a0,$s1
 	li $a1,8
 	move $a2,$s0
 	jal itoa
 	move $a0,$v0
 	li $v0,print_string
 	syscall
 	
 	li $v0,print_string
 	la $a0,str1
 	syscall
 	
 	move $a0,$s1
 	li $a1,16
 	move $a2,$s0
 	jal itoa
 	move $a0,$v0
 	li $v0,print_string
 	syscall
 	
 	li $v0,print_string
 	la $a0,str1
 	syscall
 	
 	
 	bne $s1,0,do_main # } while(val != 0)
 	li $v0,0 # return 0;
 	
 	lw $ra,0($sp) # repõe registo $ra
 	lw $s0,4($sp)
 	lw $s1,8($sp)
	addiu $sp,$sp,12# liberta espaço na stack
 	jr $ra # termina programa 
 	
 	
 	
