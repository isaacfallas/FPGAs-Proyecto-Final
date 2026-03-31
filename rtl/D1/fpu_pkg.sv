// ============================================================================
// D1: Package común para FPU SIMD
// ============================================================================

package fpu_pkg;

    // ========================================================================
    // Precisiones soportadas
    // ========================================================================
    typedef enum logic [1:0] {
        PREC_FP16 = 2'b00,
        PREC_FP32 = 2'b01,
        PREC_FP64 = 2'b10
    } precision_e;

    // ========================================================================
    // Operaciones soportadas
    // ========================================================================
    typedef enum logic [1:0] {
        OP_ADD = 2'b00,
        OP_SUB = 2'b01,
        OP_MUL = 2'b10,
        OP_DIV = 2'b11
    } operation_e;

    // ========================================================================
    // Parámetros IEEE 754
    // ========================================================================
    
    // FP16
    localparam int FP16_EXP_BITS  = 5;
    localparam int FP16_FRAC_BITS = 10;
    localparam int FP16_BIAS      = 15;
    
    // FP32
    localparam int FP32_EXP_BITS  = 8;
    localparam int FP32_FRAC_BITS = 23;
    localparam int FP32_BIAS      = 127;
    
    // FP64
    localparam int FP64_EXP_BITS  = 11;
    localparam int FP64_FRAC_BITS = 52;
    localparam int FP64_BIAS      = 1023;

    // ========================================================================
    // Excepciones IEEE 754
    // ========================================================================
    typedef struct packed {
        logic invalid;
        logic div_zero;
        logic overflow;
        logic underflow;
        logic inexact;
    } fp_exceptions_t;

endpackage
