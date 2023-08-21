# Mapa de registos
# t0-i

# houve_troca: $t4
# i: $t0
# lista: $t1
# lista + i: $t7
 	.data
	 .eqv FALSE,0
	 .eqv TRUE,1
 	.eqv SIZE,10
 str:	.asciiz "\nIntroduza um numero:"
 str2:	.asciiz ";"
 	.align 2 
lista:	.space 40
 	.text
 	.globl main
main:  li $t0,0
for1:  bge $t0, SIZE, endfor1
	la $a0, str
	li $v0, 4
	syscall
	li $v0,5
	syscall
	la $t1,lista
	sll $t2, $t0,2
	addu $t2 , $t1,$t2
	sw $v0, 0($t2)
	addi $t0,$t0,1
	j for1			# código para leitura de valores
endfor1:	
 	la $t1,lista #
do: # do {
	 li $t4,FALSE # houve_troca = FALSE;
 	 li $t0,0 # i = 0;
for:    bge $t0,9,endfor# while(i < SIZE-1){
if:     sll $t7,$t0,2 # $t7 = i * 4
 	addu $t7,$t7,$t1 # $t7 = &lista[i]
	 lw $t8,0($t7) # $t8 = lista[i]
 	lw $t9,4($t7) # $t9 = lista[i+1]
	 ble $t8,$t9,endif # if(lista[i] > lista[i+1]){
	 sw $t8,4($t7) # lista[i+1] = $t8
	 sw $t9,0($t7) # lista[i] = $t9
	 li $t4,TRUE #
	 # }
endif: addi $t0,$t0,1 # i++;

	j for # }
endfor:
while:	beq $t4,TRUE,do	 # } while(houve_troca == TRUE);
	li $t0,0
for2:  bge $t0, SIZE, endfor2 # codigo de impressao do
	la $t1,lista
	sll $t2,$t0,2
	addu $t2,$t1,$t2
	lw $a0, 0($t2)
	li $v0,1
	syscall
	la $a0, str2
	li $v0,4
	syscall
	addi $t0,$t0,1
	j for2
endfor2:jr $ra			# conteudo do array
 	 				# termina o programa 
