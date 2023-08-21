	.data
zero:	.double 0.0
	.text
	
fun1:
	move $t0,$a0  #a - t0
	move $t1,$a1 # N -t1
	move $t2,$a2 # b -t2
	
	li $t3,0 #int k = 0;
	
	move $t4,$t0 # p = a 
	
	sll $t5,$t1,3
	addu $t5,$t0,$t5
for:
	bge $t4,$t5,endf
	l.d $f4,0($t4)
	li $t6,2
	mtc1 $t6,$f6
	cvt.d.w $f6,$f6
	div.d $f6,$f4,$f6
	l.d $f8,zero
if:	c.eq.d $f6,$f8
	bc1t else
	s.d $f4,0($t2)
	addi $t2,$t2,8
	j endif
else:
	addi $t3,$t3,1
	

endif:
	
	addi $t4,$t4,8
	j for
endf:
	sub $v0,$t1,$t3
	jr $ra



	