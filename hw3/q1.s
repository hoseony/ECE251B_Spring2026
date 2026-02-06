.data
    final_val: .word 0

.text
.globl main

main:
    #int a = getchar()
    li $v0, 5
    syscall 
    move $t0, $v0
   
    #int b = getchar()
    li $v0, 5 
    syscall 
    move $t1, $v0

    #a *= 8 
    sll $t0, $t0, 3
    
    #a = a + b
    add $t0, $t0, $t1 
    sw $t0, final_val

    #end program
    li $v0, 10
    syscall 
