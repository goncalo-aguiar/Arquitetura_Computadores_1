	.data
	.text
	
insert:
	move $t0,$a0
	move $t1,$a1
	move $t2,$a2
	move $t3,$a3
	
if_insert:
	ble $t2,$t3,else_insert
	li $v0,1
	j endif_insert
else_insert:
	move $t5,$t3
	sub $t5,$t5,1
	
for_insert: 
	blt $t5,$t2,endfor_insert
	sll $t6,$t5,2
	add $t6,$t0,$t5
	lw $t7,0($t6)
	sw $t7,4($t6)
	addi $t5,$t5,-1
	j for_insert
endfor_insert:
	sll $t8,$t2,2
	add $t8 ,$t0,$t8
	sw $t1,0($t8)
	li $v0,0
endif_insert:
	jr $ra
	
	
	.data
str1111:.asciiz " , "
	.text
print_array:
	move $t0,$a0
	move $t1,$a1
	
	sll $t2,$t1,2
	add $t2,$t2,$t0
	
for_print:
	bge $t0,$t2,endfor_print
	lw $a0,0($t0)
	li $v0,1
	syscall
	li $v0,4
	la $a0, str1111
	syscall
	addi $t0,$t0,4
	j for_print
endfor_print:


	jr $ra
	
	.data
	.align 2
array:	.space 200
str1:	.asciiz "Size of array :"
str2:	.asciiz "array["
str3:	.asciiz "] = "
str4:	.asciiz "Enter the value to be inserted: "
str5:	.asciiz "Enter the position: "
str6:	.asciiz "\nOriginal array: "
str7:	.asciiz "\nModified array: "


	.text
	.globl main
	
main:
	addiu $sp,$sp,-20
	sw $ra, 0($sp)
	sw $s0,4($sp)
	sw $s1,8($sp)
	sw $s2,12($sp)
	sw $s3,16($sp)
	
	la $s1,array
	li $v0,4
	la $a0, str1
	syscall
	li $v0,5
	syscall
	move $s0,$v0
	li $t0,0
for_main:
	bge $t0,$s0,endfor_main
	sll $t1,$t0,2
	li $v0,4
	la $a0,str2
	syscall
	li $v0,1
	move $a0,$t0
	syscall
	li $v0,4
	la $a0,str3
	syscall
	li $v0,5
	syscall
	add $t1,$t1,$s1
	sw $v0,0($t1)
	addi $t0,$t0,1
	j for_main
endfor_main:
	li $v0,4
	la $a0,str4
	syscall
	li $v0,5
	syscall
	move $s2,$v0
	
	li $v0,4
	la $a0,str5
	syscall
	li $v0,5
	syscall
	move $s3,$v0
	
	li $v0,4
	la $a0,str6
	syscall
	move $a0,$s1
	move $a1,$s0
	jal print_array
	
	move $a0,$s1
	move $a1,$s2
	move $a2,$s3
	move $a3,$s0
	jal insert
	
	la $a0,str7
	li $v0,4
	syscall
	
	move $a0,$s1
	move $a1,$s0
	addi $a1,$a1,1
	jal print_array
	
	li $v0,0
	
	
	
	lw $ra,0($sp)
	lw $s0,4($sp)
	lw $s1,8($sp)
	lw $s2,12($sp)
	lw $s3,16($sp)
	addiu $sp,$sp,20
	jr $ra