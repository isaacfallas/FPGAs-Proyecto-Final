// ============================================================================
// D1: FPU Top - Arquitectura SIMD con FPUs Separadas
// ============================================================================
// Throughput:
//   - FP16: 4 operaciones por ciclo
//   - FP32: 2 operaciones por ciclo
//   - FP64: 1 operación por ciclo
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
    // Señales para las unidades FP16 (4 instancias)
    // ========================================================================
    
    logic [3:0]  fp16_valid_out;
    logic [15:0] fp16_result [4];
    fp_exceptions_t fp16_exc [4];

    // ========================================================================
    // Señales para las unidades FP32 (2 instancias)
    // ========================================================================
    
    logic [1:0]  fp32_valid_out;
    logic [31:0] fp32_result [2];
    fp_exceptions_t fp32_exc [2];

    // ========================================================================
    // Señales para la unidad FP64 (1 instancia)
    // ========================================================================
    
    logic        fp64_valid_out;
    logic [63:0] fp64_result;
    fp_exceptions_t fp64_exc;

    // ========================================================================
    // Enable por precisión
    // ========================================================================
    
    logic en_fp16, en_fp32, en_fp64;
    
    assign en_fp16 = (precision == PREC_FP16);
    assign en_fp32 = (precision == PREC_FP32);
    assign en_fp64 = (precision == PREC_FP64);

    // ========================================================================
    // Instancias FP16 (4 unidades)
    // ========================================================================
    
    // FP16 #0: operand_a[15:0], operand_b[15:0]
    fp16_unit u_fp16_0 (
        .clk       (clk),
        .rst_n     (rst_n),
        .valid_in  (valid_in && en_fp16),
        .op        (op),
        .a         (operand_a[15:0]),
        .b         (operand_b[15:0]),
        .valid_out (fp16_valid_out[0]),
        .result    (fp16_result[0]),
        .exceptions(fp16_exc[0])
    );
    
    // FP16 #1: operand_a[31:16], operand_b[31:16]
    fp16_unit u_fp16_1 (
        .clk       (clk),
        .rst_n     (rst_n),
        .valid_in  (valid_in && en_fp16),
        .op        (op),
        .a         (operand_a[31:16]),
        .b         (operand_b[31:16]),
        .valid_out (fp16_valid_out[1]),
        .result    (fp16_result[1]),
        .exceptions(fp16_exc[1])
    );
    
    // FP16 #2: operand_a[47:32], operand_b[47:32]
    fp16_unit u_fp16_2 (
        .clk       (clk),
        .rst_n     (rst_n),
        .valid_in  (valid_in && en_fp16),
        .op        (op),
        .a         (operand_a[47:32]),
        .b         (operand_b[47:32]),
        .valid_out (fp16_valid_out[2]),
        .result    (fp16_result[2]),
        .exceptions(fp16_exc[2])
    );
    
    // FP16 #3: operand_a[63:48], operand_b[63:48]
    fp16_unit u_fp16_3 (
        .clk       (clk),
        .rst_n     (rst_n),
        .valid_in  (valid_in && en_fp16),
        .op        (op),
        .a         (operand_a[63:48]),
        .b         (operand_b[63:48]),
        .valid_out (fp16_valid_out[3]),
        .result    (fp16_result[3]),
        .exceptions(fp16_exc[3])
    );

    // ========================================================================
    // Instancias FP32 (2 unidades)
    // ========================================================================
    
    // FP32 #0: operand_a[31:0], operand_b[31:0]
    fp32_unit u_fp32_0 (
        .clk       (clk),
        .rst_n     (rst_n),
        .valid_in  (valid_in && en_fp32),
        .op        (op),
        .a         (operand_a[31:0]),
        .b         (operand_b[31:0]),
        .valid_out (fp32_valid_out[0]),
        .result    (fp32_result[0]),
        .exceptions(fp32_exc[0])
    );
    
    // FP32 #1: operand_a[63:32], operand_b[63:32]
    fp32_unit u_fp32_1 (
        .clk       (clk),
        .rst_n     (rst_n),
        .valid_in  (valid_in && en_fp32),
        .op        (op),
        .a         (operand_a[63:32]),
        .b         (operand_b[63:32]),
        .valid_out (fp32_valid_out[1]),
        .result    (fp32_result[1]),
        .exceptions(fp32_exc[1])
    );

    // ========================================================================
    // Instancia FP64 (1 unidad)
    // ========================================================================
    
    fp64_unit u_fp64 (
        .clk       (clk),
        .rst_n     (rst_n),
        .valid_in  (valid_in && en_fp64),
        .op        (op),
        .a         (operand_a),
        .b         (operand_b),
        .valid_out (fp64_valid_out),
        .result    (fp64_result),
        .exceptions(fp64_exc)
    );

    // ========================================================================
    // Pipeline de precisión
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
    // Multiplexor de salida
    // ========================================================================
    
    always_comb begin
        case (precision_r)
            PREC_FP16: begin
                valid_out = fp16_valid_out[0];  // Todas llegan al mismo tiempo
                result = {fp16_result[3], fp16_result[2], 
                          fp16_result[1], fp16_result[0]};
                exceptions = fp16_exc[0] | fp16_exc[1] | fp16_exc[2] | fp16_exc[3];
                precision_out = PREC_FP16;
            end
            
            PREC_FP32: begin
                valid_out = fp32_valid_out[0];
                result = {fp32_result[1], fp32_result[0]};
                exceptions = fp32_exc[0] | fp32_exc[1];
                precision_out = PREC_FP32;
            end
            
            PREC_FP64: begin
                valid_out = fp64_valid_out;
                result = fp64_result;
                exceptions = fp64_exc;
                precision_out = PREC_FP64;
            end
            
            default: begin
                valid_out = 1'b0;
                result = 64'h0;
                exceptions = '0;
                precision_out = PREC_FP64;
            end
        endcase
    end

endmodule
