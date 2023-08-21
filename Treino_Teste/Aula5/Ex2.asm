	.data
	.eqv SIZE,10
str1:	.asciiz "\nConteudo do array:\n"
str2:	.asciiz ";"
lista:	.word 8, -4, 3, 5, 124, -15, 87, 9, 27, 15
	.text
	.globl main

main:   li $v0, 4
	la $a0,str1
	syscall
	la $t0, lista
	li $t1,SIZE
	sll $t1,$t1,2
	sub $t1,$t1,1
	add $t1,$t0,$t1

for:  bge $t0,$t1,endfor
	lw $a0, 0($t0)
	li $v0,1
	syscall
	li $v0, 4
	la $a0,str2
	syscall
	addi $t0,$t0,4
	j for
endfor:	jr $ra

