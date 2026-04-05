// ============================================================================
// D3 Testbench: Time-Multiplexed SIMD FPU
// ============================================================================
// Verifica que el FPU procese correctamente:
//   - FP64: 1 operación en 1 ciclo
//   - FP32: 2 operaciones SIMD (low, high) en 2 ciclos
//   - FP16: 4 operaciones SIMD (slots 0-3) en 4 ciclos
// ============================================================================

`timescale 1ns/1ps

module fpu_tb;
    import fpu_pkg::*;

    // ========================================================================
    // Signals
    // ========================================================================
    
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

    // ========================================================================
    // DUT
    // ========================================================================
    
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

    // ========================================================================
    // Clock Generation
    // ========================================================================
    
    initial clk = 0;
    always #5 clk = ~clk;  // 100MHz

    // ========================================================================
    // Helper Functions
    // ========================================================================
    
    // Conversion functions
    function automatic real fp64_to_real(input logic [63:0] fp);
        logic sign;
        logic [10:0] exp;
        logic [51:0] frac;
        real mantissa;
        integer i;
        begin
            sign = fp[63];
            exp = fp[62:52];
            frac = fp[51:0];
            
            if (exp == 0 && frac == 0) return 0.0;
            if (exp == 11'h7FF) return (sign ? -1.0/0.0 : 1.0/0.0);
            
            mantissa = 1.0;
            for (i = 0; i < 52; i++) begin
                if (frac[51-i]) mantissa = mantissa + (2.0 ** (-(i+1)));
            end
            
            fp64_to_real = (sign ? -1.0 : 1.0) * mantissa * (2.0 ** (exp - 1023));
        end
    endfunction

    function automatic real fp32_to_real(input logic [31:0] fp);
        logic sign;
        logic [7:0] exp;
        logic [22:0] frac;
        real mantissa;
        integer i;
        begin
            sign = fp[31];
            exp = fp[30:23];
            frac = fp[22:0];
            
            if (exp == 0 && frac == 0) return 0.0;
            if (exp == 8'hFF) return (sign ? -1.0/0.0 : 1.0/0.0);
            
            mantissa = 1.0;
            for (i = 0; i < 23; i++) begin
                if (frac[22-i]) mantissa = mantissa + (2.0 ** (-(i+1)));
            end
            
            fp32_to_real = (sign ? -1.0 : 1.0) * mantissa * (2.0 ** (exp - 127));
        end
    endfunction

    function automatic real fp16_to_real(input logic [15:0] fp);
        logic sign;
        logic [4:0] exp;
        logic [9:0] frac;
        real mantissa;
        integer i;
        begin
            sign = fp[15];
            exp = fp[14:10];
            frac = fp[9:0];
            
            if (exp == 0 && frac == 0) return 0.0;
            if (exp == 5'h1F) return (sign ? -1.0/0.0 : 1.0/0.0);
            
            mantissa = 1.0;
            for (i = 0; i < 10; i++) begin
                if (frac[9-i]) mantissa = mantissa + (2.0 ** (-(i+1)));
            end
            
            fp16_to_real = (sign ? -1.0 : 1.0) * mantissa * (2.0 ** (exp - 15));
        end
    endfunction

    // ========================================================================
    // Test Tasks
    // ========================================================================
    
    int test_count = 0;
    int pass_count = 0;

    // Task to wait for valid_out with timeout
    task automatic wait_valid(input int max_cycles);
        int cycle_count;
        begin
            cycle_count = 0;
            while (!valid_out && cycle_count < max_cycles) begin
                @(posedge clk);
                cycle_count++;
            end
            if (cycle_count >= max_cycles) begin
                $display("ERROR: Timeout waiting for valid_out after %0d cycles", max_cycles);
            end
        end
    endtask

    // Test FP64 single operation
    task automatic test_fp64(
        input string test_name,
        input operation_e test_op,
        input logic [63:0] a,
        input logic [63:0] b,
        input real expected
    );
        real got;
        real tolerance;
        begin
            test_count++;
            $display("\n[TEST %0d] %s (FP64)", test_count, test_name);
            $display("  A = %f, B = %f", fp64_to_real(a), fp64_to_real(b));
            
            @(posedge clk);
            valid_in  <= 1'b1;
            precision <= PREC_FP64;
            op        <= test_op;
            operand_a <= a;
            operand_b <= b;
            
            @(posedge clk);
            valid_in  <= 1'b0;
            
            // FP64 should complete in 1 cycle (valid_out on next clock after state machine)
            wait_valid(5);
            @(posedge clk);
            
            got = fp64_to_real(result);
            tolerance = (expected == 0.0) ? 1e-10 : $abs(expected) * 1e-6;
            
            if ($abs(got - expected) < tolerance) begin
                $display("  PASS: Result = %f (expected %f)", got, expected);
                pass_count++;
            end else begin
                $display("  FAIL: Got %f, expected %f", got, expected);
                $display("  Raw result: 0x%016h", result);
            end
        end
    endtask

    // Test FP32 SIMD (2 operations packed in 64 bits)
    task automatic test_fp32_simd(
        input string test_name,
        input operation_e test_op,
        input logic [31:0] a_lo, a_hi,
        input logic [31:0] b_lo, b_hi,
        input real expected_lo, expected_hi
    );
        real got_lo, got_hi;
        real tolerance_lo, tolerance_hi;
        logic pass_lo, pass_hi;
        begin
            test_count++;
            $display("\n[TEST %0d] %s (FP32 SIMD)", test_count, test_name);
            $display("  A = {%f, %f}, B = {%f, %f}", 
                     fp32_to_real(a_hi), fp32_to_real(a_lo),
                     fp32_to_real(b_hi), fp32_to_real(b_lo));
            
            @(posedge clk);
            valid_in  <= 1'b1;
            precision <= PREC_FP32;
            op        <= test_op;
            operand_a <= {a_hi, a_lo};
            operand_b <= {b_hi, b_lo};
            
            @(posedge clk);
            valid_in  <= 1'b0;
            
            // FP32 SIMD should complete in 2 cycles
            wait_valid(10);
            @(posedge clk);
            
            got_lo = fp32_to_real(result[31:0]);
            got_hi = fp32_to_real(result[63:32]);
            
            tolerance_lo = (expected_lo == 0.0) ? 1e-5 : $abs(expected_lo) * 1e-4;
            tolerance_hi = (expected_hi == 0.0) ? 1e-5 : $abs(expected_hi) * 1e-4;
            
            pass_lo = ($abs(got_lo - expected_lo) < tolerance_lo);
            pass_hi = ($abs(got_hi - expected_hi) < tolerance_hi);
            
            if (pass_lo && pass_hi) begin
                $display("  PASS: Result = {%f, %f}", got_hi, got_lo);
                pass_count++;
            end else begin
                $display("  FAIL: Got {%f, %f}, expected {%f, %f}", 
                         got_hi, got_lo, expected_hi, expected_lo);
                $display("  Raw result: 0x%016h", result);
            end
        end
    endtask

    // Test FP16 SIMD (4 operations packed in 64 bits)
    task automatic test_fp16_simd(
        input string test_name,
        input operation_e test_op,
        input logic [15:0] a0, a1, a2, a3,
        input logic [15:0] b0, b1, b2, b3,
        input real exp0, exp1, exp2, exp3
    );
        real got0, got1, got2, got3;
        real tol0, tol1, tol2, tol3;
        logic pass0, pass1, pass2, pass3;
        begin
            test_count++;
            $display("\n[TEST %0d] %s (FP16 SIMD)", test_count, test_name);
            $display("  A = {%f, %f, %f, %f}", 
                     fp16_to_real(a3), fp16_to_real(a2), fp16_to_real(a1), fp16_to_real(a0));
            $display("  B = {%f, %f, %f, %f}", 
                     fp16_to_real(b3), fp16_to_real(b2), fp16_to_real(b1), fp16_to_real(b0));
            
            @(posedge clk);
            valid_in  <= 1'b1;
            precision <= PREC_FP16;
            op        <= test_op;
            operand_a <= {a3, a2, a1, a0};
            operand_b <= {b3, b2, b1, b0};
            
            @(posedge clk);
            valid_in  <= 1'b0;
            
            // FP16 SIMD should complete in 4 cycles
            wait_valid(15);
            @(posedge clk);
            
            got0 = fp16_to_real(result[15:0]);
            got1 = fp16_to_real(result[31:16]);
            got2 = fp16_to_real(result[47:32]);
            got3 = fp16_to_real(result[63:48]);
            
            tol0 = (exp0 == 0.0) ? 1e-2 : $abs(exp0) * 1e-2;
            tol1 = (exp1 == 0.0) ? 1e-2 : $abs(exp1) * 1e-2;
            tol2 = (exp2 == 0.0) ? 1e-2 : $abs(exp2) * 1e-2;
            tol3 = (exp3 == 0.0) ? 1e-2 : $abs(exp3) * 1e-2;
            
            pass0 = ($abs(got0 - exp0) < tol0);
            pass1 = ($abs(got1 - exp1) < tol1);
            pass2 = ($abs(got2 - exp2) < tol2);
            pass3 = ($abs(got3 - exp3) < tol3);
            
            if (pass0 && pass1 && pass2 && pass3) begin
                $display("  PASS: Result = {%f, %f, %f, %f}", got3, got2, got1, got0);
                pass_count++;
            end else begin
                $display("  FAIL: Got {%f, %f, %f, %f}", got3, got2, got1, got0);
                $display("  Expected {%f, %f, %f, %f}", exp3, exp2, exp1, exp0);
                $display("  Raw result: 0x%016h", result);
            end
        end
    endtask

    // ========================================================================
    // IEEE-754 Constants
    // ========================================================================
    
    // FP64 constants
    localparam logic [63:0] FP64_1_0  = 64'h3FF0000000000000;  // 1.0
    localparam logic [63:0] FP64_2_0  = 64'h4000000000000000;  // 2.0
    localparam logic [63:0] FP64_3_0  = 64'h4008000000000000;  // 3.0
    localparam logic [63:0] FP64_4_0  = 64'h4010000000000000;  // 4.0
    localparam logic [63:0] FP64_0_5  = 64'h3FE0000000000000;  // 0.5
    localparam logic [63:0] FP64_6_0  = 64'h4018000000000000;  // 6.0
    localparam logic [63:0] FP64_8_0  = 64'h4020000000000000;  // 8.0
    
    // FP32 constants
    localparam logic [31:0] FP32_1_0  = 32'h3F800000;  // 1.0
    localparam logic [31:0] FP32_2_0  = 32'h40000000;  // 2.0
    localparam logic [31:0] FP32_3_0  = 32'h40400000;  // 3.0
    localparam logic [31:0] FP32_4_0  = 32'h40800000;  // 4.0
    localparam logic [31:0] FP32_5_0  = 32'h40A00000;  // 5.0
    localparam logic [31:0] FP32_6_0  = 32'h40C00000;  // 6.0
    localparam logic [31:0] FP32_0_5  = 32'h3F000000;  // 0.5
    localparam logic [31:0] FP32_8_0  = 32'h41000000;  // 8.0
    localparam logic [31:0] FP32_10_0 = 32'h41200000;  // 10.0
    localparam logic [31:0] FP32_12_0 = 32'h41400000;  // 12.0
    
    // FP16 constants
    localparam logic [15:0] FP16_1_0  = 16'h3C00;  // 1.0
    localparam logic [15:0] FP16_2_0  = 16'h4000;  // 2.0
    localparam logic [15:0] FP16_3_0  = 16'h4200;  // 3.0
    localparam logic [15:0] FP16_4_0  = 16'h4400;  // 4.0
    localparam logic [15:0] FP16_5_0  = 16'h4500;  // 5.0
    localparam logic [15:0] FP16_6_0  = 16'h4600;  // 6.0
    localparam logic [15:0] FP16_7_0  = 16'h4700;  // 7.0
    localparam logic [15:0] FP16_8_0  = 16'h4800;  // 8.0
    localparam logic [15:0] FP16_0_5  = 16'h3800;  // 0.5

    // ========================================================================
    // Main Test Sequence
    // ========================================================================
    
    initial begin
        $display("\n");
        $display("============================================================");
        $display("  D3: Time-Multiplexed SIMD FPU Testbench");
        $display("============================================================");
        $display("  Architecture: Single FP64 core, sequential SIMD processing");
        $display("  FP64: 1 cycle, FP32: 2 cycles, FP16: 4 cycles");
        $display("============================================================\n");
        
        $dumpfile("sim/fpu_tb.vcd");
        $dumpvars(0, fpu_tb);

        // Initialize
        rst_n     = 0;
        valid_in  = 0;
        precision = PREC_FP64;
        op        = OP_ADD;
        operand_a = 64'b0;
        operand_b = 64'b0;
        
        // Reset
        repeat(5) @(posedge clk);
        rst_n = 1;
        repeat(5) @(posedge clk);

        // ====================================================================
        // FP64 Tests (1 cycle each)
        // ====================================================================
        $display("\n--- FP64 Single Precision Tests ---");
        
        test_fp64("FP64 ADD: 1.0 + 2.0", OP_ADD, FP64_1_0, FP64_2_0, 3.0);
        test_fp64("FP64 SUB: 3.0 - 1.0", OP_SUB, FP64_3_0, FP64_1_0, 2.0);
        test_fp64("FP64 MUL: 2.0 * 3.0", OP_MUL, FP64_2_0, FP64_3_0, 6.0);
        test_fp64("FP64 DIV: 8.0 / 2.0", OP_DIV, FP64_8_0, FP64_2_0, 4.0);

        // ====================================================================
        // FP32 SIMD Tests (2 cycles each)
        // ====================================================================
        $display("\n--- FP32 SIMD Tests (2 operations packed) ---");
        
        // ADD: {3.0+4.0, 1.0+2.0} = {7.0, 3.0}
        test_fp32_simd("FP32 SIMD ADD", OP_ADD,
                       FP32_1_0, FP32_3_0,   // a_lo=1.0, a_hi=3.0
                       FP32_2_0, FP32_4_0,   // b_lo=2.0, b_hi=4.0
                       3.0, 7.0);            // expected_lo, expected_hi
        
        // SUB: {5.0-3.0, 4.0-1.0} = {2.0, 3.0}
        test_fp32_simd("FP32 SIMD SUB", OP_SUB,
                       FP32_4_0, FP32_5_0,   // a_lo=4.0, a_hi=5.0
                       FP32_1_0, FP32_3_0,   // b_lo=1.0, b_hi=3.0
                       3.0, 2.0);            // expected_lo, expected_hi
        
        // MUL: {3.0*4.0, 2.0*3.0} = {12.0, 6.0}
        test_fp32_simd("FP32 SIMD MUL", OP_MUL,
                       FP32_2_0, FP32_3_0,   // a_lo=2.0, a_hi=3.0
                       FP32_3_0, FP32_4_0,   // b_lo=3.0, b_hi=4.0
                       6.0, 12.0);           // expected_lo, expected_hi
        
        // DIV: {10.0/2.0, 8.0/4.0} = {5.0, 2.0}
        test_fp32_simd("FP32 SIMD DIV", OP_DIV,
                       FP32_8_0, FP32_10_0,  // a_lo=8.0, a_hi=10.0
                       FP32_4_0, FP32_2_0,   // b_lo=4.0, b_hi=2.0
                       2.0, 5.0);            // expected_lo, expected_hi

        // ====================================================================
        // FP16 SIMD Tests (4 cycles each)
        // ====================================================================
        $display("\n--- FP16 SIMD Tests (4 operations packed) ---");
        
        // ADD: {4+5, 3+4, 2+3, 1+2} = {9, 7, 5, 3}
        test_fp16_simd("FP16 SIMD ADD", OP_ADD,
                       FP16_1_0, FP16_2_0, FP16_3_0, FP16_4_0,  // a0-a3
                       FP16_2_0, FP16_3_0, FP16_4_0, FP16_5_0,  // b0-b3
                       3.0, 5.0, 7.0, 9.0);                     // expected
        
        // SUB: {8-4, 6-3, 4-2, 3-1} = {4, 3, 2, 2}
        test_fp16_simd("FP16 SIMD SUB", OP_SUB,
                       FP16_3_0, FP16_4_0, FP16_6_0, FP16_8_0,  // a0-a3
                       FP16_1_0, FP16_2_0, FP16_3_0, FP16_4_0,  // b0-b3
                       2.0, 2.0, 3.0, 4.0);                     // expected
        
        // MUL: {4*2, 3*3, 2*4, 1*5} = {8, 9, 8, 5}
        test_fp16_simd("FP16 SIMD MUL", OP_MUL,
                       FP16_1_0, FP16_2_0, FP16_3_0, FP16_4_0,  // a0-a3
                       FP16_5_0, FP16_4_0, FP16_3_0, FP16_2_0,  // b0-b3
                       5.0, 8.0, 9.0, 8.0);                     // expected
        
        // DIV: {8/2, 6/3, 4/2, 2/1} = {4, 2, 2, 2}
        test_fp16_simd("FP16 SIMD DIV", OP_DIV,
                       FP16_2_0, FP16_4_0, FP16_6_0, FP16_8_0,  // a0-a3
                       FP16_1_0, FP16_2_0, FP16_3_0, FP16_2_0,  // b0-b3
                       2.0, 2.0, 2.0, 4.0);                     // expected

        // ====================================================================
        // Summary
        // ====================================================================
        repeat(5) @(posedge clk);
        
        $display("\n============================================================");
        $display("  Test Summary: %0d/%0d tests passed", pass_count, test_count);
        $display("============================================================");
        
        if (pass_count == test_count) begin
            $display("  *** ALL TESTS PASSED! ***");
        end else begin
            $display("  *** SOME TESTS FAILED ***");
        end
        
        $display("============================================================\n");
        
        $finish;
    end

endmodule
