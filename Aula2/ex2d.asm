	.data
 	.text
	 .globl main
main: ori $t0, $0 , 4 #t0 = bin
      
      srl $t1, $t0, 1 #t2 = bin >>1
      xor $t1 , $t0 , $t1 # t1 = bin xor (bin >>1)
      