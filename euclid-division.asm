######################################
# Counting even in an array on RV32I #
# @author: Amadeus Dabela Lanoa      #
######################################

############################################################
# Description                                              #
# -register a0 stores the array on data section            #
# -register a1 stores the counter of even numbers          #
# -register a2 stores the length of array                  #
# -register a3 stores the counter of passin array          #
# -register t0 stores the current value of position of a0  #
# -register t1 is the dividend of current position         #
############################################################
	.globl main

	.data
arrOfNum:		.word 1, 2, 3, 5, 7, 12	
	.text
main:
	nop
	la   a0, arrOfNum               # load the word array arraOfNum to a0
	add  a1, zero, zero             # start a1 as zero hardwired
	addi a2, zero, 6                # ceil of array
	add  a3, zero, zero             # counter init
	jal  euclid_division            # generates the division
	
euclid_division:
	beq  a3, a2, finished           # branch to finish loop
	addi a3, a3, 1                  # add + 1 counter

quotient:
	lw   t0, 0(a0)                  # set the t0 the current position
	add  t1, zero, t0               # set the dividend
	jal  division_loop              # division label
	addi a0, a0, 4                  # update current value
	j    euclid_division            # performs the operation on another word position   
	
division_loop:
	ble  t1, zero, done             # if the current dividend is negative or zero jump to done
	addi t1, t1, -2                 # subtract
	j    division_loop              # recursive call
	
done:
	beq  t1, zero, count_even       # count even numbers
	ret                             # euclid algorithm to the next value   
	
count_even:
	addi a1, a1, 1                  # add 1 to the counter of even numbers
	ret
	

finished:
	j finished                      # leave to a non halt state
	
