	.data
	.text
	
div:
	move $t0,$a0   #t0-dividendo
	move $t1,$a1	#t1-divisor
	
	sll $t1,$t1,16
	
	andi $t0 ,$t0,0xFFFF
	sll $t0,$t0,1
	
	li $t2,0   #t2-i
for_div:
	bge $t2,16, endfor_div
	li $t3,0     #t3-bit
if_div:
	blt $t0,$t1,endif_div
	sub $t0,$t0,$t1
	li $t3,1

	
endif_div:
	sll $t0,$t0,1
	or $t0,$t0,$t3

	addi $t2,$t2,1
	j for_div
endfor_div:
	
	srl $t4,$t0,1
	andi $t4,$t4,0xFFFF0000
	andi $t5,$t0,0xFFFF
	
	or $v0, $t4,$t5
	
	
	
	



	jr $ra
	
	
	.data
	.text
	.globl main
	
main:
	addiu $sp,$sp,-4
	sw $ra,0($sp)
	
	
	li $a0,10
	li $a1,2
	jal div
	move $a0,$v0
	li $v0,1
	syscall

	lw $ra,0($sp)
	addiu $sp,$sp,4
	jr $ra