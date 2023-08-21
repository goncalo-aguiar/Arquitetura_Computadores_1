# i: $t0
# lista: $t1
# lista + i: $t2 

	.data
str: 	.asciiz "\nIntroduza um numero:"
	.align 2
lista:  .space 40
	.text
	.globl main

main:  li $t0, 0
for:  	bge $t0, 5 , endfor
	la $a0 , str
	li $v0, 4
	syscall
	li $v0, 5
	syscall
	la $t2, lista
	sll $t1,$t0,2
	addu $t3 ,$t1, $t2
	sw $v0,0($t3)
	addi $t0,$t0,1
	j for
endfor: jr $ra