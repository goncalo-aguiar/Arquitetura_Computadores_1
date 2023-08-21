# Mapa de registos
# num: $t0
# p: $t1
# *p: $t2
	 .data
	 .eqv SIZE,20
str:	 .space 20
	 .text
 	.globl main
main: 	la $a0,str
	li $a1 , SIZE
	addi $v0, $0,8
	syscall
	 la $t1,str # p = str;
while: # while(*p != '\0')
	 lb $t2,0($t1) #
	 beq $t2,'\0',endw # {
	 blt $t2,'0',endif # if(str[i] >='0' &&
	 bgt $t2,'9',endif # str[i] <= '9')
	 addi $t0,$t0,1 # num++;
endif:
	 addiu $t1,$t1,1 # p++;
	 j while
endw: move $a0 , $t0 # print_int10(num);
  	ori $v0 , $0, 1
  	syscall
 	jr $ra # termina o programa 