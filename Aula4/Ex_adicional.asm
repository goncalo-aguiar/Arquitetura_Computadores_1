#Mapa registos
#t0- ponteiro
#t1- para onde aponta o ponteiro
#
#

    .data
    .eqv SIZE,20
str: .space 20
str1: .asciiz "Introduza uma frase:"
    .text
    .globl main
    
main:   la $a0, str1
	addi $v0, $0, 4
	syscall
	la $a0 , str
	li $a1 , SIZE
	addi $v0, $0, 8
	syscall
	la $t0 , str
while:	lb $t1 , 0($t0)
	beq $t1,'\0',endw
	sub $t1 , $t1, 0x20
	addi $t0, $t0, 1
	j while
endw:	add $a0 , $0 , $t1
	li $v0, 4
	syscall
	jr $ra