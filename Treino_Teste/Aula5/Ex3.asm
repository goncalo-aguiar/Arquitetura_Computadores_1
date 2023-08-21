	.data
	.eqv SIZE,10
	.eqv TRUE,1
	.eqv FALSE,0
str1:   .asciiz "\nIntroduza um numero: "	
str2:	.asciiz "\nConteudo do array:\n"
str3:	.asciiz ";"
	.align 2
lista:	.space 40
	.text
	.globl main

main:  li $t0,0
	la $t1,lista
for:	bge $t0,SIZE,endfor
	li $v0,4
	la $a0,str1
	syscall
	li $v0, 5
	syscall
	sll $t2,$t0,2
	addu $t2, $t2,$t1
	sw $v0,0($t2)
	addi $t0,$t0,1
	j for
endfor:
	
	la $t1,lista
	
do:
	li $t2,0
	li $t0,0
for3:	bge $t0,9,endfor3

if:	sll $t3,$t0,2
	addu $t4,$t3,$t1
	lw $t6, 0($t4)
	lw $t7, 4($t4)
	ble $t6,$t7,endif
	sw $t6, 4($t4)
	sw $t7,0($t4)
	li $t2,1
endif:		
	
	addi $t0,$t0,1
	j for3
endfor3:		
while: beq $t2,TRUE, do	
	
	
	li $t0,0
	la $t1,lista
for2:  bge  $t0,SIZE,endfor2
	
	sll $t2, $t0,2
	addu $t2,$t2,$t1
	lw $a0, 0($t2)
	li $v0,1
	syscall
	li $v0, 4
	la $a0,str3
	syscall
	
	addi $t0,$t0,1
	j for2
endfor2: jr $ra	
	
