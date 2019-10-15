#Tawanda Muzanenhamo
#Number Classifier

.data
	input_msg:	.asciiz "Enter a number:"
	output_msg1:	.asciiz "Enter a number:It is divisible by 2\n"
	output_msg2:	.asciiz "Enter a number:It is divisible by both 2 and 3\n"
	output_msg3:	.asciiz "Enter a number:It is neither divisible by 2 nor 3\n"
	output_msg4:	.asciiz "Enter a number:It is divisible by 3\n"
	other: 		.asciiz "\n"
	mess:           .asciiz "hahahahaha\n"
	
.text

main:
    addi $t9, $zero,  6 #initialise a value of 6
    addi $t1, $zero,  1  # initialise a value of 1
    addi $t2, $zero,  2 # initialise a value of 2
    addi $t3, $zero, 3 # initialise a value of 3
    addi $t4, $zero, 0 # initalise a value of 0
    
    
    
Loop: bge $t1, $t9,exit
     #li $v0, 4
     #la $a0, input_msg # print the input message
     #syscall
     li $v0, 5 #get the entered value
     syscall
     move $t0, $v0 # the eneted value is now stored in $t0
     
     div $t0, $t2
     mfhi $s0
     bnez $s0,by3 #branch to divisible by 3 if it's not divisible by 2
     div $t0, $t3 #check if divisible by 3
     mfhi $s1 
     bnez $s1,by2 #branch to divisible by 2 if not divisible by 3
     li $v0, 4
     la $a0, output_msg2
     syscall
     
     
     
     addi $t1,$t1,1
     j Loop
     li $v0 10			#end program
     syscall
     
by2: #divisible by 2
    li $v0, 4
    la $a0, output_msg1 #print the message
    syscall
    addi $t1,$t1,1 #increment
    j Loop
    li $v0 10			#end program
    syscall
       
     
 by3:
    div $t0, $t3
    mfhi $s2
    bnez $s2,byNone
    li $v0, 4
    la $a0, output_msg4
    syscall
    addi $t1,$t1,1
    j Loop
    li $v0 10			#end program
    syscall
    
byNone:
    li $v0, 4
    la $a0, output_msg3
    syscall
    addi $t1,$t1,1
    j Loop
    li $v0 10			#end program
    syscall
 
   


exit:
    li $v0 10			#end program
    syscall
