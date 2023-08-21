# Mapa de registos
# n: $a0 -> $s0
# b: $a1 -> $s1
# s: $a2 -> $s2
# p: $s3
# digit: $t0
# Sub-rotina intermédia

	.data
	.text
	.globl itoa, toascii
itoa: 	addiu $sp,$sp,-20 # reserva espaço na stack
 	sw $ra ,0($sp)
 	sw $s0 ,4($sp)
 	sw $s1 ,8($sp)
 	sw $s2 ,12($sp)
 	sw $s3 ,16($sp)
 	move $s0,$a0 # copia n, b e s para registos
 	move $s1,$a1 
 	move $s2,$a2
 	
 	move $s3,$a2 # p = s;
 	li $t0,0
do_itoa: 
	rem $t0,$s0,$s1
	div $s0,$s0,$s1 
	move $a0,$t0
	jal toascii
	sb $v0,0($s3)
	addiu $s3,$s3,1
 	bgt $s0,0,do_itoa # } while(n > 0);
 	sb $0,0($s3) # *p = 0;
	move $a0,$s2
 	jal strrev # strrev( s );
 	
 	
 	 # repõe registos $sx e $ra
 	lw $ra,0($sp)
 	lw $s0,4($sp)
 	lw $s1,8($sp)
 	lw $s2,12($sp)
 	lw $s3,16($sp)
 	addiu $sp,$sp,20 # liberta espaço na stack
 	jr $ra # 
 	
 	.data
 	.text
 toascii:
 	
 	addi $a0,$a0,'0'
 	ble $a0,'9',toascii_endif
 	addi $a0,$a0,7
 
toascii_endif: 
	move $v0,$a0
 	jr $ra
