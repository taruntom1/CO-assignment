`timescale 1ns / 1ps

module tb_tree_multiplier_32bit;

    reg  [31:0] multiplicand;
    reg  [31:0] multiplier;
    wire [63:0] product;

    reg [63:0] expected_product;

    integer test_count;
    integer pass_count;
    integer fail_count;
    integer i;

    // ------------------------------------------------------------------------
    // DUT instantiation
    // ------------------------------------------------------------------------
    tree_multiplier_32bit DUT (
        .multiplicand(multiplicand),
        .multiplier(multiplier),
        .product(product)
    );

    // ------------------------------------------------------------------------
    // VCD waveform generation
    // ------------------------------------------------------------------------
    initial begin
        $dumpfile("tree_multiplier_32bit.vcd");
        $dumpvars(0, tb_tree_multiplier_32bit);
    end

    // ------------------------------------------------------------------------
    // Task for applying and checking one test vector
    // ------------------------------------------------------------------------
    task check_result;
        input [31:0] a;
        input [31:0] b;
        begin
            multiplicand = a;
            multiplier   = b;

            // Allow combinational logic to settle
            #1;

            expected_product = {32'b0, a} * {32'b0, b};

            test_count = test_count + 1;

            if (product === expected_product) begin
                pass_count = pass_count + 1;
                $display(
                    "PASS: A = %h, B = %h, Product = %h",
                    a, b, product
                );
            end
            else begin
                fail_count = fail_count + 1;
                $display(
                    "FAIL: A = %h, B = %h, Expected = %h, Got = %h",
                    a, b, expected_product, product
                );
            end
        end
    endtask

    // ------------------------------------------------------------------------
    // Test cases
    // ------------------------------------------------------------------------
    initial begin
        test_count = 0;
        pass_count = 0;
        fail_count = 0;

        multiplicand = 32'b0;
        multiplier   = 32'b0;

        #1;

        $display("==============================================");
        $display("32-bit Tree Multiplier Testbench");
        $display("==============================================");

        // ------------------------------------------------------------
        // Basic cases
        // ------------------------------------------------------------
        check_result(32'd0,  32'd0);
        check_result(32'd0,  32'd12345);
        check_result(32'd12345, 32'd0);
        check_result(32'd1,  32'd1);
        check_result(32'd1,  32'd12345);
        check_result(32'd12345, 32'd1);

        // ------------------------------------------------------------
        // Boundary cases
        // ------------------------------------------------------------
        check_result(32'hFFFFFFFF, 32'd0);
        check_result(32'hFFFFFFFF, 32'd1);
        check_result(32'hFFFFFFFF, 32'hFFFFFFFF);

        check_result(32'h80000000, 32'd1);
        check_result(32'h80000000, 32'h80000000);

        check_result(32'h7FFFFFFF, 32'h7FFFFFFF);

        // ------------------------------------------------------------
        // Power-of-two cases
        // ------------------------------------------------------------
        check_result(32'd2,    32'd2);
        check_result(32'd4,    32'd8);
        check_result(32'd16,   32'd16);
        check_result(32'd256,  32'd1024);
        check_result(32'd65536, 32'd65536);

        // ------------------------------------------------------------
        // Mixed-value directed cases
        // ------------------------------------------------------------
        check_result(32'd123, 32'd456);
        check_result(32'd1000, 32'd1000);
        check_result(32'd65535, 32'd65535);
        check_result(32'h12345678, 32'h0000FFFF);
        check_result(32'hAAAAAAAA, 32'h55555555);
        check_result(32'hDEADBEEF, 32'h12345678);

        // ------------------------------------------------------------
        // Random test cases
        // ------------------------------------------------------------
        for (i = 0; i < 100; i = i + 1) begin
            check_result($random, $random);
        end

        // ------------------------------------------------------------
        // Final summary
        // ------------------------------------------------------------
        $display("==============================================");
        $display("Test Summary");
        $display("Total Tests : %0d", test_count);
        $display("Passed      : %0d", pass_count);
        $display("Failed      : %0d", fail_count);
        $display("==============================================");

        if (fail_count == 0) begin
            $display("ALL TESTS PASSED");
        end
        else begin
            $display("TESTS FAILED");
        end

        $finish;
    end

endmodule