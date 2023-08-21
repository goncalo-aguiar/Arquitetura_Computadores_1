# Mapa de registos:
# $t0 � value
# $t1 � bit
# $t2 - i
	 .data
	str1: .asciiz "Introduza um numero: "
	str2: .asciiz "O valor em binario e:"
 	.eqv print_string,4
 	.eqv read_int,5
 	.eqv print_char,11
 	 .text
 	.globl main
main:   la $a0,str1
	 li $v0,print_string # (instru��o virtual)
	 syscall # print_string(str1);
 	 li $v0, read_int# value=read_int();
 	 syscall
 	 add $t0 , $v0, $0
	 la $a0,str2
	 li $v0,print_string # print_string("...");
	 syscall
	 li $t2,0 # i = 0
	 li $t5, 0
for:    bge $t2, 32,endfor # while(i < 32) {
 	andi $t1,$t0,0x80000000
 	srl $t1, $t0, 31
 	sne $t7, $t5, 1 
 	seq $t8, $t1, 0 
 	and $t7, $t8, $t7
 	beq $t7, 1 , salta
 	li $t5, 1
 	rem $t4 , $t2, 4
 	bnez $t4 , espa�o
 	li $a0,' '					# print espa�o
	li $v0 ,print_char 
 	syscall
 espa�o:	 # (instru��o virtual)
 	addi $t7, $t1, 0x30
 	or $a0, $0, $t7
	li $v0 ,print_char
	syscall
 salta:	sll $t0 , $t0, 1	# value = value << 1;
	addi $t2, $t2, 1	 # i++;
	 j for # }
endfor:  jr $ra # fim do programa 

