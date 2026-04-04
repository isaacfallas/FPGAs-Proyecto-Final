// ============================================================================
// D2: Output Packing Stage
// ============================================================================
// Convierte formato interno (FP64-width) de vuelta a FP16/FP32/FP64
// - Exponente se rebias a la escala del formato objetivo
// - Mantisa se trunca a los bits del formato objetivo
// - Maneja overflow/underflow según el rango del formato
// ============================================================================

module fp_pack
    import fpu_pkg::*;
(
    input  fp_internal_t    internal,
    input  precision_e      precision,
    output logic [63:0]     packed_result,
    output logic            overflow,
    output logic            underflow
);

    // ========================================================================
    // Parámetros de rango por formato
    // ========================================================================
    
    // Rangos de exponente válido (en escala FP64)
    // FP16: emin=1, emax=30 → en FP64: 1+1008=1009, 30+1008=1038
    // FP32: emin=1, emax=254 → en FP64: 1+896=897, 254+896=1150
    // FP64: emin=1, emax=2046
    
    localparam logic [10:0] FP16_EMIN_FP64 = 11'd1009;  // 1 + 1008
    localparam logic [10:0] FP16_EMAX_FP64 = 11'd1038;  // 30 + 1008
    localparam logic [10:0] FP32_EMIN_FP64 = 11'd897;   // 1 + 896
    localparam logic [10:0] FP32_EMAX_FP64 = 11'd1150;  // 254 + 896
    localparam logic [10:0] FP64_EMIN      = 11'd1;
    localparam logic [10:0] FP64_EMAX      = 11'd2046;
    
    // ========================================================================
    // Señales intermedias
    // ========================================================================
    
    logic [10:0] exp_min, exp_max;
    logic [10:0] exp_out;
    logic [51:0] frac_out;
    logic        sign_out;
    
    logic is_overflow;
    logic is_underflow;
    
    // ========================================================================
    // Selección de rangos según precisión
    // ========================================================================
    
    always_comb begin
        case (precision)
            PREC_FP16: begin
                exp_min = FP16_EMIN_FP64;
                exp_max = FP16_EMAX_FP64;
            end
            PREC_FP32: begin
                exp_min = FP32_EMIN_FP64;
                exp_max = FP32_EMAX_FP64;
            end
            default: begin  // PREC_FP64
                exp_min = FP64_EMIN;
                exp_max = FP64_EMAX;
            end
        endcase
    end
    
    // ========================================================================
    // Detección de overflow/underflow
    // ========================================================================
    
    assign is_overflow  = !internal.is_nan && !internal.is_inf && 
                          !internal.is_zero && (internal.exp > exp_max);
    assign is_underflow = !internal.is_nan && !internal.is_inf && 
                          !internal.is_zero && (internal.exp < exp_min) && (internal.exp != 11'b0);
    
    assign overflow  = is_overflow;
    assign underflow = is_underflow;
    
    // ========================================================================
    // Conversión de exponente de FP64 al formato objetivo
    // ========================================================================
    
    logic [10:0] exp_rebias;
    
    always_comb begin
        if (internal.is_zero || internal.is_subnormal) begin
            exp_rebias = 11'b0;
        end else if (internal.is_inf || internal.is_nan || is_overflow) begin
            // Saturar a exponente máximo (Inf/NaN encoding)
            case (precision)
                PREC_FP16: exp_rebias = 11'd31;   // 0x1F
                PREC_FP32: exp_rebias = 11'd255;  // 0xFF
                default:   exp_rebias = 11'd2047; // 0x7FF
            endcase
        end else if (is_underflow) begin
            exp_rebias = 11'b0;  // Flush to zero (simplificado)
        end else begin
            // Número normal: quitar el ajuste de bias
            case (precision)
                PREC_FP16: exp_rebias = internal.exp - FP16_BIAS_ADJUST[10:0];
                PREC_FP32: exp_rebias = internal.exp - FP32_BIAS_ADJUST[10:0];
                default:   exp_rebias = internal.exp;
            endcase
        end
    end
    
    // ========================================================================
    // Empaquetado del resultado según precisión
    // ========================================================================
    
    always_comb begin
        sign_out = internal.sign;
        
        // Casos especiales
        if (internal.is_nan) begin
            // Quiet NaN canónico
            case (precision)
                PREC_FP16: packed_result = {48'b0, sign_out, 5'h1F, 1'b1, 9'b0};
                PREC_FP32: packed_result = {32'b0, sign_out, 8'hFF, 1'b1, 22'b0};
                default:   packed_result = {sign_out, 11'h7FF, 1'b1, 51'b0};
            endcase
        end else if (internal.is_inf || is_overflow) begin
            // Infinito
            case (precision)
                PREC_FP16: packed_result = {48'b0, sign_out, 5'h1F, 10'b0};
                PREC_FP32: packed_result = {32'b0, sign_out, 8'hFF, 23'b0};
                default:   packed_result = {sign_out, 11'h7FF, 52'b0};
            endcase
        end else if (internal.is_zero || is_underflow) begin
            // Cero (flush to zero para underflow)
            case (precision)
                PREC_FP16: packed_result = {48'b0, sign_out, 15'b0};
                PREC_FP32: packed_result = {32'b0, sign_out, 31'b0};
                default:   packed_result = {sign_out, 63'b0};
            endcase
        end else begin
            // Número normal
            case (precision)
                PREC_FP16: begin
                    // Truncar mantisa: tomar bits [51:42] de la fracción
                    packed_result = {48'b0, sign_out, exp_rebias[4:0], internal.mant[51:42]};
                end
                PREC_FP32: begin
                    // Truncar mantisa: tomar bits [51:29] de la fracción
                    packed_result = {32'b0, sign_out, exp_rebias[7:0], internal.mant[51:29]};
                end
                default: begin  // PREC_FP64
                    packed_result = {sign_out, exp_rebias, internal.mant[51:0]};
                end
            endcase
        end
    end

endmodule
