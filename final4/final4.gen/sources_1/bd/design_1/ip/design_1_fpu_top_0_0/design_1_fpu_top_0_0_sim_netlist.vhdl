-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2024.1 (win64) Build 5076996 Wed May 22 18:37:14 MDT 2024
-- Date        : Thu Apr 23 13:42:00 2026
-- Host        : Caverna running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim
--               c:/Users/umbre/Downloads/final4/final4.gen/sources_1/bd/design_1/ip/design_1_fpu_top_0_0/design_1_fpu_top_0_0_sim_netlist.vhdl
-- Design      : design_1_fpu_top_0_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xck26-sfvc784-2LV-c
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_fpu_top_0_0_fpu_top_control_s_axi is
  port (
    \FSM_onehot_wstate_reg[2]_0\ : out STD_LOGIC;
    s_axi_control_BVALID : out STD_LOGIC;
    \FSM_onehot_wstate_reg[1]_0\ : out STD_LOGIC;
    s_axi_control_RVALID : out STD_LOGIC;
    \FSM_onehot_rstate_reg[1]_0\ : out STD_LOGIC;
    s_axi_control_RDATA : out STD_LOGIC_VECTOR ( 31 downto 0 );
    SR : in STD_LOGIC_VECTOR ( 0 to 0 );
    ap_clk : in STD_LOGIC;
    s_axi_control_WDATA : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_control_WSTRB : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_control_WVALID : in STD_LOGIC;
    s_axi_control_AWADDR : in STD_LOGIC_VECTOR ( 4 downto 0 );
    s_axi_control_ARADDR : in STD_LOGIC_VECTOR ( 6 downto 0 );
    s_axi_control_ARVALID : in STD_LOGIC;
    s_axi_control_AWVALID : in STD_LOGIC;
    s_axi_control_BREADY : in STD_LOGIC;
    s_axi_control_RREADY : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of design_1_fpu_top_0_0_fpu_top_control_s_axi : entity is "fpu_top_control_s_axi";
end design_1_fpu_top_0_0_fpu_top_control_s_axi;

architecture STRUCTURE of design_1_fpu_top_0_0_fpu_top_control_s_axi is
  signal \FSM_onehot_rstate[1]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_onehot_rstate[2]_i_1_n_0\ : STD_LOGIC;
  signal \^fsm_onehot_rstate_reg[1]_0\ : STD_LOGIC;
  signal \FSM_onehot_wstate[1]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_onehot_wstate[2]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_onehot_wstate[3]_i_1_n_0\ : STD_LOGIC;
  signal \^fsm_onehot_wstate_reg[1]_0\ : STD_LOGIC;
  signal \^fsm_onehot_wstate_reg[2]_0\ : STD_LOGIC;
  signal \ce_r_set[0]_i_1_n_0\ : STD_LOGIC;
  signal \ce_r_set[0]_i_2_n_0\ : STD_LOGIC;
  signal \ce_r_set_reg_n_0_[0]\ : STD_LOGIC;
  signal \exceptions_set[0]_i_1_n_0\ : STD_LOGIC;
  signal \exceptions_set[1]_i_1_n_0\ : STD_LOGIC;
  signal \exceptions_set[2]_i_1_n_0\ : STD_LOGIC;
  signal \exceptions_set[3]_i_1_n_0\ : STD_LOGIC;
  signal \exceptions_set[4]_i_1_n_0\ : STD_LOGIC;
  signal \exceptions_set[4]_i_2_n_0\ : STD_LOGIC;
  signal \exceptions_set_reg_n_0_[0]\ : STD_LOGIC;
  signal \exceptions_set_reg_n_0_[1]\ : STD_LOGIC;
  signal \exceptions_set_reg_n_0_[2]\ : STD_LOGIC;
  signal \exceptions_set_reg_n_0_[3]\ : STD_LOGIC;
  signal \exceptions_set_reg_n_0_[4]\ : STD_LOGIC;
  signal op_set0 : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \op_set[1]_i_1_n_0\ : STD_LOGIC;
  signal \op_set_reg_n_0_[0]\ : STD_LOGIC;
  signal \op_set_reg_n_0_[1]\ : STD_LOGIC;
  signal \operand_a_set[31]_i_1_n_0\ : STD_LOGIC;
  signal \operand_a_set[31]_i_3_n_0\ : STD_LOGIC;
  signal \operand_a_set[63]_i_1_n_0\ : STD_LOGIC;
  signal operand_a_set_reg0 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal operand_a_set_reg06_out : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \operand_a_set_reg_n_0_[0]\ : STD_LOGIC;
  signal \operand_a_set_reg_n_0_[10]\ : STD_LOGIC;
  signal \operand_a_set_reg_n_0_[11]\ : STD_LOGIC;
  signal \operand_a_set_reg_n_0_[12]\ : STD_LOGIC;
  signal \operand_a_set_reg_n_0_[13]\ : STD_LOGIC;
  signal \operand_a_set_reg_n_0_[14]\ : STD_LOGIC;
  signal \operand_a_set_reg_n_0_[15]\ : STD_LOGIC;
  signal \operand_a_set_reg_n_0_[16]\ : STD_LOGIC;
  signal \operand_a_set_reg_n_0_[17]\ : STD_LOGIC;
  signal \operand_a_set_reg_n_0_[18]\ : STD_LOGIC;
  signal \operand_a_set_reg_n_0_[19]\ : STD_LOGIC;
  signal \operand_a_set_reg_n_0_[1]\ : STD_LOGIC;
  signal \operand_a_set_reg_n_0_[20]\ : STD_LOGIC;
  signal \operand_a_set_reg_n_0_[21]\ : STD_LOGIC;
  signal \operand_a_set_reg_n_0_[22]\ : STD_LOGIC;
  signal \operand_a_set_reg_n_0_[23]\ : STD_LOGIC;
  signal \operand_a_set_reg_n_0_[24]\ : STD_LOGIC;
  signal \operand_a_set_reg_n_0_[25]\ : STD_LOGIC;
  signal \operand_a_set_reg_n_0_[26]\ : STD_LOGIC;
  signal \operand_a_set_reg_n_0_[27]\ : STD_LOGIC;
  signal \operand_a_set_reg_n_0_[28]\ : STD_LOGIC;
  signal \operand_a_set_reg_n_0_[29]\ : STD_LOGIC;
  signal \operand_a_set_reg_n_0_[2]\ : STD_LOGIC;
  signal \operand_a_set_reg_n_0_[30]\ : STD_LOGIC;
  signal \operand_a_set_reg_n_0_[31]\ : STD_LOGIC;
  signal \operand_a_set_reg_n_0_[3]\ : STD_LOGIC;
  signal \operand_a_set_reg_n_0_[4]\ : STD_LOGIC;
  signal \operand_a_set_reg_n_0_[5]\ : STD_LOGIC;
  signal \operand_a_set_reg_n_0_[6]\ : STD_LOGIC;
  signal \operand_a_set_reg_n_0_[7]\ : STD_LOGIC;
  signal \operand_a_set_reg_n_0_[8]\ : STD_LOGIC;
  signal \operand_a_set_reg_n_0_[9]\ : STD_LOGIC;
  signal \operand_b_set[31]_i_1_n_0\ : STD_LOGIC;
  signal \operand_b_set[63]_i_1_n_0\ : STD_LOGIC;
  signal operand_b_set_reg0 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal operand_b_set_reg03_out : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \operand_b_set_reg_n_0_[0]\ : STD_LOGIC;
  signal \operand_b_set_reg_n_0_[10]\ : STD_LOGIC;
  signal \operand_b_set_reg_n_0_[11]\ : STD_LOGIC;
  signal \operand_b_set_reg_n_0_[12]\ : STD_LOGIC;
  signal \operand_b_set_reg_n_0_[13]\ : STD_LOGIC;
  signal \operand_b_set_reg_n_0_[14]\ : STD_LOGIC;
  signal \operand_b_set_reg_n_0_[15]\ : STD_LOGIC;
  signal \operand_b_set_reg_n_0_[16]\ : STD_LOGIC;
  signal \operand_b_set_reg_n_0_[17]\ : STD_LOGIC;
  signal \operand_b_set_reg_n_0_[18]\ : STD_LOGIC;
  signal \operand_b_set_reg_n_0_[19]\ : STD_LOGIC;
  signal \operand_b_set_reg_n_0_[1]\ : STD_LOGIC;
  signal \operand_b_set_reg_n_0_[20]\ : STD_LOGIC;
  signal \operand_b_set_reg_n_0_[21]\ : STD_LOGIC;
  signal \operand_b_set_reg_n_0_[22]\ : STD_LOGIC;
  signal \operand_b_set_reg_n_0_[23]\ : STD_LOGIC;
  signal \operand_b_set_reg_n_0_[24]\ : STD_LOGIC;
  signal \operand_b_set_reg_n_0_[25]\ : STD_LOGIC;
  signal \operand_b_set_reg_n_0_[26]\ : STD_LOGIC;
  signal \operand_b_set_reg_n_0_[27]\ : STD_LOGIC;
  signal \operand_b_set_reg_n_0_[28]\ : STD_LOGIC;
  signal \operand_b_set_reg_n_0_[29]\ : STD_LOGIC;
  signal \operand_b_set_reg_n_0_[2]\ : STD_LOGIC;
  signal \operand_b_set_reg_n_0_[30]\ : STD_LOGIC;
  signal \operand_b_set_reg_n_0_[31]\ : STD_LOGIC;
  signal \operand_b_set_reg_n_0_[3]\ : STD_LOGIC;
  signal \operand_b_set_reg_n_0_[4]\ : STD_LOGIC;
  signal \operand_b_set_reg_n_0_[5]\ : STD_LOGIC;
  signal \operand_b_set_reg_n_0_[6]\ : STD_LOGIC;
  signal \operand_b_set_reg_n_0_[7]\ : STD_LOGIC;
  signal \operand_b_set_reg_n_0_[8]\ : STD_LOGIC;
  signal \operand_b_set_reg_n_0_[9]\ : STD_LOGIC;
  signal p_1_in : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal p_1_in1_in : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal p_1_in3_in : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal precision_out_set0 : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \precision_out_set[1]_i_1_n_0\ : STD_LOGIC;
  signal \precision_out_set_reg_n_0_[0]\ : STD_LOGIC;
  signal \precision_out_set_reg_n_0_[1]\ : STD_LOGIC;
  signal precision_set0 : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \precision_set[1]_i_1_n_0\ : STD_LOGIC;
  signal \precision_set[1]_i_3_n_0\ : STD_LOGIC;
  signal \precision_set_reg_n_0_[0]\ : STD_LOGIC;
  signal \precision_set_reg_n_0_[1]\ : STD_LOGIC;
  signal \rdata[0]_i_10_n_0\ : STD_LOGIC;
  signal \rdata[0]_i_1_n_0\ : STD_LOGIC;
  signal \rdata[0]_i_5_n_0\ : STD_LOGIC;
  signal \rdata[0]_i_6_n_0\ : STD_LOGIC;
  signal \rdata[0]_i_7_n_0\ : STD_LOGIC;
  signal \rdata[0]_i_8_n_0\ : STD_LOGIC;
  signal \rdata[0]_i_9_n_0\ : STD_LOGIC;
  signal \rdata[10]_i_1_n_0\ : STD_LOGIC;
  signal \rdata[10]_i_2_n_0\ : STD_LOGIC;
  signal \rdata[10]_i_3_n_0\ : STD_LOGIC;
  signal \rdata[11]_i_1_n_0\ : STD_LOGIC;
  signal \rdata[11]_i_2_n_0\ : STD_LOGIC;
  signal \rdata[11]_i_3_n_0\ : STD_LOGIC;
  signal \rdata[12]_i_1_n_0\ : STD_LOGIC;
  signal \rdata[12]_i_2_n_0\ : STD_LOGIC;
  signal \rdata[12]_i_3_n_0\ : STD_LOGIC;
  signal \rdata[13]_i_1_n_0\ : STD_LOGIC;
  signal \rdata[13]_i_2_n_0\ : STD_LOGIC;
  signal \rdata[13]_i_3_n_0\ : STD_LOGIC;
  signal \rdata[14]_i_1_n_0\ : STD_LOGIC;
  signal \rdata[14]_i_2_n_0\ : STD_LOGIC;
  signal \rdata[14]_i_3_n_0\ : STD_LOGIC;
  signal \rdata[15]_i_1_n_0\ : STD_LOGIC;
  signal \rdata[15]_i_2_n_0\ : STD_LOGIC;
  signal \rdata[15]_i_3_n_0\ : STD_LOGIC;
  signal \rdata[16]_i_1_n_0\ : STD_LOGIC;
  signal \rdata[16]_i_2_n_0\ : STD_LOGIC;
  signal \rdata[16]_i_3_n_0\ : STD_LOGIC;
  signal \rdata[17]_i_1_n_0\ : STD_LOGIC;
  signal \rdata[17]_i_2_n_0\ : STD_LOGIC;
  signal \rdata[17]_i_3_n_0\ : STD_LOGIC;
  signal \rdata[18]_i_1_n_0\ : STD_LOGIC;
  signal \rdata[18]_i_2_n_0\ : STD_LOGIC;
  signal \rdata[18]_i_3_n_0\ : STD_LOGIC;
  signal \rdata[19]_i_1_n_0\ : STD_LOGIC;
  signal \rdata[19]_i_2_n_0\ : STD_LOGIC;
  signal \rdata[19]_i_3_n_0\ : STD_LOGIC;
  signal \rdata[1]_i_1_n_0\ : STD_LOGIC;
  signal \rdata[1]_i_2_n_0\ : STD_LOGIC;
  signal \rdata[1]_i_5_n_0\ : STD_LOGIC;
  signal \rdata[1]_i_6_n_0\ : STD_LOGIC;
  signal \rdata[1]_i_7_n_0\ : STD_LOGIC;
  signal \rdata[1]_i_8_n_0\ : STD_LOGIC;
  signal \rdata[20]_i_1_n_0\ : STD_LOGIC;
  signal \rdata[20]_i_2_n_0\ : STD_LOGIC;
  signal \rdata[20]_i_3_n_0\ : STD_LOGIC;
  signal \rdata[21]_i_1_n_0\ : STD_LOGIC;
  signal \rdata[21]_i_2_n_0\ : STD_LOGIC;
  signal \rdata[21]_i_3_n_0\ : STD_LOGIC;
  signal \rdata[22]_i_1_n_0\ : STD_LOGIC;
  signal \rdata[22]_i_2_n_0\ : STD_LOGIC;
  signal \rdata[22]_i_3_n_0\ : STD_LOGIC;
  signal \rdata[23]_i_1_n_0\ : STD_LOGIC;
  signal \rdata[23]_i_2_n_0\ : STD_LOGIC;
  signal \rdata[23]_i_3_n_0\ : STD_LOGIC;
  signal \rdata[24]_i_1_n_0\ : STD_LOGIC;
  signal \rdata[24]_i_2_n_0\ : STD_LOGIC;
  signal \rdata[24]_i_3_n_0\ : STD_LOGIC;
  signal \rdata[25]_i_1_n_0\ : STD_LOGIC;
  signal \rdata[25]_i_2_n_0\ : STD_LOGIC;
  signal \rdata[25]_i_3_n_0\ : STD_LOGIC;
  signal \rdata[26]_i_1_n_0\ : STD_LOGIC;
  signal \rdata[26]_i_2_n_0\ : STD_LOGIC;
  signal \rdata[26]_i_3_n_0\ : STD_LOGIC;
  signal \rdata[27]_i_1_n_0\ : STD_LOGIC;
  signal \rdata[27]_i_2_n_0\ : STD_LOGIC;
  signal \rdata[27]_i_3_n_0\ : STD_LOGIC;
  signal \rdata[28]_i_1_n_0\ : STD_LOGIC;
  signal \rdata[28]_i_2_n_0\ : STD_LOGIC;
  signal \rdata[28]_i_3_n_0\ : STD_LOGIC;
  signal \rdata[29]_i_1_n_0\ : STD_LOGIC;
  signal \rdata[29]_i_2_n_0\ : STD_LOGIC;
  signal \rdata[29]_i_3_n_0\ : STD_LOGIC;
  signal \rdata[2]_i_1_n_0\ : STD_LOGIC;
  signal \rdata[2]_i_2_n_0\ : STD_LOGIC;
  signal \rdata[2]_i_4_n_0\ : STD_LOGIC;
  signal \rdata[2]_i_5_n_0\ : STD_LOGIC;
  signal \rdata[30]_i_1_n_0\ : STD_LOGIC;
  signal \rdata[30]_i_2_n_0\ : STD_LOGIC;
  signal \rdata[30]_i_3_n_0\ : STD_LOGIC;
  signal \rdata[31]_i_1_n_0\ : STD_LOGIC;
  signal \rdata[31]_i_2_n_0\ : STD_LOGIC;
  signal \rdata[31]_i_3_n_0\ : STD_LOGIC;
  signal \rdata[31]_i_4_n_0\ : STD_LOGIC;
  signal \rdata[31]_i_5_n_0\ : STD_LOGIC;
  signal \rdata[3]_i_1_n_0\ : STD_LOGIC;
  signal \rdata[3]_i_2_n_0\ : STD_LOGIC;
  signal \rdata[3]_i_4_n_0\ : STD_LOGIC;
  signal \rdata[3]_i_5_n_0\ : STD_LOGIC;
  signal \rdata[4]_i_1_n_0\ : STD_LOGIC;
  signal \rdata[4]_i_2_n_0\ : STD_LOGIC;
  signal \rdata[4]_i_4_n_0\ : STD_LOGIC;
  signal \rdata[4]_i_5_n_0\ : STD_LOGIC;
  signal \rdata[5]_i_1_n_0\ : STD_LOGIC;
  signal \rdata[5]_i_2_n_0\ : STD_LOGIC;
  signal \rdata[5]_i_3_n_0\ : STD_LOGIC;
  signal \rdata[6]_i_1_n_0\ : STD_LOGIC;
  signal \rdata[6]_i_2_n_0\ : STD_LOGIC;
  signal \rdata[6]_i_3_n_0\ : STD_LOGIC;
  signal \rdata[7]_i_1_n_0\ : STD_LOGIC;
  signal \rdata[7]_i_2_n_0\ : STD_LOGIC;
  signal \rdata[7]_i_3_n_0\ : STD_LOGIC;
  signal \rdata[8]_i_1_n_0\ : STD_LOGIC;
  signal \rdata[8]_i_2_n_0\ : STD_LOGIC;
  signal \rdata[8]_i_3_n_0\ : STD_LOGIC;
  signal \rdata[9]_i_1_n_0\ : STD_LOGIC;
  signal \rdata[9]_i_2_n_0\ : STD_LOGIC;
  signal \rdata[9]_i_3_n_0\ : STD_LOGIC;
  signal \rdata_reg[0]_i_2_n_0\ : STD_LOGIC;
  signal \rdata_reg[0]_i_3_n_0\ : STD_LOGIC;
  signal \rdata_reg[0]_i_4_n_0\ : STD_LOGIC;
  signal \rdata_reg[1]_i_3_n_0\ : STD_LOGIC;
  signal \rdata_reg[1]_i_4_n_0\ : STD_LOGIC;
  signal \rdata_reg[2]_i_3_n_0\ : STD_LOGIC;
  signal \rdata_reg[3]_i_3_n_0\ : STD_LOGIC;
  signal \rdata_reg[4]_i_3_n_0\ : STD_LOGIC;
  signal \result_set[31]_i_1_n_0\ : STD_LOGIC;
  signal \result_set[63]_i_1_n_0\ : STD_LOGIC;
  signal result_set_reg0 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal result_set_reg01_out : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \result_set_reg_n_0_[0]\ : STD_LOGIC;
  signal \result_set_reg_n_0_[10]\ : STD_LOGIC;
  signal \result_set_reg_n_0_[11]\ : STD_LOGIC;
  signal \result_set_reg_n_0_[12]\ : STD_LOGIC;
  signal \result_set_reg_n_0_[13]\ : STD_LOGIC;
  signal \result_set_reg_n_0_[14]\ : STD_LOGIC;
  signal \result_set_reg_n_0_[15]\ : STD_LOGIC;
  signal \result_set_reg_n_0_[16]\ : STD_LOGIC;
  signal \result_set_reg_n_0_[17]\ : STD_LOGIC;
  signal \result_set_reg_n_0_[18]\ : STD_LOGIC;
  signal \result_set_reg_n_0_[19]\ : STD_LOGIC;
  signal \result_set_reg_n_0_[1]\ : STD_LOGIC;
  signal \result_set_reg_n_0_[20]\ : STD_LOGIC;
  signal \result_set_reg_n_0_[21]\ : STD_LOGIC;
  signal \result_set_reg_n_0_[22]\ : STD_LOGIC;
  signal \result_set_reg_n_0_[23]\ : STD_LOGIC;
  signal \result_set_reg_n_0_[24]\ : STD_LOGIC;
  signal \result_set_reg_n_0_[25]\ : STD_LOGIC;
  signal \result_set_reg_n_0_[26]\ : STD_LOGIC;
  signal \result_set_reg_n_0_[27]\ : STD_LOGIC;
  signal \result_set_reg_n_0_[28]\ : STD_LOGIC;
  signal \result_set_reg_n_0_[29]\ : STD_LOGIC;
  signal \result_set_reg_n_0_[2]\ : STD_LOGIC;
  signal \result_set_reg_n_0_[30]\ : STD_LOGIC;
  signal \result_set_reg_n_0_[31]\ : STD_LOGIC;
  signal \result_set_reg_n_0_[3]\ : STD_LOGIC;
  signal \result_set_reg_n_0_[4]\ : STD_LOGIC;
  signal \result_set_reg_n_0_[5]\ : STD_LOGIC;
  signal \result_set_reg_n_0_[6]\ : STD_LOGIC;
  signal \result_set_reg_n_0_[7]\ : STD_LOGIC;
  signal \result_set_reg_n_0_[8]\ : STD_LOGIC;
  signal \result_set_reg_n_0_[9]\ : STD_LOGIC;
  signal \rst_n_set[0]_i_1_n_0\ : STD_LOGIC;
  signal \rst_n_set[0]_i_2_n_0\ : STD_LOGIC;
  signal \rst_n_set_reg_n_0_[0]\ : STD_LOGIC;
  signal \^s_axi_control_bvalid\ : STD_LOGIC;
  signal \^s_axi_control_rvalid\ : STD_LOGIC;
  signal \valid_in_set[0]_i_1_n_0\ : STD_LOGIC;
  signal \valid_in_set_reg_n_0_[0]\ : STD_LOGIC;
  signal \valid_out_set[0]_i_1_n_0\ : STD_LOGIC;
  signal \valid_out_set[0]_i_2_n_0\ : STD_LOGIC;
  signal \valid_out_set_reg_n_0_[0]\ : STD_LOGIC;
  signal waddr : STD_LOGIC_VECTOR ( 6 downto 2 );
  signal waddr2_out : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \FSM_onehot_rstate[1]_i_1\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \FSM_onehot_rstate[2]_i_1\ : label is "soft_lutpair1";
  attribute FSM_ENCODED_STATES : string;
  attribute FSM_ENCODED_STATES of \FSM_onehot_rstate_reg[1]\ : label is "RDIDLE:010,RDDATA:100,iSTATE:001";
  attribute FSM_ENCODED_STATES of \FSM_onehot_rstate_reg[2]\ : label is "RDIDLE:010,RDDATA:100,iSTATE:001";
  attribute FSM_ENCODED_STATES of \FSM_onehot_wstate_reg[1]\ : label is "WRDATA:0100,WRRESP:1000,WRIDLE:0010,iSTATE:0001";
  attribute FSM_ENCODED_STATES of \FSM_onehot_wstate_reg[2]\ : label is "WRDATA:0100,WRRESP:1000,WRIDLE:0010,iSTATE:0001";
  attribute FSM_ENCODED_STATES of \FSM_onehot_wstate_reg[3]\ : label is "WRDATA:0100,WRRESP:1000,WRIDLE:0010,iSTATE:0001";
  attribute SOFT_HLUTNM of \exceptions_set[0]_i_1\ : label is "soft_lutpair101";
  attribute SOFT_HLUTNM of \exceptions_set[1]_i_1\ : label is "soft_lutpair100";
  attribute SOFT_HLUTNM of \exceptions_set[3]_i_1\ : label is "soft_lutpair102";
  attribute SOFT_HLUTNM of \exceptions_set[4]_i_2\ : label is "soft_lutpair102";
  attribute SOFT_HLUTNM of \op_set[0]_i_1\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \op_set[1]_i_2\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \operand_a_set[0]_i_1\ : label is "soft_lutpair35";
  attribute SOFT_HLUTNM of \operand_a_set[10]_i_1\ : label is "soft_lutpair25";
  attribute SOFT_HLUTNM of \operand_a_set[11]_i_1\ : label is "soft_lutpair24";
  attribute SOFT_HLUTNM of \operand_a_set[12]_i_1\ : label is "soft_lutpair23";
  attribute SOFT_HLUTNM of \operand_a_set[13]_i_1\ : label is "soft_lutpair22";
  attribute SOFT_HLUTNM of \operand_a_set[14]_i_1\ : label is "soft_lutpair21";
  attribute SOFT_HLUTNM of \operand_a_set[15]_i_1\ : label is "soft_lutpair20";
  attribute SOFT_HLUTNM of \operand_a_set[16]_i_1\ : label is "soft_lutpair19";
  attribute SOFT_HLUTNM of \operand_a_set[17]_i_1\ : label is "soft_lutpair18";
  attribute SOFT_HLUTNM of \operand_a_set[18]_i_1\ : label is "soft_lutpair17";
  attribute SOFT_HLUTNM of \operand_a_set[19]_i_1\ : label is "soft_lutpair16";
  attribute SOFT_HLUTNM of \operand_a_set[1]_i_1\ : label is "soft_lutpair34";
  attribute SOFT_HLUTNM of \operand_a_set[20]_i_1\ : label is "soft_lutpair15";
  attribute SOFT_HLUTNM of \operand_a_set[21]_i_1\ : label is "soft_lutpair14";
  attribute SOFT_HLUTNM of \operand_a_set[22]_i_1\ : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of \operand_a_set[23]_i_1\ : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of \operand_a_set[24]_i_1\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \operand_a_set[25]_i_1\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \operand_a_set[26]_i_1\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \operand_a_set[27]_i_1\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \operand_a_set[28]_i_1\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \operand_a_set[29]_i_1\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \operand_a_set[2]_i_1\ : label is "soft_lutpair33";
  attribute SOFT_HLUTNM of \operand_a_set[30]_i_1\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \operand_a_set[31]_i_2\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \operand_a_set[31]_i_3\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \operand_a_set[32]_i_1\ : label is "soft_lutpair35";
  attribute SOFT_HLUTNM of \operand_a_set[33]_i_1\ : label is "soft_lutpair34";
  attribute SOFT_HLUTNM of \operand_a_set[34]_i_1\ : label is "soft_lutpair33";
  attribute SOFT_HLUTNM of \operand_a_set[35]_i_1\ : label is "soft_lutpair32";
  attribute SOFT_HLUTNM of \operand_a_set[36]_i_1\ : label is "soft_lutpair31";
  attribute SOFT_HLUTNM of \operand_a_set[37]_i_1\ : label is "soft_lutpair30";
  attribute SOFT_HLUTNM of \operand_a_set[38]_i_1\ : label is "soft_lutpair29";
  attribute SOFT_HLUTNM of \operand_a_set[39]_i_1\ : label is "soft_lutpair28";
  attribute SOFT_HLUTNM of \operand_a_set[3]_i_1\ : label is "soft_lutpair32";
  attribute SOFT_HLUTNM of \operand_a_set[40]_i_1\ : label is "soft_lutpair27";
  attribute SOFT_HLUTNM of \operand_a_set[41]_i_1\ : label is "soft_lutpair26";
  attribute SOFT_HLUTNM of \operand_a_set[42]_i_1\ : label is "soft_lutpair25";
  attribute SOFT_HLUTNM of \operand_a_set[43]_i_1\ : label is "soft_lutpair24";
  attribute SOFT_HLUTNM of \operand_a_set[44]_i_1\ : label is "soft_lutpair23";
  attribute SOFT_HLUTNM of \operand_a_set[45]_i_1\ : label is "soft_lutpair22";
  attribute SOFT_HLUTNM of \operand_a_set[46]_i_1\ : label is "soft_lutpair21";
  attribute SOFT_HLUTNM of \operand_a_set[47]_i_1\ : label is "soft_lutpair20";
  attribute SOFT_HLUTNM of \operand_a_set[48]_i_1\ : label is "soft_lutpair19";
  attribute SOFT_HLUTNM of \operand_a_set[49]_i_1\ : label is "soft_lutpair18";
  attribute SOFT_HLUTNM of \operand_a_set[4]_i_1\ : label is "soft_lutpair31";
  attribute SOFT_HLUTNM of \operand_a_set[50]_i_1\ : label is "soft_lutpair17";
  attribute SOFT_HLUTNM of \operand_a_set[51]_i_1\ : label is "soft_lutpair16";
  attribute SOFT_HLUTNM of \operand_a_set[52]_i_1\ : label is "soft_lutpair15";
  attribute SOFT_HLUTNM of \operand_a_set[53]_i_1\ : label is "soft_lutpair14";
  attribute SOFT_HLUTNM of \operand_a_set[54]_i_1\ : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of \operand_a_set[55]_i_1\ : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of \operand_a_set[56]_i_1\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \operand_a_set[57]_i_1\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \operand_a_set[58]_i_1\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \operand_a_set[59]_i_1\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \operand_a_set[5]_i_1\ : label is "soft_lutpair30";
  attribute SOFT_HLUTNM of \operand_a_set[60]_i_1\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \operand_a_set[61]_i_1\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \operand_a_set[62]_i_1\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \operand_a_set[63]_i_2\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \operand_a_set[6]_i_1\ : label is "soft_lutpair29";
  attribute SOFT_HLUTNM of \operand_a_set[7]_i_1\ : label is "soft_lutpair28";
  attribute SOFT_HLUTNM of \operand_a_set[8]_i_1\ : label is "soft_lutpair27";
  attribute SOFT_HLUTNM of \operand_a_set[9]_i_1\ : label is "soft_lutpair26";
  attribute SOFT_HLUTNM of \operand_b_set[0]_i_1\ : label is "soft_lutpair67";
  attribute SOFT_HLUTNM of \operand_b_set[10]_i_1\ : label is "soft_lutpair57";
  attribute SOFT_HLUTNM of \operand_b_set[11]_i_1\ : label is "soft_lutpair56";
  attribute SOFT_HLUTNM of \operand_b_set[12]_i_1\ : label is "soft_lutpair55";
  attribute SOFT_HLUTNM of \operand_b_set[13]_i_1\ : label is "soft_lutpair54";
  attribute SOFT_HLUTNM of \operand_b_set[14]_i_1\ : label is "soft_lutpair53";
  attribute SOFT_HLUTNM of \operand_b_set[15]_i_1\ : label is "soft_lutpair52";
  attribute SOFT_HLUTNM of \operand_b_set[16]_i_1\ : label is "soft_lutpair51";
  attribute SOFT_HLUTNM of \operand_b_set[17]_i_1\ : label is "soft_lutpair50";
  attribute SOFT_HLUTNM of \operand_b_set[18]_i_1\ : label is "soft_lutpair49";
  attribute SOFT_HLUTNM of \operand_b_set[19]_i_1\ : label is "soft_lutpair48";
  attribute SOFT_HLUTNM of \operand_b_set[1]_i_1\ : label is "soft_lutpair66";
  attribute SOFT_HLUTNM of \operand_b_set[20]_i_1\ : label is "soft_lutpair47";
  attribute SOFT_HLUTNM of \operand_b_set[21]_i_1\ : label is "soft_lutpair46";
  attribute SOFT_HLUTNM of \operand_b_set[22]_i_1\ : label is "soft_lutpair45";
  attribute SOFT_HLUTNM of \operand_b_set[23]_i_1\ : label is "soft_lutpair44";
  attribute SOFT_HLUTNM of \operand_b_set[24]_i_1\ : label is "soft_lutpair43";
  attribute SOFT_HLUTNM of \operand_b_set[25]_i_1\ : label is "soft_lutpair42";
  attribute SOFT_HLUTNM of \operand_b_set[26]_i_1\ : label is "soft_lutpair41";
  attribute SOFT_HLUTNM of \operand_b_set[27]_i_1\ : label is "soft_lutpair40";
  attribute SOFT_HLUTNM of \operand_b_set[28]_i_1\ : label is "soft_lutpair39";
  attribute SOFT_HLUTNM of \operand_b_set[29]_i_1\ : label is "soft_lutpair38";
  attribute SOFT_HLUTNM of \operand_b_set[2]_i_1\ : label is "soft_lutpair65";
  attribute SOFT_HLUTNM of \operand_b_set[30]_i_1\ : label is "soft_lutpair37";
  attribute SOFT_HLUTNM of \operand_b_set[31]_i_2\ : label is "soft_lutpair36";
  attribute SOFT_HLUTNM of \operand_b_set[32]_i_1\ : label is "soft_lutpair67";
  attribute SOFT_HLUTNM of \operand_b_set[33]_i_1\ : label is "soft_lutpair66";
  attribute SOFT_HLUTNM of \operand_b_set[34]_i_1\ : label is "soft_lutpair65";
  attribute SOFT_HLUTNM of \operand_b_set[35]_i_1\ : label is "soft_lutpair64";
  attribute SOFT_HLUTNM of \operand_b_set[36]_i_1\ : label is "soft_lutpair63";
  attribute SOFT_HLUTNM of \operand_b_set[37]_i_1\ : label is "soft_lutpair62";
  attribute SOFT_HLUTNM of \operand_b_set[38]_i_1\ : label is "soft_lutpair61";
  attribute SOFT_HLUTNM of \operand_b_set[39]_i_1\ : label is "soft_lutpair60";
  attribute SOFT_HLUTNM of \operand_b_set[3]_i_1\ : label is "soft_lutpair64";
  attribute SOFT_HLUTNM of \operand_b_set[40]_i_1\ : label is "soft_lutpair59";
  attribute SOFT_HLUTNM of \operand_b_set[41]_i_1\ : label is "soft_lutpair58";
  attribute SOFT_HLUTNM of \operand_b_set[42]_i_1\ : label is "soft_lutpair57";
  attribute SOFT_HLUTNM of \operand_b_set[43]_i_1\ : label is "soft_lutpair56";
  attribute SOFT_HLUTNM of \operand_b_set[44]_i_1\ : label is "soft_lutpair55";
  attribute SOFT_HLUTNM of \operand_b_set[45]_i_1\ : label is "soft_lutpair54";
  attribute SOFT_HLUTNM of \operand_b_set[46]_i_1\ : label is "soft_lutpair53";
  attribute SOFT_HLUTNM of \operand_b_set[47]_i_1\ : label is "soft_lutpair52";
  attribute SOFT_HLUTNM of \operand_b_set[48]_i_1\ : label is "soft_lutpair51";
  attribute SOFT_HLUTNM of \operand_b_set[49]_i_1\ : label is "soft_lutpair50";
  attribute SOFT_HLUTNM of \operand_b_set[4]_i_1\ : label is "soft_lutpair63";
  attribute SOFT_HLUTNM of \operand_b_set[50]_i_1\ : label is "soft_lutpair49";
  attribute SOFT_HLUTNM of \operand_b_set[51]_i_1\ : label is "soft_lutpair48";
  attribute SOFT_HLUTNM of \operand_b_set[52]_i_1\ : label is "soft_lutpair47";
  attribute SOFT_HLUTNM of \operand_b_set[53]_i_1\ : label is "soft_lutpair46";
  attribute SOFT_HLUTNM of \operand_b_set[54]_i_1\ : label is "soft_lutpair45";
  attribute SOFT_HLUTNM of \operand_b_set[55]_i_1\ : label is "soft_lutpair44";
  attribute SOFT_HLUTNM of \operand_b_set[56]_i_1\ : label is "soft_lutpair43";
  attribute SOFT_HLUTNM of \operand_b_set[57]_i_1\ : label is "soft_lutpair42";
  attribute SOFT_HLUTNM of \operand_b_set[58]_i_1\ : label is "soft_lutpair41";
  attribute SOFT_HLUTNM of \operand_b_set[59]_i_1\ : label is "soft_lutpair40";
  attribute SOFT_HLUTNM of \operand_b_set[5]_i_1\ : label is "soft_lutpair62";
  attribute SOFT_HLUTNM of \operand_b_set[60]_i_1\ : label is "soft_lutpair39";
  attribute SOFT_HLUTNM of \operand_b_set[61]_i_1\ : label is "soft_lutpair38";
  attribute SOFT_HLUTNM of \operand_b_set[62]_i_1\ : label is "soft_lutpair37";
  attribute SOFT_HLUTNM of \operand_b_set[63]_i_2\ : label is "soft_lutpair36";
  attribute SOFT_HLUTNM of \operand_b_set[6]_i_1\ : label is "soft_lutpair61";
  attribute SOFT_HLUTNM of \operand_b_set[7]_i_1\ : label is "soft_lutpair60";
  attribute SOFT_HLUTNM of \operand_b_set[8]_i_1\ : label is "soft_lutpair59";
  attribute SOFT_HLUTNM of \operand_b_set[9]_i_1\ : label is "soft_lutpair58";
  attribute SOFT_HLUTNM of \precision_out_set[0]_i_1\ : label is "soft_lutpair69";
  attribute SOFT_HLUTNM of \precision_out_set[1]_i_2\ : label is "soft_lutpair68";
  attribute SOFT_HLUTNM of \precision_set[0]_i_1\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \precision_set[1]_i_2\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \precision_set[1]_i_3\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \result_set[0]_i_1\ : label is "soft_lutpair69";
  attribute SOFT_HLUTNM of \result_set[10]_i_1\ : label is "soft_lutpair91";
  attribute SOFT_HLUTNM of \result_set[11]_i_1\ : label is "soft_lutpair90";
  attribute SOFT_HLUTNM of \result_set[12]_i_1\ : label is "soft_lutpair89";
  attribute SOFT_HLUTNM of \result_set[13]_i_1\ : label is "soft_lutpair88";
  attribute SOFT_HLUTNM of \result_set[14]_i_1\ : label is "soft_lutpair87";
  attribute SOFT_HLUTNM of \result_set[15]_i_1\ : label is "soft_lutpair86";
  attribute SOFT_HLUTNM of \result_set[16]_i_1\ : label is "soft_lutpair85";
  attribute SOFT_HLUTNM of \result_set[17]_i_1\ : label is "soft_lutpair84";
  attribute SOFT_HLUTNM of \result_set[18]_i_1\ : label is "soft_lutpair83";
  attribute SOFT_HLUTNM of \result_set[19]_i_1\ : label is "soft_lutpair82";
  attribute SOFT_HLUTNM of \result_set[1]_i_1\ : label is "soft_lutpair68";
  attribute SOFT_HLUTNM of \result_set[20]_i_1\ : label is "soft_lutpair81";
  attribute SOFT_HLUTNM of \result_set[21]_i_1\ : label is "soft_lutpair80";
  attribute SOFT_HLUTNM of \result_set[22]_i_1\ : label is "soft_lutpair79";
  attribute SOFT_HLUTNM of \result_set[23]_i_1\ : label is "soft_lutpair78";
  attribute SOFT_HLUTNM of \result_set[24]_i_1\ : label is "soft_lutpair77";
  attribute SOFT_HLUTNM of \result_set[25]_i_1\ : label is "soft_lutpair76";
  attribute SOFT_HLUTNM of \result_set[26]_i_1\ : label is "soft_lutpair75";
  attribute SOFT_HLUTNM of \result_set[27]_i_1\ : label is "soft_lutpair74";
  attribute SOFT_HLUTNM of \result_set[28]_i_1\ : label is "soft_lutpair73";
  attribute SOFT_HLUTNM of \result_set[29]_i_1\ : label is "soft_lutpair72";
  attribute SOFT_HLUTNM of \result_set[2]_i_1\ : label is "soft_lutpair99";
  attribute SOFT_HLUTNM of \result_set[30]_i_1\ : label is "soft_lutpair71";
  attribute SOFT_HLUTNM of \result_set[31]_i_2\ : label is "soft_lutpair70";
  attribute SOFT_HLUTNM of \result_set[32]_i_1\ : label is "soft_lutpair101";
  attribute SOFT_HLUTNM of \result_set[33]_i_1\ : label is "soft_lutpair100";
  attribute SOFT_HLUTNM of \result_set[34]_i_1\ : label is "soft_lutpair99";
  attribute SOFT_HLUTNM of \result_set[35]_i_1\ : label is "soft_lutpair98";
  attribute SOFT_HLUTNM of \result_set[36]_i_1\ : label is "soft_lutpair97";
  attribute SOFT_HLUTNM of \result_set[37]_i_1\ : label is "soft_lutpair96";
  attribute SOFT_HLUTNM of \result_set[38]_i_1\ : label is "soft_lutpair95";
  attribute SOFT_HLUTNM of \result_set[39]_i_1\ : label is "soft_lutpair94";
  attribute SOFT_HLUTNM of \result_set[3]_i_1\ : label is "soft_lutpair98";
  attribute SOFT_HLUTNM of \result_set[40]_i_1\ : label is "soft_lutpair93";
  attribute SOFT_HLUTNM of \result_set[41]_i_1\ : label is "soft_lutpair92";
  attribute SOFT_HLUTNM of \result_set[42]_i_1\ : label is "soft_lutpair91";
  attribute SOFT_HLUTNM of \result_set[43]_i_1\ : label is "soft_lutpair90";
  attribute SOFT_HLUTNM of \result_set[44]_i_1\ : label is "soft_lutpair89";
  attribute SOFT_HLUTNM of \result_set[45]_i_1\ : label is "soft_lutpair88";
  attribute SOFT_HLUTNM of \result_set[46]_i_1\ : label is "soft_lutpair87";
  attribute SOFT_HLUTNM of \result_set[47]_i_1\ : label is "soft_lutpair86";
  attribute SOFT_HLUTNM of \result_set[48]_i_1\ : label is "soft_lutpair85";
  attribute SOFT_HLUTNM of \result_set[49]_i_1\ : label is "soft_lutpair84";
  attribute SOFT_HLUTNM of \result_set[4]_i_1\ : label is "soft_lutpair97";
  attribute SOFT_HLUTNM of \result_set[50]_i_1\ : label is "soft_lutpair83";
  attribute SOFT_HLUTNM of \result_set[51]_i_1\ : label is "soft_lutpair82";
  attribute SOFT_HLUTNM of \result_set[52]_i_1\ : label is "soft_lutpair81";
  attribute SOFT_HLUTNM of \result_set[53]_i_1\ : label is "soft_lutpair80";
  attribute SOFT_HLUTNM of \result_set[54]_i_1\ : label is "soft_lutpair79";
  attribute SOFT_HLUTNM of \result_set[55]_i_1\ : label is "soft_lutpair78";
  attribute SOFT_HLUTNM of \result_set[56]_i_1\ : label is "soft_lutpair77";
  attribute SOFT_HLUTNM of \result_set[57]_i_1\ : label is "soft_lutpair76";
  attribute SOFT_HLUTNM of \result_set[58]_i_1\ : label is "soft_lutpair75";
  attribute SOFT_HLUTNM of \result_set[59]_i_1\ : label is "soft_lutpair74";
  attribute SOFT_HLUTNM of \result_set[5]_i_1\ : label is "soft_lutpair96";
  attribute SOFT_HLUTNM of \result_set[60]_i_1\ : label is "soft_lutpair73";
  attribute SOFT_HLUTNM of \result_set[61]_i_1\ : label is "soft_lutpair72";
  attribute SOFT_HLUTNM of \result_set[62]_i_1\ : label is "soft_lutpair71";
  attribute SOFT_HLUTNM of \result_set[63]_i_2\ : label is "soft_lutpair70";
  attribute SOFT_HLUTNM of \result_set[6]_i_1\ : label is "soft_lutpair95";
  attribute SOFT_HLUTNM of \result_set[7]_i_1\ : label is "soft_lutpair94";
  attribute SOFT_HLUTNM of \result_set[8]_i_1\ : label is "soft_lutpair93";
  attribute SOFT_HLUTNM of \result_set[9]_i_1\ : label is "soft_lutpair92";
begin
  \FSM_onehot_rstate_reg[1]_0\ <= \^fsm_onehot_rstate_reg[1]_0\;
  \FSM_onehot_wstate_reg[1]_0\ <= \^fsm_onehot_wstate_reg[1]_0\;
  \FSM_onehot_wstate_reg[2]_0\ <= \^fsm_onehot_wstate_reg[2]_0\;
  s_axi_control_BVALID <= \^s_axi_control_bvalid\;
  s_axi_control_RVALID <= \^s_axi_control_rvalid\;
\FSM_onehot_rstate[1]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F747"
    )
        port map (
      I0 => s_axi_control_ARVALID,
      I1 => \^fsm_onehot_rstate_reg[1]_0\,
      I2 => \^s_axi_control_rvalid\,
      I3 => s_axi_control_RREADY,
      O => \FSM_onehot_rstate[1]_i_1_n_0\
    );
\FSM_onehot_rstate[2]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8F88"
    )
        port map (
      I0 => s_axi_control_ARVALID,
      I1 => \^fsm_onehot_rstate_reg[1]_0\,
      I2 => s_axi_control_RREADY,
      I3 => \^s_axi_control_rvalid\,
      O => \FSM_onehot_rstate[2]_i_1_n_0\
    );
\FSM_onehot_rstate_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => '1',
      D => \FSM_onehot_rstate[1]_i_1_n_0\,
      Q => \^fsm_onehot_rstate_reg[1]_0\,
      R => SR(0)
    );
\FSM_onehot_rstate_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => '1',
      D => \FSM_onehot_rstate[2]_i_1_n_0\,
      Q => \^s_axi_control_rvalid\,
      R => SR(0)
    );
\FSM_onehot_wstate[1]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"888BFF8B"
    )
        port map (
      I0 => s_axi_control_BREADY,
      I1 => \^s_axi_control_bvalid\,
      I2 => \^fsm_onehot_wstate_reg[2]_0\,
      I3 => \^fsm_onehot_wstate_reg[1]_0\,
      I4 => s_axi_control_AWVALID,
      O => \FSM_onehot_wstate[1]_i_1_n_0\
    );
\FSM_onehot_wstate[2]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8F88"
    )
        port map (
      I0 => s_axi_control_AWVALID,
      I1 => \^fsm_onehot_wstate_reg[1]_0\,
      I2 => s_axi_control_WVALID,
      I3 => \^fsm_onehot_wstate_reg[2]_0\,
      O => \FSM_onehot_wstate[2]_i_1_n_0\
    );
\FSM_onehot_wstate[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8F88"
    )
        port map (
      I0 => s_axi_control_WVALID,
      I1 => \^fsm_onehot_wstate_reg[2]_0\,
      I2 => s_axi_control_BREADY,
      I3 => \^s_axi_control_bvalid\,
      O => \FSM_onehot_wstate[3]_i_1_n_0\
    );
\FSM_onehot_wstate_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => '1',
      D => \FSM_onehot_wstate[1]_i_1_n_0\,
      Q => \^fsm_onehot_wstate_reg[1]_0\,
      R => SR(0)
    );
\FSM_onehot_wstate_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => '1',
      D => \FSM_onehot_wstate[2]_i_1_n_0\,
      Q => \^fsm_onehot_wstate_reg[2]_0\,
      R => SR(0)
    );
\FSM_onehot_wstate_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => '1',
      D => \FSM_onehot_wstate[3]_i_1_n_0\,
      Q => \^s_axi_control_bvalid\,
      R => SR(0)
    );
\ce_r_set[0]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFBF0080"
    )
        port map (
      I0 => s_axi_control_WDATA(0),
      I1 => s_axi_control_WSTRB(0),
      I2 => \ce_r_set[0]_i_2_n_0\,
      I3 => waddr(3),
      I4 => \ce_r_set_reg_n_0_[0]\,
      O => \ce_r_set[0]_i_1_n_0\
    );
\ce_r_set[0]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000010000000"
    )
        port map (
      I0 => waddr(2),
      I1 => waddr(6),
      I2 => s_axi_control_WVALID,
      I3 => \^fsm_onehot_wstate_reg[2]_0\,
      I4 => waddr(5),
      I5 => waddr(4),
      O => \ce_r_set[0]_i_2_n_0\
    );
\ce_r_set_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => '1',
      D => \ce_r_set[0]_i_1_n_0\,
      Q => \ce_r_set_reg_n_0_[0]\,
      R => SR(0)
    );
\exceptions_set[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_control_WDATA(0),
      I1 => s_axi_control_WSTRB(0),
      I2 => \exceptions_set_reg_n_0_[0]\,
      O => \exceptions_set[0]_i_1_n_0\
    );
\exceptions_set[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_control_WDATA(1),
      I1 => s_axi_control_WSTRB(0),
      I2 => \exceptions_set_reg_n_0_[1]\,
      O => \exceptions_set[1]_i_1_n_0\
    );
\exceptions_set[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_control_WDATA(2),
      I1 => s_axi_control_WSTRB(0),
      I2 => \exceptions_set_reg_n_0_[2]\,
      O => \exceptions_set[2]_i_1_n_0\
    );
\exceptions_set[3]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_control_WDATA(3),
      I1 => s_axi_control_WSTRB(0),
      I2 => \exceptions_set_reg_n_0_[3]\,
      O => \exceptions_set[3]_i_1_n_0\
    );
\exceptions_set[4]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00008000"
    )
        port map (
      I0 => waddr(2),
      I1 => \operand_a_set[31]_i_3_n_0\,
      I2 => waddr(5),
      I3 => waddr(4),
      I4 => waddr(3),
      O => \exceptions_set[4]_i_1_n_0\
    );
\exceptions_set[4]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_control_WDATA(4),
      I1 => s_axi_control_WSTRB(0),
      I2 => \exceptions_set_reg_n_0_[4]\,
      O => \exceptions_set[4]_i_2_n_0\
    );
\exceptions_set_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \exceptions_set[4]_i_1_n_0\,
      D => \exceptions_set[0]_i_1_n_0\,
      Q => \exceptions_set_reg_n_0_[0]\,
      R => SR(0)
    );
\exceptions_set_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \exceptions_set[4]_i_1_n_0\,
      D => \exceptions_set[1]_i_1_n_0\,
      Q => \exceptions_set_reg_n_0_[1]\,
      R => SR(0)
    );
\exceptions_set_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \exceptions_set[4]_i_1_n_0\,
      D => \exceptions_set[2]_i_1_n_0\,
      Q => \exceptions_set_reg_n_0_[2]\,
      R => SR(0)
    );
\exceptions_set_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \exceptions_set[4]_i_1_n_0\,
      D => \exceptions_set[3]_i_1_n_0\,
      Q => \exceptions_set_reg_n_0_[3]\,
      R => SR(0)
    );
\exceptions_set_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \exceptions_set[4]_i_1_n_0\,
      D => \exceptions_set[4]_i_2_n_0\,
      Q => \exceptions_set_reg_n_0_[4]\,
      R => SR(0)
    );
\op_set[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_control_WDATA(0),
      I1 => s_axi_control_WSTRB(0),
      I2 => \op_set_reg_n_0_[0]\,
      O => op_set0(0)
    );
\op_set[1]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8000"
    )
        port map (
      I0 => waddr(3),
      I1 => waddr(5),
      I2 => \precision_set[1]_i_3_n_0\,
      I3 => waddr(4),
      O => \op_set[1]_i_1_n_0\
    );
\op_set[1]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_control_WDATA(1),
      I1 => s_axi_control_WSTRB(0),
      I2 => \op_set_reg_n_0_[1]\,
      O => op_set0(1)
    );
\op_set_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \op_set[1]_i_1_n_0\,
      D => op_set0(0),
      Q => \op_set_reg_n_0_[0]\,
      R => SR(0)
    );
\op_set_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \op_set[1]_i_1_n_0\,
      D => op_set0(1),
      Q => \op_set_reg_n_0_[1]\,
      R => SR(0)
    );
\operand_a_set[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_control_WDATA(0),
      I1 => s_axi_control_WSTRB(0),
      I2 => \operand_a_set_reg_n_0_[0]\,
      O => operand_a_set_reg06_out(0)
    );
\operand_a_set[10]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_control_WDATA(10),
      I1 => s_axi_control_WSTRB(1),
      I2 => \operand_a_set_reg_n_0_[10]\,
      O => operand_a_set_reg06_out(10)
    );
\operand_a_set[11]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_control_WDATA(11),
      I1 => s_axi_control_WSTRB(1),
      I2 => \operand_a_set_reg_n_0_[11]\,
      O => operand_a_set_reg06_out(11)
    );
\operand_a_set[12]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_control_WDATA(12),
      I1 => s_axi_control_WSTRB(1),
      I2 => \operand_a_set_reg_n_0_[12]\,
      O => operand_a_set_reg06_out(12)
    );
\operand_a_set[13]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_control_WDATA(13),
      I1 => s_axi_control_WSTRB(1),
      I2 => \operand_a_set_reg_n_0_[13]\,
      O => operand_a_set_reg06_out(13)
    );
\operand_a_set[14]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_control_WDATA(14),
      I1 => s_axi_control_WSTRB(1),
      I2 => \operand_a_set_reg_n_0_[14]\,
      O => operand_a_set_reg06_out(14)
    );
\operand_a_set[15]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_control_WDATA(15),
      I1 => s_axi_control_WSTRB(1),
      I2 => \operand_a_set_reg_n_0_[15]\,
      O => operand_a_set_reg06_out(15)
    );
\operand_a_set[16]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_control_WDATA(16),
      I1 => s_axi_control_WSTRB(2),
      I2 => \operand_a_set_reg_n_0_[16]\,
      O => operand_a_set_reg06_out(16)
    );
\operand_a_set[17]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_control_WDATA(17),
      I1 => s_axi_control_WSTRB(2),
      I2 => \operand_a_set_reg_n_0_[17]\,
      O => operand_a_set_reg06_out(17)
    );
\operand_a_set[18]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_control_WDATA(18),
      I1 => s_axi_control_WSTRB(2),
      I2 => \operand_a_set_reg_n_0_[18]\,
      O => operand_a_set_reg06_out(18)
    );
\operand_a_set[19]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_control_WDATA(19),
      I1 => s_axi_control_WSTRB(2),
      I2 => \operand_a_set_reg_n_0_[19]\,
      O => operand_a_set_reg06_out(19)
    );
\operand_a_set[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_control_WDATA(1),
      I1 => s_axi_control_WSTRB(0),
      I2 => \operand_a_set_reg_n_0_[1]\,
      O => operand_a_set_reg06_out(1)
    );
\operand_a_set[20]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_control_WDATA(20),
      I1 => s_axi_control_WSTRB(2),
      I2 => \operand_a_set_reg_n_0_[20]\,
      O => operand_a_set_reg06_out(20)
    );
\operand_a_set[21]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_control_WDATA(21),
      I1 => s_axi_control_WSTRB(2),
      I2 => \operand_a_set_reg_n_0_[21]\,
      O => operand_a_set_reg06_out(21)
    );
\operand_a_set[22]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_control_WDATA(22),
      I1 => s_axi_control_WSTRB(2),
      I2 => \operand_a_set_reg_n_0_[22]\,
      O => operand_a_set_reg06_out(22)
    );
\operand_a_set[23]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_control_WDATA(23),
      I1 => s_axi_control_WSTRB(2),
      I2 => \operand_a_set_reg_n_0_[23]\,
      O => operand_a_set_reg06_out(23)
    );
\operand_a_set[24]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_control_WDATA(24),
      I1 => s_axi_control_WSTRB(3),
      I2 => \operand_a_set_reg_n_0_[24]\,
      O => operand_a_set_reg06_out(24)
    );
\operand_a_set[25]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_control_WDATA(25),
      I1 => s_axi_control_WSTRB(3),
      I2 => \operand_a_set_reg_n_0_[25]\,
      O => operand_a_set_reg06_out(25)
    );
\operand_a_set[26]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_control_WDATA(26),
      I1 => s_axi_control_WSTRB(3),
      I2 => \operand_a_set_reg_n_0_[26]\,
      O => operand_a_set_reg06_out(26)
    );
\operand_a_set[27]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_control_WDATA(27),
      I1 => s_axi_control_WSTRB(3),
      I2 => \operand_a_set_reg_n_0_[27]\,
      O => operand_a_set_reg06_out(27)
    );
\operand_a_set[28]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_control_WDATA(28),
      I1 => s_axi_control_WSTRB(3),
      I2 => \operand_a_set_reg_n_0_[28]\,
      O => operand_a_set_reg06_out(28)
    );
\operand_a_set[29]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_control_WDATA(29),
      I1 => s_axi_control_WSTRB(3),
      I2 => \operand_a_set_reg_n_0_[29]\,
      O => operand_a_set_reg06_out(29)
    );
\operand_a_set[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_control_WDATA(2),
      I1 => s_axi_control_WSTRB(0),
      I2 => \operand_a_set_reg_n_0_[2]\,
      O => operand_a_set_reg06_out(2)
    );
\operand_a_set[30]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_control_WDATA(30),
      I1 => s_axi_control_WSTRB(3),
      I2 => \operand_a_set_reg_n_0_[30]\,
      O => operand_a_set_reg06_out(30)
    );
\operand_a_set[31]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000004"
    )
        port map (
      I0 => waddr(5),
      I1 => \operand_a_set[31]_i_3_n_0\,
      I2 => waddr(2),
      I3 => waddr(4),
      I4 => waddr(3),
      O => \operand_a_set[31]_i_1_n_0\
    );
\operand_a_set[31]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_control_WDATA(31),
      I1 => s_axi_control_WSTRB(3),
      I2 => \operand_a_set_reg_n_0_[31]\,
      O => operand_a_set_reg06_out(31)
    );
\operand_a_set[31]_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => waddr(6),
      I1 => \^fsm_onehot_wstate_reg[2]_0\,
      I2 => s_axi_control_WVALID,
      O => \operand_a_set[31]_i_3_n_0\
    );
\operand_a_set[32]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_control_WDATA(0),
      I1 => s_axi_control_WSTRB(0),
      I2 => p_1_in3_in(0),
      O => operand_a_set_reg0(0)
    );
\operand_a_set[33]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_control_WDATA(1),
      I1 => s_axi_control_WSTRB(0),
      I2 => p_1_in3_in(1),
      O => operand_a_set_reg0(1)
    );
\operand_a_set[34]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_control_WDATA(2),
      I1 => s_axi_control_WSTRB(0),
      I2 => p_1_in3_in(2),
      O => operand_a_set_reg0(2)
    );
\operand_a_set[35]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_control_WDATA(3),
      I1 => s_axi_control_WSTRB(0),
      I2 => p_1_in3_in(3),
      O => operand_a_set_reg0(3)
    );
\operand_a_set[36]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_control_WDATA(4),
      I1 => s_axi_control_WSTRB(0),
      I2 => p_1_in3_in(4),
      O => operand_a_set_reg0(4)
    );
\operand_a_set[37]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_control_WDATA(5),
      I1 => s_axi_control_WSTRB(0),
      I2 => p_1_in3_in(5),
      O => operand_a_set_reg0(5)
    );
\operand_a_set[38]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_control_WDATA(6),
      I1 => s_axi_control_WSTRB(0),
      I2 => p_1_in3_in(6),
      O => operand_a_set_reg0(6)
    );
\operand_a_set[39]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_control_WDATA(7),
      I1 => s_axi_control_WSTRB(0),
      I2 => p_1_in3_in(7),
      O => operand_a_set_reg0(7)
    );
\operand_a_set[3]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_control_WDATA(3),
      I1 => s_axi_control_WSTRB(0),
      I2 => \operand_a_set_reg_n_0_[3]\,
      O => operand_a_set_reg06_out(3)
    );
\operand_a_set[40]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_control_WDATA(8),
      I1 => s_axi_control_WSTRB(1),
      I2 => p_1_in3_in(8),
      O => operand_a_set_reg0(8)
    );
\operand_a_set[41]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_control_WDATA(9),
      I1 => s_axi_control_WSTRB(1),
      I2 => p_1_in3_in(9),
      O => operand_a_set_reg0(9)
    );
\operand_a_set[42]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_control_WDATA(10),
      I1 => s_axi_control_WSTRB(1),
      I2 => p_1_in3_in(10),
      O => operand_a_set_reg0(10)
    );
\operand_a_set[43]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_control_WDATA(11),
      I1 => s_axi_control_WSTRB(1),
      I2 => p_1_in3_in(11),
      O => operand_a_set_reg0(11)
    );
\operand_a_set[44]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_control_WDATA(12),
      I1 => s_axi_control_WSTRB(1),
      I2 => p_1_in3_in(12),
      O => operand_a_set_reg0(12)
    );
\operand_a_set[45]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_control_WDATA(13),
      I1 => s_axi_control_WSTRB(1),
      I2 => p_1_in3_in(13),
      O => operand_a_set_reg0(13)
    );
\operand_a_set[46]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_control_WDATA(14),
      I1 => s_axi_control_WSTRB(1),
      I2 => p_1_in3_in(14),
      O => operand_a_set_reg0(14)
    );
\operand_a_set[47]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_control_WDATA(15),
      I1 => s_axi_control_WSTRB(1),
      I2 => p_1_in3_in(15),
      O => operand_a_set_reg0(15)
    );
\operand_a_set[48]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_control_WDATA(16),
      I1 => s_axi_control_WSTRB(2),
      I2 => p_1_in3_in(16),
      O => operand_a_set_reg0(16)
    );
\operand_a_set[49]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_control_WDATA(17),
      I1 => s_axi_control_WSTRB(2),
      I2 => p_1_in3_in(17),
      O => operand_a_set_reg0(17)
    );
\operand_a_set[4]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_control_WDATA(4),
      I1 => s_axi_control_WSTRB(0),
      I2 => \operand_a_set_reg_n_0_[4]\,
      O => operand_a_set_reg06_out(4)
    );
\operand_a_set[50]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_control_WDATA(18),
      I1 => s_axi_control_WSTRB(2),
      I2 => p_1_in3_in(18),
      O => operand_a_set_reg0(18)
    );
\operand_a_set[51]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_control_WDATA(19),
      I1 => s_axi_control_WSTRB(2),
      I2 => p_1_in3_in(19),
      O => operand_a_set_reg0(19)
    );
\operand_a_set[52]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_control_WDATA(20),
      I1 => s_axi_control_WSTRB(2),
      I2 => p_1_in3_in(20),
      O => operand_a_set_reg0(20)
    );
\operand_a_set[53]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_control_WDATA(21),
      I1 => s_axi_control_WSTRB(2),
      I2 => p_1_in3_in(21),
      O => operand_a_set_reg0(21)
    );
\operand_a_set[54]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_control_WDATA(22),
      I1 => s_axi_control_WSTRB(2),
      I2 => p_1_in3_in(22),
      O => operand_a_set_reg0(22)
    );
\operand_a_set[55]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_control_WDATA(23),
      I1 => s_axi_control_WSTRB(2),
      I2 => p_1_in3_in(23),
      O => operand_a_set_reg0(23)
    );
\operand_a_set[56]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_control_WDATA(24),
      I1 => s_axi_control_WSTRB(3),
      I2 => p_1_in3_in(24),
      O => operand_a_set_reg0(24)
    );
\operand_a_set[57]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_control_WDATA(25),
      I1 => s_axi_control_WSTRB(3),
      I2 => p_1_in3_in(25),
      O => operand_a_set_reg0(25)
    );
\operand_a_set[58]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_control_WDATA(26),
      I1 => s_axi_control_WSTRB(3),
      I2 => p_1_in3_in(26),
      O => operand_a_set_reg0(26)
    );
\operand_a_set[59]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_control_WDATA(27),
      I1 => s_axi_control_WSTRB(3),
      I2 => p_1_in3_in(27),
      O => operand_a_set_reg0(27)
    );
\operand_a_set[5]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_control_WDATA(5),
      I1 => s_axi_control_WSTRB(0),
      I2 => \operand_a_set_reg_n_0_[5]\,
      O => operand_a_set_reg06_out(5)
    );
\operand_a_set[60]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_control_WDATA(28),
      I1 => s_axi_control_WSTRB(3),
      I2 => p_1_in3_in(28),
      O => operand_a_set_reg0(28)
    );
\operand_a_set[61]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_control_WDATA(29),
      I1 => s_axi_control_WSTRB(3),
      I2 => p_1_in3_in(29),
      O => operand_a_set_reg0(29)
    );
\operand_a_set[62]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_control_WDATA(30),
      I1 => s_axi_control_WSTRB(3),
      I2 => p_1_in3_in(30),
      O => operand_a_set_reg0(30)
    );
\operand_a_set[63]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00001000"
    )
        port map (
      I0 => waddr(4),
      I1 => waddr(5),
      I2 => waddr(2),
      I3 => \operand_a_set[31]_i_3_n_0\,
      I4 => waddr(3),
      O => \operand_a_set[63]_i_1_n_0\
    );
\operand_a_set[63]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_control_WDATA(31),
      I1 => s_axi_control_WSTRB(3),
      I2 => p_1_in3_in(31),
      O => operand_a_set_reg0(31)
    );
\operand_a_set[6]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_control_WDATA(6),
      I1 => s_axi_control_WSTRB(0),
      I2 => \operand_a_set_reg_n_0_[6]\,
      O => operand_a_set_reg06_out(6)
    );
\operand_a_set[7]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_control_WDATA(7),
      I1 => s_axi_control_WSTRB(0),
      I2 => \operand_a_set_reg_n_0_[7]\,
      O => operand_a_set_reg06_out(7)
    );
\operand_a_set[8]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_control_WDATA(8),
      I1 => s_axi_control_WSTRB(1),
      I2 => \operand_a_set_reg_n_0_[8]\,
      O => operand_a_set_reg06_out(8)
    );
\operand_a_set[9]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_control_WDATA(9),
      I1 => s_axi_control_WSTRB(1),
      I2 => \operand_a_set_reg_n_0_[9]\,
      O => operand_a_set_reg06_out(9)
    );
\operand_a_set_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \operand_a_set[31]_i_1_n_0\,
      D => operand_a_set_reg06_out(0),
      Q => \operand_a_set_reg_n_0_[0]\,
      R => SR(0)
    );
\operand_a_set_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \operand_a_set[31]_i_1_n_0\,
      D => operand_a_set_reg06_out(10),
      Q => \operand_a_set_reg_n_0_[10]\,
      R => SR(0)
    );
\operand_a_set_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \operand_a_set[31]_i_1_n_0\,
      D => operand_a_set_reg06_out(11),
      Q => \operand_a_set_reg_n_0_[11]\,
      R => SR(0)
    );
\operand_a_set_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \operand_a_set[31]_i_1_n_0\,
      D => operand_a_set_reg06_out(12),
      Q => \operand_a_set_reg_n_0_[12]\,
      R => SR(0)
    );
\operand_a_set_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \operand_a_set[31]_i_1_n_0\,
      D => operand_a_set_reg06_out(13),
      Q => \operand_a_set_reg_n_0_[13]\,
      R => SR(0)
    );
\operand_a_set_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \operand_a_set[31]_i_1_n_0\,
      D => operand_a_set_reg06_out(14),
      Q => \operand_a_set_reg_n_0_[14]\,
      R => SR(0)
    );
\operand_a_set_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \operand_a_set[31]_i_1_n_0\,
      D => operand_a_set_reg06_out(15),
      Q => \operand_a_set_reg_n_0_[15]\,
      R => SR(0)
    );
\operand_a_set_reg[16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \operand_a_set[31]_i_1_n_0\,
      D => operand_a_set_reg06_out(16),
      Q => \operand_a_set_reg_n_0_[16]\,
      R => SR(0)
    );
\operand_a_set_reg[17]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \operand_a_set[31]_i_1_n_0\,
      D => operand_a_set_reg06_out(17),
      Q => \operand_a_set_reg_n_0_[17]\,
      R => SR(0)
    );
\operand_a_set_reg[18]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \operand_a_set[31]_i_1_n_0\,
      D => operand_a_set_reg06_out(18),
      Q => \operand_a_set_reg_n_0_[18]\,
      R => SR(0)
    );
\operand_a_set_reg[19]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \operand_a_set[31]_i_1_n_0\,
      D => operand_a_set_reg06_out(19),
      Q => \operand_a_set_reg_n_0_[19]\,
      R => SR(0)
    );
\operand_a_set_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \operand_a_set[31]_i_1_n_0\,
      D => operand_a_set_reg06_out(1),
      Q => \operand_a_set_reg_n_0_[1]\,
      R => SR(0)
    );
\operand_a_set_reg[20]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \operand_a_set[31]_i_1_n_0\,
      D => operand_a_set_reg06_out(20),
      Q => \operand_a_set_reg_n_0_[20]\,
      R => SR(0)
    );
\operand_a_set_reg[21]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \operand_a_set[31]_i_1_n_0\,
      D => operand_a_set_reg06_out(21),
      Q => \operand_a_set_reg_n_0_[21]\,
      R => SR(0)
    );
\operand_a_set_reg[22]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \operand_a_set[31]_i_1_n_0\,
      D => operand_a_set_reg06_out(22),
      Q => \operand_a_set_reg_n_0_[22]\,
      R => SR(0)
    );
\operand_a_set_reg[23]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \operand_a_set[31]_i_1_n_0\,
      D => operand_a_set_reg06_out(23),
      Q => \operand_a_set_reg_n_0_[23]\,
      R => SR(0)
    );
\operand_a_set_reg[24]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \operand_a_set[31]_i_1_n_0\,
      D => operand_a_set_reg06_out(24),
      Q => \operand_a_set_reg_n_0_[24]\,
      R => SR(0)
    );
\operand_a_set_reg[25]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \operand_a_set[31]_i_1_n_0\,
      D => operand_a_set_reg06_out(25),
      Q => \operand_a_set_reg_n_0_[25]\,
      R => SR(0)
    );
\operand_a_set_reg[26]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \operand_a_set[31]_i_1_n_0\,
      D => operand_a_set_reg06_out(26),
      Q => \operand_a_set_reg_n_0_[26]\,
      R => SR(0)
    );
\operand_a_set_reg[27]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \operand_a_set[31]_i_1_n_0\,
      D => operand_a_set_reg06_out(27),
      Q => \operand_a_set_reg_n_0_[27]\,
      R => SR(0)
    );
\operand_a_set_reg[28]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \operand_a_set[31]_i_1_n_0\,
      D => operand_a_set_reg06_out(28),
      Q => \operand_a_set_reg_n_0_[28]\,
      R => SR(0)
    );
\operand_a_set_reg[29]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \operand_a_set[31]_i_1_n_0\,
      D => operand_a_set_reg06_out(29),
      Q => \operand_a_set_reg_n_0_[29]\,
      R => SR(0)
    );
\operand_a_set_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \operand_a_set[31]_i_1_n_0\,
      D => operand_a_set_reg06_out(2),
      Q => \operand_a_set_reg_n_0_[2]\,
      R => SR(0)
    );
\operand_a_set_reg[30]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \operand_a_set[31]_i_1_n_0\,
      D => operand_a_set_reg06_out(30),
      Q => \operand_a_set_reg_n_0_[30]\,
      R => SR(0)
    );
\operand_a_set_reg[31]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \operand_a_set[31]_i_1_n_0\,
      D => operand_a_set_reg06_out(31),
      Q => \operand_a_set_reg_n_0_[31]\,
      R => SR(0)
    );
\operand_a_set_reg[32]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \operand_a_set[63]_i_1_n_0\,
      D => operand_a_set_reg0(0),
      Q => p_1_in3_in(0),
      R => SR(0)
    );
\operand_a_set_reg[33]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \operand_a_set[63]_i_1_n_0\,
      D => operand_a_set_reg0(1),
      Q => p_1_in3_in(1),
      R => SR(0)
    );
\operand_a_set_reg[34]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \operand_a_set[63]_i_1_n_0\,
      D => operand_a_set_reg0(2),
      Q => p_1_in3_in(2),
      R => SR(0)
    );
\operand_a_set_reg[35]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \operand_a_set[63]_i_1_n_0\,
      D => operand_a_set_reg0(3),
      Q => p_1_in3_in(3),
      R => SR(0)
    );
\operand_a_set_reg[36]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \operand_a_set[63]_i_1_n_0\,
      D => operand_a_set_reg0(4),
      Q => p_1_in3_in(4),
      R => SR(0)
    );
\operand_a_set_reg[37]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \operand_a_set[63]_i_1_n_0\,
      D => operand_a_set_reg0(5),
      Q => p_1_in3_in(5),
      R => SR(0)
    );
\operand_a_set_reg[38]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \operand_a_set[63]_i_1_n_0\,
      D => operand_a_set_reg0(6),
      Q => p_1_in3_in(6),
      R => SR(0)
    );
\operand_a_set_reg[39]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \operand_a_set[63]_i_1_n_0\,
      D => operand_a_set_reg0(7),
      Q => p_1_in3_in(7),
      R => SR(0)
    );
\operand_a_set_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \operand_a_set[31]_i_1_n_0\,
      D => operand_a_set_reg06_out(3),
      Q => \operand_a_set_reg_n_0_[3]\,
      R => SR(0)
    );
\operand_a_set_reg[40]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \operand_a_set[63]_i_1_n_0\,
      D => operand_a_set_reg0(8),
      Q => p_1_in3_in(8),
      R => SR(0)
    );
\operand_a_set_reg[41]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \operand_a_set[63]_i_1_n_0\,
      D => operand_a_set_reg0(9),
      Q => p_1_in3_in(9),
      R => SR(0)
    );
\operand_a_set_reg[42]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \operand_a_set[63]_i_1_n_0\,
      D => operand_a_set_reg0(10),
      Q => p_1_in3_in(10),
      R => SR(0)
    );
\operand_a_set_reg[43]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \operand_a_set[63]_i_1_n_0\,
      D => operand_a_set_reg0(11),
      Q => p_1_in3_in(11),
      R => SR(0)
    );
\operand_a_set_reg[44]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \operand_a_set[63]_i_1_n_0\,
      D => operand_a_set_reg0(12),
      Q => p_1_in3_in(12),
      R => SR(0)
    );
\operand_a_set_reg[45]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \operand_a_set[63]_i_1_n_0\,
      D => operand_a_set_reg0(13),
      Q => p_1_in3_in(13),
      R => SR(0)
    );
\operand_a_set_reg[46]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \operand_a_set[63]_i_1_n_0\,
      D => operand_a_set_reg0(14),
      Q => p_1_in3_in(14),
      R => SR(0)
    );
\operand_a_set_reg[47]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \operand_a_set[63]_i_1_n_0\,
      D => operand_a_set_reg0(15),
      Q => p_1_in3_in(15),
      R => SR(0)
    );
\operand_a_set_reg[48]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \operand_a_set[63]_i_1_n_0\,
      D => operand_a_set_reg0(16),
      Q => p_1_in3_in(16),
      R => SR(0)
    );
\operand_a_set_reg[49]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \operand_a_set[63]_i_1_n_0\,
      D => operand_a_set_reg0(17),
      Q => p_1_in3_in(17),
      R => SR(0)
    );
\operand_a_set_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \operand_a_set[31]_i_1_n_0\,
      D => operand_a_set_reg06_out(4),
      Q => \operand_a_set_reg_n_0_[4]\,
      R => SR(0)
    );
\operand_a_set_reg[50]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \operand_a_set[63]_i_1_n_0\,
      D => operand_a_set_reg0(18),
      Q => p_1_in3_in(18),
      R => SR(0)
    );
\operand_a_set_reg[51]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \operand_a_set[63]_i_1_n_0\,
      D => operand_a_set_reg0(19),
      Q => p_1_in3_in(19),
      R => SR(0)
    );
\operand_a_set_reg[52]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \operand_a_set[63]_i_1_n_0\,
      D => operand_a_set_reg0(20),
      Q => p_1_in3_in(20),
      R => SR(0)
    );
\operand_a_set_reg[53]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \operand_a_set[63]_i_1_n_0\,
      D => operand_a_set_reg0(21),
      Q => p_1_in3_in(21),
      R => SR(0)
    );
\operand_a_set_reg[54]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \operand_a_set[63]_i_1_n_0\,
      D => operand_a_set_reg0(22),
      Q => p_1_in3_in(22),
      R => SR(0)
    );
\operand_a_set_reg[55]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \operand_a_set[63]_i_1_n_0\,
      D => operand_a_set_reg0(23),
      Q => p_1_in3_in(23),
      R => SR(0)
    );
\operand_a_set_reg[56]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \operand_a_set[63]_i_1_n_0\,
      D => operand_a_set_reg0(24),
      Q => p_1_in3_in(24),
      R => SR(0)
    );
\operand_a_set_reg[57]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \operand_a_set[63]_i_1_n_0\,
      D => operand_a_set_reg0(25),
      Q => p_1_in3_in(25),
      R => SR(0)
    );
\operand_a_set_reg[58]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \operand_a_set[63]_i_1_n_0\,
      D => operand_a_set_reg0(26),
      Q => p_1_in3_in(26),
      R => SR(0)
    );
\operand_a_set_reg[59]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \operand_a_set[63]_i_1_n_0\,
      D => operand_a_set_reg0(27),
      Q => p_1_in3_in(27),
      R => SR(0)
    );
\operand_a_set_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \operand_a_set[31]_i_1_n_0\,
      D => operand_a_set_reg06_out(5),
      Q => \operand_a_set_reg_n_0_[5]\,
      R => SR(0)
    );
\operand_a_set_reg[60]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \operand_a_set[63]_i_1_n_0\,
      D => operand_a_set_reg0(28),
      Q => p_1_in3_in(28),
      R => SR(0)
    );
\operand_a_set_reg[61]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \operand_a_set[63]_i_1_n_0\,
      D => operand_a_set_reg0(29),
      Q => p_1_in3_in(29),
      R => SR(0)
    );
\operand_a_set_reg[62]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \operand_a_set[63]_i_1_n_0\,
      D => operand_a_set_reg0(30),
      Q => p_1_in3_in(30),
      R => SR(0)
    );
\operand_a_set_reg[63]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \operand_a_set[63]_i_1_n_0\,
      D => operand_a_set_reg0(31),
      Q => p_1_in3_in(31),
      R => SR(0)
    );
\operand_a_set_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \operand_a_set[31]_i_1_n_0\,
      D => operand_a_set_reg06_out(6),
      Q => \operand_a_set_reg_n_0_[6]\,
      R => SR(0)
    );
\operand_a_set_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \operand_a_set[31]_i_1_n_0\,
      D => operand_a_set_reg06_out(7),
      Q => \operand_a_set_reg_n_0_[7]\,
      R => SR(0)
    );
\operand_a_set_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \operand_a_set[31]_i_1_n_0\,
      D => operand_a_set_reg06_out(8),
      Q => \operand_a_set_reg_n_0_[8]\,
      R => SR(0)
    );
\operand_a_set_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \operand_a_set[31]_i_1_n_0\,
      D => operand_a_set_reg06_out(9),
      Q => \operand_a_set_reg_n_0_[9]\,
      R => SR(0)
    );
\operand_b_set[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_control_WDATA(0),
      I1 => s_axi_control_WSTRB(0),
      I2 => \operand_b_set_reg_n_0_[0]\,
      O => operand_b_set_reg03_out(0)
    );
\operand_b_set[10]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_control_WDATA(10),
      I1 => s_axi_control_WSTRB(1),
      I2 => \operand_b_set_reg_n_0_[10]\,
      O => operand_b_set_reg03_out(10)
    );
\operand_b_set[11]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_control_WDATA(11),
      I1 => s_axi_control_WSTRB(1),
      I2 => \operand_b_set_reg_n_0_[11]\,
      O => operand_b_set_reg03_out(11)
    );
\operand_b_set[12]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_control_WDATA(12),
      I1 => s_axi_control_WSTRB(1),
      I2 => \operand_b_set_reg_n_0_[12]\,
      O => operand_b_set_reg03_out(12)
    );
\operand_b_set[13]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_control_WDATA(13),
      I1 => s_axi_control_WSTRB(1),
      I2 => \operand_b_set_reg_n_0_[13]\,
      O => operand_b_set_reg03_out(13)
    );
\operand_b_set[14]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_control_WDATA(14),
      I1 => s_axi_control_WSTRB(1),
      I2 => \operand_b_set_reg_n_0_[14]\,
      O => operand_b_set_reg03_out(14)
    );
\operand_b_set[15]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_control_WDATA(15),
      I1 => s_axi_control_WSTRB(1),
      I2 => \operand_b_set_reg_n_0_[15]\,
      O => operand_b_set_reg03_out(15)
    );
\operand_b_set[16]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_control_WDATA(16),
      I1 => s_axi_control_WSTRB(2),
      I2 => \operand_b_set_reg_n_0_[16]\,
      O => operand_b_set_reg03_out(16)
    );
\operand_b_set[17]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_control_WDATA(17),
      I1 => s_axi_control_WSTRB(2),
      I2 => \operand_b_set_reg_n_0_[17]\,
      O => operand_b_set_reg03_out(17)
    );
\operand_b_set[18]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_control_WDATA(18),
      I1 => s_axi_control_WSTRB(2),
      I2 => \operand_b_set_reg_n_0_[18]\,
      O => operand_b_set_reg03_out(18)
    );
\operand_b_set[19]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_control_WDATA(19),
      I1 => s_axi_control_WSTRB(2),
      I2 => \operand_b_set_reg_n_0_[19]\,
      O => operand_b_set_reg03_out(19)
    );
\operand_b_set[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_control_WDATA(1),
      I1 => s_axi_control_WSTRB(0),
      I2 => \operand_b_set_reg_n_0_[1]\,
      O => operand_b_set_reg03_out(1)
    );
\operand_b_set[20]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_control_WDATA(20),
      I1 => s_axi_control_WSTRB(2),
      I2 => \operand_b_set_reg_n_0_[20]\,
      O => operand_b_set_reg03_out(20)
    );
\operand_b_set[21]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_control_WDATA(21),
      I1 => s_axi_control_WSTRB(2),
      I2 => \operand_b_set_reg_n_0_[21]\,
      O => operand_b_set_reg03_out(21)
    );
\operand_b_set[22]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_control_WDATA(22),
      I1 => s_axi_control_WSTRB(2),
      I2 => \operand_b_set_reg_n_0_[22]\,
      O => operand_b_set_reg03_out(22)
    );
\operand_b_set[23]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_control_WDATA(23),
      I1 => s_axi_control_WSTRB(2),
      I2 => \operand_b_set_reg_n_0_[23]\,
      O => operand_b_set_reg03_out(23)
    );
\operand_b_set[24]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_control_WDATA(24),
      I1 => s_axi_control_WSTRB(3),
      I2 => \operand_b_set_reg_n_0_[24]\,
      O => operand_b_set_reg03_out(24)
    );
\operand_b_set[25]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_control_WDATA(25),
      I1 => s_axi_control_WSTRB(3),
      I2 => \operand_b_set_reg_n_0_[25]\,
      O => operand_b_set_reg03_out(25)
    );
\operand_b_set[26]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_control_WDATA(26),
      I1 => s_axi_control_WSTRB(3),
      I2 => \operand_b_set_reg_n_0_[26]\,
      O => operand_b_set_reg03_out(26)
    );
\operand_b_set[27]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_control_WDATA(27),
      I1 => s_axi_control_WSTRB(3),
      I2 => \operand_b_set_reg_n_0_[27]\,
      O => operand_b_set_reg03_out(27)
    );
\operand_b_set[28]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_control_WDATA(28),
      I1 => s_axi_control_WSTRB(3),
      I2 => \operand_b_set_reg_n_0_[28]\,
      O => operand_b_set_reg03_out(28)
    );
\operand_b_set[29]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_control_WDATA(29),
      I1 => s_axi_control_WSTRB(3),
      I2 => \operand_b_set_reg_n_0_[29]\,
      O => operand_b_set_reg03_out(29)
    );
\operand_b_set[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_control_WDATA(2),
      I1 => s_axi_control_WSTRB(0),
      I2 => \operand_b_set_reg_n_0_[2]\,
      O => operand_b_set_reg03_out(2)
    );
\operand_b_set[30]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_control_WDATA(30),
      I1 => s_axi_control_WSTRB(3),
      I2 => \operand_b_set_reg_n_0_[30]\,
      O => operand_b_set_reg03_out(30)
    );
\operand_b_set[31]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000080"
    )
        port map (
      I0 => waddr(3),
      I1 => \operand_a_set[31]_i_3_n_0\,
      I2 => waddr(2),
      I3 => waddr(5),
      I4 => waddr(4),
      O => \operand_b_set[31]_i_1_n_0\
    );
\operand_b_set[31]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_control_WDATA(31),
      I1 => s_axi_control_WSTRB(3),
      I2 => \operand_b_set_reg_n_0_[31]\,
      O => operand_b_set_reg03_out(31)
    );
\operand_b_set[32]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_control_WDATA(0),
      I1 => s_axi_control_WSTRB(0),
      I2 => p_1_in1_in(0),
      O => operand_b_set_reg0(0)
    );
\operand_b_set[33]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_control_WDATA(1),
      I1 => s_axi_control_WSTRB(0),
      I2 => p_1_in1_in(1),
      O => operand_b_set_reg0(1)
    );
\operand_b_set[34]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_control_WDATA(2),
      I1 => s_axi_control_WSTRB(0),
      I2 => p_1_in1_in(2),
      O => operand_b_set_reg0(2)
    );
\operand_b_set[35]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_control_WDATA(3),
      I1 => s_axi_control_WSTRB(0),
      I2 => p_1_in1_in(3),
      O => operand_b_set_reg0(3)
    );
\operand_b_set[36]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_control_WDATA(4),
      I1 => s_axi_control_WSTRB(0),
      I2 => p_1_in1_in(4),
      O => operand_b_set_reg0(4)
    );
\operand_b_set[37]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_control_WDATA(5),
      I1 => s_axi_control_WSTRB(0),
      I2 => p_1_in1_in(5),
      O => operand_b_set_reg0(5)
    );
\operand_b_set[38]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_control_WDATA(6),
      I1 => s_axi_control_WSTRB(0),
      I2 => p_1_in1_in(6),
      O => operand_b_set_reg0(6)
    );
\operand_b_set[39]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_control_WDATA(7),
      I1 => s_axi_control_WSTRB(0),
      I2 => p_1_in1_in(7),
      O => operand_b_set_reg0(7)
    );
\operand_b_set[3]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_control_WDATA(3),
      I1 => s_axi_control_WSTRB(0),
      I2 => \operand_b_set_reg_n_0_[3]\,
      O => operand_b_set_reg03_out(3)
    );
\operand_b_set[40]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_control_WDATA(8),
      I1 => s_axi_control_WSTRB(1),
      I2 => p_1_in1_in(8),
      O => operand_b_set_reg0(8)
    );
\operand_b_set[41]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_control_WDATA(9),
      I1 => s_axi_control_WSTRB(1),
      I2 => p_1_in1_in(9),
      O => operand_b_set_reg0(9)
    );
\operand_b_set[42]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_control_WDATA(10),
      I1 => s_axi_control_WSTRB(1),
      I2 => p_1_in1_in(10),
      O => operand_b_set_reg0(10)
    );
\operand_b_set[43]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_control_WDATA(11),
      I1 => s_axi_control_WSTRB(1),
      I2 => p_1_in1_in(11),
      O => operand_b_set_reg0(11)
    );
\operand_b_set[44]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_control_WDATA(12),
      I1 => s_axi_control_WSTRB(1),
      I2 => p_1_in1_in(12),
      O => operand_b_set_reg0(12)
    );
\operand_b_set[45]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_control_WDATA(13),
      I1 => s_axi_control_WSTRB(1),
      I2 => p_1_in1_in(13),
      O => operand_b_set_reg0(13)
    );
\operand_b_set[46]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_control_WDATA(14),
      I1 => s_axi_control_WSTRB(1),
      I2 => p_1_in1_in(14),
      O => operand_b_set_reg0(14)
    );
\operand_b_set[47]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_control_WDATA(15),
      I1 => s_axi_control_WSTRB(1),
      I2 => p_1_in1_in(15),
      O => operand_b_set_reg0(15)
    );
\operand_b_set[48]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_control_WDATA(16),
      I1 => s_axi_control_WSTRB(2),
      I2 => p_1_in1_in(16),
      O => operand_b_set_reg0(16)
    );
\operand_b_set[49]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_control_WDATA(17),
      I1 => s_axi_control_WSTRB(2),
      I2 => p_1_in1_in(17),
      O => operand_b_set_reg0(17)
    );
\operand_b_set[4]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_control_WDATA(4),
      I1 => s_axi_control_WSTRB(0),
      I2 => \operand_b_set_reg_n_0_[4]\,
      O => operand_b_set_reg03_out(4)
    );
\operand_b_set[50]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_control_WDATA(18),
      I1 => s_axi_control_WSTRB(2),
      I2 => p_1_in1_in(18),
      O => operand_b_set_reg0(18)
    );
\operand_b_set[51]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_control_WDATA(19),
      I1 => s_axi_control_WSTRB(2),
      I2 => p_1_in1_in(19),
      O => operand_b_set_reg0(19)
    );
\operand_b_set[52]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_control_WDATA(20),
      I1 => s_axi_control_WSTRB(2),
      I2 => p_1_in1_in(20),
      O => operand_b_set_reg0(20)
    );
\operand_b_set[53]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_control_WDATA(21),
      I1 => s_axi_control_WSTRB(2),
      I2 => p_1_in1_in(21),
      O => operand_b_set_reg0(21)
    );
\operand_b_set[54]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_control_WDATA(22),
      I1 => s_axi_control_WSTRB(2),
      I2 => p_1_in1_in(22),
      O => operand_b_set_reg0(22)
    );
\operand_b_set[55]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_control_WDATA(23),
      I1 => s_axi_control_WSTRB(2),
      I2 => p_1_in1_in(23),
      O => operand_b_set_reg0(23)
    );
\operand_b_set[56]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_control_WDATA(24),
      I1 => s_axi_control_WSTRB(3),
      I2 => p_1_in1_in(24),
      O => operand_b_set_reg0(24)
    );
\operand_b_set[57]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_control_WDATA(25),
      I1 => s_axi_control_WSTRB(3),
      I2 => p_1_in1_in(25),
      O => operand_b_set_reg0(25)
    );
\operand_b_set[58]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_control_WDATA(26),
      I1 => s_axi_control_WSTRB(3),
      I2 => p_1_in1_in(26),
      O => operand_b_set_reg0(26)
    );
\operand_b_set[59]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_control_WDATA(27),
      I1 => s_axi_control_WSTRB(3),
      I2 => p_1_in1_in(27),
      O => operand_b_set_reg0(27)
    );
\operand_b_set[5]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_control_WDATA(5),
      I1 => s_axi_control_WSTRB(0),
      I2 => \operand_b_set_reg_n_0_[5]\,
      O => operand_b_set_reg03_out(5)
    );
\operand_b_set[60]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_control_WDATA(28),
      I1 => s_axi_control_WSTRB(3),
      I2 => p_1_in1_in(28),
      O => operand_b_set_reg0(28)
    );
\operand_b_set[61]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_control_WDATA(29),
      I1 => s_axi_control_WSTRB(3),
      I2 => p_1_in1_in(29),
      O => operand_b_set_reg0(29)
    );
\operand_b_set[62]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_control_WDATA(30),
      I1 => s_axi_control_WSTRB(3),
      I2 => p_1_in1_in(30),
      O => operand_b_set_reg0(30)
    );
\operand_b_set[63]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000400"
    )
        port map (
      I0 => waddr(2),
      I1 => \operand_a_set[31]_i_3_n_0\,
      I2 => waddr(5),
      I3 => waddr(4),
      I4 => waddr(3),
      O => \operand_b_set[63]_i_1_n_0\
    );
\operand_b_set[63]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_control_WDATA(31),
      I1 => s_axi_control_WSTRB(3),
      I2 => p_1_in1_in(31),
      O => operand_b_set_reg0(31)
    );
\operand_b_set[6]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_control_WDATA(6),
      I1 => s_axi_control_WSTRB(0),
      I2 => \operand_b_set_reg_n_0_[6]\,
      O => operand_b_set_reg03_out(6)
    );
\operand_b_set[7]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_control_WDATA(7),
      I1 => s_axi_control_WSTRB(0),
      I2 => \operand_b_set_reg_n_0_[7]\,
      O => operand_b_set_reg03_out(7)
    );
\operand_b_set[8]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_control_WDATA(8),
      I1 => s_axi_control_WSTRB(1),
      I2 => \operand_b_set_reg_n_0_[8]\,
      O => operand_b_set_reg03_out(8)
    );
\operand_b_set[9]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_control_WDATA(9),
      I1 => s_axi_control_WSTRB(1),
      I2 => \operand_b_set_reg_n_0_[9]\,
      O => operand_b_set_reg03_out(9)
    );
\operand_b_set_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \operand_b_set[31]_i_1_n_0\,
      D => operand_b_set_reg03_out(0),
      Q => \operand_b_set_reg_n_0_[0]\,
      R => SR(0)
    );
\operand_b_set_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \operand_b_set[31]_i_1_n_0\,
      D => operand_b_set_reg03_out(10),
      Q => \operand_b_set_reg_n_0_[10]\,
      R => SR(0)
    );
\operand_b_set_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \operand_b_set[31]_i_1_n_0\,
      D => operand_b_set_reg03_out(11),
      Q => \operand_b_set_reg_n_0_[11]\,
      R => SR(0)
    );
\operand_b_set_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \operand_b_set[31]_i_1_n_0\,
      D => operand_b_set_reg03_out(12),
      Q => \operand_b_set_reg_n_0_[12]\,
      R => SR(0)
    );
\operand_b_set_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \operand_b_set[31]_i_1_n_0\,
      D => operand_b_set_reg03_out(13),
      Q => \operand_b_set_reg_n_0_[13]\,
      R => SR(0)
    );
\operand_b_set_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \operand_b_set[31]_i_1_n_0\,
      D => operand_b_set_reg03_out(14),
      Q => \operand_b_set_reg_n_0_[14]\,
      R => SR(0)
    );
\operand_b_set_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \operand_b_set[31]_i_1_n_0\,
      D => operand_b_set_reg03_out(15),
      Q => \operand_b_set_reg_n_0_[15]\,
      R => SR(0)
    );
\operand_b_set_reg[16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \operand_b_set[31]_i_1_n_0\,
      D => operand_b_set_reg03_out(16),
      Q => \operand_b_set_reg_n_0_[16]\,
      R => SR(0)
    );
\operand_b_set_reg[17]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \operand_b_set[31]_i_1_n_0\,
      D => operand_b_set_reg03_out(17),
      Q => \operand_b_set_reg_n_0_[17]\,
      R => SR(0)
    );
\operand_b_set_reg[18]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \operand_b_set[31]_i_1_n_0\,
      D => operand_b_set_reg03_out(18),
      Q => \operand_b_set_reg_n_0_[18]\,
      R => SR(0)
    );
\operand_b_set_reg[19]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \operand_b_set[31]_i_1_n_0\,
      D => operand_b_set_reg03_out(19),
      Q => \operand_b_set_reg_n_0_[19]\,
      R => SR(0)
    );
\operand_b_set_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \operand_b_set[31]_i_1_n_0\,
      D => operand_b_set_reg03_out(1),
      Q => \operand_b_set_reg_n_0_[1]\,
      R => SR(0)
    );
\operand_b_set_reg[20]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \operand_b_set[31]_i_1_n_0\,
      D => operand_b_set_reg03_out(20),
      Q => \operand_b_set_reg_n_0_[20]\,
      R => SR(0)
    );
\operand_b_set_reg[21]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \operand_b_set[31]_i_1_n_0\,
      D => operand_b_set_reg03_out(21),
      Q => \operand_b_set_reg_n_0_[21]\,
      R => SR(0)
    );
\operand_b_set_reg[22]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \operand_b_set[31]_i_1_n_0\,
      D => operand_b_set_reg03_out(22),
      Q => \operand_b_set_reg_n_0_[22]\,
      R => SR(0)
    );
\operand_b_set_reg[23]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \operand_b_set[31]_i_1_n_0\,
      D => operand_b_set_reg03_out(23),
      Q => \operand_b_set_reg_n_0_[23]\,
      R => SR(0)
    );
\operand_b_set_reg[24]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \operand_b_set[31]_i_1_n_0\,
      D => operand_b_set_reg03_out(24),
      Q => \operand_b_set_reg_n_0_[24]\,
      R => SR(0)
    );
\operand_b_set_reg[25]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \operand_b_set[31]_i_1_n_0\,
      D => operand_b_set_reg03_out(25),
      Q => \operand_b_set_reg_n_0_[25]\,
      R => SR(0)
    );
\operand_b_set_reg[26]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \operand_b_set[31]_i_1_n_0\,
      D => operand_b_set_reg03_out(26),
      Q => \operand_b_set_reg_n_0_[26]\,
      R => SR(0)
    );
\operand_b_set_reg[27]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \operand_b_set[31]_i_1_n_0\,
      D => operand_b_set_reg03_out(27),
      Q => \operand_b_set_reg_n_0_[27]\,
      R => SR(0)
    );
\operand_b_set_reg[28]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \operand_b_set[31]_i_1_n_0\,
      D => operand_b_set_reg03_out(28),
      Q => \operand_b_set_reg_n_0_[28]\,
      R => SR(0)
    );
\operand_b_set_reg[29]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \operand_b_set[31]_i_1_n_0\,
      D => operand_b_set_reg03_out(29),
      Q => \operand_b_set_reg_n_0_[29]\,
      R => SR(0)
    );
\operand_b_set_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \operand_b_set[31]_i_1_n_0\,
      D => operand_b_set_reg03_out(2),
      Q => \operand_b_set_reg_n_0_[2]\,
      R => SR(0)
    );
\operand_b_set_reg[30]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \operand_b_set[31]_i_1_n_0\,
      D => operand_b_set_reg03_out(30),
      Q => \operand_b_set_reg_n_0_[30]\,
      R => SR(0)
    );
\operand_b_set_reg[31]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \operand_b_set[31]_i_1_n_0\,
      D => operand_b_set_reg03_out(31),
      Q => \operand_b_set_reg_n_0_[31]\,
      R => SR(0)
    );
\operand_b_set_reg[32]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \operand_b_set[63]_i_1_n_0\,
      D => operand_b_set_reg0(0),
      Q => p_1_in1_in(0),
      R => SR(0)
    );
\operand_b_set_reg[33]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \operand_b_set[63]_i_1_n_0\,
      D => operand_b_set_reg0(1),
      Q => p_1_in1_in(1),
      R => SR(0)
    );
\operand_b_set_reg[34]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \operand_b_set[63]_i_1_n_0\,
      D => operand_b_set_reg0(2),
      Q => p_1_in1_in(2),
      R => SR(0)
    );
\operand_b_set_reg[35]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \operand_b_set[63]_i_1_n_0\,
      D => operand_b_set_reg0(3),
      Q => p_1_in1_in(3),
      R => SR(0)
    );
\operand_b_set_reg[36]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \operand_b_set[63]_i_1_n_0\,
      D => operand_b_set_reg0(4),
      Q => p_1_in1_in(4),
      R => SR(0)
    );
\operand_b_set_reg[37]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \operand_b_set[63]_i_1_n_0\,
      D => operand_b_set_reg0(5),
      Q => p_1_in1_in(5),
      R => SR(0)
    );
\operand_b_set_reg[38]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \operand_b_set[63]_i_1_n_0\,
      D => operand_b_set_reg0(6),
      Q => p_1_in1_in(6),
      R => SR(0)
    );
\operand_b_set_reg[39]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \operand_b_set[63]_i_1_n_0\,
      D => operand_b_set_reg0(7),
      Q => p_1_in1_in(7),
      R => SR(0)
    );
\operand_b_set_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \operand_b_set[31]_i_1_n_0\,
      D => operand_b_set_reg03_out(3),
      Q => \operand_b_set_reg_n_0_[3]\,
      R => SR(0)
    );
\operand_b_set_reg[40]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \operand_b_set[63]_i_1_n_0\,
      D => operand_b_set_reg0(8),
      Q => p_1_in1_in(8),
      R => SR(0)
    );
\operand_b_set_reg[41]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \operand_b_set[63]_i_1_n_0\,
      D => operand_b_set_reg0(9),
      Q => p_1_in1_in(9),
      R => SR(0)
    );
\operand_b_set_reg[42]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \operand_b_set[63]_i_1_n_0\,
      D => operand_b_set_reg0(10),
      Q => p_1_in1_in(10),
      R => SR(0)
    );
\operand_b_set_reg[43]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \operand_b_set[63]_i_1_n_0\,
      D => operand_b_set_reg0(11),
      Q => p_1_in1_in(11),
      R => SR(0)
    );
\operand_b_set_reg[44]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \operand_b_set[63]_i_1_n_0\,
      D => operand_b_set_reg0(12),
      Q => p_1_in1_in(12),
      R => SR(0)
    );
\operand_b_set_reg[45]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \operand_b_set[63]_i_1_n_0\,
      D => operand_b_set_reg0(13),
      Q => p_1_in1_in(13),
      R => SR(0)
    );
\operand_b_set_reg[46]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \operand_b_set[63]_i_1_n_0\,
      D => operand_b_set_reg0(14),
      Q => p_1_in1_in(14),
      R => SR(0)
    );
\operand_b_set_reg[47]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \operand_b_set[63]_i_1_n_0\,
      D => operand_b_set_reg0(15),
      Q => p_1_in1_in(15),
      R => SR(0)
    );
\operand_b_set_reg[48]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \operand_b_set[63]_i_1_n_0\,
      D => operand_b_set_reg0(16),
      Q => p_1_in1_in(16),
      R => SR(0)
    );
\operand_b_set_reg[49]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \operand_b_set[63]_i_1_n_0\,
      D => operand_b_set_reg0(17),
      Q => p_1_in1_in(17),
      R => SR(0)
    );
\operand_b_set_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \operand_b_set[31]_i_1_n_0\,
      D => operand_b_set_reg03_out(4),
      Q => \operand_b_set_reg_n_0_[4]\,
      R => SR(0)
    );
\operand_b_set_reg[50]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \operand_b_set[63]_i_1_n_0\,
      D => operand_b_set_reg0(18),
      Q => p_1_in1_in(18),
      R => SR(0)
    );
\operand_b_set_reg[51]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \operand_b_set[63]_i_1_n_0\,
      D => operand_b_set_reg0(19),
      Q => p_1_in1_in(19),
      R => SR(0)
    );
\operand_b_set_reg[52]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \operand_b_set[63]_i_1_n_0\,
      D => operand_b_set_reg0(20),
      Q => p_1_in1_in(20),
      R => SR(0)
    );
\operand_b_set_reg[53]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \operand_b_set[63]_i_1_n_0\,
      D => operand_b_set_reg0(21),
      Q => p_1_in1_in(21),
      R => SR(0)
    );
\operand_b_set_reg[54]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \operand_b_set[63]_i_1_n_0\,
      D => operand_b_set_reg0(22),
      Q => p_1_in1_in(22),
      R => SR(0)
    );
\operand_b_set_reg[55]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \operand_b_set[63]_i_1_n_0\,
      D => operand_b_set_reg0(23),
      Q => p_1_in1_in(23),
      R => SR(0)
    );
\operand_b_set_reg[56]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \operand_b_set[63]_i_1_n_0\,
      D => operand_b_set_reg0(24),
      Q => p_1_in1_in(24),
      R => SR(0)
    );
\operand_b_set_reg[57]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \operand_b_set[63]_i_1_n_0\,
      D => operand_b_set_reg0(25),
      Q => p_1_in1_in(25),
      R => SR(0)
    );
\operand_b_set_reg[58]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \operand_b_set[63]_i_1_n_0\,
      D => operand_b_set_reg0(26),
      Q => p_1_in1_in(26),
      R => SR(0)
    );
\operand_b_set_reg[59]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \operand_b_set[63]_i_1_n_0\,
      D => operand_b_set_reg0(27),
      Q => p_1_in1_in(27),
      R => SR(0)
    );
\operand_b_set_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \operand_b_set[31]_i_1_n_0\,
      D => operand_b_set_reg03_out(5),
      Q => \operand_b_set_reg_n_0_[5]\,
      R => SR(0)
    );
\operand_b_set_reg[60]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \operand_b_set[63]_i_1_n_0\,
      D => operand_b_set_reg0(28),
      Q => p_1_in1_in(28),
      R => SR(0)
    );
\operand_b_set_reg[61]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \operand_b_set[63]_i_1_n_0\,
      D => operand_b_set_reg0(29),
      Q => p_1_in1_in(29),
      R => SR(0)
    );
\operand_b_set_reg[62]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \operand_b_set[63]_i_1_n_0\,
      D => operand_b_set_reg0(30),
      Q => p_1_in1_in(30),
      R => SR(0)
    );
\operand_b_set_reg[63]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \operand_b_set[63]_i_1_n_0\,
      D => operand_b_set_reg0(31),
      Q => p_1_in1_in(31),
      R => SR(0)
    );
\operand_b_set_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \operand_b_set[31]_i_1_n_0\,
      D => operand_b_set_reg03_out(6),
      Q => \operand_b_set_reg_n_0_[6]\,
      R => SR(0)
    );
\operand_b_set_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \operand_b_set[31]_i_1_n_0\,
      D => operand_b_set_reg03_out(7),
      Q => \operand_b_set_reg_n_0_[7]\,
      R => SR(0)
    );
\operand_b_set_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \operand_b_set[31]_i_1_n_0\,
      D => operand_b_set_reg03_out(8),
      Q => \operand_b_set_reg_n_0_[8]\,
      R => SR(0)
    );
\operand_b_set_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \operand_b_set[31]_i_1_n_0\,
      D => operand_b_set_reg03_out(9),
      Q => \operand_b_set_reg_n_0_[9]\,
      R => SR(0)
    );
\precision_out_set[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_control_WDATA(0),
      I1 => s_axi_control_WSTRB(0),
      I2 => \precision_out_set_reg_n_0_[0]\,
      O => precision_out_set0(0)
    );
\precision_out_set[1]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000400"
    )
        port map (
      I0 => waddr(4),
      I1 => waddr(5),
      I2 => waddr(2),
      I3 => \operand_a_set[31]_i_3_n_0\,
      I4 => waddr(3),
      O => \precision_out_set[1]_i_1_n_0\
    );
\precision_out_set[1]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_control_WDATA(1),
      I1 => s_axi_control_WSTRB(0),
      I2 => \precision_out_set_reg_n_0_[1]\,
      O => precision_out_set0(1)
    );
\precision_out_set_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \precision_out_set[1]_i_1_n_0\,
      D => precision_out_set0(0),
      Q => \precision_out_set_reg_n_0_[0]\,
      R => SR(0)
    );
\precision_out_set_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \precision_out_set[1]_i_1_n_0\,
      D => precision_out_set0(1),
      Q => \precision_out_set_reg_n_0_[1]\,
      R => SR(0)
    );
\precision_set[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_control_WDATA(0),
      I1 => s_axi_control_WSTRB(0),
      I2 => \precision_set_reg_n_0_[0]\,
      O => precision_set0(0)
    );
\precision_set[1]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0080"
    )
        port map (
      I0 => waddr(5),
      I1 => \precision_set[1]_i_3_n_0\,
      I2 => waddr(4),
      I3 => waddr(3),
      O => \precision_set[1]_i_1_n_0\
    );
\precision_set[1]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_control_WDATA(1),
      I1 => s_axi_control_WSTRB(0),
      I2 => \precision_set_reg_n_0_[1]\,
      O => precision_set0(1)
    );
\precision_set[1]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0008"
    )
        port map (
      I0 => \^fsm_onehot_wstate_reg[2]_0\,
      I1 => s_axi_control_WVALID,
      I2 => waddr(6),
      I3 => waddr(2),
      O => \precision_set[1]_i_3_n_0\
    );
\precision_set_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \precision_set[1]_i_1_n_0\,
      D => precision_set0(0),
      Q => \precision_set_reg_n_0_[0]\,
      R => SR(0)
    );
\precision_set_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \precision_set[1]_i_1_n_0\,
      D => precision_set0(1),
      Q => \precision_set_reg_n_0_[1]\,
      R => SR(0)
    );
\rdata[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000CCE200E2"
    )
        port map (
      I0 => \rdata_reg[0]_i_2_n_0\,
      I1 => s_axi_control_ARADDR(6),
      I2 => \rdata_reg[0]_i_3_n_0\,
      I3 => s_axi_control_ARADDR(2),
      I4 => \rdata_reg[0]_i_4_n_0\,
      I5 => s_axi_control_ARADDR(0),
      O => \rdata[0]_i_1_n_0\
    );
\rdata[0]_i_10\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"3808"
    )
        port map (
      I0 => \exceptions_set_reg_n_0_[0]\,
      I1 => s_axi_control_ARADDR(4),
      I2 => s_axi_control_ARADDR(3),
      I3 => p_1_in(0),
      O => \rdata[0]_i_10_n_0\
    );
\rdata[0]_i_5\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => s_axi_control_ARADDR(4),
      I1 => s_axi_control_ARADDR(3),
      I2 => \rst_n_set_reg_n_0_[0]\,
      O => \rdata[0]_i_5_n_0\
    );
\rdata[0]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \op_set_reg_n_0_[0]\,
      I1 => \precision_set_reg_n_0_[0]\,
      I2 => s_axi_control_ARADDR(4),
      I3 => \valid_in_set_reg_n_0_[0]\,
      I4 => s_axi_control_ARADDR(3),
      I5 => \ce_r_set_reg_n_0_[0]\,
      O => \rdata[0]_i_6_n_0\
    );
\rdata[0]_i_7\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"A0A0CFC0"
    )
        port map (
      I0 => \valid_out_set_reg_n_0_[0]\,
      I1 => p_1_in1_in(0),
      I2 => s_axi_control_ARADDR(4),
      I3 => \operand_a_set_reg_n_0_[0]\,
      I4 => s_axi_control_ARADDR(3),
      O => \rdata[0]_i_7_n_0\
    );
\rdata[0]_i_8\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00E2"
    )
        port map (
      I0 => \precision_out_set_reg_n_0_[0]\,
      I1 => s_axi_control_ARADDR(3),
      I2 => \result_set_reg_n_0_[0]\,
      I3 => s_axi_control_ARADDR(4),
      O => \rdata[0]_i_8_n_0\
    );
\rdata[0]_i_9\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00E2"
    )
        port map (
      I0 => p_1_in3_in(0),
      I1 => s_axi_control_ARADDR(3),
      I2 => \operand_b_set_reg_n_0_[0]\,
      I3 => s_axi_control_ARADDR(4),
      O => \rdata[0]_i_9_n_0\
    );
\rdata[10]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0000A808"
    )
        port map (
      I0 => s_axi_control_ARADDR(6),
      I1 => \rdata[10]_i_2_n_0\,
      I2 => s_axi_control_ARADDR(2),
      I3 => \rdata[10]_i_3_n_0\,
      I4 => s_axi_control_ARADDR(0),
      O => \rdata[10]_i_1_n_0\
    );
\rdata[10]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0088008830333000"
    )
        port map (
      I0 => \result_set_reg_n_0_[10]\,
      I1 => s_axi_control_ARADDR(5),
      I2 => p_1_in1_in(10),
      I3 => s_axi_control_ARADDR(4),
      I4 => \operand_a_set_reg_n_0_[10]\,
      I5 => s_axi_control_ARADDR(3),
      O => \rdata[10]_i_2_n_0\
    );
\rdata[10]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000BB308830"
    )
        port map (
      I0 => p_1_in(10),
      I1 => s_axi_control_ARADDR(5),
      I2 => p_1_in3_in(10),
      I3 => s_axi_control_ARADDR(3),
      I4 => \operand_b_set_reg_n_0_[10]\,
      I5 => s_axi_control_ARADDR(4),
      O => \rdata[10]_i_3_n_0\
    );
\rdata[11]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0000A808"
    )
        port map (
      I0 => s_axi_control_ARADDR(6),
      I1 => \rdata[11]_i_2_n_0\,
      I2 => s_axi_control_ARADDR(2),
      I3 => \rdata[11]_i_3_n_0\,
      I4 => s_axi_control_ARADDR(0),
      O => \rdata[11]_i_1_n_0\
    );
\rdata[11]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0088008830333000"
    )
        port map (
      I0 => \result_set_reg_n_0_[11]\,
      I1 => s_axi_control_ARADDR(5),
      I2 => p_1_in1_in(11),
      I3 => s_axi_control_ARADDR(4),
      I4 => \operand_a_set_reg_n_0_[11]\,
      I5 => s_axi_control_ARADDR(3),
      O => \rdata[11]_i_2_n_0\
    );
\rdata[11]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000BB308830"
    )
        port map (
      I0 => p_1_in(11),
      I1 => s_axi_control_ARADDR(5),
      I2 => p_1_in3_in(11),
      I3 => s_axi_control_ARADDR(3),
      I4 => \operand_b_set_reg_n_0_[11]\,
      I5 => s_axi_control_ARADDR(4),
      O => \rdata[11]_i_3_n_0\
    );
\rdata[12]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0000A808"
    )
        port map (
      I0 => s_axi_control_ARADDR(6),
      I1 => \rdata[12]_i_2_n_0\,
      I2 => s_axi_control_ARADDR(2),
      I3 => \rdata[12]_i_3_n_0\,
      I4 => s_axi_control_ARADDR(0),
      O => \rdata[12]_i_1_n_0\
    );
\rdata[12]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0088008830333000"
    )
        port map (
      I0 => \result_set_reg_n_0_[12]\,
      I1 => s_axi_control_ARADDR(5),
      I2 => p_1_in1_in(12),
      I3 => s_axi_control_ARADDR(4),
      I4 => \operand_a_set_reg_n_0_[12]\,
      I5 => s_axi_control_ARADDR(3),
      O => \rdata[12]_i_2_n_0\
    );
\rdata[12]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000BB308830"
    )
        port map (
      I0 => p_1_in(12),
      I1 => s_axi_control_ARADDR(5),
      I2 => p_1_in3_in(12),
      I3 => s_axi_control_ARADDR(3),
      I4 => \operand_b_set_reg_n_0_[12]\,
      I5 => s_axi_control_ARADDR(4),
      O => \rdata[12]_i_3_n_0\
    );
\rdata[13]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0000A808"
    )
        port map (
      I0 => s_axi_control_ARADDR(6),
      I1 => \rdata[13]_i_2_n_0\,
      I2 => s_axi_control_ARADDR(2),
      I3 => \rdata[13]_i_3_n_0\,
      I4 => s_axi_control_ARADDR(0),
      O => \rdata[13]_i_1_n_0\
    );
\rdata[13]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0088008830333000"
    )
        port map (
      I0 => \result_set_reg_n_0_[13]\,
      I1 => s_axi_control_ARADDR(5),
      I2 => p_1_in1_in(13),
      I3 => s_axi_control_ARADDR(4),
      I4 => \operand_a_set_reg_n_0_[13]\,
      I5 => s_axi_control_ARADDR(3),
      O => \rdata[13]_i_2_n_0\
    );
\rdata[13]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000BB308830"
    )
        port map (
      I0 => p_1_in(13),
      I1 => s_axi_control_ARADDR(5),
      I2 => p_1_in3_in(13),
      I3 => s_axi_control_ARADDR(3),
      I4 => \operand_b_set_reg_n_0_[13]\,
      I5 => s_axi_control_ARADDR(4),
      O => \rdata[13]_i_3_n_0\
    );
\rdata[14]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0000A808"
    )
        port map (
      I0 => s_axi_control_ARADDR(6),
      I1 => \rdata[14]_i_2_n_0\,
      I2 => s_axi_control_ARADDR(2),
      I3 => \rdata[14]_i_3_n_0\,
      I4 => s_axi_control_ARADDR(0),
      O => \rdata[14]_i_1_n_0\
    );
\rdata[14]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0088008830333000"
    )
        port map (
      I0 => \result_set_reg_n_0_[14]\,
      I1 => s_axi_control_ARADDR(5),
      I2 => p_1_in1_in(14),
      I3 => s_axi_control_ARADDR(4),
      I4 => \operand_a_set_reg_n_0_[14]\,
      I5 => s_axi_control_ARADDR(3),
      O => \rdata[14]_i_2_n_0\
    );
\rdata[14]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000BB308830"
    )
        port map (
      I0 => p_1_in(14),
      I1 => s_axi_control_ARADDR(5),
      I2 => p_1_in3_in(14),
      I3 => s_axi_control_ARADDR(3),
      I4 => \operand_b_set_reg_n_0_[14]\,
      I5 => s_axi_control_ARADDR(4),
      O => \rdata[14]_i_3_n_0\
    );
\rdata[15]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0000A808"
    )
        port map (
      I0 => s_axi_control_ARADDR(6),
      I1 => \rdata[15]_i_2_n_0\,
      I2 => s_axi_control_ARADDR(2),
      I3 => \rdata[15]_i_3_n_0\,
      I4 => s_axi_control_ARADDR(0),
      O => \rdata[15]_i_1_n_0\
    );
\rdata[15]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0088008830333000"
    )
        port map (
      I0 => \result_set_reg_n_0_[15]\,
      I1 => s_axi_control_ARADDR(5),
      I2 => p_1_in1_in(15),
      I3 => s_axi_control_ARADDR(4),
      I4 => \operand_a_set_reg_n_0_[15]\,
      I5 => s_axi_control_ARADDR(3),
      O => \rdata[15]_i_2_n_0\
    );
\rdata[15]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000BB308830"
    )
        port map (
      I0 => p_1_in(15),
      I1 => s_axi_control_ARADDR(5),
      I2 => p_1_in3_in(15),
      I3 => s_axi_control_ARADDR(3),
      I4 => \operand_b_set_reg_n_0_[15]\,
      I5 => s_axi_control_ARADDR(4),
      O => \rdata[15]_i_3_n_0\
    );
\rdata[16]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0000A808"
    )
        port map (
      I0 => s_axi_control_ARADDR(6),
      I1 => \rdata[16]_i_2_n_0\,
      I2 => s_axi_control_ARADDR(2),
      I3 => \rdata[16]_i_3_n_0\,
      I4 => s_axi_control_ARADDR(0),
      O => \rdata[16]_i_1_n_0\
    );
\rdata[16]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0088008830333000"
    )
        port map (
      I0 => \result_set_reg_n_0_[16]\,
      I1 => s_axi_control_ARADDR(5),
      I2 => p_1_in1_in(16),
      I3 => s_axi_control_ARADDR(4),
      I4 => \operand_a_set_reg_n_0_[16]\,
      I5 => s_axi_control_ARADDR(3),
      O => \rdata[16]_i_2_n_0\
    );
\rdata[16]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000BB308830"
    )
        port map (
      I0 => p_1_in(16),
      I1 => s_axi_control_ARADDR(5),
      I2 => p_1_in3_in(16),
      I3 => s_axi_control_ARADDR(3),
      I4 => \operand_b_set_reg_n_0_[16]\,
      I5 => s_axi_control_ARADDR(4),
      O => \rdata[16]_i_3_n_0\
    );
\rdata[17]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0000A808"
    )
        port map (
      I0 => s_axi_control_ARADDR(6),
      I1 => \rdata[17]_i_2_n_0\,
      I2 => s_axi_control_ARADDR(2),
      I3 => \rdata[17]_i_3_n_0\,
      I4 => s_axi_control_ARADDR(0),
      O => \rdata[17]_i_1_n_0\
    );
\rdata[17]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0088008830333000"
    )
        port map (
      I0 => \result_set_reg_n_0_[17]\,
      I1 => s_axi_control_ARADDR(5),
      I2 => p_1_in1_in(17),
      I3 => s_axi_control_ARADDR(4),
      I4 => \operand_a_set_reg_n_0_[17]\,
      I5 => s_axi_control_ARADDR(3),
      O => \rdata[17]_i_2_n_0\
    );
\rdata[17]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000BB308830"
    )
        port map (
      I0 => p_1_in(17),
      I1 => s_axi_control_ARADDR(5),
      I2 => p_1_in3_in(17),
      I3 => s_axi_control_ARADDR(3),
      I4 => \operand_b_set_reg_n_0_[17]\,
      I5 => s_axi_control_ARADDR(4),
      O => \rdata[17]_i_3_n_0\
    );
\rdata[18]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0000A808"
    )
        port map (
      I0 => s_axi_control_ARADDR(6),
      I1 => \rdata[18]_i_2_n_0\,
      I2 => s_axi_control_ARADDR(2),
      I3 => \rdata[18]_i_3_n_0\,
      I4 => s_axi_control_ARADDR(0),
      O => \rdata[18]_i_1_n_0\
    );
\rdata[18]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0088008830333000"
    )
        port map (
      I0 => \result_set_reg_n_0_[18]\,
      I1 => s_axi_control_ARADDR(5),
      I2 => p_1_in1_in(18),
      I3 => s_axi_control_ARADDR(4),
      I4 => \operand_a_set_reg_n_0_[18]\,
      I5 => s_axi_control_ARADDR(3),
      O => \rdata[18]_i_2_n_0\
    );
\rdata[18]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000BB308830"
    )
        port map (
      I0 => p_1_in(18),
      I1 => s_axi_control_ARADDR(5),
      I2 => p_1_in3_in(18),
      I3 => s_axi_control_ARADDR(3),
      I4 => \operand_b_set_reg_n_0_[18]\,
      I5 => s_axi_control_ARADDR(4),
      O => \rdata[18]_i_3_n_0\
    );
\rdata[19]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0000A808"
    )
        port map (
      I0 => s_axi_control_ARADDR(6),
      I1 => \rdata[19]_i_2_n_0\,
      I2 => s_axi_control_ARADDR(2),
      I3 => \rdata[19]_i_3_n_0\,
      I4 => s_axi_control_ARADDR(0),
      O => \rdata[19]_i_1_n_0\
    );
\rdata[19]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0088008830333000"
    )
        port map (
      I0 => \result_set_reg_n_0_[19]\,
      I1 => s_axi_control_ARADDR(5),
      I2 => p_1_in1_in(19),
      I3 => s_axi_control_ARADDR(4),
      I4 => \operand_a_set_reg_n_0_[19]\,
      I5 => s_axi_control_ARADDR(3),
      O => \rdata[19]_i_2_n_0\
    );
\rdata[19]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000BB308830"
    )
        port map (
      I0 => p_1_in(19),
      I1 => s_axi_control_ARADDR(5),
      I2 => p_1_in3_in(19),
      I3 => s_axi_control_ARADDR(3),
      I4 => \operand_b_set_reg_n_0_[19]\,
      I5 => s_axi_control_ARADDR(4),
      O => \rdata[19]_i_3_n_0\
    );
\rdata[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000CCE200E2"
    )
        port map (
      I0 => \rdata[1]_i_2_n_0\,
      I1 => s_axi_control_ARADDR(6),
      I2 => \rdata_reg[1]_i_3_n_0\,
      I3 => s_axi_control_ARADDR(2),
      I4 => \rdata_reg[1]_i_4_n_0\,
      I5 => s_axi_control_ARADDR(0),
      O => \rdata[1]_i_1_n_0\
    );
\rdata[1]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"8A800000"
    )
        port map (
      I0 => s_axi_control_ARADDR(4),
      I1 => \op_set_reg_n_0_[1]\,
      I2 => s_axi_control_ARADDR(3),
      I3 => \precision_set_reg_n_0_[1]\,
      I4 => s_axi_control_ARADDR(5),
      O => \rdata[1]_i_2_n_0\
    );
\rdata[1]_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00B8"
    )
        port map (
      I0 => p_1_in1_in(1),
      I1 => s_axi_control_ARADDR(4),
      I2 => \operand_a_set_reg_n_0_[1]\,
      I3 => s_axi_control_ARADDR(3),
      O => \rdata[1]_i_5_n_0\
    );
\rdata[1]_i_6\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00E2"
    )
        port map (
      I0 => \precision_out_set_reg_n_0_[1]\,
      I1 => s_axi_control_ARADDR(3),
      I2 => \result_set_reg_n_0_[1]\,
      I3 => s_axi_control_ARADDR(4),
      O => \rdata[1]_i_6_n_0\
    );
\rdata[1]_i_7\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00E2"
    )
        port map (
      I0 => p_1_in3_in(1),
      I1 => s_axi_control_ARADDR(3),
      I2 => \operand_b_set_reg_n_0_[1]\,
      I3 => s_axi_control_ARADDR(4),
      O => \rdata[1]_i_7_n_0\
    );
\rdata[1]_i_8\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"3808"
    )
        port map (
      I0 => \exceptions_set_reg_n_0_[1]\,
      I1 => s_axi_control_ARADDR(4),
      I2 => s_axi_control_ARADDR(3),
      I3 => p_1_in(1),
      O => \rdata[1]_i_8_n_0\
    );
\rdata[20]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0000A808"
    )
        port map (
      I0 => s_axi_control_ARADDR(6),
      I1 => \rdata[20]_i_2_n_0\,
      I2 => s_axi_control_ARADDR(2),
      I3 => \rdata[20]_i_3_n_0\,
      I4 => s_axi_control_ARADDR(0),
      O => \rdata[20]_i_1_n_0\
    );
\rdata[20]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0088008830333000"
    )
        port map (
      I0 => \result_set_reg_n_0_[20]\,
      I1 => s_axi_control_ARADDR(5),
      I2 => p_1_in1_in(20),
      I3 => s_axi_control_ARADDR(4),
      I4 => \operand_a_set_reg_n_0_[20]\,
      I5 => s_axi_control_ARADDR(3),
      O => \rdata[20]_i_2_n_0\
    );
\rdata[20]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000BB308830"
    )
        port map (
      I0 => p_1_in(20),
      I1 => s_axi_control_ARADDR(5),
      I2 => p_1_in3_in(20),
      I3 => s_axi_control_ARADDR(3),
      I4 => \operand_b_set_reg_n_0_[20]\,
      I5 => s_axi_control_ARADDR(4),
      O => \rdata[20]_i_3_n_0\
    );
\rdata[21]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0000A808"
    )
        port map (
      I0 => s_axi_control_ARADDR(6),
      I1 => \rdata[21]_i_2_n_0\,
      I2 => s_axi_control_ARADDR(2),
      I3 => \rdata[21]_i_3_n_0\,
      I4 => s_axi_control_ARADDR(0),
      O => \rdata[21]_i_1_n_0\
    );
\rdata[21]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0088008830333000"
    )
        port map (
      I0 => \result_set_reg_n_0_[21]\,
      I1 => s_axi_control_ARADDR(5),
      I2 => p_1_in1_in(21),
      I3 => s_axi_control_ARADDR(4),
      I4 => \operand_a_set_reg_n_0_[21]\,
      I5 => s_axi_control_ARADDR(3),
      O => \rdata[21]_i_2_n_0\
    );
\rdata[21]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000BB308830"
    )
        port map (
      I0 => p_1_in(21),
      I1 => s_axi_control_ARADDR(5),
      I2 => p_1_in3_in(21),
      I3 => s_axi_control_ARADDR(3),
      I4 => \operand_b_set_reg_n_0_[21]\,
      I5 => s_axi_control_ARADDR(4),
      O => \rdata[21]_i_3_n_0\
    );
\rdata[22]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0000A808"
    )
        port map (
      I0 => s_axi_control_ARADDR(6),
      I1 => \rdata[22]_i_2_n_0\,
      I2 => s_axi_control_ARADDR(2),
      I3 => \rdata[22]_i_3_n_0\,
      I4 => s_axi_control_ARADDR(0),
      O => \rdata[22]_i_1_n_0\
    );
\rdata[22]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0088008830333000"
    )
        port map (
      I0 => \result_set_reg_n_0_[22]\,
      I1 => s_axi_control_ARADDR(5),
      I2 => p_1_in1_in(22),
      I3 => s_axi_control_ARADDR(4),
      I4 => \operand_a_set_reg_n_0_[22]\,
      I5 => s_axi_control_ARADDR(3),
      O => \rdata[22]_i_2_n_0\
    );
\rdata[22]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000BB308830"
    )
        port map (
      I0 => p_1_in(22),
      I1 => s_axi_control_ARADDR(5),
      I2 => p_1_in3_in(22),
      I3 => s_axi_control_ARADDR(3),
      I4 => \operand_b_set_reg_n_0_[22]\,
      I5 => s_axi_control_ARADDR(4),
      O => \rdata[22]_i_3_n_0\
    );
\rdata[23]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0000A808"
    )
        port map (
      I0 => s_axi_control_ARADDR(6),
      I1 => \rdata[23]_i_2_n_0\,
      I2 => s_axi_control_ARADDR(2),
      I3 => \rdata[23]_i_3_n_0\,
      I4 => s_axi_control_ARADDR(0),
      O => \rdata[23]_i_1_n_0\
    );
\rdata[23]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0088008830333000"
    )
        port map (
      I0 => \result_set_reg_n_0_[23]\,
      I1 => s_axi_control_ARADDR(5),
      I2 => p_1_in1_in(23),
      I3 => s_axi_control_ARADDR(4),
      I4 => \operand_a_set_reg_n_0_[23]\,
      I5 => s_axi_control_ARADDR(3),
      O => \rdata[23]_i_2_n_0\
    );
\rdata[23]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000BB308830"
    )
        port map (
      I0 => p_1_in(23),
      I1 => s_axi_control_ARADDR(5),
      I2 => p_1_in3_in(23),
      I3 => s_axi_control_ARADDR(3),
      I4 => \operand_b_set_reg_n_0_[23]\,
      I5 => s_axi_control_ARADDR(4),
      O => \rdata[23]_i_3_n_0\
    );
\rdata[24]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0000A808"
    )
        port map (
      I0 => s_axi_control_ARADDR(6),
      I1 => \rdata[24]_i_2_n_0\,
      I2 => s_axi_control_ARADDR(2),
      I3 => \rdata[24]_i_3_n_0\,
      I4 => s_axi_control_ARADDR(0),
      O => \rdata[24]_i_1_n_0\
    );
\rdata[24]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0088008830333000"
    )
        port map (
      I0 => \result_set_reg_n_0_[24]\,
      I1 => s_axi_control_ARADDR(5),
      I2 => p_1_in1_in(24),
      I3 => s_axi_control_ARADDR(4),
      I4 => \operand_a_set_reg_n_0_[24]\,
      I5 => s_axi_control_ARADDR(3),
      O => \rdata[24]_i_2_n_0\
    );
\rdata[24]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000BB308830"
    )
        port map (
      I0 => p_1_in(24),
      I1 => s_axi_control_ARADDR(5),
      I2 => p_1_in3_in(24),
      I3 => s_axi_control_ARADDR(3),
      I4 => \operand_b_set_reg_n_0_[24]\,
      I5 => s_axi_control_ARADDR(4),
      O => \rdata[24]_i_3_n_0\
    );
\rdata[25]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0000A808"
    )
        port map (
      I0 => s_axi_control_ARADDR(6),
      I1 => \rdata[25]_i_2_n_0\,
      I2 => s_axi_control_ARADDR(2),
      I3 => \rdata[25]_i_3_n_0\,
      I4 => s_axi_control_ARADDR(0),
      O => \rdata[25]_i_1_n_0\
    );
\rdata[25]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0088008830333000"
    )
        port map (
      I0 => \result_set_reg_n_0_[25]\,
      I1 => s_axi_control_ARADDR(5),
      I2 => p_1_in1_in(25),
      I3 => s_axi_control_ARADDR(4),
      I4 => \operand_a_set_reg_n_0_[25]\,
      I5 => s_axi_control_ARADDR(3),
      O => \rdata[25]_i_2_n_0\
    );
\rdata[25]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000BB308830"
    )
        port map (
      I0 => p_1_in(25),
      I1 => s_axi_control_ARADDR(5),
      I2 => p_1_in3_in(25),
      I3 => s_axi_control_ARADDR(3),
      I4 => \operand_b_set_reg_n_0_[25]\,
      I5 => s_axi_control_ARADDR(4),
      O => \rdata[25]_i_3_n_0\
    );
\rdata[26]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0000A808"
    )
        port map (
      I0 => s_axi_control_ARADDR(6),
      I1 => \rdata[26]_i_2_n_0\,
      I2 => s_axi_control_ARADDR(2),
      I3 => \rdata[26]_i_3_n_0\,
      I4 => s_axi_control_ARADDR(0),
      O => \rdata[26]_i_1_n_0\
    );
\rdata[26]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0088008830333000"
    )
        port map (
      I0 => \result_set_reg_n_0_[26]\,
      I1 => s_axi_control_ARADDR(5),
      I2 => p_1_in1_in(26),
      I3 => s_axi_control_ARADDR(4),
      I4 => \operand_a_set_reg_n_0_[26]\,
      I5 => s_axi_control_ARADDR(3),
      O => \rdata[26]_i_2_n_0\
    );
\rdata[26]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000BB308830"
    )
        port map (
      I0 => p_1_in(26),
      I1 => s_axi_control_ARADDR(5),
      I2 => p_1_in3_in(26),
      I3 => s_axi_control_ARADDR(3),
      I4 => \operand_b_set_reg_n_0_[26]\,
      I5 => s_axi_control_ARADDR(4),
      O => \rdata[26]_i_3_n_0\
    );
\rdata[27]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0000A808"
    )
        port map (
      I0 => s_axi_control_ARADDR(6),
      I1 => \rdata[27]_i_2_n_0\,
      I2 => s_axi_control_ARADDR(2),
      I3 => \rdata[27]_i_3_n_0\,
      I4 => s_axi_control_ARADDR(0),
      O => \rdata[27]_i_1_n_0\
    );
\rdata[27]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0088008830333000"
    )
        port map (
      I0 => \result_set_reg_n_0_[27]\,
      I1 => s_axi_control_ARADDR(5),
      I2 => p_1_in1_in(27),
      I3 => s_axi_control_ARADDR(4),
      I4 => \operand_a_set_reg_n_0_[27]\,
      I5 => s_axi_control_ARADDR(3),
      O => \rdata[27]_i_2_n_0\
    );
\rdata[27]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000BB308830"
    )
        port map (
      I0 => p_1_in(27),
      I1 => s_axi_control_ARADDR(5),
      I2 => p_1_in3_in(27),
      I3 => s_axi_control_ARADDR(3),
      I4 => \operand_b_set_reg_n_0_[27]\,
      I5 => s_axi_control_ARADDR(4),
      O => \rdata[27]_i_3_n_0\
    );
\rdata[28]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0000A808"
    )
        port map (
      I0 => s_axi_control_ARADDR(6),
      I1 => \rdata[28]_i_2_n_0\,
      I2 => s_axi_control_ARADDR(2),
      I3 => \rdata[28]_i_3_n_0\,
      I4 => s_axi_control_ARADDR(0),
      O => \rdata[28]_i_1_n_0\
    );
\rdata[28]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0088008830333000"
    )
        port map (
      I0 => \result_set_reg_n_0_[28]\,
      I1 => s_axi_control_ARADDR(5),
      I2 => p_1_in1_in(28),
      I3 => s_axi_control_ARADDR(4),
      I4 => \operand_a_set_reg_n_0_[28]\,
      I5 => s_axi_control_ARADDR(3),
      O => \rdata[28]_i_2_n_0\
    );
\rdata[28]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000BB308830"
    )
        port map (
      I0 => p_1_in(28),
      I1 => s_axi_control_ARADDR(5),
      I2 => p_1_in3_in(28),
      I3 => s_axi_control_ARADDR(3),
      I4 => \operand_b_set_reg_n_0_[28]\,
      I5 => s_axi_control_ARADDR(4),
      O => \rdata[28]_i_3_n_0\
    );
\rdata[29]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0000A808"
    )
        port map (
      I0 => s_axi_control_ARADDR(6),
      I1 => \rdata[29]_i_2_n_0\,
      I2 => s_axi_control_ARADDR(2),
      I3 => \rdata[29]_i_3_n_0\,
      I4 => s_axi_control_ARADDR(0),
      O => \rdata[29]_i_1_n_0\
    );
\rdata[29]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0088008830333000"
    )
        port map (
      I0 => \result_set_reg_n_0_[29]\,
      I1 => s_axi_control_ARADDR(5),
      I2 => p_1_in1_in(29),
      I3 => s_axi_control_ARADDR(4),
      I4 => \operand_a_set_reg_n_0_[29]\,
      I5 => s_axi_control_ARADDR(3),
      O => \rdata[29]_i_2_n_0\
    );
\rdata[29]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000BB308830"
    )
        port map (
      I0 => p_1_in(29),
      I1 => s_axi_control_ARADDR(5),
      I2 => p_1_in3_in(29),
      I3 => s_axi_control_ARADDR(3),
      I4 => \operand_b_set_reg_n_0_[29]\,
      I5 => s_axi_control_ARADDR(4),
      O => \rdata[29]_i_3_n_0\
    );
\rdata[2]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0000A808"
    )
        port map (
      I0 => s_axi_control_ARADDR(6),
      I1 => \rdata[2]_i_2_n_0\,
      I2 => s_axi_control_ARADDR(2),
      I3 => \rdata_reg[2]_i_3_n_0\,
      I4 => s_axi_control_ARADDR(0),
      O => \rdata[2]_i_1_n_0\
    );
\rdata[2]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0088008830333000"
    )
        port map (
      I0 => \result_set_reg_n_0_[2]\,
      I1 => s_axi_control_ARADDR(5),
      I2 => p_1_in1_in(2),
      I3 => s_axi_control_ARADDR(4),
      I4 => \operand_a_set_reg_n_0_[2]\,
      I5 => s_axi_control_ARADDR(3),
      O => \rdata[2]_i_2_n_0\
    );
\rdata[2]_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00E2"
    )
        port map (
      I0 => p_1_in3_in(2),
      I1 => s_axi_control_ARADDR(3),
      I2 => \operand_b_set_reg_n_0_[2]\,
      I3 => s_axi_control_ARADDR(4),
      O => \rdata[2]_i_4_n_0\
    );
\rdata[2]_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"3088"
    )
        port map (
      I0 => \exceptions_set_reg_n_0_[2]\,
      I1 => s_axi_control_ARADDR(4),
      I2 => p_1_in(2),
      I3 => s_axi_control_ARADDR(3),
      O => \rdata[2]_i_5_n_0\
    );
\rdata[30]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0000A808"
    )
        port map (
      I0 => s_axi_control_ARADDR(6),
      I1 => \rdata[30]_i_2_n_0\,
      I2 => s_axi_control_ARADDR(2),
      I3 => \rdata[30]_i_3_n_0\,
      I4 => s_axi_control_ARADDR(0),
      O => \rdata[30]_i_1_n_0\
    );
\rdata[30]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0088008830333000"
    )
        port map (
      I0 => \result_set_reg_n_0_[30]\,
      I1 => s_axi_control_ARADDR(5),
      I2 => p_1_in1_in(30),
      I3 => s_axi_control_ARADDR(4),
      I4 => \operand_a_set_reg_n_0_[30]\,
      I5 => s_axi_control_ARADDR(3),
      O => \rdata[30]_i_2_n_0\
    );
\rdata[30]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000BB308830"
    )
        port map (
      I0 => p_1_in(30),
      I1 => s_axi_control_ARADDR(5),
      I2 => p_1_in3_in(30),
      I3 => s_axi_control_ARADDR(3),
      I4 => \operand_b_set_reg_n_0_[30]\,
      I5 => s_axi_control_ARADDR(4),
      O => \rdata[30]_i_3_n_0\
    );
\rdata[31]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => s_axi_control_ARADDR(1),
      I1 => \^fsm_onehot_rstate_reg[1]_0\,
      I2 => s_axi_control_ARVALID,
      O => \rdata[31]_i_1_n_0\
    );
\rdata[31]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => s_axi_control_ARVALID,
      I1 => \^fsm_onehot_rstate_reg[1]_0\,
      O => \rdata[31]_i_2_n_0\
    );
\rdata[31]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0000A808"
    )
        port map (
      I0 => s_axi_control_ARADDR(6),
      I1 => \rdata[31]_i_4_n_0\,
      I2 => s_axi_control_ARADDR(2),
      I3 => \rdata[31]_i_5_n_0\,
      I4 => s_axi_control_ARADDR(0),
      O => \rdata[31]_i_3_n_0\
    );
\rdata[31]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0088008830333000"
    )
        port map (
      I0 => \result_set_reg_n_0_[31]\,
      I1 => s_axi_control_ARADDR(5),
      I2 => p_1_in1_in(31),
      I3 => s_axi_control_ARADDR(4),
      I4 => \operand_a_set_reg_n_0_[31]\,
      I5 => s_axi_control_ARADDR(3),
      O => \rdata[31]_i_4_n_0\
    );
\rdata[31]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000BB308830"
    )
        port map (
      I0 => p_1_in(31),
      I1 => s_axi_control_ARADDR(5),
      I2 => p_1_in3_in(31),
      I3 => s_axi_control_ARADDR(3),
      I4 => \operand_b_set_reg_n_0_[31]\,
      I5 => s_axi_control_ARADDR(4),
      O => \rdata[31]_i_5_n_0\
    );
\rdata[3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0000A808"
    )
        port map (
      I0 => s_axi_control_ARADDR(6),
      I1 => \rdata[3]_i_2_n_0\,
      I2 => s_axi_control_ARADDR(2),
      I3 => \rdata_reg[3]_i_3_n_0\,
      I4 => s_axi_control_ARADDR(0),
      O => \rdata[3]_i_1_n_0\
    );
\rdata[3]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0088008830333000"
    )
        port map (
      I0 => \result_set_reg_n_0_[3]\,
      I1 => s_axi_control_ARADDR(5),
      I2 => p_1_in1_in(3),
      I3 => s_axi_control_ARADDR(4),
      I4 => \operand_a_set_reg_n_0_[3]\,
      I5 => s_axi_control_ARADDR(3),
      O => \rdata[3]_i_2_n_0\
    );
\rdata[3]_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00E2"
    )
        port map (
      I0 => p_1_in3_in(3),
      I1 => s_axi_control_ARADDR(3),
      I2 => \operand_b_set_reg_n_0_[3]\,
      I3 => s_axi_control_ARADDR(4),
      O => \rdata[3]_i_4_n_0\
    );
\rdata[3]_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"3088"
    )
        port map (
      I0 => \exceptions_set_reg_n_0_[3]\,
      I1 => s_axi_control_ARADDR(4),
      I2 => p_1_in(3),
      I3 => s_axi_control_ARADDR(3),
      O => \rdata[3]_i_5_n_0\
    );
\rdata[4]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0000A808"
    )
        port map (
      I0 => s_axi_control_ARADDR(6),
      I1 => \rdata[4]_i_2_n_0\,
      I2 => s_axi_control_ARADDR(2),
      I3 => \rdata_reg[4]_i_3_n_0\,
      I4 => s_axi_control_ARADDR(0),
      O => \rdata[4]_i_1_n_0\
    );
\rdata[4]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0088008830333000"
    )
        port map (
      I0 => \result_set_reg_n_0_[4]\,
      I1 => s_axi_control_ARADDR(5),
      I2 => p_1_in1_in(4),
      I3 => s_axi_control_ARADDR(4),
      I4 => \operand_a_set_reg_n_0_[4]\,
      I5 => s_axi_control_ARADDR(3),
      O => \rdata[4]_i_2_n_0\
    );
\rdata[4]_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00E2"
    )
        port map (
      I0 => p_1_in3_in(4),
      I1 => s_axi_control_ARADDR(3),
      I2 => \operand_b_set_reg_n_0_[4]\,
      I3 => s_axi_control_ARADDR(4),
      O => \rdata[4]_i_4_n_0\
    );
\rdata[4]_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"3088"
    )
        port map (
      I0 => \exceptions_set_reg_n_0_[4]\,
      I1 => s_axi_control_ARADDR(4),
      I2 => p_1_in(4),
      I3 => s_axi_control_ARADDR(3),
      O => \rdata[4]_i_5_n_0\
    );
\rdata[5]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0000A808"
    )
        port map (
      I0 => s_axi_control_ARADDR(6),
      I1 => \rdata[5]_i_2_n_0\,
      I2 => s_axi_control_ARADDR(2),
      I3 => \rdata[5]_i_3_n_0\,
      I4 => s_axi_control_ARADDR(0),
      O => \rdata[5]_i_1_n_0\
    );
\rdata[5]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0088008830333000"
    )
        port map (
      I0 => \result_set_reg_n_0_[5]\,
      I1 => s_axi_control_ARADDR(5),
      I2 => p_1_in1_in(5),
      I3 => s_axi_control_ARADDR(4),
      I4 => \operand_a_set_reg_n_0_[5]\,
      I5 => s_axi_control_ARADDR(3),
      O => \rdata[5]_i_2_n_0\
    );
\rdata[5]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000BB308830"
    )
        port map (
      I0 => p_1_in(5),
      I1 => s_axi_control_ARADDR(5),
      I2 => p_1_in3_in(5),
      I3 => s_axi_control_ARADDR(3),
      I4 => \operand_b_set_reg_n_0_[5]\,
      I5 => s_axi_control_ARADDR(4),
      O => \rdata[5]_i_3_n_0\
    );
\rdata[6]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0000A808"
    )
        port map (
      I0 => s_axi_control_ARADDR(6),
      I1 => \rdata[6]_i_2_n_0\,
      I2 => s_axi_control_ARADDR(2),
      I3 => \rdata[6]_i_3_n_0\,
      I4 => s_axi_control_ARADDR(0),
      O => \rdata[6]_i_1_n_0\
    );
\rdata[6]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0088008830333000"
    )
        port map (
      I0 => \result_set_reg_n_0_[6]\,
      I1 => s_axi_control_ARADDR(5),
      I2 => p_1_in1_in(6),
      I3 => s_axi_control_ARADDR(4),
      I4 => \operand_a_set_reg_n_0_[6]\,
      I5 => s_axi_control_ARADDR(3),
      O => \rdata[6]_i_2_n_0\
    );
\rdata[6]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000BB308830"
    )
        port map (
      I0 => p_1_in(6),
      I1 => s_axi_control_ARADDR(5),
      I2 => p_1_in3_in(6),
      I3 => s_axi_control_ARADDR(3),
      I4 => \operand_b_set_reg_n_0_[6]\,
      I5 => s_axi_control_ARADDR(4),
      O => \rdata[6]_i_3_n_0\
    );
\rdata[7]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0000A808"
    )
        port map (
      I0 => s_axi_control_ARADDR(6),
      I1 => \rdata[7]_i_2_n_0\,
      I2 => s_axi_control_ARADDR(2),
      I3 => \rdata[7]_i_3_n_0\,
      I4 => s_axi_control_ARADDR(0),
      O => \rdata[7]_i_1_n_0\
    );
\rdata[7]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0088008830333000"
    )
        port map (
      I0 => \result_set_reg_n_0_[7]\,
      I1 => s_axi_control_ARADDR(5),
      I2 => p_1_in1_in(7),
      I3 => s_axi_control_ARADDR(4),
      I4 => \operand_a_set_reg_n_0_[7]\,
      I5 => s_axi_control_ARADDR(3),
      O => \rdata[7]_i_2_n_0\
    );
\rdata[7]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000BB308830"
    )
        port map (
      I0 => p_1_in(7),
      I1 => s_axi_control_ARADDR(5),
      I2 => p_1_in3_in(7),
      I3 => s_axi_control_ARADDR(3),
      I4 => \operand_b_set_reg_n_0_[7]\,
      I5 => s_axi_control_ARADDR(4),
      O => \rdata[7]_i_3_n_0\
    );
\rdata[8]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0000A808"
    )
        port map (
      I0 => s_axi_control_ARADDR(6),
      I1 => \rdata[8]_i_2_n_0\,
      I2 => s_axi_control_ARADDR(2),
      I3 => \rdata[8]_i_3_n_0\,
      I4 => s_axi_control_ARADDR(0),
      O => \rdata[8]_i_1_n_0\
    );
\rdata[8]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0088008830333000"
    )
        port map (
      I0 => \result_set_reg_n_0_[8]\,
      I1 => s_axi_control_ARADDR(5),
      I2 => p_1_in1_in(8),
      I3 => s_axi_control_ARADDR(4),
      I4 => \operand_a_set_reg_n_0_[8]\,
      I5 => s_axi_control_ARADDR(3),
      O => \rdata[8]_i_2_n_0\
    );
\rdata[8]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000BB308830"
    )
        port map (
      I0 => p_1_in(8),
      I1 => s_axi_control_ARADDR(5),
      I2 => p_1_in3_in(8),
      I3 => s_axi_control_ARADDR(3),
      I4 => \operand_b_set_reg_n_0_[8]\,
      I5 => s_axi_control_ARADDR(4),
      O => \rdata[8]_i_3_n_0\
    );
\rdata[9]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0000A808"
    )
        port map (
      I0 => s_axi_control_ARADDR(6),
      I1 => \rdata[9]_i_2_n_0\,
      I2 => s_axi_control_ARADDR(2),
      I3 => \rdata[9]_i_3_n_0\,
      I4 => s_axi_control_ARADDR(0),
      O => \rdata[9]_i_1_n_0\
    );
\rdata[9]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0088008830333000"
    )
        port map (
      I0 => \result_set_reg_n_0_[9]\,
      I1 => s_axi_control_ARADDR(5),
      I2 => p_1_in1_in(9),
      I3 => s_axi_control_ARADDR(4),
      I4 => \operand_a_set_reg_n_0_[9]\,
      I5 => s_axi_control_ARADDR(3),
      O => \rdata[9]_i_2_n_0\
    );
\rdata[9]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000BB308830"
    )
        port map (
      I0 => p_1_in(9),
      I1 => s_axi_control_ARADDR(5),
      I2 => p_1_in3_in(9),
      I3 => s_axi_control_ARADDR(3),
      I4 => \operand_b_set_reg_n_0_[9]\,
      I5 => s_axi_control_ARADDR(4),
      O => \rdata[9]_i_3_n_0\
    );
\rdata_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => \rdata[31]_i_2_n_0\,
      D => \rdata[0]_i_1_n_0\,
      Q => s_axi_control_RDATA(0),
      R => \rdata[31]_i_1_n_0\
    );
\rdata_reg[0]_i_2\: unisim.vcomponents.MUXF7
     port map (
      I0 => \rdata[0]_i_5_n_0\,
      I1 => \rdata[0]_i_6_n_0\,
      O => \rdata_reg[0]_i_2_n_0\,
      S => s_axi_control_ARADDR(5)
    );
\rdata_reg[0]_i_3\: unisim.vcomponents.MUXF7
     port map (
      I0 => \rdata[0]_i_7_n_0\,
      I1 => \rdata[0]_i_8_n_0\,
      O => \rdata_reg[0]_i_3_n_0\,
      S => s_axi_control_ARADDR(5)
    );
\rdata_reg[0]_i_4\: unisim.vcomponents.MUXF7
     port map (
      I0 => \rdata[0]_i_9_n_0\,
      I1 => \rdata[0]_i_10_n_0\,
      O => \rdata_reg[0]_i_4_n_0\,
      S => s_axi_control_ARADDR(5)
    );
\rdata_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => \rdata[31]_i_2_n_0\,
      D => \rdata[10]_i_1_n_0\,
      Q => s_axi_control_RDATA(10),
      R => \rdata[31]_i_1_n_0\
    );
\rdata_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => \rdata[31]_i_2_n_0\,
      D => \rdata[11]_i_1_n_0\,
      Q => s_axi_control_RDATA(11),
      R => \rdata[31]_i_1_n_0\
    );
\rdata_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => \rdata[31]_i_2_n_0\,
      D => \rdata[12]_i_1_n_0\,
      Q => s_axi_control_RDATA(12),
      R => \rdata[31]_i_1_n_0\
    );
\rdata_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => \rdata[31]_i_2_n_0\,
      D => \rdata[13]_i_1_n_0\,
      Q => s_axi_control_RDATA(13),
      R => \rdata[31]_i_1_n_0\
    );
\rdata_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => \rdata[31]_i_2_n_0\,
      D => \rdata[14]_i_1_n_0\,
      Q => s_axi_control_RDATA(14),
      R => \rdata[31]_i_1_n_0\
    );
\rdata_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => \rdata[31]_i_2_n_0\,
      D => \rdata[15]_i_1_n_0\,
      Q => s_axi_control_RDATA(15),
      R => \rdata[31]_i_1_n_0\
    );
\rdata_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => \rdata[31]_i_2_n_0\,
      D => \rdata[16]_i_1_n_0\,
      Q => s_axi_control_RDATA(16),
      R => \rdata[31]_i_1_n_0\
    );
\rdata_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => \rdata[31]_i_2_n_0\,
      D => \rdata[17]_i_1_n_0\,
      Q => s_axi_control_RDATA(17),
      R => \rdata[31]_i_1_n_0\
    );
\rdata_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => \rdata[31]_i_2_n_0\,
      D => \rdata[18]_i_1_n_0\,
      Q => s_axi_control_RDATA(18),
      R => \rdata[31]_i_1_n_0\
    );
\rdata_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => \rdata[31]_i_2_n_0\,
      D => \rdata[19]_i_1_n_0\,
      Q => s_axi_control_RDATA(19),
      R => \rdata[31]_i_1_n_0\
    );
\rdata_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => \rdata[31]_i_2_n_0\,
      D => \rdata[1]_i_1_n_0\,
      Q => s_axi_control_RDATA(1),
      R => \rdata[31]_i_1_n_0\
    );
\rdata_reg[1]_i_3\: unisim.vcomponents.MUXF7
     port map (
      I0 => \rdata[1]_i_5_n_0\,
      I1 => \rdata[1]_i_6_n_0\,
      O => \rdata_reg[1]_i_3_n_0\,
      S => s_axi_control_ARADDR(5)
    );
\rdata_reg[1]_i_4\: unisim.vcomponents.MUXF7
     port map (
      I0 => \rdata[1]_i_7_n_0\,
      I1 => \rdata[1]_i_8_n_0\,
      O => \rdata_reg[1]_i_4_n_0\,
      S => s_axi_control_ARADDR(5)
    );
\rdata_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => \rdata[31]_i_2_n_0\,
      D => \rdata[20]_i_1_n_0\,
      Q => s_axi_control_RDATA(20),
      R => \rdata[31]_i_1_n_0\
    );
\rdata_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => \rdata[31]_i_2_n_0\,
      D => \rdata[21]_i_1_n_0\,
      Q => s_axi_control_RDATA(21),
      R => \rdata[31]_i_1_n_0\
    );
\rdata_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => \rdata[31]_i_2_n_0\,
      D => \rdata[22]_i_1_n_0\,
      Q => s_axi_control_RDATA(22),
      R => \rdata[31]_i_1_n_0\
    );
\rdata_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => \rdata[31]_i_2_n_0\,
      D => \rdata[23]_i_1_n_0\,
      Q => s_axi_control_RDATA(23),
      R => \rdata[31]_i_1_n_0\
    );
\rdata_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => \rdata[31]_i_2_n_0\,
      D => \rdata[24]_i_1_n_0\,
      Q => s_axi_control_RDATA(24),
      R => \rdata[31]_i_1_n_0\
    );
\rdata_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => \rdata[31]_i_2_n_0\,
      D => \rdata[25]_i_1_n_0\,
      Q => s_axi_control_RDATA(25),
      R => \rdata[31]_i_1_n_0\
    );
\rdata_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => \rdata[31]_i_2_n_0\,
      D => \rdata[26]_i_1_n_0\,
      Q => s_axi_control_RDATA(26),
      R => \rdata[31]_i_1_n_0\
    );
\rdata_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => \rdata[31]_i_2_n_0\,
      D => \rdata[27]_i_1_n_0\,
      Q => s_axi_control_RDATA(27),
      R => \rdata[31]_i_1_n_0\
    );
\rdata_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => \rdata[31]_i_2_n_0\,
      D => \rdata[28]_i_1_n_0\,
      Q => s_axi_control_RDATA(28),
      R => \rdata[31]_i_1_n_0\
    );
\rdata_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => \rdata[31]_i_2_n_0\,
      D => \rdata[29]_i_1_n_0\,
      Q => s_axi_control_RDATA(29),
      R => \rdata[31]_i_1_n_0\
    );
\rdata_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => \rdata[31]_i_2_n_0\,
      D => \rdata[2]_i_1_n_0\,
      Q => s_axi_control_RDATA(2),
      R => \rdata[31]_i_1_n_0\
    );
\rdata_reg[2]_i_3\: unisim.vcomponents.MUXF7
     port map (
      I0 => \rdata[2]_i_4_n_0\,
      I1 => \rdata[2]_i_5_n_0\,
      O => \rdata_reg[2]_i_3_n_0\,
      S => s_axi_control_ARADDR(5)
    );
\rdata_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => \rdata[31]_i_2_n_0\,
      D => \rdata[30]_i_1_n_0\,
      Q => s_axi_control_RDATA(30),
      R => \rdata[31]_i_1_n_0\
    );
\rdata_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => \rdata[31]_i_2_n_0\,
      D => \rdata[31]_i_3_n_0\,
      Q => s_axi_control_RDATA(31),
      R => \rdata[31]_i_1_n_0\
    );
\rdata_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => \rdata[31]_i_2_n_0\,
      D => \rdata[3]_i_1_n_0\,
      Q => s_axi_control_RDATA(3),
      R => \rdata[31]_i_1_n_0\
    );
\rdata_reg[3]_i_3\: unisim.vcomponents.MUXF7
     port map (
      I0 => \rdata[3]_i_4_n_0\,
      I1 => \rdata[3]_i_5_n_0\,
      O => \rdata_reg[3]_i_3_n_0\,
      S => s_axi_control_ARADDR(5)
    );
\rdata_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => \rdata[31]_i_2_n_0\,
      D => \rdata[4]_i_1_n_0\,
      Q => s_axi_control_RDATA(4),
      R => \rdata[31]_i_1_n_0\
    );
\rdata_reg[4]_i_3\: unisim.vcomponents.MUXF7
     port map (
      I0 => \rdata[4]_i_4_n_0\,
      I1 => \rdata[4]_i_5_n_0\,
      O => \rdata_reg[4]_i_3_n_0\,
      S => s_axi_control_ARADDR(5)
    );
\rdata_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => \rdata[31]_i_2_n_0\,
      D => \rdata[5]_i_1_n_0\,
      Q => s_axi_control_RDATA(5),
      R => \rdata[31]_i_1_n_0\
    );
\rdata_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => \rdata[31]_i_2_n_0\,
      D => \rdata[6]_i_1_n_0\,
      Q => s_axi_control_RDATA(6),
      R => \rdata[31]_i_1_n_0\
    );
\rdata_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => \rdata[31]_i_2_n_0\,
      D => \rdata[7]_i_1_n_0\,
      Q => s_axi_control_RDATA(7),
      R => \rdata[31]_i_1_n_0\
    );
\rdata_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => \rdata[31]_i_2_n_0\,
      D => \rdata[8]_i_1_n_0\,
      Q => s_axi_control_RDATA(8),
      R => \rdata[31]_i_1_n_0\
    );
\rdata_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => \rdata[31]_i_2_n_0\,
      D => \rdata[9]_i_1_n_0\,
      Q => s_axi_control_RDATA(9),
      R => \rdata[31]_i_1_n_0\
    );
\result_set[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_control_WDATA(0),
      I1 => s_axi_control_WSTRB(0),
      I2 => \result_set_reg_n_0_[0]\,
      O => result_set_reg01_out(0)
    );
\result_set[10]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_control_WDATA(10),
      I1 => s_axi_control_WSTRB(1),
      I2 => \result_set_reg_n_0_[10]\,
      O => result_set_reg01_out(10)
    );
\result_set[11]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_control_WDATA(11),
      I1 => s_axi_control_WSTRB(1),
      I2 => \result_set_reg_n_0_[11]\,
      O => result_set_reg01_out(11)
    );
\result_set[12]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_control_WDATA(12),
      I1 => s_axi_control_WSTRB(1),
      I2 => \result_set_reg_n_0_[12]\,
      O => result_set_reg01_out(12)
    );
\result_set[13]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_control_WDATA(13),
      I1 => s_axi_control_WSTRB(1),
      I2 => \result_set_reg_n_0_[13]\,
      O => result_set_reg01_out(13)
    );
\result_set[14]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_control_WDATA(14),
      I1 => s_axi_control_WSTRB(1),
      I2 => \result_set_reg_n_0_[14]\,
      O => result_set_reg01_out(14)
    );
\result_set[15]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_control_WDATA(15),
      I1 => s_axi_control_WSTRB(1),
      I2 => \result_set_reg_n_0_[15]\,
      O => result_set_reg01_out(15)
    );
\result_set[16]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_control_WDATA(16),
      I1 => s_axi_control_WSTRB(2),
      I2 => \result_set_reg_n_0_[16]\,
      O => result_set_reg01_out(16)
    );
\result_set[17]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_control_WDATA(17),
      I1 => s_axi_control_WSTRB(2),
      I2 => \result_set_reg_n_0_[17]\,
      O => result_set_reg01_out(17)
    );
\result_set[18]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_control_WDATA(18),
      I1 => s_axi_control_WSTRB(2),
      I2 => \result_set_reg_n_0_[18]\,
      O => result_set_reg01_out(18)
    );
\result_set[19]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_control_WDATA(19),
      I1 => s_axi_control_WSTRB(2),
      I2 => \result_set_reg_n_0_[19]\,
      O => result_set_reg01_out(19)
    );
\result_set[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_control_WDATA(1),
      I1 => s_axi_control_WSTRB(0),
      I2 => \result_set_reg_n_0_[1]\,
      O => result_set_reg01_out(1)
    );
\result_set[20]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_control_WDATA(20),
      I1 => s_axi_control_WSTRB(2),
      I2 => \result_set_reg_n_0_[20]\,
      O => result_set_reg01_out(20)
    );
\result_set[21]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_control_WDATA(21),
      I1 => s_axi_control_WSTRB(2),
      I2 => \result_set_reg_n_0_[21]\,
      O => result_set_reg01_out(21)
    );
\result_set[22]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_control_WDATA(22),
      I1 => s_axi_control_WSTRB(2),
      I2 => \result_set_reg_n_0_[22]\,
      O => result_set_reg01_out(22)
    );
\result_set[23]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_control_WDATA(23),
      I1 => s_axi_control_WSTRB(2),
      I2 => \result_set_reg_n_0_[23]\,
      O => result_set_reg01_out(23)
    );
\result_set[24]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_control_WDATA(24),
      I1 => s_axi_control_WSTRB(3),
      I2 => \result_set_reg_n_0_[24]\,
      O => result_set_reg01_out(24)
    );
\result_set[25]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_control_WDATA(25),
      I1 => s_axi_control_WSTRB(3),
      I2 => \result_set_reg_n_0_[25]\,
      O => result_set_reg01_out(25)
    );
\result_set[26]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_control_WDATA(26),
      I1 => s_axi_control_WSTRB(3),
      I2 => \result_set_reg_n_0_[26]\,
      O => result_set_reg01_out(26)
    );
\result_set[27]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_control_WDATA(27),
      I1 => s_axi_control_WSTRB(3),
      I2 => \result_set_reg_n_0_[27]\,
      O => result_set_reg01_out(27)
    );
\result_set[28]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_control_WDATA(28),
      I1 => s_axi_control_WSTRB(3),
      I2 => \result_set_reg_n_0_[28]\,
      O => result_set_reg01_out(28)
    );
\result_set[29]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_control_WDATA(29),
      I1 => s_axi_control_WSTRB(3),
      I2 => \result_set_reg_n_0_[29]\,
      O => result_set_reg01_out(29)
    );
\result_set[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_control_WDATA(2),
      I1 => s_axi_control_WSTRB(0),
      I2 => \result_set_reg_n_0_[2]\,
      O => result_set_reg01_out(2)
    );
\result_set[30]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_control_WDATA(30),
      I1 => s_axi_control_WSTRB(3),
      I2 => \result_set_reg_n_0_[30]\,
      O => result_set_reg01_out(30)
    );
\result_set[31]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000800"
    )
        port map (
      I0 => waddr(3),
      I1 => \operand_a_set[31]_i_3_n_0\,
      I2 => waddr(2),
      I3 => waddr(5),
      I4 => waddr(4),
      O => \result_set[31]_i_1_n_0\
    );
\result_set[31]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_control_WDATA(31),
      I1 => s_axi_control_WSTRB(3),
      I2 => \result_set_reg_n_0_[31]\,
      O => result_set_reg01_out(31)
    );
\result_set[32]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_control_WDATA(0),
      I1 => s_axi_control_WSTRB(0),
      I2 => p_1_in(0),
      O => result_set_reg0(0)
    );
\result_set[33]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_control_WDATA(1),
      I1 => s_axi_control_WSTRB(0),
      I2 => p_1_in(1),
      O => result_set_reg0(1)
    );
\result_set[34]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_control_WDATA(2),
      I1 => s_axi_control_WSTRB(0),
      I2 => p_1_in(2),
      O => result_set_reg0(2)
    );
\result_set[35]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_control_WDATA(3),
      I1 => s_axi_control_WSTRB(0),
      I2 => p_1_in(3),
      O => result_set_reg0(3)
    );
\result_set[36]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_control_WDATA(4),
      I1 => s_axi_control_WSTRB(0),
      I2 => p_1_in(4),
      O => result_set_reg0(4)
    );
\result_set[37]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_control_WDATA(5),
      I1 => s_axi_control_WSTRB(0),
      I2 => p_1_in(5),
      O => result_set_reg0(5)
    );
\result_set[38]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_control_WDATA(6),
      I1 => s_axi_control_WSTRB(0),
      I2 => p_1_in(6),
      O => result_set_reg0(6)
    );
\result_set[39]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_control_WDATA(7),
      I1 => s_axi_control_WSTRB(0),
      I2 => p_1_in(7),
      O => result_set_reg0(7)
    );
\result_set[3]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_control_WDATA(3),
      I1 => s_axi_control_WSTRB(0),
      I2 => \result_set_reg_n_0_[3]\,
      O => result_set_reg01_out(3)
    );
\result_set[40]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_control_WDATA(8),
      I1 => s_axi_control_WSTRB(1),
      I2 => p_1_in(8),
      O => result_set_reg0(8)
    );
\result_set[41]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_control_WDATA(9),
      I1 => s_axi_control_WSTRB(1),
      I2 => p_1_in(9),
      O => result_set_reg0(9)
    );
\result_set[42]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_control_WDATA(10),
      I1 => s_axi_control_WSTRB(1),
      I2 => p_1_in(10),
      O => result_set_reg0(10)
    );
\result_set[43]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_control_WDATA(11),
      I1 => s_axi_control_WSTRB(1),
      I2 => p_1_in(11),
      O => result_set_reg0(11)
    );
\result_set[44]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_control_WDATA(12),
      I1 => s_axi_control_WSTRB(1),
      I2 => p_1_in(12),
      O => result_set_reg0(12)
    );
\result_set[45]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_control_WDATA(13),
      I1 => s_axi_control_WSTRB(1),
      I2 => p_1_in(13),
      O => result_set_reg0(13)
    );
\result_set[46]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_control_WDATA(14),
      I1 => s_axi_control_WSTRB(1),
      I2 => p_1_in(14),
      O => result_set_reg0(14)
    );
\result_set[47]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_control_WDATA(15),
      I1 => s_axi_control_WSTRB(1),
      I2 => p_1_in(15),
      O => result_set_reg0(15)
    );
\result_set[48]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_control_WDATA(16),
      I1 => s_axi_control_WSTRB(2),
      I2 => p_1_in(16),
      O => result_set_reg0(16)
    );
\result_set[49]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_control_WDATA(17),
      I1 => s_axi_control_WSTRB(2),
      I2 => p_1_in(17),
      O => result_set_reg0(17)
    );
\result_set[4]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_control_WDATA(4),
      I1 => s_axi_control_WSTRB(0),
      I2 => \result_set_reg_n_0_[4]\,
      O => result_set_reg01_out(4)
    );
\result_set[50]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_control_WDATA(18),
      I1 => s_axi_control_WSTRB(2),
      I2 => p_1_in(18),
      O => result_set_reg0(18)
    );
\result_set[51]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_control_WDATA(19),
      I1 => s_axi_control_WSTRB(2),
      I2 => p_1_in(19),
      O => result_set_reg0(19)
    );
\result_set[52]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_control_WDATA(20),
      I1 => s_axi_control_WSTRB(2),
      I2 => p_1_in(20),
      O => result_set_reg0(20)
    );
\result_set[53]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_control_WDATA(21),
      I1 => s_axi_control_WSTRB(2),
      I2 => p_1_in(21),
      O => result_set_reg0(21)
    );
\result_set[54]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_control_WDATA(22),
      I1 => s_axi_control_WSTRB(2),
      I2 => p_1_in(22),
      O => result_set_reg0(22)
    );
\result_set[55]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_control_WDATA(23),
      I1 => s_axi_control_WSTRB(2),
      I2 => p_1_in(23),
      O => result_set_reg0(23)
    );
\result_set[56]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_control_WDATA(24),
      I1 => s_axi_control_WSTRB(3),
      I2 => p_1_in(24),
      O => result_set_reg0(24)
    );
\result_set[57]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_control_WDATA(25),
      I1 => s_axi_control_WSTRB(3),
      I2 => p_1_in(25),
      O => result_set_reg0(25)
    );
\result_set[58]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_control_WDATA(26),
      I1 => s_axi_control_WSTRB(3),
      I2 => p_1_in(26),
      O => result_set_reg0(26)
    );
\result_set[59]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_control_WDATA(27),
      I1 => s_axi_control_WSTRB(3),
      I2 => p_1_in(27),
      O => result_set_reg0(27)
    );
\result_set[5]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_control_WDATA(5),
      I1 => s_axi_control_WSTRB(0),
      I2 => \result_set_reg_n_0_[5]\,
      O => result_set_reg01_out(5)
    );
\result_set[60]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_control_WDATA(28),
      I1 => s_axi_control_WSTRB(3),
      I2 => p_1_in(28),
      O => result_set_reg0(28)
    );
\result_set[61]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_control_WDATA(29),
      I1 => s_axi_control_WSTRB(3),
      I2 => p_1_in(29),
      O => result_set_reg0(29)
    );
\result_set[62]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_control_WDATA(30),
      I1 => s_axi_control_WSTRB(3),
      I2 => p_1_in(30),
      O => result_set_reg0(30)
    );
\result_set[63]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00008000"
    )
        port map (
      I0 => waddr(2),
      I1 => \operand_a_set[31]_i_3_n_0\,
      I2 => waddr(5),
      I3 => waddr(3),
      I4 => waddr(4),
      O => \result_set[63]_i_1_n_0\
    );
\result_set[63]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_control_WDATA(31),
      I1 => s_axi_control_WSTRB(3),
      I2 => p_1_in(31),
      O => result_set_reg0(31)
    );
\result_set[6]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_control_WDATA(6),
      I1 => s_axi_control_WSTRB(0),
      I2 => \result_set_reg_n_0_[6]\,
      O => result_set_reg01_out(6)
    );
\result_set[7]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_control_WDATA(7),
      I1 => s_axi_control_WSTRB(0),
      I2 => \result_set_reg_n_0_[7]\,
      O => result_set_reg01_out(7)
    );
\result_set[8]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_control_WDATA(8),
      I1 => s_axi_control_WSTRB(1),
      I2 => \result_set_reg_n_0_[8]\,
      O => result_set_reg01_out(8)
    );
\result_set[9]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_control_WDATA(9),
      I1 => s_axi_control_WSTRB(1),
      I2 => \result_set_reg_n_0_[9]\,
      O => result_set_reg01_out(9)
    );
\result_set_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \result_set[31]_i_1_n_0\,
      D => result_set_reg01_out(0),
      Q => \result_set_reg_n_0_[0]\,
      R => SR(0)
    );
\result_set_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \result_set[31]_i_1_n_0\,
      D => result_set_reg01_out(10),
      Q => \result_set_reg_n_0_[10]\,
      R => SR(0)
    );
\result_set_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \result_set[31]_i_1_n_0\,
      D => result_set_reg01_out(11),
      Q => \result_set_reg_n_0_[11]\,
      R => SR(0)
    );
\result_set_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \result_set[31]_i_1_n_0\,
      D => result_set_reg01_out(12),
      Q => \result_set_reg_n_0_[12]\,
      R => SR(0)
    );
\result_set_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \result_set[31]_i_1_n_0\,
      D => result_set_reg01_out(13),
      Q => \result_set_reg_n_0_[13]\,
      R => SR(0)
    );
\result_set_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \result_set[31]_i_1_n_0\,
      D => result_set_reg01_out(14),
      Q => \result_set_reg_n_0_[14]\,
      R => SR(0)
    );
\result_set_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \result_set[31]_i_1_n_0\,
      D => result_set_reg01_out(15),
      Q => \result_set_reg_n_0_[15]\,
      R => SR(0)
    );
\result_set_reg[16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \result_set[31]_i_1_n_0\,
      D => result_set_reg01_out(16),
      Q => \result_set_reg_n_0_[16]\,
      R => SR(0)
    );
\result_set_reg[17]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \result_set[31]_i_1_n_0\,
      D => result_set_reg01_out(17),
      Q => \result_set_reg_n_0_[17]\,
      R => SR(0)
    );
\result_set_reg[18]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \result_set[31]_i_1_n_0\,
      D => result_set_reg01_out(18),
      Q => \result_set_reg_n_0_[18]\,
      R => SR(0)
    );
\result_set_reg[19]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \result_set[31]_i_1_n_0\,
      D => result_set_reg01_out(19),
      Q => \result_set_reg_n_0_[19]\,
      R => SR(0)
    );
\result_set_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \result_set[31]_i_1_n_0\,
      D => result_set_reg01_out(1),
      Q => \result_set_reg_n_0_[1]\,
      R => SR(0)
    );
\result_set_reg[20]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \result_set[31]_i_1_n_0\,
      D => result_set_reg01_out(20),
      Q => \result_set_reg_n_0_[20]\,
      R => SR(0)
    );
\result_set_reg[21]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \result_set[31]_i_1_n_0\,
      D => result_set_reg01_out(21),
      Q => \result_set_reg_n_0_[21]\,
      R => SR(0)
    );
\result_set_reg[22]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \result_set[31]_i_1_n_0\,
      D => result_set_reg01_out(22),
      Q => \result_set_reg_n_0_[22]\,
      R => SR(0)
    );
\result_set_reg[23]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \result_set[31]_i_1_n_0\,
      D => result_set_reg01_out(23),
      Q => \result_set_reg_n_0_[23]\,
      R => SR(0)
    );
\result_set_reg[24]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \result_set[31]_i_1_n_0\,
      D => result_set_reg01_out(24),
      Q => \result_set_reg_n_0_[24]\,
      R => SR(0)
    );
\result_set_reg[25]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \result_set[31]_i_1_n_0\,
      D => result_set_reg01_out(25),
      Q => \result_set_reg_n_0_[25]\,
      R => SR(0)
    );
\result_set_reg[26]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \result_set[31]_i_1_n_0\,
      D => result_set_reg01_out(26),
      Q => \result_set_reg_n_0_[26]\,
      R => SR(0)
    );
\result_set_reg[27]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \result_set[31]_i_1_n_0\,
      D => result_set_reg01_out(27),
      Q => \result_set_reg_n_0_[27]\,
      R => SR(0)
    );
\result_set_reg[28]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \result_set[31]_i_1_n_0\,
      D => result_set_reg01_out(28),
      Q => \result_set_reg_n_0_[28]\,
      R => SR(0)
    );
\result_set_reg[29]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \result_set[31]_i_1_n_0\,
      D => result_set_reg01_out(29),
      Q => \result_set_reg_n_0_[29]\,
      R => SR(0)
    );
\result_set_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \result_set[31]_i_1_n_0\,
      D => result_set_reg01_out(2),
      Q => \result_set_reg_n_0_[2]\,
      R => SR(0)
    );
\result_set_reg[30]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \result_set[31]_i_1_n_0\,
      D => result_set_reg01_out(30),
      Q => \result_set_reg_n_0_[30]\,
      R => SR(0)
    );
\result_set_reg[31]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \result_set[31]_i_1_n_0\,
      D => result_set_reg01_out(31),
      Q => \result_set_reg_n_0_[31]\,
      R => SR(0)
    );
\result_set_reg[32]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \result_set[63]_i_1_n_0\,
      D => result_set_reg0(0),
      Q => p_1_in(0),
      R => SR(0)
    );
\result_set_reg[33]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \result_set[63]_i_1_n_0\,
      D => result_set_reg0(1),
      Q => p_1_in(1),
      R => SR(0)
    );
\result_set_reg[34]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \result_set[63]_i_1_n_0\,
      D => result_set_reg0(2),
      Q => p_1_in(2),
      R => SR(0)
    );
\result_set_reg[35]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \result_set[63]_i_1_n_0\,
      D => result_set_reg0(3),
      Q => p_1_in(3),
      R => SR(0)
    );
\result_set_reg[36]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \result_set[63]_i_1_n_0\,
      D => result_set_reg0(4),
      Q => p_1_in(4),
      R => SR(0)
    );
\result_set_reg[37]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \result_set[63]_i_1_n_0\,
      D => result_set_reg0(5),
      Q => p_1_in(5),
      R => SR(0)
    );
\result_set_reg[38]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \result_set[63]_i_1_n_0\,
      D => result_set_reg0(6),
      Q => p_1_in(6),
      R => SR(0)
    );
\result_set_reg[39]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \result_set[63]_i_1_n_0\,
      D => result_set_reg0(7),
      Q => p_1_in(7),
      R => SR(0)
    );
\result_set_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \result_set[31]_i_1_n_0\,
      D => result_set_reg01_out(3),
      Q => \result_set_reg_n_0_[3]\,
      R => SR(0)
    );
\result_set_reg[40]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \result_set[63]_i_1_n_0\,
      D => result_set_reg0(8),
      Q => p_1_in(8),
      R => SR(0)
    );
\result_set_reg[41]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \result_set[63]_i_1_n_0\,
      D => result_set_reg0(9),
      Q => p_1_in(9),
      R => SR(0)
    );
\result_set_reg[42]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \result_set[63]_i_1_n_0\,
      D => result_set_reg0(10),
      Q => p_1_in(10),
      R => SR(0)
    );
\result_set_reg[43]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \result_set[63]_i_1_n_0\,
      D => result_set_reg0(11),
      Q => p_1_in(11),
      R => SR(0)
    );
\result_set_reg[44]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \result_set[63]_i_1_n_0\,
      D => result_set_reg0(12),
      Q => p_1_in(12),
      R => SR(0)
    );
\result_set_reg[45]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \result_set[63]_i_1_n_0\,
      D => result_set_reg0(13),
      Q => p_1_in(13),
      R => SR(0)
    );
\result_set_reg[46]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \result_set[63]_i_1_n_0\,
      D => result_set_reg0(14),
      Q => p_1_in(14),
      R => SR(0)
    );
\result_set_reg[47]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \result_set[63]_i_1_n_0\,
      D => result_set_reg0(15),
      Q => p_1_in(15),
      R => SR(0)
    );
\result_set_reg[48]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \result_set[63]_i_1_n_0\,
      D => result_set_reg0(16),
      Q => p_1_in(16),
      R => SR(0)
    );
\result_set_reg[49]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \result_set[63]_i_1_n_0\,
      D => result_set_reg0(17),
      Q => p_1_in(17),
      R => SR(0)
    );
\result_set_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \result_set[31]_i_1_n_0\,
      D => result_set_reg01_out(4),
      Q => \result_set_reg_n_0_[4]\,
      R => SR(0)
    );
\result_set_reg[50]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \result_set[63]_i_1_n_0\,
      D => result_set_reg0(18),
      Q => p_1_in(18),
      R => SR(0)
    );
\result_set_reg[51]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \result_set[63]_i_1_n_0\,
      D => result_set_reg0(19),
      Q => p_1_in(19),
      R => SR(0)
    );
\result_set_reg[52]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \result_set[63]_i_1_n_0\,
      D => result_set_reg0(20),
      Q => p_1_in(20),
      R => SR(0)
    );
\result_set_reg[53]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \result_set[63]_i_1_n_0\,
      D => result_set_reg0(21),
      Q => p_1_in(21),
      R => SR(0)
    );
\result_set_reg[54]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \result_set[63]_i_1_n_0\,
      D => result_set_reg0(22),
      Q => p_1_in(22),
      R => SR(0)
    );
\result_set_reg[55]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \result_set[63]_i_1_n_0\,
      D => result_set_reg0(23),
      Q => p_1_in(23),
      R => SR(0)
    );
\result_set_reg[56]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \result_set[63]_i_1_n_0\,
      D => result_set_reg0(24),
      Q => p_1_in(24),
      R => SR(0)
    );
\result_set_reg[57]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \result_set[63]_i_1_n_0\,
      D => result_set_reg0(25),
      Q => p_1_in(25),
      R => SR(0)
    );
\result_set_reg[58]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \result_set[63]_i_1_n_0\,
      D => result_set_reg0(26),
      Q => p_1_in(26),
      R => SR(0)
    );
\result_set_reg[59]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \result_set[63]_i_1_n_0\,
      D => result_set_reg0(27),
      Q => p_1_in(27),
      R => SR(0)
    );
\result_set_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \result_set[31]_i_1_n_0\,
      D => result_set_reg01_out(5),
      Q => \result_set_reg_n_0_[5]\,
      R => SR(0)
    );
\result_set_reg[60]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \result_set[63]_i_1_n_0\,
      D => result_set_reg0(28),
      Q => p_1_in(28),
      R => SR(0)
    );
\result_set_reg[61]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \result_set[63]_i_1_n_0\,
      D => result_set_reg0(29),
      Q => p_1_in(29),
      R => SR(0)
    );
\result_set_reg[62]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \result_set[63]_i_1_n_0\,
      D => result_set_reg0(30),
      Q => p_1_in(30),
      R => SR(0)
    );
\result_set_reg[63]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \result_set[63]_i_1_n_0\,
      D => result_set_reg0(31),
      Q => p_1_in(31),
      R => SR(0)
    );
\result_set_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \result_set[31]_i_1_n_0\,
      D => result_set_reg01_out(6),
      Q => \result_set_reg_n_0_[6]\,
      R => SR(0)
    );
\result_set_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \result_set[31]_i_1_n_0\,
      D => result_set_reg01_out(7),
      Q => \result_set_reg_n_0_[7]\,
      R => SR(0)
    );
\result_set_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \result_set[31]_i_1_n_0\,
      D => result_set_reg01_out(8),
      Q => \result_set_reg_n_0_[8]\,
      R => SR(0)
    );
\result_set_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => \result_set[31]_i_1_n_0\,
      D => result_set_reg01_out(9),
      Q => \result_set_reg_n_0_[9]\,
      R => SR(0)
    );
\rst_n_set[0]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFBF0080"
    )
        port map (
      I0 => s_axi_control_WDATA(0),
      I1 => s_axi_control_WSTRB(0),
      I2 => \precision_set[1]_i_3_n_0\,
      I3 => \rst_n_set[0]_i_2_n_0\,
      I4 => \rst_n_set_reg_n_0_[0]\,
      O => \rst_n_set[0]_i_1_n_0\
    );
\rst_n_set[0]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"F7"
    )
        port map (
      I0 => waddr(4),
      I1 => waddr(3),
      I2 => waddr(5),
      O => \rst_n_set[0]_i_2_n_0\
    );
\rst_n_set_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => '1',
      D => \rst_n_set[0]_i_1_n_0\,
      Q => \rst_n_set_reg_n_0_[0]\,
      R => SR(0)
    );
\valid_in_set[0]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"BFFF8000"
    )
        port map (
      I0 => s_axi_control_WDATA(0),
      I1 => s_axi_control_WSTRB(0),
      I2 => waddr(3),
      I3 => \ce_r_set[0]_i_2_n_0\,
      I4 => \valid_in_set_reg_n_0_[0]\,
      O => \valid_in_set[0]_i_1_n_0\
    );
\valid_in_set_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => '1',
      D => \valid_in_set[0]_i_1_n_0\,
      Q => \valid_in_set_reg_n_0_[0]\,
      R => SR(0)
    );
\valid_out_set[0]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"BFFF8000"
    )
        port map (
      I0 => s_axi_control_WDATA(0),
      I1 => s_axi_control_WSTRB(0),
      I2 => waddr(3),
      I3 => \valid_out_set[0]_i_2_n_0\,
      I4 => \valid_out_set_reg_n_0_[0]\,
      O => \valid_out_set[0]_i_1_n_0\
    );
\valid_out_set[0]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000020000000"
    )
        port map (
      I0 => waddr(4),
      I1 => waddr(5),
      I2 => s_axi_control_WVALID,
      I3 => \^fsm_onehot_wstate_reg[2]_0\,
      I4 => waddr(6),
      I5 => waddr(2),
      O => \valid_out_set[0]_i_2_n_0\
    );
\valid_out_set_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => '1',
      D => \valid_out_set[0]_i_1_n_0\,
      Q => \valid_out_set_reg_n_0_[0]\,
      R => SR(0)
    );
\waddr[6]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => s_axi_control_AWVALID,
      I1 => \^fsm_onehot_wstate_reg[1]_0\,
      O => waddr2_out
    );
\waddr_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => waddr2_out,
      D => s_axi_control_AWADDR(0),
      Q => waddr(2),
      R => '0'
    );
\waddr_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => waddr2_out,
      D => s_axi_control_AWADDR(1),
      Q => waddr(3),
      R => '0'
    );
\waddr_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => waddr2_out,
      D => s_axi_control_AWADDR(2),
      Q => waddr(4),
      R => '0'
    );
\waddr_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => waddr2_out,
      D => s_axi_control_AWADDR(3),
      Q => waddr(5),
      R => '0'
    );
\waddr_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => waddr2_out,
      D => s_axi_control_AWADDR(4),
      Q => waddr(6),
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_fpu_top_0_0_fpu_top is
  port (
    s_axi_control_AWVALID : in STD_LOGIC;
    s_axi_control_AWREADY : out STD_LOGIC;
    s_axi_control_AWADDR : in STD_LOGIC_VECTOR ( 6 downto 0 );
    s_axi_control_WVALID : in STD_LOGIC;
    s_axi_control_WREADY : out STD_LOGIC;
    s_axi_control_WDATA : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_control_WSTRB : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_control_ARVALID : in STD_LOGIC;
    s_axi_control_ARREADY : out STD_LOGIC;
    s_axi_control_ARADDR : in STD_LOGIC_VECTOR ( 6 downto 0 );
    s_axi_control_RVALID : out STD_LOGIC;
    s_axi_control_RREADY : in STD_LOGIC;
    s_axi_control_RDATA : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_control_RRESP : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_control_BVALID : out STD_LOGIC;
    s_axi_control_BREADY : in STD_LOGIC;
    s_axi_control_BRESP : out STD_LOGIC_VECTOR ( 1 downto 0 );
    ap_clk : in STD_LOGIC;
    ap_rst_n : in STD_LOGIC
  );
  attribute C_S_AXI_CONTROL_ADDR_WIDTH : integer;
  attribute C_S_AXI_CONTROL_ADDR_WIDTH of design_1_fpu_top_0_0_fpu_top : entity is 7;
  attribute C_S_AXI_CONTROL_DATA_WIDTH : integer;
  attribute C_S_AXI_CONTROL_DATA_WIDTH of design_1_fpu_top_0_0_fpu_top : entity is 32;
  attribute C_S_AXI_CONTROL_WSTRB_WIDTH : integer;
  attribute C_S_AXI_CONTROL_WSTRB_WIDTH of design_1_fpu_top_0_0_fpu_top : entity is 4;
  attribute C_S_AXI_DATA_WIDTH : integer;
  attribute C_S_AXI_DATA_WIDTH of design_1_fpu_top_0_0_fpu_top : entity is 32;
  attribute C_S_AXI_WSTRB_WIDTH : integer;
  attribute C_S_AXI_WSTRB_WIDTH of design_1_fpu_top_0_0_fpu_top : entity is 4;
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of design_1_fpu_top_0_0_fpu_top : entity is "fpu_top";
  attribute hls_module : string;
  attribute hls_module of design_1_fpu_top_0_0_fpu_top : entity is "yes";
end design_1_fpu_top_0_0_fpu_top;

architecture STRUCTURE of design_1_fpu_top_0_0_fpu_top is
  signal \<const0>\ : STD_LOGIC;
  signal ap_rst_n_inv : STD_LOGIC;
  signal ap_rst_reg_1 : STD_LOGIC;
  signal ap_rst_reg_2 : STD_LOGIC;
  signal p_0_in : STD_LOGIC;
  attribute SHREG_EXTRACT : string;
  attribute SHREG_EXTRACT of ap_rst_n_inv_reg : label is "no";
  attribute SHREG_EXTRACT of ap_rst_reg_1_reg : label is "no";
  attribute SHREG_EXTRACT of ap_rst_reg_2_reg : label is "no";
begin
  s_axi_control_BRESP(1) <= \<const0>\;
  s_axi_control_BRESP(0) <= \<const0>\;
  s_axi_control_RRESP(1) <= \<const0>\;
  s_axi_control_RRESP(0) <= \<const0>\;
GND: unisim.vcomponents.GND
     port map (
      G => \<const0>\
    );
ap_rst_n_inv_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => ap_clk,
      CE => '1',
      D => ap_rst_reg_1,
      Q => ap_rst_n_inv,
      R => '0'
    );
ap_rst_reg_1_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => ap_clk,
      CE => '1',
      D => ap_rst_reg_2,
      Q => ap_rst_reg_1,
      R => '0'
    );
ap_rst_reg_2_i_1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => ap_rst_n,
      O => p_0_in
    );
ap_rst_reg_2_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => ap_clk,
      CE => '1',
      D => p_0_in,
      Q => ap_rst_reg_2,
      R => '0'
    );
control_s_axi_U: entity work.design_1_fpu_top_0_0_fpu_top_control_s_axi
     port map (
      \FSM_onehot_rstate_reg[1]_0\ => s_axi_control_ARREADY,
      \FSM_onehot_wstate_reg[1]_0\ => s_axi_control_AWREADY,
      \FSM_onehot_wstate_reg[2]_0\ => s_axi_control_WREADY,
      SR(0) => ap_rst_n_inv,
      ap_clk => ap_clk,
      s_axi_control_ARADDR(6 downto 0) => s_axi_control_ARADDR(6 downto 0),
      s_axi_control_ARVALID => s_axi_control_ARVALID,
      s_axi_control_AWADDR(4 downto 0) => s_axi_control_AWADDR(6 downto 2),
      s_axi_control_AWVALID => s_axi_control_AWVALID,
      s_axi_control_BREADY => s_axi_control_BREADY,
      s_axi_control_BVALID => s_axi_control_BVALID,
      s_axi_control_RDATA(31 downto 0) => s_axi_control_RDATA(31 downto 0),
      s_axi_control_RREADY => s_axi_control_RREADY,
      s_axi_control_RVALID => s_axi_control_RVALID,
      s_axi_control_WDATA(31 downto 0) => s_axi_control_WDATA(31 downto 0),
      s_axi_control_WSTRB(3 downto 0) => s_axi_control_WSTRB(3 downto 0),
      s_axi_control_WVALID => s_axi_control_WVALID
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_fpu_top_0_0 is
  port (
    s_axi_control_ARADDR : in STD_LOGIC_VECTOR ( 6 downto 0 );
    s_axi_control_ARREADY : out STD_LOGIC;
    s_axi_control_ARVALID : in STD_LOGIC;
    s_axi_control_AWADDR : in STD_LOGIC_VECTOR ( 6 downto 0 );
    s_axi_control_AWREADY : out STD_LOGIC;
    s_axi_control_AWVALID : in STD_LOGIC;
    s_axi_control_BREADY : in STD_LOGIC;
    s_axi_control_BRESP : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_control_BVALID : out STD_LOGIC;
    s_axi_control_RDATA : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_control_RREADY : in STD_LOGIC;
    s_axi_control_RRESP : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_control_RVALID : out STD_LOGIC;
    s_axi_control_WDATA : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_control_WREADY : out STD_LOGIC;
    s_axi_control_WSTRB : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_control_WVALID : in STD_LOGIC;
    ap_clk : in STD_LOGIC;
    ap_rst_n : in STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of design_1_fpu_top_0_0 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of design_1_fpu_top_0_0 : entity is "design_1_fpu_top_0_0,fpu_top,{}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of design_1_fpu_top_0_0 : entity is "yes";
  attribute IP_DEFINITION_SOURCE : string;
  attribute IP_DEFINITION_SOURCE of design_1_fpu_top_0_0 : entity is "HLS";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of design_1_fpu_top_0_0 : entity is "fpu_top,Vivado 2024.1";
  attribute hls_module : string;
  attribute hls_module of design_1_fpu_top_0_0 : entity is "yes";
end design_1_fpu_top_0_0;

architecture STRUCTURE of design_1_fpu_top_0_0 is
  signal \<const0>\ : STD_LOGIC;
  signal NLW_inst_s_axi_control_BRESP_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_inst_s_axi_control_RRESP_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute C_S_AXI_CONTROL_ADDR_WIDTH : integer;
  attribute C_S_AXI_CONTROL_ADDR_WIDTH of inst : label is 7;
  attribute C_S_AXI_CONTROL_DATA_WIDTH : integer;
  attribute C_S_AXI_CONTROL_DATA_WIDTH of inst : label is 32;
  attribute C_S_AXI_CONTROL_WSTRB_WIDTH : integer;
  attribute C_S_AXI_CONTROL_WSTRB_WIDTH of inst : label is 4;
  attribute C_S_AXI_DATA_WIDTH : integer;
  attribute C_S_AXI_DATA_WIDTH of inst : label is 32;
  attribute C_S_AXI_WSTRB_WIDTH : integer;
  attribute C_S_AXI_WSTRB_WIDTH of inst : label is 4;
  attribute SDX_KERNEL : string;
  attribute SDX_KERNEL of inst : label is "true";
  attribute SDX_KERNEL_SYNTH_INST : string;
  attribute SDX_KERNEL_SYNTH_INST of inst : label is "inst";
  attribute SDX_KERNEL_TYPE : string;
  attribute SDX_KERNEL_TYPE of inst : label is "hls";
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of ap_clk : signal is "xilinx.com:signal:clock:1.0 ap_clk CLK";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of ap_clk : signal is "XIL_INTERFACENAME ap_clk, ASSOCIATED_BUSIF s_axi_control, ASSOCIATED_RESET ap_rst_n, FREQ_HZ 99999001, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN design_1_zynq_ultra_ps_e_0_0_pl_clk0, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of ap_rst_n : signal is "xilinx.com:signal:reset:1.0 ap_rst_n RST";
  attribute X_INTERFACE_PARAMETER of ap_rst_n : signal is "XIL_INTERFACENAME ap_rst_n, POLARITY ACTIVE_LOW, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of s_axi_control_ARREADY : signal is "xilinx.com:interface:aximm:1.0 s_axi_control ARREADY";
  attribute X_INTERFACE_INFO of s_axi_control_ARVALID : signal is "xilinx.com:interface:aximm:1.0 s_axi_control ARVALID";
  attribute X_INTERFACE_INFO of s_axi_control_AWREADY : signal is "xilinx.com:interface:aximm:1.0 s_axi_control AWREADY";
  attribute X_INTERFACE_INFO of s_axi_control_AWVALID : signal is "xilinx.com:interface:aximm:1.0 s_axi_control AWVALID";
  attribute X_INTERFACE_INFO of s_axi_control_BREADY : signal is "xilinx.com:interface:aximm:1.0 s_axi_control BREADY";
  attribute X_INTERFACE_INFO of s_axi_control_BVALID : signal is "xilinx.com:interface:aximm:1.0 s_axi_control BVALID";
  attribute X_INTERFACE_INFO of s_axi_control_RREADY : signal is "xilinx.com:interface:aximm:1.0 s_axi_control RREADY";
  attribute X_INTERFACE_INFO of s_axi_control_RVALID : signal is "xilinx.com:interface:aximm:1.0 s_axi_control RVALID";
  attribute X_INTERFACE_INFO of s_axi_control_WREADY : signal is "xilinx.com:interface:aximm:1.0 s_axi_control WREADY";
  attribute X_INTERFACE_INFO of s_axi_control_WVALID : signal is "xilinx.com:interface:aximm:1.0 s_axi_control WVALID";
  attribute X_INTERFACE_PARAMETER of s_axi_control_WVALID : signal is "XIL_INTERFACENAME s_axi_control, ADDR_WIDTH 7, DATA_WIDTH 32, PROTOCOL AXI4LITE, READ_WRITE_MODE READ_WRITE, FREQ_HZ 99999001, ID_WIDTH 0, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, HAS_BURST 0, HAS_LOCK 0, HAS_PROT 0, HAS_CACHE 0, HAS_QOS 0, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, SUPPORTS_NARROW_BURST 0, NUM_READ_OUTSTANDING 1, NUM_WRITE_OUTSTANDING 1, MAX_BURST_LENGTH 1, PHASE 0.0, CLK_DOMAIN design_1_zynq_ultra_ps_e_0_0_pl_clk0, NUM_READ_THREADS 4, NUM_WRITE_THREADS 4, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of s_axi_control_ARADDR : signal is "xilinx.com:interface:aximm:1.0 s_axi_control ARADDR";
  attribute X_INTERFACE_INFO of s_axi_control_AWADDR : signal is "xilinx.com:interface:aximm:1.0 s_axi_control AWADDR";
  attribute X_INTERFACE_INFO of s_axi_control_BRESP : signal is "xilinx.com:interface:aximm:1.0 s_axi_control BRESP";
  attribute X_INTERFACE_INFO of s_axi_control_RDATA : signal is "xilinx.com:interface:aximm:1.0 s_axi_control RDATA";
  attribute X_INTERFACE_INFO of s_axi_control_RRESP : signal is "xilinx.com:interface:aximm:1.0 s_axi_control RRESP";
  attribute X_INTERFACE_INFO of s_axi_control_WDATA : signal is "xilinx.com:interface:aximm:1.0 s_axi_control WDATA";
  attribute X_INTERFACE_INFO of s_axi_control_WSTRB : signal is "xilinx.com:interface:aximm:1.0 s_axi_control WSTRB";
begin
  s_axi_control_BRESP(1) <= \<const0>\;
  s_axi_control_BRESP(0) <= \<const0>\;
  s_axi_control_RRESP(1) <= \<const0>\;
  s_axi_control_RRESP(0) <= \<const0>\;
GND: unisim.vcomponents.GND
     port map (
      G => \<const0>\
    );
inst: entity work.design_1_fpu_top_0_0_fpu_top
     port map (
      ap_clk => ap_clk,
      ap_rst_n => ap_rst_n,
      s_axi_control_ARADDR(6 downto 0) => s_axi_control_ARADDR(6 downto 0),
      s_axi_control_ARREADY => s_axi_control_ARREADY,
      s_axi_control_ARVALID => s_axi_control_ARVALID,
      s_axi_control_AWADDR(6 downto 2) => s_axi_control_AWADDR(6 downto 2),
      s_axi_control_AWADDR(1 downto 0) => B"00",
      s_axi_control_AWREADY => s_axi_control_AWREADY,
      s_axi_control_AWVALID => s_axi_control_AWVALID,
      s_axi_control_BREADY => s_axi_control_BREADY,
      s_axi_control_BRESP(1 downto 0) => NLW_inst_s_axi_control_BRESP_UNCONNECTED(1 downto 0),
      s_axi_control_BVALID => s_axi_control_BVALID,
      s_axi_control_RDATA(31 downto 0) => s_axi_control_RDATA(31 downto 0),
      s_axi_control_RREADY => s_axi_control_RREADY,
      s_axi_control_RRESP(1 downto 0) => NLW_inst_s_axi_control_RRESP_UNCONNECTED(1 downto 0),
      s_axi_control_RVALID => s_axi_control_RVALID,
      s_axi_control_WDATA(31 downto 0) => s_axi_control_WDATA(31 downto 0),
      s_axi_control_WREADY => s_axi_control_WREADY,
      s_axi_control_WSTRB(3 downto 0) => s_axi_control_WSTRB(3 downto 0),
      s_axi_control_WVALID => s_axi_control_WVALID
    );
end STRUCTURE;
