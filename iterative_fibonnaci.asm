.data 
    userPrompt: .asciiz "Enter a number to get its Fibonacci value: "  
    reusltPrompt: .asciiz "The result is: "
    number: .word 0 
.text

Main: 
    # Print the prompt
    li $v0, 4
    la $a0, userPrompt
    syscall
    
    # prompt the user to enter a number
    li $v0, 5
    syscall
    # Store the number in the number variable
    sw $v0, number
    
        
    jal IterativeFibonnaci
    
    li $v0, 4
    la $a0, reusltPrompt
    syscall
    
    # print the result which will be stored in $v0
    li $v0, 1
    move $a0, $v1
    syscall
    
    # End the program
    li $v0, 10
    syscall
    
IterativeFibonnaci: 
    li $t0, 0  # << first fib number >>
    li $t1, 1  # << second fib number >>
    lw $t2, number # The number i want to get its fibbonacci
    addi $t2, $t2, 1
     
    li $t3, 2  # index starting from 2 beq i have the fibonnaci of the first two
    li $t4, 0  # the result of fibbonnaci 
   
   
    GetFibonnaci:
        slt $t5, $t3, $t2
        beq $t5, $zero, EndIterativeFibonnaci
        
        add $t6, $t0, $t1  # f(n) = f(n - 1) + f(n - 2)
        move $t0, $t1 # first num = f(n - 1)
        move $t1, $t6 #second num = f(n)
        
        addi $t3, $t3, 1 
       
        j GetFibonnaci

EndIterativeFibonnaci:
    li $t6, 2 # first number
    beq $t2, $t6, StorefirstNum
       move $v1, $t1
       jr $ra
   StorefirstNum: 
      move $v1, $t0
      jr $ra 


   
   
