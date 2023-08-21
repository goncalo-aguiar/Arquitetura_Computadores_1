	.data
str1:	.asciiz "The result is:"
	.eqv SIZE,8
	.align 2
val:	.word 8, 4, 15, -1987, 327, -9, 27, 16
	.text
	.globl main

main:
	li $t0,0	#	i = 0; 
	la $t1, val
	li $t2,SIZE
	div $t2,$t2,2
	
do:
	sll $t3,$t0,2
	add $t3, $t3,$t1
	lw $t4,0($t3)
	move $t5,$t4   #v = val[i]; 
	sll $t9,$t2,2
	sll $t3,$t0,2
	add $t3,$t1,$t3
	add $t3,$t3,$t2
	lw $t4,0($t3)
	sll $t3,$t0,2
	add $t3,$t3,$t1
	sw $t4,0($t3)
	sll $t3,$t0,2
	add $t3,$t3,$t2
	add $t3,$t3,$t1
	sw $t5,0($t3)
	

	

	addi $t0,$t0,1
while: blt $t0,$t2,do
	li $v0,4
	la $a0,str1
	syscall
	li $t0,0
	li $t2,SIZE
do2:
	sll $t3,$t0,2
	add $t3,$t3,$t1
	addi $t3,$t3,4
	lw $a0, 0($t3)
	li $v0 ,1
	syscall
	li $v0,11
	li $a0,','
	syscall
	


	addi $t0,$t0,1
while2: blt $t0,$t2,do2
	jr $ra