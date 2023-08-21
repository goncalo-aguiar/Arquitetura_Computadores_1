	.data
str1:   .asciiz "Introduza um numero: " 
str2:   .asciiz "Valor ignorado\n"
str3:   .asciiz "A soma dos positivos e': "
	.text
	.globl main

main:   li $t0, 0   #  i   = 0
	li $t1, 0   #   soma = 0
	li $t2, 0   #   value =0
for:   bge $t0,5 ,endfor
	la $a0,str1
	li $v0,4
	syscall
	li $v0,5
	syscall
	move $t2,$v0
if:	blez $t2,else
	add $t1,$t1,$t2
	j endif
else:	la $a0,str2
	li $v0,4
	syscall
	
endif:	addi $t0,$t0,1
	j for
endfor:la $a0,str2
	li $v0,4
	syscall
	move $a0,$t1
	li $v0,1
	syscall
	jr $ra

	
	