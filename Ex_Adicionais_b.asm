#t0- p
#t1 - ix4
#t2 - lista
#t3 -lista + ix4	
#t4- j
	
	.data
	.eqv SIZE 10
str :  .asciiz "Introduza um numero:"
	.align 2
lista: .space	40
	.text
	.globl main
	
main:  
	la $t0, lista
	addi $t1 ,$t0,39
	
for:	bge $t0, $t1,endfor
       la $a0, str
       li $v0,4
       syscall
       li $v0, 5
       syscall
       
       sw $v0, 0($t0)
       addi $t0,$t0,4
       j for
endfor: li $t0,0
#	li $t4,0
#for2: bge $t0,9, endfor2
#	addi $t4, $t0,1
#for3:	bge $t4, 10,endfor3
#if:	la $t2, lista
#	sll $t1,$t0,2
#	sll $t6,$t4,2
#	add $t3, $t2,$t1
#	add $t5, $t2,$t6
#	lw $t8 ,0($t3)
#	lw $t9 , 0($t5)
#	bge $t8, $t9 ,endif
#	sw $t8, 0($t5)
#	sw $t9, 0($t3)
#endif:	addi $t4, $t4,1
#	j for3
#endfor3:	
#	addi $t0,$t0,1
#	j for2
#endfor2:
	jr $ra