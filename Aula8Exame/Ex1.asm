	.data
	.text
	
atoi:
	
	move $t0,$a0
	li $t2,'0'
	li $t3,'9'
	li $t7,10
	li $t8,0
while_atoi:
	lb $t1,0($t0)
	slt $t4,$t1,$t2
	sgt $t5,$t1,$t3
	or $t5,$t4,$t5
	beq $t5,1,endw_atoi
	
	sub $t6,$t1,$t2
	mult $t8,$t7
	mflo $t8
	add $t8,$t8,$t6
	
	addi $t0,$t0,1
	j while_atoi
endw_atoi:
	
	move $v0,$t8


	jr $ra
	
	.data
str:	.asciiz "2016 e 2020 sao anos bissextos"
	.text
	.globl main
	
main:	addiu $sp,$sp,-4
	sw $ra,0($sp)
	
	la $a0,str
	jal atoi
	move $a0,$v0
	li $v0,1
	syscall
	

	lw $ra,0($sp)
	addiu $sp,$sp,4
	jr $ra