package fpu_tb_pkg;

    localparam logic [1:0] FP16 = 2'b00;
    localparam logic [1:0] FP32 = 2'b01;
    localparam logic [1:0] FP64 = 2'b10;

    localparam logic [1:0] ADD  = 2'b00;
    localparam logic [1:0] SUB  = 2'b01;
    localparam logic [1:0] MUL  = 2'b10;
    localparam logic [1:0] DIV  = 2'b11;

    typedef struct packed {
        logic [63:0] a_bits;
        logic [63:0] b_bits;
    } fp64_vec_t;

    function automatic logic [63:0] ref_model_fp64(
        input logic [1:0] op,
        input logic [63:0] a_bits,
        input logic [63:0] b_bits
    );
        real a, b, r;
        begin
            a = $bitstoreal(a_bits);
            b = $bitstoreal(b_bits);

            case (op)
                ADD: r = a + b;
                SUB: r = a - b;
                MUL: r = a * b;
                DIV: r = a / b;
                default: r = 0.0;
            endcase

            ref_model_fp64 = $realtobits(r);
        end
    endfunction

    function automatic string op_to_string(input logic [1:0] op);
        case (op)
            ADD: return "ADD";
            SUB: return "SUB";
            MUL: return "MUL";
            DIV: return "DIV";
            default: return "UNKNOWN";
        endcase
    endfunction

    function automatic string precision_to_string(input logic [1:0] p);
        case (p)
            FP16: return "FP16";
            FP32: return "FP32";
            FP64: return "FP64";
            default: return "UNKNOWN";
        endcase
    endfunction

    function automatic fp64_vec_t make_fp64_vec(input real a, input real b);
        fp64_vec_t v;
        begin
            v.a_bits = $realtobits(a);
            v.b_bits = $realtobits(b);
            return v;
        end
    endfunction

endpackage