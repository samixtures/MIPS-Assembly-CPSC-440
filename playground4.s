.data 
input:          .space 201
string2:    .asciiz "they're equal.\n"
finish:         .byte '#'
.text
main:
        la $a0,input
        li $a1,201          #read 200 char 
        li $v0,8            #read string
        syscall 

        jal evaluate

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