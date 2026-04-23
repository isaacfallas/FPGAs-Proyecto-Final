// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2024.1 (64-bit)
// Tool Version Limit: 2024.05
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// 
// ==============================================================
`timescale 1ns/1ps
module fpu_top_control_s_axi
#(parameter
    C_S_AXI_ADDR_WIDTH = 7,
    C_S_AXI_DATA_WIDTH = 32
)(
    input  wire                          ACLK,
    input  wire                          ARESET,
    input  wire                          ACLK_EN,
    input  wire [C_S_AXI_ADDR_WIDTH-1:0] AWADDR,
    input  wire                          AWVALID,
    output wire                          AWREADY,
    input  wire [C_S_AXI_DATA_WIDTH-1:0] WDATA,
    input  wire [C_S_AXI_DATA_WIDTH/8-1:0] WSTRB,
    input  wire                          WVALID,
    output wire                          WREADY,
    output wire [1:0]                    BRESP,
    output wire                          BVALID,
    input  wire                          BREADY,
    input  wire [C_S_AXI_ADDR_WIDTH-1:0] ARADDR,
    input  wire                          ARVALID,
    output wire                          ARREADY,
    output wire [C_S_AXI_DATA_WIDTH-1:0] RDATA,
    output wire [1:0]                    RRESP,
    output wire                          RVALID,
    input  wire                          RREADY,
    input  wire                          clk,
    input  wire                          rst,
    output wire [0:0]                    rst_n,
    output wire [0:0]                    ce_r,
    output wire [0:0]                    valid_in,
    output wire [1:0]                    precision,
    output wire [1:0]                    op,
    output wire [63:0]                   operand_a,
    output wire [63:0]                   operand_b,
    output wire [0:0]                    valid_out,
    output wire [1:0]                    precision_out,
    output wire [63:0]                   result,
    output wire [4:0]                    exceptions
);
//------------------------Address Info-------------------
// Protocol Used: ap_ctrl_none
//
// 0x00 : reserved
// 0x04 : reserved
// 0x08 : reserved
// 0x0c : reserved
// 0x18 : Data signal of rst_n
//        bit 0  - rst_n[0] (Read/Write)
//        others - reserved
// 0x1c : reserved
// 0x20 : Data signal of ce_r
//        bit 0  - ce_r[0] (Read/Write)
//        others - reserved
// 0x24 : reserved
// 0x28 : Data signal of valid_in
//        bit 0  - valid_in[0] (Read/Write)
//        others - reserved
// 0x2c : reserved
// 0x30 : Data signal of precision
//        bit 1~0 - precision[1:0] (Read/Write)
//        others  - reserved
// 0x34 : reserved
// 0x38 : Data signal of op
//        bit 1~0 - op[1:0] (Read/Write)
//        others  - reserved
// 0x3c : reserved
// 0x40 : Data signal of operand_a
//        bit 31~0 - operand_a[31:0] (Read/Write)
// 0x44 : Data signal of operand_a
//        bit 31~0 - operand_a[63:32] (Read/Write)
// 0x48 : reserved
// 0x4c : Data signal of operand_b
//        bit 31~0 - operand_b[31:0] (Read/Write)
// 0x50 : Data signal of operand_b
//        bit 31~0 - operand_b[63:32] (Read/Write)
// 0x54 : reserved
// 0x58 : Data signal of valid_out
//        bit 0  - valid_out[0] (Read/Write)
//        others - reserved
// 0x5c : reserved
// 0x60 : Data signal of precision_out
//        bit 1~0 - precision_out[1:0] (Read/Write)
//        others  - reserved
// 0x64 : reserved
// 0x68 : Data signal of result
//        bit 31~0 - result[31:0] (Read/Write)
// 0x6c : Data signal of result
//        bit 31~0 - result[63:32] (Read/Write)
// 0x70 : reserved
// 0x74 : Data signal of exceptions
//        bit 4~0 - exceptions[4:0] (Read/Write)
//        others  - reserved
// 0x78 : reserved
// (SC = Self Clear, COR = Clear on Read, TOW = Toggle on Write, COH = Clear on Handshake)

//------------------------Parameter----------------------
localparam
    ADDR_RST_N_DATA_0         = 7'h18,
    ADDR_RST_N_CTRL           = 7'h1c,
    ADDR_CE_R_DATA_0          = 7'h20,
    ADDR_CE_R_CTRL            = 7'h24,
    ADDR_VALID_IN_DATA_0      = 7'h28,
    ADDR_VALID_IN_CTRL        = 7'h2c,
    ADDR_PRECISION_DATA_0     = 7'h30,
    ADDR_PRECISION_CTRL       = 7'h34,
    ADDR_OP_DATA_0            = 7'h38,
    ADDR_OP_CTRL              = 7'h3c,
    ADDR_OPERAND_A_DATA_0     = 7'h40,
    ADDR_OPERAND_A_DATA_1     = 7'h44,
    ADDR_OPERAND_A_CTRL       = 7'h48,
    ADDR_OPERAND_B_DATA_0     = 7'h4c,
    ADDR_OPERAND_B_DATA_1     = 7'h50,
    ADDR_OPERAND_B_CTRL       = 7'h54,
    ADDR_VALID_OUT_DATA_0     = 7'h58,
    ADDR_VALID_OUT_CTRL       = 7'h5c,
    ADDR_PRECISION_OUT_DATA_0 = 7'h60,
    ADDR_PRECISION_OUT_CTRL   = 7'h64,
    ADDR_RESULT_DATA_0        = 7'h68,
    ADDR_RESULT_DATA_1        = 7'h6c,
    ADDR_RESULT_CTRL          = 7'h70,
    ADDR_EXCEPTIONS_DATA_0    = 7'h74,
    ADDR_EXCEPTIONS_CTRL      = 7'h78,
    WRIDLE                    = 2'd0,
    WRDATA                    = 2'd1,
    WRRESP                    = 2'd2,
    WRRESET                   = 2'd3,
    RDIDLE                    = 2'd0,
    RDDATA                    = 2'd1,
    RDRESET                   = 2'd2,
    ADDR_BITS                = 7;

//------------------------Local signal-------------------
    reg  [1:0]                    wstate = WRRESET;
    reg  [1:0]                    wnext;
    reg  [ADDR_BITS-1:0]          waddr;
    wire [C_S_AXI_DATA_WIDTH-1:0] wmask;
    wire                          aw_hs;
    wire                          w_hs;
    reg  [1:0]                    rstate = RDRESET;
    reg  [1:0]                    rnext;
    reg  [C_S_AXI_DATA_WIDTH-1:0] rdata;
    wire                          ar_hs;
    wire [ADDR_BITS-1:0]          raddr;
    // internal registers
    reg  [0:0]                    int_rst_n = 'b0;
    reg  [0:0]                    rst_n_set = 'b0;
    reg  [0:0]                    int_ce_r = 'b0;
    reg  [0:0]                    ce_r_set = 'b0;
    reg  [0:0]                    int_valid_in = 'b0;
    reg  [0:0]                    valid_in_set = 'b0;
    reg  [1:0]                    int_precision = 'b0;
    reg  [1:0]                    precision_set = 'b0;
    reg  [1:0]                    int_op = 'b0;
    reg  [1:0]                    op_set = 'b0;
    reg  [63:0]                   int_operand_a = 'b0;
    reg  [63:0]                   operand_a_set = 'b0;
    reg  [63:0]                   int_operand_b = 'b0;
    reg  [63:0]                   operand_b_set = 'b0;
    reg  [0:0]                    int_valid_out = 'b0;
    reg  [0:0]                    valid_out_set = 'b0;
    reg  [1:0]                    int_precision_out = 'b0;
    reg  [1:0]                    precision_out_set = 'b0;
    reg  [63:0]                   int_result = 'b0;
    reg  [63:0]                   result_set = 'b0;
    reg  [4:0]                    int_exceptions = 'b0;
    reg  [4:0]                    exceptions_set = 'b0;

//------------------------Instantiation------------------


//------------------------AXI write fsm------------------
assign AWREADY = (wstate == WRIDLE);
assign WREADY  = (wstate == WRDATA);
assign BRESP   = 2'b00;  // OKAY
assign BVALID  = (wstate == WRRESP);
assign wmask   = { {8{WSTRB[3]}}, {8{WSTRB[2]}}, {8{WSTRB[1]}}, {8{WSTRB[0]}} };
assign aw_hs   = AWVALID & AWREADY;
assign w_hs    = WVALID & WREADY;

// wstate
always @(posedge ACLK) begin
    if (ARESET)
        wstate <= WRRESET;
    else if (ACLK_EN)
        wstate <= wnext;
end

// wnext
always @(*) begin
    case (wstate)
        WRIDLE:
            if (AWVALID)
                wnext = WRDATA;
            else
                wnext = WRIDLE;
        WRDATA:
            if (WVALID)
                wnext = WRRESP;
            else
                wnext = WRDATA;
        WRRESP:
            if (BREADY)
                wnext = WRIDLE;
            else
                wnext = WRRESP;
        default:
            wnext = WRIDLE;
    endcase
end

// waddr
always @(posedge ACLK) begin
    if (ACLK_EN) begin
        if (aw_hs)
            waddr <= {AWADDR[ADDR_BITS-1:2], {2{1'b0}}};
    end
end

//------------------------AXI read fsm-------------------
assign ARREADY = (rstate == RDIDLE);
assign RDATA   = rdata;
assign RRESP   = 2'b00;  // OKAY
assign RVALID  = (rstate == RDDATA);
assign ar_hs   = ARVALID & ARREADY;
assign raddr   = ARADDR[ADDR_BITS-1:0];

// rstate
always @(posedge ACLK) begin
    if (ARESET)
        rstate <= RDRESET;
    else if (ACLK_EN)
        rstate <= rnext;
end

// rnext
always @(*) begin
    case (rstate)
        RDIDLE:
            if (ARVALID)
                rnext = RDDATA;
            else
                rnext = RDIDLE;
        RDDATA:
            if (RREADY & RVALID)
                rnext = RDIDLE;
            else
                rnext = RDDATA;
        default:
            rnext = RDIDLE;
    endcase
end

// rdata
always @(posedge ACLK) begin
    if (ACLK_EN) begin
        if (ar_hs) begin
            rdata <= 'b0;
            case (raddr)
                ADDR_RST_N_DATA_0: begin
                    rdata <= rst_n_set[0:0];
                end
                ADDR_CE_R_DATA_0: begin
                    rdata <= ce_r_set[0:0];
                end
                ADDR_VALID_IN_DATA_0: begin
                    rdata <= valid_in_set[0:0];
                end
                ADDR_PRECISION_DATA_0: begin
                    rdata <= precision_set[1:0];
                end
                ADDR_OP_DATA_0: begin
                    rdata <= op_set[1:0];
                end
                ADDR_OPERAND_A_DATA_0: begin
                    rdata <= operand_a_set[31:0];
                end
                ADDR_OPERAND_A_DATA_1: begin
                    rdata <= operand_a_set[63:32];
                end
                ADDR_OPERAND_B_DATA_0: begin
                    rdata <= operand_b_set[31:0];
                end
                ADDR_OPERAND_B_DATA_1: begin
                    rdata <= operand_b_set[63:32];
                end
                ADDR_VALID_OUT_DATA_0: begin
                    rdata <= valid_out_set[0:0];
                end
                ADDR_PRECISION_OUT_DATA_0: begin
                    rdata <= precision_out_set[1:0];
                end
                ADDR_RESULT_DATA_0: begin
                    rdata <= result_set[31:0];
                end
                ADDR_RESULT_DATA_1: begin
                    rdata <= result_set[63:32];
                end
                ADDR_EXCEPTIONS_DATA_0: begin
                    rdata <= exceptions_set[4:0];
                end
            endcase
        end
    end
end


//------------------------Register logic-----------------
assign rst_n         = int_rst_n;
assign ce_r          = int_ce_r;
assign valid_in      = int_valid_in;
assign precision     = int_precision;
assign op            = int_op;
assign operand_a     = int_operand_a;
assign operand_b     = int_operand_b;
assign valid_out     = int_valid_out;
assign precision_out = int_precision_out;
assign result        = int_result;
assign exceptions    = int_exceptions;
// rst_n_set[0:0]
always @(posedge ACLK) begin
    if (ARESET)
        rst_n_set[0:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_RST_N_DATA_0)
            rst_n_set[0:0] <= (WDATA[31:0] & wmask) | (rst_n_set[0:0] & ~wmask);
    end
end

// ce_r_set[0:0]
always @(posedge ACLK) begin
    if (ARESET)
        ce_r_set[0:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_CE_R_DATA_0)
            ce_r_set[0:0] <= (WDATA[31:0] & wmask) | (ce_r_set[0:0] & ~wmask);
    end
end

// valid_in_set[0:0]
always @(posedge ACLK) begin
    if (ARESET)
        valid_in_set[0:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_VALID_IN_DATA_0)
            valid_in_set[0:0] <= (WDATA[31:0] & wmask) | (valid_in_set[0:0] & ~wmask);
    end
end

// precision_set[1:0]
always @(posedge ACLK) begin
    if (ARESET)
        precision_set[1:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_PRECISION_DATA_0)
            precision_set[1:0] <= (WDATA[31:0] & wmask) | (precision_set[1:0] & ~wmask);
    end
end

// op_set[1:0]
always @(posedge ACLK) begin
    if (ARESET)
        op_set[1:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_OP_DATA_0)
            op_set[1:0] <= (WDATA[31:0] & wmask) | (op_set[1:0] & ~wmask);
    end
end

// operand_a_set[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        operand_a_set[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_OPERAND_A_DATA_0)
            operand_a_set[31:0] <= (WDATA[31:0] & wmask) | (operand_a_set[31:0] & ~wmask);
    end
end

// operand_a_set[63:32]
always @(posedge ACLK) begin
    if (ARESET)
        operand_a_set[63:32] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_OPERAND_A_DATA_1)
            operand_a_set[63:32] <= (WDATA[31:0] & wmask) | (operand_a_set[63:32] & ~wmask);
    end
end

// operand_b_set[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        operand_b_set[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_OPERAND_B_DATA_0)
            operand_b_set[31:0] <= (WDATA[31:0] & wmask) | (operand_b_set[31:0] & ~wmask);
    end
end

// operand_b_set[63:32]
always @(posedge ACLK) begin
    if (ARESET)
        operand_b_set[63:32] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_OPERAND_B_DATA_1)
            operand_b_set[63:32] <= (WDATA[31:0] & wmask) | (operand_b_set[63:32] & ~wmask);
    end
end

// valid_out_set[0:0]
always @(posedge ACLK) begin
    if (ARESET)
        valid_out_set[0:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_VALID_OUT_DATA_0)
            valid_out_set[0:0] <= (WDATA[31:0] & wmask) | (valid_out_set[0:0] & ~wmask);
    end
end

// precision_out_set[1:0]
always @(posedge ACLK) begin
    if (ARESET)
        precision_out_set[1:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_PRECISION_OUT_DATA_0)
            precision_out_set[1:0] <= (WDATA[31:0] & wmask) | (precision_out_set[1:0] & ~wmask);
    end
end

// result_set[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        result_set[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_RESULT_DATA_0)
            result_set[31:0] <= (WDATA[31:0] & wmask) | (result_set[31:0] & ~wmask);
    end
end

// result_set[63:32]
always @(posedge ACLK) begin
    if (ARESET)
        result_set[63:32] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_RESULT_DATA_1)
            result_set[63:32] <= (WDATA[31:0] & wmask) | (result_set[63:32] & ~wmask);
    end
end

// exceptions_set[4:0]
always @(posedge ACLK) begin
    if (ARESET)
        exceptions_set[4:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_EXCEPTIONS_DATA_0)
            exceptions_set[4:0] <= (WDATA[31:0] & wmask) | (exceptions_set[4:0] & ~wmask);
    end
end

// int_rst_n[0:0]
always @(posedge clk) begin
    if (rst)
        int_rst_n[0:0] <= 0;
    else
        int_rst_n[0:0] <= rst_n_set[0:0];
end
// int_ce_r[0:0]
always @(posedge clk) begin
    if (rst)
        int_ce_r[0:0] <= 0;
    else
        int_ce_r[0:0] <= ce_r_set[0:0];
end
// int_valid_in[0:0]
always @(posedge clk) begin
    if (rst)
        int_valid_in[0:0] <= 0;
    else
        int_valid_in[0:0] <= valid_in_set[0:0];
end
// int_precision[1:0]
always @(posedge clk) begin
    if (rst)
        int_precision[1:0] <= 0;
    else
        int_precision[1:0] <= precision_set[1:0];
end
// int_op[1:0]
always @(posedge clk) begin
    if (rst)
        int_op[1:0] <= 0;
    else
        int_op[1:0] <= op_set[1:0];
end
// int_operand_a[31:0]
always @(posedge clk) begin
    if (rst)
        int_operand_a[31:0] <= 0;
    else
        int_operand_a[31:0] <= operand_a_set[31:0];
end
// int_operand_a[63:32]
always @(posedge clk) begin
    if (rst)
        int_operand_a[63:32] <= 0;
    else
        int_operand_a[63:32] <= operand_a_set[63:32];
end
// int_operand_b[31:0]
always @(posedge clk) begin
    if (rst)
        int_operand_b[31:0] <= 0;
    else
        int_operand_b[31:0] <= operand_b_set[31:0];
end
// int_operand_b[63:32]
always @(posedge clk) begin
    if (rst)
        int_operand_b[63:32] <= 0;
    else
        int_operand_b[63:32] <= operand_b_set[63:32];
end
// int_valid_out[0:0]
always @(posedge clk) begin
    if (rst)
        int_valid_out[0:0] <= 0;
    else
        int_valid_out[0:0] <= valid_out_set[0:0];
end
// int_precision_out[1:0]
always @(posedge clk) begin
    if (rst)
        int_precision_out[1:0] <= 0;
    else
        int_precision_out[1:0] <= precision_out_set[1:0];
end
// int_result[31:0]
always @(posedge clk) begin
    if (rst)
        int_result[31:0] <= 0;
    else
        int_result[31:0] <= result_set[31:0];
end
// int_result[63:32]
always @(posedge clk) begin
    if (rst)
        int_result[63:32] <= 0;
    else
        int_result[63:32] <= result_set[63:32];
end
// int_exceptions[4:0]
always @(posedge clk) begin
    if (rst)
        int_exceptions[4:0] <= 0;
    else
        int_exceptions[4:0] <= exceptions_set[4:0];
end

//------------------------Memory logic-------------------

endmodule
