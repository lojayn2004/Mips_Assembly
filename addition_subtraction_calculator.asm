.data 
    firstNum: .word 0 
    secondNum: .word 0 
    operation: .byte '+'      # Operation input (character)
    tmp: .byte '+'            # Temporary variable to hold the operation (character)
    firstNumPrompt: .asciiz "Please enter the first Number: "
    secondNumPrompt: .asciiz "Please enter the second Number: "
    operationPrompt: .asciiz "Please enter Operation (+/-): "
    outputMsg: .asciiz "The result is: "
    result: .word 0           # To store the result

.text
   # Prompt the user for the first number
   li $v0, 4
   la $a0, firstNumPrompt
   syscall 
   
   li $v0, 5
   syscall
   sw $v0, firstNum    # Store the first number in memory
   
   # Prompt the user for the second number
   li $v0, 4
   la $a0, secondNumPrompt
   syscall 
   
   li $v0, 5
   syscall
   sw $v0, secondNum    # Store the second number in memory
   
   # Prompt the user for the operation (+ or -)
   li $v0, 4
   la $a0, operationPrompt
   syscall 
   
   li $v0, 12           # Syscall to read a character (operation)
   syscall
   sb $v0, operation    # Store the operation in memory
   
   # Load the operation characters
   lb $t0, tmp          # Load the tmp operation (character)
   lb $t1, operation    # Load the user input operation (character)
   
   # Load the numbers
   lw $t2, firstNum     # Load the first number
   lw $t3, secondNum    # Load the second number
   
   # Perform the operation based on the character
   beq $t0, $t1, Plus   # If tmp == operation (both are '+')
   sub $t2, $t2, $t3    # Else, subtract the numbers
   sw $t2, result       # Store the result in 'result'
   j Exit               # Jump to exit

Plus: 
   add $t2, $t2, $t3    # Add the numbers
   sw $t2, result       # Store the result in 'result'
   
Exit:
   
   li $v0, 4
   la $a0, outputMsg    
   syscall 
   
   li $v0, 1            # Syscall to print integer
   lw $a0, result       # Load the result value into $a0
   syscall
