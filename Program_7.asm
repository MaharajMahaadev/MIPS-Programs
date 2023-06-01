# Maharaj Mahaadev
# E20CSE085
.text
.globl main

main:
	li $t0, 10					# Size of arrays
	la $t1, farray 					# Declaring first array
	li $t3, 0					# Parameter set to 0
	
	la $a0, faarray					# Asking user to enter first array
	li $v0, 4
	syscall
		
while: 							# Loop for reading and storing elements of first array from user input
	
	li $v0, 5			
	syscall 
	sw $v0, ($t1)
	
end:
	add $t1, $t1, 4
	add $t3, $t3, 1
	blt $t3, $t0, while
endw: 
	
	la $a0, saarray					# Asking user for 2nd array elements 
	li $v0, 4
	li $t3, 0
	la $t2, sarray					# Decalring second array
	syscall
	
while1: 						# Loop for reading and storing 2nd array elements from user input 
	li $v0, 5
	syscall
	sw $v0, ($t2)
	
end1:
	add $t2, $t2, 4
	add $t3, $t3, 1
	blt $t3, $t0, while1
endw1:

	li $t3, 0
	la $t1, farray	
	la $t2, sarray
	la $t4, tarray 					# Declaring 3rd array

loop:							# Loop for comparing and storing elements to 3rd array
	lw $t7, ($t1)
	lw $t8, ($t2)					
	blt $t8, $t7, else				# If 2nd array element is less than 1st array element go to else
	sw $t7, ($t4)					# Otherwise 1st array element is stored to array 3
	b next
	
else:
	sw $t8, ($t4)					# In else 2nd array element is stored to array 3

next:							# All values are incremented 
	add $t3, $t3, 1
	add $t1, $t1, 4
	add $t2, $t2, 4
	add $t4, $t4, 4
	blt $t3, $t0, loop
done:
	
	
	la $a0, taarray					# For printing "3rd array elements"
	li $v0, 4	
	syscall 
	
	li $t3, 0
	la $t4, tarray	
loop1:							# Loop for traversing and printing the elements in array 3
	lw $t6, ($t4)
	move $a0, $t6
	li $v0, 1
	syscall
	
	la $a0, space					# For printing space " "
	li $v0, 4
	syscall
	
	add $t4, $t4, 4
	add $t3, $t3, 1
	blt $t3, $t0, loop1
	

.data
	faarray: .asciiz "Enter the first array: "
	.align 2
	farray: .space 100
	saarray: .asciiz "Enter the second array: "
	.align 2
	sarray: .space 100
	taarray: .asciiz "The elements are: "
	.align 2
	tarray: .space 100
	line: .asciiz "\n"
	space: .asciiz " "
	
	
