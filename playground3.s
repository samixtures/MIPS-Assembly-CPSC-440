## Design an integer calculator. 
## The program reads a constant equation from keyboard input,
## calculates the result, and display the equation and result 
## to the Console Window.

## Operations shall include at least one addition, 
## one subtraction, one multiplication, and one division, 
## but they can be entered in a different order. 
## For example, a+b*c/d-e or a*b-c+d/e, where a, b, c, d, 
## and e are integers entered on the keyboard. 
## The more operations a program provides, 
## the higher the program's score.


## PROCESS:

## create two arrays: 0-9, +-*/?
## let the user input a value

## SCRATCH THIS 
## hopefully it's a number, and when it is we store that somewhere
## let the user input a symbol, depending on the symbol we jump to a specific part of the program
## let's say it's "+", then we jump to addFunc: and it asks the user to input another number.
## after they input that other number the program adds those two numbers and then jumps back to the start of the program
## to make sure we only do this four times (once for each symbol) we can have a counter that gets subtracted everytime we go back to the start
## SCRATCH THIS


## So they input the whole equation with 5 numbers and 4 symbols.
## We add that first number to the total variable (I guess that's $t1)
## Then we jump to the function of whatever symbol is the next character.
## So if it's addition we jump to addFunc and boom in that function we go to the next character
## We get the next character, save it as a number in a register (say $t2) and then we add $t0 and $t2 I guess
## Then we jump back to the main function and continue going through to the next character
## All this time actually we need to be incrementing some counter variable ($t0 I guess) which tells us which char to be on
## And actually we end the program if the counter variable reaches 9
## After incrementing it we should always check if it has reached 9, and when it does we jump to the endFunc
# The end endFun prints out $t1 to the console and then ends the program


## and when the counter reaches 0 we jump to the end

## Just found it the user will be typing the whole thing at once rather than each character at a time. Interesting.


## BIG QUESTION: How to parse through the 9 character string one character at a time :))) -___- ?! :OOOO

    .data
stringInput:    .space 20
finalMsg: .asciiz "The final result is: "
msg1:	.asciiz	"Input a math expression: "
msg2:   .asciiz "To verify, your expression is: "
numsArray:	.asciiz	"0123456789"
symbolsArray:	.asciiz	"+-*/"

buffer: .space 20
str1:  .asciiz "Enter string"
str2:  .asciiz "You wrote:\n"

    .text
    .globl main
main:
    # PRINT msg1
    la	$a0, msg1	# load the address of msg1 into $a0
	li 	$v0, 4	 	# print string
	syscall 		# system call

    # GET USER INPUT
	li $v0, 8       # take in input

    la $a0, buffer  # load byte space into address
    li $a1, 20      # allot the byte space for string

    move $t0, $a0   # save string to t0
    syscall

    la $a0, str2    # load and print "you wrote" string
    li $v0, 4
    syscall

    la $a0, buffer  # reload byte space to primary address
    li $v0, 4       # print string
    syscall

    li $v0, 10      # end program
    syscall