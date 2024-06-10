# Apparently this basename returns "day00 " with a trailing space. Weird.
DAY = $(strip $(shell basename $(CURDIR)))

SRC_DIR = .
SRC_FILES = $(shell find $(SRC_DIR) -name '*.sv' ! -name '*solution*')
SOLUTION_FILES = $(shell find $(SRC_DIR) -name '*solution.sv' -or -name "*tb.sv")

BUILD_DIR = ./build

IVERILOG_OUTFILE = $(BUILD_DIR)/sim.vvp
IVERILOG_FLAGS = -o $(IVERILOG_OUTFILE) -Wall -Winfloop -Wno-timescale -gno-shared-loop-index -g2012
IVERILOG_SOLUTION_FLAGS = -o solution/sim.vvp -Wall -Winfloop -Wno-timescale -gno-shared-loop-index -g2012

# The simulation output executable that icarus verilog creates.
$(IVERILOG_OUTFILE): $(SRC_DIR)/$(SRC_FILES)
	mkdir -p $(dir $@)
	iverilog $(IVERILOG_FLAGS) -s $(DAY)_tb $(DAY).sv $(DAY)_tb.sv

.PHONY: clean sim synth solution

sim: $(IVERILOG_OUTFILE)
	$(IVERILOG_OUTFILE)
	gtkwave $(DAY).vcd 

synth: $(SRC_DIR)/$(SRC_FILES) 
	yosys synthesis/synth.ys

solution:
	# TODO do this better
	mkdir -p solution
	iverilog $(IVERILOG_SOLUTION_FLAGS) -s $(DAY)_tb $(DAY)_solution.sv $(DAY)_tb.sv
	solution/sim.vvp
	gtkwave $(DAY).vcd &
	yosys synthesis/solution.ys &

clean:
	rm -rf $(BUILD_DIR) solution/ day00.vcd day00.dot* synth.v

