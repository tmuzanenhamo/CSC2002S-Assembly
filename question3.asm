#Tawanda Muzanenhamo
#Relative Primes

.data
	input_msg:	.asciiz "Enter the first number:\n"
	input_msg2:	.asciiz "Enter the second number:\n"
	output_msg1:    .asciiz "The two numbers are relatively prime"
	output_msg2:    .asciiz "The two numbers are not relatively prime"
	test1: .asciiz"I got here first\n "
	other: .asciiz "\n"
	test2: .asciiz"I got here second\n "
.text

main:
    addi $t0, $zero,  2 #initialise the start
    addi $t6, $zero, 0 #get rid of negative values
    addi $t7, $zero, -1
    addi $t9, $zero,  2 #initialise a value of 6
    li $v0, 4
    la $a0, input_msg # print the input message
    syscall
    li $v0, 5 #get the entered value
    syscall
    move $t1, $v0 
    
    #get the second number
    li $v0, 4
    la $a0, input_msg2 # print the input message
    syscall
    li $v0, 5 #get the entered value
    syscall
    move $t2, $v0 
    
    div $t2, $t9
    mfhi $s3
    
    beqz $s3, Not
    div $t1, $t9
    mfhi $s4
    beqz $s4, Not
    
    li $v0, 4
    la $a0, output_msg1 # print the input message
    syscall
    li $v0 10			#end program
    syscall
    

Not:
	
	
    li $v0, 4
    la $a0, output_msg2 # print the input message
    syscall
    li $v0 10			#end program
    syscall
    
    