.data
     basePrompt: .asciiz "Enter the base:  "
     powerPrompt: .asciiz "Enter the power: " 
     resultMessage: .asciiz "The result is: "
     base: .word  0
     power: .word 0
     result: .word 0
.text
  
Main: 
     # Read the base from the user
     li $v0, 4
     la $a0, basePrompt
     syscall
     
     li $v0, 5
     syscall
     sw $v0, base
     
     
     # Read the power from the user
     li $v0, 4
     la $a0, powerPrompt
     syscall
     
     li $v0, 5
     syscall
     sw $v0, power
     
     
     lw $a0, power
     jal RecursivePower
     sw $v0, result
     
     li $v0, 4
     la $a0, resultMessage
     syscall
     
     li $v0, 1
     lw $a0, result
     syscall
     
     # Halt the program
     li $v0, 10
     syscall
     
     
 RecursivePower:
      addi $sp, $sp, -4
      sw   $ra, 0($sp)
      
      # Base Case 
      li $v0, 1
      beq $a0, $zero, EndRecursivePower 
     

      addi $a0, $a0, -1
      jal RecursivePower
      
      lw  $t1,  base
      mul $v0, $v0, $t1
      
 EndRecursivePower:
      lw $ra, 0($sp)
      addi $sp, $sp, 4
      jr $ra
     
                   
