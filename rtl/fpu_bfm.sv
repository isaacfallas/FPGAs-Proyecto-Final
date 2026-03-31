module fpu_bfm (
    input  logic        clk,
    input  logic        rst_n,
    input  logic        valid_in,
    input  logic [1:0]  precision_in,
    input  logic [1:0]  op,
    input  logic [63:0] operand_a,
    input  logic [63:0] operand_b,
    output logic        valid_out,
    output logic [1:0]  precision_out,
    output logic [63:0] result
);

    // Precision encoding
    localparam logic [1:0] FP16 = 2'b00;
    localparam logic [1:0] FP32 = 2'b01;
    localparam logic [1:0] FP64 = 2'b10;

    // Operation encoding
    localparam logic [1:0] ADD  = 2'b00;
    localparam logic [1:0] SUB  = 2'b01;
    localparam logic [1:0] MUL  = 2'b10;
    localparam logic [1:0] DIV  = 2'b11;

    // ------------------------------------------------------------
    // Functions: arithmetic model (FP64 only)
    // ------------------------------------------------------------

    function automatic logic [63:0] do_add(
        input logic [63:0] a_bits,
        input logic [63:0] b_bits
    );
        real a, b, r;
        begin
            a = $bitstoreal(a_bits);
            b = $bitstoreal(b_bits);
            r = a + b;
            do_add = $realtobits(r);
        end
    endfunction

    function automatic logic [63:0] do_sub(
        input logic [63:0] a_bits,
        input logic [63:0] b_bits
    );
        real a, b, r;
        begin
            a = $bitstoreal(a_bits);
            b = $bitstoreal(b_bits);
            r = a - b;
            do_sub = $realtobits(r);
        end
    endfunction

    function automatic logic [63:0] do_mul(
        input logic [63:0] a_bits,
        input logic [63:0] b_bits
    );
        real a, b, r;
        begin
            a = $bitstoreal(a_bits);
            b = $bitstoreal(b_bits);
            r = a * b;
            do_mul = $realtobits(r);
        end
    endfunction

    function automatic logic [63:0] do_div(
        input logic [63:0] a_bits,
        input logic [63:0] b_bits
    );
        real a, b, r;
        begin
            a = $bitstoreal(a_bits);
            b = $bitstoreal(b_bits);
            r = a / b;
            do_div = $realtobits(r);
        end
    endfunction

    // ------------------------------------------------------------
    // Task: reset outputs
    // ------------------------------------------------------------

    task automatic do_reset();
        begin
            result        = 64'd0;
            valid_out     = 1'b0;
            precision_out = 2'b00;
        end
    endtask

    // ------------------------------------------------------------
    // Task: process one request
    // ------------------------------------------------------------

    task automatic process_request();
        begin
            valid_out = 1'b0;

            if (valid_in) begin
                precision_out = precision_in;

                case (op)
                    ADD: result = do_add(operand_a, operand_b);
                    SUB: result = do_sub(operand_a, operand_b);
                    MUL: result = do_mul(operand_a, operand_b);
                    DIV: result = do_div(operand_a, operand_b);
                    default: result = 64'd0;
                endcase

                valid_out = 1'b1;
            end
        end
    endtask

    // ------------------------------------------------------------
    // Main behavioral loop
    // ------------------------------------------------------------

    initial begin
        do_reset();

        forever begin
            @(posedge clk);

            if (!rst_n)
                do_reset();
            else
                process_request();
        end
    end

endmodule