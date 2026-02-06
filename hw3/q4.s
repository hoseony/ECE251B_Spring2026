.text
.globl main

square_plus_one:
    addi $sp, $sp, -4       #create stack
    sw $t0, 0($sp)          #save t0 into stack 

    mult $t0, $t0           #t0 * t0, this saves into hi/lo
    mflo $t0                #t0 = lo
    addi $t0, $t0, 1        #t0 = t0 + 1
    
    move $v0, $t0           #v0 = t0
 
    lw $t0, 0($sp)          #restore t0 from stack
    addi $sp, $sp, 4        #destroy the stack 
    
    #end of the function
    jr $ra
   
main:
    #int t0 = getchar()
    li $v0, 5
    syscall
    move $t0, $v0

    #square_plus_one()
    jal square_plus_one

    #-----------
    #returns here
    #------------
    
    #save v0(output) to s0
    move $s0, $v0
    
    li $v0, 10
    syscall

