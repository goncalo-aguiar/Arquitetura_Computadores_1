	.data
	.eqv SIZE,8
str1: 	.asciiz "Result is: "
val:	.word 8, 4, 15, -1987, 327, -9, 27, 16
	.text
	.globl main
	
main: 
	li $t0,0
	li $t4,SIZE
	div $t4,$t4,2
	la $t1,val
do:	
	sll $t6,$t0,2
	add $t2,$t1,$t6
	lw $t3,0($t2)					#$t8 - v
	move $t8, $t3			#val(i)-$t3
	add $t9, $t2,$t4
	lw $t7,0($t9)		#t7 - val[i+SIZE/2]; 
	move $t3,$t7
	move $t7,$t8		

	addi $t0,$t0,1
while: blt $t0, $t4 ,do

	la $a0,str1
	li $v0,4
	syscall
	li $t0,0
	la $t1,val
do1:
	addi $t0,$t0,1
	sll $t6,$t0,2
	add $t6,$t6,$t1
	
	li $v0,1
	lw $a0,0($t6)
	 syscall
	 li $v0,11
	 li $a0,','
	 syscall
	
	addi $t0,$t0,1
while1:blt $t0,SIZE,do1

	jr $ra
	

