	.data
	.align 2
id:	.space 4
nome:	.space 18
last:	.space 15
	.align 2
nota:	.space 4
	.eqv MAX_STUDENTS,3
	.align 2
array:	.space 132
	.align 2
media:	.space 4
str:	.asciiz "\nMedia: "
	.text
	.globl main
	
main:
	addiu $sp,$sp,-8
	sw $ra,0($sp)
	sw $s0,4($sp)
	la $a0,array
	li $a1,MAX_STUDENTS
	jal read_data
	
	la $a0,array
	li $a1,MAX_STUDENTS
	la $a2, media
	jal max
	move $s0,$v0
	
	li $v0,4
	la $a0,media
	syscall
	
	li $v0,2
	l.s $f12,media
	syscall
	
	move $a0,$s0
	jal print_student
	

	
	lw $ra,0($sp)
	lw $s0,4($sp)
	addiu $sp,$sp,8
	jr $ra
	
	.data
str00:	.asciiz "\nN. Mec: "
str11:	.asciiz "\nPrimeiro Nome: "
str22:	.asciiz "\nUltimo Nome: "
str33:	.asciiz "\nNota: "
	.text
read_data:
	
	li $t0,0
	move $t1,$a0
	move $t2,$a1
for_read:
	bge $t0,$t2,endfor_read
	
	mul $t3,$t0,44
	add $t3,$t3,$t1
	
	li $v0,4
	la $a0,str00
	syscall
	li $v0,5
	syscall
	sw $v0,0($t3)
	
	li $v0,4
	la $a0,str11
	syscall
	li $v0,8
	addi $a0,$t3,4
	li $a1,18
	syscall
	
	li $v0,4
	la $a0,str22
	syscall
	li $v0,8
	addi $a0,$t3,22
	li $a1,15
	syscall
	
	li $v0,4
	la $a0,str33
	syscall
	li $v0,6
	syscall
	s.s $f0,40($t3)
	
	
	addi $t0,$t0,1
	j for_read
endfor_read:



	jr $ra
	
	
	.data
const:	.float -20.0
zero:	.float 0.0
	.text
	
max:
	l.s $f4,const
	l.s $f6,zero
	
	move $t0,$a0
	move $t1,$a1
	move $t2,$a2
	
	move $t3,$t0
	mul $t4,$t1,44
	add $t4,$t3,$t4
for_max:
	bge $t3,$t4,endf_max
	
	l.s $f8,40($t3)
	add.s $f6,$f6,$f8
if_max:c.le.s $f8,$f4
	bc1t endif_max
	mov.s $f4,$f8
	move $t5,$t3

endif_max:

	
	addi $t3,$t3,44
	j for_max
endf_max:

	mtc1 $t1,$f10
	cvt.s.w $f10,$f10
	div.s $f10,$f6,$f10
	s.s $f10,0($t2)
	move $v0,$t5

	jr $ra
	
	.data
	.text
	
print_student:
	
	move $t0,$a0
	
	lw $a0,0($t0)
	li $v0,1
	syscall
	addi $a0,$t0,4
	li $v0,4
	syscall
	addi $a0,$t0,22
	li $v0,4
	syscall
	l.s $f12,40($t0)
	li $v0,2
	syscall



	jr $ra



	