	.data
	.eqv SIZE,3
str1:	.asciiz "Array"
str2:	.asciiz "de"
str3:	.asciiz "Ponteiros"
array:	.word str1,str2,str3
	.text
	.globl main

main:
	la $t0, array
	li $t1,SIZE
	sll $t1, $t1, 2
	sub $t1,$t1,1
	add $t1,$t0,$t1
	
for: bge $t0, $t1, endfor
     
     
     li $v0, 4
     lw $a0, 0($t0)
     syscall
     addi $t0,$t0,4

	j for
endfor: jr $ra