#Tawanda Muzanenhamo
#One Digit Positive DIvisors
.data

	input_msg:	.asciiz "Enter a number:\n"
	output_msg:	.asciiz "The single digit divisors are:\n"
	other: 		.asciiz "\n"
	mess:           .asciiz "hahahahaha\n"
	
.text

	
	
	
main:
    addi $t9, $zero,  10 #initialise a value of 10
    addi $t1, $zero,  2  # initialise a value of 9
    li $v0, 4
    la $a0, input_msg # print the input message
    syscall
    li $v0, 5 #get the entered value
    syscall
    move $t0, $v0 # the eneted value is now stored in $t0
    li $v0, 4
    la $a0, output_msg #printout the output message
    syscall
  #  li $v0, 4
   # la $a0, other
   # syscall

Loop: bge $t1,$t9,exit #branch wen the value of t1 becomes greater than t2 i.e. greater than 9

      div $t0,$t1
      mfhi $s0 #get the remainder
      
      bnez $s0,done #branch to done if remainder is not 0
      li $v0, 1
      add $a0, $zero, $t1
      syscall
      li $v0, 4
      la $a0, other
      syscall
      addi $t1,$t1,1
      j Loop
      li $v0 10			#end program
      syscall
      
      
done:
   addi $t1,$t1,1
   j Loop
    
     


exit:
    li $v0 10			#end program
    syscall

