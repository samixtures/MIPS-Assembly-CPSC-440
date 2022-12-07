    .data 
numsArray:	.asciiz	"0123456789"

    .text
main:
        li $t0, 7
        li $t3, 0
        la $a0,input
        li $a1,201          #read 200 char 
        li $v0,8            #read string
        syscall 

        jal evaluate

loop:
        lbu $t1, $t3($a0)


evaluate:



        lbu $t1, 1($a0)
        li $t2, '#'
        bne $t1, $t2, testi

        la $a0, string2
        li $v0, 4
        syscall


testi:
        li $v0, 10
        syscall