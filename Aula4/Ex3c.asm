# Mapa de registos
# t0- soma
# t1- i
# t2- size
#t3- array[i]
#t4- j
 	.data
array:  .word 7692,23,5,234
 	.eqv print_int10,1
 	.eqv SIZE,4
 	.text
 	.globl main
main:  li $t0,0 # soma = 0;
	li $t1,0 # i= 0;
	li $t2 , SIZE
	la $t4,array # array[0]= 0;
while: 
	 bge $t1,$t2,endw
	lw $t3,0($t4)
	add $t0, $t0, $t3
	addi $t1, $t1,1
	addi $t4, $t4,4
	j while
endw:	move $a0, $t0
 	addi $v0 , $0, 1
 	syscall # print_int10(soma);
 	
 	jr $ra # termina o programa 