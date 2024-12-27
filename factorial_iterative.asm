.data 
    prompt: .asciiz "Enter the numebr to get its factorial: \n"
    outputMsg: .asciiz "The factorial Is: "
.text 
   li $t0, 1
   li $t1, 1
   
   # print the prompt to enter a number to the user
   li $v0, 4
   la $a0, prompt
   syscall
   
   li $v0, 5
   syscall 
   move $t2, $v0
   addi $t2, $t2, 1 # becuase i will use less than in comparison to ensure he takes the last number 
   factLoop: 
         slt $t3, $t1, $t2 
         beq $t3, $zero, Exit
            mul $t0, $t0, $t1
            addi $t1, $t1, 1 
            j factLoop
             
  Exit:
     li $v0, 4
     la $a0, outputMsg
     syscall
     
     li $v0, 1
     move $a0, $t0
     syscall
    
       
   
