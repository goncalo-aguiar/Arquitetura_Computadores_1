	.data
	.eqv SIZE,3
str1: 	.asciiz "Array"
str2: 	.asciiz "de"
str3: 	.asciiz "Ponteiros"
str4: 	.asciiz "\nString #" 
str5: 	.asciiz	 ": " 
	.align 2
array:	.word str1,str2,str3
	.text
	.globl main

main: li $t0,0

for:    bge $t0,SIZE,endfor
	li $v0,4
	la $a0, str4
	syscall
	li $v0, 1
	move $a0,$t0
	syscall
	li $v0,4
	la $a0, str5
	syscall
	li $t1,0
	sll $t2, $t0,2
	la $t3, array
	add $t2, $t2,$t3
	lw $t5, 0($t2)
while:  
	lb $t6 ,0($t5)
	beq $t6,'\0',endw
	li $v0,11
	move $a0, $t6
	syscall
	li $v0,11
	li $a0, '-'
	syscall
	addi $t5,$t5,1
	j while
endw:
	addi $t0,$t0,1
	j for
endfor:
	jr $ra