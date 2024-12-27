.data
     promptMessage: .asciiz "Enter a number to get its Factorial: "
     outputMessage: .asciiz "The Result of the Factorial Is: " 
     number: .word  0
     result: .word 0
.text
  
Main: 
    # Print the prompt Message and read the input
    li $v0, 4                
    la $a0, promptMessage    
    syscall
    
    li $v0, 5                
    syscall                  
    sw $v0, number           
    
    lw $a0, number           
    jal RecursiveFactorial   
    
    sw $v0, result           
    
    # Print the output message
    li $v0, 4                
    la $a0, outputMessage    
    syscall
    
    # Print the result
    li $v0, 1                
    lw $a0, result           
    syscall
    
    # Halt the program
    li $v0, 10               
    syscall
    
RecursiveFactorial: 
    subu $sp, $sp, 8         
    sw $ra, 0($sp)           
    sw $s0, 4($sp)           
    
    # Base Case: if $a0 == 0, return 1
    li $v0, 1
    beq $a0, $zero, EndFactorial
    
    move $s0, $a0 # save the argument to the $s0
    addi $a0, $a0, -1        
    jal RecursiveFactorial    
    
    # Multiply result of RecursiveFactorial with current number
    mul $v0, $v0, $s0        # $v0 = $v0 * $a0 (factorial result)
    
EndFactorial:
    lw $ra, 0($sp)           
    lw $s0, 4($sp)           
    addu $sp, $sp, 8         
    jr $ra                   
