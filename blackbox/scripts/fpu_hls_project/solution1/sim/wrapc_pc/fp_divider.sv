// ============================================================================
// Divisor Iterativo para FPU - Restoring Division
// ============================================================================
// División de mantisas IEEE 754 FP64:
//   mant_a[52:0]: mantisa dividendo (53 bits, bit implícito en [52])
//   mant_b[52:0]: mantisa divisor   (53 bits, bit implícito en [52])
//
// Calcula: quotient = floor( (mant_a << 53) / mant_b )
//
// El resultado tiene 54 bits: si mant_a >= mant_b, bit 53 está set.
//                             si mant_a <  mant_b, bit 52 está set.
//
// Algoritmo: Restoring long division (shift-and-subtract)
//   - Dividendo conceptual: 106 bits = {mant_a, 53'b0}
//   - Divisor: 53 bits = mant_b
//   - Se pre-carga partial_rem con mant_a (equivale a procesar los 53 MSBs
//     del dividendo de 106 bits), luego se hacen 54 iteraciones shift-subtract
//     alimentando ceros como bits del dividendo.
//   - La primera iteración NO hace shift (compara mant_a vs mant_b directamente)
//     para producir el MSB del cociente sin el doble-shift que introduciría
//     un factor de 2 en el resultado.
//
// Latencia: 56 ciclos (1 carga + 54 iteraciones + 1 done)
// ============================================================================

module fp_divider (
    input  logic        clk,
    input  logic        rst_n,
    
    // Control
    input  logic        start,
    output logic        busy,
    output logic        done,
    
    // Operands
    input  logic [52:0] mant_a,     // mantisa dividendo (53 bits)
    input  logic [52:0] mant_b,     // mantisa divisor (53 bits)
    
    // Result
    output logic [53:0] quotient    // cociente de 54 bits
);

    // ========================================================================
    // Parámetros
    // ========================================================================
    
    localparam int MANT_W = 53;     // Bits de mantisa
    localparam int QUOT_W = 54;     // Bits de cociente
    localparam int ITER   = QUOT_W; // 54 iteraciones
    localparam int CNT_W  = 6;      // ceil(log2(54)) + 1
    
    // ========================================================================
    // Registros internos
    // ========================================================================
    
    // Partial remainder: 54 bits (MANT_W+1) para la resta con signo
    logic [MANT_W:0]    partial_rem;    // 54 bits
    logic [MANT_W-1:0]  divisor_reg;    // 53 bits
    logic [QUOT_W-1:0]  quot_reg;       // 54 bits
    logic [CNT_W-1:0]   count;
    
    // Registro del bit siguiente del dividendo "virtual"
    // Después de pre-cargar mant_a en partial_rem, alimentamos 54 ceros
    // No necesitamos un shift register — siempre es 0
    
    // FSM
    typedef enum logic [1:0] {
        S_IDLE,
        S_COMPUTE,
        S_DONE
    } state_e;
    
    state_e state;
    
    // ========================================================================
    // Trial subtraction (combinacional)
    // ========================================================================
    
    // first_iter: primera iteración NO hace shift, solo compara partial_rem vs divisor
    // remaining: shift left partial_rem, luego resta
    logic             first_iter;
    
    logic [MANT_W:0] shifted_rem;   // 54 bits
    logic [MANT_W:0] trial_sub;     // 54 bits (resultado de la resta)
    logic             trial_ok;
    
    assign first_iter  = (count == '0);
    // En primera iteración: NO shift (compara mant_a directamente con mant_b)
    // En iteraciones 1..53: shift left y alimentar 0
    assign shifted_rem = first_iter ? partial_rem : {partial_rem[MANT_W-1:0], 1'b0};
    assign trial_sub   = shifted_rem - {1'b0, divisor_reg};
    assign trial_ok    = ~trial_sub[MANT_W];  // >= 0 si MSB es 0
    
    // ========================================================================
    // FSM & Datapath
    // ========================================================================
    
    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            state       <= S_IDLE;
            partial_rem <= '0;
            divisor_reg <= '0;
            quot_reg    <= '0;
            count       <= '0;
            busy        <= 1'b0;
            done        <= 1'b0;
            quotient    <= '0;
        end else begin
            done <= 1'b0;
            
            case (state)
                S_IDLE: begin
                    if (start) begin
                        // Pre-cargar partial_rem con mant_a
                        // Esto es equivalente a haber procesado los 53 MSBs
                        // del dividendo de 106 bits = {mant_a, 53'b0}
                        partial_rem <= {1'b0, mant_a};  // 54 bits = {0, mant_a}
                        divisor_reg <= mant_b;
                        quot_reg    <= '0;
                        count       <= '0;
                        busy        <= 1'b1;
                        state       <= S_COMPUTE;
                    end
                end
                
                S_COMPUTE: begin
                    // Trial: shifted_rem = partial_rem << 1, then subtract divisor
                    if (trial_ok) begin
                        partial_rem <= trial_sub;
                        quot_reg    <= {quot_reg[QUOT_W-2:0], 1'b1};
                    end else begin
                        partial_rem <= shifted_rem;
                        quot_reg    <= {quot_reg[QUOT_W-2:0], 1'b0};
                    end
                    
                    count <= count + 1;
                    
                    if (count == ITER[CNT_W-1:0] - 1) begin
                        if (trial_ok)
                            quotient <= {quot_reg[QUOT_W-2:0], 1'b1};
                        else
                            quotient <= {quot_reg[QUOT_W-2:0], 1'b0};
                        
                        done  <= 1'b1;
                        busy  <= 1'b0;
                        state <= S_DONE;
                    end
                end
                
                S_DONE: begin
                    state <= S_IDLE;
                end
                
                default: state <= S_IDLE;
            endcase
        end
    end

endmodule
