	.data
	.text
	
itoa:
	addiu $sp,$sp,-20
	sw $ra,0($sp)
	sw $s0,4($sp)
	sw $s1,8($sp)
	sw $s2,12($sp)
	sw $s3,16($sp)
	
	
	move $s0,$a0    #s0-n
	move $s1,$a1	 #s1- b
	move $s2,$a2	 #s2-s
	
	move $s3,$s2 # s3 -p
	
do_itoa:
	rem $t0,$s0,$s1
	div $s0,$s1
	mflo $s0
	
	move $a0,$t0
	jal toascii
	sb $v0,0($s3)
	addi $s3,$s3,1

w_itoa:	bgt $s0,0,do_itoa
	
	li $t1,'\0'
	sb $t1,0($s3)
	move $a0, $s2
	jal strrev
	
	
	lw $ra,0($sp)
	lw $s0,4($sp)
	lw $s1,8($sp)
	lw $s2,12($sp)
	lw $s3,16($sp)
	
	addiu $sp,$sp,20
	jr $ra
	
	.data
	.text
	
toascii:
	move $t0,$a0
	li $t1,'0'
	li $t2,'9'
	
	add $t0,$t0,$t1
	
if_ascii:
	ble $t0,$t2,endif_ascii
	addi $t0,$t0,7

endif_ascii:
	move $v0,$t0

	


	jr $ra
	
	
	.data
	.text
strrev:
	addiu $sp,$sp,-16
	sw $ra,0($sp)
	sw $s0,4($sp)
	sw $s1,8($sp)
	lw $s2,12($sp)
	move $s0,$a0
	move $s1,$a0
	move $s2,$a0
	
while_strrev:
	lb $t0,0($s1)
	beq $t0,'\0',endw_strrev
	addi $s1,$s1,1
	j while_strrev
endw_strrev:
	sub $s1,$s1,1
	
	
while_strrev1:
	bge $s0,$s1,endw_strrev1
	move $a0,$s0
	move $a1,$s1
	jal exchange	
	addi $s0,$s0,1
	addi $s1,$s1,-1
	j while_strrev1
endw_strrev1:
	
	
	
	move $v0,$s2
	
	
	lw $ra,0($sp)
	lw $s0,4($sp)
	lw $s1,8($sp)
	lw $s2,12($sp)
	addiu $sp,$sp,16
	jr $ra
	
	
	.data
	.eqv MAX_STR_SIZE,33
	.align 2
str:	.space 33
	.text
	.globl main
	
main:	addiu $sp,$sp,-8
	lw $ra,0($sp)
	lw $s0,4($sp)
	
do_main:
	li $v0,5
	syscall
	move $s0,$v0
	move $a0,$s0
	li $a1,2
	la $a2,str
	jal itoa
	move $a0,$v0
	li $v0,4
	syscall

	
w_main:	bne $s0,0,do_main
	li $v0,0
	sw $ra,0($sp)
	sw $s0,4($sp)
	addiu $sp,$sp,8
	jr $ra
	
	
	.data
	.text
exchange:
	lb $t0,0($a0)  # char aux = *c1;
	
	lb $t1,0($a1)
	sb $t1,0($a0) #*c1 = *c2; 
	
	sb $t0,0($a1)

	jr $ra