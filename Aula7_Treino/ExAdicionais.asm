	.data
	.text

insert:
	move $t0,$a0
	move $t1,$a1
	move $t2,$a2
	move $t3,$a3
	
if:	ble $t2,$t3,else
	li $v0,1
	j endif
else:
for:	addi $t4, $t3,1
	blt $t4,$t2,endfor
	sll $t5,$t4,2
	add $t5,$t0,$t5
	lw $t6,0($t5)
	sw $t6,4($t5)
	addi $t4,$t4,-1
	j for
endfor:	sll $t7,$t2,2
	add $t7,$t0,$t7
	sw $t1,0($t7)
	li $v0,0
endif:
	jr $ra
	
	
	.data
virgula:.asciiz ", "
	.text
print_array:
	
	sll $a1,$a1,2
	add $t0,$a0,$a1
	move $t1,$a0
for2:	bge $t1,$t0,endfor2
	li $v0,1
	lw $a0,0($t2)
	syscall
	li $v0,4
	la $a0,virgula
	
	addi $t1,$t1,4
	j for2
endfor2:
	jr $ra
	
	
	.data
str:	.asciiz "Size of array :"
str1:	.asciiz "array["
str2:	.asciiz "] = "
str3: 	.asciiz "Enter the value to be inserted: "
str4:	.asciiz "Enter the position: "
str5:	.asciiz "\nOriginal array: "
str6:	.asciiz "\nModified array: "
	.align 2
array:	.space 200
	.text
	.globl main
	
main:
	addi $sp,$sp,-4
	sw $ra ,0($sp)
	
	
	li $v0,4
	la $a0,str
	syscall
	li $v0,5
	syscall
	move $t1,$v0
	li $t0,0
for_m:	bge $t0,$t1,endfor_m
	
	li $v0,4
	la $a0,str1
	syscall
	li $v0,1
	move $a0,$t0
	syscall
	li $v0,4
	la $a0,str2
	syscall
	sll $t2,$t0,2
	la $t3,array
	add $t2, $t3,$t2
	li $v0,5
	syscall
	lw $v0,0($t2)
	
	addi $t0,$t0,1
	j for_m
endfor_m:
	la $a0, str3
	li $v0, 4
	syscall
	li $v0,5
	syscall
	move $t4 , $v0   # insert value
	la $a0,str4
	syscall
	li $v0 , 5
	syscall
	move $t5, $v0   #insert pos
	li $v0,4
	la $a0, str5
	syscall
	la $a0,array
	move $a1,$t1
	jal print_array
	la $a0,array
	move $a1, $t4
	move $a2,$t5
	move $a3,$t1
	jal insert
	li $v0,4
	la $a0,str6
	syscall
	la $a0,array
	addi $t7,$t1,1
	move $a1,$t7
	jal print_array
	li $v0,0
	
	
	
	


	
	lw $ra ,0($sp)
	addi $sp,$sp,4
	jr $ra
