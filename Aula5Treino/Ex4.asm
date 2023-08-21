# Mapa de registos
# ...
# houve_troca: $t4
# p: $t5
# pUltimo: $t6
 	.data
 	.eqv SIZE,10
 str:  .asciiz "\nIntroduza um numero:\n"
 str2:  .asciiz ";"
	 .align 2
lista:	 .space 40
 	.text
 	.globl main
main: 	la $t5 , lista	
	li $t6, SIZE
	sll $t6, $t6,2
	sub $t6,$t6,1
	add $t6,$t5,$t6
for:	bge $t5,$t6,endfor
	la $a0,str
	li $v0, 4
	syscall
	li $v0,5
	syscall
	sw $v0,0($t5)
	addi $t5,$t5,4
	j for
endfor:			
				
						
	la $t5,lista # $t5 = &lista[0]
 	li $t6,SIZE #
	subu $t6,$t6,1 # $t7 = SIZE – 1
 	sll $t6,$t6,2 # $t7 = (SIZE – 1) * 4
	addu $t6,$t6,$t5 # $t7 = lista + (SIZE – 1)
do:   la $t5,lista
	li $t4,0
for3:  bge $t5,$t6,endfor3
	lw $t7 , 0($t5)
	lw $t8 , 4($t5)

if:	ble $t7,$t8,endif
	sw $t7 , 4($t5)
	sw $t8 , 0($t5)
	li $t4,1
	
endif:	
	addi $t5,$t5,4
 	j for3
 endfor3:		
 while:	beq $t4,1,do	
 	la $t5 , lista	
 	li $t6, SIZE
 	sll $t6,$t6,2
 	sub $t6,$t6,1
 	add $t6,$t6,$t5
 for2: bge $t5,$t6,endfor2
 	lw $a0, 0($t5)
 	li $v0, 1
 	syscall
 	la $a0, str2
 	li $v0, 4
 	syscall
 	addi $t5,$t5,4
 	j for2
 endfor2: jr $ra
 
