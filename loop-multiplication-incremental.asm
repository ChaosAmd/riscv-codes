##################################
# Multiplication as loop on RV32I#
# @author: Amadeus Dabela Lanoa  #
##################################
	.globl main
	
	.text
main:
##########################################################################
# Description:                                                           #
# -register a0 corresponds to the base value multiplied, mutable         #
# -register a1 is the number of times the register will be multiplied    #
# -register a2 is the base value as constant on top level                #
# -register a3 is the counter                                            #
##########################################################################
	nop
	addi a0, zero, 6      # add the imediate constant 3 to the register a0
	addi a1, zero, 5      # add the imediate constant 5 to the register a1
	add  a2, zero, a0     # set the base value to be multiplied
	addi a3, zero, 1      # set the register a3, as counter, with 1 value
	bgt  a1, a3, loop     # branch loop if a1 > a3
loop:
	addi a3, a3, 1        # add 1 to the counter
	add  a0, a0, a2       # add a2 register to a0 
	bge  a3, a1, finished # branch to finished state if a3 >= a1 to the main
	j    loop             # jump to loop
finished:
	j finished            # leave to a non halt state