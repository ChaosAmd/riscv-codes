	.globl main
	
	.data
header:			.string "\n\t\tGerenciator de listas 9000\n"
insertline:		.string "\t 1) Insere um elemento na lista\n"
removevalline:		.string "\t 2) Remove por valor na lista\n"
removeindline:		.string "\t 3) Remove por índice na lista\n"
printline:		.string "\t 4) Imprime lista\n"
exitline:		.string "\t 0) Sai do programa\n"
breakln:                .string "\n"
notimpl:                .string "Não implementado!"
listelsln:              .string "Elementos na lista: "
space:			.string " "

	.text
main:
	nop
	add s0, zero, sp    # pointer to start of the stack
	add s1, zero, zero  # counter of how many items was inserted
	add s2, zero, zero  # counter of how many items was removed
	
menu:

	la a0, header     # loads the string to a0
	jal printstr      # prints it
	la a0, insertline # repeat until line 29
	jal printstr
	la a0, removevalline
	jal printstr
	la a0, removeindline
	jal printstr
	la a0, printline  # repeat until line 30
	jal printstr
	la a0, exitline
	jal printstr
	
	jal readint
	li t0, 0
	beq  a0, t0, exit 
	li t0, 1
	beq  a0, t0, insertval
	li t0, 4
	beq  a0, t0, print_list
	li t0, 2
	beq  a0, t0, rmbyvalue
	li t0, 3
	beq  a0, t0, rmbyindex
	j menu

insertval:
	jal readint
	beq s0, sp, insert_at_start # first invariant of the linked list
	b   insert_common           # the second and third invariant

insert_at_start:                    # branch for the case that the list is empty
	add t0, zero, a0            # uses a0(integer read from the keyboard) as argument
	sw  t0, 0(sp)
	sw  zero, -4(sp)
	addi sp, sp, -8
	j menu
	
insert_common:
	add t0, zero, a0            # t0 is the the value read by the keyboard
	lw a1, 0(sp)                # get current node
	lw a2, -4(sp)               
	bgt a0, a1, locate_node     # branch locate node
	jal   node_found              # node was found
	j menu
	
locate_node:
	lw a1, 0(sp)                # get current node
	lw a2, -4(sp)               
	blt a1, a0, insert_common
	addi sp, sp, -8
	j locate_node
	
node_found:
	beq a2, zero, last_node
	add a3, a2, zero            # get previous node
	sw  
	
	ret
		
#############
# Print List#
#############
print_list:
	jal printbreak
	la a0, listelsln
	jal printstr
	add t0, zero, s0
print_list_loop:
	beq t0, sp, menu
	lw a0, 0(t0) 
	jal printint
	jal printspace
	addi t0, t0, -8
	j print_list_loop

rmbyvalue:

rmbyindex:
###############################
#    Helpers  Section         #
###############################
readint:                  # label to read input from the user to a0
	li a7, 5
	ecall
	ret

printstr:                 # auxiliary function to print string loaded to a0
	li a7, 4
	ecall
	ret
	
printbreak:
	la a0, breakln
	li a7, 4
	ecall
	ret
	
printspace:
	la a0, space
	li a7, 4
	ecall
	ret

printint:
	li a7, 1
	ecall
	ret

exit:                     # exits
