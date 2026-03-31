    // ------------------------------------------------------------
    // Reset
    // ------------------------------------------------------------
    task automatic reset_dut();
        begin
            rst_n     = 1'b0;
            valid_in  = 1'b0;
            precision = FP64;
            op        = ADD;
            operand_a = 64'd0;
            operand_b = 64'd0;

            repeat (3) @(posedge clk);
            rst_n = 1'b1;
            @(posedge clk);
        end
    endtask

    // ------------------------------------------------------------
    // Drive one transaction
    // ------------------------------------------------------------
    task automatic drive_txn(
        input logic [1:0]  p,
        input logic [1:0]  op_i,
        input logic [63:0] a_bits,
        input logic [63:0] b_bits
    );
        begin
            @(posedge clk);
            precision <= p;
            op        <= op_i;
            operand_a <= a_bits;
            operand_b <= b_bits;
            valid_in  <= 1'b1;

            @(posedge clk);
            valid_in  <= 1'b0;
        end
    endtask

    // ------------------------------------------------------------
    // Wait for DUT result and count latency
    // ------------------------------------------------------------
    task automatic wait_for_result(output int cycles);
        begin
            cycles = 0;
            while (valid_out !== 1'b1) begin
                @(posedge clk);
                cycles++;
            end
        end
    endtask

    // ------------------------------------------------------------
    // Run and check one FP64 test
    // ------------------------------------------------------------
    task automatic run_one_test_fp64(
        input logic [1:0]  op_i,
        input logic [63:0] a_bits,
        input logic [63:0] b_bits
    );
        real a_val, b_val, ref_val, hw_val;
        begin
            ref_bits = ref_model_fp64(op_i, a_bits, b_bits);

            drive_txn(FP64, op_i, a_bits, b_bits);
            wait_for_result(cycles_this_test);

            total_cycles = total_cycles + cycles_this_test;
            test_count   = test_count + 1;

            a_val   = $bitstoreal(a_bits);
            b_val   = $bitstoreal(b_bits);
            ref_val = $bitstoreal(ref_bits);
            hw_val  = $bitstoreal(result);

            if ((result !== ref_bits) || (precision_out !== FP64)) begin
                mismatch_count = mismatch_count + 1;

                $display("--------------------------------------------------");
                $display("MISMATCH");
                $display("OP            = %s", op_to_string(op_i));
                $display("PRECISION     = %s", precision_to_string(FP64));
                $display("A             = %0f", a_val);
                $display("B             = %0f", b_val);
                $display("REF           = %0f", ref_val);
                $display("HW            = %0f", hw_val);
                $display("A bits        = 64'h%016h", a_bits);
                $display("B bits        = 64'h%016h", b_bits);
                $display("REF bits      = 64'h%016h", ref_bits);
                $display("HW bits       = 64'h%016h", result);
                $display("precision_out = %b", precision_out);
                $display("cycles        = %0d", cycles_this_test);
            end
        end
    endtask

    // ------------------------------------------------------------
    // Directed corner cases for one operation
    // ------------------------------------------------------------
    task automatic run_corner_cases_fp64(input logic [1:0] op_i);
        fp64_vec_t v;
        begin
            $display("\n=== CornerCases: %s ===", op_to_string(op_i));

            mismatch_count = 0;
            total_cycles   = 0;
            test_count     = 0;

            v = make_fp64_vec(1.5, 2.25);          run_one_test_fp64(op_i, v.a_bits, v.b_bits);
            v = make_fp64_vec(-3.0, 1.25);         run_one_test_fp64(op_i, v.a_bits, v.b_bits);
            v = make_fp64_vec(0.0, 7.5);           run_one_test_fp64(op_i, v.a_bits, v.b_bits);
            v = make_fp64_vec(100.125, -50.0625);  run_one_test_fp64(op_i, v.a_bits, v.b_bits);
            v = make_fp64_vec(-0.5, -0.25);        run_one_test_fp64(op_i, v.a_bits, v.b_bits);
            v = make_fp64_vec(8.0, 0.5);           run_one_test_fp64(op_i, v.a_bits, v.b_bits);

            $display("RESULTS CornerCases | op=%s | tests=%0d | mismatches=%0d | total_cycles=%0d | avg_latency=%0f",
                     op_to_string(op_i),
                     test_count,
                     mismatch_count,
                     total_cycles,
                     (test_count > 0) ? real'(total_cycles)/test_count : 0.0);
        end
    endtask

    // ------------------------------------------------------------
    // Random tests for one operation
    // ------------------------------------------------------------
    task automatic run_random_tests_fp64(
        input logic [1:0] op_i,
        input int         N
    );
        fp64_vec_t v;
        real ra, rb;
        begin
            $display("\n=== Random: %s ===", op_to_string(op_i));

            mismatch_count = 0;
            total_cycles   = 0;
            test_count     = 0;

            for (int i = 0; i < N; i++) begin
                // Rango simple 
                ra = (($urandom_range(0, 200000) - 100000) / 1000.0);
                rb = (($urandom_range(0, 200000) - 100000) / 1000.0);

                // Evitar división por cero
                if ((op_i == DIV) && (rb == 0.0))
                    rb = 1.0;

                v = make_fp64_vec(ra, rb);
                run_one_test_fp64(op_i, v.a_bits, v.b_bits);
            end

            $display("RESULTS Random | op=%s | tests=%0d | mismatches=%0d | total_cycles=%0d | avg_latency=%0f",
                     op_to_string(op_i),
                     test_count,
                     mismatch_count,
                     total_cycles,
                     (test_count > 0) ? real'(total_cycles)/test_count : 0.0);
        end
    endtask