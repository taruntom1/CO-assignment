`timescale 1ns/1ps

module fp16_multiplier_tb;

    reg  [15:0] a;
    reg  [15:0] b;
    wire [15:0] product;

    integer test_count;
    integer pass_count;
    integer fail_count;

    // DUT
    fp16_multiplier dut (
        .a(a),
        .b(b),
        .product(product)
    );

    // ------------------------------------------------------------
    // Test task
    // ------------------------------------------------------------
    task apply_and_check;
        input [15:0] a_value;
        input [15:0] b_value;
        input [15:0] expected_value;

        begin
            a = a_value;
            b = b_value;

            // Allow combinational logic to settle
            #15;

            test_count = test_count + 1;

            if (product === expected_value) begin
                pass_count = pass_count + 1;

                $display(
                    "PASS: A=%h  B=%h  PRODUCT=%h",
                    a, b, product
                );
            end
            else begin
                fail_count = fail_count + 1;

                $display(
                    "FAIL: A=%h  B=%h  EXPECTED=%h  ACTUAL=%h",
                    a, b, expected_value, product
                );
            end
        end
    endtask

    initial begin

        // VCD waveform generation
        $dumpfile("fp16_multiplier.vcd");
        $dumpvars(0, fp16_multiplier_tb);

        // Counters
        test_count = 0;
        pass_count = 0;
        fail_count = 0;

        // Initial values
        a = 16'b0;
        b = 16'b0;

        #1;

        // --------------------------------------------------------
        // Basic multiplication
        // --------------------------------------------------------

        // 1.0 * 1.0 = 1.0
        apply_and_check(16'h3C00, 16'h3C00, 16'h3C00);

        // 1.0 * 2.0 = 2.0
        apply_and_check(16'h3C00, 16'h4000, 16'h4000);

        // 2.0 * 4.0 = 8.0
        apply_and_check(16'h4000, 16'h4400, 16'h4800);

        // 1.5 * 2.0 = 3.0
        apply_and_check(16'h3E00, 16'h4000, 16'h4200);

        // 1.5 * 1.25 = 1.875
        apply_and_check(16'h3E00, 16'h3D00, 16'h3F80);

        // 2.5 * 4.0 = 10.0
        apply_and_check(16'h4100, 16'h4400, 16'h4900);

        // --------------------------------------------------------
        // Sign tests
        // --------------------------------------------------------

        // -1.5 * 2.0 = -3.0
        apply_and_check(16'hBE00, 16'h4000, 16'hC200);

        // -2.0 * -4.0 = +8.0
        apply_and_check(16'hC000, 16'hC400, 16'h4800);

        // +2.0 * -4.0 = -8.0
        apply_and_check(16'h4000, 16'hC400, 16'hC800);

        // --------------------------------------------------------
        // Zero tests
        // --------------------------------------------------------

        // 0 * 1 = 0
        apply_and_check(16'h0000, 16'h3C00, 16'h0000);

        // 1 * 0 = 0
        apply_and_check(16'h3C00, 16'h0000, 16'h0000);

        // -0 * 1 = -0
        apply_and_check(16'h8000, 16'h3C00, 16'h8000);

        // --------------------------------------------------------
        // Boundary tests
        // --------------------------------------------------------

        // Maximum finite value * 1 = maximum finite value
        apply_and_check(16'h7BFF, 16'h3C00, 16'h7BFF);

        // 32768 * 2 -> overflow -> +Infinity
        apply_and_check(16'h7800, 16'h4000, 16'h7C00);

        // Negative overflow -> -Infinity
        apply_and_check(16'hF800, 16'h4000, 16'hFC00);

        // --------------------------------------------------------
        // Special values
        // --------------------------------------------------------

        // Infinity * 2 = Infinity
        apply_and_check(16'h7C00, 16'h4000, 16'h7C00);

        // -Infinity * 2 = -Infinity
        apply_and_check(16'hFC00, 16'h4000, 16'hFC00);

        // Infinity * 0 = NaN
        apply_and_check(16'h7C00, 16'h0000, 16'h7E00);

        // NaN * 1 = NaN
        apply_and_check(16'h7E00, 16'h3C00, 16'h7E00);

        // --------------------------------------------------------
        // Underflow / subnormal handling
        // --------------------------------------------------------

        // Smallest normal * 0.5 -> underflow to zero
        apply_and_check(16'h0400, 16'h3800, 16'h0000);

        // Exponent = 0 is treated as zero in this simplified design
        apply_and_check(16'h0001, 16'h3C00, 16'h0000);

        // --------------------------------------------------------
        // Final summary
        // --------------------------------------------------------

        $display("");
        $display("========================================");
        $display("16-bit Floating-Point Multiplier Test");
        $display("========================================");
        $display("Total Tests : %0d", test_count);
        $display("Passed      : %0d", pass_count);
        $display("Failed      : %0d", fail_count);

        if (fail_count == 0)
            $display("RESULT      : ALL TESTS PASSED");
        else
            $display("RESULT      : SOME TESTS FAILED");

        $display("========================================");

        $finish;
    end

endmodule