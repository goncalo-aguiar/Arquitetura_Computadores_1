	# O argumento da fun��o � passado em $a0
	# O resultado � devolvido em $v0
	# Sub-rotina terminal: n�o devem ser usados registos $sx

	.data
	.text

strlen: li $t1,0 # len = 0;
while:  lb $t0,0($a0) # while(*s++ != '\0')
	 addiu $a0,$a0,1 #
	 beq $t0,'\0',endw # {
	 addi $t1,$t1,1 # len++;
 	 j while # }
endw:   move $v0,$t1 # return len;
 	jr $ra
 	
 	 .data
str: 	 .asciiz "Arquitetura de Computadores" 
 	 .text
 	 .globl main

main:  addiu $sp,$sp,-4
	sw $ra,0($sp)
	la $a0, str
	jal strlen
	move $a0,$v0
	li $v0,1
	syscall
	
	lw $ra,0($sp)
	addiu $sp,$sp,4




	jr $ra