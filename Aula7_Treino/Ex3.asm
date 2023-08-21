#char *strcpy(char *dst, char *src)
#{
 #int i=0;
 #do
 #{
 #dst[i] = src[i];
 #} while(src[i++] != '\0');
 #return dst; 
 
 	.data
 	.text
 strcpy: move $t0, $a0
 	 move $t1,$a1
 	 li $t2 ,0
 	 
do:	
	add $t4, $t0,$t2
	add $t5, $t1,$t2
	lb $t5,0($t5)
	sb $t5,0($t4)

	addi $t2,$t2,1
	add $t3,$t1,$t2
	lb $t3,0($t3)
while:  bne $t3, '\0' ,do
	move $v0,$t0
 	 jr $ra
 	 
	.data
	.eqv  STR_MAX_SIZE,30
str3: 	.asciiz "String too long:"
str4:	.asciiz "\n"
str1:	.asciiz "I serodatupmoC ed arutetiuqrA"
	.align 2
str2: 	.space 31

	.text
	.globl main
	
main:
	addi $sp,$sp,-8
	sw $ra ,0($sp)
	sw $s1 , 4($sp)
	
if: 	la $a0, str1
	jal strlen
	bgt $v0, STR_MAX_SIZE,else
	la $a0, str2
	la $a1, str1
	jal strcpy
	move $a0,$v0
	li $v0,4
	syscall
	la $a0, str4
	li $v0,4
	syscall
	la $a0 , str2
	jal strrev
	move $a0,$v0
	li $v0, 4
	syscall
	li $s1,0
	j endif
else:	
	la $a0, str3
	li $v0,4
	syscall
	la $a0, str1
	jal strlen
	move $a0,$v0
	li $v0,1
	syscall
	li $s1,-1

	
endif:	move $v0, $s1
	lw $ra, 0($sp)
	lw $s1, 4($sp)
	addi $sp,$sp,8
	jr $ra
	
	
	
.data
	.text
strrev: addiu $sp,$sp,-16 # reserva espaço na stack
 	sw $ra,0($sp) # guarda endereço de retorno
 	sw $s0,4($sp) # guarda valor dos registos
 	sw $s1,8($sp) # $s0, $s1 e $s2
 	sw $s2,12($sp) #
 	move $s0,$a0 # registo "callee-saved"
 	move $s1,$a0 # p1 = str
 	move $s2,$a0 # p2 = str
while1: lb $t0, 0($s2)# while( *p2 != '\0' ) {
 	beq $t0, '\0' ,endw1
 	addiu $s2,$s2,1 # p2++;
 	j while1 # }
endw1: 	sub $s2,$s2,1 # p2--;
while2: bge $s1,$s2,endw2  # while(p1 < p2) {
 	move $a0,$s1 #
 	move $a1,$s2 #
 	jal exchange # exchange(p1,p2)
 	addi $s1,$s1,1
 	sub $s2,$s2,1
 	j while2 # }
endw2:	 move $v0,$s0 # return str
 	lw $ra,0($sp) # repõe endereço de retorno
 	lw $s0,4($sp) # repõe o valor dos registos
 	lw $s1,8($sp) # $s0, $s1 e $s2
 	lw $s2,12($sp) #
 	addiu $sp,$sp,16 # liberta espaço da stack
 	jr $ra # termina a sub-rotina 
 	
 	
	.data
	.text
	
exchange: 
	   lb $t0, 0($a0)
	   lb $t1, 0 ($a1)
	   sb $t0,0($a1)
	   sb $t1,0($a0)
	   jr $ra
	   
	.data
	.text

strlen: li $t1,0 # len = 0;
whilef:  lb $t0,0($a0) # while(*s++ != '\0')
	 addiu $a0,$a0,1 #
	 beq $t0,'\0',endw # {
	 addi $t1,$t1,1 # len++;
 	 j whilef # }
endw:   move $v0,$t1 # return len;
 	jr $ra	   
	   

 	 
 	 
 	 
 	 