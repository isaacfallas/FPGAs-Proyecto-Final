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

#define CONTROL_ADDR_RST_N_DATA         0x18
#define CONTROL_BITS_RST_N_DATA         1
#define CONTROL_ADDR_CE_R_DATA          0x20
#define CONTROL_BITS_CE_R_DATA          1
#define CONTROL_ADDR_VALID_IN_DATA      0x28
#define CONTROL_BITS_VALID_IN_DATA      1
#define CONTROL_ADDR_PRECISION_DATA     0x30
#define CONTROL_BITS_PRECISION_DATA     2
#define CONTROL_ADDR_OP_DATA            0x38
#define CONTROL_BITS_OP_DATA            2
#define CONTROL_ADDR_OPERAND_A_DATA     0x40
#define CONTROL_BITS_OPERAND_A_DATA     64
#define CONTROL_ADDR_OPERAND_B_DATA     0x4c
#define CONTROL_BITS_OPERAND_B_DATA     64
#define CONTROL_ADDR_VALID_OUT_DATA     0x58
#define CONTROL_BITS_VALID_OUT_DATA     1
#define CONTROL_ADDR_PRECISION_OUT_DATA 0x60
#define CONTROL_BITS_PRECISION_OUT_DATA 2
#define CONTROL_ADDR_RESULT_DATA        0x68
#define CONTROL_BITS_RESULT_DATA        64
#define CONTROL_ADDR_EXCEPTIONS_DATA    0x74
#define CONTROL_BITS_EXCEPTIONS_DATA    5
