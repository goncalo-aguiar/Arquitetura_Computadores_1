 	.data
 	.text
 	.globl main
main:   ori $t0,$0, 0xFFFE # substituir val_1 
 	nor $t1,$t0, $t0 # $t1 = ~($t0 | $t1) (or bit a bit)
 	
 	
 	jr $ra # fim do programa
 	
 	
 	
 	#input = 1111 1111 1111 1110              0 | 0  =0 / 0 | 1 =1 /  1 | 0  =1/  1 | 1 =1 / 
 	#input = 1111 1111 1111 1110
 	#nor =   0000 0000 0000 0001
 	# Fiz com nor mas tambem da com   INPUT xor (tudo a 1) 
 					 # INPUT nor (tudo a 0)
 	