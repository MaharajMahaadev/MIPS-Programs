.text 
.globl main 

main:
	li $t0, 10
	la $t1, array
	li $t2, 0

loop:	
	la $a0, ask1
	li $v0, 4
	syscall
	
	li $v0, 5
	syscall
	move $t3, $v0
	
	sw $t3, ($t1)
	
	add $t1, $t1, 4
	add $t2, $t2, 1
	blt $t2, $t0, loop
end:
	la $a0, o1
	li $v0, 4
	syscall
	
	la $t1, array
	li $t2, 0
	
loop1:
	la $a0, space
	li $v0, 4
	syscall
	
	lw $t3, ($t1)
	move $a0, $t3
	li $v0, 1
	syscall
	
	add $t1, $t1, 4
	add $t2, $t2, 1
	blt $t2, $t0, loop1
end1:
	li $t2, 0
	sub $t1, $t1, 4
	
	la $a0, o2
	li $v0, 4
	syscall

loop2:
	la $a0, space
	li $v0, 4
	syscall
	
	lw $t3, ($t1)
	move $a0, $t3
	li $v0, 1
	syscall
	
	sub $t1, $t1, 4
	add $t2, $t2, 1
	blt $t2, $t0, loop2
end2:
	
	
.data
	ask1: .asciiz "Enter the value in Array: "
	space: .asciiz " "
	o1: .asciiz "Entered Array: "
	o2: .asciiz "\nReversed Array: " 
	.align 2
	array: .word 0:32
