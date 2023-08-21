	.data
	.align 2
id:	.space 4
first_name:
	.space 18
last_name:	
	.asciiz "Bonaparte     "
	.align 2
grade:	.float 5.1

str:	.asciiz "\nN. Mec:"
str1:	.asciiz "\nNome: "
str2:	.asciiz "\nNota: "

	
	.text
	
	.globl main
main:
	la $t0,id
	
	
	
	
	li $v0,4
	la $a0,str
	syscall
	li $v0,5
	syscall
	sw $v0,0($t0)
	li $v0,36
	lw $a0,0($t0)
	syscall
	
	
	
	li $v0,4
	la $a0,str1
	syscall
	li $v0,4
	addi $a0,$t0,22
	syscall
	
	li $v0,8
	addi $a0,$t0,4
	li $a1,18
	syscall
	li $v0,4
	addi $a0,$t0,4
	syscall
	
	
	li $v0,4
	la $a0,str2
	syscall
	l.s $f12,40($t0)
	li $v0,2
	syscall
	
	

 	jr $ra