	.data
str1:	.asciiz  "Introduza 2 numeros: "
	.text
	.globl main

main: la $a0, str1
	li $v0,4
	syscall
	li $v0,5
	syscall
	move $t1,$v0
	li $v0,5
	syscall
	move $t2,$v0
	andi $t1,$t1,0x0F
	andi $t2,$t2,0x0F
	li $t0,0
while:	seq $t3,$t1,0
	
	slt $t4,$t2,0
	
	jr $ra