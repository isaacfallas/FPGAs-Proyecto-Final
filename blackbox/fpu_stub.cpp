#include "fpu_stub.h"

extern "C" {

void fpu_top_stub(
    bool clk,
    bool rst_n,
    bool ce,
    bool valid_in,
    ap_uint<2> precision, // Maps to precision_e
    ap_uint<2> op,        // Maps to operation_e
    ap_uint<64> operand_a,
    ap_uint<64> operand_b,
    bool &valid_out,
    ap_uint<2> &precision_out,
    ap_uint<64> &result,
    ap_uint<5> &exceptions // Packed bits representing the struct
) {
    // 1. Tell HLS this function is just an interface to existing RTL
    #pragma HLS INTERFACE ap_ctrl_none port=return
    
    // 2. Define Ports (Match SystemVerilog names in fpu_top.sv)
    #pragma HLS INTERFACE port=clk clock
    #pragma HLS INTERFACE port=rst_n reset
    #pragma HLS INTERFACE port=ce
    #pragma HLS INTERFACE port=valid_in
    #pragma HLS INTERFACE port=precision
    #pragma HLS INTERFACE port=op
    #pragma HLS INTERFACE port=operand_a
    #pragma HLS INTERFACE port=operand_b
    #pragma HLS INTERFACE port=valid_out
    #pragma HLS INTERFACE port=precision_out
    #pragma HLS INTERFACE port=result
    #pragma HLS INTERFACE port=exceptions

    // 3. Optional: Map this to the specific SV file
    // Note: Vitis HLS usually handles this via project file assignment,
    // but you can ensure the association here.
}

}