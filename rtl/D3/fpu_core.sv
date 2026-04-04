// ============================================================================
// D2: Execution Core - Unified FP64 Datapath
// ============================================================================
// Este módulo realiza las operaciones aritméticas en formato FP64 interno.
// No "sabe" cuál es la precisión original - eso lo maneja unpack/pack.
// 
// Operaciones: ADD, SUB, MUL, DIV
// Latencia: 1 ciclo (combinacional con registro de salida)
// ============================================================================

module fpu_core
    import fpu_pkg::*;
(
    input  logic            clk,
    input  logic            rst_n,
    input  logic            valid_in,
    input  operation_e      op,
    input  fp_internal_t    a,
    input  fp_internal_t    b,
    output logic            valid_out,
    output fp_internal_t    result,
    output fp_exceptions_t  exceptions
);

    // ========================================================================
    // Señales para ADD/SUB
    // ========================================================================
    
    logic        b_sign_eff;  // Signo efectivo de B (negado para SUB)
    
    logic [11:0] addsub_exp_diff;
    logic [11:0] addsub_exp_large;
    logic [54:0] addsub_mant_large, addsub_mant_small_shifted;
    logic        addsub_sign_large;
    logic        addsub_a_larger;
    logic [55:0] addsub_mant_sum;
    logic [11:0] addsub_exp_result;
    logic [52:0] addsub_mant_result;
    logic        addsub_sign_result;
    
    // ========================================================================
    // Señales para MUL
    // ========================================================================
    
    logic [105:0] mul_mant_product;
    logic [11:0]  mul_exp_sum;
    logic [10:0]  mul_exp_result;
    logic [52:0]  mul_mant_result;
    logic         mul_sign_result;
    
    // ========================================================================
    // Señales para DIV
    // ========================================================================
    
    logic [106:0]        div_mant_dividend;
    logic [53:0]         div_mant_quotient;
    logic signed [12:0]  div_exp_diff;
    logic [10:0]         div_exp_result;
    logic [52:0]         div_mant_result;
    logic                div_sign_result;

    // ========================================================================
    // Resultado combinacional
    // ========================================================================
    
    fp_internal_t result_comb;
    fp_exceptions_t exc_comb;

    // ========================================================================
    // Leading Zero Counter para normalización
    // ========================================================================
    
    function automatic [5:0] count_leading_zeros(input [54:0] val);
        integer i;
        begin
            count_leading_zeros = 6'd55;  // Default: todos ceros
            for (i = 54; i >= 0; i = i - 1) begin
                if (val[i] && count_leading_zeros == 6'd55)
                    count_leading_zeros = 6'd54 - i[5:0];
            end
        end
    endfunction
    
    logic [5:0] addsub_lzc;

    // ========================================================================
    // Signo efectivo de B (para SUB)
    // ========================================================================
    
    assign b_sign_eff = (op == OP_SUB) ? ~b.sign : b.sign;

    // ========================================================================
    // ADD/SUB Logic
    // ========================================================================
    // Formato de mantisa interna: mant[52:0] = {implicit_bit, frac[51:0]}
    // Para operaciones usamos 56 bits: {3'b0, mant} para tener espacio para carry
    // El bit implícito queda en posición 52 de los 56 bits
    // ========================================================================
    
    always_comb begin
        // Determinar cuál operando tiene mayor exponente
        if (a.exp >= b.exp) begin
            addsub_a_larger = 1'b1;
            addsub_exp_diff = {1'b0, a.exp} - {1'b0, b.exp};
            addsub_exp_large = {1'b0, a.exp};
            addsub_mant_large = {2'b0, a.mant};  // 55 bits, bit implícito en pos 52
            addsub_sign_large = a.sign;
            // Shift right de la mantisa pequeña
            if (addsub_exp_diff > 55)
                addsub_mant_small_shifted = 55'b0;
            else
                addsub_mant_small_shifted = {2'b0, b.mant} >> addsub_exp_diff;
        end else begin
            addsub_a_larger = 1'b0;
            addsub_exp_diff = {1'b0, b.exp} - {1'b0, a.exp};
            addsub_exp_large = {1'b0, b.exp};
            addsub_mant_large = {2'b0, b.mant};
            addsub_sign_large = b_sign_eff;
            if (addsub_exp_diff > 55)
                addsub_mant_small_shifted = 55'b0;
            else
                addsub_mant_small_shifted = {2'b0, a.mant} >> addsub_exp_diff;
        end
        
        // Suma o resta de mantisas según signos
        if (a.sign == b_sign_eff) begin
            // Mismo signo: sumar mantisas
            addsub_mant_sum = {1'b0, addsub_mant_large} + {1'b0, addsub_mant_small_shifted};
            addsub_sign_result = addsub_sign_large;
        end else begin
            // Signos diferentes: restar mantisas
            if (addsub_a_larger) begin
                addsub_mant_sum = {1'b0, addsub_mant_large} - {1'b0, addsub_mant_small_shifted};
                addsub_sign_result = a.sign;
            end else begin
                addsub_mant_sum = {1'b0, addsub_mant_large} - {1'b0, addsub_mant_small_shifted};
                addsub_sign_result = b_sign_eff;
            end
        end
        
        // Normalización
        // El bit implícito está en posición 52 de addsub_mant_sum (que tiene 56 bits)
        // Si hay carry, estará en posición 53
        if (addsub_mant_sum[53]) begin
            // Overflow: shift right 1 y aumentar exponente
            addsub_exp_result = addsub_exp_large + 1;
            addsub_mant_result = addsub_mant_sum[53:1];  // 53 bits [53:1]
        end else if (addsub_mant_sum[52]) begin
            // Ya normalizado (bit implícito en pos 52)
            addsub_exp_result = addsub_exp_large;
            addsub_mant_result = addsub_mant_sum[52:0];  // 53 bits [52:0]
        end else begin
            // Necesita normalización (shift left)
            addsub_lzc = count_leading_zeros(addsub_mant_sum[54:0]);
            // Ajustar: el LZC cuenta desde bit 54, pero queremos desde bit 52
            // Si bit 52=0 y bit 51=1, LZC dará 2 pero necesitamos shift de 1
            if (addsub_lzc >= addsub_exp_large) begin
                // Underflow a subnormal o cero
                addsub_exp_result = 12'b0;
                addsub_mant_result = addsub_mant_sum[52:0];
            end else begin
                // Encontrar cuántos bits hay que shiftear para normalizar
                // El bit implícito debería quedar en posición 52
                addsub_exp_result = addsub_exp_large - {6'b0, addsub_lzc} + 2;  // +2 porque contamos desde 54
                addsub_mant_result = (addsub_mant_sum[54:0] << addsub_lzc) >> 2;
            end
        end
    end

    // ========================================================================
    // MUL Logic
    // ========================================================================
    
    always_comb begin
        // Producto de mantisas: 53 * 53 = 106 bits
        mul_mant_product = a.mant * b.mant;
        
        // Suma de exponentes (quitar un bias)
        mul_exp_sum = {1'b0, a.exp} + {1'b0, b.exp} - 12'd1023;
        
        // Signo del resultado
        mul_sign_result = a.sign ^ b.sign;
        
        // Normalización: el producto puede estar en [1,4)
        if (mul_mant_product[105]) begin
            // Resultado en [2,4): shift right
            mul_exp_result = mul_exp_sum[10:0] + 1;
            mul_mant_result = mul_mant_product[105:53];
        end else begin
            // Resultado en [1,2): ya normalizado
            mul_exp_result = mul_exp_sum[10:0];
            mul_mant_result = mul_mant_product[104:52];
        end
    end

    // ========================================================================
    // DIV Logic
    // ========================================================================
    // Mantisas: mant[52:0] = {1, frac[51:0]} para normales (bit implícito en [52])
    // 
    // Para división a/b:
    //   - a.mant tiene bit implícito en posición 52 (valor en [1, 2))
    //   - b.mant tiene bit implícito en posición 52 (valor en [1, 2))
    //
    // Extendemos dividendo: {1'b0, a.mant, 53'b0} = 107 bits
    //   El bit implícito de a queda en posición 52+53=105
    //
    // Divisor: {1'b0, b.mant} = 54 bits  
    //   El bit implícito de b queda en posición 52
    //
    // Cociente: tiene el bit implícito en posición 105-52=53
    //   Si a.mant >= b.mant: bit 53 está set (cociente en [1, 2))
    //   Si a.mant < b.mant: bit 53 clear, bit 52 set (cociente en [0.5, 1))
    // ========================================================================
    
    always_comb begin
        // Extender dividendo
        div_mant_dividend = {1'b0, a.mant, 53'b0};  // 107 bits, bit impl en pos 105
        
        // División
        if (b.mant != 0)
            div_mant_quotient = div_mant_dividend / {1'b0, b.mant};  // 54 bits
        else
            div_mant_quotient = 54'h3FFFFFFFFFFFFF;
        
        // Exponente base: exp_a - exp_b + bias
        div_exp_diff = $signed({2'b0, a.exp}) - $signed({2'b0, b.exp}) + $signed(13'd1023);
        
        // Signo
        div_sign_result = a.sign ^ b.sign;
        
        // Normalización basada en dónde quedó el bit implícito
        if (div_mant_quotient[53]) begin
            // Bit implícito en posición 53 (caso normal: a.mant >= b.mant)
            // Resultado en [1, 2): extraemos mantisa de [53:1]
            div_exp_result = div_exp_diff[10:0];
            div_mant_result = div_mant_quotient[53:1];
        end else begin
            // Bit implícito en posición 52 (a.mant < b.mant)
            // Resultado en [0.5, 1): necesitamos decrementar exponente
            div_exp_result = div_exp_diff[10:0] - 1;
            div_mant_result = div_mant_quotient[52:0];
        end
    end

    // ========================================================================
    // Selección de resultado y manejo de casos especiales
    // ========================================================================
    
    always_comb begin
        // Valores por defecto
        result_comb = '0;
        exc_comb = '0;
        
        // Casos especiales primero
        if (a.is_nan || b.is_nan) begin
            // NaN propagation
            result_comb.is_nan = 1'b1;
            result_comb.exp = 11'h7FF;
            result_comb.mant = {1'b1, 52'h8000000000000};  // QNaN
            exc_comb.invalid = 1'b1;
        end
        else begin
            case (op)
                OP_ADD, OP_SUB: begin
                    if (a.is_inf && b.is_inf) begin
                        if (a.sign == b_sign_eff) begin
                            // inf + inf = inf (mismo signo)
                            result_comb.is_inf = 1'b1;
                            result_comb.sign = a.sign;
                            result_comb.exp = 11'h7FF;
                        end else begin
                            // inf - inf = NaN
                            result_comb.is_nan = 1'b1;
                            result_comb.exp = 11'h7FF;
                            result_comb.mant = {1'b1, 52'h8000000000000};
                            exc_comb.invalid = 1'b1;
                        end
                    end else if (a.is_inf) begin
                        result_comb.is_inf = 1'b1;
                        result_comb.sign = a.sign;
                        result_comb.exp = 11'h7FF;
                    end else if (b.is_inf) begin
                        result_comb.is_inf = 1'b1;
                        result_comb.sign = b_sign_eff;
                        result_comb.exp = 11'h7FF;
                    end else if (a.is_zero && b.is_zero) begin
                        result_comb.is_zero = 1'b1;
                        result_comb.sign = a.sign & b_sign_eff;
                    end else if (a.is_zero) begin
                        result_comb = b;
                        result_comb.sign = b_sign_eff;
                    end else if (b.is_zero) begin
                        result_comb = a;
                    end else begin
                        // Caso normal
                        result_comb.sign = addsub_sign_result;
                        result_comb.exp = addsub_exp_result[10:0];
                        result_comb.mant = addsub_mant_result;
                        result_comb.is_zero = (addsub_mant_sum == 0);
                    end
                end
                
                OP_MUL: begin
                    if ((a.is_inf && b.is_zero) || (a.is_zero && b.is_inf)) begin
                        // inf * 0 = NaN
                        result_comb.is_nan = 1'b1;
                        result_comb.exp = 11'h7FF;
                        result_comb.mant = {1'b1, 52'h8000000000000};
                        exc_comb.invalid = 1'b1;
                    end else if (a.is_inf || b.is_inf) begin
                        result_comb.is_inf = 1'b1;
                        result_comb.sign = mul_sign_result;
                        result_comb.exp = 11'h7FF;
                    end else if (a.is_zero || b.is_zero) begin
                        result_comb.is_zero = 1'b1;
                        result_comb.sign = mul_sign_result;
                    end else begin
                        // Caso normal
                        result_comb.sign = mul_sign_result;
                        result_comb.exp = mul_exp_result;
                        result_comb.mant = mul_mant_result;
                    end
                end
                
                OP_DIV: begin
                    if (a.is_inf && b.is_inf) begin
                        // inf / inf = NaN
                        result_comb.is_nan = 1'b1;
                        result_comb.exp = 11'h7FF;
                        result_comb.mant = {1'b1, 52'h8000000000000};
                        exc_comb.invalid = 1'b1;
                    end else if (a.is_zero && b.is_zero) begin
                        // 0 / 0 = NaN
                        result_comb.is_nan = 1'b1;
                        result_comb.exp = 11'h7FF;
                        result_comb.mant = {1'b1, 52'h8000000000000};
                        exc_comb.invalid = 1'b1;
                    end else if (a.is_inf) begin
                        result_comb.is_inf = 1'b1;
                        result_comb.sign = div_sign_result;
                        result_comb.exp = 11'h7FF;
                    end else if (b.is_inf) begin
                        result_comb.is_zero = 1'b1;
                        result_comb.sign = div_sign_result;
                    end else if (b.is_zero) begin
                        // x / 0 = inf (con excepción)
                        result_comb.is_inf = 1'b1;
                        result_comb.sign = div_sign_result;
                        result_comb.exp = 11'h7FF;
                        exc_comb.div_zero = 1'b1;
                    end else if (a.is_zero) begin
                        result_comb.is_zero = 1'b1;
                        result_comb.sign = div_sign_result;
                    end else begin
                        // Caso normal
                        result_comb.sign = div_sign_result;
                        result_comb.exp = div_exp_result;
                        result_comb.mant = div_mant_result;
                    end
                end
                
                default: begin
                    result_comb.is_nan = 1'b1;
                    exc_comb.invalid = 1'b1;
                end
            endcase
        end
    end

    // ========================================================================
    // Registro de salida
    // ========================================================================
    
    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            valid_out  <= 1'b0;
            result     <= '0;
            exceptions <= '0;
        end else begin
            valid_out  <= valid_in;
            result     <= result_comb;
            exceptions <= exc_comb;
        end
    end

endmodule
