ROOT_DIR := .
SIM_DIR  := $(ROOT_DIR)/sim
OUT_FILE := $(SIM_DIR)/sim_fpu

RTL_SRCS := \
	$(ROOT_DIR)/rtl/fpu_pkg.sv \
	$(ROOT_DIR)/rtl/fp_unpack.sv \
	$(ROOT_DIR)/rtl/fp_pack.sv \
	$(ROOT_DIR)/rtl/fpu_core.sv \
	$(ROOT_DIR)/rtl/fpu_top.sv

TB_SRCS := \
	$(ROOT_DIR)/testbench/fpu_tb.sv

all: run

$(SIM_DIR):
	mkdir -p $(SIM_DIR)

compile: $(SIM_DIR)
	iverilog -g2012 -o $(OUT_FILE) $(RTL_SRCS) $(TB_SRCS)

run: compile
	vvp $(OUT_FILE)

clean:
	rm -f $(OUT_FILE)
	rm -f $(SIM_DIR)/*.vcd

.PHONY: all compile run clean