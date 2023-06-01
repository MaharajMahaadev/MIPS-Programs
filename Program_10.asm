# Maharaj Mahaadev
# E20CSE085

.text
	lwc1 $f1, val1					# Copying 1st float value to $f1
	lwc1 $f2, val2					# Copying 2nd float value to $f2
	
	la $a0, o1					# For printing "Before, 1st value"
	li $v0, 4
	syscall
	
	li $v0, 2					# Printing 'val1'
	lwc1 $f12, val1	
	syscall
	
	la $a0, o2					# For printing "Before, 2nd value"
	li $v0, 4
	syscall
	
	li $v0, 2					# Printing 'val2'
	lwc1 $f12, val2
	syscall

	s.s $f2, val1					# Swapping, storing 2nd value to 1st ('val1')
	s.s $f1, val2					# Swapping, storing 1st value to 2nd ('val2')
	
	la $a0, o3					# For printing "After, 1st value"
	li $v0, 4
	syscall
	
	li $v0, 2					# Printing 'val1'
	lwc1 $f12, val1
	syscall
	
	la $a0, o4					# For printing "After, 2nd value"
	li $v0, 4
	syscall

	li $v0, 2					# Printing 'val2'
	lwc1 $f12, val2
	syscall
	
	li $v0, 10					# Terminating program
	syscall
	

.data
	val1: .float 4.71
	val2: .float 5.35
	o1: .asciiz "\nBefore Swapping, 1st value: "
	o2: .asciiz "\nBefore Swapping, 2nd value: "
	o3: .asciiz "\nAfter Swapping, 1st value: "
	o4: .asciiz "\nAfter Swapping, 2nd value: "


