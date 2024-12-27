.data 
    userMsg: .space 50
    prompt: .asciiz "Enter A string: "
    outputMsg: .asciiz "The string you entered is: "
.text
    # print the prompt to the user
    li $v0, 4 
    la $a0, prompt
    syscall 
    
    # Enter the string
    li $v0, 8
    la $a0, userMsg
    li $a1, 50 
    syscall 
    
    # print the result 
    li $v0, 4 
    la $a0, outputMsg
    syscall 
    
    li $v0, 4 
    la $a0, userMsg
    syscall
