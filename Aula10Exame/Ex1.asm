	.data
	.text
	
xtoy:
	addiu $sp,$sp,-20
	sw $ra,0($sp)
	sw $s0,4($sp)
	s.s $f20,8($sp)
	sw $s1,12($sp)
	s.s $f22,16($sp)
	
	mov.s $f20,$f12   # f20-x
	move $s0,$a0	#s0-y
	
	li $s1,0     #i - s1
	li $t0,1
	mtc1 $t0,$f22
	cvt.s.w $f22,$f22 #f22-result
	move $a0,$s0
	jal abs
	move $t0,$v0
for_xtoy: 
	bge $s1,$t0,end_for_xtoy
if_xtoy:
	ble $s0,0,else_xtoy
	mul.s $f22,$f22,$f20
	j endif_xtoy
else_xtoy:
	div.s $f22,$f22,$f20

endif_xtoy:
	
	addi $s1,$s1,1
	j for_xtoy
end_for_xtoy:
	mov.s $f0,$f22
	
	
	
	
	lw $ra,0($sp)
	lw $s0,4($sp)
	l.s $f20,8($sp)
	lw $s1,12($sp)
	s.s $f22,16($sp)
	addiu $sp,$sp,20
	jr $ra
	
	.data
	.text
abs:
	move $t0,$a0
	li $t1,-1
if_abs:
	bge $t0,0,endif_abs
	mult $t0,$t1
	mflo $t0

endif_abs:
	move $v0,$t0
	jr $ra
	
	.data
const:	.float 2.0
	.text
	.globl main
	
main:	addiu $sp,$sp,-4
	sw $ra,0($sp)
	l.s $f12,const
	li $a0,-2
	jal xtoy
	mov.s $f12,$f0
	li $v0,2
	syscall
	lw $ra,0($sp)
	addiu $sp,$sp,4
	jr $ra