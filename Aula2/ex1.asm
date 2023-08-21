 	.data
 	.text
	 .globl main
main:   ori $t0,$0, 0x1234 # substituir val_1 e val_2 pelos
 	ori $t1,$0, 0x000F  # valores de entrada desejados
 	and $t2,$t0,$t1 # $t2 = $t0 & $t1 (and bit a bit)
 	or $t3, $t0, $t1 # $t3 = $t0 | $t1 (or bit a bit)
 	nor $t4,$t0, $t1 # $t4 = ~($t0 | $t1) (or bit a bit)
 	xor $t5,$t0, $t1 # $t5 = $t0 ^ $t1 (or bit a bit)
 	jr $ra # fim do programa
 	
 	#  0x1234 = 0001 0010 0011 0100
 	#  0x000F = 0000 0000 0000 1111
 	#  and =    0000 0000 0000 0100
 	#  or  =    0001 0010 0011 1111   
 	# nor =     1110 1101 1100 0000
 	# xor =      0001 0010 0011 1011