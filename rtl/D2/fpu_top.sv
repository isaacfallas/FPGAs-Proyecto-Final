// ============================================================================
// D2: FPU Top - Unified Datapath Architecture
// ============================================================================
// Arquitectura:
//   - Un único datapath de 64 bits
//   - fp_unpack: Convierte FP16/FP32/FP64 → formato interno FP64
//   - fpu_core: Ejecuta operación en formato FP64
//   - fp_pack: Convierte formato interno → FP16/FP32/FP64
//
// Ventajas vs D1 (SIMD):
//   - Menor área (1 unidad vs 7)
//   - Más fácil de verificar
//   - Diseño estándar en FPUs modernas
//
// Desventajas:
//   - Sin throughput SIMD para FP16/FP32
//   - 1 operación por ciclo independiente de la precisión
// ============================================================================

module fpu_top
    import fpu_pkg::*;
(
    input  logic             clk,
    input  logic             rst_n,
    
    // Entrada
    input  logic             valid_in,
    input  precision_e       precision,
    input  operation_e       op,
    input  logic [63:0]      operand_a,
    input  logic [63:0]      operand_b,
    
    // Salida
    output logic             valid_out,
    output precision_e       precision_out,
    output logic [63:0]      result,
    output fp_exceptions_t   exceptions
);

    // ========================================================================
    // Stage 1: Input Unpacking (Combinacional)
    // ========================================================================
    
    fp_internal_t a_unpacked, b_unpacked;
    
    fp_unpack unpack_a (
        .operand   (operand_a),
        .precision (precision),
        .unpacked  (a_unpacked)
    );
    
    fp_unpack unpack_b (
        .operand   (operand_b),
        .precision (precision),
        .unpacked  (b_unpacked)
    );

    // ========================================================================
    // Stage 2: Execution Core (Combinacional + Registro de salida)
    // ========================================================================
    
    logic           core_valid_out;
    fp_internal_t   core_result;
    fp_exceptions_t core_exceptions;
    
    fpu_core core (
        .clk        (clk),
        .rst_n      (rst_n),
        .valid_in   (valid_in),
        .op         (op),
        .a          (a_unpacked),
        .b          (b_unpacked),
        .valid_out  (core_valid_out),
        .result     (core_result),
        .exceptions (core_exceptions)
    );

    // ========================================================================
    // Pipeline de precisión (para el pack stage)
    // ========================================================================
    
    precision_e precision_r;
    
    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            precision_r <= PREC_FP64;
        end else if (valid_in) begin
            precision_r <= precision;
        end
    end

    // ========================================================================
    // Stage 3: Output Packing (Combinacional)
    // ========================================================================
    
    logic [63:0] packed_result;
    logic        pack_overflow;
    logic        pack_underflow;
    
    fp_pack pack (
        .internal      (core_result),
        .precision     (precision_r),
        .packed_result (packed_result),
        .overflow      (pack_overflow),
        .underflow     (pack_underflow)
    );

    // ========================================================================
    // Salidas
    // ========================================================================
    
    assign valid_out     = core_valid_out;
    assign precision_out = precision_r;
    assign result        = packed_result;
    
    // Combinar excepciones del core con overflow/underflow del pack
    assign exceptions.invalid   = core_exceptions.invalid;
    assign exceptions.div_zero  = core_exceptions.div_zero;
    assign exceptions.overflow  = core_exceptions.overflow | pack_overflow;
    assign exceptions.underflow = core_exceptions.underflow | pack_underflow;
    assign exceptions.inexact   = core_exceptions.inexact;

endmodule
