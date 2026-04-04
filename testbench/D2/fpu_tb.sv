`timescale 1ns/1ps

// ============================================================================
// D2: Testbench para FPU Unified Datapath
// ============================================================================
// Prueba todas las precisiones: FP16, FP32, FP64
// Operaciones: ADD, SUB, MUL, DIV
// ============================================================================

module fpu_tb;

    import fpu_pkg::*;

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
    // Helper: op to string
    // ------------------------------------------------------------------------
    
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
    // Tasks
    // ------------------------------------------------------------------------
    
    task automatic reset_dut();
        begin
            rst_n     = 1'b0;
            valid_in  = 1'b0;
            precision = PREC_FP64;
            op        = OP_ADD;
            operand_a = 64'b0;
            operand_b = 64'b0;
            repeat(3) @(posedge clk);
            rst_n     = 1'b1;
            @(posedge clk);
        end
    endtask

    task automatic wait_result();
        int timeout;
        begin
            timeout = 0;
            // Esperar un ciclo para que el pipeline procese
            @(posedge clk);
            // Ya debería estar listo (pipeline de 1 ciclo)
            // Si valid_out no está alto, esperamos con timeout
            while (!valid_out && timeout < 10) begin
                timeout++;
                @(posedge clk);
            end
            if (timeout >= 10) begin
                $display("[DEBUG] TIMEOUT esperando valid_out!");
            end
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
            valid_in  = 1'b1;
            precision = PREC_FP64;
            op        = op_i;
            operand_a = $realtobits(a_val);
            operand_b = $realtobits(b_val);
            
            @(posedge clk);
            valid_in = 1'b0;
            
            wait_result();
            
            // Capturar resultado cuando valid_out=1
            got = $bitstoreal(result);
            
            // Calcular esperado
            case (op_i)
                OP_ADD: expected = a_val + b_val;
                OP_SUB: expected = a_val - b_val;
                OP_MUL: expected = a_val * b_val;
                OP_DIV: expected = a_val / b_val;
            endcase
            expected_bits = $realtobits(expected);
            got = $bitstoreal(result);
            
            // Verificar (tolerancia para redondeo)
            if (result == expected_bits || 
                (expected != 0 && ((got - expected) / expected) < 0.0001 && ((got - expected) / expected) > -0.0001) ||
                (expected == 0 && got == 0)) begin
                pass_count++;
                $display("[PASS] FP64 %s: %f %s %f = %f (got %f)", 
                         op_to_str(op_i), a_val, op_to_str(op_i), b_val, expected, got);
            end else begin
                fail_count++;
                $display("[FAIL] FP64 %s: %f %s %f = %f, got %f (bits: exp=%h got=%h)", 
                         op_to_str(op_i), a_val, op_to_str(op_i), b_val, expected, got,
                         expected_bits, result);
            end
        end
    endtask

    // ------------------------------------------------------------------------
    // Test FP32
    // ------------------------------------------------------------------------
    
    function real fp32_to_real(input logic [31:0] bits);
        logic sign;
        logic [7:0] exp;
        logic [22:0] frac;
        real mantissa, res;
        begin
            sign = bits[31];
            exp = bits[30:23];
            frac = bits[22:0];
            
            if (exp == 0) begin
                fp32_to_real = 0.0;
            end else if (exp == 8'hFF) begin
                fp32_to_real = (frac == 0) ? (sign ? -1.0/0.0 : 1.0/0.0) : 0.0/0.0;
            end else begin
                mantissa = 1.0 + real'(frac) / (2.0**23);
                res = mantissa * (2.0 ** (real'(exp) - 127.0));
                fp32_to_real = sign ? -res : res;
            end
        end
    endfunction
    
    task automatic test_fp32(
        input operation_e op_i,
        input logic [31:0] a_bits,
        input logic [31:0] b_bits,
        input logic [31:0] exp_bits
    );
        real a_val, b_val, expected_val, got_val;
        begin
            test_count++;
            
            a_val = fp32_to_real(a_bits);
            b_val = fp32_to_real(b_bits);
            expected_val = fp32_to_real(exp_bits);
            
            @(posedge clk);
            valid_in  = 1'b1;
            precision = PREC_FP32;
            op        = op_i;
            operand_a = {32'b0, a_bits};
            operand_b = {32'b0, b_bits};
            
            @(posedge clk);
            valid_in = 1'b0;
            
            wait_result();
            
            got_val = fp32_to_real(result[31:0]);
            
            if (result[31:0] == exp_bits) begin
                pass_count++;
                $display("[PASS] FP32 %s: %f %s %f = %f", 
                         op_to_str(op_i), a_val, op_to_str(op_i), b_val, got_val);
            end else begin
                fail_count++;
                $display("[FAIL] FP32 %s: %f %s %f, expected=%h got=%h", 
                         op_to_str(op_i), a_val, op_to_str(op_i), b_val, exp_bits, result[31:0]);
            end
        end
    endtask

    // ------------------------------------------------------------------------
    // Test FP16
    // ------------------------------------------------------------------------
    
    function real fp16_to_real(input logic [15:0] bits);
        logic sign;
        logic [4:0] exp;
        logic [9:0] frac;
        real mantissa, res;
        begin
            sign = bits[15];
            exp = bits[14:10];
            frac = bits[9:0];
            
            if (exp == 0) begin
                fp16_to_real = 0.0;
            end else if (exp == 5'h1F) begin
                fp16_to_real = (frac == 0) ? (sign ? -1.0/0.0 : 1.0/0.0) : 0.0/0.0;
            end else begin
                mantissa = 1.0 + real'(frac) / (2.0**10);
                res = mantissa * (2.0 ** (real'(exp) - 15.0));
                fp16_to_real = sign ? -res : res;
            end
        end
    endfunction
    
    task automatic test_fp16(
        input operation_e op_i,
        input logic [15:0] a_bits,
        input logic [15:0] b_bits,
        input logic [15:0] exp_bits
    );
        real a_val, b_val, expected_val, got_val;
        begin
            test_count++;
            
            a_val = fp16_to_real(a_bits);
            b_val = fp16_to_real(b_bits);
            expected_val = fp16_to_real(exp_bits);
            
            @(posedge clk);
            valid_in  = 1'b1;
            precision = PREC_FP16;
            op        = op_i;
            operand_a = {48'b0, a_bits};
            operand_b = {48'b0, b_bits};
            
            @(posedge clk);
            valid_in = 1'b0;
            
            wait_result();
            
            got_val = fp16_to_real(result[15:0]);
            
            if (result[15:0] == exp_bits) begin
                pass_count++;
                $display("[PASS] FP16 %s: %f %s %f = %f", 
                         op_to_str(op_i), a_val, op_to_str(op_i), b_val, got_val);
            end else begin
                fail_count++;
                $display("[FAIL] FP16 %s: %f %s %f, expected=%h got=%h", 
                         op_to_str(op_i), a_val, op_to_str(op_i), b_val, exp_bits, result[15:0]);
            end
        end
    endtask

    // ------------------------------------------------------------------------
    // Main
    // ------------------------------------------------------------------------
    
    initial begin
        $display("============================================================");
        $display("D2: FPU Unified Datapath - Testbench");
        $display("============================================================");
        
        clk = 1'b0;
        test_count = 0;
        pass_count = 0;
        fail_count = 0;
        
        reset_dut();
        
        // ====================================================================
        // FP64 Tests
        // ====================================================================
        $display("\n--- FP64 Tests ---");
        
        // ADD
        test_fp64(OP_ADD, 1.0, 2.0);
        test_fp64(OP_ADD, 1.5, 2.5);
        test_fp64(OP_ADD, -1.0, 1.0);
        test_fp64(OP_ADD, 1e10, 1e-10);
        
        // SUB
        test_fp64(OP_SUB, 5.0, 3.0);
        test_fp64(OP_SUB, 1.0, 1.0);
        test_fp64(OP_SUB, -1.0, -1.0);
        
        // MUL
        test_fp64(OP_MUL, 2.0, 3.0);
        test_fp64(OP_MUL, 1.5, 2.0);
        test_fp64(OP_MUL, -2.0, 3.0);
        test_fp64(OP_MUL, 1e10, 1e10);
        
        // DIV
        test_fp64(OP_DIV, 6.0, 2.0);
        test_fp64(OP_DIV, 1.0, 3.0);
        test_fp64(OP_DIV, -6.0, 2.0);
        
        // ====================================================================
        // FP32 Tests
        // ====================================================================
        $display("\n--- FP32 Tests ---");
        
        // 1.0 + 2.0 = 3.0
        test_fp32(OP_ADD, 32'h3F800000, 32'h40000000, 32'h40400000);
        // 1.5 + 2.5 = 4.0
        test_fp32(OP_ADD, 32'h3FC00000, 32'h40200000, 32'h40800000);
        
        // 2.0 * 3.0 = 6.0
        test_fp32(OP_MUL, 32'h40000000, 32'h40400000, 32'h40C00000);
        
        // 6.0 / 2.0 = 3.0
        test_fp32(OP_DIV, 32'h40C00000, 32'h40000000, 32'h40400000);
        
        // ====================================================================
        // FP16 Tests
        // ====================================================================
        $display("\n--- FP16 Tests ---");
        
        // 1.0 + 2.0 = 3.0 (FP16: 1.0=0x3C00, 2.0=0x4000, 3.0=0x4200)
        test_fp16(OP_ADD, 16'h3C00, 16'h4000, 16'h4200);
        
        // 2.0 * 3.0 = 6.0 (FP16: 2.0=0x4000, 3.0=0x4200, 6.0=0x4600)
        test_fp16(OP_MUL, 16'h4000, 16'h4200, 16'h4600);
        
        // ====================================================================
        // Resumen
        // ====================================================================
        $display("\n============================================================");
        $display("Summary: %0d tests, %0d passed, %0d failed", 
                 test_count, pass_count, fail_count);
        $display("============================================================");
        
        if (fail_count == 0)
            $display("ALL TESTS PASSED!");
        else
            $display("SOME TESTS FAILED!");
        
        $finish;
    end

endmodule
