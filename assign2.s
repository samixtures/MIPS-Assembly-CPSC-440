.text # To start writing code
main:
    li  $t0, 146 #loads 146 into the t0 register
    li  $t1, -82 #loads -82 into the t1 register
    add $t2, $t0, $t1 #adds the t0 and t1 register values and loads result in t2
    move $10, $t2 # moves the value stored in the t2 register into the t10 register
    syscall # syscall to exit cleanly from main
    .end
