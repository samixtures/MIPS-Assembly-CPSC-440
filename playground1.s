.text # where the code goes
main: # entry points
li $t0, 146 # load 146 into a temporary register
li $t1, -82 # load -82 into a temporary register
add $10, $t0, $t1 # $10 = 146 + (-82)
move $a0, $10 # copy data from $10 to $a0 so we can print it out
li $v0, 1 # load print int syscall
syscall # print int from $a0 to console
li $v0, 10 # load exit syscall
syscall # make exit syscall
