# Maharaj Mahaadev
# E20CSE085
.text 
.globl main

main:
	la $a0, size 					# For printing "enter size of array"
	li $v0, 4
	syscall
	
	li $v0, 5					# Taking user input size 
	syscall
	move $t0, $v0
	
	li $t1, 0					# Setting parameter to 0
	la $t2, array					# Initializing array
	
while:							# Loop for taking in array elements
	la $a0, el
	li $v0, 4
	syscall
							
	li $v0, 5					# Taking input array elements
	syscall
	sw $v0, ($t2)
	
end: 
	add $t1, $t1 ,1 				# Incrementing parameter 
	add $t2, $t2, 4
	blt $t1, $t0, while
endw:
	li $t1, 0					# Setting parameter back to 0
	la $t2, array
	li $t3, 0					# Setting parameter for outer loop
loop:							# Outer loop of bubble sort
	li $t1, 0					# Incrementing inner loop parameter
	la $t2, array	
loop1:							# Inner loop of bubble sort
	lw $t4, ($t2)					# Storing i'th element 
	add $t2, $t2, 4
	lw $t5, ($t2)					# Storing i+1' th element
	subi $t2, $t2, 4
	bge $t5, $t4, done				# Branching if a[j] < a[j+1]
	sw $t5, ($t2)					# Swapping i'th element to i+1'th
	add $t2, $t2, 4
	sw $t4, ($t2)					# Swapping i+1'th element to i'th 
	subi $t2, $t2, 4
done:
	add $t1, $t1, 1					# Incrementing all parameters
	add $t2, $t2, 4
	blt $t1, $t0, loop1
	la $t2, array
	add $t3, $t3, 1
	blt $t3, $t0, loop
	
	li $t1, 0					# Setting parameters back to 0
	la $t2, array
	add $t2, $t2, 4
	
loop2:							# Loop for printing sorted array
	lw $t6, ($t2)
	move $a0, $t6
	li $v0, 1
	syscall
	
	la $a0, space
	li $v0, 4
	syscall
	
	add $t1, $t1, 1
	add $t2, $t2, 4
	blt $t1, $t0, loop2
	
	
	
	
.data
	size: .asciiz "Enter the size of array: "
	.align 2
	array: .word 0:32
	space: .asciiz " "
	el: .asciiz "Enter element: "