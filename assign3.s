.data # Initializes 6 bytes, one 0 value, the rest are values we will get the average from.
bSum: .byte 0
bVar1: .byte   12
bVar2: .byte   97
bVar3: .byte  133
bVar4: .byte   82
bVar5: .byte  236
.text
.main:
	lb $t0, bSum #load 0 to register $t0
	lb $t1, bVar1 #load 12 to $t1
	add $t2, $t0, $t1 #add 12 with 0 and store in $t2
	lb $t1, bVar2 # load 97 to register $t1
	add $t2, $t2, $t1 # add 97 with $t2 and store it in $t2
	lbu $t1, bVar3 # load 133 to register $t1
	add $t2, $t2, $t1 # add 133 with $t2 and store it in $t2
	lbu $t1, bVar4 # load 82 to register $t1
	add $t2, $t2, $t1 # add 82 with $t2 and store it in $t2
	lbu $t1, bVar5 # load 236 to register $t1
	add $t2, $t2, $t1 # add 236 with $t2 and store it in $t2
	div $t2, $t2, 5 # divide $t2 by 5 and store it in $t2

	li $v0,10 # load 10 in $v0
	syscall # give control back to system
	.end # signify end program

