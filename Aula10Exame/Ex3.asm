	.data
zero:	.float 0.0
	.text
var:
	addiu $sp,$sp,-20
	sw $ra,0($sp)
	sw $s0,4($sp)
	sw $s1,8($sp)
	sw $s2,12($sp)
	s.s $f20,16($sp)
	
	
	move $s0,$a0 #double *array
	move $s1,$a1 # int nval
	
	jal average
	cvt.s.d $f4,$f0
	li $s2,0 #i=0
	l.s $f20,zero	#soma=0.0
	
for_var:
	bge $s2,$s1,endfor_var
	sll $t0,$s2,3
	addu $t0,$t0,$s0
	l.d $f6,0($t0)
	cvt.s.d $f6,$f6
	sub.s $f12,$f6,$f4
	li $a0,2
	jal xtoy
	add.s $f20,$f20,$f0
	
	
	addi $s2,$s2,1
	j for_var
endfor_var:	
	mtc1 $s1,$f8
	cvt.d.w $f8,$f8
	cvt.d.s $f20,$f20
	div.d $f0,$f20,$f8
	
	lw $ra,0($sp)
	lw $s0,4($sp)
	lw $s1,8($sp)
	lw $s2,12($sp)
	l.s $f20,16($sp)
	addiu $sp,$sp,20
	jr $ra
	
		
	.data
	.align 3
a:	.space 80
	.eqv SIZE,10
	.text
	.globl main
	
main:

	addiu $sp,$sp,-4
	sw $ra,0($sp)
	li $t0,0
	la $t1,a
for_main:
	bge $t0,SIZE,endfor_main
	sll $t2,$t0,3
	add $t2,$t1,$t2
	li $v0,5
	syscall
	move $t3,$v0
	mtc1 $t3,$f4
	cvt.d.w $f4,$f4
	s.d $f4,0($t2)
	
	
	
	
	addi $t0,$t0,1
	j for_main
endfor_main:
	la $a0,a
	li $a1,SIZE
	jal var
	mov.d $f12,$f0
	li $v0,3
	syscall
	
	la $a0,a
	li $a1,SIZE
	jal stdev
	mov.d $f12,$f0
	li $v0,3
	syscall

	lw $ra,0($sp)
	addiu $sp,$sp,4
	jr $ra
	
	
	
	.data
const:	.double 0.0
	.text
	
average:
	move $t0,$a0	#t0-array
	move $t1,$a1	#t1-n
	
	move $t2,$t1 #int i = n; 
	l.d $f4,const #double sum = 0.0; 
	
for_average:
	ble $t2,0,endfor_average
	sll $t3,$t2,3
	sub $t3,$t3,8
	add $t3,$t0,$t3
	l.d $f6,0($t3)
	add.d $f4,$f4,$f6
	
	subu $t2,$t2,1
	j for_average
endfor_average:
	
	mtc1 $t1,$f8
	cvt.d.w $f8,$f8
	div.d $f0,$f4,$f8
	jr $ra
	
	
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
	.text
stdev:
	addiu $sp,$sp,-4
	sw $ra,0($sp)
	
	jal var
	mov.d $f12,$f0
	jal sqrt
	
	lw $ra,0($sp)
	addiu $sp,$sp,4
	
	jr $ra
	
	
	
	.data
numero:	.double 0.5
	.text

sqrt:
	
	
	mov.d $f4,$f12                     # double val-> f4
	li $t0,1				
	mtc1 $t0,$f6
	mtc1 $t0,$f8
	cvt.d.w $f6,$f6				#double aux-> f6
	cvt.d.w $f8, $f8			#double xn -> f8
	li $t0,0				#i -> t0
	li $t1,0
	mtc1 $t1,$f10
if:	
	c.le.d $f4, $f10
	bc1t else
do:
	mov.d $f6,$f8
	div.d $f16,$f4,$f8
	add.d $f8,$f16,$f8
	l.d $f16,numero
	mul.d $f8,$f8, $f16
	addi $t0,$t0,1
while:	blt $t0,25,do
	
	c.eq.d $f6,$f8
	bc1f do
	
	
	j endif
else:

	mov.d $f8,$f10
endif:	
	
	mov.d $f0,$f8
	
	jr $ra
	