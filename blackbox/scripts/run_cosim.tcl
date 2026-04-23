# ==============================================================================
# Vitis HLS 2024.1 Co-Simulation Script (SystemVerilog)
# ==============================================================================

# 1. Project Initialization
open_project -reset fpu_hls_project
set_top fpu_top 

# 2. Add C++ Stub
add_files ../src/fpu_stub.cpp -cflags "-std=c++11"

# 3. Add RTL Files (Using .sv extensions)
add_files ../src/fpu_pkg.sv
add_files ../src/fpu_top.sv
add_files ../src/fpu_core.sv
add_files ../src/fp_divider.sv
add_files ../src/fp_pack.sv
add_files ../src/fp_unpack.sv

# Add the SystemVerilog Testbench
add_files -tb ../tb/fpu_tb.sv

# Add the dummy C++ wrapper to satisfy the linker
add_files -tb ../tb/dummy_tb.cpp

# 5. Solution Configuration
open_solution -reset "solution1" -flow_target vitis
set_part {xck26-sfvc784-2LV-c}
create_clock -period 20.0 -name default

# 6. Synthesis and Co-Simulation
# csynth_design generates the RTL wrapper
csynth_design

# cosim_design connects the HLS-generated wrapper to your RTL
# -rtl verilog: Even for SystemVerilog files, "verilog" is the standard target 
#               in HLS for RTL simulation.
cosim_design -rtl verilog -tool xsim -trace_level all
# Export the IP to a zip file for Vivado
export_design -format ip_catalog -output fpu_ip.zip
# Close project
close_project
exit