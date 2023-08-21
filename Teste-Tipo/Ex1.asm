	.data
	.eqv N,3
	.align 2
array_a:.space 35
	.align 2
array_b:.space 35
	.text
	.globl main
	
main:   li $t0, 0    #int n_even = 0;
 		
	li $t1, 0	#int n_odd = 0; 
	
	la $t2,array_a # p1 = a
	
	li $t4, N
	sll $t4, $t4,2
	add $t4, $t2,$t4
for:	bge $t2, $t4, endfor			#for( p1 = a; p1 < (a + N); p1++ ) 
	li $v0,5					# { 
	syscall
	sw $v0, 0($t2)				#*p1=read_int(); 
	addiu $t2,$t2,4
	j for				# } 
endfor:
	la $t2,array_a # p1 = a
	la $t3,array_b # p2 = b
for2: 	bge $t2,$t4,endfor2
	lw $t5,0($t2)
	rem $t5,$t5,2
	beqz $t5, else
	lw $t6, 0($t2)
	sw $t6,4($t3)
	addi $t1,$t1,1
	j endif
else:
	addi $t0,$t0,1
endif:	
	
	addiu $t2,$t2,4
	
	j for2
endfor2:
	la $t3,array_b # p2 = b
	add $t4, $t3,$t1
for3: 	bge $t3, $t4,endfor3
	li $v0,1
	lw $a0,0($t3)
	syscall
	addi $t3,$t3,4
	j for3
endfor3:jr $ra

	


