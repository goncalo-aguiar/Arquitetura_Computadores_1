	.data
	.eqv SIZE, 5
str1:   .asciiz "\nIntroduza um numero: "
	.align 2
array:  .space 20
	.text
	.globl main

main:
	li $t0,0
for:   bge $t0, SIZE, endfor
	li $v0,4
	la $a0, str1
	syscall
	li $v0,5
	syscall
	sll $t1,$t0,2
	la $t2,array
	addu $t3,$t2,$t1
	sw $v0, 0($t3)
	
	addi $t0,$t0,1
	j for
endfor: jr $ra
