.text
.globl main

average_of_squares:
    #save return address
    addi $sp, $sp, -12
    sw $ra, 0($sp)
    sw $a0, 4($sp)
    sw $a1, 8($sp)

    #int t1 = square(a0)
    jal square

    #------------
    #returns here
    #------------

    move $t0, $v0

    #int t2 = square(a1)
    lw $a0, 8($sp)
    jal square
    move $t1, $v0

    #int t0 = t1 + t2 
    add $t0, $t0, $t1

    #v0 = t0/2
    li $t2, 2           #not floating point
    div $t0, $t2
    mflo $v0
    
    #load return address
    lw $ra, 0($sp)
    lw $a0, 4($sp) 
    lw $a1, 8($sp) 
    addi $sp, $sp, 12
    jr $ra

square:
    mult $a0, $a0
    mflo $v0
    jr $ra

main:
    #int a0 = getchar()
    li $v0, 5
    syscall
    move $a0, $v0

    #int a1 = getchar()
    li $v0, 5
    syscall
    move $a1, $v0

    jal average_of_squares

    #------------
    #returns here
    #------------

    move $s0, $v0

    #end program 
    li $v0, 10
    syscall 

