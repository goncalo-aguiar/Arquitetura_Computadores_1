	.data
 	.text
	 .globl main
main: ori $t0, $0 , 0x02 # t0 = num em cod gray
      srl $t1, $t0, 4   # t1 = num >> 4
      xor $t1 , $t1 , $t0 # t1 = num >> 4 xor num
      srl $t3, $t1, 2   # t1 = num >> 2
      xor $t4 , $t3 , $t1 # t1 = num >> 2 xor num
      srl $t5, $t4, 1   # t1 = num >> 1
      xor $t2 , $t5 , $t4 # t1 = num >> 1 xor num
      jr $ra # fim do programa
      
      