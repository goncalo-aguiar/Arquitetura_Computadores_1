# Mapa de registos:
# $t0 � value
# $t1 � bit
# $t2 - i
 	.data 
   str1: .asciiz "Introduza um numero: "
   str2: .asciiz "\nO valor em bin�rio e': "
   str3: .asciiz " "
	.eqv print_string,4
 	.eqv read_int,5
 	.eqv print_char,11
 	 .text
 	.globl main
main:   la $a0,str1
 	li $v0,print_string # (instru��o virtual)
 	syscall # print_string(str1);
 	ori $v0, $0, read_int # value=read_int();
 	syscall
 	or $t0 , $v0 , $0
 	la $a0 ,str2 # print_string("...");
 	ori $v0, $0, print_string
 	li $t2,0 # i = 0
 	li $t8,0 # flag = 0
for:    bge $t2,32,endfor #				 while(i < 32) {
	andi $t1,$t0,0x80000000 		# (instru��o virtual)
	li $t7 , 4				# 4 entra no t7 para ver espa�os
	div $t2 , $t7                          #divisao i/4
	mfhi $t6				# resto da div
	bne $t6, $0 , else1			# if do resto da divisao
	la $a0,str3				
	addi $v0 , $0 , 4			# espa�o de 4 em 4 -> print		
	syscall
else1:  srl $t1 ,$t1 ,31
	bne $t1 , $0, else
	bne $t8 , 1 , else
	li $t8,1 # flag = 1
	addi $a0,$t1,0x30  # print_char(');	# print do 0 ou 1
 	ori $v0 , $0, print_char
 	syscall
 	j endfor
else:	sll $t0, $t0 ,1 # value = value << 1;
 	addi $t2, $t2, 1# i++;
	 j for # }
endfor: #
 	jr $ra # fim do programa