DAY  = day00
TIME = $$(date +'%Y%m%d-%H%M%S')

SRC_DIRS = .
FILES = $(shell find $(SRC_DIRS) -name '*.sv' -or -name '*.v' )

BUILD_DIR = ./build

IVERILOG_FLAGS = -o $(BUILD_DIR)/sim.vvp -Wall -Winfloop -Wno-timescale -gno-shared-loop-index -g2012

# The simulation output executable that icarus verilog creates.
$(BUILD_DIR)/sim.vvp: $(SRC_DIRS)/$(FILES)
	mkdir -p $(dir $@)
	iverilog $(IVERILOG_FLAGS) -s $(DAY)_tb $(DAY).sv $(DAY)_tb.sv

sim: $(BUILD_DIR)/sim.vvp
	$(BUILD_DIR)/sim.vvp
	gtkwave $(BUILD_DIR)/$(DAY).vcd 

synth: $(SRC_DIRS)/$(FILES) 
	yosys synth.ys

clean:
	rm -rf $(BUILD_DIR)

