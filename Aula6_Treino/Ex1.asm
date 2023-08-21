	.data
	.eqv SIZE,3
str1:  .asciiz "Array"
str2:	.asciiz "de"
str3:	.asciiz "Ponteiros"
array:	.word "Array",str2,str3
	.text
	.globl main
	
main:   li $t0, 0
	la $t1, array
for:   bge $t0, SIZE, endfor
	
	sll $t2, $t0, 2
	add $t2, $t2,$t1
	lw $a0, 0($t2)
	li $v0, 4
	syscall
	li $v0, 11
	li $a0, ' '
	syscall
	addi $t0,$t0,1
	j for
endfor: jr $ra