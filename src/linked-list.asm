	.globl main
	
	.data
header:			.string "\tGerenciator de listas 9000\n"
insertline:		.string "\t 1) Insere um elemento na lista\n"
#removevalline:		.string "\t 2) Remove por valor na lista\n"
removeindline:		.string "\t 3) Remove por índice na lista\n"
printline:		.string "\t 4) Imprime lista\n"
exitline:		.string "\t 0) Sai do programa\n"

	.text
main:
	nop
	addi s0, sp,   0  # pointer to start of the stack
	
menu:
# prints the menu
	la a0, header     # loads the string to a0
	jal printstr      # prints it
	la a0, insertline # repeat until line 30
	jal printstr
	la a0, printline # repeat until line 30
	jal printstr
	la a0, exitline
	jal printstr
	
# process the user input 
	jal readint
	li t0, 0
	beq  a0, t0, exit 
	li t0, 1
	beq  a0, t0, insertval
	li t0, 4
	beq  a0, t0, print_list
	li t0, 2
	j menu

insertval:
	jal readint
	add t0, zero, a0
	sw t0, 0(sp)
	addi sp, sp, -4
	j menu
	
###
# Print List
###
print_list:
	add t0, zero, s0
print_list_loop:
	beq t0, sp, menu
	lw a0, 0(t0) 
	jal print_int
	addi t0, t0, -4
	j print_list_loop

### Helpers
readint:                  # label to read input from the user to a0
	li a7, 5
	ecall
	ret

printstr:                 # auxiliary function to print string loaded to a0
	li a7, 4
	ecall
	ret
print_int:
	li a7, 1
	ecall
	ret

exit:                     # exits
