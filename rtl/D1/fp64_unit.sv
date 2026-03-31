// ============================================================================
// D1: Unidad FP64 - IEEE 754 Double Precision
// ============================================================================
// Operaciones: ADD, SUB, MUL, DIV
// Latencia: 1 ciclo (combinacional con registro de salida)
// ============================================================================

module fp64_unit
    import fpu_pkg::*;
(
    input  logic             clk,
    input  logic             rst_n,
    input  logic             valid_in,
    input  operation_e       op,
    input  logic [63:0]      a,
    input  logic [63:0]      b,
    output logic             valid_out,
    output logic [63:0]      result,
    output fp_exceptions_t   exceptions
);

    // ========================================================================
    // Desempaquetado
    // ========================================================================
    
    // Operando A
    logic        a_sign;
    logic [10:0] a_exp;
    logic [51:0] a_frac;
    logic [52:0] a_mant;
    logic        a_is_zero, a_is_inf, a_is_nan;
    
    assign a_sign = a[63];
    assign a_exp  = a[62:52];
    assign a_frac = a[51:0];
    assign a_mant = (a_exp == 0) ? {1'b0, a_frac} : {1'b1, a_frac};
    assign a_is_zero = (a_exp == 0) && (a_frac == 0);
    assign a_is_inf  = (a_exp == 11'h7FF) && (a_frac == 0);
    assign a_is_nan  = (a_exp == 11'h7FF) && (a_frac != 0);
    
    // Operando B
    logic        b_sign;
    logic [10:0] b_exp;
    logic [51:0] b_frac;
    logic [52:0] b_mant;
    logic        b_is_zero, b_is_inf, b_is_nan;
    
    assign b_sign = b[63];
    assign b_exp  = b[62:52];
    assign b_frac = b[51:0];
    assign b_mant = (b_exp == 0) ? {1'b0, b_frac} : {1'b1, b_frac};
    assign b_is_zero = (b_exp == 0) && (b_frac == 0);
    assign b_is_inf  = (b_exp == 11'h7FF) && (b_frac == 0);
    assign b_is_nan  = (b_exp == 11'h7FF) && (b_frac != 0);

    // ========================================================================
    // Operación B efectiva (para SUB)
    // ========================================================================
    
    logic b_sign_eff;
    assign b_sign_eff = (op == OP_SUB) ? ~b_sign : b_sign;

    // ========================================================================
    // ADD/SUB
    // ========================================================================
    // Formato de mantisa:
    //   a_mant[52:0] = {implicit_bit, frac[51:0]}  donde implicit_bit está en posición 52
    //   Para la suma usamos 55 bits: {00, implicit, frac} para tener espacio para carry
    // ========================================================================
    
    logic [11:0] addsub_exp_diff;
    logic [11:0] addsub_exp_large;
    logic [54:0] addsub_mant_large, addsub_mant_small_shifted;  // 55 bits
    logic        addsub_sign_large;
    logic        addsub_a_larger;
    logic [55:0] addsub_mant_sum;  // 56 bits para carry
    logic [11:0] addsub_exp_result;
    logic [51:0] addsub_frac_result;
    logic        addsub_sign_result;
    logic [63:0] addsub_result;
    
    // Leading zero counter para normalización (sin break para Icarus)
    // Count leading zeros starting from position 52 (normal implicit bit position)
    // Returns how many positions to shift left to get implicit bit to position 52
    function automatic [5:0] count_leading_zeros(input [54:0] val);
        reg [5:0] cnt;
        reg found;
        integer i;
        begin
            cnt = 6'd53;  // Max shift if no 1 found (all zeros up to bit 52)
            found = 1'b0;
            for (i = 52; i >= 0; i = i - 1) begin
                if (val[i] && !found) begin
                    cnt = 6'd52 - i[5:0];  // Distance from position 52
                    found = 1'b1;
                end
            end
            count_leading_zeros = cnt;
        end
    endfunction
    
    logic [5:0] addsub_lzc;
    
    always_comb begin
        // Determinar cuál operando es más grande
        addsub_a_larger = (a_exp > b_exp) || ((a_exp == b_exp) && (a_mant >= b_mant));
        
        // Extender mantisas a 55 bits: {00, implicit_bit, frac[51:0]}
        // El bit implícito queda en posición 52
        if (addsub_a_larger) begin
            addsub_exp_large  = {1'b0, a_exp};
            addsub_mant_large = {2'b00, a_mant};  // 55 bits
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
        
        // Suma o resta efectiva
        if (a_sign == b_sign_eff) begin
            addsub_mant_sum = {1'b0, addsub_mant_large} + {1'b0, addsub_mant_small_shifted};
            addsub_sign_result = addsub_sign_large;
        end else begin
            addsub_mant_sum = {1'b0, addsub_mant_large} - {1'b0, addsub_mant_small_shifted};
            addsub_sign_result = addsub_sign_large;
        end
        
        // Normalización
        // addsub_mant_sum[55:0] donde:
        //   bit 55 = not used (extra for safety)
        //   bit 54 = double overflow (muy raro, solo si carry de bit 53)
        //   bit 53 = overflow (resultado >= 2.0)
        //   bit 52 = implicit bit posición normal
        //   bits 51-0 = fracción
        
        addsub_lzc = count_leading_zeros(addsub_mant_sum[54:0]);
        
        if (addsub_mant_sum[54]) begin
            // Double overflow: shift right 2
            addsub_exp_result  = addsub_exp_large + 2;
            addsub_frac_result = addsub_mant_sum[53:2];
        end else if (addsub_mant_sum[53]) begin
            // Overflow: hay un 1 en posición 53, resultado es >= 2.0
            // Necesitamos shift right 1: exponente +1, fracción = bits [52:1]
            addsub_exp_result  = addsub_exp_large + 1;
            addsub_frac_result = addsub_mant_sum[52:1];
        end else if (addsub_mant_sum[52]) begin
            // Normal: bit implícito en posición 52 (1.xxxxx)
            // Exponente sin cambio, fracción = bits [51:0]
            addsub_exp_result  = addsub_exp_large;
            addsub_frac_result = addsub_mant_sum[51:0];
        end else if (addsub_mant_sum == 0) begin
            // Resultado cero
            addsub_exp_result  = 12'd0;
            addsub_frac_result = 52'd0;
            addsub_sign_result = 1'b0;
        end else begin
            // Necesita shift left: el bit más significativo está por debajo de posición 52
            if (addsub_exp_large > {6'b0, addsub_lzc}) begin
                logic [55:0] shifted_sum;
                addsub_exp_result  = addsub_exp_large - {6'b0, addsub_lzc};
                shifted_sum = addsub_mant_sum << addsub_lzc;
                // Después del shift, el bit implícito está en posición 52
                addsub_frac_result = shifted_sum[51:0];
            end else begin
                // Subnormal
                addsub_exp_result  = 12'd0;
                addsub_frac_result = addsub_mant_sum[51:0];
            end
        end
        
        addsub_result = {addsub_sign_result, addsub_exp_result[10:0], addsub_frac_result};
    end

    // ========================================================================
    // MUL
    // ========================================================================
    
    logic [105:0] mul_mant_product;
    logic [11:0]  mul_exp_sum;
    logic [10:0]  mul_exp_result;
    logic [51:0]  mul_frac_result;
    logic         mul_sign_result;
    logic [63:0]  mul_result;
    
    always_comb begin
        mul_sign_result = a_sign ^ b_sign;
        mul_mant_product = a_mant * b_mant;  // 53 × 53 = 106 bits
        mul_exp_sum = a_exp + b_exp;
        
        if (mul_mant_product[105]) begin
            mul_exp_result  = mul_exp_sum - FP64_BIAS + 1;
            mul_frac_result = mul_mant_product[104:53];
        end else begin
            mul_exp_result  = mul_exp_sum - FP64_BIAS;
            mul_frac_result = mul_mant_product[103:52];
        end
        
        mul_result = {mul_sign_result, mul_exp_result, mul_frac_result};
    end

    // ========================================================================
    // DIV
    // ========================================================================
    
    logic [106:0] div_mant_dividend;
    logic [53:0]  div_mant_quotient;
    logic signed [12:0]  div_exp_diff;
    logic [10:0]  div_exp_result;
    logic [51:0]  div_frac_result;
    logic         div_sign_result;
    logic [63:0]  div_result;
    
    always_comb begin
        div_sign_result = a_sign ^ b_sign;
        
        // Dividendo: mantisa_a << 53 para obtener precisión completa
        div_mant_dividend = {1'b0, a_mant, 53'b0};
        div_mant_quotient = div_mant_dividend / {1'b0, b_mant};
        
        // Exponente: exp_a - exp_b + bias
        div_exp_diff = $signed({2'b0, a_exp}) - $signed({2'b0, b_exp}) + $signed({2'b0, FP64_BIAS});
        
        // Normalización del cociente
        // El cociente de dos mantisas normalizadas [1.0, 2.0) está en [0.5, 2.0)
        // quotient = (a_mant/b_mant) * 2^53, entonces:
        //   - bit 53 = 1 significa cociente en [1.0, 2.0) - ya normalizado
        //   - bit 53 = 0 significa cociente en [0.5, 1.0) - necesita shift left
        if (div_mant_quotient[53]) begin
            // Cociente en [1.0, 2.0), ya normalizado
            // bit implícito en posición 53, fracción en [52:1]
            div_exp_result  = div_exp_diff[10:0];
            div_frac_result = div_mant_quotient[52:1];
        end else begin
            // Cociente en [0.5, 1.0), necesita shift left
            // bit implícito en posición 52, fracción en [51:0], exp - 1
            div_exp_result  = div_exp_diff[10:0] - 1;
            div_frac_result = div_mant_quotient[51:0];
        end
        
        div_result = {div_sign_result, div_exp_result, div_frac_result};
    end

    // ========================================================================
    // Selección de resultado y casos especiales
    // ========================================================================
    
    logic [63:0] result_comb;
    fp_exceptions_t exc_comb;
    
    always_comb begin
        result_comb = 64'h0;
        exc_comb = '0;
        
        if (a_is_nan || b_is_nan) begin
            result_comb = 64'h7FF8000000000000;  // qNaN canónico
            exc_comb.invalid = 1'b1;
        end
        else begin
            case (op)
                OP_ADD, OP_SUB: begin
                    if (a_is_inf && b_is_inf && (a_sign != b_sign_eff)) begin
                        result_comb = 64'h7FF8000000000000;
                        exc_comb.invalid = 1'b1;
                    end else if (a_is_inf) begin
                        result_comb = {a_sign, 11'h7FF, 52'h0};
                    end else if (b_is_inf) begin
                        result_comb = {b_sign_eff, 11'h7FF, 52'h0};
                    end else if (a_is_zero && b_is_zero) begin
                        result_comb = 64'h0;
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
                        result_comb = 64'h7FF8000000000000;
                        exc_comb.invalid = 1'b1;
                    end else if (a_is_inf || b_is_inf) begin
                        result_comb = {a_sign ^ b_sign, 11'h7FF, 52'h0};
                    end else if (a_is_zero || b_is_zero) begin
                        result_comb = {a_sign ^ b_sign, 63'h0};
                    end else begin
                        result_comb = mul_result;
                    end
                end
                
                OP_DIV: begin
                    if (a_is_inf && b_is_inf) begin
                        result_comb = 64'h7FF8000000000000;
                        exc_comb.invalid = 1'b1;
                    end else if (a_is_zero && b_is_zero) begin
                        result_comb = 64'h7FF8000000000000;
                        exc_comb.invalid = 1'b1;
                    end else if (a_is_inf) begin
                        result_comb = {a_sign ^ b_sign, 11'h7FF, 52'h0};
                    end else if (b_is_inf) begin
                        result_comb = {a_sign ^ b_sign, 63'h0};
                    end else if (b_is_zero) begin
                        result_comb = {a_sign ^ b_sign, 11'h7FF, 52'h0};
                        exc_comb.div_zero = 1'b1;
                    end else if (a_is_zero) begin
                        result_comb = {a_sign ^ b_sign, 63'h0};
                    end else begin
                        result_comb = div_result;
                    end
                end
                
                default: result_comb = 64'h0;
            endcase
        end
    end

    // ========================================================================
    // Registro de salida
    // ========================================================================
    
    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            valid_out  <= 1'b0;
            result     <= 64'h0;
            exceptions <= '0;
        end else begin
            valid_out  <= valid_in;
            result     <= result_comb;
            exceptions <= exc_comb;
        end
    end

endmodule
