	.data
	.text
	
insert:
	addiu $sp,$sp,-28
	sw $ra,0($sp)
	sw $s0,4($sp)
	sw $s1,8($sp)
	sw $s2,12($sp)
	sw $s3,16($sp)
	sw $s4,20($sp)
	sw $s5,24($sp)
	
	move $s0,$a0  # s0-dst
	move $s1,$a1	# s1-src
	move $s2,$a2	# s2-pos
	
	move $s3,$s0	#s3-p
	
	move $a0,$s0
	jal strlen
	move $s4,$v0	#t0-len_dst
	
	move $a0,$s1
	jal strlen
	move $s5,$v0	#t1-len_src
	
if_insert:
	bgt $s2,$s4,endif_insert
	move $t2,$t0
for1_insert:
	blt $t2,$s2,endfor1_insert
	add $t3,$t2,$s0
	lb $t3,0($t3)
	add $t4,$t3,$s5
	sb $t3,0($t4)
	
	
	addi $t2,$t2,-1
	j for1_insert
endfor1_insert:
	li $t2,0
for2_insert:
	bge $t2,$s5,endfor2_insert
	
	add $t3,$s1,$t2
	lb $t3,0($t3)
	
	add $t4,$s0,$t2
	add $t4,$t4,$s2
	
	sb $t3,0($t4)
	
	addi $t2,$t2,1
	j for2_insert
endfor2_insert:


endif_insert:
	
	
	move $v0,$s3
	lw $ra,0($sp)
	lw $s0,4($sp)
	lw $s1,8($sp)
	lw $s2,12($sp)
	lw $s3,16($sp)
	lw $s4,20($sp)
	lw $s5,24($sp)
	addiu $sp,$sp,28
	jr $ra
	
	
	.data
	.text
	
read_str:
	addiu $sp,$sp,-8
	sw $ra,0($sp)
	sw $s0,4($sp)
	
	move $s0,$a0
	move $t1,$a1
	
	move $a0,$s0
	move $a1,$t1
	li $v0 ,8
	syscall
	
	move $a0,$s0
	jal strlen
	move $t2,$v0
	
if_read:
	addi $t3,$t2,-1
	add $t3,$s0,$t3
	lb $t4,0($t3)
	bne $t4,0x0A,endif_read
	li $t5,'\0'
	sb $t5,0($t3)
	

endif_read:
	
	
	
	
	lw $ra,0($sp)
	lw $s0,4($sp)
	addiu $sp,$sp,8
	jr $ra
	
	.data
	.align 2
str1:	.space 100
	.align 2
str2:	.space 50
str3:	.asciiz "Enter a string: "
str4:	.asciiz "Enter a string to insert: "
str5:	.asciiz "Enter the position: "
str6:	.asciiz "Original string: "
str7:	.asciiz"\nModified string: "

	.text
	.globl main
	
main:
	addiu $sp,$sp,-4
	sw $ra,0($sp)
	
	la $a0,str3
	li $v0,4
	syscall
	la $a0,str1
	li $a1,50
	li $v0,8
	syscall
	
	
	la $a0,str4
	li $v0,4
	syscall
	li $v0,8
	la $a0,str2
	li $a1,50
	syscall
	
	la $a0,str5
	li $v0,4
	syscall
	li $v0,5
	syscall
	move $t0,$v0
	
	li $v0,4
	la $a0,str6
	syscall
	li $v0,4
	la $a0,str1
	syscall
	
	la $a0,str1
	la $a1,str2
	move $a2,$t0
	
	jal insert
	
	
	li $v0,4
	la $a0,str7
	syscall
	li $v0,4
	la $a0,str1
	syscall
	
	li $v0,0
	
	
	
	
	
	
	lw $ra,0($sp)
	addiu $sp,$sp,4
	jr $ra
	
.data
	.text

strlen: li $t1,0 # len = 0;
while:  
	lb $t0,0($a0)# while(*s++ != '\0')
 	addiu $a0,$a0,1 #
 	beq $t0,'\0',endw # {
 	addi $t1,$t1,1 # len++;
 	j while # }
endw:   move $v0,$t1 # return len;
 	jr $ra 
 	
 	
