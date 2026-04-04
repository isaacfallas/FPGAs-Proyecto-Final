`timescale 1ns/1ps

// Debug detallado de DIV
module debug_div;

    import fpu_pkg::*;

    // Simular la división manualmente
    logic [52:0] a_mant = 53'h18000000000000;  // 1.5 (6.0 tiene mantisa 1.5)
    logic [52:0] b_mant = 53'h10000000000000;  // 1.0 (2.0 tiene mantisa 1.0)
    
    logic [106:0] dividend;
    logic [53:0]  quotient;
    
    initial begin
        $display("=== Debug DIV ===");
        $display("a_mant = %h (valor real: %f)", a_mant, 1.0 + $itor(a_mant[51:0]) / $itor(52'h10000000000000));
        $display("b_mant = %h (valor real: %f)", b_mant, 1.0 + $itor(b_mant[51:0]) / $itor(52'h10000000000000));
        
        // Método 1: {a_mant, 53'b0} / {1'b0, b_mant}
        dividend = {1'b0, a_mant, 53'b0};
        quotient = dividend / {1'b0, b_mant};
        
        $display("\nMétodo 1: {1'b0, a_mant, 53'b0} / {1'b0, b_mant}");
        $display("  dividend = %h (%d bits)", dividend, $bits(dividend));
        $display("  divisor  = %h", {1'b0, b_mant});
        $display("  quotient = %h", quotient);
        $display("  quotient[53] = %b", quotient[53]);
        $display("  quotient[52] = %b", quotient[52]);
        $display("  quotient[52:0] = %h", quotient[52:0]);
        
        // Verificación: el cociente de 1.5/1.0 debería ser 1.5
        // 1.5 en formato de mantisa: {1, 0x8000...} = 0x18000...
        $display("\n  Esperado: quotient[52:0] = %h (1.5)", 53'h18000000000000);
        
        // ¿Y si el problema es cómo interpreto el cociente?
        // Si dividendo tiene bit implícito en pos 52+53=105, y divisor en pos 52
        // Entonces cociente tiene bit implícito en pos 105-52=53
        
        $display("\nInterpretación:");
        if (quotient[53]) begin
            $display("  Bit 53 set: resultado >= 2.0, necesita shift right");
            $display("  Mantisa final = quotient[53:1] = %h", quotient[53:1]);
        end else begin
            $display("  Bit 53 clear: resultado < 2.0");
            $display("  Mantisa final = quotient[52:0] = %h", quotient[52:0]);
        end
        
        // Método alternativo: usar menos extension
        $display("\n--- Método alternativo ---");
        dividend = {a_mant, 54'b0};  // 107 bits con a_mant empezando en bit 106
        quotient = dividend / {1'b0, b_mant};
        $display("  {a_mant, 54'b0} / {1'b0, b_mant}");
        $display("  quotient = %h", quotient);
        $display("  quotient[53:1] = %h", quotient[53:1]);
        $display("  quotient[52:0] = %h", quotient[52:0]);
        
        $finish;
    end

endmodule
