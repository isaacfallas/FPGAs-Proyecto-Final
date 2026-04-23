// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2024.1 (win64) Build 5076996 Wed May 22 18:37:14 MDT 2024
// Date        : Thu Apr 23 13:42:00 2026
// Host        : Caverna running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ design_1_fpu_top_0_0_sim_netlist.v
// Design      : design_1_fpu_top_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xck26-sfvc784-2LV-c
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "design_1_fpu_top_0_0,fpu_top,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* IP_DEFINITION_SOURCE = "HLS" *) 
(* X_CORE_INFO = "fpu_top,Vivado 2024.1" *) (* hls_module = "yes" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
   (s_axi_control_ARADDR,
    s_axi_control_ARREADY,
    s_axi_control_ARVALID,
    s_axi_control_AWADDR,
    s_axi_control_AWREADY,
    s_axi_control_AWVALID,
    s_axi_control_BREADY,
    s_axi_control_BRESP,
    s_axi_control_BVALID,
    s_axi_control_RDATA,
    s_axi_control_RREADY,
    s_axi_control_RRESP,
    s_axi_control_RVALID,
    s_axi_control_WDATA,
    s_axi_control_WREADY,
    s_axi_control_WSTRB,
    s_axi_control_WVALID,
    ap_clk,
    ap_rst_n);
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control ARADDR" *) input [6:0]s_axi_control_ARADDR;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control ARREADY" *) output s_axi_control_ARREADY;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control ARVALID" *) input s_axi_control_ARVALID;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control AWADDR" *) input [6:0]s_axi_control_AWADDR;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control AWREADY" *) output s_axi_control_AWREADY;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control AWVALID" *) input s_axi_control_AWVALID;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control BREADY" *) input s_axi_control_BREADY;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control BRESP" *) output [1:0]s_axi_control_BRESP;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control BVALID" *) output s_axi_control_BVALID;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control RDATA" *) output [31:0]s_axi_control_RDATA;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control RREADY" *) input s_axi_control_RREADY;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control RRESP" *) output [1:0]s_axi_control_RRESP;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control RVALID" *) output s_axi_control_RVALID;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control WDATA" *) input [31:0]s_axi_control_WDATA;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control WREADY" *) output s_axi_control_WREADY;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control WSTRB" *) input [3:0]s_axi_control_WSTRB;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control WVALID" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME s_axi_control, ADDR_WIDTH 7, DATA_WIDTH 32, PROTOCOL AXI4LITE, READ_WRITE_MODE READ_WRITE, FREQ_HZ 99999001, ID_WIDTH 0, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, HAS_BURST 0, HAS_LOCK 0, HAS_PROT 0, HAS_CACHE 0, HAS_QOS 0, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, SUPPORTS_NARROW_BURST 0, NUM_READ_OUTSTANDING 1, NUM_WRITE_OUTSTANDING 1, MAX_BURST_LENGTH 1, PHASE 0.0, CLK_DOMAIN design_1_zynq_ultra_ps_e_0_0_pl_clk0, NUM_READ_THREADS 4, NUM_WRITE_THREADS 4, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0" *) input s_axi_control_WVALID;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 ap_clk CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME ap_clk, ASSOCIATED_BUSIF s_axi_control, ASSOCIATED_RESET ap_rst_n, FREQ_HZ 99999001, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN design_1_zynq_ultra_ps_e_0_0_pl_clk0, INSERT_VIP 0" *) input ap_clk;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 ap_rst_n RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME ap_rst_n, POLARITY ACTIVE_LOW, INSERT_VIP 0" *) input ap_rst_n;

  wire \<const0> ;
  wire ap_clk;
  wire ap_rst_n;
  wire [6:0]s_axi_control_ARADDR;
  wire s_axi_control_ARREADY;
  wire s_axi_control_ARVALID;
  wire [6:0]s_axi_control_AWADDR;
  wire s_axi_control_AWREADY;
  wire s_axi_control_AWVALID;
  wire s_axi_control_BREADY;
  wire s_axi_control_BVALID;
  wire [31:0]s_axi_control_RDATA;
  wire s_axi_control_RREADY;
  wire s_axi_control_RVALID;
  wire [31:0]s_axi_control_WDATA;
  wire s_axi_control_WREADY;
  wire [3:0]s_axi_control_WSTRB;
  wire s_axi_control_WVALID;
  wire [1:0]NLW_inst_s_axi_control_BRESP_UNCONNECTED;
  wire [1:0]NLW_inst_s_axi_control_RRESP_UNCONNECTED;

  assign s_axi_control_BRESP[1] = \<const0> ;
  assign s_axi_control_BRESP[0] = \<const0> ;
  assign s_axi_control_RRESP[1] = \<const0> ;
  assign s_axi_control_RRESP[0] = \<const0> ;
  GND GND
       (.G(\<const0> ));
  (* C_S_AXI_CONTROL_ADDR_WIDTH = "7" *) 
  (* C_S_AXI_CONTROL_DATA_WIDTH = "32" *) 
  (* C_S_AXI_CONTROL_WSTRB_WIDTH = "4" *) 
  (* C_S_AXI_DATA_WIDTH = "32" *) 
  (* C_S_AXI_WSTRB_WIDTH = "4" *) 
  (* SDX_KERNEL = "true" *) 
  (* SDX_KERNEL_SYNTH_INST = "inst" *) 
  (* SDX_KERNEL_TYPE = "hls" *) 
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_fpu_top inst
       (.ap_clk(ap_clk),
        .ap_rst_n(ap_rst_n),
        .s_axi_control_ARADDR(s_axi_control_ARADDR),
        .s_axi_control_ARREADY(s_axi_control_ARREADY),
        .s_axi_control_ARVALID(s_axi_control_ARVALID),
        .s_axi_control_AWADDR({s_axi_control_AWADDR[6:2],1'b0,1'b0}),
        .s_axi_control_AWREADY(s_axi_control_AWREADY),
        .s_axi_control_AWVALID(s_axi_control_AWVALID),
        .s_axi_control_BREADY(s_axi_control_BREADY),
        .s_axi_control_BRESP(NLW_inst_s_axi_control_BRESP_UNCONNECTED[1:0]),
        .s_axi_control_BVALID(s_axi_control_BVALID),
        .s_axi_control_RDATA(s_axi_control_RDATA),
        .s_axi_control_RREADY(s_axi_control_RREADY),
        .s_axi_control_RRESP(NLW_inst_s_axi_control_RRESP_UNCONNECTED[1:0]),
        .s_axi_control_RVALID(s_axi_control_RVALID),
        .s_axi_control_WDATA(s_axi_control_WDATA),
        .s_axi_control_WREADY(s_axi_control_WREADY),
        .s_axi_control_WSTRB(s_axi_control_WSTRB),
        .s_axi_control_WVALID(s_axi_control_WVALID));
endmodule

(* C_S_AXI_CONTROL_ADDR_WIDTH = "7" *) (* C_S_AXI_CONTROL_DATA_WIDTH = "32" *) (* C_S_AXI_CONTROL_WSTRB_WIDTH = "4" *) 
(* C_S_AXI_DATA_WIDTH = "32" *) (* C_S_AXI_WSTRB_WIDTH = "4" *) (* hls_module = "yes" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_fpu_top
   (s_axi_control_AWVALID,
    s_axi_control_AWREADY,
    s_axi_control_AWADDR,
    s_axi_control_WVALID,
    s_axi_control_WREADY,
    s_axi_control_WDATA,
    s_axi_control_WSTRB,
    s_axi_control_ARVALID,
    s_axi_control_ARREADY,
    s_axi_control_ARADDR,
    s_axi_control_RVALID,
    s_axi_control_RREADY,
    s_axi_control_RDATA,
    s_axi_control_RRESP,
    s_axi_control_BVALID,
    s_axi_control_BREADY,
    s_axi_control_BRESP,
    ap_clk,
    ap_rst_n);
  input s_axi_control_AWVALID;
  output s_axi_control_AWREADY;
  input [6:0]s_axi_control_AWADDR;
  input s_axi_control_WVALID;
  output s_axi_control_WREADY;
  input [31:0]s_axi_control_WDATA;
  input [3:0]s_axi_control_WSTRB;
  input s_axi_control_ARVALID;
  output s_axi_control_ARREADY;
  input [6:0]s_axi_control_ARADDR;
  output s_axi_control_RVALID;
  input s_axi_control_RREADY;
  output [31:0]s_axi_control_RDATA;
  output [1:0]s_axi_control_RRESP;
  output s_axi_control_BVALID;
  input s_axi_control_BREADY;
  output [1:0]s_axi_control_BRESP;
  input ap_clk;
  input ap_rst_n;

  wire \<const0> ;
  wire ap_clk;
  wire ap_rst_n;
  wire ap_rst_n_inv;
  wire ap_rst_reg_1;
  wire ap_rst_reg_2;
  wire p_0_in;
  wire [6:0]s_axi_control_ARADDR;
  wire s_axi_control_ARREADY;
  wire s_axi_control_ARVALID;
  wire [6:0]s_axi_control_AWADDR;
  wire s_axi_control_AWREADY;
  wire s_axi_control_AWVALID;
  wire s_axi_control_BREADY;
  wire s_axi_control_BVALID;
  wire [31:0]s_axi_control_RDATA;
  wire s_axi_control_RREADY;
  wire s_axi_control_RVALID;
  wire [31:0]s_axi_control_WDATA;
  wire s_axi_control_WREADY;
  wire [3:0]s_axi_control_WSTRB;
  wire s_axi_control_WVALID;

  assign s_axi_control_BRESP[1] = \<const0> ;
  assign s_axi_control_BRESP[0] = \<const0> ;
  assign s_axi_control_RRESP[1] = \<const0> ;
  assign s_axi_control_RRESP[0] = \<const0> ;
  GND GND
       (.G(\<const0> ));
  (* SHREG_EXTRACT = "no" *) 
  FDRE #(
    .INIT(1'b1)) 
    ap_rst_n_inv_reg
       (.C(ap_clk),
        .CE(1'b1),
        .D(ap_rst_reg_1),
        .Q(ap_rst_n_inv),
        .R(1'b0));
  (* SHREG_EXTRACT = "no" *) 
  FDRE #(
    .INIT(1'b1)) 
    ap_rst_reg_1_reg
       (.C(ap_clk),
        .CE(1'b1),
        .D(ap_rst_reg_2),
        .Q(ap_rst_reg_1),
        .R(1'b0));
  LUT1 #(
    .INIT(2'h1)) 
    ap_rst_reg_2_i_1
       (.I0(ap_rst_n),
        .O(p_0_in));
  (* SHREG_EXTRACT = "no" *) 
  FDRE #(
    .INIT(1'b1)) 
    ap_rst_reg_2_reg
       (.C(ap_clk),
        .CE(1'b1),
        .D(p_0_in),
        .Q(ap_rst_reg_2),
        .R(1'b0));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_fpu_top_control_s_axi control_s_axi_U
       (.\FSM_onehot_rstate_reg[1]_0 (s_axi_control_ARREADY),
        .\FSM_onehot_wstate_reg[1]_0 (s_axi_control_AWREADY),
        .\FSM_onehot_wstate_reg[2]_0 (s_axi_control_WREADY),
        .SR(ap_rst_n_inv),
        .ap_clk(ap_clk),
        .s_axi_control_ARADDR(s_axi_control_ARADDR),
        .s_axi_control_ARVALID(s_axi_control_ARVALID),
        .s_axi_control_AWADDR(s_axi_control_AWADDR[6:2]),
        .s_axi_control_AWVALID(s_axi_control_AWVALID),
        .s_axi_control_BREADY(s_axi_control_BREADY),
        .s_axi_control_BVALID(s_axi_control_BVALID),
        .s_axi_control_RDATA(s_axi_control_RDATA),
        .s_axi_control_RREADY(s_axi_control_RREADY),
        .s_axi_control_RVALID(s_axi_control_RVALID),
        .s_axi_control_WDATA(s_axi_control_WDATA),
        .s_axi_control_WSTRB(s_axi_control_WSTRB),
        .s_axi_control_WVALID(s_axi_control_WVALID));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_fpu_top_control_s_axi
   (\FSM_onehot_wstate_reg[2]_0 ,
    s_axi_control_BVALID,
    \FSM_onehot_wstate_reg[1]_0 ,
    s_axi_control_RVALID,
    \FSM_onehot_rstate_reg[1]_0 ,
    s_axi_control_RDATA,
    SR,
    ap_clk,
    s_axi_control_WDATA,
    s_axi_control_WSTRB,
    s_axi_control_WVALID,
    s_axi_control_AWADDR,
    s_axi_control_ARADDR,
    s_axi_control_ARVALID,
    s_axi_control_AWVALID,
    s_axi_control_BREADY,
    s_axi_control_RREADY);
  output \FSM_onehot_wstate_reg[2]_0 ;
  output s_axi_control_BVALID;
  output \FSM_onehot_wstate_reg[1]_0 ;
  output s_axi_control_RVALID;
  output \FSM_onehot_rstate_reg[1]_0 ;
  output [31:0]s_axi_control_RDATA;
  input [0:0]SR;
  input ap_clk;
  input [31:0]s_axi_control_WDATA;
  input [3:0]s_axi_control_WSTRB;
  input s_axi_control_WVALID;
  input [4:0]s_axi_control_AWADDR;
  input [6:0]s_axi_control_ARADDR;
  input s_axi_control_ARVALID;
  input s_axi_control_AWVALID;
  input s_axi_control_BREADY;
  input s_axi_control_RREADY;

  wire \FSM_onehot_rstate[1]_i_1_n_0 ;
  wire \FSM_onehot_rstate[2]_i_1_n_0 ;
  wire \FSM_onehot_rstate_reg[1]_0 ;
  wire \FSM_onehot_wstate[1]_i_1_n_0 ;
  wire \FSM_onehot_wstate[2]_i_1_n_0 ;
  wire \FSM_onehot_wstate[3]_i_1_n_0 ;
  wire \FSM_onehot_wstate_reg[1]_0 ;
  wire \FSM_onehot_wstate_reg[2]_0 ;
  wire [0:0]SR;
  wire ap_clk;
  wire \ce_r_set[0]_i_1_n_0 ;
  wire \ce_r_set[0]_i_2_n_0 ;
  wire \ce_r_set_reg_n_0_[0] ;
  wire \exceptions_set[0]_i_1_n_0 ;
  wire \exceptions_set[1]_i_1_n_0 ;
  wire \exceptions_set[2]_i_1_n_0 ;
  wire \exceptions_set[3]_i_1_n_0 ;
  wire \exceptions_set[4]_i_1_n_0 ;
  wire \exceptions_set[4]_i_2_n_0 ;
  wire \exceptions_set_reg_n_0_[0] ;
  wire \exceptions_set_reg_n_0_[1] ;
  wire \exceptions_set_reg_n_0_[2] ;
  wire \exceptions_set_reg_n_0_[3] ;
  wire \exceptions_set_reg_n_0_[4] ;
  wire [1:0]op_set0;
  wire \op_set[1]_i_1_n_0 ;
  wire \op_set_reg_n_0_[0] ;
  wire \op_set_reg_n_0_[1] ;
  wire \operand_a_set[31]_i_1_n_0 ;
  wire \operand_a_set[31]_i_3_n_0 ;
  wire \operand_a_set[63]_i_1_n_0 ;
  wire [31:0]operand_a_set_reg0;
  wire [31:0]operand_a_set_reg06_out;
  wire \operand_a_set_reg_n_0_[0] ;
  wire \operand_a_set_reg_n_0_[10] ;
  wire \operand_a_set_reg_n_0_[11] ;
  wire \operand_a_set_reg_n_0_[12] ;
  wire \operand_a_set_reg_n_0_[13] ;
  wire \operand_a_set_reg_n_0_[14] ;
  wire \operand_a_set_reg_n_0_[15] ;
  wire \operand_a_set_reg_n_0_[16] ;
  wire \operand_a_set_reg_n_0_[17] ;
  wire \operand_a_set_reg_n_0_[18] ;
  wire \operand_a_set_reg_n_0_[19] ;
  wire \operand_a_set_reg_n_0_[1] ;
  wire \operand_a_set_reg_n_0_[20] ;
  wire \operand_a_set_reg_n_0_[21] ;
  wire \operand_a_set_reg_n_0_[22] ;
  wire \operand_a_set_reg_n_0_[23] ;
  wire \operand_a_set_reg_n_0_[24] ;
  wire \operand_a_set_reg_n_0_[25] ;
  wire \operand_a_set_reg_n_0_[26] ;
  wire \operand_a_set_reg_n_0_[27] ;
  wire \operand_a_set_reg_n_0_[28] ;
  wire \operand_a_set_reg_n_0_[29] ;
  wire \operand_a_set_reg_n_0_[2] ;
  wire \operand_a_set_reg_n_0_[30] ;
  wire \operand_a_set_reg_n_0_[31] ;
  wire \operand_a_set_reg_n_0_[3] ;
  wire \operand_a_set_reg_n_0_[4] ;
  wire \operand_a_set_reg_n_0_[5] ;
  wire \operand_a_set_reg_n_0_[6] ;
  wire \operand_a_set_reg_n_0_[7] ;
  wire \operand_a_set_reg_n_0_[8] ;
  wire \operand_a_set_reg_n_0_[9] ;
  wire \operand_b_set[31]_i_1_n_0 ;
  wire \operand_b_set[63]_i_1_n_0 ;
  wire [31:0]operand_b_set_reg0;
  wire [31:0]operand_b_set_reg03_out;
  wire \operand_b_set_reg_n_0_[0] ;
  wire \operand_b_set_reg_n_0_[10] ;
  wire \operand_b_set_reg_n_0_[11] ;
  wire \operand_b_set_reg_n_0_[12] ;
  wire \operand_b_set_reg_n_0_[13] ;
  wire \operand_b_set_reg_n_0_[14] ;
  wire \operand_b_set_reg_n_0_[15] ;
  wire \operand_b_set_reg_n_0_[16] ;
  wire \operand_b_set_reg_n_0_[17] ;
  wire \operand_b_set_reg_n_0_[18] ;
  wire \operand_b_set_reg_n_0_[19] ;
  wire \operand_b_set_reg_n_0_[1] ;
  wire \operand_b_set_reg_n_0_[20] ;
  wire \operand_b_set_reg_n_0_[21] ;
  wire \operand_b_set_reg_n_0_[22] ;
  wire \operand_b_set_reg_n_0_[23] ;
  wire \operand_b_set_reg_n_0_[24] ;
  wire \operand_b_set_reg_n_0_[25] ;
  wire \operand_b_set_reg_n_0_[26] ;
  wire \operand_b_set_reg_n_0_[27] ;
  wire \operand_b_set_reg_n_0_[28] ;
  wire \operand_b_set_reg_n_0_[29] ;
  wire \operand_b_set_reg_n_0_[2] ;
  wire \operand_b_set_reg_n_0_[30] ;
  wire \operand_b_set_reg_n_0_[31] ;
  wire \operand_b_set_reg_n_0_[3] ;
  wire \operand_b_set_reg_n_0_[4] ;
  wire \operand_b_set_reg_n_0_[5] ;
  wire \operand_b_set_reg_n_0_[6] ;
  wire \operand_b_set_reg_n_0_[7] ;
  wire \operand_b_set_reg_n_0_[8] ;
  wire \operand_b_set_reg_n_0_[9] ;
  wire [31:0]p_1_in;
  wire [31:0]p_1_in1_in;
  wire [31:0]p_1_in3_in;
  wire [1:0]precision_out_set0;
  wire \precision_out_set[1]_i_1_n_0 ;
  wire \precision_out_set_reg_n_0_[0] ;
  wire \precision_out_set_reg_n_0_[1] ;
  wire [1:0]precision_set0;
  wire \precision_set[1]_i_1_n_0 ;
  wire \precision_set[1]_i_3_n_0 ;
  wire \precision_set_reg_n_0_[0] ;
  wire \precision_set_reg_n_0_[1] ;
  wire \rdata[0]_i_10_n_0 ;
  wire \rdata[0]_i_1_n_0 ;
  wire \rdata[0]_i_5_n_0 ;
  wire \rdata[0]_i_6_n_0 ;
  wire \rdata[0]_i_7_n_0 ;
  wire \rdata[0]_i_8_n_0 ;
  wire \rdata[0]_i_9_n_0 ;
  wire \rdata[10]_i_1_n_0 ;
  wire \rdata[10]_i_2_n_0 ;
  wire \rdata[10]_i_3_n_0 ;
  wire \rdata[11]_i_1_n_0 ;
  wire \rdata[11]_i_2_n_0 ;
  wire \rdata[11]_i_3_n_0 ;
  wire \rdata[12]_i_1_n_0 ;
  wire \rdata[12]_i_2_n_0 ;
  wire \rdata[12]_i_3_n_0 ;
  wire \rdata[13]_i_1_n_0 ;
  wire \rdata[13]_i_2_n_0 ;
  wire \rdata[13]_i_3_n_0 ;
  wire \rdata[14]_i_1_n_0 ;
  wire \rdata[14]_i_2_n_0 ;
  wire \rdata[14]_i_3_n_0 ;
  wire \rdata[15]_i_1_n_0 ;
  wire \rdata[15]_i_2_n_0 ;
  wire \rdata[15]_i_3_n_0 ;
  wire \rdata[16]_i_1_n_0 ;
  wire \rdata[16]_i_2_n_0 ;
  wire \rdata[16]_i_3_n_0 ;
  wire \rdata[17]_i_1_n_0 ;
  wire \rdata[17]_i_2_n_0 ;
  wire \rdata[17]_i_3_n_0 ;
  wire \rdata[18]_i_1_n_0 ;
  wire \rdata[18]_i_2_n_0 ;
  wire \rdata[18]_i_3_n_0 ;
  wire \rdata[19]_i_1_n_0 ;
  wire \rdata[19]_i_2_n_0 ;
  wire \rdata[19]_i_3_n_0 ;
  wire \rdata[1]_i_1_n_0 ;
  wire \rdata[1]_i_2_n_0 ;
  wire \rdata[1]_i_5_n_0 ;
  wire \rdata[1]_i_6_n_0 ;
  wire \rdata[1]_i_7_n_0 ;
  wire \rdata[1]_i_8_n_0 ;
  wire \rdata[20]_i_1_n_0 ;
  wire \rdata[20]_i_2_n_0 ;
  wire \rdata[20]_i_3_n_0 ;
  wire \rdata[21]_i_1_n_0 ;
  wire \rdata[21]_i_2_n_0 ;
  wire \rdata[21]_i_3_n_0 ;
  wire \rdata[22]_i_1_n_0 ;
  wire \rdata[22]_i_2_n_0 ;
  wire \rdata[22]_i_3_n_0 ;
  wire \rdata[23]_i_1_n_0 ;
  wire \rdata[23]_i_2_n_0 ;
  wire \rdata[23]_i_3_n_0 ;
  wire \rdata[24]_i_1_n_0 ;
  wire \rdata[24]_i_2_n_0 ;
  wire \rdata[24]_i_3_n_0 ;
  wire \rdata[25]_i_1_n_0 ;
  wire \rdata[25]_i_2_n_0 ;
  wire \rdata[25]_i_3_n_0 ;
  wire \rdata[26]_i_1_n_0 ;
  wire \rdata[26]_i_2_n_0 ;
  wire \rdata[26]_i_3_n_0 ;
  wire \rdata[27]_i_1_n_0 ;
  wire \rdata[27]_i_2_n_0 ;
  wire \rdata[27]_i_3_n_0 ;
  wire \rdata[28]_i_1_n_0 ;
  wire \rdata[28]_i_2_n_0 ;
  wire \rdata[28]_i_3_n_0 ;
  wire \rdata[29]_i_1_n_0 ;
  wire \rdata[29]_i_2_n_0 ;
  wire \rdata[29]_i_3_n_0 ;
  wire \rdata[2]_i_1_n_0 ;
  wire \rdata[2]_i_2_n_0 ;
  wire \rdata[2]_i_4_n_0 ;
  wire \rdata[2]_i_5_n_0 ;
  wire \rdata[30]_i_1_n_0 ;
  wire \rdata[30]_i_2_n_0 ;
  wire \rdata[30]_i_3_n_0 ;
  wire \rdata[31]_i_1_n_0 ;
  wire \rdata[31]_i_2_n_0 ;
  wire \rdata[31]_i_3_n_0 ;
  wire \rdata[31]_i_4_n_0 ;
  wire \rdata[31]_i_5_n_0 ;
  wire \rdata[3]_i_1_n_0 ;
  wire \rdata[3]_i_2_n_0 ;
  wire \rdata[3]_i_4_n_0 ;
  wire \rdata[3]_i_5_n_0 ;
  wire \rdata[4]_i_1_n_0 ;
  wire \rdata[4]_i_2_n_0 ;
  wire \rdata[4]_i_4_n_0 ;
  wire \rdata[4]_i_5_n_0 ;
  wire \rdata[5]_i_1_n_0 ;
  wire \rdata[5]_i_2_n_0 ;
  wire \rdata[5]_i_3_n_0 ;
  wire \rdata[6]_i_1_n_0 ;
  wire \rdata[6]_i_2_n_0 ;
  wire \rdata[6]_i_3_n_0 ;
  wire \rdata[7]_i_1_n_0 ;
  wire \rdata[7]_i_2_n_0 ;
  wire \rdata[7]_i_3_n_0 ;
  wire \rdata[8]_i_1_n_0 ;
  wire \rdata[8]_i_2_n_0 ;
  wire \rdata[8]_i_3_n_0 ;
  wire \rdata[9]_i_1_n_0 ;
  wire \rdata[9]_i_2_n_0 ;
  wire \rdata[9]_i_3_n_0 ;
  wire \rdata_reg[0]_i_2_n_0 ;
  wire \rdata_reg[0]_i_3_n_0 ;
  wire \rdata_reg[0]_i_4_n_0 ;
  wire \rdata_reg[1]_i_3_n_0 ;
  wire \rdata_reg[1]_i_4_n_0 ;
  wire \rdata_reg[2]_i_3_n_0 ;
  wire \rdata_reg[3]_i_3_n_0 ;
  wire \rdata_reg[4]_i_3_n_0 ;
  wire \result_set[31]_i_1_n_0 ;
  wire \result_set[63]_i_1_n_0 ;
  wire [31:0]result_set_reg0;
  wire [31:0]result_set_reg01_out;
  wire \result_set_reg_n_0_[0] ;
  wire \result_set_reg_n_0_[10] ;
  wire \result_set_reg_n_0_[11] ;
  wire \result_set_reg_n_0_[12] ;
  wire \result_set_reg_n_0_[13] ;
  wire \result_set_reg_n_0_[14] ;
  wire \result_set_reg_n_0_[15] ;
  wire \result_set_reg_n_0_[16] ;
  wire \result_set_reg_n_0_[17] ;
  wire \result_set_reg_n_0_[18] ;
  wire \result_set_reg_n_0_[19] ;
  wire \result_set_reg_n_0_[1] ;
  wire \result_set_reg_n_0_[20] ;
  wire \result_set_reg_n_0_[21] ;
  wire \result_set_reg_n_0_[22] ;
  wire \result_set_reg_n_0_[23] ;
  wire \result_set_reg_n_0_[24] ;
  wire \result_set_reg_n_0_[25] ;
  wire \result_set_reg_n_0_[26] ;
  wire \result_set_reg_n_0_[27] ;
  wire \result_set_reg_n_0_[28] ;
  wire \result_set_reg_n_0_[29] ;
  wire \result_set_reg_n_0_[2] ;
  wire \result_set_reg_n_0_[30] ;
  wire \result_set_reg_n_0_[31] ;
  wire \result_set_reg_n_0_[3] ;
  wire \result_set_reg_n_0_[4] ;
  wire \result_set_reg_n_0_[5] ;
  wire \result_set_reg_n_0_[6] ;
  wire \result_set_reg_n_0_[7] ;
  wire \result_set_reg_n_0_[8] ;
  wire \result_set_reg_n_0_[9] ;
  wire \rst_n_set[0]_i_1_n_0 ;
  wire \rst_n_set[0]_i_2_n_0 ;
  wire \rst_n_set_reg_n_0_[0] ;
  wire [6:0]s_axi_control_ARADDR;
  wire s_axi_control_ARVALID;
  wire [4:0]s_axi_control_AWADDR;
  wire s_axi_control_AWVALID;
  wire s_axi_control_BREADY;
  wire s_axi_control_BVALID;
  wire [31:0]s_axi_control_RDATA;
  wire s_axi_control_RREADY;
  wire s_axi_control_RVALID;
  wire [31:0]s_axi_control_WDATA;
  wire [3:0]s_axi_control_WSTRB;
  wire s_axi_control_WVALID;
  wire \valid_in_set[0]_i_1_n_0 ;
  wire \valid_in_set_reg_n_0_[0] ;
  wire \valid_out_set[0]_i_1_n_0 ;
  wire \valid_out_set[0]_i_2_n_0 ;
  wire \valid_out_set_reg_n_0_[0] ;
  wire [6:2]waddr;
  wire waddr2_out;

  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT4 #(
    .INIT(16'hF747)) 
    \FSM_onehot_rstate[1]_i_1 
       (.I0(s_axi_control_ARVALID),
        .I1(\FSM_onehot_rstate_reg[1]_0 ),
        .I2(s_axi_control_RVALID),
        .I3(s_axi_control_RREADY),
        .O(\FSM_onehot_rstate[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT4 #(
    .INIT(16'h8F88)) 
    \FSM_onehot_rstate[2]_i_1 
       (.I0(s_axi_control_ARVALID),
        .I1(\FSM_onehot_rstate_reg[1]_0 ),
        .I2(s_axi_control_RREADY),
        .I3(s_axi_control_RVALID),
        .O(\FSM_onehot_rstate[2]_i_1_n_0 ));
  (* FSM_ENCODED_STATES = "RDIDLE:010,RDDATA:100,iSTATE:001" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_rstate_reg[1] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(\FSM_onehot_rstate[1]_i_1_n_0 ),
        .Q(\FSM_onehot_rstate_reg[1]_0 ),
        .R(SR));
  (* FSM_ENCODED_STATES = "RDIDLE:010,RDDATA:100,iSTATE:001" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_rstate_reg[2] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(\FSM_onehot_rstate[2]_i_1_n_0 ),
        .Q(s_axi_control_RVALID),
        .R(SR));
  LUT5 #(
    .INIT(32'h888BFF8B)) 
    \FSM_onehot_wstate[1]_i_1 
       (.I0(s_axi_control_BREADY),
        .I1(s_axi_control_BVALID),
        .I2(\FSM_onehot_wstate_reg[2]_0 ),
        .I3(\FSM_onehot_wstate_reg[1]_0 ),
        .I4(s_axi_control_AWVALID),
        .O(\FSM_onehot_wstate[1]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h8F88)) 
    \FSM_onehot_wstate[2]_i_1 
       (.I0(s_axi_control_AWVALID),
        .I1(\FSM_onehot_wstate_reg[1]_0 ),
        .I2(s_axi_control_WVALID),
        .I3(\FSM_onehot_wstate_reg[2]_0 ),
        .O(\FSM_onehot_wstate[2]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h8F88)) 
    \FSM_onehot_wstate[3]_i_1 
       (.I0(s_axi_control_WVALID),
        .I1(\FSM_onehot_wstate_reg[2]_0 ),
        .I2(s_axi_control_BREADY),
        .I3(s_axi_control_BVALID),
        .O(\FSM_onehot_wstate[3]_i_1_n_0 ));
  (* FSM_ENCODED_STATES = "WRDATA:0100,WRRESP:1000,WRIDLE:0010,iSTATE:0001" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_wstate_reg[1] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(\FSM_onehot_wstate[1]_i_1_n_0 ),
        .Q(\FSM_onehot_wstate_reg[1]_0 ),
        .R(SR));
  (* FSM_ENCODED_STATES = "WRDATA:0100,WRRESP:1000,WRIDLE:0010,iSTATE:0001" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_wstate_reg[2] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(\FSM_onehot_wstate[2]_i_1_n_0 ),
        .Q(\FSM_onehot_wstate_reg[2]_0 ),
        .R(SR));
  (* FSM_ENCODED_STATES = "WRDATA:0100,WRRESP:1000,WRIDLE:0010,iSTATE:0001" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_wstate_reg[3] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(\FSM_onehot_wstate[3]_i_1_n_0 ),
        .Q(s_axi_control_BVALID),
        .R(SR));
  LUT5 #(
    .INIT(32'hFFBF0080)) 
    \ce_r_set[0]_i_1 
       (.I0(s_axi_control_WDATA[0]),
        .I1(s_axi_control_WSTRB[0]),
        .I2(\ce_r_set[0]_i_2_n_0 ),
        .I3(waddr[3]),
        .I4(\ce_r_set_reg_n_0_[0] ),
        .O(\ce_r_set[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000010000000)) 
    \ce_r_set[0]_i_2 
       (.I0(waddr[2]),
        .I1(waddr[6]),
        .I2(s_axi_control_WVALID),
        .I3(\FSM_onehot_wstate_reg[2]_0 ),
        .I4(waddr[5]),
        .I5(waddr[4]),
        .O(\ce_r_set[0]_i_2_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \ce_r_set_reg[0] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(\ce_r_set[0]_i_1_n_0 ),
        .Q(\ce_r_set_reg_n_0_[0] ),
        .R(SR));
  (* SOFT_HLUTNM = "soft_lutpair101" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \exceptions_set[0]_i_1 
       (.I0(s_axi_control_WDATA[0]),
        .I1(s_axi_control_WSTRB[0]),
        .I2(\exceptions_set_reg_n_0_[0] ),
        .O(\exceptions_set[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair100" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \exceptions_set[1]_i_1 
       (.I0(s_axi_control_WDATA[1]),
        .I1(s_axi_control_WSTRB[0]),
        .I2(\exceptions_set_reg_n_0_[1] ),
        .O(\exceptions_set[1]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \exceptions_set[2]_i_1 
       (.I0(s_axi_control_WDATA[2]),
        .I1(s_axi_control_WSTRB[0]),
        .I2(\exceptions_set_reg_n_0_[2] ),
        .O(\exceptions_set[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair102" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \exceptions_set[3]_i_1 
       (.I0(s_axi_control_WDATA[3]),
        .I1(s_axi_control_WSTRB[0]),
        .I2(\exceptions_set_reg_n_0_[3] ),
        .O(\exceptions_set[3]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h00008000)) 
    \exceptions_set[4]_i_1 
       (.I0(waddr[2]),
        .I1(\operand_a_set[31]_i_3_n_0 ),
        .I2(waddr[5]),
        .I3(waddr[4]),
        .I4(waddr[3]),
        .O(\exceptions_set[4]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair102" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \exceptions_set[4]_i_2 
       (.I0(s_axi_control_WDATA[4]),
        .I1(s_axi_control_WSTRB[0]),
        .I2(\exceptions_set_reg_n_0_[4] ),
        .O(\exceptions_set[4]_i_2_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \exceptions_set_reg[0] 
       (.C(ap_clk),
        .CE(\exceptions_set[4]_i_1_n_0 ),
        .D(\exceptions_set[0]_i_1_n_0 ),
        .Q(\exceptions_set_reg_n_0_[0] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \exceptions_set_reg[1] 
       (.C(ap_clk),
        .CE(\exceptions_set[4]_i_1_n_0 ),
        .D(\exceptions_set[1]_i_1_n_0 ),
        .Q(\exceptions_set_reg_n_0_[1] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \exceptions_set_reg[2] 
       (.C(ap_clk),
        .CE(\exceptions_set[4]_i_1_n_0 ),
        .D(\exceptions_set[2]_i_1_n_0 ),
        .Q(\exceptions_set_reg_n_0_[2] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \exceptions_set_reg[3] 
       (.C(ap_clk),
        .CE(\exceptions_set[4]_i_1_n_0 ),
        .D(\exceptions_set[3]_i_1_n_0 ),
        .Q(\exceptions_set_reg_n_0_[3] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \exceptions_set_reg[4] 
       (.C(ap_clk),
        .CE(\exceptions_set[4]_i_1_n_0 ),
        .D(\exceptions_set[4]_i_2_n_0 ),
        .Q(\exceptions_set_reg_n_0_[4] ),
        .R(SR));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \op_set[0]_i_1 
       (.I0(s_axi_control_WDATA[0]),
        .I1(s_axi_control_WSTRB[0]),
        .I2(\op_set_reg_n_0_[0] ),
        .O(op_set0[0]));
  LUT4 #(
    .INIT(16'h8000)) 
    \op_set[1]_i_1 
       (.I0(waddr[3]),
        .I1(waddr[5]),
        .I2(\precision_set[1]_i_3_n_0 ),
        .I3(waddr[4]),
        .O(\op_set[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \op_set[1]_i_2 
       (.I0(s_axi_control_WDATA[1]),
        .I1(s_axi_control_WSTRB[0]),
        .I2(\op_set_reg_n_0_[1] ),
        .O(op_set0[1]));
  FDRE #(
    .INIT(1'b0)) 
    \op_set_reg[0] 
       (.C(ap_clk),
        .CE(\op_set[1]_i_1_n_0 ),
        .D(op_set0[0]),
        .Q(\op_set_reg_n_0_[0] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \op_set_reg[1] 
       (.C(ap_clk),
        .CE(\op_set[1]_i_1_n_0 ),
        .D(op_set0[1]),
        .Q(\op_set_reg_n_0_[1] ),
        .R(SR));
  (* SOFT_HLUTNM = "soft_lutpair35" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \operand_a_set[0]_i_1 
       (.I0(s_axi_control_WDATA[0]),
        .I1(s_axi_control_WSTRB[0]),
        .I2(\operand_a_set_reg_n_0_[0] ),
        .O(operand_a_set_reg06_out[0]));
  (* SOFT_HLUTNM = "soft_lutpair25" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \operand_a_set[10]_i_1 
       (.I0(s_axi_control_WDATA[10]),
        .I1(s_axi_control_WSTRB[1]),
        .I2(\operand_a_set_reg_n_0_[10] ),
        .O(operand_a_set_reg06_out[10]));
  (* SOFT_HLUTNM = "soft_lutpair24" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \operand_a_set[11]_i_1 
       (.I0(s_axi_control_WDATA[11]),
        .I1(s_axi_control_WSTRB[1]),
        .I2(\operand_a_set_reg_n_0_[11] ),
        .O(operand_a_set_reg06_out[11]));
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \operand_a_set[12]_i_1 
       (.I0(s_axi_control_WDATA[12]),
        .I1(s_axi_control_WSTRB[1]),
        .I2(\operand_a_set_reg_n_0_[12] ),
        .O(operand_a_set_reg06_out[12]));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \operand_a_set[13]_i_1 
       (.I0(s_axi_control_WDATA[13]),
        .I1(s_axi_control_WSTRB[1]),
        .I2(\operand_a_set_reg_n_0_[13] ),
        .O(operand_a_set_reg06_out[13]));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \operand_a_set[14]_i_1 
       (.I0(s_axi_control_WDATA[14]),
        .I1(s_axi_control_WSTRB[1]),
        .I2(\operand_a_set_reg_n_0_[14] ),
        .O(operand_a_set_reg06_out[14]));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \operand_a_set[15]_i_1 
       (.I0(s_axi_control_WDATA[15]),
        .I1(s_axi_control_WSTRB[1]),
        .I2(\operand_a_set_reg_n_0_[15] ),
        .O(operand_a_set_reg06_out[15]));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \operand_a_set[16]_i_1 
       (.I0(s_axi_control_WDATA[16]),
        .I1(s_axi_control_WSTRB[2]),
        .I2(\operand_a_set_reg_n_0_[16] ),
        .O(operand_a_set_reg06_out[16]));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \operand_a_set[17]_i_1 
       (.I0(s_axi_control_WDATA[17]),
        .I1(s_axi_control_WSTRB[2]),
        .I2(\operand_a_set_reg_n_0_[17] ),
        .O(operand_a_set_reg06_out[17]));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \operand_a_set[18]_i_1 
       (.I0(s_axi_control_WDATA[18]),
        .I1(s_axi_control_WSTRB[2]),
        .I2(\operand_a_set_reg_n_0_[18] ),
        .O(operand_a_set_reg06_out[18]));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \operand_a_set[19]_i_1 
       (.I0(s_axi_control_WDATA[19]),
        .I1(s_axi_control_WSTRB[2]),
        .I2(\operand_a_set_reg_n_0_[19] ),
        .O(operand_a_set_reg06_out[19]));
  (* SOFT_HLUTNM = "soft_lutpair34" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \operand_a_set[1]_i_1 
       (.I0(s_axi_control_WDATA[1]),
        .I1(s_axi_control_WSTRB[0]),
        .I2(\operand_a_set_reg_n_0_[1] ),
        .O(operand_a_set_reg06_out[1]));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \operand_a_set[20]_i_1 
       (.I0(s_axi_control_WDATA[20]),
        .I1(s_axi_control_WSTRB[2]),
        .I2(\operand_a_set_reg_n_0_[20] ),
        .O(operand_a_set_reg06_out[20]));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \operand_a_set[21]_i_1 
       (.I0(s_axi_control_WDATA[21]),
        .I1(s_axi_control_WSTRB[2]),
        .I2(\operand_a_set_reg_n_0_[21] ),
        .O(operand_a_set_reg06_out[21]));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \operand_a_set[22]_i_1 
       (.I0(s_axi_control_WDATA[22]),
        .I1(s_axi_control_WSTRB[2]),
        .I2(\operand_a_set_reg_n_0_[22] ),
        .O(operand_a_set_reg06_out[22]));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \operand_a_set[23]_i_1 
       (.I0(s_axi_control_WDATA[23]),
        .I1(s_axi_control_WSTRB[2]),
        .I2(\operand_a_set_reg_n_0_[23] ),
        .O(operand_a_set_reg06_out[23]));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \operand_a_set[24]_i_1 
       (.I0(s_axi_control_WDATA[24]),
        .I1(s_axi_control_WSTRB[3]),
        .I2(\operand_a_set_reg_n_0_[24] ),
        .O(operand_a_set_reg06_out[24]));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \operand_a_set[25]_i_1 
       (.I0(s_axi_control_WDATA[25]),
        .I1(s_axi_control_WSTRB[3]),
        .I2(\operand_a_set_reg_n_0_[25] ),
        .O(operand_a_set_reg06_out[25]));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \operand_a_set[26]_i_1 
       (.I0(s_axi_control_WDATA[26]),
        .I1(s_axi_control_WSTRB[3]),
        .I2(\operand_a_set_reg_n_0_[26] ),
        .O(operand_a_set_reg06_out[26]));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \operand_a_set[27]_i_1 
       (.I0(s_axi_control_WDATA[27]),
        .I1(s_axi_control_WSTRB[3]),
        .I2(\operand_a_set_reg_n_0_[27] ),
        .O(operand_a_set_reg06_out[27]));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \operand_a_set[28]_i_1 
       (.I0(s_axi_control_WDATA[28]),
        .I1(s_axi_control_WSTRB[3]),
        .I2(\operand_a_set_reg_n_0_[28] ),
        .O(operand_a_set_reg06_out[28]));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \operand_a_set[29]_i_1 
       (.I0(s_axi_control_WDATA[29]),
        .I1(s_axi_control_WSTRB[3]),
        .I2(\operand_a_set_reg_n_0_[29] ),
        .O(operand_a_set_reg06_out[29]));
  (* SOFT_HLUTNM = "soft_lutpair33" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \operand_a_set[2]_i_1 
       (.I0(s_axi_control_WDATA[2]),
        .I1(s_axi_control_WSTRB[0]),
        .I2(\operand_a_set_reg_n_0_[2] ),
        .O(operand_a_set_reg06_out[2]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \operand_a_set[30]_i_1 
       (.I0(s_axi_control_WDATA[30]),
        .I1(s_axi_control_WSTRB[3]),
        .I2(\operand_a_set_reg_n_0_[30] ),
        .O(operand_a_set_reg06_out[30]));
  LUT5 #(
    .INIT(32'h00000004)) 
    \operand_a_set[31]_i_1 
       (.I0(waddr[5]),
        .I1(\operand_a_set[31]_i_3_n_0 ),
        .I2(waddr[2]),
        .I3(waddr[4]),
        .I4(waddr[3]),
        .O(\operand_a_set[31]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \operand_a_set[31]_i_2 
       (.I0(s_axi_control_WDATA[31]),
        .I1(s_axi_control_WSTRB[3]),
        .I2(\operand_a_set_reg_n_0_[31] ),
        .O(operand_a_set_reg06_out[31]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \operand_a_set[31]_i_3 
       (.I0(waddr[6]),
        .I1(\FSM_onehot_wstate_reg[2]_0 ),
        .I2(s_axi_control_WVALID),
        .O(\operand_a_set[31]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair35" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \operand_a_set[32]_i_1 
       (.I0(s_axi_control_WDATA[0]),
        .I1(s_axi_control_WSTRB[0]),
        .I2(p_1_in3_in[0]),
        .O(operand_a_set_reg0[0]));
  (* SOFT_HLUTNM = "soft_lutpair34" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \operand_a_set[33]_i_1 
       (.I0(s_axi_control_WDATA[1]),
        .I1(s_axi_control_WSTRB[0]),
        .I2(p_1_in3_in[1]),
        .O(operand_a_set_reg0[1]));
  (* SOFT_HLUTNM = "soft_lutpair33" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \operand_a_set[34]_i_1 
       (.I0(s_axi_control_WDATA[2]),
        .I1(s_axi_control_WSTRB[0]),
        .I2(p_1_in3_in[2]),
        .O(operand_a_set_reg0[2]));
  (* SOFT_HLUTNM = "soft_lutpair32" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \operand_a_set[35]_i_1 
       (.I0(s_axi_control_WDATA[3]),
        .I1(s_axi_control_WSTRB[0]),
        .I2(p_1_in3_in[3]),
        .O(operand_a_set_reg0[3]));
  (* SOFT_HLUTNM = "soft_lutpair31" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \operand_a_set[36]_i_1 
       (.I0(s_axi_control_WDATA[4]),
        .I1(s_axi_control_WSTRB[0]),
        .I2(p_1_in3_in[4]),
        .O(operand_a_set_reg0[4]));
  (* SOFT_HLUTNM = "soft_lutpair30" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \operand_a_set[37]_i_1 
       (.I0(s_axi_control_WDATA[5]),
        .I1(s_axi_control_WSTRB[0]),
        .I2(p_1_in3_in[5]),
        .O(operand_a_set_reg0[5]));
  (* SOFT_HLUTNM = "soft_lutpair29" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \operand_a_set[38]_i_1 
       (.I0(s_axi_control_WDATA[6]),
        .I1(s_axi_control_WSTRB[0]),
        .I2(p_1_in3_in[6]),
        .O(operand_a_set_reg0[6]));
  (* SOFT_HLUTNM = "soft_lutpair28" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \operand_a_set[39]_i_1 
       (.I0(s_axi_control_WDATA[7]),
        .I1(s_axi_control_WSTRB[0]),
        .I2(p_1_in3_in[7]),
        .O(operand_a_set_reg0[7]));
  (* SOFT_HLUTNM = "soft_lutpair32" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \operand_a_set[3]_i_1 
       (.I0(s_axi_control_WDATA[3]),
        .I1(s_axi_control_WSTRB[0]),
        .I2(\operand_a_set_reg_n_0_[3] ),
        .O(operand_a_set_reg06_out[3]));
  (* SOFT_HLUTNM = "soft_lutpair27" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \operand_a_set[40]_i_1 
       (.I0(s_axi_control_WDATA[8]),
        .I1(s_axi_control_WSTRB[1]),
        .I2(p_1_in3_in[8]),
        .O(operand_a_set_reg0[8]));
  (* SOFT_HLUTNM = "soft_lutpair26" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \operand_a_set[41]_i_1 
       (.I0(s_axi_control_WDATA[9]),
        .I1(s_axi_control_WSTRB[1]),
        .I2(p_1_in3_in[9]),
        .O(operand_a_set_reg0[9]));
  (* SOFT_HLUTNM = "soft_lutpair25" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \operand_a_set[42]_i_1 
       (.I0(s_axi_control_WDATA[10]),
        .I1(s_axi_control_WSTRB[1]),
        .I2(p_1_in3_in[10]),
        .O(operand_a_set_reg0[10]));
  (* SOFT_HLUTNM = "soft_lutpair24" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \operand_a_set[43]_i_1 
       (.I0(s_axi_control_WDATA[11]),
        .I1(s_axi_control_WSTRB[1]),
        .I2(p_1_in3_in[11]),
        .O(operand_a_set_reg0[11]));
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \operand_a_set[44]_i_1 
       (.I0(s_axi_control_WDATA[12]),
        .I1(s_axi_control_WSTRB[1]),
        .I2(p_1_in3_in[12]),
        .O(operand_a_set_reg0[12]));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \operand_a_set[45]_i_1 
       (.I0(s_axi_control_WDATA[13]),
        .I1(s_axi_control_WSTRB[1]),
        .I2(p_1_in3_in[13]),
        .O(operand_a_set_reg0[13]));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \operand_a_set[46]_i_1 
       (.I0(s_axi_control_WDATA[14]),
        .I1(s_axi_control_WSTRB[1]),
        .I2(p_1_in3_in[14]),
        .O(operand_a_set_reg0[14]));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \operand_a_set[47]_i_1 
       (.I0(s_axi_control_WDATA[15]),
        .I1(s_axi_control_WSTRB[1]),
        .I2(p_1_in3_in[15]),
        .O(operand_a_set_reg0[15]));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \operand_a_set[48]_i_1 
       (.I0(s_axi_control_WDATA[16]),
        .I1(s_axi_control_WSTRB[2]),
        .I2(p_1_in3_in[16]),
        .O(operand_a_set_reg0[16]));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \operand_a_set[49]_i_1 
       (.I0(s_axi_control_WDATA[17]),
        .I1(s_axi_control_WSTRB[2]),
        .I2(p_1_in3_in[17]),
        .O(operand_a_set_reg0[17]));
  (* SOFT_HLUTNM = "soft_lutpair31" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \operand_a_set[4]_i_1 
       (.I0(s_axi_control_WDATA[4]),
        .I1(s_axi_control_WSTRB[0]),
        .I2(\operand_a_set_reg_n_0_[4] ),
        .O(operand_a_set_reg06_out[4]));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \operand_a_set[50]_i_1 
       (.I0(s_axi_control_WDATA[18]),
        .I1(s_axi_control_WSTRB[2]),
        .I2(p_1_in3_in[18]),
        .O(operand_a_set_reg0[18]));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \operand_a_set[51]_i_1 
       (.I0(s_axi_control_WDATA[19]),
        .I1(s_axi_control_WSTRB[2]),
        .I2(p_1_in3_in[19]),
        .O(operand_a_set_reg0[19]));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \operand_a_set[52]_i_1 
       (.I0(s_axi_control_WDATA[20]),
        .I1(s_axi_control_WSTRB[2]),
        .I2(p_1_in3_in[20]),
        .O(operand_a_set_reg0[20]));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \operand_a_set[53]_i_1 
       (.I0(s_axi_control_WDATA[21]),
        .I1(s_axi_control_WSTRB[2]),
        .I2(p_1_in3_in[21]),
        .O(operand_a_set_reg0[21]));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \operand_a_set[54]_i_1 
       (.I0(s_axi_control_WDATA[22]),
        .I1(s_axi_control_WSTRB[2]),
        .I2(p_1_in3_in[22]),
        .O(operand_a_set_reg0[22]));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \operand_a_set[55]_i_1 
       (.I0(s_axi_control_WDATA[23]),
        .I1(s_axi_control_WSTRB[2]),
        .I2(p_1_in3_in[23]),
        .O(operand_a_set_reg0[23]));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \operand_a_set[56]_i_1 
       (.I0(s_axi_control_WDATA[24]),
        .I1(s_axi_control_WSTRB[3]),
        .I2(p_1_in3_in[24]),
        .O(operand_a_set_reg0[24]));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \operand_a_set[57]_i_1 
       (.I0(s_axi_control_WDATA[25]),
        .I1(s_axi_control_WSTRB[3]),
        .I2(p_1_in3_in[25]),
        .O(operand_a_set_reg0[25]));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \operand_a_set[58]_i_1 
       (.I0(s_axi_control_WDATA[26]),
        .I1(s_axi_control_WSTRB[3]),
        .I2(p_1_in3_in[26]),
        .O(operand_a_set_reg0[26]));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \operand_a_set[59]_i_1 
       (.I0(s_axi_control_WDATA[27]),
        .I1(s_axi_control_WSTRB[3]),
        .I2(p_1_in3_in[27]),
        .O(operand_a_set_reg0[27]));
  (* SOFT_HLUTNM = "soft_lutpair30" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \operand_a_set[5]_i_1 
       (.I0(s_axi_control_WDATA[5]),
        .I1(s_axi_control_WSTRB[0]),
        .I2(\operand_a_set_reg_n_0_[5] ),
        .O(operand_a_set_reg06_out[5]));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \operand_a_set[60]_i_1 
       (.I0(s_axi_control_WDATA[28]),
        .I1(s_axi_control_WSTRB[3]),
        .I2(p_1_in3_in[28]),
        .O(operand_a_set_reg0[28]));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \operand_a_set[61]_i_1 
       (.I0(s_axi_control_WDATA[29]),
        .I1(s_axi_control_WSTRB[3]),
        .I2(p_1_in3_in[29]),
        .O(operand_a_set_reg0[29]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \operand_a_set[62]_i_1 
       (.I0(s_axi_control_WDATA[30]),
        .I1(s_axi_control_WSTRB[3]),
        .I2(p_1_in3_in[30]),
        .O(operand_a_set_reg0[30]));
  LUT5 #(
    .INIT(32'h00001000)) 
    \operand_a_set[63]_i_1 
       (.I0(waddr[4]),
        .I1(waddr[5]),
        .I2(waddr[2]),
        .I3(\operand_a_set[31]_i_3_n_0 ),
        .I4(waddr[3]),
        .O(\operand_a_set[63]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \operand_a_set[63]_i_2 
       (.I0(s_axi_control_WDATA[31]),
        .I1(s_axi_control_WSTRB[3]),
        .I2(p_1_in3_in[31]),
        .O(operand_a_set_reg0[31]));
  (* SOFT_HLUTNM = "soft_lutpair29" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \operand_a_set[6]_i_1 
       (.I0(s_axi_control_WDATA[6]),
        .I1(s_axi_control_WSTRB[0]),
        .I2(\operand_a_set_reg_n_0_[6] ),
        .O(operand_a_set_reg06_out[6]));
  (* SOFT_HLUTNM = "soft_lutpair28" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \operand_a_set[7]_i_1 
       (.I0(s_axi_control_WDATA[7]),
        .I1(s_axi_control_WSTRB[0]),
        .I2(\operand_a_set_reg_n_0_[7] ),
        .O(operand_a_set_reg06_out[7]));
  (* SOFT_HLUTNM = "soft_lutpair27" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \operand_a_set[8]_i_1 
       (.I0(s_axi_control_WDATA[8]),
        .I1(s_axi_control_WSTRB[1]),
        .I2(\operand_a_set_reg_n_0_[8] ),
        .O(operand_a_set_reg06_out[8]));
  (* SOFT_HLUTNM = "soft_lutpair26" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \operand_a_set[9]_i_1 
       (.I0(s_axi_control_WDATA[9]),
        .I1(s_axi_control_WSTRB[1]),
        .I2(\operand_a_set_reg_n_0_[9] ),
        .O(operand_a_set_reg06_out[9]));
  FDRE #(
    .INIT(1'b0)) 
    \operand_a_set_reg[0] 
       (.C(ap_clk),
        .CE(\operand_a_set[31]_i_1_n_0 ),
        .D(operand_a_set_reg06_out[0]),
        .Q(\operand_a_set_reg_n_0_[0] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \operand_a_set_reg[10] 
       (.C(ap_clk),
        .CE(\operand_a_set[31]_i_1_n_0 ),
        .D(operand_a_set_reg06_out[10]),
        .Q(\operand_a_set_reg_n_0_[10] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \operand_a_set_reg[11] 
       (.C(ap_clk),
        .CE(\operand_a_set[31]_i_1_n_0 ),
        .D(operand_a_set_reg06_out[11]),
        .Q(\operand_a_set_reg_n_0_[11] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \operand_a_set_reg[12] 
       (.C(ap_clk),
        .CE(\operand_a_set[31]_i_1_n_0 ),
        .D(operand_a_set_reg06_out[12]),
        .Q(\operand_a_set_reg_n_0_[12] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \operand_a_set_reg[13] 
       (.C(ap_clk),
        .CE(\operand_a_set[31]_i_1_n_0 ),
        .D(operand_a_set_reg06_out[13]),
        .Q(\operand_a_set_reg_n_0_[13] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \operand_a_set_reg[14] 
       (.C(ap_clk),
        .CE(\operand_a_set[31]_i_1_n_0 ),
        .D(operand_a_set_reg06_out[14]),
        .Q(\operand_a_set_reg_n_0_[14] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \operand_a_set_reg[15] 
       (.C(ap_clk),
        .CE(\operand_a_set[31]_i_1_n_0 ),
        .D(operand_a_set_reg06_out[15]),
        .Q(\operand_a_set_reg_n_0_[15] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \operand_a_set_reg[16] 
       (.C(ap_clk),
        .CE(\operand_a_set[31]_i_1_n_0 ),
        .D(operand_a_set_reg06_out[16]),
        .Q(\operand_a_set_reg_n_0_[16] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \operand_a_set_reg[17] 
       (.C(ap_clk),
        .CE(\operand_a_set[31]_i_1_n_0 ),
        .D(operand_a_set_reg06_out[17]),
        .Q(\operand_a_set_reg_n_0_[17] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \operand_a_set_reg[18] 
       (.C(ap_clk),
        .CE(\operand_a_set[31]_i_1_n_0 ),
        .D(operand_a_set_reg06_out[18]),
        .Q(\operand_a_set_reg_n_0_[18] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \operand_a_set_reg[19] 
       (.C(ap_clk),
        .CE(\operand_a_set[31]_i_1_n_0 ),
        .D(operand_a_set_reg06_out[19]),
        .Q(\operand_a_set_reg_n_0_[19] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \operand_a_set_reg[1] 
       (.C(ap_clk),
        .CE(\operand_a_set[31]_i_1_n_0 ),
        .D(operand_a_set_reg06_out[1]),
        .Q(\operand_a_set_reg_n_0_[1] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \operand_a_set_reg[20] 
       (.C(ap_clk),
        .CE(\operand_a_set[31]_i_1_n_0 ),
        .D(operand_a_set_reg06_out[20]),
        .Q(\operand_a_set_reg_n_0_[20] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \operand_a_set_reg[21] 
       (.C(ap_clk),
        .CE(\operand_a_set[31]_i_1_n_0 ),
        .D(operand_a_set_reg06_out[21]),
        .Q(\operand_a_set_reg_n_0_[21] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \operand_a_set_reg[22] 
       (.C(ap_clk),
        .CE(\operand_a_set[31]_i_1_n_0 ),
        .D(operand_a_set_reg06_out[22]),
        .Q(\operand_a_set_reg_n_0_[22] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \operand_a_set_reg[23] 
       (.C(ap_clk),
        .CE(\operand_a_set[31]_i_1_n_0 ),
        .D(operand_a_set_reg06_out[23]),
        .Q(\operand_a_set_reg_n_0_[23] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \operand_a_set_reg[24] 
       (.C(ap_clk),
        .CE(\operand_a_set[31]_i_1_n_0 ),
        .D(operand_a_set_reg06_out[24]),
        .Q(\operand_a_set_reg_n_0_[24] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \operand_a_set_reg[25] 
       (.C(ap_clk),
        .CE(\operand_a_set[31]_i_1_n_0 ),
        .D(operand_a_set_reg06_out[25]),
        .Q(\operand_a_set_reg_n_0_[25] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \operand_a_set_reg[26] 
       (.C(ap_clk),
        .CE(\operand_a_set[31]_i_1_n_0 ),
        .D(operand_a_set_reg06_out[26]),
        .Q(\operand_a_set_reg_n_0_[26] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \operand_a_set_reg[27] 
       (.C(ap_clk),
        .CE(\operand_a_set[31]_i_1_n_0 ),
        .D(operand_a_set_reg06_out[27]),
        .Q(\operand_a_set_reg_n_0_[27] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \operand_a_set_reg[28] 
       (.C(ap_clk),
        .CE(\operand_a_set[31]_i_1_n_0 ),
        .D(operand_a_set_reg06_out[28]),
        .Q(\operand_a_set_reg_n_0_[28] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \operand_a_set_reg[29] 
       (.C(ap_clk),
        .CE(\operand_a_set[31]_i_1_n_0 ),
        .D(operand_a_set_reg06_out[29]),
        .Q(\operand_a_set_reg_n_0_[29] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \operand_a_set_reg[2] 
       (.C(ap_clk),
        .CE(\operand_a_set[31]_i_1_n_0 ),
        .D(operand_a_set_reg06_out[2]),
        .Q(\operand_a_set_reg_n_0_[2] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \operand_a_set_reg[30] 
       (.C(ap_clk),
        .CE(\operand_a_set[31]_i_1_n_0 ),
        .D(operand_a_set_reg06_out[30]),
        .Q(\operand_a_set_reg_n_0_[30] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \operand_a_set_reg[31] 
       (.C(ap_clk),
        .CE(\operand_a_set[31]_i_1_n_0 ),
        .D(operand_a_set_reg06_out[31]),
        .Q(\operand_a_set_reg_n_0_[31] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \operand_a_set_reg[32] 
       (.C(ap_clk),
        .CE(\operand_a_set[63]_i_1_n_0 ),
        .D(operand_a_set_reg0[0]),
        .Q(p_1_in3_in[0]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \operand_a_set_reg[33] 
       (.C(ap_clk),
        .CE(\operand_a_set[63]_i_1_n_0 ),
        .D(operand_a_set_reg0[1]),
        .Q(p_1_in3_in[1]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \operand_a_set_reg[34] 
       (.C(ap_clk),
        .CE(\operand_a_set[63]_i_1_n_0 ),
        .D(operand_a_set_reg0[2]),
        .Q(p_1_in3_in[2]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \operand_a_set_reg[35] 
       (.C(ap_clk),
        .CE(\operand_a_set[63]_i_1_n_0 ),
        .D(operand_a_set_reg0[3]),
        .Q(p_1_in3_in[3]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \operand_a_set_reg[36] 
       (.C(ap_clk),
        .CE(\operand_a_set[63]_i_1_n_0 ),
        .D(operand_a_set_reg0[4]),
        .Q(p_1_in3_in[4]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \operand_a_set_reg[37] 
       (.C(ap_clk),
        .CE(\operand_a_set[63]_i_1_n_0 ),
        .D(operand_a_set_reg0[5]),
        .Q(p_1_in3_in[5]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \operand_a_set_reg[38] 
       (.C(ap_clk),
        .CE(\operand_a_set[63]_i_1_n_0 ),
        .D(operand_a_set_reg0[6]),
        .Q(p_1_in3_in[6]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \operand_a_set_reg[39] 
       (.C(ap_clk),
        .CE(\operand_a_set[63]_i_1_n_0 ),
        .D(operand_a_set_reg0[7]),
        .Q(p_1_in3_in[7]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \operand_a_set_reg[3] 
       (.C(ap_clk),
        .CE(\operand_a_set[31]_i_1_n_0 ),
        .D(operand_a_set_reg06_out[3]),
        .Q(\operand_a_set_reg_n_0_[3] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \operand_a_set_reg[40] 
       (.C(ap_clk),
        .CE(\operand_a_set[63]_i_1_n_0 ),
        .D(operand_a_set_reg0[8]),
        .Q(p_1_in3_in[8]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \operand_a_set_reg[41] 
       (.C(ap_clk),
        .CE(\operand_a_set[63]_i_1_n_0 ),
        .D(operand_a_set_reg0[9]),
        .Q(p_1_in3_in[9]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \operand_a_set_reg[42] 
       (.C(ap_clk),
        .CE(\operand_a_set[63]_i_1_n_0 ),
        .D(operand_a_set_reg0[10]),
        .Q(p_1_in3_in[10]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \operand_a_set_reg[43] 
       (.C(ap_clk),
        .CE(\operand_a_set[63]_i_1_n_0 ),
        .D(operand_a_set_reg0[11]),
        .Q(p_1_in3_in[11]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \operand_a_set_reg[44] 
       (.C(ap_clk),
        .CE(\operand_a_set[63]_i_1_n_0 ),
        .D(operand_a_set_reg0[12]),
        .Q(p_1_in3_in[12]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \operand_a_set_reg[45] 
       (.C(ap_clk),
        .CE(\operand_a_set[63]_i_1_n_0 ),
        .D(operand_a_set_reg0[13]),
        .Q(p_1_in3_in[13]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \operand_a_set_reg[46] 
       (.C(ap_clk),
        .CE(\operand_a_set[63]_i_1_n_0 ),
        .D(operand_a_set_reg0[14]),
        .Q(p_1_in3_in[14]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \operand_a_set_reg[47] 
       (.C(ap_clk),
        .CE(\operand_a_set[63]_i_1_n_0 ),
        .D(operand_a_set_reg0[15]),
        .Q(p_1_in3_in[15]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \operand_a_set_reg[48] 
       (.C(ap_clk),
        .CE(\operand_a_set[63]_i_1_n_0 ),
        .D(operand_a_set_reg0[16]),
        .Q(p_1_in3_in[16]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \operand_a_set_reg[49] 
       (.C(ap_clk),
        .CE(\operand_a_set[63]_i_1_n_0 ),
        .D(operand_a_set_reg0[17]),
        .Q(p_1_in3_in[17]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \operand_a_set_reg[4] 
       (.C(ap_clk),
        .CE(\operand_a_set[31]_i_1_n_0 ),
        .D(operand_a_set_reg06_out[4]),
        .Q(\operand_a_set_reg_n_0_[4] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \operand_a_set_reg[50] 
       (.C(ap_clk),
        .CE(\operand_a_set[63]_i_1_n_0 ),
        .D(operand_a_set_reg0[18]),
        .Q(p_1_in3_in[18]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \operand_a_set_reg[51] 
       (.C(ap_clk),
        .CE(\operand_a_set[63]_i_1_n_0 ),
        .D(operand_a_set_reg0[19]),
        .Q(p_1_in3_in[19]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \operand_a_set_reg[52] 
       (.C(ap_clk),
        .CE(\operand_a_set[63]_i_1_n_0 ),
        .D(operand_a_set_reg0[20]),
        .Q(p_1_in3_in[20]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \operand_a_set_reg[53] 
       (.C(ap_clk),
        .CE(\operand_a_set[63]_i_1_n_0 ),
        .D(operand_a_set_reg0[21]),
        .Q(p_1_in3_in[21]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \operand_a_set_reg[54] 
       (.C(ap_clk),
        .CE(\operand_a_set[63]_i_1_n_0 ),
        .D(operand_a_set_reg0[22]),
        .Q(p_1_in3_in[22]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \operand_a_set_reg[55] 
       (.C(ap_clk),
        .CE(\operand_a_set[63]_i_1_n_0 ),
        .D(operand_a_set_reg0[23]),
        .Q(p_1_in3_in[23]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \operand_a_set_reg[56] 
       (.C(ap_clk),
        .CE(\operand_a_set[63]_i_1_n_0 ),
        .D(operand_a_set_reg0[24]),
        .Q(p_1_in3_in[24]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \operand_a_set_reg[57] 
       (.C(ap_clk),
        .CE(\operand_a_set[63]_i_1_n_0 ),
        .D(operand_a_set_reg0[25]),
        .Q(p_1_in3_in[25]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \operand_a_set_reg[58] 
       (.C(ap_clk),
        .CE(\operand_a_set[63]_i_1_n_0 ),
        .D(operand_a_set_reg0[26]),
        .Q(p_1_in3_in[26]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \operand_a_set_reg[59] 
       (.C(ap_clk),
        .CE(\operand_a_set[63]_i_1_n_0 ),
        .D(operand_a_set_reg0[27]),
        .Q(p_1_in3_in[27]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \operand_a_set_reg[5] 
       (.C(ap_clk),
        .CE(\operand_a_set[31]_i_1_n_0 ),
        .D(operand_a_set_reg06_out[5]),
        .Q(\operand_a_set_reg_n_0_[5] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \operand_a_set_reg[60] 
       (.C(ap_clk),
        .CE(\operand_a_set[63]_i_1_n_0 ),
        .D(operand_a_set_reg0[28]),
        .Q(p_1_in3_in[28]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \operand_a_set_reg[61] 
       (.C(ap_clk),
        .CE(\operand_a_set[63]_i_1_n_0 ),
        .D(operand_a_set_reg0[29]),
        .Q(p_1_in3_in[29]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \operand_a_set_reg[62] 
       (.C(ap_clk),
        .CE(\operand_a_set[63]_i_1_n_0 ),
        .D(operand_a_set_reg0[30]),
        .Q(p_1_in3_in[30]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \operand_a_set_reg[63] 
       (.C(ap_clk),
        .CE(\operand_a_set[63]_i_1_n_0 ),
        .D(operand_a_set_reg0[31]),
        .Q(p_1_in3_in[31]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \operand_a_set_reg[6] 
       (.C(ap_clk),
        .CE(\operand_a_set[31]_i_1_n_0 ),
        .D(operand_a_set_reg06_out[6]),
        .Q(\operand_a_set_reg_n_0_[6] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \operand_a_set_reg[7] 
       (.C(ap_clk),
        .CE(\operand_a_set[31]_i_1_n_0 ),
        .D(operand_a_set_reg06_out[7]),
        .Q(\operand_a_set_reg_n_0_[7] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \operand_a_set_reg[8] 
       (.C(ap_clk),
        .CE(\operand_a_set[31]_i_1_n_0 ),
        .D(operand_a_set_reg06_out[8]),
        .Q(\operand_a_set_reg_n_0_[8] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \operand_a_set_reg[9] 
       (.C(ap_clk),
        .CE(\operand_a_set[31]_i_1_n_0 ),
        .D(operand_a_set_reg06_out[9]),
        .Q(\operand_a_set_reg_n_0_[9] ),
        .R(SR));
  (* SOFT_HLUTNM = "soft_lutpair67" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \operand_b_set[0]_i_1 
       (.I0(s_axi_control_WDATA[0]),
        .I1(s_axi_control_WSTRB[0]),
        .I2(\operand_b_set_reg_n_0_[0] ),
        .O(operand_b_set_reg03_out[0]));
  (* SOFT_HLUTNM = "soft_lutpair57" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \operand_b_set[10]_i_1 
       (.I0(s_axi_control_WDATA[10]),
        .I1(s_axi_control_WSTRB[1]),
        .I2(\operand_b_set_reg_n_0_[10] ),
        .O(operand_b_set_reg03_out[10]));
  (* SOFT_HLUTNM = "soft_lutpair56" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \operand_b_set[11]_i_1 
       (.I0(s_axi_control_WDATA[11]),
        .I1(s_axi_control_WSTRB[1]),
        .I2(\operand_b_set_reg_n_0_[11] ),
        .O(operand_b_set_reg03_out[11]));
  (* SOFT_HLUTNM = "soft_lutpair55" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \operand_b_set[12]_i_1 
       (.I0(s_axi_control_WDATA[12]),
        .I1(s_axi_control_WSTRB[1]),
        .I2(\operand_b_set_reg_n_0_[12] ),
        .O(operand_b_set_reg03_out[12]));
  (* SOFT_HLUTNM = "soft_lutpair54" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \operand_b_set[13]_i_1 
       (.I0(s_axi_control_WDATA[13]),
        .I1(s_axi_control_WSTRB[1]),
        .I2(\operand_b_set_reg_n_0_[13] ),
        .O(operand_b_set_reg03_out[13]));
  (* SOFT_HLUTNM = "soft_lutpair53" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \operand_b_set[14]_i_1 
       (.I0(s_axi_control_WDATA[14]),
        .I1(s_axi_control_WSTRB[1]),
        .I2(\operand_b_set_reg_n_0_[14] ),
        .O(operand_b_set_reg03_out[14]));
  (* SOFT_HLUTNM = "soft_lutpair52" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \operand_b_set[15]_i_1 
       (.I0(s_axi_control_WDATA[15]),
        .I1(s_axi_control_WSTRB[1]),
        .I2(\operand_b_set_reg_n_0_[15] ),
        .O(operand_b_set_reg03_out[15]));
  (* SOFT_HLUTNM = "soft_lutpair51" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \operand_b_set[16]_i_1 
       (.I0(s_axi_control_WDATA[16]),
        .I1(s_axi_control_WSTRB[2]),
        .I2(\operand_b_set_reg_n_0_[16] ),
        .O(operand_b_set_reg03_out[16]));
  (* SOFT_HLUTNM = "soft_lutpair50" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \operand_b_set[17]_i_1 
       (.I0(s_axi_control_WDATA[17]),
        .I1(s_axi_control_WSTRB[2]),
        .I2(\operand_b_set_reg_n_0_[17] ),
        .O(operand_b_set_reg03_out[17]));
  (* SOFT_HLUTNM = "soft_lutpair49" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \operand_b_set[18]_i_1 
       (.I0(s_axi_control_WDATA[18]),
        .I1(s_axi_control_WSTRB[2]),
        .I2(\operand_b_set_reg_n_0_[18] ),
        .O(operand_b_set_reg03_out[18]));
  (* SOFT_HLUTNM = "soft_lutpair48" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \operand_b_set[19]_i_1 
       (.I0(s_axi_control_WDATA[19]),
        .I1(s_axi_control_WSTRB[2]),
        .I2(\operand_b_set_reg_n_0_[19] ),
        .O(operand_b_set_reg03_out[19]));
  (* SOFT_HLUTNM = "soft_lutpair66" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \operand_b_set[1]_i_1 
       (.I0(s_axi_control_WDATA[1]),
        .I1(s_axi_control_WSTRB[0]),
        .I2(\operand_b_set_reg_n_0_[1] ),
        .O(operand_b_set_reg03_out[1]));
  (* SOFT_HLUTNM = "soft_lutpair47" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \operand_b_set[20]_i_1 
       (.I0(s_axi_control_WDATA[20]),
        .I1(s_axi_control_WSTRB[2]),
        .I2(\operand_b_set_reg_n_0_[20] ),
        .O(operand_b_set_reg03_out[20]));
  (* SOFT_HLUTNM = "soft_lutpair46" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \operand_b_set[21]_i_1 
       (.I0(s_axi_control_WDATA[21]),
        .I1(s_axi_control_WSTRB[2]),
        .I2(\operand_b_set_reg_n_0_[21] ),
        .O(operand_b_set_reg03_out[21]));
  (* SOFT_HLUTNM = "soft_lutpair45" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \operand_b_set[22]_i_1 
       (.I0(s_axi_control_WDATA[22]),
        .I1(s_axi_control_WSTRB[2]),
        .I2(\operand_b_set_reg_n_0_[22] ),
        .O(operand_b_set_reg03_out[22]));
  (* SOFT_HLUTNM = "soft_lutpair44" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \operand_b_set[23]_i_1 
       (.I0(s_axi_control_WDATA[23]),
        .I1(s_axi_control_WSTRB[2]),
        .I2(\operand_b_set_reg_n_0_[23] ),
        .O(operand_b_set_reg03_out[23]));
  (* SOFT_HLUTNM = "soft_lutpair43" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \operand_b_set[24]_i_1 
       (.I0(s_axi_control_WDATA[24]),
        .I1(s_axi_control_WSTRB[3]),
        .I2(\operand_b_set_reg_n_0_[24] ),
        .O(operand_b_set_reg03_out[24]));
  (* SOFT_HLUTNM = "soft_lutpair42" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \operand_b_set[25]_i_1 
       (.I0(s_axi_control_WDATA[25]),
        .I1(s_axi_control_WSTRB[3]),
        .I2(\operand_b_set_reg_n_0_[25] ),
        .O(operand_b_set_reg03_out[25]));
  (* SOFT_HLUTNM = "soft_lutpair41" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \operand_b_set[26]_i_1 
       (.I0(s_axi_control_WDATA[26]),
        .I1(s_axi_control_WSTRB[3]),
        .I2(\operand_b_set_reg_n_0_[26] ),
        .O(operand_b_set_reg03_out[26]));
  (* SOFT_HLUTNM = "soft_lutpair40" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \operand_b_set[27]_i_1 
       (.I0(s_axi_control_WDATA[27]),
        .I1(s_axi_control_WSTRB[3]),
        .I2(\operand_b_set_reg_n_0_[27] ),
        .O(operand_b_set_reg03_out[27]));
  (* SOFT_HLUTNM = "soft_lutpair39" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \operand_b_set[28]_i_1 
       (.I0(s_axi_control_WDATA[28]),
        .I1(s_axi_control_WSTRB[3]),
        .I2(\operand_b_set_reg_n_0_[28] ),
        .O(operand_b_set_reg03_out[28]));
  (* SOFT_HLUTNM = "soft_lutpair38" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \operand_b_set[29]_i_1 
       (.I0(s_axi_control_WDATA[29]),
        .I1(s_axi_control_WSTRB[3]),
        .I2(\operand_b_set_reg_n_0_[29] ),
        .O(operand_b_set_reg03_out[29]));
  (* SOFT_HLUTNM = "soft_lutpair65" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \operand_b_set[2]_i_1 
       (.I0(s_axi_control_WDATA[2]),
        .I1(s_axi_control_WSTRB[0]),
        .I2(\operand_b_set_reg_n_0_[2] ),
        .O(operand_b_set_reg03_out[2]));
  (* SOFT_HLUTNM = "soft_lutpair37" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \operand_b_set[30]_i_1 
       (.I0(s_axi_control_WDATA[30]),
        .I1(s_axi_control_WSTRB[3]),
        .I2(\operand_b_set_reg_n_0_[30] ),
        .O(operand_b_set_reg03_out[30]));
  LUT5 #(
    .INIT(32'h00000080)) 
    \operand_b_set[31]_i_1 
       (.I0(waddr[3]),
        .I1(\operand_a_set[31]_i_3_n_0 ),
        .I2(waddr[2]),
        .I3(waddr[5]),
        .I4(waddr[4]),
        .O(\operand_b_set[31]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair36" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \operand_b_set[31]_i_2 
       (.I0(s_axi_control_WDATA[31]),
        .I1(s_axi_control_WSTRB[3]),
        .I2(\operand_b_set_reg_n_0_[31] ),
        .O(operand_b_set_reg03_out[31]));
  (* SOFT_HLUTNM = "soft_lutpair67" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \operand_b_set[32]_i_1 
       (.I0(s_axi_control_WDATA[0]),
        .I1(s_axi_control_WSTRB[0]),
        .I2(p_1_in1_in[0]),
        .O(operand_b_set_reg0[0]));
  (* SOFT_HLUTNM = "soft_lutpair66" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \operand_b_set[33]_i_1 
       (.I0(s_axi_control_WDATA[1]),
        .I1(s_axi_control_WSTRB[0]),
        .I2(p_1_in1_in[1]),
        .O(operand_b_set_reg0[1]));
  (* SOFT_HLUTNM = "soft_lutpair65" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \operand_b_set[34]_i_1 
       (.I0(s_axi_control_WDATA[2]),
        .I1(s_axi_control_WSTRB[0]),
        .I2(p_1_in1_in[2]),
        .O(operand_b_set_reg0[2]));
  (* SOFT_HLUTNM = "soft_lutpair64" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \operand_b_set[35]_i_1 
       (.I0(s_axi_control_WDATA[3]),
        .I1(s_axi_control_WSTRB[0]),
        .I2(p_1_in1_in[3]),
        .O(operand_b_set_reg0[3]));
  (* SOFT_HLUTNM = "soft_lutpair63" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \operand_b_set[36]_i_1 
       (.I0(s_axi_control_WDATA[4]),
        .I1(s_axi_control_WSTRB[0]),
        .I2(p_1_in1_in[4]),
        .O(operand_b_set_reg0[4]));
  (* SOFT_HLUTNM = "soft_lutpair62" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \operand_b_set[37]_i_1 
       (.I0(s_axi_control_WDATA[5]),
        .I1(s_axi_control_WSTRB[0]),
        .I2(p_1_in1_in[5]),
        .O(operand_b_set_reg0[5]));
  (* SOFT_HLUTNM = "soft_lutpair61" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \operand_b_set[38]_i_1 
       (.I0(s_axi_control_WDATA[6]),
        .I1(s_axi_control_WSTRB[0]),
        .I2(p_1_in1_in[6]),
        .O(operand_b_set_reg0[6]));
  (* SOFT_HLUTNM = "soft_lutpair60" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \operand_b_set[39]_i_1 
       (.I0(s_axi_control_WDATA[7]),
        .I1(s_axi_control_WSTRB[0]),
        .I2(p_1_in1_in[7]),
        .O(operand_b_set_reg0[7]));
  (* SOFT_HLUTNM = "soft_lutpair64" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \operand_b_set[3]_i_1 
       (.I0(s_axi_control_WDATA[3]),
        .I1(s_axi_control_WSTRB[0]),
        .I2(\operand_b_set_reg_n_0_[3] ),
        .O(operand_b_set_reg03_out[3]));
  (* SOFT_HLUTNM = "soft_lutpair59" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \operand_b_set[40]_i_1 
       (.I0(s_axi_control_WDATA[8]),
        .I1(s_axi_control_WSTRB[1]),
        .I2(p_1_in1_in[8]),
        .O(operand_b_set_reg0[8]));
  (* SOFT_HLUTNM = "soft_lutpair58" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \operand_b_set[41]_i_1 
       (.I0(s_axi_control_WDATA[9]),
        .I1(s_axi_control_WSTRB[1]),
        .I2(p_1_in1_in[9]),
        .O(operand_b_set_reg0[9]));
  (* SOFT_HLUTNM = "soft_lutpair57" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \operand_b_set[42]_i_1 
       (.I0(s_axi_control_WDATA[10]),
        .I1(s_axi_control_WSTRB[1]),
        .I2(p_1_in1_in[10]),
        .O(operand_b_set_reg0[10]));
  (* SOFT_HLUTNM = "soft_lutpair56" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \operand_b_set[43]_i_1 
       (.I0(s_axi_control_WDATA[11]),
        .I1(s_axi_control_WSTRB[1]),
        .I2(p_1_in1_in[11]),
        .O(operand_b_set_reg0[11]));
  (* SOFT_HLUTNM = "soft_lutpair55" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \operand_b_set[44]_i_1 
       (.I0(s_axi_control_WDATA[12]),
        .I1(s_axi_control_WSTRB[1]),
        .I2(p_1_in1_in[12]),
        .O(operand_b_set_reg0[12]));
  (* SOFT_HLUTNM = "soft_lutpair54" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \operand_b_set[45]_i_1 
       (.I0(s_axi_control_WDATA[13]),
        .I1(s_axi_control_WSTRB[1]),
        .I2(p_1_in1_in[13]),
        .O(operand_b_set_reg0[13]));
  (* SOFT_HLUTNM = "soft_lutpair53" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \operand_b_set[46]_i_1 
       (.I0(s_axi_control_WDATA[14]),
        .I1(s_axi_control_WSTRB[1]),
        .I2(p_1_in1_in[14]),
        .O(operand_b_set_reg0[14]));
  (* SOFT_HLUTNM = "soft_lutpair52" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \operand_b_set[47]_i_1 
       (.I0(s_axi_control_WDATA[15]),
        .I1(s_axi_control_WSTRB[1]),
        .I2(p_1_in1_in[15]),
        .O(operand_b_set_reg0[15]));
  (* SOFT_HLUTNM = "soft_lutpair51" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \operand_b_set[48]_i_1 
       (.I0(s_axi_control_WDATA[16]),
        .I1(s_axi_control_WSTRB[2]),
        .I2(p_1_in1_in[16]),
        .O(operand_b_set_reg0[16]));
  (* SOFT_HLUTNM = "soft_lutpair50" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \operand_b_set[49]_i_1 
       (.I0(s_axi_control_WDATA[17]),
        .I1(s_axi_control_WSTRB[2]),
        .I2(p_1_in1_in[17]),
        .O(operand_b_set_reg0[17]));
  (* SOFT_HLUTNM = "soft_lutpair63" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \operand_b_set[4]_i_1 
       (.I0(s_axi_control_WDATA[4]),
        .I1(s_axi_control_WSTRB[0]),
        .I2(\operand_b_set_reg_n_0_[4] ),
        .O(operand_b_set_reg03_out[4]));
  (* SOFT_HLUTNM = "soft_lutpair49" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \operand_b_set[50]_i_1 
       (.I0(s_axi_control_WDATA[18]),
        .I1(s_axi_control_WSTRB[2]),
        .I2(p_1_in1_in[18]),
        .O(operand_b_set_reg0[18]));
  (* SOFT_HLUTNM = "soft_lutpair48" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \operand_b_set[51]_i_1 
       (.I0(s_axi_control_WDATA[19]),
        .I1(s_axi_control_WSTRB[2]),
        .I2(p_1_in1_in[19]),
        .O(operand_b_set_reg0[19]));
  (* SOFT_HLUTNM = "soft_lutpair47" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \operand_b_set[52]_i_1 
       (.I0(s_axi_control_WDATA[20]),
        .I1(s_axi_control_WSTRB[2]),
        .I2(p_1_in1_in[20]),
        .O(operand_b_set_reg0[20]));
  (* SOFT_HLUTNM = "soft_lutpair46" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \operand_b_set[53]_i_1 
       (.I0(s_axi_control_WDATA[21]),
        .I1(s_axi_control_WSTRB[2]),
        .I2(p_1_in1_in[21]),
        .O(operand_b_set_reg0[21]));
  (* SOFT_HLUTNM = "soft_lutpair45" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \operand_b_set[54]_i_1 
       (.I0(s_axi_control_WDATA[22]),
        .I1(s_axi_control_WSTRB[2]),
        .I2(p_1_in1_in[22]),
        .O(operand_b_set_reg0[22]));
  (* SOFT_HLUTNM = "soft_lutpair44" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \operand_b_set[55]_i_1 
       (.I0(s_axi_control_WDATA[23]),
        .I1(s_axi_control_WSTRB[2]),
        .I2(p_1_in1_in[23]),
        .O(operand_b_set_reg0[23]));
  (* SOFT_HLUTNM = "soft_lutpair43" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \operand_b_set[56]_i_1 
       (.I0(s_axi_control_WDATA[24]),
        .I1(s_axi_control_WSTRB[3]),
        .I2(p_1_in1_in[24]),
        .O(operand_b_set_reg0[24]));
  (* SOFT_HLUTNM = "soft_lutpair42" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \operand_b_set[57]_i_1 
       (.I0(s_axi_control_WDATA[25]),
        .I1(s_axi_control_WSTRB[3]),
        .I2(p_1_in1_in[25]),
        .O(operand_b_set_reg0[25]));
  (* SOFT_HLUTNM = "soft_lutpair41" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \operand_b_set[58]_i_1 
       (.I0(s_axi_control_WDATA[26]),
        .I1(s_axi_control_WSTRB[3]),
        .I2(p_1_in1_in[26]),
        .O(operand_b_set_reg0[26]));
  (* SOFT_HLUTNM = "soft_lutpair40" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \operand_b_set[59]_i_1 
       (.I0(s_axi_control_WDATA[27]),
        .I1(s_axi_control_WSTRB[3]),
        .I2(p_1_in1_in[27]),
        .O(operand_b_set_reg0[27]));
  (* SOFT_HLUTNM = "soft_lutpair62" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \operand_b_set[5]_i_1 
       (.I0(s_axi_control_WDATA[5]),
        .I1(s_axi_control_WSTRB[0]),
        .I2(\operand_b_set_reg_n_0_[5] ),
        .O(operand_b_set_reg03_out[5]));
  (* SOFT_HLUTNM = "soft_lutpair39" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \operand_b_set[60]_i_1 
       (.I0(s_axi_control_WDATA[28]),
        .I1(s_axi_control_WSTRB[3]),
        .I2(p_1_in1_in[28]),
        .O(operand_b_set_reg0[28]));
  (* SOFT_HLUTNM = "soft_lutpair38" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \operand_b_set[61]_i_1 
       (.I0(s_axi_control_WDATA[29]),
        .I1(s_axi_control_WSTRB[3]),
        .I2(p_1_in1_in[29]),
        .O(operand_b_set_reg0[29]));
  (* SOFT_HLUTNM = "soft_lutpair37" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \operand_b_set[62]_i_1 
       (.I0(s_axi_control_WDATA[30]),
        .I1(s_axi_control_WSTRB[3]),
        .I2(p_1_in1_in[30]),
        .O(operand_b_set_reg0[30]));
  LUT5 #(
    .INIT(32'h00000400)) 
    \operand_b_set[63]_i_1 
       (.I0(waddr[2]),
        .I1(\operand_a_set[31]_i_3_n_0 ),
        .I2(waddr[5]),
        .I3(waddr[4]),
        .I4(waddr[3]),
        .O(\operand_b_set[63]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair36" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \operand_b_set[63]_i_2 
       (.I0(s_axi_control_WDATA[31]),
        .I1(s_axi_control_WSTRB[3]),
        .I2(p_1_in1_in[31]),
        .O(operand_b_set_reg0[31]));
  (* SOFT_HLUTNM = "soft_lutpair61" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \operand_b_set[6]_i_1 
       (.I0(s_axi_control_WDATA[6]),
        .I1(s_axi_control_WSTRB[0]),
        .I2(\operand_b_set_reg_n_0_[6] ),
        .O(operand_b_set_reg03_out[6]));
  (* SOFT_HLUTNM = "soft_lutpair60" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \operand_b_set[7]_i_1 
       (.I0(s_axi_control_WDATA[7]),
        .I1(s_axi_control_WSTRB[0]),
        .I2(\operand_b_set_reg_n_0_[7] ),
        .O(operand_b_set_reg03_out[7]));
  (* SOFT_HLUTNM = "soft_lutpair59" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \operand_b_set[8]_i_1 
       (.I0(s_axi_control_WDATA[8]),
        .I1(s_axi_control_WSTRB[1]),
        .I2(\operand_b_set_reg_n_0_[8] ),
        .O(operand_b_set_reg03_out[8]));
  (* SOFT_HLUTNM = "soft_lutpair58" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \operand_b_set[9]_i_1 
       (.I0(s_axi_control_WDATA[9]),
        .I1(s_axi_control_WSTRB[1]),
        .I2(\operand_b_set_reg_n_0_[9] ),
        .O(operand_b_set_reg03_out[9]));
  FDRE #(
    .INIT(1'b0)) 
    \operand_b_set_reg[0] 
       (.C(ap_clk),
        .CE(\operand_b_set[31]_i_1_n_0 ),
        .D(operand_b_set_reg03_out[0]),
        .Q(\operand_b_set_reg_n_0_[0] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \operand_b_set_reg[10] 
       (.C(ap_clk),
        .CE(\operand_b_set[31]_i_1_n_0 ),
        .D(operand_b_set_reg03_out[10]),
        .Q(\operand_b_set_reg_n_0_[10] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \operand_b_set_reg[11] 
       (.C(ap_clk),
        .CE(\operand_b_set[31]_i_1_n_0 ),
        .D(operand_b_set_reg03_out[11]),
        .Q(\operand_b_set_reg_n_0_[11] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \operand_b_set_reg[12] 
       (.C(ap_clk),
        .CE(\operand_b_set[31]_i_1_n_0 ),
        .D(operand_b_set_reg03_out[12]),
        .Q(\operand_b_set_reg_n_0_[12] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \operand_b_set_reg[13] 
       (.C(ap_clk),
        .CE(\operand_b_set[31]_i_1_n_0 ),
        .D(operand_b_set_reg03_out[13]),
        .Q(\operand_b_set_reg_n_0_[13] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \operand_b_set_reg[14] 
       (.C(ap_clk),
        .CE(\operand_b_set[31]_i_1_n_0 ),
        .D(operand_b_set_reg03_out[14]),
        .Q(\operand_b_set_reg_n_0_[14] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \operand_b_set_reg[15] 
       (.C(ap_clk),
        .CE(\operand_b_set[31]_i_1_n_0 ),
        .D(operand_b_set_reg03_out[15]),
        .Q(\operand_b_set_reg_n_0_[15] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \operand_b_set_reg[16] 
       (.C(ap_clk),
        .CE(\operand_b_set[31]_i_1_n_0 ),
        .D(operand_b_set_reg03_out[16]),
        .Q(\operand_b_set_reg_n_0_[16] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \operand_b_set_reg[17] 
       (.C(ap_clk),
        .CE(\operand_b_set[31]_i_1_n_0 ),
        .D(operand_b_set_reg03_out[17]),
        .Q(\operand_b_set_reg_n_0_[17] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \operand_b_set_reg[18] 
       (.C(ap_clk),
        .CE(\operand_b_set[31]_i_1_n_0 ),
        .D(operand_b_set_reg03_out[18]),
        .Q(\operand_b_set_reg_n_0_[18] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \operand_b_set_reg[19] 
       (.C(ap_clk),
        .CE(\operand_b_set[31]_i_1_n_0 ),
        .D(operand_b_set_reg03_out[19]),
        .Q(\operand_b_set_reg_n_0_[19] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \operand_b_set_reg[1] 
       (.C(ap_clk),
        .CE(\operand_b_set[31]_i_1_n_0 ),
        .D(operand_b_set_reg03_out[1]),
        .Q(\operand_b_set_reg_n_0_[1] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \operand_b_set_reg[20] 
       (.C(ap_clk),
        .CE(\operand_b_set[31]_i_1_n_0 ),
        .D(operand_b_set_reg03_out[20]),
        .Q(\operand_b_set_reg_n_0_[20] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \operand_b_set_reg[21] 
       (.C(ap_clk),
        .CE(\operand_b_set[31]_i_1_n_0 ),
        .D(operand_b_set_reg03_out[21]),
        .Q(\operand_b_set_reg_n_0_[21] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \operand_b_set_reg[22] 
       (.C(ap_clk),
        .CE(\operand_b_set[31]_i_1_n_0 ),
        .D(operand_b_set_reg03_out[22]),
        .Q(\operand_b_set_reg_n_0_[22] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \operand_b_set_reg[23] 
       (.C(ap_clk),
        .CE(\operand_b_set[31]_i_1_n_0 ),
        .D(operand_b_set_reg03_out[23]),
        .Q(\operand_b_set_reg_n_0_[23] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \operand_b_set_reg[24] 
       (.C(ap_clk),
        .CE(\operand_b_set[31]_i_1_n_0 ),
        .D(operand_b_set_reg03_out[24]),
        .Q(\operand_b_set_reg_n_0_[24] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \operand_b_set_reg[25] 
       (.C(ap_clk),
        .CE(\operand_b_set[31]_i_1_n_0 ),
        .D(operand_b_set_reg03_out[25]),
        .Q(\operand_b_set_reg_n_0_[25] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \operand_b_set_reg[26] 
       (.C(ap_clk),
        .CE(\operand_b_set[31]_i_1_n_0 ),
        .D(operand_b_set_reg03_out[26]),
        .Q(\operand_b_set_reg_n_0_[26] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \operand_b_set_reg[27] 
       (.C(ap_clk),
        .CE(\operand_b_set[31]_i_1_n_0 ),
        .D(operand_b_set_reg03_out[27]),
        .Q(\operand_b_set_reg_n_0_[27] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \operand_b_set_reg[28] 
       (.C(ap_clk),
        .CE(\operand_b_set[31]_i_1_n_0 ),
        .D(operand_b_set_reg03_out[28]),
        .Q(\operand_b_set_reg_n_0_[28] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \operand_b_set_reg[29] 
       (.C(ap_clk),
        .CE(\operand_b_set[31]_i_1_n_0 ),
        .D(operand_b_set_reg03_out[29]),
        .Q(\operand_b_set_reg_n_0_[29] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \operand_b_set_reg[2] 
       (.C(ap_clk),
        .CE(\operand_b_set[31]_i_1_n_0 ),
        .D(operand_b_set_reg03_out[2]),
        .Q(\operand_b_set_reg_n_0_[2] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \operand_b_set_reg[30] 
       (.C(ap_clk),
        .CE(\operand_b_set[31]_i_1_n_0 ),
        .D(operand_b_set_reg03_out[30]),
        .Q(\operand_b_set_reg_n_0_[30] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \operand_b_set_reg[31] 
       (.C(ap_clk),
        .CE(\operand_b_set[31]_i_1_n_0 ),
        .D(operand_b_set_reg03_out[31]),
        .Q(\operand_b_set_reg_n_0_[31] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \operand_b_set_reg[32] 
       (.C(ap_clk),
        .CE(\operand_b_set[63]_i_1_n_0 ),
        .D(operand_b_set_reg0[0]),
        .Q(p_1_in1_in[0]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \operand_b_set_reg[33] 
       (.C(ap_clk),
        .CE(\operand_b_set[63]_i_1_n_0 ),
        .D(operand_b_set_reg0[1]),
        .Q(p_1_in1_in[1]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \operand_b_set_reg[34] 
       (.C(ap_clk),
        .CE(\operand_b_set[63]_i_1_n_0 ),
        .D(operand_b_set_reg0[2]),
        .Q(p_1_in1_in[2]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \operand_b_set_reg[35] 
       (.C(ap_clk),
        .CE(\operand_b_set[63]_i_1_n_0 ),
        .D(operand_b_set_reg0[3]),
        .Q(p_1_in1_in[3]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \operand_b_set_reg[36] 
       (.C(ap_clk),
        .CE(\operand_b_set[63]_i_1_n_0 ),
        .D(operand_b_set_reg0[4]),
        .Q(p_1_in1_in[4]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \operand_b_set_reg[37] 
       (.C(ap_clk),
        .CE(\operand_b_set[63]_i_1_n_0 ),
        .D(operand_b_set_reg0[5]),
        .Q(p_1_in1_in[5]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \operand_b_set_reg[38] 
       (.C(ap_clk),
        .CE(\operand_b_set[63]_i_1_n_0 ),
        .D(operand_b_set_reg0[6]),
        .Q(p_1_in1_in[6]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \operand_b_set_reg[39] 
       (.C(ap_clk),
        .CE(\operand_b_set[63]_i_1_n_0 ),
        .D(operand_b_set_reg0[7]),
        .Q(p_1_in1_in[7]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \operand_b_set_reg[3] 
       (.C(ap_clk),
        .CE(\operand_b_set[31]_i_1_n_0 ),
        .D(operand_b_set_reg03_out[3]),
        .Q(\operand_b_set_reg_n_0_[3] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \operand_b_set_reg[40] 
       (.C(ap_clk),
        .CE(\operand_b_set[63]_i_1_n_0 ),
        .D(operand_b_set_reg0[8]),
        .Q(p_1_in1_in[8]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \operand_b_set_reg[41] 
       (.C(ap_clk),
        .CE(\operand_b_set[63]_i_1_n_0 ),
        .D(operand_b_set_reg0[9]),
        .Q(p_1_in1_in[9]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \operand_b_set_reg[42] 
       (.C(ap_clk),
        .CE(\operand_b_set[63]_i_1_n_0 ),
        .D(operand_b_set_reg0[10]),
        .Q(p_1_in1_in[10]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \operand_b_set_reg[43] 
       (.C(ap_clk),
        .CE(\operand_b_set[63]_i_1_n_0 ),
        .D(operand_b_set_reg0[11]),
        .Q(p_1_in1_in[11]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \operand_b_set_reg[44] 
       (.C(ap_clk),
        .CE(\operand_b_set[63]_i_1_n_0 ),
        .D(operand_b_set_reg0[12]),
        .Q(p_1_in1_in[12]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \operand_b_set_reg[45] 
       (.C(ap_clk),
        .CE(\operand_b_set[63]_i_1_n_0 ),
        .D(operand_b_set_reg0[13]),
        .Q(p_1_in1_in[13]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \operand_b_set_reg[46] 
       (.C(ap_clk),
        .CE(\operand_b_set[63]_i_1_n_0 ),
        .D(operand_b_set_reg0[14]),
        .Q(p_1_in1_in[14]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \operand_b_set_reg[47] 
       (.C(ap_clk),
        .CE(\operand_b_set[63]_i_1_n_0 ),
        .D(operand_b_set_reg0[15]),
        .Q(p_1_in1_in[15]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \operand_b_set_reg[48] 
       (.C(ap_clk),
        .CE(\operand_b_set[63]_i_1_n_0 ),
        .D(operand_b_set_reg0[16]),
        .Q(p_1_in1_in[16]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \operand_b_set_reg[49] 
       (.C(ap_clk),
        .CE(\operand_b_set[63]_i_1_n_0 ),
        .D(operand_b_set_reg0[17]),
        .Q(p_1_in1_in[17]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \operand_b_set_reg[4] 
       (.C(ap_clk),
        .CE(\operand_b_set[31]_i_1_n_0 ),
        .D(operand_b_set_reg03_out[4]),
        .Q(\operand_b_set_reg_n_0_[4] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \operand_b_set_reg[50] 
       (.C(ap_clk),
        .CE(\operand_b_set[63]_i_1_n_0 ),
        .D(operand_b_set_reg0[18]),
        .Q(p_1_in1_in[18]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \operand_b_set_reg[51] 
       (.C(ap_clk),
        .CE(\operand_b_set[63]_i_1_n_0 ),
        .D(operand_b_set_reg0[19]),
        .Q(p_1_in1_in[19]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \operand_b_set_reg[52] 
       (.C(ap_clk),
        .CE(\operand_b_set[63]_i_1_n_0 ),
        .D(operand_b_set_reg0[20]),
        .Q(p_1_in1_in[20]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \operand_b_set_reg[53] 
       (.C(ap_clk),
        .CE(\operand_b_set[63]_i_1_n_0 ),
        .D(operand_b_set_reg0[21]),
        .Q(p_1_in1_in[21]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \operand_b_set_reg[54] 
       (.C(ap_clk),
        .CE(\operand_b_set[63]_i_1_n_0 ),
        .D(operand_b_set_reg0[22]),
        .Q(p_1_in1_in[22]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \operand_b_set_reg[55] 
       (.C(ap_clk),
        .CE(\operand_b_set[63]_i_1_n_0 ),
        .D(operand_b_set_reg0[23]),
        .Q(p_1_in1_in[23]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \operand_b_set_reg[56] 
       (.C(ap_clk),
        .CE(\operand_b_set[63]_i_1_n_0 ),
        .D(operand_b_set_reg0[24]),
        .Q(p_1_in1_in[24]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \operand_b_set_reg[57] 
       (.C(ap_clk),
        .CE(\operand_b_set[63]_i_1_n_0 ),
        .D(operand_b_set_reg0[25]),
        .Q(p_1_in1_in[25]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \operand_b_set_reg[58] 
       (.C(ap_clk),
        .CE(\operand_b_set[63]_i_1_n_0 ),
        .D(operand_b_set_reg0[26]),
        .Q(p_1_in1_in[26]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \operand_b_set_reg[59] 
       (.C(ap_clk),
        .CE(\operand_b_set[63]_i_1_n_0 ),
        .D(operand_b_set_reg0[27]),
        .Q(p_1_in1_in[27]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \operand_b_set_reg[5] 
       (.C(ap_clk),
        .CE(\operand_b_set[31]_i_1_n_0 ),
        .D(operand_b_set_reg03_out[5]),
        .Q(\operand_b_set_reg_n_0_[5] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \operand_b_set_reg[60] 
       (.C(ap_clk),
        .CE(\operand_b_set[63]_i_1_n_0 ),
        .D(operand_b_set_reg0[28]),
        .Q(p_1_in1_in[28]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \operand_b_set_reg[61] 
       (.C(ap_clk),
        .CE(\operand_b_set[63]_i_1_n_0 ),
        .D(operand_b_set_reg0[29]),
        .Q(p_1_in1_in[29]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \operand_b_set_reg[62] 
       (.C(ap_clk),
        .CE(\operand_b_set[63]_i_1_n_0 ),
        .D(operand_b_set_reg0[30]),
        .Q(p_1_in1_in[30]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \operand_b_set_reg[63] 
       (.C(ap_clk),
        .CE(\operand_b_set[63]_i_1_n_0 ),
        .D(operand_b_set_reg0[31]),
        .Q(p_1_in1_in[31]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \operand_b_set_reg[6] 
       (.C(ap_clk),
        .CE(\operand_b_set[31]_i_1_n_0 ),
        .D(operand_b_set_reg03_out[6]),
        .Q(\operand_b_set_reg_n_0_[6] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \operand_b_set_reg[7] 
       (.C(ap_clk),
        .CE(\operand_b_set[31]_i_1_n_0 ),
        .D(operand_b_set_reg03_out[7]),
        .Q(\operand_b_set_reg_n_0_[7] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \operand_b_set_reg[8] 
       (.C(ap_clk),
        .CE(\operand_b_set[31]_i_1_n_0 ),
        .D(operand_b_set_reg03_out[8]),
        .Q(\operand_b_set_reg_n_0_[8] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \operand_b_set_reg[9] 
       (.C(ap_clk),
        .CE(\operand_b_set[31]_i_1_n_0 ),
        .D(operand_b_set_reg03_out[9]),
        .Q(\operand_b_set_reg_n_0_[9] ),
        .R(SR));
  (* SOFT_HLUTNM = "soft_lutpair69" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \precision_out_set[0]_i_1 
       (.I0(s_axi_control_WDATA[0]),
        .I1(s_axi_control_WSTRB[0]),
        .I2(\precision_out_set_reg_n_0_[0] ),
        .O(precision_out_set0[0]));
  LUT5 #(
    .INIT(32'h00000400)) 
    \precision_out_set[1]_i_1 
       (.I0(waddr[4]),
        .I1(waddr[5]),
        .I2(waddr[2]),
        .I3(\operand_a_set[31]_i_3_n_0 ),
        .I4(waddr[3]),
        .O(\precision_out_set[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair68" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \precision_out_set[1]_i_2 
       (.I0(s_axi_control_WDATA[1]),
        .I1(s_axi_control_WSTRB[0]),
        .I2(\precision_out_set_reg_n_0_[1] ),
        .O(precision_out_set0[1]));
  FDRE #(
    .INIT(1'b0)) 
    \precision_out_set_reg[0] 
       (.C(ap_clk),
        .CE(\precision_out_set[1]_i_1_n_0 ),
        .D(precision_out_set0[0]),
        .Q(\precision_out_set_reg_n_0_[0] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \precision_out_set_reg[1] 
       (.C(ap_clk),
        .CE(\precision_out_set[1]_i_1_n_0 ),
        .D(precision_out_set0[1]),
        .Q(\precision_out_set_reg_n_0_[1] ),
        .R(SR));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \precision_set[0]_i_1 
       (.I0(s_axi_control_WDATA[0]),
        .I1(s_axi_control_WSTRB[0]),
        .I2(\precision_set_reg_n_0_[0] ),
        .O(precision_set0[0]));
  LUT4 #(
    .INIT(16'h0080)) 
    \precision_set[1]_i_1 
       (.I0(waddr[5]),
        .I1(\precision_set[1]_i_3_n_0 ),
        .I2(waddr[4]),
        .I3(waddr[3]),
        .O(\precision_set[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \precision_set[1]_i_2 
       (.I0(s_axi_control_WDATA[1]),
        .I1(s_axi_control_WSTRB[0]),
        .I2(\precision_set_reg_n_0_[1] ),
        .O(precision_set0[1]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'h0008)) 
    \precision_set[1]_i_3 
       (.I0(\FSM_onehot_wstate_reg[2]_0 ),
        .I1(s_axi_control_WVALID),
        .I2(waddr[6]),
        .I3(waddr[2]),
        .O(\precision_set[1]_i_3_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \precision_set_reg[0] 
       (.C(ap_clk),
        .CE(\precision_set[1]_i_1_n_0 ),
        .D(precision_set0[0]),
        .Q(\precision_set_reg_n_0_[0] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \precision_set_reg[1] 
       (.C(ap_clk),
        .CE(\precision_set[1]_i_1_n_0 ),
        .D(precision_set0[1]),
        .Q(\precision_set_reg_n_0_[1] ),
        .R(SR));
  LUT6 #(
    .INIT(64'h00000000CCE200E2)) 
    \rdata[0]_i_1 
       (.I0(\rdata_reg[0]_i_2_n_0 ),
        .I1(s_axi_control_ARADDR[6]),
        .I2(\rdata_reg[0]_i_3_n_0 ),
        .I3(s_axi_control_ARADDR[2]),
        .I4(\rdata_reg[0]_i_4_n_0 ),
        .I5(s_axi_control_ARADDR[0]),
        .O(\rdata[0]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h3808)) 
    \rdata[0]_i_10 
       (.I0(\exceptions_set_reg_n_0_[0] ),
        .I1(s_axi_control_ARADDR[4]),
        .I2(s_axi_control_ARADDR[3]),
        .I3(p_1_in[0]),
        .O(\rdata[0]_i_10_n_0 ));
  LUT3 #(
    .INIT(8'h80)) 
    \rdata[0]_i_5 
       (.I0(s_axi_control_ARADDR[4]),
        .I1(s_axi_control_ARADDR[3]),
        .I2(\rst_n_set_reg_n_0_[0] ),
        .O(\rdata[0]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \rdata[0]_i_6 
       (.I0(\op_set_reg_n_0_[0] ),
        .I1(\precision_set_reg_n_0_[0] ),
        .I2(s_axi_control_ARADDR[4]),
        .I3(\valid_in_set_reg_n_0_[0] ),
        .I4(s_axi_control_ARADDR[3]),
        .I5(\ce_r_set_reg_n_0_[0] ),
        .O(\rdata[0]_i_6_n_0 ));
  LUT5 #(
    .INIT(32'hA0A0CFC0)) 
    \rdata[0]_i_7 
       (.I0(\valid_out_set_reg_n_0_[0] ),
        .I1(p_1_in1_in[0]),
        .I2(s_axi_control_ARADDR[4]),
        .I3(\operand_a_set_reg_n_0_[0] ),
        .I4(s_axi_control_ARADDR[3]),
        .O(\rdata[0]_i_7_n_0 ));
  LUT4 #(
    .INIT(16'h00E2)) 
    \rdata[0]_i_8 
       (.I0(\precision_out_set_reg_n_0_[0] ),
        .I1(s_axi_control_ARADDR[3]),
        .I2(\result_set_reg_n_0_[0] ),
        .I3(s_axi_control_ARADDR[4]),
        .O(\rdata[0]_i_8_n_0 ));
  LUT4 #(
    .INIT(16'h00E2)) 
    \rdata[0]_i_9 
       (.I0(p_1_in3_in[0]),
        .I1(s_axi_control_ARADDR[3]),
        .I2(\operand_b_set_reg_n_0_[0] ),
        .I3(s_axi_control_ARADDR[4]),
        .O(\rdata[0]_i_9_n_0 ));
  LUT5 #(
    .INIT(32'h0000A808)) 
    \rdata[10]_i_1 
       (.I0(s_axi_control_ARADDR[6]),
        .I1(\rdata[10]_i_2_n_0 ),
        .I2(s_axi_control_ARADDR[2]),
        .I3(\rdata[10]_i_3_n_0 ),
        .I4(s_axi_control_ARADDR[0]),
        .O(\rdata[10]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0088008830333000)) 
    \rdata[10]_i_2 
       (.I0(\result_set_reg_n_0_[10] ),
        .I1(s_axi_control_ARADDR[5]),
        .I2(p_1_in1_in[10]),
        .I3(s_axi_control_ARADDR[4]),
        .I4(\operand_a_set_reg_n_0_[10] ),
        .I5(s_axi_control_ARADDR[3]),
        .O(\rdata[10]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h00000000BB308830)) 
    \rdata[10]_i_3 
       (.I0(p_1_in[10]),
        .I1(s_axi_control_ARADDR[5]),
        .I2(p_1_in3_in[10]),
        .I3(s_axi_control_ARADDR[3]),
        .I4(\operand_b_set_reg_n_0_[10] ),
        .I5(s_axi_control_ARADDR[4]),
        .O(\rdata[10]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'h0000A808)) 
    \rdata[11]_i_1 
       (.I0(s_axi_control_ARADDR[6]),
        .I1(\rdata[11]_i_2_n_0 ),
        .I2(s_axi_control_ARADDR[2]),
        .I3(\rdata[11]_i_3_n_0 ),
        .I4(s_axi_control_ARADDR[0]),
        .O(\rdata[11]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0088008830333000)) 
    \rdata[11]_i_2 
       (.I0(\result_set_reg_n_0_[11] ),
        .I1(s_axi_control_ARADDR[5]),
        .I2(p_1_in1_in[11]),
        .I3(s_axi_control_ARADDR[4]),
        .I4(\operand_a_set_reg_n_0_[11] ),
        .I5(s_axi_control_ARADDR[3]),
        .O(\rdata[11]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h00000000BB308830)) 
    \rdata[11]_i_3 
       (.I0(p_1_in[11]),
        .I1(s_axi_control_ARADDR[5]),
        .I2(p_1_in3_in[11]),
        .I3(s_axi_control_ARADDR[3]),
        .I4(\operand_b_set_reg_n_0_[11] ),
        .I5(s_axi_control_ARADDR[4]),
        .O(\rdata[11]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'h0000A808)) 
    \rdata[12]_i_1 
       (.I0(s_axi_control_ARADDR[6]),
        .I1(\rdata[12]_i_2_n_0 ),
        .I2(s_axi_control_ARADDR[2]),
        .I3(\rdata[12]_i_3_n_0 ),
        .I4(s_axi_control_ARADDR[0]),
        .O(\rdata[12]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0088008830333000)) 
    \rdata[12]_i_2 
       (.I0(\result_set_reg_n_0_[12] ),
        .I1(s_axi_control_ARADDR[5]),
        .I2(p_1_in1_in[12]),
        .I3(s_axi_control_ARADDR[4]),
        .I4(\operand_a_set_reg_n_0_[12] ),
        .I5(s_axi_control_ARADDR[3]),
        .O(\rdata[12]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h00000000BB308830)) 
    \rdata[12]_i_3 
       (.I0(p_1_in[12]),
        .I1(s_axi_control_ARADDR[5]),
        .I2(p_1_in3_in[12]),
        .I3(s_axi_control_ARADDR[3]),
        .I4(\operand_b_set_reg_n_0_[12] ),
        .I5(s_axi_control_ARADDR[4]),
        .O(\rdata[12]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'h0000A808)) 
    \rdata[13]_i_1 
       (.I0(s_axi_control_ARADDR[6]),
        .I1(\rdata[13]_i_2_n_0 ),
        .I2(s_axi_control_ARADDR[2]),
        .I3(\rdata[13]_i_3_n_0 ),
        .I4(s_axi_control_ARADDR[0]),
        .O(\rdata[13]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0088008830333000)) 
    \rdata[13]_i_2 
       (.I0(\result_set_reg_n_0_[13] ),
        .I1(s_axi_control_ARADDR[5]),
        .I2(p_1_in1_in[13]),
        .I3(s_axi_control_ARADDR[4]),
        .I4(\operand_a_set_reg_n_0_[13] ),
        .I5(s_axi_control_ARADDR[3]),
        .O(\rdata[13]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h00000000BB308830)) 
    \rdata[13]_i_3 
       (.I0(p_1_in[13]),
        .I1(s_axi_control_ARADDR[5]),
        .I2(p_1_in3_in[13]),
        .I3(s_axi_control_ARADDR[3]),
        .I4(\operand_b_set_reg_n_0_[13] ),
        .I5(s_axi_control_ARADDR[4]),
        .O(\rdata[13]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'h0000A808)) 
    \rdata[14]_i_1 
       (.I0(s_axi_control_ARADDR[6]),
        .I1(\rdata[14]_i_2_n_0 ),
        .I2(s_axi_control_ARADDR[2]),
        .I3(\rdata[14]_i_3_n_0 ),
        .I4(s_axi_control_ARADDR[0]),
        .O(\rdata[14]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0088008830333000)) 
    \rdata[14]_i_2 
       (.I0(\result_set_reg_n_0_[14] ),
        .I1(s_axi_control_ARADDR[5]),
        .I2(p_1_in1_in[14]),
        .I3(s_axi_control_ARADDR[4]),
        .I4(\operand_a_set_reg_n_0_[14] ),
        .I5(s_axi_control_ARADDR[3]),
        .O(\rdata[14]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h00000000BB308830)) 
    \rdata[14]_i_3 
       (.I0(p_1_in[14]),
        .I1(s_axi_control_ARADDR[5]),
        .I2(p_1_in3_in[14]),
        .I3(s_axi_control_ARADDR[3]),
        .I4(\operand_b_set_reg_n_0_[14] ),
        .I5(s_axi_control_ARADDR[4]),
        .O(\rdata[14]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'h0000A808)) 
    \rdata[15]_i_1 
       (.I0(s_axi_control_ARADDR[6]),
        .I1(\rdata[15]_i_2_n_0 ),
        .I2(s_axi_control_ARADDR[2]),
        .I3(\rdata[15]_i_3_n_0 ),
        .I4(s_axi_control_ARADDR[0]),
        .O(\rdata[15]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0088008830333000)) 
    \rdata[15]_i_2 
       (.I0(\result_set_reg_n_0_[15] ),
        .I1(s_axi_control_ARADDR[5]),
        .I2(p_1_in1_in[15]),
        .I3(s_axi_control_ARADDR[4]),
        .I4(\operand_a_set_reg_n_0_[15] ),
        .I5(s_axi_control_ARADDR[3]),
        .O(\rdata[15]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h00000000BB308830)) 
    \rdata[15]_i_3 
       (.I0(p_1_in[15]),
        .I1(s_axi_control_ARADDR[5]),
        .I2(p_1_in3_in[15]),
        .I3(s_axi_control_ARADDR[3]),
        .I4(\operand_b_set_reg_n_0_[15] ),
        .I5(s_axi_control_ARADDR[4]),
        .O(\rdata[15]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'h0000A808)) 
    \rdata[16]_i_1 
       (.I0(s_axi_control_ARADDR[6]),
        .I1(\rdata[16]_i_2_n_0 ),
        .I2(s_axi_control_ARADDR[2]),
        .I3(\rdata[16]_i_3_n_0 ),
        .I4(s_axi_control_ARADDR[0]),
        .O(\rdata[16]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0088008830333000)) 
    \rdata[16]_i_2 
       (.I0(\result_set_reg_n_0_[16] ),
        .I1(s_axi_control_ARADDR[5]),
        .I2(p_1_in1_in[16]),
        .I3(s_axi_control_ARADDR[4]),
        .I4(\operand_a_set_reg_n_0_[16] ),
        .I5(s_axi_control_ARADDR[3]),
        .O(\rdata[16]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h00000000BB308830)) 
    \rdata[16]_i_3 
       (.I0(p_1_in[16]),
        .I1(s_axi_control_ARADDR[5]),
        .I2(p_1_in3_in[16]),
        .I3(s_axi_control_ARADDR[3]),
        .I4(\operand_b_set_reg_n_0_[16] ),
        .I5(s_axi_control_ARADDR[4]),
        .O(\rdata[16]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'h0000A808)) 
    \rdata[17]_i_1 
       (.I0(s_axi_control_ARADDR[6]),
        .I1(\rdata[17]_i_2_n_0 ),
        .I2(s_axi_control_ARADDR[2]),
        .I3(\rdata[17]_i_3_n_0 ),
        .I4(s_axi_control_ARADDR[0]),
        .O(\rdata[17]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0088008830333000)) 
    \rdata[17]_i_2 
       (.I0(\result_set_reg_n_0_[17] ),
        .I1(s_axi_control_ARADDR[5]),
        .I2(p_1_in1_in[17]),
        .I3(s_axi_control_ARADDR[4]),
        .I4(\operand_a_set_reg_n_0_[17] ),
        .I5(s_axi_control_ARADDR[3]),
        .O(\rdata[17]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h00000000BB308830)) 
    \rdata[17]_i_3 
       (.I0(p_1_in[17]),
        .I1(s_axi_control_ARADDR[5]),
        .I2(p_1_in3_in[17]),
        .I3(s_axi_control_ARADDR[3]),
        .I4(\operand_b_set_reg_n_0_[17] ),
        .I5(s_axi_control_ARADDR[4]),
        .O(\rdata[17]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'h0000A808)) 
    \rdata[18]_i_1 
       (.I0(s_axi_control_ARADDR[6]),
        .I1(\rdata[18]_i_2_n_0 ),
        .I2(s_axi_control_ARADDR[2]),
        .I3(\rdata[18]_i_3_n_0 ),
        .I4(s_axi_control_ARADDR[0]),
        .O(\rdata[18]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0088008830333000)) 
    \rdata[18]_i_2 
       (.I0(\result_set_reg_n_0_[18] ),
        .I1(s_axi_control_ARADDR[5]),
        .I2(p_1_in1_in[18]),
        .I3(s_axi_control_ARADDR[4]),
        .I4(\operand_a_set_reg_n_0_[18] ),
        .I5(s_axi_control_ARADDR[3]),
        .O(\rdata[18]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h00000000BB308830)) 
    \rdata[18]_i_3 
       (.I0(p_1_in[18]),
        .I1(s_axi_control_ARADDR[5]),
        .I2(p_1_in3_in[18]),
        .I3(s_axi_control_ARADDR[3]),
        .I4(\operand_b_set_reg_n_0_[18] ),
        .I5(s_axi_control_ARADDR[4]),
        .O(\rdata[18]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'h0000A808)) 
    \rdata[19]_i_1 
       (.I0(s_axi_control_ARADDR[6]),
        .I1(\rdata[19]_i_2_n_0 ),
        .I2(s_axi_control_ARADDR[2]),
        .I3(\rdata[19]_i_3_n_0 ),
        .I4(s_axi_control_ARADDR[0]),
        .O(\rdata[19]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0088008830333000)) 
    \rdata[19]_i_2 
       (.I0(\result_set_reg_n_0_[19] ),
        .I1(s_axi_control_ARADDR[5]),
        .I2(p_1_in1_in[19]),
        .I3(s_axi_control_ARADDR[4]),
        .I4(\operand_a_set_reg_n_0_[19] ),
        .I5(s_axi_control_ARADDR[3]),
        .O(\rdata[19]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h00000000BB308830)) 
    \rdata[19]_i_3 
       (.I0(p_1_in[19]),
        .I1(s_axi_control_ARADDR[5]),
        .I2(p_1_in3_in[19]),
        .I3(s_axi_control_ARADDR[3]),
        .I4(\operand_b_set_reg_n_0_[19] ),
        .I5(s_axi_control_ARADDR[4]),
        .O(\rdata[19]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h00000000CCE200E2)) 
    \rdata[1]_i_1 
       (.I0(\rdata[1]_i_2_n_0 ),
        .I1(s_axi_control_ARADDR[6]),
        .I2(\rdata_reg[1]_i_3_n_0 ),
        .I3(s_axi_control_ARADDR[2]),
        .I4(\rdata_reg[1]_i_4_n_0 ),
        .I5(s_axi_control_ARADDR[0]),
        .O(\rdata[1]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h8A800000)) 
    \rdata[1]_i_2 
       (.I0(s_axi_control_ARADDR[4]),
        .I1(\op_set_reg_n_0_[1] ),
        .I2(s_axi_control_ARADDR[3]),
        .I3(\precision_set_reg_n_0_[1] ),
        .I4(s_axi_control_ARADDR[5]),
        .O(\rdata[1]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'h00B8)) 
    \rdata[1]_i_5 
       (.I0(p_1_in1_in[1]),
        .I1(s_axi_control_ARADDR[4]),
        .I2(\operand_a_set_reg_n_0_[1] ),
        .I3(s_axi_control_ARADDR[3]),
        .O(\rdata[1]_i_5_n_0 ));
  LUT4 #(
    .INIT(16'h00E2)) 
    \rdata[1]_i_6 
       (.I0(\precision_out_set_reg_n_0_[1] ),
        .I1(s_axi_control_ARADDR[3]),
        .I2(\result_set_reg_n_0_[1] ),
        .I3(s_axi_control_ARADDR[4]),
        .O(\rdata[1]_i_6_n_0 ));
  LUT4 #(
    .INIT(16'h00E2)) 
    \rdata[1]_i_7 
       (.I0(p_1_in3_in[1]),
        .I1(s_axi_control_ARADDR[3]),
        .I2(\operand_b_set_reg_n_0_[1] ),
        .I3(s_axi_control_ARADDR[4]),
        .O(\rdata[1]_i_7_n_0 ));
  LUT4 #(
    .INIT(16'h3808)) 
    \rdata[1]_i_8 
       (.I0(\exceptions_set_reg_n_0_[1] ),
        .I1(s_axi_control_ARADDR[4]),
        .I2(s_axi_control_ARADDR[3]),
        .I3(p_1_in[1]),
        .O(\rdata[1]_i_8_n_0 ));
  LUT5 #(
    .INIT(32'h0000A808)) 
    \rdata[20]_i_1 
       (.I0(s_axi_control_ARADDR[6]),
        .I1(\rdata[20]_i_2_n_0 ),
        .I2(s_axi_control_ARADDR[2]),
        .I3(\rdata[20]_i_3_n_0 ),
        .I4(s_axi_control_ARADDR[0]),
        .O(\rdata[20]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0088008830333000)) 
    \rdata[20]_i_2 
       (.I0(\result_set_reg_n_0_[20] ),
        .I1(s_axi_control_ARADDR[5]),
        .I2(p_1_in1_in[20]),
        .I3(s_axi_control_ARADDR[4]),
        .I4(\operand_a_set_reg_n_0_[20] ),
        .I5(s_axi_control_ARADDR[3]),
        .O(\rdata[20]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h00000000BB308830)) 
    \rdata[20]_i_3 
       (.I0(p_1_in[20]),
        .I1(s_axi_control_ARADDR[5]),
        .I2(p_1_in3_in[20]),
        .I3(s_axi_control_ARADDR[3]),
        .I4(\operand_b_set_reg_n_0_[20] ),
        .I5(s_axi_control_ARADDR[4]),
        .O(\rdata[20]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'h0000A808)) 
    \rdata[21]_i_1 
       (.I0(s_axi_control_ARADDR[6]),
        .I1(\rdata[21]_i_2_n_0 ),
        .I2(s_axi_control_ARADDR[2]),
        .I3(\rdata[21]_i_3_n_0 ),
        .I4(s_axi_control_ARADDR[0]),
        .O(\rdata[21]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0088008830333000)) 
    \rdata[21]_i_2 
       (.I0(\result_set_reg_n_0_[21] ),
        .I1(s_axi_control_ARADDR[5]),
        .I2(p_1_in1_in[21]),
        .I3(s_axi_control_ARADDR[4]),
        .I4(\operand_a_set_reg_n_0_[21] ),
        .I5(s_axi_control_ARADDR[3]),
        .O(\rdata[21]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h00000000BB308830)) 
    \rdata[21]_i_3 
       (.I0(p_1_in[21]),
        .I1(s_axi_control_ARADDR[5]),
        .I2(p_1_in3_in[21]),
        .I3(s_axi_control_ARADDR[3]),
        .I4(\operand_b_set_reg_n_0_[21] ),
        .I5(s_axi_control_ARADDR[4]),
        .O(\rdata[21]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'h0000A808)) 
    \rdata[22]_i_1 
       (.I0(s_axi_control_ARADDR[6]),
        .I1(\rdata[22]_i_2_n_0 ),
        .I2(s_axi_control_ARADDR[2]),
        .I3(\rdata[22]_i_3_n_0 ),
        .I4(s_axi_control_ARADDR[0]),
        .O(\rdata[22]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0088008830333000)) 
    \rdata[22]_i_2 
       (.I0(\result_set_reg_n_0_[22] ),
        .I1(s_axi_control_ARADDR[5]),
        .I2(p_1_in1_in[22]),
        .I3(s_axi_control_ARADDR[4]),
        .I4(\operand_a_set_reg_n_0_[22] ),
        .I5(s_axi_control_ARADDR[3]),
        .O(\rdata[22]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h00000000BB308830)) 
    \rdata[22]_i_3 
       (.I0(p_1_in[22]),
        .I1(s_axi_control_ARADDR[5]),
        .I2(p_1_in3_in[22]),
        .I3(s_axi_control_ARADDR[3]),
        .I4(\operand_b_set_reg_n_0_[22] ),
        .I5(s_axi_control_ARADDR[4]),
        .O(\rdata[22]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'h0000A808)) 
    \rdata[23]_i_1 
       (.I0(s_axi_control_ARADDR[6]),
        .I1(\rdata[23]_i_2_n_0 ),
        .I2(s_axi_control_ARADDR[2]),
        .I3(\rdata[23]_i_3_n_0 ),
        .I4(s_axi_control_ARADDR[0]),
        .O(\rdata[23]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0088008830333000)) 
    \rdata[23]_i_2 
       (.I0(\result_set_reg_n_0_[23] ),
        .I1(s_axi_control_ARADDR[5]),
        .I2(p_1_in1_in[23]),
        .I3(s_axi_control_ARADDR[4]),
        .I4(\operand_a_set_reg_n_0_[23] ),
        .I5(s_axi_control_ARADDR[3]),
        .O(\rdata[23]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h00000000BB308830)) 
    \rdata[23]_i_3 
       (.I0(p_1_in[23]),
        .I1(s_axi_control_ARADDR[5]),
        .I2(p_1_in3_in[23]),
        .I3(s_axi_control_ARADDR[3]),
        .I4(\operand_b_set_reg_n_0_[23] ),
        .I5(s_axi_control_ARADDR[4]),
        .O(\rdata[23]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'h0000A808)) 
    \rdata[24]_i_1 
       (.I0(s_axi_control_ARADDR[6]),
        .I1(\rdata[24]_i_2_n_0 ),
        .I2(s_axi_control_ARADDR[2]),
        .I3(\rdata[24]_i_3_n_0 ),
        .I4(s_axi_control_ARADDR[0]),
        .O(\rdata[24]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0088008830333000)) 
    \rdata[24]_i_2 
       (.I0(\result_set_reg_n_0_[24] ),
        .I1(s_axi_control_ARADDR[5]),
        .I2(p_1_in1_in[24]),
        .I3(s_axi_control_ARADDR[4]),
        .I4(\operand_a_set_reg_n_0_[24] ),
        .I5(s_axi_control_ARADDR[3]),
        .O(\rdata[24]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h00000000BB308830)) 
    \rdata[24]_i_3 
       (.I0(p_1_in[24]),
        .I1(s_axi_control_ARADDR[5]),
        .I2(p_1_in3_in[24]),
        .I3(s_axi_control_ARADDR[3]),
        .I4(\operand_b_set_reg_n_0_[24] ),
        .I5(s_axi_control_ARADDR[4]),
        .O(\rdata[24]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'h0000A808)) 
    \rdata[25]_i_1 
       (.I0(s_axi_control_ARADDR[6]),
        .I1(\rdata[25]_i_2_n_0 ),
        .I2(s_axi_control_ARADDR[2]),
        .I3(\rdata[25]_i_3_n_0 ),
        .I4(s_axi_control_ARADDR[0]),
        .O(\rdata[25]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0088008830333000)) 
    \rdata[25]_i_2 
       (.I0(\result_set_reg_n_0_[25] ),
        .I1(s_axi_control_ARADDR[5]),
        .I2(p_1_in1_in[25]),
        .I3(s_axi_control_ARADDR[4]),
        .I4(\operand_a_set_reg_n_0_[25] ),
        .I5(s_axi_control_ARADDR[3]),
        .O(\rdata[25]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h00000000BB308830)) 
    \rdata[25]_i_3 
       (.I0(p_1_in[25]),
        .I1(s_axi_control_ARADDR[5]),
        .I2(p_1_in3_in[25]),
        .I3(s_axi_control_ARADDR[3]),
        .I4(\operand_b_set_reg_n_0_[25] ),
        .I5(s_axi_control_ARADDR[4]),
        .O(\rdata[25]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'h0000A808)) 
    \rdata[26]_i_1 
       (.I0(s_axi_control_ARADDR[6]),
        .I1(\rdata[26]_i_2_n_0 ),
        .I2(s_axi_control_ARADDR[2]),
        .I3(\rdata[26]_i_3_n_0 ),
        .I4(s_axi_control_ARADDR[0]),
        .O(\rdata[26]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0088008830333000)) 
    \rdata[26]_i_2 
       (.I0(\result_set_reg_n_0_[26] ),
        .I1(s_axi_control_ARADDR[5]),
        .I2(p_1_in1_in[26]),
        .I3(s_axi_control_ARADDR[4]),
        .I4(\operand_a_set_reg_n_0_[26] ),
        .I5(s_axi_control_ARADDR[3]),
        .O(\rdata[26]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h00000000BB308830)) 
    \rdata[26]_i_3 
       (.I0(p_1_in[26]),
        .I1(s_axi_control_ARADDR[5]),
        .I2(p_1_in3_in[26]),
        .I3(s_axi_control_ARADDR[3]),
        .I4(\operand_b_set_reg_n_0_[26] ),
        .I5(s_axi_control_ARADDR[4]),
        .O(\rdata[26]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'h0000A808)) 
    \rdata[27]_i_1 
       (.I0(s_axi_control_ARADDR[6]),
        .I1(\rdata[27]_i_2_n_0 ),
        .I2(s_axi_control_ARADDR[2]),
        .I3(\rdata[27]_i_3_n_0 ),
        .I4(s_axi_control_ARADDR[0]),
        .O(\rdata[27]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0088008830333000)) 
    \rdata[27]_i_2 
       (.I0(\result_set_reg_n_0_[27] ),
        .I1(s_axi_control_ARADDR[5]),
        .I2(p_1_in1_in[27]),
        .I3(s_axi_control_ARADDR[4]),
        .I4(\operand_a_set_reg_n_0_[27] ),
        .I5(s_axi_control_ARADDR[3]),
        .O(\rdata[27]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h00000000BB308830)) 
    \rdata[27]_i_3 
       (.I0(p_1_in[27]),
        .I1(s_axi_control_ARADDR[5]),
        .I2(p_1_in3_in[27]),
        .I3(s_axi_control_ARADDR[3]),
        .I4(\operand_b_set_reg_n_0_[27] ),
        .I5(s_axi_control_ARADDR[4]),
        .O(\rdata[27]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'h0000A808)) 
    \rdata[28]_i_1 
       (.I0(s_axi_control_ARADDR[6]),
        .I1(\rdata[28]_i_2_n_0 ),
        .I2(s_axi_control_ARADDR[2]),
        .I3(\rdata[28]_i_3_n_0 ),
        .I4(s_axi_control_ARADDR[0]),
        .O(\rdata[28]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0088008830333000)) 
    \rdata[28]_i_2 
       (.I0(\result_set_reg_n_0_[28] ),
        .I1(s_axi_control_ARADDR[5]),
        .I2(p_1_in1_in[28]),
        .I3(s_axi_control_ARADDR[4]),
        .I4(\operand_a_set_reg_n_0_[28] ),
        .I5(s_axi_control_ARADDR[3]),
        .O(\rdata[28]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h00000000BB308830)) 
    \rdata[28]_i_3 
       (.I0(p_1_in[28]),
        .I1(s_axi_control_ARADDR[5]),
        .I2(p_1_in3_in[28]),
        .I3(s_axi_control_ARADDR[3]),
        .I4(\operand_b_set_reg_n_0_[28] ),
        .I5(s_axi_control_ARADDR[4]),
        .O(\rdata[28]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'h0000A808)) 
    \rdata[29]_i_1 
       (.I0(s_axi_control_ARADDR[6]),
        .I1(\rdata[29]_i_2_n_0 ),
        .I2(s_axi_control_ARADDR[2]),
        .I3(\rdata[29]_i_3_n_0 ),
        .I4(s_axi_control_ARADDR[0]),
        .O(\rdata[29]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0088008830333000)) 
    \rdata[29]_i_2 
       (.I0(\result_set_reg_n_0_[29] ),
        .I1(s_axi_control_ARADDR[5]),
        .I2(p_1_in1_in[29]),
        .I3(s_axi_control_ARADDR[4]),
        .I4(\operand_a_set_reg_n_0_[29] ),
        .I5(s_axi_control_ARADDR[3]),
        .O(\rdata[29]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h00000000BB308830)) 
    \rdata[29]_i_3 
       (.I0(p_1_in[29]),
        .I1(s_axi_control_ARADDR[5]),
        .I2(p_1_in3_in[29]),
        .I3(s_axi_control_ARADDR[3]),
        .I4(\operand_b_set_reg_n_0_[29] ),
        .I5(s_axi_control_ARADDR[4]),
        .O(\rdata[29]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'h0000A808)) 
    \rdata[2]_i_1 
       (.I0(s_axi_control_ARADDR[6]),
        .I1(\rdata[2]_i_2_n_0 ),
        .I2(s_axi_control_ARADDR[2]),
        .I3(\rdata_reg[2]_i_3_n_0 ),
        .I4(s_axi_control_ARADDR[0]),
        .O(\rdata[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0088008830333000)) 
    \rdata[2]_i_2 
       (.I0(\result_set_reg_n_0_[2] ),
        .I1(s_axi_control_ARADDR[5]),
        .I2(p_1_in1_in[2]),
        .I3(s_axi_control_ARADDR[4]),
        .I4(\operand_a_set_reg_n_0_[2] ),
        .I5(s_axi_control_ARADDR[3]),
        .O(\rdata[2]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'h00E2)) 
    \rdata[2]_i_4 
       (.I0(p_1_in3_in[2]),
        .I1(s_axi_control_ARADDR[3]),
        .I2(\operand_b_set_reg_n_0_[2] ),
        .I3(s_axi_control_ARADDR[4]),
        .O(\rdata[2]_i_4_n_0 ));
  LUT4 #(
    .INIT(16'h3088)) 
    \rdata[2]_i_5 
       (.I0(\exceptions_set_reg_n_0_[2] ),
        .I1(s_axi_control_ARADDR[4]),
        .I2(p_1_in[2]),
        .I3(s_axi_control_ARADDR[3]),
        .O(\rdata[2]_i_5_n_0 ));
  LUT5 #(
    .INIT(32'h0000A808)) 
    \rdata[30]_i_1 
       (.I0(s_axi_control_ARADDR[6]),
        .I1(\rdata[30]_i_2_n_0 ),
        .I2(s_axi_control_ARADDR[2]),
        .I3(\rdata[30]_i_3_n_0 ),
        .I4(s_axi_control_ARADDR[0]),
        .O(\rdata[30]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0088008830333000)) 
    \rdata[30]_i_2 
       (.I0(\result_set_reg_n_0_[30] ),
        .I1(s_axi_control_ARADDR[5]),
        .I2(p_1_in1_in[30]),
        .I3(s_axi_control_ARADDR[4]),
        .I4(\operand_a_set_reg_n_0_[30] ),
        .I5(s_axi_control_ARADDR[3]),
        .O(\rdata[30]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h00000000BB308830)) 
    \rdata[30]_i_3 
       (.I0(p_1_in[30]),
        .I1(s_axi_control_ARADDR[5]),
        .I2(p_1_in3_in[30]),
        .I3(s_axi_control_ARADDR[3]),
        .I4(\operand_b_set_reg_n_0_[30] ),
        .I5(s_axi_control_ARADDR[4]),
        .O(\rdata[30]_i_3_n_0 ));
  LUT3 #(
    .INIT(8'h80)) 
    \rdata[31]_i_1 
       (.I0(s_axi_control_ARADDR[1]),
        .I1(\FSM_onehot_rstate_reg[1]_0 ),
        .I2(s_axi_control_ARVALID),
        .O(\rdata[31]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \rdata[31]_i_2 
       (.I0(s_axi_control_ARVALID),
        .I1(\FSM_onehot_rstate_reg[1]_0 ),
        .O(\rdata[31]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'h0000A808)) 
    \rdata[31]_i_3 
       (.I0(s_axi_control_ARADDR[6]),
        .I1(\rdata[31]_i_4_n_0 ),
        .I2(s_axi_control_ARADDR[2]),
        .I3(\rdata[31]_i_5_n_0 ),
        .I4(s_axi_control_ARADDR[0]),
        .O(\rdata[31]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h0088008830333000)) 
    \rdata[31]_i_4 
       (.I0(\result_set_reg_n_0_[31] ),
        .I1(s_axi_control_ARADDR[5]),
        .I2(p_1_in1_in[31]),
        .I3(s_axi_control_ARADDR[4]),
        .I4(\operand_a_set_reg_n_0_[31] ),
        .I5(s_axi_control_ARADDR[3]),
        .O(\rdata[31]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h00000000BB308830)) 
    \rdata[31]_i_5 
       (.I0(p_1_in[31]),
        .I1(s_axi_control_ARADDR[5]),
        .I2(p_1_in3_in[31]),
        .I3(s_axi_control_ARADDR[3]),
        .I4(\operand_b_set_reg_n_0_[31] ),
        .I5(s_axi_control_ARADDR[4]),
        .O(\rdata[31]_i_5_n_0 ));
  LUT5 #(
    .INIT(32'h0000A808)) 
    \rdata[3]_i_1 
       (.I0(s_axi_control_ARADDR[6]),
        .I1(\rdata[3]_i_2_n_0 ),
        .I2(s_axi_control_ARADDR[2]),
        .I3(\rdata_reg[3]_i_3_n_0 ),
        .I4(s_axi_control_ARADDR[0]),
        .O(\rdata[3]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0088008830333000)) 
    \rdata[3]_i_2 
       (.I0(\result_set_reg_n_0_[3] ),
        .I1(s_axi_control_ARADDR[5]),
        .I2(p_1_in1_in[3]),
        .I3(s_axi_control_ARADDR[4]),
        .I4(\operand_a_set_reg_n_0_[3] ),
        .I5(s_axi_control_ARADDR[3]),
        .O(\rdata[3]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'h00E2)) 
    \rdata[3]_i_4 
       (.I0(p_1_in3_in[3]),
        .I1(s_axi_control_ARADDR[3]),
        .I2(\operand_b_set_reg_n_0_[3] ),
        .I3(s_axi_control_ARADDR[4]),
        .O(\rdata[3]_i_4_n_0 ));
  LUT4 #(
    .INIT(16'h3088)) 
    \rdata[3]_i_5 
       (.I0(\exceptions_set_reg_n_0_[3] ),
        .I1(s_axi_control_ARADDR[4]),
        .I2(p_1_in[3]),
        .I3(s_axi_control_ARADDR[3]),
        .O(\rdata[3]_i_5_n_0 ));
  LUT5 #(
    .INIT(32'h0000A808)) 
    \rdata[4]_i_1 
       (.I0(s_axi_control_ARADDR[6]),
        .I1(\rdata[4]_i_2_n_0 ),
        .I2(s_axi_control_ARADDR[2]),
        .I3(\rdata_reg[4]_i_3_n_0 ),
        .I4(s_axi_control_ARADDR[0]),
        .O(\rdata[4]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0088008830333000)) 
    \rdata[4]_i_2 
       (.I0(\result_set_reg_n_0_[4] ),
        .I1(s_axi_control_ARADDR[5]),
        .I2(p_1_in1_in[4]),
        .I3(s_axi_control_ARADDR[4]),
        .I4(\operand_a_set_reg_n_0_[4] ),
        .I5(s_axi_control_ARADDR[3]),
        .O(\rdata[4]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'h00E2)) 
    \rdata[4]_i_4 
       (.I0(p_1_in3_in[4]),
        .I1(s_axi_control_ARADDR[3]),
        .I2(\operand_b_set_reg_n_0_[4] ),
        .I3(s_axi_control_ARADDR[4]),
        .O(\rdata[4]_i_4_n_0 ));
  LUT4 #(
    .INIT(16'h3088)) 
    \rdata[4]_i_5 
       (.I0(\exceptions_set_reg_n_0_[4] ),
        .I1(s_axi_control_ARADDR[4]),
        .I2(p_1_in[4]),
        .I3(s_axi_control_ARADDR[3]),
        .O(\rdata[4]_i_5_n_0 ));
  LUT5 #(
    .INIT(32'h0000A808)) 
    \rdata[5]_i_1 
       (.I0(s_axi_control_ARADDR[6]),
        .I1(\rdata[5]_i_2_n_0 ),
        .I2(s_axi_control_ARADDR[2]),
        .I3(\rdata[5]_i_3_n_0 ),
        .I4(s_axi_control_ARADDR[0]),
        .O(\rdata[5]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0088008830333000)) 
    \rdata[5]_i_2 
       (.I0(\result_set_reg_n_0_[5] ),
        .I1(s_axi_control_ARADDR[5]),
        .I2(p_1_in1_in[5]),
        .I3(s_axi_control_ARADDR[4]),
        .I4(\operand_a_set_reg_n_0_[5] ),
        .I5(s_axi_control_ARADDR[3]),
        .O(\rdata[5]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h00000000BB308830)) 
    \rdata[5]_i_3 
       (.I0(p_1_in[5]),
        .I1(s_axi_control_ARADDR[5]),
        .I2(p_1_in3_in[5]),
        .I3(s_axi_control_ARADDR[3]),
        .I4(\operand_b_set_reg_n_0_[5] ),
        .I5(s_axi_control_ARADDR[4]),
        .O(\rdata[5]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'h0000A808)) 
    \rdata[6]_i_1 
       (.I0(s_axi_control_ARADDR[6]),
        .I1(\rdata[6]_i_2_n_0 ),
        .I2(s_axi_control_ARADDR[2]),
        .I3(\rdata[6]_i_3_n_0 ),
        .I4(s_axi_control_ARADDR[0]),
        .O(\rdata[6]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0088008830333000)) 
    \rdata[6]_i_2 
       (.I0(\result_set_reg_n_0_[6] ),
        .I1(s_axi_control_ARADDR[5]),
        .I2(p_1_in1_in[6]),
        .I3(s_axi_control_ARADDR[4]),
        .I4(\operand_a_set_reg_n_0_[6] ),
        .I5(s_axi_control_ARADDR[3]),
        .O(\rdata[6]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h00000000BB308830)) 
    \rdata[6]_i_3 
       (.I0(p_1_in[6]),
        .I1(s_axi_control_ARADDR[5]),
        .I2(p_1_in3_in[6]),
        .I3(s_axi_control_ARADDR[3]),
        .I4(\operand_b_set_reg_n_0_[6] ),
        .I5(s_axi_control_ARADDR[4]),
        .O(\rdata[6]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'h0000A808)) 
    \rdata[7]_i_1 
       (.I0(s_axi_control_ARADDR[6]),
        .I1(\rdata[7]_i_2_n_0 ),
        .I2(s_axi_control_ARADDR[2]),
        .I3(\rdata[7]_i_3_n_0 ),
        .I4(s_axi_control_ARADDR[0]),
        .O(\rdata[7]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0088008830333000)) 
    \rdata[7]_i_2 
       (.I0(\result_set_reg_n_0_[7] ),
        .I1(s_axi_control_ARADDR[5]),
        .I2(p_1_in1_in[7]),
        .I3(s_axi_control_ARADDR[4]),
        .I4(\operand_a_set_reg_n_0_[7] ),
        .I5(s_axi_control_ARADDR[3]),
        .O(\rdata[7]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h00000000BB308830)) 
    \rdata[7]_i_3 
       (.I0(p_1_in[7]),
        .I1(s_axi_control_ARADDR[5]),
        .I2(p_1_in3_in[7]),
        .I3(s_axi_control_ARADDR[3]),
        .I4(\operand_b_set_reg_n_0_[7] ),
        .I5(s_axi_control_ARADDR[4]),
        .O(\rdata[7]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'h0000A808)) 
    \rdata[8]_i_1 
       (.I0(s_axi_control_ARADDR[6]),
        .I1(\rdata[8]_i_2_n_0 ),
        .I2(s_axi_control_ARADDR[2]),
        .I3(\rdata[8]_i_3_n_0 ),
        .I4(s_axi_control_ARADDR[0]),
        .O(\rdata[8]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0088008830333000)) 
    \rdata[8]_i_2 
       (.I0(\result_set_reg_n_0_[8] ),
        .I1(s_axi_control_ARADDR[5]),
        .I2(p_1_in1_in[8]),
        .I3(s_axi_control_ARADDR[4]),
        .I4(\operand_a_set_reg_n_0_[8] ),
        .I5(s_axi_control_ARADDR[3]),
        .O(\rdata[8]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h00000000BB308830)) 
    \rdata[8]_i_3 
       (.I0(p_1_in[8]),
        .I1(s_axi_control_ARADDR[5]),
        .I2(p_1_in3_in[8]),
        .I3(s_axi_control_ARADDR[3]),
        .I4(\operand_b_set_reg_n_0_[8] ),
        .I5(s_axi_control_ARADDR[4]),
        .O(\rdata[8]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'h0000A808)) 
    \rdata[9]_i_1 
       (.I0(s_axi_control_ARADDR[6]),
        .I1(\rdata[9]_i_2_n_0 ),
        .I2(s_axi_control_ARADDR[2]),
        .I3(\rdata[9]_i_3_n_0 ),
        .I4(s_axi_control_ARADDR[0]),
        .O(\rdata[9]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0088008830333000)) 
    \rdata[9]_i_2 
       (.I0(\result_set_reg_n_0_[9] ),
        .I1(s_axi_control_ARADDR[5]),
        .I2(p_1_in1_in[9]),
        .I3(s_axi_control_ARADDR[4]),
        .I4(\operand_a_set_reg_n_0_[9] ),
        .I5(s_axi_control_ARADDR[3]),
        .O(\rdata[9]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h00000000BB308830)) 
    \rdata[9]_i_3 
       (.I0(p_1_in[9]),
        .I1(s_axi_control_ARADDR[5]),
        .I2(p_1_in3_in[9]),
        .I3(s_axi_control_ARADDR[3]),
        .I4(\operand_b_set_reg_n_0_[9] ),
        .I5(s_axi_control_ARADDR[4]),
        .O(\rdata[9]_i_3_n_0 ));
  FDRE \rdata_reg[0] 
       (.C(ap_clk),
        .CE(\rdata[31]_i_2_n_0 ),
        .D(\rdata[0]_i_1_n_0 ),
        .Q(s_axi_control_RDATA[0]),
        .R(\rdata[31]_i_1_n_0 ));
  MUXF7 \rdata_reg[0]_i_2 
       (.I0(\rdata[0]_i_5_n_0 ),
        .I1(\rdata[0]_i_6_n_0 ),
        .O(\rdata_reg[0]_i_2_n_0 ),
        .S(s_axi_control_ARADDR[5]));
  MUXF7 \rdata_reg[0]_i_3 
       (.I0(\rdata[0]_i_7_n_0 ),
        .I1(\rdata[0]_i_8_n_0 ),
        .O(\rdata_reg[0]_i_3_n_0 ),
        .S(s_axi_control_ARADDR[5]));
  MUXF7 \rdata_reg[0]_i_4 
       (.I0(\rdata[0]_i_9_n_0 ),
        .I1(\rdata[0]_i_10_n_0 ),
        .O(\rdata_reg[0]_i_4_n_0 ),
        .S(s_axi_control_ARADDR[5]));
  FDRE \rdata_reg[10] 
       (.C(ap_clk),
        .CE(\rdata[31]_i_2_n_0 ),
        .D(\rdata[10]_i_1_n_0 ),
        .Q(s_axi_control_RDATA[10]),
        .R(\rdata[31]_i_1_n_0 ));
  FDRE \rdata_reg[11] 
       (.C(ap_clk),
        .CE(\rdata[31]_i_2_n_0 ),
        .D(\rdata[11]_i_1_n_0 ),
        .Q(s_axi_control_RDATA[11]),
        .R(\rdata[31]_i_1_n_0 ));
  FDRE \rdata_reg[12] 
       (.C(ap_clk),
        .CE(\rdata[31]_i_2_n_0 ),
        .D(\rdata[12]_i_1_n_0 ),
        .Q(s_axi_control_RDATA[12]),
        .R(\rdata[31]_i_1_n_0 ));
  FDRE \rdata_reg[13] 
       (.C(ap_clk),
        .CE(\rdata[31]_i_2_n_0 ),
        .D(\rdata[13]_i_1_n_0 ),
        .Q(s_axi_control_RDATA[13]),
        .R(\rdata[31]_i_1_n_0 ));
  FDRE \rdata_reg[14] 
       (.C(ap_clk),
        .CE(\rdata[31]_i_2_n_0 ),
        .D(\rdata[14]_i_1_n_0 ),
        .Q(s_axi_control_RDATA[14]),
        .R(\rdata[31]_i_1_n_0 ));
  FDRE \rdata_reg[15] 
       (.C(ap_clk),
        .CE(\rdata[31]_i_2_n_0 ),
        .D(\rdata[15]_i_1_n_0 ),
        .Q(s_axi_control_RDATA[15]),
        .R(\rdata[31]_i_1_n_0 ));
  FDRE \rdata_reg[16] 
       (.C(ap_clk),
        .CE(\rdata[31]_i_2_n_0 ),
        .D(\rdata[16]_i_1_n_0 ),
        .Q(s_axi_control_RDATA[16]),
        .R(\rdata[31]_i_1_n_0 ));
  FDRE \rdata_reg[17] 
       (.C(ap_clk),
        .CE(\rdata[31]_i_2_n_0 ),
        .D(\rdata[17]_i_1_n_0 ),
        .Q(s_axi_control_RDATA[17]),
        .R(\rdata[31]_i_1_n_0 ));
  FDRE \rdata_reg[18] 
       (.C(ap_clk),
        .CE(\rdata[31]_i_2_n_0 ),
        .D(\rdata[18]_i_1_n_0 ),
        .Q(s_axi_control_RDATA[18]),
        .R(\rdata[31]_i_1_n_0 ));
  FDRE \rdata_reg[19] 
       (.C(ap_clk),
        .CE(\rdata[31]_i_2_n_0 ),
        .D(\rdata[19]_i_1_n_0 ),
        .Q(s_axi_control_RDATA[19]),
        .R(\rdata[31]_i_1_n_0 ));
  FDRE \rdata_reg[1] 
       (.C(ap_clk),
        .CE(\rdata[31]_i_2_n_0 ),
        .D(\rdata[1]_i_1_n_0 ),
        .Q(s_axi_control_RDATA[1]),
        .R(\rdata[31]_i_1_n_0 ));
  MUXF7 \rdata_reg[1]_i_3 
       (.I0(\rdata[1]_i_5_n_0 ),
        .I1(\rdata[1]_i_6_n_0 ),
        .O(\rdata_reg[1]_i_3_n_0 ),
        .S(s_axi_control_ARADDR[5]));
  MUXF7 \rdata_reg[1]_i_4 
       (.I0(\rdata[1]_i_7_n_0 ),
        .I1(\rdata[1]_i_8_n_0 ),
        .O(\rdata_reg[1]_i_4_n_0 ),
        .S(s_axi_control_ARADDR[5]));
  FDRE \rdata_reg[20] 
       (.C(ap_clk),
        .CE(\rdata[31]_i_2_n_0 ),
        .D(\rdata[20]_i_1_n_0 ),
        .Q(s_axi_control_RDATA[20]),
        .R(\rdata[31]_i_1_n_0 ));
  FDRE \rdata_reg[21] 
       (.C(ap_clk),
        .CE(\rdata[31]_i_2_n_0 ),
        .D(\rdata[21]_i_1_n_0 ),
        .Q(s_axi_control_RDATA[21]),
        .R(\rdata[31]_i_1_n_0 ));
  FDRE \rdata_reg[22] 
       (.C(ap_clk),
        .CE(\rdata[31]_i_2_n_0 ),
        .D(\rdata[22]_i_1_n_0 ),
        .Q(s_axi_control_RDATA[22]),
        .R(\rdata[31]_i_1_n_0 ));
  FDRE \rdata_reg[23] 
       (.C(ap_clk),
        .CE(\rdata[31]_i_2_n_0 ),
        .D(\rdata[23]_i_1_n_0 ),
        .Q(s_axi_control_RDATA[23]),
        .R(\rdata[31]_i_1_n_0 ));
  FDRE \rdata_reg[24] 
       (.C(ap_clk),
        .CE(\rdata[31]_i_2_n_0 ),
        .D(\rdata[24]_i_1_n_0 ),
        .Q(s_axi_control_RDATA[24]),
        .R(\rdata[31]_i_1_n_0 ));
  FDRE \rdata_reg[25] 
       (.C(ap_clk),
        .CE(\rdata[31]_i_2_n_0 ),
        .D(\rdata[25]_i_1_n_0 ),
        .Q(s_axi_control_RDATA[25]),
        .R(\rdata[31]_i_1_n_0 ));
  FDRE \rdata_reg[26] 
       (.C(ap_clk),
        .CE(\rdata[31]_i_2_n_0 ),
        .D(\rdata[26]_i_1_n_0 ),
        .Q(s_axi_control_RDATA[26]),
        .R(\rdata[31]_i_1_n_0 ));
  FDRE \rdata_reg[27] 
       (.C(ap_clk),
        .CE(\rdata[31]_i_2_n_0 ),
        .D(\rdata[27]_i_1_n_0 ),
        .Q(s_axi_control_RDATA[27]),
        .R(\rdata[31]_i_1_n_0 ));
  FDRE \rdata_reg[28] 
       (.C(ap_clk),
        .CE(\rdata[31]_i_2_n_0 ),
        .D(\rdata[28]_i_1_n_0 ),
        .Q(s_axi_control_RDATA[28]),
        .R(\rdata[31]_i_1_n_0 ));
  FDRE \rdata_reg[29] 
       (.C(ap_clk),
        .CE(\rdata[31]_i_2_n_0 ),
        .D(\rdata[29]_i_1_n_0 ),
        .Q(s_axi_control_RDATA[29]),
        .R(\rdata[31]_i_1_n_0 ));
  FDRE \rdata_reg[2] 
       (.C(ap_clk),
        .CE(\rdata[31]_i_2_n_0 ),
        .D(\rdata[2]_i_1_n_0 ),
        .Q(s_axi_control_RDATA[2]),
        .R(\rdata[31]_i_1_n_0 ));
  MUXF7 \rdata_reg[2]_i_3 
       (.I0(\rdata[2]_i_4_n_0 ),
        .I1(\rdata[2]_i_5_n_0 ),
        .O(\rdata_reg[2]_i_3_n_0 ),
        .S(s_axi_control_ARADDR[5]));
  FDRE \rdata_reg[30] 
       (.C(ap_clk),
        .CE(\rdata[31]_i_2_n_0 ),
        .D(\rdata[30]_i_1_n_0 ),
        .Q(s_axi_control_RDATA[30]),
        .R(\rdata[31]_i_1_n_0 ));
  FDRE \rdata_reg[31] 
       (.C(ap_clk),
        .CE(\rdata[31]_i_2_n_0 ),
        .D(\rdata[31]_i_3_n_0 ),
        .Q(s_axi_control_RDATA[31]),
        .R(\rdata[31]_i_1_n_0 ));
  FDRE \rdata_reg[3] 
       (.C(ap_clk),
        .CE(\rdata[31]_i_2_n_0 ),
        .D(\rdata[3]_i_1_n_0 ),
        .Q(s_axi_control_RDATA[3]),
        .R(\rdata[31]_i_1_n_0 ));
  MUXF7 \rdata_reg[3]_i_3 
       (.I0(\rdata[3]_i_4_n_0 ),
        .I1(\rdata[3]_i_5_n_0 ),
        .O(\rdata_reg[3]_i_3_n_0 ),
        .S(s_axi_control_ARADDR[5]));
  FDRE \rdata_reg[4] 
       (.C(ap_clk),
        .CE(\rdata[31]_i_2_n_0 ),
        .D(\rdata[4]_i_1_n_0 ),
        .Q(s_axi_control_RDATA[4]),
        .R(\rdata[31]_i_1_n_0 ));
  MUXF7 \rdata_reg[4]_i_3 
       (.I0(\rdata[4]_i_4_n_0 ),
        .I1(\rdata[4]_i_5_n_0 ),
        .O(\rdata_reg[4]_i_3_n_0 ),
        .S(s_axi_control_ARADDR[5]));
  FDRE \rdata_reg[5] 
       (.C(ap_clk),
        .CE(\rdata[31]_i_2_n_0 ),
        .D(\rdata[5]_i_1_n_0 ),
        .Q(s_axi_control_RDATA[5]),
        .R(\rdata[31]_i_1_n_0 ));
  FDRE \rdata_reg[6] 
       (.C(ap_clk),
        .CE(\rdata[31]_i_2_n_0 ),
        .D(\rdata[6]_i_1_n_0 ),
        .Q(s_axi_control_RDATA[6]),
        .R(\rdata[31]_i_1_n_0 ));
  FDRE \rdata_reg[7] 
       (.C(ap_clk),
        .CE(\rdata[31]_i_2_n_0 ),
        .D(\rdata[7]_i_1_n_0 ),
        .Q(s_axi_control_RDATA[7]),
        .R(\rdata[31]_i_1_n_0 ));
  FDRE \rdata_reg[8] 
       (.C(ap_clk),
        .CE(\rdata[31]_i_2_n_0 ),
        .D(\rdata[8]_i_1_n_0 ),
        .Q(s_axi_control_RDATA[8]),
        .R(\rdata[31]_i_1_n_0 ));
  FDRE \rdata_reg[9] 
       (.C(ap_clk),
        .CE(\rdata[31]_i_2_n_0 ),
        .D(\rdata[9]_i_1_n_0 ),
        .Q(s_axi_control_RDATA[9]),
        .R(\rdata[31]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair69" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \result_set[0]_i_1 
       (.I0(s_axi_control_WDATA[0]),
        .I1(s_axi_control_WSTRB[0]),
        .I2(\result_set_reg_n_0_[0] ),
        .O(result_set_reg01_out[0]));
  (* SOFT_HLUTNM = "soft_lutpair91" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \result_set[10]_i_1 
       (.I0(s_axi_control_WDATA[10]),
        .I1(s_axi_control_WSTRB[1]),
        .I2(\result_set_reg_n_0_[10] ),
        .O(result_set_reg01_out[10]));
  (* SOFT_HLUTNM = "soft_lutpair90" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \result_set[11]_i_1 
       (.I0(s_axi_control_WDATA[11]),
        .I1(s_axi_control_WSTRB[1]),
        .I2(\result_set_reg_n_0_[11] ),
        .O(result_set_reg01_out[11]));
  (* SOFT_HLUTNM = "soft_lutpair89" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \result_set[12]_i_1 
       (.I0(s_axi_control_WDATA[12]),
        .I1(s_axi_control_WSTRB[1]),
        .I2(\result_set_reg_n_0_[12] ),
        .O(result_set_reg01_out[12]));
  (* SOFT_HLUTNM = "soft_lutpair88" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \result_set[13]_i_1 
       (.I0(s_axi_control_WDATA[13]),
        .I1(s_axi_control_WSTRB[1]),
        .I2(\result_set_reg_n_0_[13] ),
        .O(result_set_reg01_out[13]));
  (* SOFT_HLUTNM = "soft_lutpair87" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \result_set[14]_i_1 
       (.I0(s_axi_control_WDATA[14]),
        .I1(s_axi_control_WSTRB[1]),
        .I2(\result_set_reg_n_0_[14] ),
        .O(result_set_reg01_out[14]));
  (* SOFT_HLUTNM = "soft_lutpair86" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \result_set[15]_i_1 
       (.I0(s_axi_control_WDATA[15]),
        .I1(s_axi_control_WSTRB[1]),
        .I2(\result_set_reg_n_0_[15] ),
        .O(result_set_reg01_out[15]));
  (* SOFT_HLUTNM = "soft_lutpair85" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \result_set[16]_i_1 
       (.I0(s_axi_control_WDATA[16]),
        .I1(s_axi_control_WSTRB[2]),
        .I2(\result_set_reg_n_0_[16] ),
        .O(result_set_reg01_out[16]));
  (* SOFT_HLUTNM = "soft_lutpair84" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \result_set[17]_i_1 
       (.I0(s_axi_control_WDATA[17]),
        .I1(s_axi_control_WSTRB[2]),
        .I2(\result_set_reg_n_0_[17] ),
        .O(result_set_reg01_out[17]));
  (* SOFT_HLUTNM = "soft_lutpair83" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \result_set[18]_i_1 
       (.I0(s_axi_control_WDATA[18]),
        .I1(s_axi_control_WSTRB[2]),
        .I2(\result_set_reg_n_0_[18] ),
        .O(result_set_reg01_out[18]));
  (* SOFT_HLUTNM = "soft_lutpair82" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \result_set[19]_i_1 
       (.I0(s_axi_control_WDATA[19]),
        .I1(s_axi_control_WSTRB[2]),
        .I2(\result_set_reg_n_0_[19] ),
        .O(result_set_reg01_out[19]));
  (* SOFT_HLUTNM = "soft_lutpair68" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \result_set[1]_i_1 
       (.I0(s_axi_control_WDATA[1]),
        .I1(s_axi_control_WSTRB[0]),
        .I2(\result_set_reg_n_0_[1] ),
        .O(result_set_reg01_out[1]));
  (* SOFT_HLUTNM = "soft_lutpair81" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \result_set[20]_i_1 
       (.I0(s_axi_control_WDATA[20]),
        .I1(s_axi_control_WSTRB[2]),
        .I2(\result_set_reg_n_0_[20] ),
        .O(result_set_reg01_out[20]));
  (* SOFT_HLUTNM = "soft_lutpair80" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \result_set[21]_i_1 
       (.I0(s_axi_control_WDATA[21]),
        .I1(s_axi_control_WSTRB[2]),
        .I2(\result_set_reg_n_0_[21] ),
        .O(result_set_reg01_out[21]));
  (* SOFT_HLUTNM = "soft_lutpair79" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \result_set[22]_i_1 
       (.I0(s_axi_control_WDATA[22]),
        .I1(s_axi_control_WSTRB[2]),
        .I2(\result_set_reg_n_0_[22] ),
        .O(result_set_reg01_out[22]));
  (* SOFT_HLUTNM = "soft_lutpair78" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \result_set[23]_i_1 
       (.I0(s_axi_control_WDATA[23]),
        .I1(s_axi_control_WSTRB[2]),
        .I2(\result_set_reg_n_0_[23] ),
        .O(result_set_reg01_out[23]));
  (* SOFT_HLUTNM = "soft_lutpair77" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \result_set[24]_i_1 
       (.I0(s_axi_control_WDATA[24]),
        .I1(s_axi_control_WSTRB[3]),
        .I2(\result_set_reg_n_0_[24] ),
        .O(result_set_reg01_out[24]));
  (* SOFT_HLUTNM = "soft_lutpair76" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \result_set[25]_i_1 
       (.I0(s_axi_control_WDATA[25]),
        .I1(s_axi_control_WSTRB[3]),
        .I2(\result_set_reg_n_0_[25] ),
        .O(result_set_reg01_out[25]));
  (* SOFT_HLUTNM = "soft_lutpair75" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \result_set[26]_i_1 
       (.I0(s_axi_control_WDATA[26]),
        .I1(s_axi_control_WSTRB[3]),
        .I2(\result_set_reg_n_0_[26] ),
        .O(result_set_reg01_out[26]));
  (* SOFT_HLUTNM = "soft_lutpair74" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \result_set[27]_i_1 
       (.I0(s_axi_control_WDATA[27]),
        .I1(s_axi_control_WSTRB[3]),
        .I2(\result_set_reg_n_0_[27] ),
        .O(result_set_reg01_out[27]));
  (* SOFT_HLUTNM = "soft_lutpair73" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \result_set[28]_i_1 
       (.I0(s_axi_control_WDATA[28]),
        .I1(s_axi_control_WSTRB[3]),
        .I2(\result_set_reg_n_0_[28] ),
        .O(result_set_reg01_out[28]));
  (* SOFT_HLUTNM = "soft_lutpair72" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \result_set[29]_i_1 
       (.I0(s_axi_control_WDATA[29]),
        .I1(s_axi_control_WSTRB[3]),
        .I2(\result_set_reg_n_0_[29] ),
        .O(result_set_reg01_out[29]));
  (* SOFT_HLUTNM = "soft_lutpair99" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \result_set[2]_i_1 
       (.I0(s_axi_control_WDATA[2]),
        .I1(s_axi_control_WSTRB[0]),
        .I2(\result_set_reg_n_0_[2] ),
        .O(result_set_reg01_out[2]));
  (* SOFT_HLUTNM = "soft_lutpair71" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \result_set[30]_i_1 
       (.I0(s_axi_control_WDATA[30]),
        .I1(s_axi_control_WSTRB[3]),
        .I2(\result_set_reg_n_0_[30] ),
        .O(result_set_reg01_out[30]));
  LUT5 #(
    .INIT(32'h00000800)) 
    \result_set[31]_i_1 
       (.I0(waddr[3]),
        .I1(\operand_a_set[31]_i_3_n_0 ),
        .I2(waddr[2]),
        .I3(waddr[5]),
        .I4(waddr[4]),
        .O(\result_set[31]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair70" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \result_set[31]_i_2 
       (.I0(s_axi_control_WDATA[31]),
        .I1(s_axi_control_WSTRB[3]),
        .I2(\result_set_reg_n_0_[31] ),
        .O(result_set_reg01_out[31]));
  (* SOFT_HLUTNM = "soft_lutpair101" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \result_set[32]_i_1 
       (.I0(s_axi_control_WDATA[0]),
        .I1(s_axi_control_WSTRB[0]),
        .I2(p_1_in[0]),
        .O(result_set_reg0[0]));
  (* SOFT_HLUTNM = "soft_lutpair100" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \result_set[33]_i_1 
       (.I0(s_axi_control_WDATA[1]),
        .I1(s_axi_control_WSTRB[0]),
        .I2(p_1_in[1]),
        .O(result_set_reg0[1]));
  (* SOFT_HLUTNM = "soft_lutpair99" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \result_set[34]_i_1 
       (.I0(s_axi_control_WDATA[2]),
        .I1(s_axi_control_WSTRB[0]),
        .I2(p_1_in[2]),
        .O(result_set_reg0[2]));
  (* SOFT_HLUTNM = "soft_lutpair98" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \result_set[35]_i_1 
       (.I0(s_axi_control_WDATA[3]),
        .I1(s_axi_control_WSTRB[0]),
        .I2(p_1_in[3]),
        .O(result_set_reg0[3]));
  (* SOFT_HLUTNM = "soft_lutpair97" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \result_set[36]_i_1 
       (.I0(s_axi_control_WDATA[4]),
        .I1(s_axi_control_WSTRB[0]),
        .I2(p_1_in[4]),
        .O(result_set_reg0[4]));
  (* SOFT_HLUTNM = "soft_lutpair96" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \result_set[37]_i_1 
       (.I0(s_axi_control_WDATA[5]),
        .I1(s_axi_control_WSTRB[0]),
        .I2(p_1_in[5]),
        .O(result_set_reg0[5]));
  (* SOFT_HLUTNM = "soft_lutpair95" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \result_set[38]_i_1 
       (.I0(s_axi_control_WDATA[6]),
        .I1(s_axi_control_WSTRB[0]),
        .I2(p_1_in[6]),
        .O(result_set_reg0[6]));
  (* SOFT_HLUTNM = "soft_lutpair94" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \result_set[39]_i_1 
       (.I0(s_axi_control_WDATA[7]),
        .I1(s_axi_control_WSTRB[0]),
        .I2(p_1_in[7]),
        .O(result_set_reg0[7]));
  (* SOFT_HLUTNM = "soft_lutpair98" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \result_set[3]_i_1 
       (.I0(s_axi_control_WDATA[3]),
        .I1(s_axi_control_WSTRB[0]),
        .I2(\result_set_reg_n_0_[3] ),
        .O(result_set_reg01_out[3]));
  (* SOFT_HLUTNM = "soft_lutpair93" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \result_set[40]_i_1 
       (.I0(s_axi_control_WDATA[8]),
        .I1(s_axi_control_WSTRB[1]),
        .I2(p_1_in[8]),
        .O(result_set_reg0[8]));
  (* SOFT_HLUTNM = "soft_lutpair92" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \result_set[41]_i_1 
       (.I0(s_axi_control_WDATA[9]),
        .I1(s_axi_control_WSTRB[1]),
        .I2(p_1_in[9]),
        .O(result_set_reg0[9]));
  (* SOFT_HLUTNM = "soft_lutpair91" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \result_set[42]_i_1 
       (.I0(s_axi_control_WDATA[10]),
        .I1(s_axi_control_WSTRB[1]),
        .I2(p_1_in[10]),
        .O(result_set_reg0[10]));
  (* SOFT_HLUTNM = "soft_lutpair90" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \result_set[43]_i_1 
       (.I0(s_axi_control_WDATA[11]),
        .I1(s_axi_control_WSTRB[1]),
        .I2(p_1_in[11]),
        .O(result_set_reg0[11]));
  (* SOFT_HLUTNM = "soft_lutpair89" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \result_set[44]_i_1 
       (.I0(s_axi_control_WDATA[12]),
        .I1(s_axi_control_WSTRB[1]),
        .I2(p_1_in[12]),
        .O(result_set_reg0[12]));
  (* SOFT_HLUTNM = "soft_lutpair88" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \result_set[45]_i_1 
       (.I0(s_axi_control_WDATA[13]),
        .I1(s_axi_control_WSTRB[1]),
        .I2(p_1_in[13]),
        .O(result_set_reg0[13]));
  (* SOFT_HLUTNM = "soft_lutpair87" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \result_set[46]_i_1 
       (.I0(s_axi_control_WDATA[14]),
        .I1(s_axi_control_WSTRB[1]),
        .I2(p_1_in[14]),
        .O(result_set_reg0[14]));
  (* SOFT_HLUTNM = "soft_lutpair86" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \result_set[47]_i_1 
       (.I0(s_axi_control_WDATA[15]),
        .I1(s_axi_control_WSTRB[1]),
        .I2(p_1_in[15]),
        .O(result_set_reg0[15]));
  (* SOFT_HLUTNM = "soft_lutpair85" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \result_set[48]_i_1 
       (.I0(s_axi_control_WDATA[16]),
        .I1(s_axi_control_WSTRB[2]),
        .I2(p_1_in[16]),
        .O(result_set_reg0[16]));
  (* SOFT_HLUTNM = "soft_lutpair84" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \result_set[49]_i_1 
       (.I0(s_axi_control_WDATA[17]),
        .I1(s_axi_control_WSTRB[2]),
        .I2(p_1_in[17]),
        .O(result_set_reg0[17]));
  (* SOFT_HLUTNM = "soft_lutpair97" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \result_set[4]_i_1 
       (.I0(s_axi_control_WDATA[4]),
        .I1(s_axi_control_WSTRB[0]),
        .I2(\result_set_reg_n_0_[4] ),
        .O(result_set_reg01_out[4]));
  (* SOFT_HLUTNM = "soft_lutpair83" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \result_set[50]_i_1 
       (.I0(s_axi_control_WDATA[18]),
        .I1(s_axi_control_WSTRB[2]),
        .I2(p_1_in[18]),
        .O(result_set_reg0[18]));
  (* SOFT_HLUTNM = "soft_lutpair82" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \result_set[51]_i_1 
       (.I0(s_axi_control_WDATA[19]),
        .I1(s_axi_control_WSTRB[2]),
        .I2(p_1_in[19]),
        .O(result_set_reg0[19]));
  (* SOFT_HLUTNM = "soft_lutpair81" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \result_set[52]_i_1 
       (.I0(s_axi_control_WDATA[20]),
        .I1(s_axi_control_WSTRB[2]),
        .I2(p_1_in[20]),
        .O(result_set_reg0[20]));
  (* SOFT_HLUTNM = "soft_lutpair80" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \result_set[53]_i_1 
       (.I0(s_axi_control_WDATA[21]),
        .I1(s_axi_control_WSTRB[2]),
        .I2(p_1_in[21]),
        .O(result_set_reg0[21]));
  (* SOFT_HLUTNM = "soft_lutpair79" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \result_set[54]_i_1 
       (.I0(s_axi_control_WDATA[22]),
        .I1(s_axi_control_WSTRB[2]),
        .I2(p_1_in[22]),
        .O(result_set_reg0[22]));
  (* SOFT_HLUTNM = "soft_lutpair78" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \result_set[55]_i_1 
       (.I0(s_axi_control_WDATA[23]),
        .I1(s_axi_control_WSTRB[2]),
        .I2(p_1_in[23]),
        .O(result_set_reg0[23]));
  (* SOFT_HLUTNM = "soft_lutpair77" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \result_set[56]_i_1 
       (.I0(s_axi_control_WDATA[24]),
        .I1(s_axi_control_WSTRB[3]),
        .I2(p_1_in[24]),
        .O(result_set_reg0[24]));
  (* SOFT_HLUTNM = "soft_lutpair76" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \result_set[57]_i_1 
       (.I0(s_axi_control_WDATA[25]),
        .I1(s_axi_control_WSTRB[3]),
        .I2(p_1_in[25]),
        .O(result_set_reg0[25]));
  (* SOFT_HLUTNM = "soft_lutpair75" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \result_set[58]_i_1 
       (.I0(s_axi_control_WDATA[26]),
        .I1(s_axi_control_WSTRB[3]),
        .I2(p_1_in[26]),
        .O(result_set_reg0[26]));
  (* SOFT_HLUTNM = "soft_lutpair74" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \result_set[59]_i_1 
       (.I0(s_axi_control_WDATA[27]),
        .I1(s_axi_control_WSTRB[3]),
        .I2(p_1_in[27]),
        .O(result_set_reg0[27]));
  (* SOFT_HLUTNM = "soft_lutpair96" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \result_set[5]_i_1 
       (.I0(s_axi_control_WDATA[5]),
        .I1(s_axi_control_WSTRB[0]),
        .I2(\result_set_reg_n_0_[5] ),
        .O(result_set_reg01_out[5]));
  (* SOFT_HLUTNM = "soft_lutpair73" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \result_set[60]_i_1 
       (.I0(s_axi_control_WDATA[28]),
        .I1(s_axi_control_WSTRB[3]),
        .I2(p_1_in[28]),
        .O(result_set_reg0[28]));
  (* SOFT_HLUTNM = "soft_lutpair72" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \result_set[61]_i_1 
       (.I0(s_axi_control_WDATA[29]),
        .I1(s_axi_control_WSTRB[3]),
        .I2(p_1_in[29]),
        .O(result_set_reg0[29]));
  (* SOFT_HLUTNM = "soft_lutpair71" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \result_set[62]_i_1 
       (.I0(s_axi_control_WDATA[30]),
        .I1(s_axi_control_WSTRB[3]),
        .I2(p_1_in[30]),
        .O(result_set_reg0[30]));
  LUT5 #(
    .INIT(32'h00008000)) 
    \result_set[63]_i_1 
       (.I0(waddr[2]),
        .I1(\operand_a_set[31]_i_3_n_0 ),
        .I2(waddr[5]),
        .I3(waddr[3]),
        .I4(waddr[4]),
        .O(\result_set[63]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair70" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \result_set[63]_i_2 
       (.I0(s_axi_control_WDATA[31]),
        .I1(s_axi_control_WSTRB[3]),
        .I2(p_1_in[31]),
        .O(result_set_reg0[31]));
  (* SOFT_HLUTNM = "soft_lutpair95" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \result_set[6]_i_1 
       (.I0(s_axi_control_WDATA[6]),
        .I1(s_axi_control_WSTRB[0]),
        .I2(\result_set_reg_n_0_[6] ),
        .O(result_set_reg01_out[6]));
  (* SOFT_HLUTNM = "soft_lutpair94" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \result_set[7]_i_1 
       (.I0(s_axi_control_WDATA[7]),
        .I1(s_axi_control_WSTRB[0]),
        .I2(\result_set_reg_n_0_[7] ),
        .O(result_set_reg01_out[7]));
  (* SOFT_HLUTNM = "soft_lutpair93" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \result_set[8]_i_1 
       (.I0(s_axi_control_WDATA[8]),
        .I1(s_axi_control_WSTRB[1]),
        .I2(\result_set_reg_n_0_[8] ),
        .O(result_set_reg01_out[8]));
  (* SOFT_HLUTNM = "soft_lutpair92" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \result_set[9]_i_1 
       (.I0(s_axi_control_WDATA[9]),
        .I1(s_axi_control_WSTRB[1]),
        .I2(\result_set_reg_n_0_[9] ),
        .O(result_set_reg01_out[9]));
  FDRE #(
    .INIT(1'b0)) 
    \result_set_reg[0] 
       (.C(ap_clk),
        .CE(\result_set[31]_i_1_n_0 ),
        .D(result_set_reg01_out[0]),
        .Q(\result_set_reg_n_0_[0] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \result_set_reg[10] 
       (.C(ap_clk),
        .CE(\result_set[31]_i_1_n_0 ),
        .D(result_set_reg01_out[10]),
        .Q(\result_set_reg_n_0_[10] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \result_set_reg[11] 
       (.C(ap_clk),
        .CE(\result_set[31]_i_1_n_0 ),
        .D(result_set_reg01_out[11]),
        .Q(\result_set_reg_n_0_[11] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \result_set_reg[12] 
       (.C(ap_clk),
        .CE(\result_set[31]_i_1_n_0 ),
        .D(result_set_reg01_out[12]),
        .Q(\result_set_reg_n_0_[12] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \result_set_reg[13] 
       (.C(ap_clk),
        .CE(\result_set[31]_i_1_n_0 ),
        .D(result_set_reg01_out[13]),
        .Q(\result_set_reg_n_0_[13] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \result_set_reg[14] 
       (.C(ap_clk),
        .CE(\result_set[31]_i_1_n_0 ),
        .D(result_set_reg01_out[14]),
        .Q(\result_set_reg_n_0_[14] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \result_set_reg[15] 
       (.C(ap_clk),
        .CE(\result_set[31]_i_1_n_0 ),
        .D(result_set_reg01_out[15]),
        .Q(\result_set_reg_n_0_[15] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \result_set_reg[16] 
       (.C(ap_clk),
        .CE(\result_set[31]_i_1_n_0 ),
        .D(result_set_reg01_out[16]),
        .Q(\result_set_reg_n_0_[16] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \result_set_reg[17] 
       (.C(ap_clk),
        .CE(\result_set[31]_i_1_n_0 ),
        .D(result_set_reg01_out[17]),
        .Q(\result_set_reg_n_0_[17] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \result_set_reg[18] 
       (.C(ap_clk),
        .CE(\result_set[31]_i_1_n_0 ),
        .D(result_set_reg01_out[18]),
        .Q(\result_set_reg_n_0_[18] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \result_set_reg[19] 
       (.C(ap_clk),
        .CE(\result_set[31]_i_1_n_0 ),
        .D(result_set_reg01_out[19]),
        .Q(\result_set_reg_n_0_[19] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \result_set_reg[1] 
       (.C(ap_clk),
        .CE(\result_set[31]_i_1_n_0 ),
        .D(result_set_reg01_out[1]),
        .Q(\result_set_reg_n_0_[1] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \result_set_reg[20] 
       (.C(ap_clk),
        .CE(\result_set[31]_i_1_n_0 ),
        .D(result_set_reg01_out[20]),
        .Q(\result_set_reg_n_0_[20] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \result_set_reg[21] 
       (.C(ap_clk),
        .CE(\result_set[31]_i_1_n_0 ),
        .D(result_set_reg01_out[21]),
        .Q(\result_set_reg_n_0_[21] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \result_set_reg[22] 
       (.C(ap_clk),
        .CE(\result_set[31]_i_1_n_0 ),
        .D(result_set_reg01_out[22]),
        .Q(\result_set_reg_n_0_[22] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \result_set_reg[23] 
       (.C(ap_clk),
        .CE(\result_set[31]_i_1_n_0 ),
        .D(result_set_reg01_out[23]),
        .Q(\result_set_reg_n_0_[23] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \result_set_reg[24] 
       (.C(ap_clk),
        .CE(\result_set[31]_i_1_n_0 ),
        .D(result_set_reg01_out[24]),
        .Q(\result_set_reg_n_0_[24] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \result_set_reg[25] 
       (.C(ap_clk),
        .CE(\result_set[31]_i_1_n_0 ),
        .D(result_set_reg01_out[25]),
        .Q(\result_set_reg_n_0_[25] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \result_set_reg[26] 
       (.C(ap_clk),
        .CE(\result_set[31]_i_1_n_0 ),
        .D(result_set_reg01_out[26]),
        .Q(\result_set_reg_n_0_[26] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \result_set_reg[27] 
       (.C(ap_clk),
        .CE(\result_set[31]_i_1_n_0 ),
        .D(result_set_reg01_out[27]),
        .Q(\result_set_reg_n_0_[27] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \result_set_reg[28] 
       (.C(ap_clk),
        .CE(\result_set[31]_i_1_n_0 ),
        .D(result_set_reg01_out[28]),
        .Q(\result_set_reg_n_0_[28] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \result_set_reg[29] 
       (.C(ap_clk),
        .CE(\result_set[31]_i_1_n_0 ),
        .D(result_set_reg01_out[29]),
        .Q(\result_set_reg_n_0_[29] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \result_set_reg[2] 
       (.C(ap_clk),
        .CE(\result_set[31]_i_1_n_0 ),
        .D(result_set_reg01_out[2]),
        .Q(\result_set_reg_n_0_[2] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \result_set_reg[30] 
       (.C(ap_clk),
        .CE(\result_set[31]_i_1_n_0 ),
        .D(result_set_reg01_out[30]),
        .Q(\result_set_reg_n_0_[30] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \result_set_reg[31] 
       (.C(ap_clk),
        .CE(\result_set[31]_i_1_n_0 ),
        .D(result_set_reg01_out[31]),
        .Q(\result_set_reg_n_0_[31] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \result_set_reg[32] 
       (.C(ap_clk),
        .CE(\result_set[63]_i_1_n_0 ),
        .D(result_set_reg0[0]),
        .Q(p_1_in[0]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \result_set_reg[33] 
       (.C(ap_clk),
        .CE(\result_set[63]_i_1_n_0 ),
        .D(result_set_reg0[1]),
        .Q(p_1_in[1]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \result_set_reg[34] 
       (.C(ap_clk),
        .CE(\result_set[63]_i_1_n_0 ),
        .D(result_set_reg0[2]),
        .Q(p_1_in[2]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \result_set_reg[35] 
       (.C(ap_clk),
        .CE(\result_set[63]_i_1_n_0 ),
        .D(result_set_reg0[3]),
        .Q(p_1_in[3]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \result_set_reg[36] 
       (.C(ap_clk),
        .CE(\result_set[63]_i_1_n_0 ),
        .D(result_set_reg0[4]),
        .Q(p_1_in[4]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \result_set_reg[37] 
       (.C(ap_clk),
        .CE(\result_set[63]_i_1_n_0 ),
        .D(result_set_reg0[5]),
        .Q(p_1_in[5]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \result_set_reg[38] 
       (.C(ap_clk),
        .CE(\result_set[63]_i_1_n_0 ),
        .D(result_set_reg0[6]),
        .Q(p_1_in[6]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \result_set_reg[39] 
       (.C(ap_clk),
        .CE(\result_set[63]_i_1_n_0 ),
        .D(result_set_reg0[7]),
        .Q(p_1_in[7]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \result_set_reg[3] 
       (.C(ap_clk),
        .CE(\result_set[31]_i_1_n_0 ),
        .D(result_set_reg01_out[3]),
        .Q(\result_set_reg_n_0_[3] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \result_set_reg[40] 
       (.C(ap_clk),
        .CE(\result_set[63]_i_1_n_0 ),
        .D(result_set_reg0[8]),
        .Q(p_1_in[8]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \result_set_reg[41] 
       (.C(ap_clk),
        .CE(\result_set[63]_i_1_n_0 ),
        .D(result_set_reg0[9]),
        .Q(p_1_in[9]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \result_set_reg[42] 
       (.C(ap_clk),
        .CE(\result_set[63]_i_1_n_0 ),
        .D(result_set_reg0[10]),
        .Q(p_1_in[10]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \result_set_reg[43] 
       (.C(ap_clk),
        .CE(\result_set[63]_i_1_n_0 ),
        .D(result_set_reg0[11]),
        .Q(p_1_in[11]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \result_set_reg[44] 
       (.C(ap_clk),
        .CE(\result_set[63]_i_1_n_0 ),
        .D(result_set_reg0[12]),
        .Q(p_1_in[12]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \result_set_reg[45] 
       (.C(ap_clk),
        .CE(\result_set[63]_i_1_n_0 ),
        .D(result_set_reg0[13]),
        .Q(p_1_in[13]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \result_set_reg[46] 
       (.C(ap_clk),
        .CE(\result_set[63]_i_1_n_0 ),
        .D(result_set_reg0[14]),
        .Q(p_1_in[14]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \result_set_reg[47] 
       (.C(ap_clk),
        .CE(\result_set[63]_i_1_n_0 ),
        .D(result_set_reg0[15]),
        .Q(p_1_in[15]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \result_set_reg[48] 
       (.C(ap_clk),
        .CE(\result_set[63]_i_1_n_0 ),
        .D(result_set_reg0[16]),
        .Q(p_1_in[16]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \result_set_reg[49] 
       (.C(ap_clk),
        .CE(\result_set[63]_i_1_n_0 ),
        .D(result_set_reg0[17]),
        .Q(p_1_in[17]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \result_set_reg[4] 
       (.C(ap_clk),
        .CE(\result_set[31]_i_1_n_0 ),
        .D(result_set_reg01_out[4]),
        .Q(\result_set_reg_n_0_[4] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \result_set_reg[50] 
       (.C(ap_clk),
        .CE(\result_set[63]_i_1_n_0 ),
        .D(result_set_reg0[18]),
        .Q(p_1_in[18]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \result_set_reg[51] 
       (.C(ap_clk),
        .CE(\result_set[63]_i_1_n_0 ),
        .D(result_set_reg0[19]),
        .Q(p_1_in[19]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \result_set_reg[52] 
       (.C(ap_clk),
        .CE(\result_set[63]_i_1_n_0 ),
        .D(result_set_reg0[20]),
        .Q(p_1_in[20]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \result_set_reg[53] 
       (.C(ap_clk),
        .CE(\result_set[63]_i_1_n_0 ),
        .D(result_set_reg0[21]),
        .Q(p_1_in[21]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \result_set_reg[54] 
       (.C(ap_clk),
        .CE(\result_set[63]_i_1_n_0 ),
        .D(result_set_reg0[22]),
        .Q(p_1_in[22]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \result_set_reg[55] 
       (.C(ap_clk),
        .CE(\result_set[63]_i_1_n_0 ),
        .D(result_set_reg0[23]),
        .Q(p_1_in[23]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \result_set_reg[56] 
       (.C(ap_clk),
        .CE(\result_set[63]_i_1_n_0 ),
        .D(result_set_reg0[24]),
        .Q(p_1_in[24]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \result_set_reg[57] 
       (.C(ap_clk),
        .CE(\result_set[63]_i_1_n_0 ),
        .D(result_set_reg0[25]),
        .Q(p_1_in[25]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \result_set_reg[58] 
       (.C(ap_clk),
        .CE(\result_set[63]_i_1_n_0 ),
        .D(result_set_reg0[26]),
        .Q(p_1_in[26]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \result_set_reg[59] 
       (.C(ap_clk),
        .CE(\result_set[63]_i_1_n_0 ),
        .D(result_set_reg0[27]),
        .Q(p_1_in[27]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \result_set_reg[5] 
       (.C(ap_clk),
        .CE(\result_set[31]_i_1_n_0 ),
        .D(result_set_reg01_out[5]),
        .Q(\result_set_reg_n_0_[5] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \result_set_reg[60] 
       (.C(ap_clk),
        .CE(\result_set[63]_i_1_n_0 ),
        .D(result_set_reg0[28]),
        .Q(p_1_in[28]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \result_set_reg[61] 
       (.C(ap_clk),
        .CE(\result_set[63]_i_1_n_0 ),
        .D(result_set_reg0[29]),
        .Q(p_1_in[29]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \result_set_reg[62] 
       (.C(ap_clk),
        .CE(\result_set[63]_i_1_n_0 ),
        .D(result_set_reg0[30]),
        .Q(p_1_in[30]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \result_set_reg[63] 
       (.C(ap_clk),
        .CE(\result_set[63]_i_1_n_0 ),
        .D(result_set_reg0[31]),
        .Q(p_1_in[31]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \result_set_reg[6] 
       (.C(ap_clk),
        .CE(\result_set[31]_i_1_n_0 ),
        .D(result_set_reg01_out[6]),
        .Q(\result_set_reg_n_0_[6] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \result_set_reg[7] 
       (.C(ap_clk),
        .CE(\result_set[31]_i_1_n_0 ),
        .D(result_set_reg01_out[7]),
        .Q(\result_set_reg_n_0_[7] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \result_set_reg[8] 
       (.C(ap_clk),
        .CE(\result_set[31]_i_1_n_0 ),
        .D(result_set_reg01_out[8]),
        .Q(\result_set_reg_n_0_[8] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \result_set_reg[9] 
       (.C(ap_clk),
        .CE(\result_set[31]_i_1_n_0 ),
        .D(result_set_reg01_out[9]),
        .Q(\result_set_reg_n_0_[9] ),
        .R(SR));
  LUT5 #(
    .INIT(32'hFFBF0080)) 
    \rst_n_set[0]_i_1 
       (.I0(s_axi_control_WDATA[0]),
        .I1(s_axi_control_WSTRB[0]),
        .I2(\precision_set[1]_i_3_n_0 ),
        .I3(\rst_n_set[0]_i_2_n_0 ),
        .I4(\rst_n_set_reg_n_0_[0] ),
        .O(\rst_n_set[0]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'hF7)) 
    \rst_n_set[0]_i_2 
       (.I0(waddr[4]),
        .I1(waddr[3]),
        .I2(waddr[5]),
        .O(\rst_n_set[0]_i_2_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \rst_n_set_reg[0] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(\rst_n_set[0]_i_1_n_0 ),
        .Q(\rst_n_set_reg_n_0_[0] ),
        .R(SR));
  LUT5 #(
    .INIT(32'hBFFF8000)) 
    \valid_in_set[0]_i_1 
       (.I0(s_axi_control_WDATA[0]),
        .I1(s_axi_control_WSTRB[0]),
        .I2(waddr[3]),
        .I3(\ce_r_set[0]_i_2_n_0 ),
        .I4(\valid_in_set_reg_n_0_[0] ),
        .O(\valid_in_set[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \valid_in_set_reg[0] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(\valid_in_set[0]_i_1_n_0 ),
        .Q(\valid_in_set_reg_n_0_[0] ),
        .R(SR));
  LUT5 #(
    .INIT(32'hBFFF8000)) 
    \valid_out_set[0]_i_1 
       (.I0(s_axi_control_WDATA[0]),
        .I1(s_axi_control_WSTRB[0]),
        .I2(waddr[3]),
        .I3(\valid_out_set[0]_i_2_n_0 ),
        .I4(\valid_out_set_reg_n_0_[0] ),
        .O(\valid_out_set[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000020000000)) 
    \valid_out_set[0]_i_2 
       (.I0(waddr[4]),
        .I1(waddr[5]),
        .I2(s_axi_control_WVALID),
        .I3(\FSM_onehot_wstate_reg[2]_0 ),
        .I4(waddr[6]),
        .I5(waddr[2]),
        .O(\valid_out_set[0]_i_2_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \valid_out_set_reg[0] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(\valid_out_set[0]_i_1_n_0 ),
        .Q(\valid_out_set_reg_n_0_[0] ),
        .R(SR));
  LUT2 #(
    .INIT(4'h8)) 
    \waddr[6]_i_1 
       (.I0(s_axi_control_AWVALID),
        .I1(\FSM_onehot_wstate_reg[1]_0 ),
        .O(waddr2_out));
  FDRE \waddr_reg[2] 
       (.C(ap_clk),
        .CE(waddr2_out),
        .D(s_axi_control_AWADDR[0]),
        .Q(waddr[2]),
        .R(1'b0));
  FDRE \waddr_reg[3] 
       (.C(ap_clk),
        .CE(waddr2_out),
        .D(s_axi_control_AWADDR[1]),
        .Q(waddr[3]),
        .R(1'b0));
  FDRE \waddr_reg[4] 
       (.C(ap_clk),
        .CE(waddr2_out),
        .D(s_axi_control_AWADDR[2]),
        .Q(waddr[4]),
        .R(1'b0));
  FDRE \waddr_reg[5] 
       (.C(ap_clk),
        .CE(waddr2_out),
        .D(s_axi_control_AWADDR[3]),
        .Q(waddr[5]),
        .R(1'b0));
  FDRE \waddr_reg[6] 
       (.C(ap_clk),
        .CE(waddr2_out),
        .D(s_axi_control_AWADDR[4]),
        .Q(waddr[6]),
        .R(1'b0));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
