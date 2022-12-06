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
## We add that first numbre to the total variable (I guess that's $t0)
## Then we jump to the function of whatever symbol is the next character.
## So if it's addition we jump to addFunc and boom in that function we go to the next character
## We get the next character, save it as a number in a register (say $t2) and then we add $t0 and $t2 I guess
## Then we jump back to the main function and continue going through to the next character
## All this time actually we need to be incrementing some counter variable ($t1 I guess) which tells us which char to be on
## And actually we end the program if the counter variable reaches 9
## After incrementing it we should always check if it has reached 9, and when it does we jump to the endFunc
# The end endFun prints out $t0 to the console and then ends the program


## and when the counter reaches 0 we jump to the end

## Just found it the user will be typing the whole thing at once rather than each character at a time. Interesting.


    .data
numsArray:	.asciiz	"0123456789"
symbolsArray:	.asciiz	"+-*/"

    .text
    .globl main
main:
    li $t0, 11          # loading 11 into temporary register $t0 (counter/decrement variable)  
    li $t1, 0         # loading 0 into temporary register $t1 (total/sum variable)

loop:
    sub $t0, 1         # subtract one from $t1
    add $t1, $t1, $t0  # add the value of $t1 to $t0 and save it in $t0
    bne $0, $t0, loop  # check if the counter variable is 0, if not then loop back

    li $v0, 10      # end program
    syscall
    .end