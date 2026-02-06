.data
    result: .word 0

.text
.globl main

calc_perimeter:
    add $t0, $a0, $a1
    sll $t0, $t0, 1

    sw $t0, result

    jr $ra              #new discovery, from the textbook

main:
    li $v0, 5
    syscall
    move $a0, $v0

    li $v0, 5
    syscall
    move $a1, $v0

    jal calc_perimeter

    li $v0, 10
    syscall

