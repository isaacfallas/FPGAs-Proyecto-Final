// ============================================================================
// Verilog Wrapper para fpu_axi_wrapper.sv
// ============================================================================
// Este archivo es el que usarás como TOP en Vivado Block Diagram
// Envuelve el módulo SystemVerilog de forma que Vivado lo reconoce correctamente
// ============================================================================

module fpu_axi_wrapper_v #(
    parameter C_S_AXI_DATA_WIDTH = 32,
    parameter C_S_AXI_ADDR_WIDTH = 10
) (
    
    // AXI Lite Write Address Channel
    input  [C_S_AXI_ADDR_WIDTH-1:0]  s_axi_awaddr,
    input                             s_axi_awvalid,
    output                            s_axi_awready,
    
    // AXI Lite Write Data Channel
    input  [C_S_AXI_DATA_WIDTH-1:0]  s_axi_wdata,
    input  [C_S_AXI_DATA_WIDTH/8-1:0] s_axi_wstrb,
    input                             s_axi_wvalid,
    output                            s_axi_wready,
    
    // AXI Lite Write Response Channel
    output [1:0]                      s_axi_bresp,
    output                            s_axi_bvalid,
    input                             s_axi_bready,
    
    // AXI Lite Read Address Channel
    input  [C_S_AXI_ADDR_WIDTH-1:0]  s_axi_araddr,
    input                             s_axi_arvalid,
    output                            s_axi_arready,
    
    // AXI Lite Read Data Channel
    output [C_S_AXI_DATA_WIDTH-1:0]  s_axi_rdata,
    output [1:0]                      s_axi_rresp,
    output                            s_axi_rvalid,
    input                             s_axi_rready,
    
    // System signals
    input  s_axi_clk,
    input  s_axi_resetn
);

    // ========================================================================
    // Instancia del módulo SystemVerilog original
    // ========================================================================
    
    fpu_axi_wrapper #(
        .C_S_AXI_DATA_WIDTH(C_S_AXI_DATA_WIDTH),
        .C_S_AXI_ADDR_WIDTH(C_S_AXI_ADDR_WIDTH)
    ) fpu_axi_inst (
        .s_axi_awaddr   (s_axi_awaddr),
        .s_axi_awvalid  (s_axi_awvalid),
        .s_axi_awready  (s_axi_awready),
        .s_axi_wdata    (s_axi_wdata),
        .s_axi_wstrb    (s_axi_wstrb),
        .s_axi_wvalid   (s_axi_wvalid),
        .s_axi_wready   (s_axi_wready),
        .s_axi_bresp    (s_axi_bresp),
        .s_axi_bvalid   (s_axi_bvalid),
        .s_axi_bready   (s_axi_bready),
        .s_axi_araddr   (s_axi_araddr),
        .s_axi_arvalid  (s_axi_arvalid),
        .s_axi_arready  (s_axi_arready),
        .s_axi_rdata    (s_axi_rdata),
        .s_axi_rresp    (s_axi_rresp),
        .s_axi_rvalid   (s_axi_rvalid),
        .s_axi_rready   (s_axi_rready),
        .s_axi_clk      (s_axi_clk),
        .s_axi_resetn   (s_axi_resetn)
    );

endmodule
