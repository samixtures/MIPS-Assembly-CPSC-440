    .data
str: .asciiz "ABCDEFG" # create string variable "ABCDEFG
N:  .byte   7          # counter variable (since "str" has 7 characters)

    .text
    .globl main
main:
    lb $s0, N          # load the counter variable into a register
    li $v0, 4          # load the $v0 function call register with 4 to print out str
    la $a0, str        # load str into the first argument register
    syscall            # call the print string function to show str is there
    li $t0, 0          # loading 0 into temporary register $t0 (index variable)

loop:                  # loop to lowercase str
    lb $t1, str($t0)   # load $t0th character of str into $t1
    add $t1, $t1, 0x20 # add that character by 0x20 (which makes it lowercase)
    sb $t1, str($t0)   # store the new lowercase character back to str
    add $t0, $t0, 1    # add 1 to $t0 to go to next character
    la $a0, str        # load str into the first argument register
    li $v0, 4          # load the $v0 function call register with 4 to print out str
    syscall            # call the print string function to show str's new value
    addi $s0, $s0, -1  # subtract 1 by the counter variable so we can eventually break
    bne $0, $s0, loop  # check if the counter variable is 0, if not then loop back

    li $v0, 10      # end program
    syscall
    .end