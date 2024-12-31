.data 
    prompt: .asciiz "Please enter a string: "
    str: .space 50
    outputMsg: .asciiz "Is the string palindrome? " 
    len: .word 0
    result: .byte 0 # First we assume it is not palindrome
.text
  
Main: 
    # Get the user input
    li $v0, 4
    la $a0, prompt
    syscall
    
    li $v0, 8
    la $a0, str
    li $a1, 50
    syscall  
    
    # Get the string length
    jal GetStringLength
    addi $v0, $v0, -1 # To eliminate counting the null charcahter
    sw $v0, len
    
    
    # Check if the string is Palindrome
    jal IsPalindrome
    sw $v0, result
    
    # Display the result
    li $v0, 4
    la $a0, outputMsg
    syscall
    
    li $v0,1 
    lw $a0, result 
    syscall
    
    # Halt the program
    li $v0, 10
    syscall
       
IsPalindrome: 
    li $t0, 0 # the first char 
    lw $t1, len
    addi $t1, $t1, -1 # the last char
    la $t4, str
    
    Loop: 
         slt $t3, $t0, $t1
         beq $t3, $zero, ValidPalindrome
             add $t5, $t4, $t0
             add $t6, $t4, $t1
             lb  $t5, 0($t5)
             lb  $t6, 0($t6)
             bne $t5, $t6, NotValidPalindrome
                 addi $t0, $t0, 1
                 addi $t1, $t1, -1
             j Loop
                        
NotValidPalindrome:
    li $v0, 0
    jr $ra            
             
ValidPalindrome:
     li $v0, 1
     jr $ra 
    
GetStringLength: 
    li $t0, 0
    la $t1, str
    Loop2: 
         add $t2, $t1, $t0
         lb $t3, 0($t2)
         beq $t3, $zero, EndGetStringLength
               addi $t0, $t0, 1
         j Loop2
EndGetStringLength:  
     move $v0, $t0
     jr $ra     
         
         

