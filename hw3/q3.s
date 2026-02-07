.text
.globl main

calc_perimeter:
    # t0 = a0 + a1
    add $t0, $a0, $a1

    # t0 = t0 * 2
    sll $t0, $t0, 1

    # $v0 = t0
    move $v0, $t0
    
    # return to main
    jr $ra              # new discovery, from the textbook

main:
    # int a0 = getchar()
    li $v0, 5
    syscall
    move $a0, $v0

    # int a1 = getchar()
    li $v0, 5
    syscall
    move $a1, $v0

    # calc_perimeter()
    jal calc_perimeter
    
    #------------
    # returns here
    #------------ 

    move $t2, $v0       # made to make sure the function is usable

    li $v0, 10
    syscall
