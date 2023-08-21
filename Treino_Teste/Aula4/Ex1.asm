	.data
	.eqv SIZE,20
	.align 2
str:	.space 20
	.text
	.globl main
	
	
main:   la $a0, str
	li $a1 , 20
	li $v0, 8
	syscall
	li $t0, 0
	li $t1, 0
	li $t8,9
while: la $t2, str
	move $t3 ,$t0
	addu $t3,$t2,$t3
	lb $t7, 0($t3)
	beq $t7, '\0',endwhile
if:    slt $t4,$t7,'0'
	sgt $t5,$t7,'9'
	or $t6, $t5,$t4
	beq $t6,1,endif
	addi $t1,$t1,1	
	
endif:	addi $t0, $t0,1
	j while
endwhile:
	li $v0, 1
	move $a0, $t1
	syscall



	jr $ra