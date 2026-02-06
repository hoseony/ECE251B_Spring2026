.data


.text
.globl main

main:
    li $v0, 5
    syscall
    move $v0, $a0

    li$vo, 5
    syscall
    move $v0, %a1

calc_perimeter:
    
