	.data
str1: 	.asciiz "Nr. de parametros: "	
str2:	.asciiz "\nP"
str3:	.asciiz ": "	
	.text
	.globl main

main:  li $t0,0
	move $t1,$a0
	move $t2,$a1
	la $a0, str1
	li $v0,4
	syscall
	move $a0,$t1
	li $v0,1
	syscall
for:	bge $t0,$t1, endfor
	la $a0, str2
	li $v0,4
	syscall
	li $v0,1
	addi $a0,$t0,0
	syscall
	la $a0, str3
	li $v0,4
	syscall
	sll $t4, $t0,2
	add $t3 ,$t2 , $t4
	lw $a0, 0($t3)
	li $v0,4
	syscall
	addi $t0,$t0,1
	j for
endfor:	
	
	jr $ra
