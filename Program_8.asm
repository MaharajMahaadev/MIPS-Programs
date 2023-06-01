# Maharaj Mahaadev
# E20CSE085

.text
	li $v0 4 			# For printing input prompt
	la $a0 prompt
	syscall
	
	li $v0 8 			# syscall to take string input in A
	la $a0 A
	la $a1 100
	syscall
	
	la $t0 A 			# load A
	la $t1 B 			# load B
loop: 					# loop to iterate over A and B
	lb $t2 0($t0) 			# get A[i]
	sb $t2 0($t1) 			# store above in B[i]
	add $t0 $t0 1 			
	add $t1 $t1 1 		
	bne $t2 $zero loop 		# looping
	li $v0 4 			# print copied string B
	la $a0 B
	syscall
	
	li $v0 10 			
	syscall

.data
	A: .space 100 			
	B: .space 100 			
	prompt: .asciiz "Enter string: "
