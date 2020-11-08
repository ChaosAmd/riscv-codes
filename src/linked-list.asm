	.globl main
	
	.data
header:			.string "\tGerenciador de listas 9000\n"
insertline:		.string "\t 1) Insere um elemento na lista\n"
removevalline:		.string "\t 2) Remove por valor na lista\n"
removeindline:		.string "\t 3) Remove por índice na lista\n"
printline:		.string "\t 4) Imprime lista\n"
exitline:		.string "\t 0) Sai do programa\n"

	.text
main:
	nop
	addi s1, sp,   0  # pointer to stack
	addi s2, zero, 0  # pointer to last element
	addi s3, zero, 0  # size of the list
	addi s4, zero, 0  # size of removed elements
	addi s5, zero, 0  # size of elements added
	
menu:                     # prints the menu
	la a0, header     # loads the string to a0
	jal printstr      # prints it
	la a0, insertline # repeat until line 30
	jal printstr
	la a0, removevalline
	jal printstr
	la a0, printline
	jal printstr
	la a0, exitline
	jal printstr      

readint:                  # label to read input from the user to a0
	li a7, 5
	ecall
	ret
	
optionmenu:               # process the user input 
	addi t0, zero, 0
	beq  a0, t0, exit 
	addi t0, zero, 1
	beq  a0, t0, insertval
	addi t0, zero, 2
	beq  a0, t0, removeval
	addi t0, zero, 3
	beq  a0, t0, removeind
	addi t0, zero, 4
	beq  a0, t0, printlist
	j menu

insertval:

removeval:

removeind:

printlist:
	
printstr:                 # auxiliary function to print string loaded to a0
	li a7, 4
	ecall
	ret
	

	
exit:                     # exits