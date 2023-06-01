#Name : Maharaj Mahaadev
#Roll No. : E20CSE085

.data								
	m1:.asciiz "Enter the value of A: "				
	m2:.asciiz "Enter the value of B: "				
	m3:.asciiz "The multiples will be: "				
	a:.word 0							
	y:.word 1							
	sp:.asciiz " "						

.text								
	li $v0, 4 							
	la $a0, m1
	syscall 

	li $v0, 5							
	syscall 
	la $t0, ($v0)

	li $v0, 4							
	la $a0, m2
	syscall 

	li $v0,5							
	syscall 
	la $t1, ($v0)

	li $v0, 4							
	la $a0,m3
	syscall
	lw $t2,a							
	lw $t3,y							
	loop:
		addi $t2, $t2,1						
		mul $t3,$t2,$t0						
		addi $v0,$zero,1
		move $a0,$t3						
		syscall
		li $v0,4						
		la $a0,sp
		syscall
		beq $t2, $t1, exit 					
		j loop							
	exit:								
	
