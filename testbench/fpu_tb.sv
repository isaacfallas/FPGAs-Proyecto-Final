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
            
            // DIV normal usa divider iterativo (~56 ciclos en FP64)
            if (test_op == OP_DIV)
                wait_valid(80);
            else
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
            
            // DIV en FP32 SIMD procesa 2 slots secuenciales con latencia iterativa
            if (test_op == OP_DIV)
                wait_valid(160);
            else
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
            
            // DIV en FP16 SIMD procesa 4 slots secuenciales con latencia iterativa
            if (test_op == OP_DIV)
                wait_valid(320);
            else
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
    
    // FP64 normal values
    localparam logic [63:0] FP64_1_0  = 64'h3FF0000000000000;  // 1.0
    localparam logic [63:0] FP64_2_0  = 64'h4000000000000000;  // 2.0
    localparam logic [63:0] FP64_3_0  = 64'h4008000000000000;  // 3.0
    localparam logic [63:0] FP64_4_0  = 64'h4010000000000000;  // 4.0
    localparam logic [63:0] FP64_0_5  = 64'h3FE0000000000000;  // 0.5
    localparam logic [63:0] FP64_6_0  = 64'h4018000000000000;  // 6.0
    localparam logic [63:0] FP64_8_0  = 64'h4020000000000000;  // 8.0

    // FP64 special values
    localparam logic [63:0] FP64_POS_ZERO  = 64'h0000000000000000;  // +0.0
    localparam logic [63:0] FP64_NEG_ZERO  = 64'h8000000000000000;  // -0.0
    localparam logic [63:0] FP64_POS_INF   = 64'h7FF0000000000000;  // +Inf
    localparam logic [63:0] FP64_NEG_INF   = 64'hFFF0000000000000;  // -Inf
    localparam logic [63:0] FP64_QNAN      = 64'h7FF8000000000000;  // Canonical qNaN
    localparam logic [63:0] FP64_SNAN      = 64'h7FF0000000000001;  // sNaN
    localparam logic [63:0] FP64_NEG_1_0   = 64'hBFF0000000000000;  // -1.0
    localparam logic [63:0] FP64_MAX       = 64'h7FEFFFFFFFFFFFFF;  // Largest finite
    localparam logic [63:0] FP64_MIN_NORM  = 64'h0010000000000000;  // Smallest normal
    
    // FP32 normal values
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

    // FP32 special values
    localparam logic [31:0] FP32_POS_ZERO  = 32'h00000000;  // +0.0
    localparam logic [31:0] FP32_NEG_ZERO  = 32'h80000000;  // -0.0
    localparam logic [31:0] FP32_POS_INF   = 32'h7F800000;  // +Inf
    localparam logic [31:0] FP32_NEG_INF   = 32'hFF800000;  // -Inf
    localparam logic [31:0] FP32_QNAN      = 32'h7FC00000;  // Canonical qNaN
    localparam logic [31:0] FP32_NEG_1_0   = 32'hBF800000;  // -1.0
    localparam logic [31:0] FP32_MAX       = 32'h7F7FFFFF;  // Largest finite
    localparam logic [31:0] FP32_MIN_NORM  = 32'h00800000;  // Smallest normal
    
    // FP16 normal values
    localparam logic [15:0] FP16_1_0  = 16'h3C00;  // 1.0
    localparam logic [15:0] FP16_2_0  = 16'h4000;  // 2.0
    localparam logic [15:0] FP16_3_0  = 16'h4200;  // 3.0
    localparam logic [15:0] FP16_4_0  = 16'h4400;  // 4.0
    localparam logic [15:0] FP16_5_0  = 16'h4500;  // 5.0
    localparam logic [15:0] FP16_6_0  = 16'h4600;  // 6.0
    localparam logic [15:0] FP16_7_0  = 16'h4700;  // 7.0
    localparam logic [15:0] FP16_8_0  = 16'h4800;  // 8.0
    localparam logic [15:0] FP16_0_5  = 16'h3800;  // 0.5

    // FP16 special values
    localparam logic [15:0] FP16_POS_ZERO  = 16'h0000;  // +0.0
    localparam logic [15:0] FP16_NEG_ZERO  = 16'h8000;  // -0.0
    localparam logic [15:0] FP16_POS_INF   = 16'h7C00;  // +Inf
    localparam logic [15:0] FP16_NEG_INF   = 16'hFC00;  // -Inf
    localparam logic [15:0] FP16_QNAN      = 16'h7E00;  // Canonical qNaN
    localparam logic [15:0] FP16_NEG_1_0   = 16'hBC00;  // -1.0
    localparam logic [15:0] FP16_MAX       = 16'h7BFF;  // Largest finite
    localparam logic [15:0] FP16_MIN_NORM  = 16'h0400;  // Smallest normal

    // ========================================================================
    // Corner Case Test Helpers
    // ========================================================================

    // Check whether a FP64 result is NaN
    function automatic logic fp64_is_nan(input logic [63:0] fp);
        return (fp[62:52] == 11'h7FF) && (fp[51:0] != 52'b0);
    endfunction

    // Check whether a FP64 result is +/-Inf
    function automatic logic fp64_is_inf(input logic [63:0] fp);
        return (fp[62:52] == 11'h7FF) && (fp[51:0] == 52'b0);
    endfunction

    // Check whether a FP64 result is zero (either sign)
    function automatic logic fp64_is_zero(input logic [63:0] fp);
        return (fp[62:0] == 63'b0);
    endfunction

    // Check whether a FP32 result (packed in lower 32 bits) is NaN
    function automatic logic fp32_is_nan(input logic [31:0] fp);
        return (fp[30:23] == 8'hFF) && (fp[22:0] != 23'b0);
    endfunction

    // Check whether a FP32 result is +/-Inf
    function automatic logic fp32_is_inf(input logic [31:0] fp);
        return (fp[30:23] == 8'hFF) && (fp[22:0] == 23'b0);
    endfunction

    // Check whether a FP32 result is zero (either sign)
    function automatic logic fp32_is_zero(input logic [31:0] fp);
        return (fp[30:0] == 31'b0);
    endfunction

    // Check whether a FP16 result is NaN
    function automatic logic fp16_is_nan(input logic [15:0] fp);
        return (fp[14:10] == 5'h1F) && (fp[9:0] != 10'b0);
    endfunction

    // Check whether a FP16 result is +/-Inf
    function automatic logic fp16_is_inf(input logic [15:0] fp);
        return (fp[14:10] == 5'h1F) && (fp[9:0] == 10'b0);
    endfunction

    // Check whether a FP16 result is zero (either sign)
    function automatic logic fp16_is_zero(input logic [15:0] fp);
        return (fp[14:0] == 15'b0);
    endfunction

    // ========================================================================
    // Corner Case Test Tasks
    // ========================================================================

    // Result classification enum for corner-case checks
    typedef enum logic [2:0] {
        CLASS_NAN    = 3'd0,
        CLASS_INF    = 3'd1,
        CLASS_ZERO   = 3'd2,
        CLASS_FINITE = 3'd3,
        CLASS_EXACT  = 3'd4   // bit-exact match
    } result_class_e;

    // Test FP64 corner case — checks result classification or exact bit pattern
    task automatic test_fp64_corner(
        input string        test_name,
        input operation_e   test_op,
        input logic [63:0]  a,
        input logic [63:0]  b,
        input result_class_e expected_class,
        input logic [63:0]  expected_bits   // used only when CLASS_EXACT
    );
        logic [63:0] res;
        logic        pass;
        begin
            test_count++;
            $display("\n[TEST %0d] %s (FP64 corner)", test_count, test_name);

            @(posedge clk);
            valid_in  <= 1'b1;
            precision <= PREC_FP64;
            op        <= test_op;
            operand_a <= a;
            operand_b <= b;

            @(posedge clk);
            valid_in  <= 1'b0;

            if (test_op == OP_DIV)
                wait_valid(80);
            else
                wait_valid(5);
            @(posedge clk);

            res = result;
            pass = 1'b0;
            case (expected_class)
                CLASS_NAN:    pass = fp64_is_nan(res);
                CLASS_INF:    pass = fp64_is_inf(res);
                CLASS_ZERO:   pass = fp64_is_zero(res);
                CLASS_FINITE: pass = !fp64_is_nan(res) && !fp64_is_inf(res) && !fp64_is_zero(res);
                CLASS_EXACT:  pass = (res === expected_bits);
            endcase

            if (pass) begin
                $display("  PASS: 0x%016h (class=%0d)", res, expected_class);
                pass_count++;
            end else begin
                $display("  FAIL: got 0x%016h (class=%0d)", res, expected_class);
            end
        end
    endtask

    // Test FP32 SIMD corner case — checks the lower 32-bit slot only
    task automatic test_fp32_corner(
        input string        test_name,
        input operation_e   test_op,
        input logic [31:0]  a_lo,
        input logic [31:0]  b_lo,
        input result_class_e expected_class,
        input logic [31:0]  expected_bits
    );
        logic [31:0] res_lo;
        logic        pass;
        begin
            test_count++;
            $display("\n[TEST %0d] %s (FP32 corner)", test_count, test_name);

            @(posedge clk);
            valid_in  <= 1'b1;
            precision <= PREC_FP32;
            op        <= test_op;
            // Pack lo into lower 32 bits; hi slot is a neutral 1.0
            operand_a <= {FP32_1_0, a_lo};
            operand_b <= {FP32_1_0, b_lo};

            @(posedge clk);
            valid_in  <= 1'b0;

            if (test_op == OP_DIV)
                wait_valid(160);
            else
                wait_valid(10);
            @(posedge clk);

            res_lo = result[31:0];
            pass   = 1'b0;
            case (expected_class)
                CLASS_NAN:    pass = fp32_is_nan(res_lo);
                CLASS_INF:    pass = fp32_is_inf(res_lo);
                CLASS_ZERO:   pass = fp32_is_zero(res_lo);
                CLASS_FINITE: pass = !fp32_is_nan(res_lo) && !fp32_is_inf(res_lo) && !fp32_is_zero(res_lo);
                CLASS_EXACT:  pass = (res_lo === expected_bits);
            endcase

            if (pass) begin
                $display("  PASS: 0x%08h (class=%0d)", res_lo, expected_class);
                pass_count++;
            end else begin
                $display("  FAIL: got 0x%08h (class=%0d)", res_lo, expected_class);
            end
        end
    endtask

    // Test FP16 corner case — checks slot 0 (bits [15:0]) only
    task automatic test_fp16_corner(
        input string        test_name,
        input operation_e   test_op,
        input logic [15:0]  a0,
        input logic [15:0]  b0,
        input result_class_e expected_class,
        input logic [15:0]  expected_bits
    );
        logic [15:0] res0;
        logic        pass;
        begin
            test_count++;
            $display("\n[TEST %0d] %s (FP16 corner)", test_count, test_name);

            @(posedge clk);
            valid_in  <= 1'b1;
            precision <= PREC_FP16;
            op        <= test_op;
            // Slot 0 under test; slots 1-3 filled with neutral 1.0
            operand_a <= {FP16_1_0, FP16_1_0, FP16_1_0, a0};
            operand_b <= {FP16_1_0, FP16_1_0, FP16_1_0, b0};

            @(posedge clk);
            valid_in  <= 1'b0;

            if (test_op == OP_DIV)
                wait_valid(320);
            else
                wait_valid(15);
            @(posedge clk);

            res0 = result[15:0];
            pass = 1'b0;
            case (expected_class)
                CLASS_NAN:    pass = fp16_is_nan(res0);
                CLASS_INF:    pass = fp16_is_inf(res0);
                CLASS_ZERO:   pass = fp16_is_zero(res0);
                CLASS_FINITE: pass = !fp16_is_nan(res0) && !fp16_is_inf(res0) && !fp16_is_zero(res0);
                CLASS_EXACT:  pass = (res0 === expected_bits);
            endcase

            if (pass) begin
                $display("  PASS: 0x%04h (class=%0d)", res0, expected_class);
                pass_count++;
            end else begin
                $display("  FAIL: got 0x%04h (class=%0d)", res0, expected_class);
            end
        end
    endtask

    // ========================================================================
    // E1: Operation-Level Microbenchmark
    // ========================================================================

    task automatic benchmark_e1();
        begin
            $display("\n============================================================");
            $display("  E1: Operation-Level Microbenchmark");
            $display("  Numerical correctness, latency, and throughput per op");
            $display("============================================================");

            // ----------------------------------------------------------------
            // FP64 Tests (1 cycle each for ADD/SUB/MUL; ~56 cycles for DIV)
            // ----------------------------------------------------------------
            $display("\n--- FP64 Tests ---");
            test_fp64("FP64 ADD: 1.0 + 2.0", OP_ADD, FP64_1_0, FP64_2_0, 3.0);
            test_fp64("FP64 SUB: 3.0 - 1.0", OP_SUB, FP64_3_0, FP64_1_0, 2.0);
            test_fp64("FP64 MUL: 2.0 * 3.0", OP_MUL, FP64_2_0, FP64_3_0, 6.0);
            test_fp64("FP64 DIV: 8.0 / 2.0", OP_DIV, FP64_8_0, FP64_2_0, 4.0);

            // ----------------------------------------------------------------
            // FP32 SIMD Tests (2 slots packed in 64 bits)
            // ----------------------------------------------------------------
            $display("\n--- FP32 SIMD Tests (2 operations packed) ---");

            // ADD: {3.0+4.0, 1.0+2.0} = {7.0, 3.0}
            test_fp32_simd("FP32 SIMD ADD", OP_ADD,
                           FP32_1_0, FP32_3_0,
                           FP32_2_0, FP32_4_0,
                           3.0, 7.0);

            // SUB: {5.0-3.0, 4.0-1.0} = {2.0, 3.0}
            test_fp32_simd("FP32 SIMD SUB", OP_SUB,
                           FP32_4_0, FP32_5_0,
                           FP32_1_0, FP32_3_0,
                           3.0, 2.0);

            // MUL: {3.0*4.0, 2.0*3.0} = {12.0, 6.0}
            test_fp32_simd("FP32 SIMD MUL", OP_MUL,
                           FP32_2_0, FP32_3_0,
                           FP32_3_0, FP32_4_0,
                           6.0, 12.0);

            // DIV: {10.0/2.0, 8.0/4.0} = {5.0, 2.0}
            test_fp32_simd("FP32 SIMD DIV", OP_DIV,
                           FP32_8_0, FP32_10_0,
                           FP32_4_0, FP32_2_0,
                           2.0, 5.0);

            // ----------------------------------------------------------------
            // FP16 SIMD Tests (4 slots packed in 64 bits)
            // ----------------------------------------------------------------
            $display("\n--- FP16 SIMD Tests (4 operations packed) ---");

            // ADD: {4+5, 3+4, 2+3, 1+2} = {9, 7, 5, 3}
            test_fp16_simd("FP16 SIMD ADD", OP_ADD,
                           FP16_1_0, FP16_2_0, FP16_3_0, FP16_4_0,
                           FP16_2_0, FP16_3_0, FP16_4_0, FP16_5_0,
                           3.0, 5.0, 7.0, 9.0);

            // SUB: {8-4, 6-3, 4-2, 3-1} = {4, 3, 2, 2}
            test_fp16_simd("FP16 SIMD SUB", OP_SUB,
                           FP16_3_0, FP16_4_0, FP16_6_0, FP16_8_0,
                           FP16_1_0, FP16_2_0, FP16_3_0, FP16_4_0,
                           2.0, 2.0, 3.0, 4.0);

            // MUL: {4*2, 3*3, 2*4, 1*5} = {8, 9, 8, 5}
            test_fp16_simd("FP16 SIMD MUL", OP_MUL,
                           FP16_1_0, FP16_2_0, FP16_3_0, FP16_4_0,
                           FP16_5_0, FP16_4_0, FP16_3_0, FP16_2_0,
                           5.0, 8.0, 9.0, 8.0);

            // DIV: {8/2, 6/3, 4/2, 2/1} = {4, 2, 2, 2}
            test_fp16_simd("FP16 SIMD DIV", OP_DIV,
                           FP16_2_0, FP16_4_0, FP16_6_0, FP16_8_0,
                           FP16_1_0, FP16_2_0, FP16_3_0, FP16_2_0,
                           2.0, 2.0, 2.0, 4.0);
        end
    endtask

    // ========================================================================
    // E2: Directed IEEE-754 Corner-Case Benchmark
    // ========================================================================

    task automatic benchmark_e2();
        begin
            $display("\n============================================================");
            $display("  E2: Directed IEEE-754 Corner-Case Tests");
            $display("  Signed zeros, infinities, NaNs, extreme finite values");
            $display("============================================================");

            // ----------------------------------------------------------------
            // FP64 Corner Cases
            // ----------------------------------------------------------------
            $display("\n--- FP64 Corner Cases ---");

            // Signed zeros
            test_fp64_corner("FP64 ADD: +0 + +0 = +0",   OP_ADD, FP64_POS_ZERO, FP64_POS_ZERO, CLASS_ZERO,  64'h0);
            test_fp64_corner("FP64 ADD: +0 + -0 = +0",   OP_ADD, FP64_POS_ZERO, FP64_NEG_ZERO, CLASS_ZERO,  64'h0);
            test_fp64_corner("FP64 SUB: +0 - +0 = +0",   OP_SUB, FP64_POS_ZERO, FP64_POS_ZERO, CLASS_ZERO,  64'h0);
            test_fp64_corner("FP64 MUL: 1.0 * +0 = +0",  OP_MUL, FP64_1_0,      FP64_POS_ZERO, CLASS_ZERO,  64'h0);
            test_fp64_corner("FP64 MUL: -1.0 * +0 = -0", OP_MUL, FP64_NEG_1_0,  FP64_POS_ZERO, CLASS_ZERO,  64'h0);

            // Infinities
            test_fp64_corner("FP64 ADD: +Inf + 1.0 = +Inf",  OP_ADD, FP64_POS_INF, FP64_1_0,      CLASS_INF, 64'h0);
            test_fp64_corner("FP64 ADD: -Inf + 1.0 = -Inf",  OP_ADD, FP64_NEG_INF, FP64_1_0,      CLASS_INF, 64'h0);
            test_fp64_corner("FP64 ADD: +Inf + -Inf = NaN",  OP_ADD, FP64_POS_INF, FP64_NEG_INF,  CLASS_NAN, 64'h0);
            test_fp64_corner("FP64 SUB: +Inf - +Inf = NaN",  OP_SUB, FP64_POS_INF, FP64_POS_INF,  CLASS_NAN, 64'h0);
            test_fp64_corner("FP64 MUL: +Inf * 2.0 = +Inf",  OP_MUL, FP64_POS_INF, FP64_2_0,      CLASS_INF, 64'h0);
            test_fp64_corner("FP64 MUL: +Inf * +0 = NaN",    OP_MUL, FP64_POS_INF, FP64_POS_ZERO, CLASS_NAN, 64'h0);
            test_fp64_corner("FP64 DIV: 1.0 / +0 = +Inf",   OP_DIV, FP64_1_0,      FP64_POS_ZERO, CLASS_INF, 64'h0);
            test_fp64_corner("FP64 DIV: +Inf / 2.0 = +Inf", OP_DIV, FP64_POS_INF,  FP64_2_0,      CLASS_INF, 64'h0);
            test_fp64_corner("FP64 DIV: +Inf / +Inf = NaN", OP_DIV, FP64_POS_INF,  FP64_POS_INF,  CLASS_NAN, 64'h0);

            // NaN propagation
            test_fp64_corner("FP64 ADD: qNaN + 1.0 = NaN",  OP_ADD, FP64_QNAN, FP64_1_0,   CLASS_NAN, 64'h0);
            test_fp64_corner("FP64 SUB: 1.0 - qNaN = NaN",  OP_SUB, FP64_1_0,  FP64_QNAN,  CLASS_NAN, 64'h0);
            test_fp64_corner("FP64 MUL: qNaN * 2.0 = NaN",  OP_MUL, FP64_QNAN, FP64_2_0,   CLASS_NAN, 64'h0);
            test_fp64_corner("FP64 DIV: qNaN / 1.0 = NaN",  OP_DIV, FP64_QNAN, FP64_1_0,   CLASS_NAN, 64'h0);
            test_fp64_corner("FP64 ADD: sNaN + 1.0 = NaN",  OP_ADD, FP64_SNAN, FP64_1_0,   CLASS_NAN, 64'h0);
            test_fp64_corner("FP64 DIV: 0 / 0 = NaN",       OP_DIV, FP64_POS_ZERO, FP64_POS_ZERO, CLASS_NAN, 64'h0);

            // Extreme finite values
            test_fp64_corner("FP64 ADD: MAX + MAX = +Inf (overflow)", OP_ADD, FP64_MAX, FP64_MAX, CLASS_INF,   64'h0);
            test_fp64_corner("FP64 MUL: MAX * 2.0 = +Inf (overflow)", OP_MUL, FP64_MAX, FP64_2_0, CLASS_INF,  64'h0);
            test_fp64_corner("FP64 DIV: MIN_NORM / 0.5 finite",       OP_DIV, FP64_MIN_NORM, FP64_0_5, CLASS_FINITE, 64'h0);
            test_fp64_corner("FP64 MUL: MIN_NORM * 2.0 finite",       OP_MUL, FP64_MIN_NORM, FP64_2_0, CLASS_FINITE, 64'h0);

            // ----------------------------------------------------------------
            // FP32 Corner Cases
            // ----------------------------------------------------------------
            $display("\n--- FP32 Corner Cases ---");

            test_fp32_corner("FP32 ADD: +0 + +0 = +0",    OP_ADD, FP32_POS_ZERO, FP32_POS_ZERO, CLASS_ZERO,  32'h0);
            test_fp32_corner("FP32 ADD: +Inf + -Inf = NaN",OP_ADD, FP32_POS_INF,  FP32_NEG_INF,  CLASS_NAN,   32'h0);
            test_fp32_corner("FP32 SUB: +Inf - +Inf = NaN",OP_SUB, FP32_POS_INF,  FP32_POS_INF,  CLASS_NAN,   32'h0);
            test_fp32_corner("FP32 MUL: +Inf * +0 = NaN",  OP_MUL, FP32_POS_INF,  FP32_POS_ZERO, CLASS_NAN,   32'h0);
            test_fp32_corner("FP32 DIV: 1.0 / +0 = +Inf", OP_DIV, FP32_1_0,       FP32_POS_ZERO, CLASS_INF,   32'h0);
            test_fp32_corner("FP32 DIV: +0 / +0 = NaN",   OP_DIV, FP32_POS_ZERO,  FP32_POS_ZERO, CLASS_NAN,   32'h0);
            test_fp32_corner("FP32 ADD: qNaN + 1.0 = NaN", OP_ADD, FP32_QNAN,      FP32_1_0,      CLASS_NAN,   32'h0);
            test_fp32_corner("FP32 MUL: MAX * 2.0 = +Inf", OP_MUL, FP32_MAX,       FP32_2_0,      CLASS_INF,   32'h0);
            test_fp32_corner("FP32 ADD: +Inf + 1.0 = +Inf",OP_ADD, FP32_POS_INF,   FP32_1_0,      CLASS_INF,   32'h0);
            test_fp32_corner("FP32 DIV: MIN_NORM * 2.0 finite", OP_DIV, FP32_MIN_NORM, FP32_0_5,  CLASS_FINITE, 32'h0);

            // ----------------------------------------------------------------
            // FP16 Corner Cases
            // ----------------------------------------------------------------
            $display("\n--- FP16 Corner Cases ---");

            test_fp16_corner("FP16 ADD: +0 + +0 = +0",    OP_ADD, FP16_POS_ZERO, FP16_POS_ZERO, CLASS_ZERO,  16'h0);
            test_fp16_corner("FP16 ADD: +Inf + -Inf = NaN",OP_ADD, FP16_POS_INF,  FP16_NEG_INF,  CLASS_NAN,   16'h0);
            test_fp16_corner("FP16 SUB: +Inf - +Inf = NaN",OP_SUB, FP16_POS_INF,  FP16_POS_INF,  CLASS_NAN,   16'h0);
            test_fp16_corner("FP16 MUL: +Inf * +0 = NaN",  OP_MUL, FP16_POS_INF,  FP16_POS_ZERO, CLASS_NAN,   16'h0);
            test_fp16_corner("FP16 DIV: 1.0 / +0 = +Inf", OP_DIV, FP16_1_0,       FP16_POS_ZERO, CLASS_INF,   16'h0);
            test_fp16_corner("FP16 DIV: +0 / +0 = NaN",   OP_DIV, FP16_POS_ZERO,  FP16_POS_ZERO, CLASS_NAN,   16'h0);
            test_fp16_corner("FP16 ADD: qNaN + 1.0 = NaN", OP_ADD, FP16_QNAN,      FP16_1_0,      CLASS_NAN,   16'h0);
            test_fp16_corner("FP16 MUL: MAX * 2.0 = +Inf", OP_MUL, FP16_MAX,       FP16_2_0,      CLASS_INF,   16'h0);
            test_fp16_corner("FP16 ADD: +Inf + 1.0 = +Inf",OP_ADD, FP16_POS_INF,   FP16_1_0,      CLASS_INF,   16'h0);
            test_fp16_corner("FP16 DIV: MIN_NORM * 2.0 finite", OP_DIV, FP16_MIN_NORM, FP16_0_5,  CLASS_FINITE, 16'h0);
        end
    endtask

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

        // Run benchmarks
        benchmark_e1();
        benchmark_e2();

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
