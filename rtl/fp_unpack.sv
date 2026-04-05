// ============================================================================
// D2: Input Unpacking Stage
// ============================================================================
// Convierte FP16/FP32/FP64 a formato interno unificado (FP64-width)
// - Exponente se rebias a escala FP64
// - Mantisa se left-justify a 52 bits
// - Detecta casos especiales (zero, inf, nan, subnormal)
// ============================================================================

module fp_unpack
    import fpu_pkg::*;
(
    input  logic [63:0]     operand,
    input  precision_e      precision,
    output fp_internal_t    unpacked
);

    // ========================================================================
    // Señales intermedias
    // ========================================================================
    
    logic        sign;
    logic [10:0] exp_raw;       // Exponente extraído (extendido a 11 bits)
    logic [51:0] frac;          // Fracción extraída (extendida a 52 bits)
    logic [10:0] exp_adjusted;  // Exponente rebiased a FP64
    logic [52:0] mant;          // Mantisa con bit implícito
    
    logic is_exp_zero;
    logic is_exp_max;
    logic is_frac_zero;
    
    // ========================================================================
    // Extracción de campos según precisión
    // ========================================================================
    
    always_comb begin
        case (precision)
            PREC_FP16: begin
                // FP16: [15]=sign, [14:10]=exp(5), [9:0]=frac(10)
                sign    = operand[15];
                exp_raw = {6'b0, operand[14:10]};  // Zero-extend a 11 bits
                // Left-justify: frac[9:0] → frac[51:42], resto = 0
                frac    = {operand[9:0], 42'b0};
                
                is_exp_zero = (operand[14:10] == 5'b0);
                is_exp_max  = (operand[14:10] == 5'h1F);
                is_frac_zero = (operand[9:0] == 10'b0);
            end
            
            PREC_FP32: begin
                // FP32: [31]=sign, [30:23]=exp(8), [22:0]=frac(23)
                sign    = operand[31];
                exp_raw = {3'b0, operand[30:23]};  // Zero-extend a 11 bits
                // Left-justify: frac[22:0] → frac[51:29], resto = 0
                frac    = {operand[22:0], 29'b0};
                
                is_exp_zero = (operand[30:23] == 8'b0);
                is_exp_max  = (operand[30:23] == 8'hFF);
                is_frac_zero = (operand[22:0] == 23'b0);
            end
            
            default: begin  // PREC_FP64
                // FP64: [63]=sign, [62:52]=exp(11), [51:0]=frac(52)
                sign    = operand[63];
                exp_raw = operand[62:52];
                frac    = operand[51:0];
                
                is_exp_zero = (operand[62:52] == 11'b0);
                is_exp_max  = (operand[62:52] == 11'h7FF);
                is_frac_zero = (operand[51:0] == 52'b0);
            end
        endcase
    end
    
    // ========================================================================
    // Rebias del exponente a escala FP64
    // ========================================================================
    
    always_comb begin
        if (is_exp_zero) begin
            // Subnormal o cero: exponente interno = 0
            exp_adjusted = 11'b0;
        end else if (is_exp_max) begin
            // Inf o NaN: exponente interno = max
            exp_adjusted = 11'h7FF;
        end else begin
            // Número normal: aplicar ajuste de bias
            case (precision)
                PREC_FP16: exp_adjusted = exp_raw + FP16_BIAS_ADJUST[10:0];
                PREC_FP32: exp_adjusted = exp_raw + FP32_BIAS_ADJUST[10:0];
                default:   exp_adjusted = exp_raw;  // FP64 ya está en escala correcta
            endcase
        end
    end
    
    // ========================================================================
    // Construcción de mantisa con bit implícito
    // ========================================================================
    
    always_comb begin
        if (is_exp_zero) begin
            // Subnormal: bit implícito = 0
            mant = {1'b0, frac};
        end else begin
            // Normal, Inf, NaN: bit implícito = 1
            mant = {1'b1, frac};
        end
    end
    
    // ========================================================================
    // Salida empaquetada
    // ========================================================================
    
    assign unpacked.sign        = sign;
    assign unpacked.exp         = exp_adjusted;
    assign unpacked.mant        = mant;
    assign unpacked.is_zero     = is_exp_zero && is_frac_zero;
    assign unpacked.is_inf      = is_exp_max && is_frac_zero;
    assign unpacked.is_nan      = is_exp_max && !is_frac_zero;
    assign unpacked.is_subnormal = is_exp_zero && !is_frac_zero;

endmodule
