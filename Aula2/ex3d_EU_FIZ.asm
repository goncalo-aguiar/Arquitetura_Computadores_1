	.data
 	str1: .asciiz "Introduza 2 numeros"
 	str2: .asciiz "A soma dos dois numeros e':"
 	
 	.text
	 
	 .globl main
	 
main:	la $a0, str1
	ori $v0, $0, 4
	syscall
	ori $v0, $0, 5
	
	syscall
	add $t0,$v0, $0
	ori $v0, $0, 5
	
	syscall
	add $t1,$v0, $0
	la $a0, str2
	ori $v0, $0, 4
	syscall
	add $a0,$t1,$t0
	ori $v0,$0,1
	syscall
	jr $ra # fim do programa 