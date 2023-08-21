	.data
str:	.asciiz "\nConteudo do array:\n"
str1:   .asciiz ";"
lista: .word 8, -4, 3, 5, 124, -15, 87, 9, 27, 15
	.eqv SIZE,10
	.text
	.globl main
	
main:   la $a0, str
	li $v0, 4
	syscall
	la $t0, lista
	li $t1 , SIZE
	sll $t1, $t1,2
	sub $t1, $t1,1
	add $t2 , $t0, $t1
for:	bge $t0 , $t2, endfor
	lw $a0 , 0($t0)
	li $v0 ,1
	syscall
	la $a0, str1
	li $v0, 4
	syscall
	addi $t0, $t0,4
	j for
endfor:
	
	jr $ra


