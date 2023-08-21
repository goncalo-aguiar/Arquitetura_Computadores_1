
	 
	 
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
 toascii:
 	move $t0,$a0
 	li $t1,'0'
 	li $t2, '9'
 	addi $t0,$t0,$t1
 if_to:ble $t0,$t2,endif
 	addi $t0,$t0,7
 
 endif_to:
 	li $v0,$t0
 	jr $ra
 	
 	.data
	
# Mapa de registos
# n: $a0 -> $s0
# b: $a1 -> $s1
# s: $a2 -> $s2
# p: $s3
# digit: $t0
# Sub-rotina intermédia
itoa: 	addiu $sp,-20
 	sw $ra,0($sp)
 	sw $s0,4($sp) 
 	sw $s1,8($sp)
 	sw $s2,12($sp)
 	sw $s3,16($sp)
	move $s0,$a0 
 	move $s1,$a1 
 	move $s2,$a2 
 	              
 	move $s3,$a2 
 	li $t0,0
do: 	rem $t0,$s0,$s1				
	div $s0,$s0,$s1	
	move $a0,$t0
	jal toascii
	sb $v0,0($s3)
	addi $s3,$s3,1		
 	bgt $s0,0,do			
 	sb $0,0($s3) 			
	 
	
	
	la $a0,	$s2			
 	jal strrev 			
	 
	 				
	lw $ra,0($sp)												
 	lw $s0,	4($sp)		      
	lw $s1 ,12($sp)
	lw $s2,	16($sp)
	 addiu $sp,$sp,20			
	 jr $ra 

 
 # Mapa de registos
# str: $s0
# val: $s1
# O main é, neste caso, uma sub-rotina intermédia
 	.data
str: 	.space 33
 	.eqv STR_MAX_SIZE,33
 	.eqv read_int,5
 	.eqv print_string,4
 	.text
	 .globl main
main: 	addiu $sp,$sp,-12 # reserva espaço na stack
 	sw $s0, 4($sp)	# guarda registos $sx na stack
 	sw $s1, 8($sp)
 	sw $ra,0($sp)	# guarda $ra na stack
do_m: 				# do {
 	li $v0,read_int
 	syscall #
 	move $s1,$v0 # val = read_int()
 	la $a3,str
 	li $a1,2
 	move $a0 ,$s1
 	la $t9 ,itoa
 	jalr $t9
 	move $a0,$v0
 	li $v0,5
 	syscall
	bne $s1,0,do_m# } while(val != 0)
 	li $v0,0 # return 0;
 	
 	lw $ra,0($sp) # repõe registo $ra
 	lw $s0,4($sp)
 	lw $s1,8($sp)
 	addiu $sp,$sp,12 # liberta espaço na stack
 	jr $ra # termina programa 

	.data
	.text
	
exchange: 
	   lb $t0, 0($a0)
	   lb $t1, 0 ($a1)
	   sb $t0,0($a1)
	   sb $t1,0($a0)
	   jr $ra
 	
	 
	 						# 
