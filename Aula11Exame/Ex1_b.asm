	.data
	.align 2
id:	.space 4
p_nome:	.space 18
l_nome:	.asciiz "Bonaparte     "
grade:	.float 5.1
str:	.asciiz "\nN. Mec: "
str1:	.asciiz "\nNome: "
str2:	.asciiz "\nNota: "
str3:	.asciiz "Numero:"
str4:	.asciiz "Nome?"
	.text
	.globl main
main:
	la $t0,id
	
	la $a0,str3
	li $v0,4
	syscall
	li $v0,5
	syscall
	sw $v0,0($t0)
	
	
	la $a0,str4
	li $v0,4
	syscall
	li $v0,8
	addi $a0,$t0,4
	li $a1,18
	syscall
	
	
	
	
	li $v0,4
	la $a0,str
	syscall
	lw $a0,0($t0)
	li $v0,1
	syscall
	
	li $v0,4
	la $a0,str1
	syscall
	addi $a0,$t0,4
	li $v0,4
	syscall
	
	
	li $v0, 11
	li $a0,','
	syscall
	li $v0,4
	addi $a0,$t0,22
	syscall
	
	la $a0,str2
	li $v0,4
	syscall
	li $v0,2
	l.s $f12,40($t0)
	syscall

	jr $ra