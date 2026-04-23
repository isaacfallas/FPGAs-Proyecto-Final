-- ==============================================================
-- Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2024.1 (64-bit)
-- Tool Version Limit: 2024.05
-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
-- 
-- ==============================================================
library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity fpu_top_control_s_axi is
generic (
    C_S_AXI_ADDR_WIDTH    : INTEGER := 7;
    C_S_AXI_DATA_WIDTH    : INTEGER := 32);
port (
    ACLK                  :in   STD_LOGIC;
    ARESET                :in   STD_LOGIC;
    ACLK_EN               :in   STD_LOGIC;
    AWADDR                :in   STD_LOGIC_VECTOR(C_S_AXI_ADDR_WIDTH-1 downto 0);
    AWVALID               :in   STD_LOGIC;
    AWREADY               :out  STD_LOGIC;
    WDATA                 :in   STD_LOGIC_VECTOR(C_S_AXI_DATA_WIDTH-1 downto 0);
    WSTRB                 :in   STD_LOGIC_VECTOR(C_S_AXI_DATA_WIDTH/8-1 downto 0);
    WVALID                :in   STD_LOGIC;
    WREADY                :out  STD_LOGIC;
    BRESP                 :out  STD_LOGIC_VECTOR(1 downto 0);
    BVALID                :out  STD_LOGIC;
    BREADY                :in   STD_LOGIC;
    ARADDR                :in   STD_LOGIC_VECTOR(C_S_AXI_ADDR_WIDTH-1 downto 0);
    ARVALID               :in   STD_LOGIC;
    ARREADY               :out  STD_LOGIC;
    RDATA                 :out  STD_LOGIC_VECTOR(C_S_AXI_DATA_WIDTH-1 downto 0);
    RRESP                 :out  STD_LOGIC_VECTOR(1 downto 0);
    RVALID                :out  STD_LOGIC;
    RREADY                :in   STD_LOGIC;
    clk                   :in   STD_LOGIC;
    rst                   :in   STD_LOGIC;
    rst_n                 :out  STD_LOGIC_VECTOR(0 downto 0);
    ce_r                  :out  STD_LOGIC_VECTOR(0 downto 0);
    valid_in              :out  STD_LOGIC_VECTOR(0 downto 0);
    precision             :out  STD_LOGIC_VECTOR(1 downto 0);
    op                    :out  STD_LOGIC_VECTOR(1 downto 0);
    operand_a             :out  STD_LOGIC_VECTOR(63 downto 0);
    operand_b             :out  STD_LOGIC_VECTOR(63 downto 0);
    valid_out             :out  STD_LOGIC_VECTOR(0 downto 0);
    precision_out         :out  STD_LOGIC_VECTOR(1 downto 0);
    result                :out  STD_LOGIC_VECTOR(63 downto 0);
    exceptions            :out  STD_LOGIC_VECTOR(4 downto 0)
);
end entity fpu_top_control_s_axi;

-- ------------------------Address Info-------------------
-- Protocol Used: ap_ctrl_none
--
-- 0x00 : reserved
-- 0x04 : reserved
-- 0x08 : reserved
-- 0x0c : reserved
-- 0x18 : Data signal of rst_n
--        bit 0  - rst_n[0] (Read/Write)
--        others - reserved
-- 0x1c : reserved
-- 0x20 : Data signal of ce_r
--        bit 0  - ce_r[0] (Read/Write)
--        others - reserved
-- 0x24 : reserved
-- 0x28 : Data signal of valid_in
--        bit 0  - valid_in[0] (Read/Write)
--        others - reserved
-- 0x2c : reserved
-- 0x30 : Data signal of precision
--        bit 1~0 - precision[1:0] (Read/Write)
--        others  - reserved
-- 0x34 : reserved
-- 0x38 : Data signal of op
--        bit 1~0 - op[1:0] (Read/Write)
--        others  - reserved
-- 0x3c : reserved
-- 0x40 : Data signal of operand_a
--        bit 31~0 - operand_a[31:0] (Read/Write)
-- 0x44 : Data signal of operand_a
--        bit 31~0 - operand_a[63:32] (Read/Write)
-- 0x48 : reserved
-- 0x4c : Data signal of operand_b
--        bit 31~0 - operand_b[31:0] (Read/Write)
-- 0x50 : Data signal of operand_b
--        bit 31~0 - operand_b[63:32] (Read/Write)
-- 0x54 : reserved
-- 0x58 : Data signal of valid_out
--        bit 0  - valid_out[0] (Read/Write)
--        others - reserved
-- 0x5c : reserved
-- 0x60 : Data signal of precision_out
--        bit 1~0 - precision_out[1:0] (Read/Write)
--        others  - reserved
-- 0x64 : reserved
-- 0x68 : Data signal of result
--        bit 31~0 - result[31:0] (Read/Write)
-- 0x6c : Data signal of result
--        bit 31~0 - result[63:32] (Read/Write)
-- 0x70 : reserved
-- 0x74 : Data signal of exceptions
--        bit 4~0 - exceptions[4:0] (Read/Write)
--        others  - reserved
-- 0x78 : reserved
-- (SC = Self Clear, COR = Clear on Read, TOW = Toggle on Write, COH = Clear on Handshake)

architecture behave of fpu_top_control_s_axi is
    type states is (wridle, wrdata, wrresp, wrreset, rdidle, rddata, rdreset);  -- read and write fsm states
    signal wstate  : states := wrreset;
    signal rstate  : states := rdreset;
    signal wnext, rnext: states;
    constant ADDR_RST_N_DATA_0         : INTEGER := 16#18#;
    constant ADDR_RST_N_CTRL           : INTEGER := 16#1c#;
    constant ADDR_CE_R_DATA_0          : INTEGER := 16#20#;
    constant ADDR_CE_R_CTRL            : INTEGER := 16#24#;
    constant ADDR_VALID_IN_DATA_0      : INTEGER := 16#28#;
    constant ADDR_VALID_IN_CTRL        : INTEGER := 16#2c#;
    constant ADDR_PRECISION_DATA_0     : INTEGER := 16#30#;
    constant ADDR_PRECISION_CTRL       : INTEGER := 16#34#;
    constant ADDR_OP_DATA_0            : INTEGER := 16#38#;
    constant ADDR_OP_CTRL              : INTEGER := 16#3c#;
    constant ADDR_OPERAND_A_DATA_0     : INTEGER := 16#40#;
    constant ADDR_OPERAND_A_DATA_1     : INTEGER := 16#44#;
    constant ADDR_OPERAND_A_CTRL       : INTEGER := 16#48#;
    constant ADDR_OPERAND_B_DATA_0     : INTEGER := 16#4c#;
    constant ADDR_OPERAND_B_DATA_1     : INTEGER := 16#50#;
    constant ADDR_OPERAND_B_CTRL       : INTEGER := 16#54#;
    constant ADDR_VALID_OUT_DATA_0     : INTEGER := 16#58#;
    constant ADDR_VALID_OUT_CTRL       : INTEGER := 16#5c#;
    constant ADDR_PRECISION_OUT_DATA_0 : INTEGER := 16#60#;
    constant ADDR_PRECISION_OUT_CTRL   : INTEGER := 16#64#;
    constant ADDR_RESULT_DATA_0        : INTEGER := 16#68#;
    constant ADDR_RESULT_DATA_1        : INTEGER := 16#6c#;
    constant ADDR_RESULT_CTRL          : INTEGER := 16#70#;
    constant ADDR_EXCEPTIONS_DATA_0    : INTEGER := 16#74#;
    constant ADDR_EXCEPTIONS_CTRL      : INTEGER := 16#78#;
    constant ADDR_BITS         : INTEGER := 7;

    signal waddr               : UNSIGNED(ADDR_BITS-1 downto 0);
    signal wmask               : UNSIGNED(C_S_AXI_DATA_WIDTH-1 downto 0);
    signal aw_hs               : STD_LOGIC;
    signal w_hs                : STD_LOGIC;
    signal rdata_data          : UNSIGNED(C_S_AXI_DATA_WIDTH-1 downto 0);
    signal ar_hs               : STD_LOGIC;
    signal raddr               : UNSIGNED(ADDR_BITS-1 downto 0);
    signal AWREADY_t           : STD_LOGIC;
    signal WREADY_t            : STD_LOGIC;
    signal ARREADY_t           : STD_LOGIC;
    signal RVALID_t            : STD_LOGIC;
    -- internal registers
    signal int_rst_n           : UNSIGNED(0 downto 0) := (others => '0');
    signal rst_n_set           : UNSIGNED(0 downto 0) := (others => '0');
    signal int_ce_r            : UNSIGNED(0 downto 0) := (others => '0');
    signal ce_r_set            : UNSIGNED(0 downto 0) := (others => '0');
    signal int_valid_in        : UNSIGNED(0 downto 0) := (others => '0');
    signal valid_in_set        : UNSIGNED(0 downto 0) := (others => '0');
    signal int_precision       : UNSIGNED(1 downto 0) := (others => '0');
    signal precision_set       : UNSIGNED(1 downto 0) := (others => '0');
    signal int_op              : UNSIGNED(1 downto 0) := (others => '0');
    signal op_set              : UNSIGNED(1 downto 0) := (others => '0');
    signal int_operand_a       : UNSIGNED(63 downto 0) := (others => '0');
    signal operand_a_set       : UNSIGNED(63 downto 0) := (others => '0');
    signal int_operand_b       : UNSIGNED(63 downto 0) := (others => '0');
    signal operand_b_set       : UNSIGNED(63 downto 0) := (others => '0');
    signal int_valid_out       : UNSIGNED(0 downto 0) := (others => '0');
    signal valid_out_set       : UNSIGNED(0 downto 0) := (others => '0');
    signal int_precision_out   : UNSIGNED(1 downto 0) := (others => '0');
    signal precision_out_set   : UNSIGNED(1 downto 0) := (others => '0');
    signal int_result          : UNSIGNED(63 downto 0) := (others => '0');
    signal result_set          : UNSIGNED(63 downto 0) := (others => '0');
    signal int_exceptions      : UNSIGNED(4 downto 0) := (others => '0');
    signal exceptions_set      : UNSIGNED(4 downto 0) := (others => '0');


begin
-- ----------------------- Instantiation------------------


-- ----------------------- AXI WRITE ---------------------
    AWREADY_t <=  '1' when wstate = wridle else '0';
    AWREADY   <=  AWREADY_t;
    WREADY_t  <=  '1' when wstate = wrdata else '0';
    WREADY    <=  WREADY_t;
    BRESP     <=  "00";  -- OKAY
    BVALID    <=  '1' when wstate = wrresp else '0';
    wmask     <=  (31 downto 24 => WSTRB(3), 23 downto 16 => WSTRB(2), 15 downto 8 => WSTRB(1), 7 downto 0 => WSTRB(0));
    aw_hs     <=  AWVALID and AWREADY_t;
    w_hs      <=  WVALID and WREADY_t;

    -- write FSM
    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                wstate <= wrreset;
            elsif (ACLK_EN = '1') then
                wstate <= wnext;
            end if;
        end if;
    end process;

    process (wstate, AWVALID, WVALID, BREADY)
    begin
        case (wstate) is
        when wridle =>
            if (AWVALID = '1') then
                wnext <= wrdata;
            else
                wnext <= wridle;
            end if;
        when wrdata =>
            if (WVALID = '1') then
                wnext <= wrresp;
            else
                wnext <= wrdata;
            end if;
        when wrresp =>
            if (BREADY = '1') then
                wnext <= wridle;
            else
                wnext <= wrresp;
            end if;
        when others =>
            wnext <= wridle;
        end case;
    end process;

    waddr_proc : process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ACLK_EN = '1') then
                if (aw_hs = '1') then
                    waddr <= UNSIGNED(AWADDR(ADDR_BITS-1 downto 2) & (1 downto 0 => '0'));
                end if;
            end if;
        end if;
    end process;

-- ----------------------- AXI READ ----------------------
    ARREADY_t <= '1' when (rstate = rdidle) else '0';
    ARREADY <= ARREADY_t;
    RDATA   <= STD_LOGIC_VECTOR(rdata_data);
    RRESP   <= "00";  -- OKAY
    RVALID_t  <= '1' when (rstate = rddata) else '0';
    RVALID    <= RVALID_t;
    ar_hs   <= ARVALID and ARREADY_t;
    raddr   <= UNSIGNED(ARADDR(ADDR_BITS-1 downto 0));

    -- read FSM
    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                rstate <= rdreset;
            elsif (ACLK_EN = '1') then
                rstate <= rnext;
            end if;
        end if;
    end process;

    process (rstate, ARVALID, RREADY, RVALID_t)
    begin
        case (rstate) is
        when rdidle =>
            if (ARVALID = '1') then
                rnext <= rddata;
            else
                rnext <= rdidle;
            end if;
        when rddata =>
            if (RREADY = '1' and RVALID_t = '1') then
                rnext <= rdidle;
            else
                rnext <= rddata;
            end if;
        when others =>
            rnext <= rdidle;
        end case;
    end process;

    rdata_proc : process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ACLK_EN = '1') then
                if (ar_hs = '1') then
                    rdata_data <= (others => '0');
                    case (TO_INTEGER(raddr)) is
                    when ADDR_RST_N_DATA_0 =>
                        rdata_data <= RESIZE(rst_n_set(0 downto 0), 32);
                    when ADDR_CE_R_DATA_0 =>
                        rdata_data <= RESIZE(ce_r_set(0 downto 0), 32);
                    when ADDR_VALID_IN_DATA_0 =>
                        rdata_data <= RESIZE(valid_in_set(0 downto 0), 32);
                    when ADDR_PRECISION_DATA_0 =>
                        rdata_data <= RESIZE(precision_set(1 downto 0), 32);
                    when ADDR_OP_DATA_0 =>
                        rdata_data <= RESIZE(op_set(1 downto 0), 32);
                    when ADDR_OPERAND_A_DATA_0 =>
                        rdata_data <= RESIZE(operand_a_set(31 downto 0), 32);
                    when ADDR_OPERAND_A_DATA_1 =>
                        rdata_data <= RESIZE(operand_a_set(63 downto 32), 32);
                    when ADDR_OPERAND_B_DATA_0 =>
                        rdata_data <= RESIZE(operand_b_set(31 downto 0), 32);
                    when ADDR_OPERAND_B_DATA_1 =>
                        rdata_data <= RESIZE(operand_b_set(63 downto 32), 32);
                    when ADDR_VALID_OUT_DATA_0 =>
                        rdata_data <= RESIZE(valid_out_set(0 downto 0), 32);
                    when ADDR_PRECISION_OUT_DATA_0 =>
                        rdata_data <= RESIZE(precision_out_set(1 downto 0), 32);
                    when ADDR_RESULT_DATA_0 =>
                        rdata_data <= RESIZE(result_set(31 downto 0), 32);
                    when ADDR_RESULT_DATA_1 =>
                        rdata_data <= RESIZE(result_set(63 downto 32), 32);
                    when ADDR_EXCEPTIONS_DATA_0 =>
                        rdata_data <= RESIZE(exceptions_set(4 downto 0), 32);
                    when others =>
                        NULL;
                    end case;
                end if;
            end if;
        end if;
    end process;

-- ----------------------- Register logic ----------------
    rst_n                <= STD_LOGIC_VECTOR(int_rst_n);
    ce_r                 <= STD_LOGIC_VECTOR(int_ce_r);
    valid_in             <= STD_LOGIC_VECTOR(int_valid_in);
    precision            <= STD_LOGIC_VECTOR(int_precision);
    op                   <= STD_LOGIC_VECTOR(int_op);
    operand_a            <= STD_LOGIC_VECTOR(int_operand_a);
    operand_b            <= STD_LOGIC_VECTOR(int_operand_b);
    valid_out            <= STD_LOGIC_VECTOR(int_valid_out);
    precision_out        <= STD_LOGIC_VECTOR(int_precision_out);
    result               <= STD_LOGIC_VECTOR(int_result);
    exceptions           <= STD_LOGIC_VECTOR(int_exceptions);

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                rst_n_set(0 downto 0) <= (others => '0');
            elsif (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_RST_N_DATA_0) then
                    rst_n_set(0 downto 0) <= (UNSIGNED(WDATA(0 downto 0)) and wmask(0 downto 0)) or ((not wmask(0 downto 0)) and rst_n_set(0 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                ce_r_set(0 downto 0) <= (others => '0');
            elsif (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_CE_R_DATA_0) then
                    ce_r_set(0 downto 0) <= (UNSIGNED(WDATA(0 downto 0)) and wmask(0 downto 0)) or ((not wmask(0 downto 0)) and ce_r_set(0 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                valid_in_set(0 downto 0) <= (others => '0');
            elsif (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_VALID_IN_DATA_0) then
                    valid_in_set(0 downto 0) <= (UNSIGNED(WDATA(0 downto 0)) and wmask(0 downto 0)) or ((not wmask(0 downto 0)) and valid_in_set(0 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                precision_set(1 downto 0) <= (others => '0');
            elsif (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_PRECISION_DATA_0) then
                    precision_set(1 downto 0) <= (UNSIGNED(WDATA(1 downto 0)) and wmask(1 downto 0)) or ((not wmask(1 downto 0)) and precision_set(1 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                op_set(1 downto 0) <= (others => '0');
            elsif (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_OP_DATA_0) then
                    op_set(1 downto 0) <= (UNSIGNED(WDATA(1 downto 0)) and wmask(1 downto 0)) or ((not wmask(1 downto 0)) and op_set(1 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                operand_a_set(31 downto 0) <= (others => '0');
            elsif (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_OPERAND_A_DATA_0) then
                    operand_a_set(31 downto 0) <= (UNSIGNED(WDATA(31 downto 0)) and wmask(31 downto 0)) or ((not wmask(31 downto 0)) and operand_a_set(31 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                operand_a_set(63 downto 32) <= (others => '0');
            elsif (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_OPERAND_A_DATA_1) then
                    operand_a_set(63 downto 32) <= (UNSIGNED(WDATA(31 downto 0)) and wmask(31 downto 0)) or ((not wmask(31 downto 0)) and operand_a_set(63 downto 32));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                operand_b_set(31 downto 0) <= (others => '0');
            elsif (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_OPERAND_B_DATA_0) then
                    operand_b_set(31 downto 0) <= (UNSIGNED(WDATA(31 downto 0)) and wmask(31 downto 0)) or ((not wmask(31 downto 0)) and operand_b_set(31 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                operand_b_set(63 downto 32) <= (others => '0');
            elsif (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_OPERAND_B_DATA_1) then
                    operand_b_set(63 downto 32) <= (UNSIGNED(WDATA(31 downto 0)) and wmask(31 downto 0)) or ((not wmask(31 downto 0)) and operand_b_set(63 downto 32));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                valid_out_set(0 downto 0) <= (others => '0');
            elsif (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_VALID_OUT_DATA_0) then
                    valid_out_set(0 downto 0) <= (UNSIGNED(WDATA(0 downto 0)) and wmask(0 downto 0)) or ((not wmask(0 downto 0)) and valid_out_set(0 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                precision_out_set(1 downto 0) <= (others => '0');
            elsif (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_PRECISION_OUT_DATA_0) then
                    precision_out_set(1 downto 0) <= (UNSIGNED(WDATA(1 downto 0)) and wmask(1 downto 0)) or ((not wmask(1 downto 0)) and precision_out_set(1 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                result_set(31 downto 0) <= (others => '0');
            elsif (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_RESULT_DATA_0) then
                    result_set(31 downto 0) <= (UNSIGNED(WDATA(31 downto 0)) and wmask(31 downto 0)) or ((not wmask(31 downto 0)) and result_set(31 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                result_set(63 downto 32) <= (others => '0');
            elsif (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_RESULT_DATA_1) then
                    result_set(63 downto 32) <= (UNSIGNED(WDATA(31 downto 0)) and wmask(31 downto 0)) or ((not wmask(31 downto 0)) and result_set(63 downto 32));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                exceptions_set(4 downto 0) <= (others => '0');
            elsif (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_EXCEPTIONS_DATA_0) then
                    exceptions_set(4 downto 0) <= (UNSIGNED(WDATA(4 downto 0)) and wmask(4 downto 0)) or ((not wmask(4 downto 0)) and exceptions_set(4 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (clk)
    begin
        if (clk'event and clk = '1') then
             if (rst = '1') then
                 int_rst_n(0 downto 0) <= (others => '0');
             else
                 int_rst_n(0 downto 0) <= rst_n_set(0 downto 0);
            end if;
        end if;
    end process;
    process (clk)
    begin
        if (clk'event and clk = '1') then
             if (rst = '1') then
                 int_ce_r(0 downto 0) <= (others => '0');
             else
                 int_ce_r(0 downto 0) <= ce_r_set(0 downto 0);
            end if;
        end if;
    end process;
    process (clk)
    begin
        if (clk'event and clk = '1') then
             if (rst = '1') then
                 int_valid_in(0 downto 0) <= (others => '0');
             else
                 int_valid_in(0 downto 0) <= valid_in_set(0 downto 0);
            end if;
        end if;
    end process;
    process (clk)
    begin
        if (clk'event and clk = '1') then
             if (rst = '1') then
                 int_precision(1 downto 0) <= (others => '0');
             else
                 int_precision(1 downto 0) <= precision_set(1 downto 0);
            end if;
        end if;
    end process;
    process (clk)
    begin
        if (clk'event and clk = '1') then
             if (rst = '1') then
                 int_op(1 downto 0) <= (others => '0');
             else
                 int_op(1 downto 0) <= op_set(1 downto 0);
            end if;
        end if;
    end process;
    process (clk)
    begin
        if (clk'event and clk = '1') then
             if (rst = '1') then
                 int_operand_a(31 downto 0) <= (others => '0');
             else
                 int_operand_a(31 downto 0) <= operand_a_set(31 downto 0);
            end if;
        end if;
    end process;
    process (clk)
    begin
        if (clk'event and clk = '1') then
             if (rst = '1') then
                 int_operand_a(63 downto 32) <= (others => '0');
             else
                 int_operand_a(63 downto 32) <= operand_a_set(63 downto 32);
            end if;
        end if;
    end process;
    process (clk)
    begin
        if (clk'event and clk = '1') then
             if (rst = '1') then
                 int_operand_b(31 downto 0) <= (others => '0');
             else
                 int_operand_b(31 downto 0) <= operand_b_set(31 downto 0);
            end if;
        end if;
    end process;
    process (clk)
    begin
        if (clk'event and clk = '1') then
             if (rst = '1') then
                 int_operand_b(63 downto 32) <= (others => '0');
             else
                 int_operand_b(63 downto 32) <= operand_b_set(63 downto 32);
            end if;
        end if;
    end process;
    process (clk)
    begin
        if (clk'event and clk = '1') then
             if (rst = '1') then
                 int_valid_out(0 downto 0) <= (others => '0');
             else
                 int_valid_out(0 downto 0) <= valid_out_set(0 downto 0);
            end if;
        end if;
    end process;
    process (clk)
    begin
        if (clk'event and clk = '1') then
             if (rst = '1') then
                 int_precision_out(1 downto 0) <= (others => '0');
             else
                 int_precision_out(1 downto 0) <= precision_out_set(1 downto 0);
            end if;
        end if;
    end process;
    process (clk)
    begin
        if (clk'event and clk = '1') then
             if (rst = '1') then
                 int_result(31 downto 0) <= (others => '0');
             else
                 int_result(31 downto 0) <= result_set(31 downto 0);
            end if;
        end if;
    end process;
    process (clk)
    begin
        if (clk'event and clk = '1') then
             if (rst = '1') then
                 int_result(63 downto 32) <= (others => '0');
             else
                 int_result(63 downto 32) <= result_set(63 downto 32);
            end if;
        end if;
    end process;
    process (clk)
    begin
        if (clk'event and clk = '1') then
             if (rst = '1') then
                 int_exceptions(4 downto 0) <= (others => '0');
             else
                 int_exceptions(4 downto 0) <= exceptions_set(4 downto 0);
            end if;
        end if;
    end process;

-- ----------------------- Memory logic ------------------

end architecture behave;
