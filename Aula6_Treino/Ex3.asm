	.data
	.eqv SIZE,3
	
str4:   .asciiz "\nString #"
str5:   .asciiz ": "
str1:	.asciiz "Array"
str2:	.asciiz "de"
str3:	.asciiz "ponteiros"
array:	.word str1,str2,str3
	.text
	.globl main

main:
	
	li $t0,0
	
for:	bge $t0, SIZE, endfor
	li $v0,4
	la $a0, str4
	syscall
	li $v0,1
	move $a0, $t0
	syscall
	li $v0,4
	la $a0, str5
	syscall
	li $t1,0
	la $t2, array
	sll $t4, $t0,2
	add $t2, $t2,$t4
	add $t3, $t2 , $t4
	lw $t4 , 0($t2)
while: 	beq $t3, '\0',endwhile
	lb $t3 , 0($t4)
	move $a0, $t3
	li $v0,11
	syscall
	li $a0, '-'
	li $v0,11
	syscall
	addi $t1,$t1, 1
	addi $t4,$t4,1
	j while
endwhile:		
	addi $t0,$t0,1
	j for
endfor: jr $ra
