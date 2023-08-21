	.data
	.eqv SIZE,4
array:  .word 7692, 23, 5, 234
	.text
	.globl main

main:   li $t2, 0
	la $t0, array
	li $t1, SIZE
	sll $t1,$t1,2
	sub $t1,$t1,1
	addu $t1,$t1,$t0
while: bge $t0, $t1,endw
	lw $t3,0($t0)
	add $t2, $t2, $t3
	
	addi $t0,$t0,4
	j while
endw:
	li $v0,1
	move $a0,$t2
	syscall
	jr $ra