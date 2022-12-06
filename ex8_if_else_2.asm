## ex7_if_else.asm
##
## Read keyboard input, perform arithmatic comparison, 
## and display the result in the console window. 

## Registers:
## $a0=$4  -- string address
## $v0=$2  -- system call function
## $s0=$16 -- load the address of n1 or n2
## $s1=$17 -- save first input number
## $s2=$18 -- save second input number
## $t0=$8  -- save addition/subtraction result
## $t1=$10 -- save the ascii of the first number
## $t2=$11 -- save the ascii of the second number

        .data
msg1:	.asciiz	"Input 1st number (0 ~ 9) : "
msg2:	.asciiz	"Input 2nd number (0 ~ 9) : "
sym1:	.asciiz " > "
sym2:	.asciiz " <= "
n1:	.word 	0
n2:	.word	0

	.text
	.globl  main
main:
	la	$a0, msg1	# load the address of msg1 into $a0
	li 	$v0, 4	 	# print string
	syscall 		# system call
	li 	$v0, 5	 	# read 1st input integer
	syscall 		# system call
	move	$s1, $v0	# $s0 = $v0
	la	$s0, n1
;	ori	$t1, $s1, 0x30
	sw	$s1, 0($s0)

	la	$a0, msg2	# load the address of msg2 into $a0
	li 	$v0, 4	 	# print string
	syscall 		# system call
	li 	$v0, 5	 	# read 2nd input integer
	syscall 		# system call
	move	$s2, $v0	# $s0 = $v0
	la	$s0, n2
;	ori	$t2, $s2, 0x30
	sw	$s2, 0($s0)

	bgt	$s1, $s2, greater	
	blt	$s1, $s2, lessequal
	j	done
greater:	
	lw	$a0, n1		# load n1 to $a0
	li 	$v0, 1	 	# print integer
	syscall 		# system call
	la	$a0, sym1	# load the address of sym1 into $a0
	li 	$v0, 4	 	# print string
	syscall 		# system call
	lw	$a0, n2		# load n2 to $a0
	li 	$v0, 1	 	# print integer
	syscall 		# system call
	j	done
lessequal:
	lw	$a0, n1		# load n1 to $a0
	li 	$v0, 1	 	# print integer
	syscall 		# system call
	la	$a0, sym2	# load the address of sym1 into $a0
	li 	$v0, 4	 	# print string
	syscall 		# system call
	lw	$a0, n2		# load n2 to $a0
	li 	$v0, 1	 	# print integer
	syscall 		# system call
done:
	li 	$v0, 10 	# syscall to exit cleanly from main only
	syscall 		# this ends execution
	.end