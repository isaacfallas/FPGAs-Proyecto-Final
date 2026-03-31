// ============================================================================
// D1: Unidad FP32 - IEEE 754 Single Precision
// ============================================================================
// Operaciones: ADD, SUB, MUL, DIV
// Latencia: 1 ciclo (combinacional con registro de salida)
// ============================================================================

module fp32_unit
    import fpu_pkg::*;
(
    input  logic             clk,
    input  logic             rst_n,
    input  logic             valid_in,
    input  operation_e       op,
    input  logic [31:0]      a,
    input  logic [31:0]      b,
    output logic             valid_out,
    output logic [31:0]      result,
    output fp_exceptions_t   exceptions
);

    // ========================================================================
    // Desempaquetado
    // ========================================================================
    
    // Operando A
    logic        a_sign;
    logic [7:0]  a_exp;
    logic [22:0] a_frac;
    logic [23:0] a_mant;
    logic        a_is_zero, a_is_inf, a_is_nan;
    
    assign a_sign = a[31];
    assign a_exp  = a[30:23];
    assign a_frac = a[22:0];
    assign a_mant = (a_exp == 0) ? {1'b0, a_frac} : {1'b1, a_frac};
    assign a_is_zero = (a_exp == 0) && (a_frac == 0);
    assign a_is_inf  = (a_exp == 8'hFF) && (a_frac == 0);
    assign a_is_nan  = (a_exp == 8'hFF) && (a_frac != 0);
    
    // Operando B
    logic        b_sign;
    logic [7:0]  b_exp;
    logic [22:0] b_frac;
    logic [23:0] b_mant;
    logic        b_is_zero, b_is_inf, b_is_nan;
    
    assign b_sign = b[31];
    assign b_exp  = b[30:23];
    assign b_frac = b[22:0];
    assign b_mant = (b_exp == 0) ? {1'b0, b_frac} : {1'b1, b_frac};
    assign b_is_zero = (b_exp == 0) && (b_frac == 0);
    assign b_is_inf  = (b_exp == 8'hFF) && (b_frac == 0);
    assign b_is_nan  = (b_exp == 8'hFF) && (b_frac != 0);

    // ========================================================================
    // Operación B efectiva (para SUB)
    // ========================================================================
    
    logic b_sign_eff;
    assign b_sign_eff = (op == OP_SUB) ? ~b_sign : b_sign;

    // ========================================================================
    // ADD/SUB
    // ========================================================================
    
    logic [8:0]  addsub_exp_diff;
    logic [8:0]  addsub_exp_large;
    logic [25:0] addsub_mant_large, addsub_mant_small_shifted;
    logic        addsub_sign_large;
    logic        addsub_a_larger;
    logic [26:0] addsub_mant_sum;
    logic [8:0]  addsub_exp_result;
    logic [22:0] addsub_frac_result;
    logic        addsub_sign_result;
    logic [31:0] addsub_result;
    
    // Leading zero counter para normalización (sin break para Icarus)
    // Cuenta desde posición 23 (bit implícito normal) hacia abajo
    function automatic [4:0] count_leading_zeros_32(input [25:0] val);
        reg [4:0] cnt;
        reg found;
        integer i;
        begin
            cnt = 5'd24;  // Max shift
            found = 1'b0;
            for (i = 23; i >= 0; i = i - 1) begin
                if (val[i] && !found) begin
                    cnt = 5'd23 - i[4:0];
                    found = 1'b1;
                end
            end
            count_leading_zeros_32 = cnt;
        end
    endfunction
    
    logic [4:0] addsub_lzc;
    
    always_comb begin
        addsub_a_larger = (a_exp > b_exp) || ((a_exp == b_exp) && (a_mant >= b_mant));
        
        // Formato: {2'b00, implicit_bit, frac[22:0]} = 26 bits
        // Bit implícito en posición 23
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
        
        addsub_lzc = count_leading_zeros_32(addsub_mant_sum[25:0]);
        
        // Normalización: bit 24=overflow, bit 23=normal implicit
        if (addsub_mant_sum[24]) begin
            // Overflow: shift right 1
            addsub_exp_result  = addsub_exp_large + 1;
            addsub_frac_result = addsub_mant_sum[23:1];
        end else if (addsub_mant_sum[23]) begin
            // Normal: implicit bit at position 23
            addsub_exp_result  = addsub_exp_large;
            addsub_frac_result = addsub_mant_sum[22:0];
        end else if (addsub_mant_sum == 0) begin
            addsub_exp_result  = 9'd0;
            addsub_frac_result = 23'd0;
            addsub_sign_result = 1'b0;
        end else begin
            // Needs left shift
            if (addsub_exp_large > {4'b0, addsub_lzc}) begin
                logic [26:0] shifted_sum;
                addsub_exp_result  = addsub_exp_large - {4'b0, addsub_lzc};
                shifted_sum = addsub_mant_sum << addsub_lzc;
                addsub_frac_result = shifted_sum[22:0];
            end else begin
                addsub_exp_result  = 9'd0;
                addsub_frac_result = addsub_mant_sum[22:0];
            end
        end
        
        addsub_result = {addsub_sign_result, addsub_exp_result[7:0], addsub_frac_result};
    end

    // ========================================================================
    // MUL
    // ========================================================================
    
    logic [47:0] mul_mant_product;
    logic [8:0]  mul_exp_sum;
    logic [7:0]  mul_exp_result;
    logic [22:0] mul_frac_result;
    logic        mul_sign_result;
    logic [31:0] mul_result;
    
    always_comb begin
        mul_sign_result = a_sign ^ b_sign;
        mul_mant_product = a_mant * b_mant;  // 24 × 24 = 48 bits
        mul_exp_sum = a_exp + b_exp;
        
        if (mul_mant_product[47]) begin
            mul_exp_result  = mul_exp_sum - FP32_BIAS + 1;
            mul_frac_result = mul_mant_product[46:24];
        end else begin
            mul_exp_result  = mul_exp_sum - FP32_BIAS;
            mul_frac_result = mul_mant_product[45:23];
        end
        
        mul_result = {mul_sign_result, mul_exp_result, mul_frac_result};
    end

    // ========================================================================
    // DIV
    // ========================================================================
    
    logic [48:0] div_mant_dividend;
    logic [24:0] div_mant_quotient;
    logic signed [9:0]  div_exp_diff;
    logic [7:0]  div_exp_result;
    logic [22:0] div_frac_result;
    logic        div_sign_result;
    logic [31:0] div_result;
    
    always_comb begin
        div_sign_result = a_sign ^ b_sign;
        div_mant_dividend = {1'b0, a_mant, 24'b0};
        div_mant_quotient = div_mant_dividend / {1'b0, b_mant};
        div_exp_diff = $signed({2'b0, a_exp}) - $signed({2'b0, b_exp}) + $signed({2'b0, FP32_BIAS});
        
        // Quotient has implicit bit at position 24 when in [1.0, 2.0)
        if (div_mant_quotient[24]) begin
            // Quotient in [1.0, 2.0), already normalized
            div_exp_result  = div_exp_diff[7:0];
            div_frac_result = div_mant_quotient[23:1];
        end else begin
            // Quotient in [0.5, 1.0), needs normalization
            div_exp_result  = div_exp_diff[7:0] - 1;
            div_frac_result = div_mant_quotient[22:0];
        end
        
        div_result = {div_sign_result, div_exp_result, div_frac_result};
    end

    // ========================================================================
    // Selección de resultado y casos especiales
    // ========================================================================
    
    logic [31:0] result_comb;
    fp_exceptions_t exc_comb;
    
    always_comb begin
        result_comb = 32'h0;
        exc_comb = '0;
        
        if (a_is_nan || b_is_nan) begin
            result_comb = 32'h7FC00000;  // qNaN canónico
            exc_comb.invalid = 1'b1;
        end
        else begin
            case (op)
                OP_ADD, OP_SUB: begin
                    if (a_is_inf && b_is_inf && (a_sign != b_sign_eff)) begin
                        result_comb = 32'h7FC00000;
                        exc_comb.invalid = 1'b1;
                    end else if (a_is_inf) begin
                        result_comb = {a_sign, 8'hFF, 23'h0};
                    end else if (b_is_inf) begin
                        result_comb = {b_sign_eff, 8'hFF, 23'h0};
                    end else if (a_is_zero && b_is_zero) begin
                        result_comb = 32'h0;
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
                        result_comb = 32'h7FC00000;
                        exc_comb.invalid = 1'b1;
                    end else if (a_is_inf || b_is_inf) begin
                        result_comb = {a_sign ^ b_sign, 8'hFF, 23'h0};
                    end else if (a_is_zero || b_is_zero) begin
                        result_comb = {a_sign ^ b_sign, 31'h0};
                    end else begin
                        result_comb = mul_result;
                    end
                end
                
                OP_DIV: begin
                    if (a_is_inf && b_is_inf) begin
                        result_comb = 32'h7FC00000;
                        exc_comb.invalid = 1'b1;
                    end else if (a_is_zero && b_is_zero) begin
                        result_comb = 32'h7FC00000;
                        exc_comb.invalid = 1'b1;
                    end else if (a_is_inf) begin
                        result_comb = {a_sign ^ b_sign, 8'hFF, 23'h0};
                    end else if (b_is_inf) begin
                        result_comb = {a_sign ^ b_sign, 31'h0};
                    end else if (b_is_zero) begin
                        result_comb = {a_sign ^ b_sign, 8'hFF, 23'h0};
                        exc_comb.div_zero = 1'b1;
                    end else if (a_is_zero) begin
                        result_comb = {a_sign ^ b_sign, 31'h0};
                    end else begin
                        result_comb = div_result;
                    end
                end
                
                default: result_comb = 32'h0;
            endcase
        end
    end

    // ========================================================================
    // Registro de salida
    // ========================================================================
    
    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            valid_out  <= 1'b0;
            result     <= 32'h0;
            exceptions <= '0;
        end else begin
            valid_out  <= valid_in;
            result     <= result_comb;
            exceptions <= exc_comb;
        end
    end

endmodule
