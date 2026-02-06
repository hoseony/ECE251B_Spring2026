.data
    array: .word 5, -2, 18, -1, -30
    length: .word 5
    num_negative: .word 0


.text
.globl main

main:
    la $s0, array           #s0 = array
    lw $s1, length          #s1 = length
    lw $s2, num_negative    #$s2 = num_negative

Loop:
    beq $zero, $s1, End 

    lw $t4, 0($s0)              #t4 = $s0[0]
    slt $t1, $t4, $zero         #if $t4 < $zero, $t1 = 1, else 0

    addi $s0, $s0, 4
    addi $s1, $s1, -1

    bne $zero, $t1, Count_up    #if zero != $t1(t4 is negative) Count_up

    j Loop

Count_up: 
    add $s2, $s2, 1 
    j Loop

End:
    li $v0, 10
    syscall
        




    
    
