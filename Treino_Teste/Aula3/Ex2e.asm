	.data
str1:	.asciiz  "Introduza um numero: "
str2:	.asciiz	 "\nO valor em binário e': "
	.text
	.globl main

main:   li $v0, 4	# {
	la $a0, str1   #
	syscall        #                      print_string("Introduza um numero: ");
 	li $v0, 5       #			value = read_int();
	syscall          #
	move $t1,$v0     #
	li $v0, 4       #	print_string("\nO valor em binário e': "); 
	la $a0, str2     #
	syscall          #
	li $t0,0
	li $t5,0
for:   bge $t0,32,endfor
	
	rem $t3,$t0,4
	andi $t2,$t1, 0x80000000
	srl $t2 ,$t2,31
if2:	sne $t6,$t5, 1
	seq $t7, $t2,0
	and $t6,$t6,$t7
if1:	beq $t6,1 ,endif2
	li $t5,1
	bnez $t3,endif1
	li $v0, 11
	li $a0, ' '
	syscall
	
endif1:addi $a0, $t2,0x30
	li $v0, 11
	syscall
endif2:	
	sll $t1,$t1,1
	addi $t0,$t0,1
	j for
endfor: jr $ra