.data

.text
.globl main


less_than_1:
    li $v0, 1
    jr $ra

factorial:
    slti $t0, $a0, 1
    bne $t0, $zero, less_than_1
    # if a0<1, less_than_1()
    # so v0 will be 1 if this is satisfied

    # t0 = checker
    # t1 = n

    #initialize stack
    addi $sp, $sp, -8
    sw $ra, 0($sp)
    sw $a0, 4($sp)
   
    addi $a0, $a0, -1   
    jal factorial   #call factorial(n-1)

    # ------------
    # less_than_1 returns here of the caller with v0 = 1
    # also jr $ra at the end of this function returns here
    # ------------

    lw $t1, 4($sp) # this brings n back
    mult $v0, $t1 
    mflo $v0       # v0 = v0 * t1 


    #destroy stack
    lw $ra, 0($sp)
    lw $a0, 4($sp)
    addi $sp, $sp, 8

    jr $ra
    # --------
    # this jr $ra returns you after the jal factorial 
    # call of the one previous until the ra is the return address to main
    # --------

main:
    #int a0 = getchar()
    li $v0, 5
    syscall
    move $a0, $v0

    jal factorial

    move $s0, $v0

    li $v0, 10
    syscall

