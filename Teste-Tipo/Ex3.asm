	.data
	.align 2
str1:	.space 25
	.align 2
str2:	.space 25

	.text
	.globl main

main:	li $v0,8
	la $a0 ,str1
	li $a1 ,25
	syscall
	li $v0, 5
	syscall
	move $t0,$v0  #a = read
	li $v0,5
	syscall
	move $t1,$v0	#b = read
	la $t2,str2
	li $t3, '\0'
	sb $t3,0($t2)
	li $t2, 0  #i =0
	li $t3,0   #j = 0
if:	ble $t1,$t0,endif
while:	sge $t4,$t2, $t0
	la $t7,str1
	add $t7,$t7,$t2
	lb  $t5,0($t7)
	li $t6, '\0'
	seq $t6,$t5,$t6
	or $t6,$t4,$t6
	beq $t6,1,endw
	addi $t2,$t2,1
	j while
endw:

while2:	sgt $t4,$t2,$t1
	la $t7,str1
	add $t7,$t2,$t7
	lb $t5,0($t7)
	li $t6, '\0'
	seq $t6,$t6,$t5
	or $t6,$t6,$t4
	beq $t6,1,endw2
	la $t7,str1
	add $t7, $t7,$t2
	lb $t8,0($t7)
	la $t7,str2
	add $t7,$t7,$t3
	sb $t8,0($t7)
	
	
	j while2
	
endw2:
	li $t8, '\0'
	la $t7,str2
	add $t7,$t7,$t3
	sb $t8,0($t7)

endif:	la $a0, str2
	li $v0,4
	syscall
	jr $ra
	
	
	
	