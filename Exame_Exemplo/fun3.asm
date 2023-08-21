	.data
zero:	.float 0.0
	.text
fun3:
	move $t0,$a0
	move $t1,$a1
	
	l.s $f4,zero
	
	li $t2,0
for_fun3:
	bge $t2,$t1,endfor_fun3
	mul $t3,$t2,64
	addu $t3,$t0,$t3
	addiu $a0,$t3,0
	li $v0,4
	syscall
	
	
	l.s $f12,56($t3)
	li $v0,2
	syscall
	
	add.s $f4,$f4,$f12
	
	addi $t2,$t2,1
	j for_fun3
endfor_fun3:
	li $t6,2
	mtc1 $t6,$f6
	cvt.s.w $f6,$f6
	div.s $f0,$f4,$f6



	jr $ra
	
	.data
	.align 2
name:	.asciiz "Rei Eusebio"
	.space 38
num:	.word 12345
grade:	.float 17.2
type: 	.byte 'F'
	
	.align 2
name1:	.asciiz "Rainha Amalia"
	.space 36
num2:	.word  23450
grade2:	.float  12.5
type2: 	.byte 'C'
	

	.text
	.globl main
main:
	addiu $sp,$sp,-4
	sw $ra,0($sp)
	
	la $a0,name
	li $a1,2
	jal fun3
	mov.s $f12,$f0
	li $v0,2
	syscall
	li $v0,-1
	lw $ra,0($sp)
	addiu $sp,$sp,4
	jr $ra