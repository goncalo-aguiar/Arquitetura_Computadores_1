	.data
	.align 2
array:	.space 176

	.eqv MAX_STUDENTS,1
	.align 2
media:	.space 4

str1:	.asciiz "\nMedia:"

	.text
	.globl main
	
main:
	addiu $sp,$sp,-4
	sw $ra,0($sp)
	
	la $a0, array
	li $a1, MAX_STUDENTS
	jal read_data
	
	la $a0, array
	li $a1, MAX_STUDENTS
	la $a2, media
	jal max
	move $t0,$v0
	li $v0,4
	la $a0,str1
	syscall
	li $v0,2
	l.s $f4,media
	syscall
	move $a0,$v0
	jal print_student
	lw $ra, 0($sp)
	addiu $sp,$sp,4
	jr $ra
	
	
	.data
str2:	.asciiz "\nN. Mec: " 
str3:	.asciiz "\nPrimeiro Nome: "
str4:	.asciiz "\nUltimo Nome: "
str5:	.asciiz "\nNota: "
	.text
	
read_data:
	li $t0,0
	move $t2,$a0
	move $t1,$a1
	
for_read:
	bge $t0,$t1,end_for_read
	li $t5,44
	
	mult $t0,$t5
	mflo $t3
	add $t3,$t2,$t3
	         
	
	li $v0,4
	la $a0,str2
	syscall
	li $v0,5
	syscall
	sw $v0,0($t3)
	
	
	
	
	li $v0,4
	la $a0,str3
	syscall
	li $v0,8
	addi $a0,$t3,4
	li $a1,18
	syscall
	
	
	
	li $v0,4
	la $a0,str4
	syscall
	li $v0,8
	addi $a0,$t3,22
	li $a1,15
	syscall
	
	
	
	li $v0,4
	la $a0,str5
	syscall
	li $v0,6
	syscall
	s.s $f0,40($t3)
	
	
	addi $t0,$t0,1
	j for_read
end_for_read:
	jr $ra
	
	
	.data
const:	.float -20.0
const2:	.float 0.0
	.text
	
max:
	
	move $t0,$a0
	move $t1,$a1
	move $t2,$a2
	
	l.s $f4,const
	l.s $f6, const2
	
	li $t9,44
	mult $t1,$t9
	mflo $t3
	add $t3,$t0,$t3
for_max:bgt $t0,$t3,end_formax
	l.s $f8, 40($t0)
	add.s $f6,$f6,$f8
if_max: c.le.s $f8,$f4 
	bc1t endif_max
	mov.d $f4,$f8
	move $v0,$t0
endif_max:	
	addi $t0,$t0,44
	j for_max
end_formax:


	mtc1 $t1,$f10
	cvt.s.w $f10,$f10
	div.s $f10,$f6,$f10
	s.s $f10,0($a2)
	jr $ra
	
	
