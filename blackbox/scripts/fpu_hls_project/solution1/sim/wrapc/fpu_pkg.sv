// ============================================================================
// D2: Package para FPU Unified Datapath
// ============================================================================
// Arquitectura: Un único datapath de 64 bits que maneja FP16/FP32/FP64
// El core siempre opera en formato FP64 internamente
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
    
    // FP16 (Half Precision)
    localparam int FP16_EXP_BITS  = 5;
    localparam int FP16_FRAC_BITS = 10;
    localparam int FP16_BIAS      = 15;
    
    // FP32 (Single Precision)
    localparam int FP32_EXP_BITS  = 8;
    localparam int FP32_FRAC_BITS = 23;
    localparam int FP32_BIAS      = 127;
    
    // FP64 (Double Precision)
    localparam int FP64_EXP_BITS  = 11;
    localparam int FP64_FRAC_BITS = 52;
    localparam int FP64_BIAS      = 1023;

    // ========================================================================
    // Ajustes de bias para normalización interna
    // Cuando convertimos FP16/FP32 a formato interno FP64:
    //   e_internal = e_raw + BIAS_ADJUST
    // ========================================================================
    localparam int FP32_BIAS_ADJUST = 1023 - 127;   // = 896
    localparam int FP16_BIAS_ADJUST = 1023 - 15;    // = 1008

    // ========================================================================
    // Posiciones de redondeo según precisión
    // La mantisa interna es de 52 bits (más bit implícito = 53)
    // El bit de redondeo está en diferentes posiciones según la precisión
    // ========================================================================
    localparam int FP64_ROUND_POS = 0;    // Todos los 52 bits se mantienen
    localparam int FP32_ROUND_POS = 29;   // Solo 23 bits se mantienen (52-23=29)
    localparam int FP16_ROUND_POS = 42;   // Solo 10 bits se mantienen (52-10=42)

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

    // ========================================================================
    // Formato interno desempaquetado (siempre en escala FP64)
    // ========================================================================
    typedef struct packed {
        logic        sign;
        logic [10:0] exp;       // Exponente rebiased a FP64 (11 bits)
        logic [52:0] mant;      // Mantisa con bit implícito (1.xxx... = 53 bits)
        logic        is_zero;
        logic        is_inf;
        logic        is_nan;
        logic        is_subnormal;
    } fp_internal_t;

endpackage
