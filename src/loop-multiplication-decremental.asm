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
# -register a2 is the base value to be multiplied                        #
# -register a3 is the (a1) -1 value                                      #
##########################################################################
	nop
	addi a0, zero, 6        # add the imediate constant 3 to the register a0
	addi a1, zero, 5        # add the imediate constant 4 to the register a1
	add  a2, zero, a0       # set base value
	addi a3, a1, -1         # create n-1 ceil
	blt  a1, zero, loop     # branch loop if a1 < 0
loop:
	ble  a3, zero, finished # branch to finished state if a1 <= 0 to the main
	addi a3, a3, -1         # decrements the floor of loop
	add  a0, a0, a2         # sum according to the floor
	j    loop               # jump to loop
finished:
	j finished              # leave to a non halt state
