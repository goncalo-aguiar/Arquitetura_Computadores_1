	.data 	
str1:  .asciiz "Array"
str2:  .asciiz "de"
str3:  .asciiz "Ponteiros"
	.eqv SIZE,3

array:	.word str1, str2 , str3
	.text
	.globl main
	
main:   li  $t0,0
	la $t1 , array
for:	bge $t0 ,SIZE, endfor
	
	sll $t2,$t0,2
	addu $t3, $t1, $t2
	
	lw $a0 ,0($t3)
	li $v0,4
	syscall
	li $v0,11
	li $a0, '\n'
	syscall
	addi $t0,$t0,1
	j for
endfor:  jr $ra



#while:	addi $t2,$t1, 1
#	lw $t3 , ($t2)0
#	beq $t3, "\0", endwhile
#	move $a0, $t3
#	li $v0,5
#	syscall
#endwhile: j while
