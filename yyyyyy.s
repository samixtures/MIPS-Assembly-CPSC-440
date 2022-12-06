#Name: Sami Bajwa
#Email: samibajwa@csu.fullerton.edu
#ID: 888019932

# first SPIM program
    .data
string: .asciiz "Hello World\n"
        .text
        .globl main
main:
    li  $v0,4
    la  $a0,string
    syscall
    li  $v0,10
    syscall # syscall to exit cleanly from main only, refer to Figure A.9.1 
# in the Assemblers, Linkers, and the SPIM Simulator
# document (PDF)

    .end