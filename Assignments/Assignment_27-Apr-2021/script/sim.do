# Compile all .v Verilog HDL files and put into work directory
vlog -work work *.v

# Loading top-level design
vsim Testbench

# Add wave
add wave *

# list all signals in decimal format
# add list -decimal *

# read in stimulus
# do stim.do

# output results
# write list counter.lst

# Run all simulation till $finish
run -all

# Quit simulation after done simulating
quit -f