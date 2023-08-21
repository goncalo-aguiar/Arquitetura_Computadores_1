	.data
	.eqv SIZE,3
str1: 	.asciiz "Array"
str2: 	.asciiz "de"
str3: 	.asciiz "Ponteiros"

array:	.word str1,str2,str3
	.text
	.globl main

main: la $t2, array
	li $t0, 0
for:	 bge $t0,SIZE,endfor
	sll $t1,$t0,2
	li $v0, 4
	addu $t1,$t2,$t1
	lw $a0,0($t1)
	syscall
	addi $t0,$t0,1
	j for
endfor: jr $ra