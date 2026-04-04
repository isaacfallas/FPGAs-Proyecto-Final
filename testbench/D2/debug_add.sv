`timescale 1ns/1ps

// Debug test para operaciones en D2
module debug_add;

    import fpu_pkg::*;

    logic             clk = 0;
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

    fpu_top dut (.*);

    always #5 clk = ~clk;
    
    task automatic test_op(
        input string name,
        input operation_e op_in,
        input logic [63:0] a,
        input logic [63:0] b,
        input logic [63:0] expected
    );
        @(posedge clk);
        valid_in = 1;
        op = op_in;
        operand_a = a;
        operand_b = b;
        precision = PREC_FP64;
        
        @(posedge clk);
        valid_in = 0;
        
        @(posedge clk);  // Esperar resultado
        
        $display("%s: A=%h B=%h", name, a, b);
        $display("  Resultado:  %h (%f)", result, $bitstoreal(result));
        $display("  Esperado:   %h (%f)", expected, $bitstoreal(expected));
        
        // Debug interno para DIV
        if (op_in == OP_DIV) begin
            $display("  DEBUG DIV:");
            $display("    a_unpacked: sign=%b exp=%h mant=%h", 
                     dut.a_unpacked.sign, dut.a_unpacked.exp, dut.a_unpacked.mant);
            $display("    b_unpacked: sign=%b exp=%h mant=%h",
                     dut.b_unpacked.sign, dut.b_unpacked.exp, dut.b_unpacked.mant);
            $display("    core_result: sign=%b exp=%h mant=%h",
                     dut.core_result.sign, dut.core_result.exp, dut.core_result.mant);
        end
        
        if (result == expected)
            $display("  PASS");
        else
            $display("  FAIL!");
        $display("");
    endtask

    initial begin
        $display("=== Debug Tests FP64 ===\n");
        
        rst_n = 0;
        valid_in = 0;
        precision = PREC_FP64;
        op = OP_ADD;
        operand_a = 0;
        operand_b = 0;
        
        repeat(3) @(posedge clk);
        rst_n = 1;
        @(posedge clk);
        
        // ADD tests
        test_op("ADD 1+2=3", OP_ADD, 
                64'h3FF0000000000000,  // 1.0
                64'h4000000000000000,  // 2.0
                64'h4008000000000000); // 3.0
                
        test_op("ADD 1.5+2.5=4", OP_ADD,
                64'h3FF8000000000000,  // 1.5
                64'h4004000000000000,  // 2.5
                64'h4010000000000000); // 4.0
        
        // SUB tests
        test_op("SUB 5-3=2", OP_SUB,
                64'h4014000000000000,  // 5.0
                64'h4008000000000000,  // 3.0
                64'h4000000000000000); // 2.0
        
        // MUL tests
        test_op("MUL 2*3=6", OP_MUL,
                64'h4000000000000000,  // 2.0
                64'h4008000000000000,  // 3.0
                64'h4018000000000000); // 6.0
        
        // DIV tests
        test_op("DIV 6/2=3", OP_DIV,
                64'h4018000000000000,  // 6.0
                64'h4000000000000000,  // 2.0
                64'h4008000000000000); // 3.0
                
        test_op("DIV 10/2=5", OP_DIV,
                64'h4024000000000000,  // 10.0
                64'h4000000000000000,  // 2.0
                64'h4014000000000000); // 5.0
        
        $display("=== Tests Complete ===");
        $finish;
    end

endmodule
