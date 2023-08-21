# $t0 - gray
#t1- mask
# t2 - bin

	.data
	str1: .asciiz "Introduza um numero:"
	str2 : 	.asciiz 	"\nValor em código Gray: "
	str3 : 	.asciiz 	"\nValor em binario: "
	.text
	.globl main

main: la $a0, str1
      li , $v0 , 4		#print string inicial
      syscall
      li $v0, 5
      syscall
      add $t0 , $0, $v0      # read do inteiro 
      srl $t1 , $t0 , 1
      move $t2, $t0
      beqz $t1, salta
      xor $t2 , $t2 , $t1
      srl $t2, $t2, 1
salta:la $a0, str2
      li , $v0 , 4		#print string inicial
      syscall
      or $a0 , $t0, $0
      li $v0 , 34
      syscall
      la $a0, str3
      li , $v0 , 4		#print string inicial
      syscall
      or $a0 , $t2 , $0
      li $v0 , 34
      syscall
      jr $ra
      
      