// ============================================================================
// D2: AXI Lite Wrapper para FPU Unified Datapath
// ============================================================================
// Misma interfaz que D1 para compatibilidad
// ============================================================================

import fpu_pkg::*;

module fpu_axi_wrapper #(
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
    // Registro Map (32 bits, direcciones byte)
    // ========================================================================
    // 0x00: OPERAND_A [31:0]  (lower)           - R/W
    // 0x04: OPERAND_A [63:32] (upper)           - R/W
    // 0x08: OPERAND_B [31:0]  (lower)           - R/W
    // 0x0C: OPERAND_B [63:32] (upper)           - R/W
    // 0x10: CONTROL: precision[1:0], op[3:2], start[4] - R/W
    // 0x14: RESULT [31:0]     (lower)           - READ ONLY
    // 0x18: RESULT [63:32]    (upper)           - READ ONLY
    // 0x1C: STATUS: exceptions[4:0], valid[5]  - READ ONLY
    // ========================================================================
    
    // Registros de escritura
    reg [63:0] operand_a_reg;
    reg [63:0] operand_b_reg;
    reg [1:0]  precision_reg;
    reg [1:0]  operation_reg;
    reg        start_reg;
    
    // Registros para capturar resultado del FPU
    reg [63:0] result_reg;
    reg [4:0]  exceptions_reg;
    reg        result_valid_reg;
    
    // Señales internas del FPU
    wire [63:0] fpu_result;
    wire [4:0]  fpu_exceptions_raw;
    wire        fpu_valid;
    
    // Convertir struct a wire plano
    fp_exceptions_t fpu_exceptions_struct;
    assign fpu_exceptions_raw = {fpu_exceptions_struct.invalid, 
                                  fpu_exceptions_struct.div_zero,
                                  fpu_exceptions_struct.overflow,
                                  fpu_exceptions_struct.underflow,
                                  fpu_exceptions_struct.inexact};
    
    // ========================================================================
    // Instancia del FPU D2
    // ========================================================================
    
    fpu_top fpu_inst (
        .clk          (s_axi_clk),
        .rst_n        (s_axi_resetn),
        .valid_in     (start_reg),
        .precision    (precision_e'(precision_reg)),
        .op           (operation_e'(operation_reg)),
        .operand_a    (operand_a_reg),
        .operand_b    (operand_b_reg),
        .valid_out    (fpu_valid),
        .precision_out(),
        .result       (fpu_result),
        .exceptions   (fpu_exceptions_struct)
    );

    // ========================================================================
    // Captura de resultado del FPU
    // ========================================================================
    
    always_ff @(posedge s_axi_clk or negedge s_axi_resetn) begin
        if (!s_axi_resetn) begin
            result_reg       <= 64'h0;
            exceptions_reg   <= 5'h0;
            result_valid_reg <= 1'b0;
        end else begin
            if (fpu_valid) begin
                result_reg       <= fpu_result;
                exceptions_reg   <= fpu_exceptions_raw;
                result_valid_reg <= 1'b1;
            end
        end
    end

    // ========================================================================
    // Write Logic - FSM estilo test_axi (probado en hardware)
    // ========================================================================
    
    localparam W_IDLE = 1'b0, W_RESP = 1'b1;
    reg w_state;
    reg [C_S_AXI_ADDR_WIDTH-1:0] aw_addr;
    
    reg awready_reg;
    reg wready_reg;
    reg bvalid_reg;
    
    assign s_axi_awready = awready_reg;
    assign s_axi_wready  = wready_reg;
    assign s_axi_bresp   = 2'b00;
    assign s_axi_bvalid  = bvalid_reg;
    
    always_ff @(posedge s_axi_clk or negedge s_axi_resetn) begin
        if (!s_axi_resetn) begin
            w_state       <= W_IDLE;
            awready_reg   <= 1'b1;
            wready_reg    <= 1'b1;
            bvalid_reg    <= 1'b0;
            aw_addr       <= '0;
            operand_a_reg <= 64'h0;
            operand_b_reg <= 64'h0;
            precision_reg <= 2'b10;
            operation_reg <= 2'b00;
            start_reg     <= 1'b0;
        end else begin
            start_reg <= 1'b0;
            
            case (w_state)
                W_IDLE: begin
                    awready_reg <= 1'b1;
                    wready_reg  <= 1'b1;
                    bvalid_reg  <= 1'b0;
                    
                    if (s_axi_awvalid)
                        aw_addr <= s_axi_awaddr;
                    
                    if (s_axi_awvalid && s_axi_wvalid) begin
                        awready_reg <= 1'b0;
                        wready_reg  <= 1'b0;
                        bvalid_reg  <= 1'b1;
                        w_state     <= W_RESP;
                        
                        case (s_axi_awaddr[4:2])
                            3'h0: operand_a_reg[31:0]   <= s_axi_wdata;
                            3'h1: operand_a_reg[63:32]  <= s_axi_wdata;
                            3'h2: operand_b_reg[31:0]   <= s_axi_wdata;
                            3'h3: operand_b_reg[63:32]  <= s_axi_wdata;
                            3'h4: begin
                                precision_reg <= s_axi_wdata[1:0];
                                operation_reg <= s_axi_wdata[3:2];
                                start_reg     <= s_axi_wdata[4];
                            end
                            default: ;
                        endcase
                    end
                end
                
                W_RESP: begin
                    if (s_axi_bready) begin
                        bvalid_reg <= 1'b0;
                        w_state    <= W_IDLE;
                    end
                end
            endcase
        end
    end

    // ========================================================================
    // Read Logic - FSM estilo test_axi (probado en hardware)
    // ========================================================================
    
    localparam R_IDLE = 1'b0, R_RESP = 1'b1;
    reg r_state;
    
    reg arready_reg;
    reg rvalid_reg;
    reg [C_S_AXI_DATA_WIDTH-1:0] read_data_reg;
    
    assign s_axi_arready = arready_reg;
    assign s_axi_rdata   = read_data_reg;
    assign s_axi_rresp   = 2'b00;
    assign s_axi_rvalid  = rvalid_reg;
    
    always_ff @(posedge s_axi_clk or negedge s_axi_resetn) begin
        if (!s_axi_resetn) begin
            r_state       <= R_IDLE;
            arready_reg   <= 1'b1;
            rvalid_reg    <= 1'b0;
            read_data_reg <= 32'h0;
        end else begin
            case (r_state)
                R_IDLE: begin
                    arready_reg <= 1'b1;
                    rvalid_reg  <= 1'b0;
                    
                    if (s_axi_arvalid) begin
                        arready_reg <= 1'b0;
                        rvalid_reg  <= 1'b1;
                        r_state     <= R_RESP;
                        
                        case (s_axi_araddr[4:2])
                            3'h0: read_data_reg <= operand_a_reg[31:0];
                            3'h1: read_data_reg <= operand_a_reg[63:32];
                            3'h2: read_data_reg <= operand_b_reg[31:0];
                            3'h3: read_data_reg <= operand_b_reg[63:32];
                            3'h4: read_data_reg <= {24'h0, 3'b0, start_reg, operation_reg, precision_reg};
                            3'h5: read_data_reg <= result_reg[31:0];
                            3'h6: read_data_reg <= result_reg[63:32];
                            3'h7: read_data_reg <= {24'h0, 2'b0, result_valid_reg, exceptions_reg};
                        endcase
                    end
                end
                
                R_RESP: begin
                    if (s_axi_rready) begin
                        rvalid_reg <= 1'b0;
                        r_state    <= R_IDLE;
                    end
                end
            endcase
        end
    end

endmodule
