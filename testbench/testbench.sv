`timescale 1ns/1ps

`include "fpu_tb_pkg.sv"

module testbench;

    import fpu_tb_pkg::*;

    logic        clk;
    logic        rst_n;
    logic        valid_in;
    logic [1:0]  precision;
    logic [1:0]  op;
    logic [63:0] operand_a;
    logic [63:0] operand_b;
    logic        valid_out;
    logic [1:0]  precision_out;
    logic [63:0] result;

    int mismatch_count;
    int total_cycles;
    int test_count;
    int cycles_this_test;

    logic [63:0] ref_bits;
    
    `include "tasks.svh"

    fpu_bfm dut (
        .clk          (clk),
        .rst_n        (rst_n),
        .valid_in     (valid_in),
        .precision_in (precision),
        .op           (op),
        .operand_a    (operand_a),
        .operand_b    (operand_b),
        .valid_out    (valid_out),
        .precision_out(precision_out),
        .result       (result)
    );

    // Clock
    always #5 clk = ~clk;

    // Main
    initial begin
        clk = 1'b0;
        reset_dut();

        // Corner cases
        run_corner_cases_fp64(ADD);
        run_corner_cases_fp64(SUB);
        run_corner_cases_fp64(MUL);
        run_corner_cases_fp64(DIV);

        // Random
        run_random_tests_fp64(ADD, 20);
        run_random_tests_fp64(SUB, 20);
        run_random_tests_fp64(MUL, 20);
        run_random_tests_fp64(DIV, 20);

        #20;
        $finish;
    end

endmodule