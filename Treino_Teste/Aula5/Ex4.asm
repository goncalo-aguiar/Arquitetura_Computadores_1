	.data
	.eqv SIZE,10
	.eqv TRUE,1
	.eqv FALSE,0
str1:   .asciiz "\nIntroduza um numero: "	
str2:	.asciiz "\nConteudo do array:\n"
str3:	.asciiz ";"
	.align 2
lista:  .space 40
	.text
	.globl main

main:   la $t0 , lista
	li $t1,SIZE
	sll $t1,$t1,2
	sub $t1,$t1,1
	add $t1,$t0,$t1
for:   bge $t0,$t1,endfor
	la $a0,str1
	li $v0,4
	syscall
	li $v0,5
	syscall
	sw $v0, 0($t0)
	
	addi,$t0,$t0,4
	j for
endfor:
	
do:
	li $t2,FALSE
	la $t0 , lista
for3:  bge $t0,$t1,endfor3
	
if:    lw $t5 , 0($t0)
       lw $t6 , 4($t0)
	ble $t5,$t6,endif
	sw $t5, 4($t0)
	sw $t6, 0($t0)
	li $t2, TRUE
endif:	
	
	addi $t0,$t0,4
	j for3
endfor3:	

	
	
while: beq $t2 , TRUE, do	
	la $t0 , lista
for2:  bge $t0,$t1,endfor2
	lw $a0, 0($t0)
	li $v0,1
	syscall
	li $v0, 4
	la $a0,str3
	syscall
	addi $t0,$t0,4
	j for2
endfor2:jr $ra




	