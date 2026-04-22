// ============================================================================
// D3: FPU Time-Multiplexed SIMD
// ============================================================================
// Arquitectura:
//   - FP64 core reutilization
//   - Process SIMD operations sequentially
//     * FP64: 1 op → 1 cicle
//     * FP32: 2 op → 2 icles (low, high)
//     * FP16: 4 op → 4 icles (0, 1, 2, 3)
// ============================================================================

module fpu_top
    import fpu_pkg::*;
(
    input  logic             clk,
    input  logic             rst_n,
    input  logic             ce,
    
    // Entrada
    input  logic             valid_in,
    input  precision_e       precision,
    input  operation_e       op,
    input  logic [63:0]      operand_a,
    input  logic [63:0]      operand_b,
    
    // Salida
    output logic             valid_out,
    output precision_e       precision_out,
    output logic [63:0]      result,
    output fp_exceptions_t   exceptions
);

    // ========================================================================
    // Chip Enable (ce) for blackboxing
    // ========================================================================
    // The chip enable is not used functionality
    // only for HLS blackboxing purposes
    logic not_used_ce;
    assign not_used_ce = ce;

    // ========================================================================
    // FSM States
    // ========================================================================
    // The FSM uses the WAIT_* states to capture results and PROC_* states for processing
    
    typedef enum logic [3:0] {
        IDLE,
        PROC_FP64,       // procesing FP64
        WAIT_FP64,       // waiting FP64 result
        PROC_FP32_LO,    // procesing FP32 low
        WAIT_FP32_LO,    // waiting FP32 low result
        PROC_FP32_HI,    // procesing FP32 high
        WAIT_FP32_HI,    // waiting FP32 high result
        PROC_FP16_0,     // processing FP16 slot 0
        WAIT_FP16_0,     // waiting FP16 slot 0 result
        PROC_FP16_1,     // processing FP16 slot 1
        WAIT_FP16_1,     // waitng FP16 slot 1 result
        PROC_FP16_2,     // processing FP16 slot 2
        WAIT_FP16_2,     // waitng FP16 slot 2 result
        PROC_FP16_3,     // processing FP16 slot 3
        WAIT_FP16_3      // waitng FP16 slot 3 result
    } state_e;
    
    state_e state, next_state;

    // ========================================================================
    // registers to store operands and partial results
    // ========================================================================
    
    logic [63:0]      operand_a_reg, operand_b_reg;
    operation_e       op_reg;
    precision_e       precision_reg;
    logic [63:0]      result_reg;
    fp_exceptions_t   exceptions_reg;

    // ========================================================================
    // determine slot based on current state
    // ========================================================================
    
    logic [1:0] current_slot;  // 0-3 for FP16, 0-1 for FP32
    
    always_comb begin
        case (state)
            PROC_FP32_LO, WAIT_FP32_LO: current_slot = 2'd0;
            PROC_FP32_HI, WAIT_FP32_HI: current_slot = 2'd1;
            PROC_FP16_0,  WAIT_FP16_0:  current_slot = 2'd0;
            PROC_FP16_1,  WAIT_FP16_1:  current_slot = 2'd1;
            PROC_FP16_2,  WAIT_FP16_2:  current_slot = 2'd2;
            PROC_FP16_3,  WAIT_FP16_3:  current_slot = 2'd3;
            default:                    current_slot = 2'd0;
        endcase
    end

    // ========================================================================
    // selects current operand based on current state
    // ========================================================================
    
    logic [63:0] current_operand_a, current_operand_b;
    precision_e  core_precision;
    
    always_comb begin
        // Default
        current_operand_a = operand_a_reg;
        current_operand_b = operand_b_reg;
        core_precision = PREC_FP64;
        
        case (state)
            PROC_FP64, WAIT_FP64: begin
                current_operand_a = operand_a_reg;
                current_operand_b = operand_b_reg;
                core_precision = PREC_FP64;
            end
            
            PROC_FP32_LO, WAIT_FP32_LO: begin
                current_operand_a = {32'b0, operand_a_reg[31:0]};
                current_operand_b = {32'b0, operand_b_reg[31:0]};
                core_precision = PREC_FP32;
            end
            
            PROC_FP32_HI, WAIT_FP32_HI: begin
                current_operand_a = {32'b0, operand_a_reg[63:32]};
                current_operand_b = {32'b0, operand_b_reg[63:32]};
                core_precision = PREC_FP32;
            end
            
            PROC_FP16_0, WAIT_FP16_0: begin
                current_operand_a = {48'b0, operand_a_reg[15:0]};
                current_operand_b = {48'b0, operand_b_reg[15:0]};
                core_precision = PREC_FP16;
            end
            
            PROC_FP16_1, WAIT_FP16_1: begin
                current_operand_a = {48'b0, operand_a_reg[31:16]};
                current_operand_b = {48'b0, operand_b_reg[31:16]};
                core_precision = PREC_FP16;
            end
            
            PROC_FP16_2, WAIT_FP16_2: begin
                current_operand_a = {48'b0, operand_a_reg[47:32]};
                current_operand_b = {48'b0, operand_b_reg[47:32]};
                core_precision = PREC_FP16;
            end
            
            PROC_FP16_3, WAIT_FP16_3: begin
                current_operand_a = {48'b0, operand_a_reg[63:48]};
                current_operand_b = {48'b0, operand_b_reg[63:48]};
                core_precision = PREC_FP16;
            end
            
            default: begin
                current_operand_a = operand_a_reg;
                current_operand_b = operand_b_reg;
                core_precision = PREC_FP64;
            end
        endcase
    end

    // ========================================================================
    // Stage 1: Input Unpacking (combinational)
    // ========================================================================
    
    fp_internal_t a_unpacked, b_unpacked;
    
    fp_unpack unpack_a (
        .operand   (current_operand_a),
        .precision (core_precision),
        .unpacked  (a_unpacked)
    );
    
    fp_unpack unpack_b (
        .operand   (current_operand_b),
        .precision (core_precision),
        .unpacked  (b_unpacked)
    );

    // ========================================================================
    // Stage 2: Execution Core (combinational)
    // ========================================================================
    
    logic core_valid_in;
    // the core processes when on PROC_* states
    always_comb begin
        case (state)
            PROC_FP64, PROC_FP32_LO, PROC_FP32_HI,
            PROC_FP16_0, PROC_FP16_1, PROC_FP16_2, PROC_FP16_3:
                core_valid_in = 1'b1;
            default:
                core_valid_in = 1'b0;
        endcase
    end
    
    logic           core_valid_out;
    fp_internal_t   core_result;
    fp_exceptions_t core_exceptions;
    
    fpu_core core (
        .clk        (clk),
        .rst_n      (rst_n),
        .valid_in   (core_valid_in),
        .op         (op_reg),
        .a          (a_unpacked),
        .b          (b_unpacked),
        .valid_out  (core_valid_out),
        .result     (core_result),
        .exceptions (core_exceptions)
    );

    // ========================================================================
    // Stage 3: Output Packing (combinational)
    // ========================================================================
    
    logic [63:0] packed_result;
    logic        pack_overflow;
    logic        pack_underflow;
    
    fp_pack pack (
        .internal      (core_result),
        .precision     (core_precision),
        .packed_result (packed_result),
        .overflow      (pack_overflow),
        .underflow     (pack_underflow)
    );

    // ========================================================================
    // FSM: Next State Logic
    // ========================================================================
    
    always_comb begin
        next_state = state;
        
        case (state)
            IDLE: begin
                if (valid_in) begin
                    case (precision)
                        PREC_FP64: next_state = PROC_FP64;
                        PREC_FP32: next_state = PROC_FP32_LO;
                        PREC_FP16: next_state = PROC_FP16_0;
                        default:   next_state = PROC_FP64;
                    endcase
                end
            end
            
            // FP64: PROC -> WAIT (hasta core_valid_out) -> IDLE
            PROC_FP64:    next_state = WAIT_FP64;
            WAIT_FP64: begin
                if (core_valid_out)
                    next_state = IDLE;
                else
                    next_state = WAIT_FP64;
            end
            
            // FP32: cada WAIT espera core_valid_out
            PROC_FP32_LO: next_state = WAIT_FP32_LO;
            WAIT_FP32_LO: begin
                if (core_valid_out)
                    next_state = PROC_FP32_HI;
                else
                    next_state = WAIT_FP32_LO;
            end
            PROC_FP32_HI: next_state = WAIT_FP32_HI;
            WAIT_FP32_HI: begin
                if (core_valid_out)
                    next_state = IDLE;
                else
                    next_state = WAIT_FP32_HI;
            end
            
            // FP16: cada WAIT espera core_valid_out
            PROC_FP16_0:  next_state = WAIT_FP16_0;
            WAIT_FP16_0: begin
                if (core_valid_out)
                    next_state = PROC_FP16_1;
                else
                    next_state = WAIT_FP16_0;
            end
            PROC_FP16_1:  next_state = WAIT_FP16_1;
            WAIT_FP16_1: begin
                if (core_valid_out)
                    next_state = PROC_FP16_2;
                else
                    next_state = WAIT_FP16_1;
            end
            PROC_FP16_2:  next_state = WAIT_FP16_2;
            WAIT_FP16_2: begin
                if (core_valid_out)
                    next_state = PROC_FP16_3;
                else
                    next_state = WAIT_FP16_2;
            end
            PROC_FP16_3:  next_state = WAIT_FP16_3;
            WAIT_FP16_3: begin
                if (core_valid_out)
                    next_state = IDLE;
                else
                    next_state = WAIT_FP16_3;
            end
            
            default: next_state = IDLE;
        endcase
    end

    // ========================================================================
    // FSM: State Register & Output Logic
    // ========================================================================
    
    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            state          <= IDLE;
            operand_a_reg  <= 64'b0;
            operand_b_reg  <= 64'b0;
            op_reg         <= OP_ADD;
            precision_reg  <= PREC_FP64;
            result_reg     <= 64'b0;
            exceptions_reg <= '0;
            valid_out      <= 1'b0;
        end else begin
            state <= next_state;
            valid_out <= 1'b0;  // Default
            
            case (state)
                IDLE: begin
                    if (valid_in) begin
                        // Capturar operandos
                        operand_a_reg <= operand_a;
                        operand_b_reg <= operand_b;
                        op_reg        <= op;
                        precision_reg <= precision;
                        result_reg    <= 64'b0;
                        exceptions_reg <= '0;
                    end
                end
                
                // on WAIT_* states we capture the results
                WAIT_FP64: begin
                    if (core_valid_out) begin
                        result_reg     <= packed_result;
                        exceptions_reg <= core_exceptions;
                        valid_out      <= 1'b1;
                    end
                end
                
                WAIT_FP32_LO: begin
                    if (core_valid_out) begin
                        result_reg[31:0] <= packed_result[31:0];
                        exceptions_reg   <= exceptions_reg | core_exceptions;
                    end
                end
                
                WAIT_FP32_HI: begin
                    if (core_valid_out) begin
                        result_reg[63:32] <= packed_result[31:0];
                        exceptions_reg    <= exceptions_reg | core_exceptions;
                        valid_out         <= 1'b1;
                    end
                end
                
                WAIT_FP16_0: begin
                    if (core_valid_out) begin
                        result_reg[15:0] <= packed_result[15:0];
                        exceptions_reg   <= exceptions_reg | core_exceptions;
                    end
                end
                
                WAIT_FP16_1: begin
                    if (core_valid_out) begin
                        result_reg[31:16] <= packed_result[15:0];
                        exceptions_reg    <= exceptions_reg | core_exceptions;
                    end
                end
                
                WAIT_FP16_2: begin
                    if (core_valid_out) begin
                        result_reg[47:32] <= packed_result[15:0];
                        exceptions_reg    <= exceptions_reg | core_exceptions;
                    end
                end
                
                WAIT_FP16_3: begin
                    if (core_valid_out) begin
                        result_reg[63:48] <= packed_result[15:0];
                        exceptions_reg    <= exceptions_reg | core_exceptions;
                        valid_out         <= 1'b1;
                    end
                end
                
                default: begin
                    // do nothing on PROC_* states
                end
            endcase
        end
    end

    // ========================================================================
    // outputs
    // ========================================================================
    
    assign precision_out = precision_reg;
    assign result        = result_reg;
    assign exceptions    = exceptions_reg;

endmodule
