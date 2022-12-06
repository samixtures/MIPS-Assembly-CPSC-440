    .data

    .text
    .globl main
main:
    li $t0, 0          # loading 0 into temporary register $t0 (sum variable)
    li $t1, 11         # loading 11 into temporary register $t1 (decrement variable)

loop:
    sub $t1, 1         # subtract one from $t1
    add $t0, $t0, $t1  # add the value of $t1 to $t0 and save it in $t0
    bne $0, $t1, loop  # check if the counter variable is 0, if not then loop back

    li $v0, 10      # end program
    syscall
    .end