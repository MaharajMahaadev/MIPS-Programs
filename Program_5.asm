#Name : Maharaj Mahaadev
#Roll No. : E20CSE085
.data								
	m1:.asciiz "Enter the number of rows: "			

	x:.word 0							
	y:.asciiz " *"							
	sp:.asciiz "  "						
	ln:.asciiz "\n"						
	z:.word 2							

.text								
	li $v0, 4 							
	la $a0, m1
	syscall 

	li $v0, 5							
	syscall 
	la $t0, ($v0)

	lw $t1,x							
	li $v0,4							
	la $a0,ln
	syscall
	loop1:								
		lw $t3,z						
		beq $t0,$t1,exit					
		addi $t1,$t1,1						
		lw $t4,x
		sub $t2,$t0,$t1
		mul $t3,$t1,$t3						
		subi $t3,$t3,1
	loop2:							
		beq $t2,$zero,loop3				
		subi $t2,$t2,1					
		li $v0,4					
		la $a0,sp
		syscall
		j loop2						
	loop3:							
		beq $t4,$t3,exit1				
		addi $t4,$t4,1					
		li $v0,4
		la $a0,y
		syscall
		j loop3	
	exit1:							
	li $v0,4						
	la $a0,ln
	syscall
	j loop1
exit:								

	
