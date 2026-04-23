#include "fpu_stub.h"
#include <ap_int.h>

extern "C" {

void fpu_top(
    bool clk,
    bool rst_n,
    bool ce,
    bool valid_in,
    ap_uint<2> precision,
    ap_uint<2> op,
    ap_uint<64> operand_a,
    ap_uint<64> operand_b,
    bool &valid_out,
    ap_uint<2> &precision_out,
    ap_uint<64> &result,
    ap_uint<5> &exceptions
) {
    // 1. Mark the function as not needing a control bus (or use s_axilite if you want registers)
    #pragma HLS INTERFACE ap_ctrl_none port=return

    // 2. Explicitly map ports to AXI-Lite registers (Control) or simple wires (ap_none)
    #pragma HLS INTERFACE s_axilite port=precision
    #pragma HLS INTERFACE s_axilite port=op
    #pragma HLS INTERFACE s_axilite port=operand_a
    #pragma HLS INTERFACE s_axilite port=operand_b
    
    // 3. Simple outputs as wires
    #pragma HLS INTERFACE ap_none port=valid_out
    #pragma HLS INTERFACE ap_none port=precision_out
    #pragma HLS INTERFACE ap_none port=result
    #pragma HLS INTERFACE ap_none port=exceptions

    // Silence unused warnings
    (void)clk; (void)rst_n; (void)ce; (void)valid_in;
}

}