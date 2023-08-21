	.data
	.eqv SIZE,3
str:	.asciiz	"\nString #" 
stra:	.asciiz ":"
str1:	.asciiz "TOU"
str2:	.asciiz "FARTO"
str3:	.asciiz "DISTO"
array:	.word	str1,str2,str3
	.text
	.globl main
	
main:
	li $t0,0
for:	bge $t0,SIZE,endfor
	li $v0,4
	la $a0,str
	syscall
	li $v0,1
	move $a0,$t0
	syscall
	li $v0,4
	la $a0,stra
	syscall
	li $t1,0
	la $t2, array
	sll $t3,$t0,2
	add $t3,$t3,$t2
	lw $t4,0($t3)
while: lb $t5,0($t4)
	beq $t4, '\0',endw
	li $v0,11
	move $a0,$t5
	syscall
	addi $t4,$t4,1
	j while
endw:
	addi $t0,$t0,1
	j for
endfor: jr $ra
