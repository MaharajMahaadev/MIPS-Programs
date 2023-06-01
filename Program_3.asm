.text
	la $a0, o1
	li $v0, 4
	syscall
	
	li $v0, 2
	lwc1 $f12, pi
	syscall
	
	la $a0, ask
	li $v0, 4
	syscall
	
	li $v0, 6
	syscall
	mov.s $f1, $f0
	
	lwc1 $f2, pi
	add.s $f3, $f2, $f1
	s.s $f3, val
	
	li $v0, 2
	lwc1 $f12, val
	syscall


.data
	o1: .asciiz "The value of pi is: "
	pi: .float 3.14
	ask: .asciiz "\nEnter any floating-point number: "
	val: .float 0.0