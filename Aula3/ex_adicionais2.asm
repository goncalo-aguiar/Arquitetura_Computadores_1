	# t0- res
	#t1- i
	# t2 - mdor
	#t3 - mdo
	
	
	.data
	str1 : .asciiz "Introduza dois numeros:"
	str2 : .asciiz "\nResultado:"
	.text
	.globl main

main: li $t0, 0
	li $t1, 0		#unsigned int res=0, i=0, mdor, mdo; 

      	la $a0, str1
      	li $v0 , 4           # print string
     	 syscall
      ori $v0 , $0 , 5      #
      	syscall			#
      add $t2 , $0, $v0	#   read ints
      ori $v0 , $0 , 5		#
      syscall			#
      add $t3 , $0, $v0       #
      andi $t2, $t2, 0x0F	
      andi $t3, $t3, 0x0F
while:     seq $t4 ,$t2, 0	#!(mdor != 0)
      addi $t1, $t1 , 1	#i++
      sge $t5 , $t1, 4		# !(i++ < 4)
      	or $t6 , $t5 , $t4     # ||
       beq $t6 , 1 , salta	# branch se o || der 1
          andi $t7 ,$t2, 1    #
          beqz $t7 , salta2   #(mdor & 0x00000001) != 0
          add $t0, $t0 ,$t3
 salta2:  sll $t3 , $t3, 1
 	  srl $t2, $t2 , 1
 	 
 	  j while   
      
salta: la $a0, str2
	li, $v0, 4
	syscall
	or $a0, $0, $t0
	li $v0,1
	syscall
	jr $ra
      



	
