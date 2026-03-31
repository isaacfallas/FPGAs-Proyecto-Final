`timescale 1ns/1ps

// ============================================================================
// D1: Testbench para FPU SIMD
// ============================================================================
// Prueba todas las precisiones: FP16, FP32, FP64
// Operaciones: ADD, SUB, MUL, DIV
// ============================================================================

module fpu_tb;

    import fpu_pkg::*;

    // Helper function para convertir operation_e a string (Icarus compatible)
    function string op_to_str(input operation_e op_i);
        case (op_i)
            OP_ADD: return "ADD";
            OP_SUB: return "SUB";
            OP_MUL: return "MUL";
            OP_DIV: return "DIV";
            default: return "???";
        endcase
    endfunction

    // ------------------------------------------------------------------------
    // Señales
    // ------------------------------------------------------------------------
    
    logic             clk;
    logic             rst_n;
    logic             valid_in;
    precision_e       precision;
    operation_e       op;
    logic [63:0]      operand_a;
    logic [63:0]      operand_b;
    logic             valid_out;
    precision_e       precision_out;
    logic [63:0]      result;
    fp_exceptions_t   exceptions;

    // ------------------------------------------------------------------------
    // Contadores
    // ------------------------------------------------------------------------
    
    int test_count;
    int pass_count;
    int fail_count;

    // ------------------------------------------------------------------------
    // DUT
    // ------------------------------------------------------------------------
    
    fpu_top dut (
        .clk          (clk),
        .rst_n        (rst_n),
        .valid_in     (valid_in),
        .precision    (precision),
        .op           (op),
        .operand_a    (operand_a),
        .operand_b    (operand_b),
        .valid_out    (valid_out),
        .precision_out(precision_out),
        .result       (result),
        .exceptions   (exceptions)
    );

    // ------------------------------------------------------------------------
    // Clock
    // ------------------------------------------------------------------------
    
    always #5 clk = ~clk;

    // ------------------------------------------------------------------------
    // Tasks
    // ------------------------------------------------------------------------
    
    task automatic reset_dut();
        begin
            rst_n     = 1'b0;
            valid_in  = 1'b0;
            precision = PREC_FP64;
            op        = OP_ADD;
            operand_a = 64'd0;
            operand_b = 64'd0;
            
            repeat (3) @(posedge clk);
            rst_n = 1'b1;
            @(posedge clk);
        end
    endtask

    task automatic wait_result();
        begin
            @(posedge clk);  // Esperar 1 ciclo (latencia del diseño)
            while (!valid_out) @(posedge clk);
        end
    endtask

    // ------------------------------------------------------------------------
    // Test FP64
    // ------------------------------------------------------------------------
    
    task automatic test_fp64(
        input operation_e op_i,
        input real a_val,
        input real b_val
    );
        real expected, got;
        logic [63:0] expected_bits;
        begin
            test_count++;
            
            @(posedge clk);
            precision <= PREC_FP64;
            op        <= op_i;
            operand_a <= $realtobits(a_val);
            operand_b <= $realtobits(b_val);
            valid_in  <= 1'b1;
            
            @(posedge clk);
            valid_in <= 1'b0;
            
            wait_result();
            
            // Calcular esperado
            case (op_i)
                OP_ADD: expected = a_val + b_val;
                OP_SUB: expected = a_val - b_val;
                OP_MUL: expected = a_val * b_val;
                OP_DIV: expected = a_val / b_val;
            endcase
            expected_bits = $realtobits(expected);
            got = $bitstoreal(result);
            
            if (result === expected_bits) begin
                pass_count++;
                $display("[PASS] FP64 %s: %f %s %f = %f", 
                         op_to_str(op_i), a_val, 
                         (op_i == OP_ADD) ? "+" : (op_i == OP_SUB) ? "-" : 
                         (op_i == OP_MUL) ? "*" : "/",
                         b_val, got);
            end else begin
                fail_count++;
                $display("[FAIL] FP64 %s: %f %s %f", op_to_str(op_i), a_val,
                         (op_i == OP_ADD) ? "+" : (op_i == OP_SUB) ? "-" : 
                         (op_i == OP_MUL) ? "*" : "/", b_val);
                $display("       Expected: %f (0x%016h)", expected, expected_bits);
                $display("       Got:      %f (0x%016h)", got, result);
            end
        end
    endtask

    // ------------------------------------------------------------------------
    // Test FP32 (2 operaciones simultáneas) con verificación
    // ------------------------------------------------------------------------
    
    // Helper para convertir FP32 bits a real (aproximado)
    function real fp32_to_real(input logic [31:0] bits);
        logic sign;
        logic [7:0] exp;
        logic [22:0] frac;
        real mantissa, result;
        begin
            sign = bits[31];
            exp = bits[30:23];
            frac = bits[22:0];
            
            if (exp == 0 && frac == 0) begin
                fp32_to_real = 0.0;
            end else if (exp == 8'hFF) begin
                fp32_to_real = sign ? -999999.0 : 999999.0; // Inf/NaN marker
            end else begin
                mantissa = 1.0 + (real'(frac) / 8388608.0); // 2^23
                result = mantissa * (2.0 ** (real'(exp) - 127.0));
                fp32_to_real = sign ? -result : result;
            end
        end
    endfunction
    
    task automatic test_fp32(
        input operation_e op_i,
        input logic [31:0] a0_bits, input logic [31:0] b0_bits, input logic [31:0] exp0_bits,
        input logic [31:0] a1_bits, input logic [31:0] b1_bits, input logic [31:0] exp1_bits
    );
        logic [31:0] got0_bits, got1_bits;
        real a0_r, b0_r, exp0_r, got0_r;
        real a1_r, b1_r, exp1_r, got1_r;
        logic pass0, pass1;
        begin
            test_count++;
            
            @(posedge clk);
            precision <= PREC_FP32;
            op        <= op_i;
            operand_a <= {a1_bits, a0_bits};
            operand_b <= {b1_bits, b0_bits};
            valid_in  <= 1'b1;
            
            @(posedge clk);
            valid_in <= 1'b0;
            
            wait_result();
            
            got0_bits = result[31:0];
            got1_bits = result[63:32];
            
            a0_r = fp32_to_real(a0_bits);
            b0_r = fp32_to_real(b0_bits);
            exp0_r = fp32_to_real(exp0_bits);
            got0_r = fp32_to_real(got0_bits);
            
            a1_r = fp32_to_real(a1_bits);
            b1_r = fp32_to_real(b1_bits);
            exp1_r = fp32_to_real(exp1_bits);
            got1_r = fp32_to_real(got1_bits);
            
            pass0 = (got0_bits == exp0_bits);
            pass1 = (got1_bits == exp1_bits);
            
            if (pass0 && pass1) begin
                $display("[PASS] FP32 %s: %.2f op %.2f = %.2f, %.2f op %.2f = %.2f", 
                         op_to_str(op_i), a0_r, b0_r, got0_r, a1_r, b1_r, got1_r);
                pass_count++;
            end else begin
                $display("[FAIL] FP32 %s:", op_to_str(op_i));
                if (!pass0)
                    $display("       Op0: %.2f op %.2f = %.2f (expected %.2f)", a0_r, b0_r, got0_r, exp0_r);
                if (!pass1)
                    $display("       Op1: %.2f op %.2f = %.2f (expected %.2f)", a1_r, b1_r, got1_r, exp1_r);
                fail_count++;
            end
        end
    endtask

    // ------------------------------------------------------------------------
    // Test FP16 (4 operaciones simultáneas) con verificación
    // ------------------------------------------------------------------------
    
    // Helper para convertir FP16 bits a real (aproximado)
    function real fp16_to_real(input logic [15:0] bits);
        logic sign;
        logic [4:0] exp;
        logic [9:0] frac;
        real mantissa, result;
        begin
            sign = bits[15];
            exp = bits[14:10];
            frac = bits[9:0];
            
            if (exp == 0 && frac == 0) begin
                fp16_to_real = 0.0;
            end else if (exp == 5'h1F) begin
                fp16_to_real = sign ? -999999.0 : 999999.0; // Inf/NaN marker
            end else begin
                mantissa = 1.0 + (real'(frac) / 1024.0); // 2^10
                result = mantissa * (2.0 ** (real'(exp) - 15.0));
                fp16_to_real = sign ? -result : result;
            end
        end
    endfunction
    
    task automatic test_fp16(
        input operation_e op_i,
        input logic [15:0] a0, input logic [15:0] b0, input logic [15:0] exp0,
        input logic [15:0] a1, input logic [15:0] b1, input logic [15:0] exp1,
        input logic [15:0] a2, input logic [15:0] b2, input logic [15:0] exp2,
        input logic [15:0] a3, input logic [15:0] b3, input logic [15:0] exp3
    );
        logic [15:0] got0, got1, got2, got3;
        logic pass;
        begin
            test_count++;
            
            @(posedge clk);
            precision <= PREC_FP16;
            op        <= op_i;
            operand_a <= {a3, a2, a1, a0};
            operand_b <= {b3, b2, b1, b0};
            valid_in  <= 1'b1;
            
            @(posedge clk);
            valid_in <= 1'b0;
            
            wait_result();
            
            got0 = result[15:0];
            got1 = result[31:16];
            got2 = result[47:32];
            got3 = result[63:48];
            
            pass = (got0 == exp0) && (got1 == exp1) && (got2 == exp2) && (got3 == exp3);
            
            if (pass) begin
                $display("[PASS] FP16 %s: %.2f op %.2f = %.2f, %.2f op %.2f = %.2f, %.2f op %.2f = %.2f, %.2f op %.2f = %.2f",
                         op_to_str(op_i),
                         fp16_to_real(a0), fp16_to_real(b0), fp16_to_real(got0),
                         fp16_to_real(a1), fp16_to_real(b1), fp16_to_real(got1),
                         fp16_to_real(a2), fp16_to_real(b2), fp16_to_real(got2),
                         fp16_to_real(a3), fp16_to_real(b3), fp16_to_real(got3));
                pass_count++;
            end else begin
                $display("[FAIL] FP16 %s:", op_to_str(op_i));
                if (got0 != exp0) $display("       Op0: %.2f op %.2f = %.2f (expected %.2f)", 
                    fp16_to_real(a0), fp16_to_real(b0), fp16_to_real(got0), fp16_to_real(exp0));
                if (got1 != exp1) $display("       Op1: %.2f op %.2f = %.2f (expected %.2f)", 
                    fp16_to_real(a1), fp16_to_real(b1), fp16_to_real(got1), fp16_to_real(exp1));
                if (got2 != exp2) $display("       Op2: %.2f op %.2f = %.2f (expected %.2f)", 
                    fp16_to_real(a2), fp16_to_real(b2), fp16_to_real(got2), fp16_to_real(exp2));
                if (got3 != exp3) $display("       Op3: %.2f op %.2f = %.2f (expected %.2f)", 
                    fp16_to_real(a3), fp16_to_real(b3), fp16_to_real(got3), fp16_to_real(exp3));
                fail_count++;
            end
        end
    endtask

    // ------------------------------------------------------------------------
    // Main
    // ------------------------------------------------------------------------
    
    initial begin
        $display("============================================================");
        $display("D1: FPU SIMD Testbench");
        $display("============================================================");
        
        clk = 0;
        test_count = 0;
        pass_count = 0;
        fail_count = 0;
        
        reset_dut();
        
        // =================================================================
        // FP64 Tests
        // =================================================================
        $display("\n--- FP64 Tests ---");
        
        // ADD
        test_fp64(OP_ADD, 1.5, 2.5);
        test_fp64(OP_ADD, -3.0, 1.0);
        test_fp64(OP_ADD, 100.25, 50.75);
        
        // SUB
        test_fp64(OP_SUB, 5.0, 3.0);
        test_fp64(OP_SUB, 1.0, 1.0);
        test_fp64(OP_SUB, -2.5, -1.5);
        
        // MUL
        test_fp64(OP_MUL, 2.0, 3.0);
        test_fp64(OP_MUL, 1.5, 2.5);
        test_fp64(OP_MUL, -4.0, 2.0);
        
        // DIV
        test_fp64(OP_DIV, 6.0, 2.0);
        test_fp64(OP_DIV, 10.0, 4.0);
        test_fp64(OP_DIV, -9.0, 3.0);
        
        // =================================================================
        // FP32 Tests (2 operaciones simultáneas)
        // FP32: 1.0=0x3F800000, 2.0=0x40000000, 3.0=0x40400000, 4.0=0x40800000
        //       5.0=0x40A00000, 6.0=0x40C00000, 7.0=0x40E00000
        //       10.0=0x41200000, 20.0=0x41A00000
        //       1.5=0x3FC00000, 2.5=0x40200000
        // =================================================================
        $display("\n--- FP32 Tests (2 ops) ---");
        
        // ADD: 1.5+2.5=4.0, 3.0+4.0=7.0
        test_fp32(OP_ADD, 32'h3FC00000, 32'h40200000, 32'h40800000,  // 1.5+2.5=4.0
                          32'h40400000, 32'h40800000, 32'h40E00000); // 3.0+4.0=7.0
        // SUB: 5.0-2.0=3.0, 10.0-3.0=7.0
        test_fp32(OP_SUB, 32'h40A00000, 32'h40000000, 32'h40400000,  // 5.0-2.0=3.0
                          32'h41200000, 32'h40400000, 32'h40E00000); // 10.0-3.0=7.0
        // MUL: 2.0*3.0=6.0, 4.0*5.0=20.0
        test_fp32(OP_MUL, 32'h40000000, 32'h40400000, 32'h40C00000,  // 2.0*3.0=6.0
                          32'h40800000, 32'h40A00000, 32'h41A00000); // 4.0*5.0=20.0
        // DIV: 6.0/2.0=3.0, 20.0/4.0=5.0
        test_fp32(OP_DIV, 32'h40C00000, 32'h40000000, 32'h40400000,  // 6.0/2.0=3.0
                          32'h41A00000, 32'h40800000, 32'h40A00000); // 20.0/4.0=5.0
        
        // =================================================================
        // FP16 Tests (4 operaciones simultáneas)
        // FP16: 0.5=0x3800, 1.0=0x3C00, 2.0=0x4000, 2.5=0x4100, 3.0=0x4200, 4.0=0x4400
        // =================================================================
        $display("\n--- FP16 Tests (4 ops) ---");
        
        // ADD: 1+1=2, 2+0.5=2.5, 1+2=3, 0.5+0.5=1
        test_fp16(OP_ADD, 
                  16'h3C00, 16'h3C00, 16'h4000,   // 1.0 + 1.0 = 2.0
                  16'h4000, 16'h3800, 16'h4100,   // 2.0 + 0.5 = 2.5
                  16'h3C00, 16'h4000, 16'h4200,   // 1.0 + 2.0 = 3.0
                  16'h3800, 16'h3800, 16'h3C00);  // 0.5 + 0.5 = 1.0
        
        // MUL: 2*2=4, 1*0.5=0.5, 3*1=3, 2*0.5=1
        test_fp16(OP_MUL,
                  16'h4000, 16'h4000, 16'h4400,   // 2.0 * 2.0 = 4.0
                  16'h3C00, 16'h3800, 16'h3800,   // 1.0 * 0.5 = 0.5
                  16'h4200, 16'h3C00, 16'h4200,   // 3.0 * 1.0 = 3.0
                  16'h4000, 16'h3800, 16'h3C00);  // 2.0 * 0.5 = 1.0
        
        // =================================================================
        // Resumen
        // =================================================================
        #20;
        $display("\n============================================================");
        $display("SUMMARY");
        $display("============================================================");
        $display("Total:  %0d", test_count);
        $display("Passed: %0d", pass_count);
        $display("Failed: %0d", fail_count);
        $display("============================================================");
        
        if (fail_count == 0)
            $display("*** ALL TESTS PASSED ***");
        else
            $display("*** SOME TESTS FAILED ***");
        
        $finish;
    end

endmodule
