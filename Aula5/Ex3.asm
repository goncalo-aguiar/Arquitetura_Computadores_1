# Mapa de registos
# ...
# houve_troca: $t4
# i: $t5
# lista: $t6
# lista + i: $t7
	 .data
	 .eqv SIZE, 10
	 .eqv FALSE,0
 	 .eqv TRUE,1
str:    .asciiz "Introduza um numero:\n"
	.align 2
lista:  .space	 40
 	 .text
	 .globl main
main:   
	 li $t5, 0 
while:   bge $t5, SIZE, endw# código para leitura de valores
	 la $a0, str
	 li $v0, 4
	 syscall
	 li $v0, 5
	 syscall
	 la $t6,lista 
	 sll $t8,$t5, 2
	 addu $t7, $t6, $t8
	 sw $v0, 0($t7)
	 addi $t5, $t5,1
	 j while
endw:   
do:  li $t4,FALSE # houve_troca = FALSE;
	 li $t5,0 # i = 0;
for:     bge $t5,9, endfor# while(i < SIZE-1){
if:     sll $t2, $t5,2# $t2 = i * 4
	addu $t3,$t2,$t6 # $t7 = &lista[i]
 	lw $t8,0($t3) # $t8 = lista[i]
 	lw $t9,4($t3) # $t9 = lista[i+1]
	 ble $t8,$t9,endif # if(lista[i] > lista[i+1]){
	 sw $t8,4($t3) # lista[i+1] = $t8
 	 sw $t9,0($t3) # lista[i] = $t9
	 li $t4,TRUE
	  #
	# }
endif: addi $t5,$t5,1 # i++;
	 j for # }
endfor:	
enddo : beq $t4,TRUE,do	 # } while(houve_troca == TRUE);

	li $t5,0 # i = 0;
for2 : bge $t5, SIZE, endfor2	 
	sll $t1, $t1,2
	add $t8,$t1,$t6	
	lw $t8, 0($t8)
	move $a0, $t8
	addi $v0, $0,4
 	syscall
 	addi $t5,$t5,1
 endfor2: jr $ra # termina o programa 
