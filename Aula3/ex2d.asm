# Mapa de registos:
# $t0 – value
# $t1 – bit
# $t2 - i
 	.data 
   str1: .asciiz "Introduza um numero: "
   str2: .asciiz "\nO valor em binário e': "
   str3: .asciiz " "
	.eqv print_string,4
 	.eqv read_int,5
 	.eqv print_char,11
 	 .text
 	.globl main
main:   la $a0,str1
 	li $v0,print_string # (instrução virtual)
 	syscall # print_string(str1);
 	ori $v0, $0, read_int # value=read_int();
 	syscall
 	or $t0 , $v0 , $0
 	la $a0 ,str2 # print_string("...");
 	ori $v0, $0, print_string
 	li $t2,0 # i = 0
for:    bge $t2,32,endfor # while(i < 32) {
	andi $t1,$t0,0x80000000 # (instrução virtual)
	li $t7 , 4
	div $t2 , $t7
	mfhi $t6
	bne $t6, $0 , else1
	la $a0,str3
	addi $v0 , $0 , 4
	syscall
else1:  srl $t1 ,$t1 ,31
	addi $a0,$t1,0x30  # print_char(');
 	ori $v0 , $0, print_char
 	syscall
endif :	sll $t0, $t0 ,1 # value = value << 1;
 	addi $t2, $t2, 1# i++;
	 j for # }
endfor: #
 	jr $ra # fim do programa