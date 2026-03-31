// ============================================================================
// D1: Unidad FP16 - IEEE 754 Half Precision
// ============================================================================
// Operaciones: ADD, SUB, MUL, DIV
// Latencia: 1 ciclo (combinacional con registro de salida)
// ============================================================================

module fp16_unit
    import fpu_pkg::*;
(
    input  logic             clk,
    input  logic             rst_n,
    input  logic             valid_in,
    input  operation_e       op,
    input  logic [15:0]      a,
    input  logic [15:0]      b,
    output logic             valid_out,
    output logic [15:0]      result,
    output fp_exceptions_t   exceptions
);

    // ========================================================================
    // Desempaquetado
    // ========================================================================
    
    // Operando A
    logic        a_sign;
    logic [4:0]  a_exp;
    logic [9:0]  a_frac;
    logic [10:0] a_mant;  // Con bit implícito
    logic        a_is_zero, a_is_inf, a_is_nan;
    
    assign a_sign = a[15];
    assign a_exp  = a[14:10];
    assign a_frac = a[9:0];
    assign a_mant = (a_exp == 0) ? {1'b0, a_frac} : {1'b1, a_frac};
    assign a_is_zero = (a_exp == 0) && (a_frac == 0);
    assign a_is_inf  = (a_exp == 5'h1F) && (a_frac == 0);
    assign a_is_nan  = (a_exp == 5'h1F) && (a_frac != 0);
    
    // Operando B
    logic        b_sign;
    logic [4:0]  b_exp;
    logic [9:0]  b_frac;
    logic [10:0] b_mant;
    logic        b_is_zero, b_is_inf, b_is_nan;
    
    assign b_sign = b[15];
    assign b_exp  = b[14:10];
    assign b_frac = b[9:0];
    assign b_mant = (b_exp == 0) ? {1'b0, b_frac} : {1'b1, b_frac};
    assign b_is_zero = (b_exp == 0) && (b_frac == 0);
    assign b_is_inf  = (b_exp == 5'h1F) && (b_frac == 0);
    assign b_is_nan  = (b_exp == 5'h1F) && (b_frac != 0);

    // ========================================================================
    // Operación B efectiva (para SUB)
    // ========================================================================
    
    logic b_sign_eff;
    assign b_sign_eff = (op == OP_SUB) ? ~b_sign : b_sign;

    // ========================================================================
    // ADD/SUB
    // ========================================================================
    
    logic [5:0]  addsub_exp_diff;
    logic [5:0]  addsub_exp_large;
    logic [12:0] addsub_mant_large, addsub_mant_small_shifted;
    logic        addsub_sign_large;
    logic        addsub_a_larger;
    logic [13:0] addsub_mant_sum;
    logic [5:0]  addsub_exp_result;
    logic [9:0]  addsub_frac_result;
    logic        addsub_sign_result;
    logic [15:0] addsub_result;
    
    // Leading zero counter para normalización (sin break para Icarus)
    // Cuenta desde posición 10 (bit implícito normal) hacia abajo
    function automatic [3:0] count_leading_zeros_16(input [12:0] val);
        reg [3:0] cnt;
        reg found;
        integer i;
        begin
            cnt = 4'd11;  // Max shift
            found = 1'b0;
            for (i = 10; i >= 0; i = i - 1) begin
                if (val[i] && !found) begin
                    cnt = 4'd10 - i[3:0];
                    found = 1'b1;
                end
            end
            count_leading_zeros_16 = cnt;
        end
    endfunction
    
    logic [3:0] addsub_lzc;
    
    always_comb begin
        addsub_a_larger = (a_exp > b_exp) || ((a_exp == b_exp) && (a_mant >= b_mant));
        
        // Formato: {2'b00, implicit_bit, frac[9:0]} = 13 bits
        // Bit implícito en posición 10
        if (addsub_a_larger) begin
            addsub_exp_large  = {1'b0, a_exp};
            addsub_mant_large = {2'b00, a_mant};
            addsub_sign_large = a_sign;
            addsub_exp_diff   = {1'b0, a_exp} - {1'b0, b_exp};
            addsub_mant_small_shifted = {2'b00, b_mant} >> addsub_exp_diff;
        end else begin
            addsub_exp_large  = {1'b0, b_exp};
            addsub_mant_large = {2'b00, b_mant};
            addsub_sign_large = b_sign_eff;
            addsub_exp_diff   = {1'b0, b_exp} - {1'b0, a_exp};
            addsub_mant_small_shifted = {2'b00, a_mant} >> addsub_exp_diff;
        end
        
        if (a_sign == b_sign_eff) begin
            addsub_mant_sum = {1'b0, addsub_mant_large} + {1'b0, addsub_mant_small_shifted};
            addsub_sign_result = addsub_sign_large;
        end else begin
            addsub_mant_sum = {1'b0, addsub_mant_large} - {1'b0, addsub_mant_small_shifted};
            addsub_sign_result = addsub_sign_large;
        end
        
        addsub_lzc = count_leading_zeros_16(addsub_mant_sum[12:0]);
        
        // Normalización: bit 11=overflow, bit 10=normal implicit
        if (addsub_mant_sum[11]) begin
            // Overflow: shift right 1
            addsub_exp_result  = addsub_exp_large + 1;
            addsub_frac_result = addsub_mant_sum[10:1];
        end else if (addsub_mant_sum[10]) begin
            // Normal: implicit bit at position 10
            addsub_exp_result  = addsub_exp_large;
            addsub_frac_result = addsub_mant_sum[9:0];
        end else if (addsub_mant_sum == 0) begin
            addsub_exp_result  = 6'd0;
            addsub_frac_result = 10'd0;
            addsub_sign_result = 1'b0;
        end else begin
            // Needs left shift
            if (addsub_exp_large > {2'b0, addsub_lzc}) begin
                logic [13:0] shifted_sum;
                addsub_exp_result  = addsub_exp_large - {2'b0, addsub_lzc};
                shifted_sum = addsub_mant_sum << addsub_lzc;
                addsub_frac_result = shifted_sum[9:0];
            end else begin
                addsub_exp_result  = 6'd0;
                addsub_frac_result = addsub_mant_sum[9:0];
            end
        end
        
        addsub_result = {addsub_sign_result, addsub_exp_result[4:0], addsub_frac_result};
    end

    // ========================================================================
    // MUL
    // ========================================================================
    
    logic [21:0] mul_mant_product;
    logic [5:0]  mul_exp_sum;
    logic [4:0]  mul_exp_result;
    logic [9:0]  mul_frac_result;
    logic        mul_sign_result;
    logic [15:0] mul_result;
    
    always_comb begin
        mul_sign_result = a_sign ^ b_sign;
        mul_mant_product = a_mant * b_mant;  // 11 × 11 = 22 bits
        mul_exp_sum = a_exp + b_exp;
        
        // Normalización
        if (mul_mant_product[21]) begin
            mul_exp_result  = mul_exp_sum - FP16_BIAS + 1;
            mul_frac_result = mul_mant_product[20:11];
        end else begin
            mul_exp_result  = mul_exp_sum - FP16_BIAS;
            mul_frac_result = mul_mant_product[19:10];
        end
        
        mul_result = {mul_sign_result, mul_exp_result, mul_frac_result};
    end

    // ========================================================================
    // DIV
    // ========================================================================
    
    logic [22:0] div_mant_dividend;
    logic [11:0] div_mant_quotient;
    logic signed [6:0]  div_exp_diff;
    logic [4:0]  div_exp_result;
    logic [9:0]  div_frac_result;
    logic        div_sign_result;
    logic [15:0] div_result;
    
    always_comb begin
        div_sign_result = a_sign ^ b_sign;
        div_mant_dividend = {1'b0, a_mant, 11'b0};
        div_mant_quotient = div_mant_dividend / {1'b0, b_mant};
        div_exp_diff = $signed({2'b0, a_exp}) - $signed({2'b0, b_exp}) + $signed({2'b0, FP16_BIAS});
        
        // Quotient has implicit bit at position 11 when in [1.0, 2.0)
        if (div_mant_quotient[11]) begin
            // Quotient in [1.0, 2.0), already normalized
            div_exp_result  = div_exp_diff[4:0];
            div_frac_result = div_mant_quotient[10:1];
        end else begin
            // Quotient in [0.5, 1.0), needs normalization
            div_exp_result  = div_exp_diff[4:0] - 1;
            div_frac_result = div_mant_quotient[9:0];
        end
        
        div_result = {div_sign_result, div_exp_result, div_frac_result};
    end

    // ========================================================================
    // Selección de resultado y casos especiales
    // ========================================================================
    
    logic [15:0] result_comb;
    fp_exceptions_t exc_comb;
    
    always_comb begin
        result_comb = 16'h0;
        exc_comb = '0;
        
        // NaN propagation
        if (a_is_nan || b_is_nan) begin
            result_comb = 16'h7E00;  // qNaN canónico
            exc_comb.invalid = 1'b1;
        end
        // Casos especiales por operación
        else begin
            case (op)
                OP_ADD, OP_SUB: begin
                    if (a_is_inf && b_is_inf && (a_sign != b_sign_eff)) begin
                        result_comb = 16'h7E00;  // Inf - Inf = NaN
                        exc_comb.invalid = 1'b1;
                    end else if (a_is_inf) begin
                        result_comb = {a_sign, 5'h1F, 10'h0};
                    end else if (b_is_inf) begin
                        result_comb = {b_sign_eff, 5'h1F, 10'h0};
                    end else if (a_is_zero && b_is_zero) begin
                        result_comb = 16'h0;
                    end else if (a_is_zero) begin
                        result_comb = {b_sign_eff, b_exp, b_frac};
                    end else if (b_is_zero) begin
                        result_comb = a;
                    end else begin
                        result_comb = addsub_result;
                    end
                end
                
                OP_MUL: begin
                    if ((a_is_inf && b_is_zero) || (a_is_zero && b_is_inf)) begin
                        result_comb = 16'h7E00;  // 0 × Inf = NaN
                        exc_comb.invalid = 1'b1;
                    end else if (a_is_inf || b_is_inf) begin
                        result_comb = {a_sign ^ b_sign, 5'h1F, 10'h0};
                    end else if (a_is_zero || b_is_zero) begin
                        result_comb = {a_sign ^ b_sign, 15'h0};
                    end else begin
                        result_comb = mul_result;
                    end
                end
                
                OP_DIV: begin
                    if (a_is_inf && b_is_inf) begin
                        result_comb = 16'h7E00;  // Inf / Inf = NaN
                        exc_comb.invalid = 1'b1;
                    end else if (a_is_zero && b_is_zero) begin
                        result_comb = 16'h7E00;  // 0 / 0 = NaN
                        exc_comb.invalid = 1'b1;
                    end else if (a_is_inf) begin
                        result_comb = {a_sign ^ b_sign, 5'h1F, 10'h0};
                    end else if (b_is_inf) begin
                        result_comb = {a_sign ^ b_sign, 15'h0};
                    end else if (b_is_zero) begin
                        result_comb = {a_sign ^ b_sign, 5'h1F, 10'h0};  // x/0 = Inf
                        exc_comb.div_zero = 1'b1;
                    end else if (a_is_zero) begin
                        result_comb = {a_sign ^ b_sign, 15'h0};
                    end else begin
                        result_comb = div_result;
                    end
                end
                
                default: result_comb = 16'h0;
            endcase
        end
    end

    // ========================================================================
    // Registro de salida
    // ========================================================================
    
    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            valid_out  <= 1'b0;
            result     <= 16'h0;
            exceptions <= '0;
        end else begin
            valid_out  <= valid_in;
            result     <= result_comb;
            exceptions <= exc_comb;
        end
    end

endmodule
