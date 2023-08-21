	.data
	.text
atoi:
	li $t1,0
	li $t2,0
	move $t0,$a0
	li $t5,'0'
	li $t6,'9'
while:	lb $t7,0($t0)

	slt $t3,$t7,$t5
	sgt $t4,$t7,$t6
	or $t4,$t3,$t4
	beq $t4,1,endw
	
	sub $t1,$t7,'0'
	mul $t2,$t2,10
	addu $t2,$t2,$t1
	addi $t0,$t0,1
	j while
endw:
	move $v0,$t2

	jr $ra
	
	
	
	.data
str:	.asciiz "2016 e 2020 sao anos bissextos"
	.text
	.globl main
	
main: 	addi $sp,$sp,-4
	sw $ra,0($sp)
	
	la $a0,str
	jal atoi 
	move $a0,$v0
	li $v0,1
	syscall
	
	
	
	
	lw $ra,0($sp)
	addi $sp,$sp,4
	jr $ra
	