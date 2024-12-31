.data 
    prompt: .asciiz "Please enter a number: "
    number: .word 0 
    outputMsg: .asciiz "Is the number Prime? " 
    result: .word 0
.text

Main:
    li $v0, 4
    la $a0, prompt
    syscall
     
    li $v0, 5
    syscall
    sw $v0, number
    
    # call the function 
    lw $a0, number
    jal IsPrime
    sw $v0, result
    
    li $v0, 4
    la $a0, outputMsg
    syscall
    
    # print answer
    li $v0, 1
    lw $a0, result
    syscall
    
    # halt program
    li $v0, 10
    syscall

IsPrime:
    li $t0, 2
    lw $t1, number
    Loop: 
         slt $t2, $t0, $t1
         beq $t2, $zero, EndIsPrime
            # Check if it divides it
            div $t1, $t0
            mfhi $t4
            # If the reminder is zero that means it is not prime
            beq $t4, $zero, EndIsPrime
              addi $t0, $t0, 1
         j Loop
         
EndIsPrime: 
   # If we reached till the end means we didnot find a
   # number that divides it so it is a prime number 
   beq $t0, $t1, StoreOne
      li $v0, 0
      jr $ra
   StoreOne:
     li $v0, 1
     jr $ra
