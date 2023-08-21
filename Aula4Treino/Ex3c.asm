# Mapa de registos
# t0 - soma
# t1- i
# 
# 
 	.data
array: .word 7692,23, 5, 234
 	.eqv print_int10,1
	 .eqv SIZE,4
 	.text
 	.globl main
main: addi $t0,$0,0
      addi $t1,$0,0
      la $t2, array
while: bge $t1, SIZE, endw
 	lw $t4 , 0($t2)
 	add $t0, $t4, $t0
 	addi $t2, $t2,4
 	addi $t1,$t1,1
 	j while
endw: move $a0, $t0
 	addi $v0 , $0, 1
 	syscall # print_int10(soma);
 	jr $ra # termina o programa 