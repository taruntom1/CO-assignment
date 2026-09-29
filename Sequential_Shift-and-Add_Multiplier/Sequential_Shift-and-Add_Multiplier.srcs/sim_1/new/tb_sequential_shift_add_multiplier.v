`timescale 1ns / 1ps

module tb_sequential_shift_add_multiplier;

    reg clk;
    reg reset;
    reg start;
    reg [15:0] multiplicand;
    reg [15:0] multiplier;

    wire [31:0] product;
    wire done;

    reg [31:0] expected;
    integer i;
    integer cycles;
    integer pass_count;
    integer fail_count;

    // Instantiate DUT
    sequential_shift_add_multiplier uut (
        .clk(clk),
        .reset(reset),
        .start(start),
        .multiplicand(multiplicand),
        .multiplier(multiplier),
        .product(product),
        .done(done)
    );

    // Clock generation: 10 ns period
    initial begin
        clk = 1'b0;
        forever #5 clk = ~clk;
    end

    // Task to apply and verify one multiplication
    task test_multiply;
        input [15:0] a;
        input [15:0] b;
        begin
            // Apply inputs on the falling edge
            @(negedge clk);
            multiplicand = a;
            multiplier = b;
            start = 1'b1;

            expected = {16'd0, a} * {16'd0, b};

            // Load operands
            @(negedge clk);
            start = 1'b0;

            // Wait for completion, with a timeout
            cycles = 0;
            while (done !== 1'b1 && cycles < 17) begin
                @(posedge clk);
                #1;
                cycles = cycles + 1;
            end

            // Check the result
            if (done === 1'b1 && product === expected) begin
                $display("PASS: %0d * %0d = %0d (cycles = %0d)",
                         a, b, product, cycles);
                pass_count = pass_count + 1;
            end
            else begin
                $display("FAIL: %0d * %0d | Expected = %0d, Got = %0d, Done = %b",
                         a, b, expected, product, done);
                fail_count = fail_count + 1;
            end

            // Allow the DUT to return to its idle state
            @(negedge clk);
        end
    endtask

    initial begin
        $dumpfile("sequential_multiplier.vcd");
        $dumpvars(0, tb_sequential_shift_add_multiplier);

        reset = 1'b1;
        start = 1'b0;
        multiplicand = 16'd0;
        multiplier = 16'd0;

        pass_count = 0;
        fail_count = 0;

        // Verify reset
        repeat (2) @(negedge clk);

        if (product === 32'd0 && done === 1'b0) begin
            $display("PASS: Reset verification");
            pass_count = pass_count + 1;
        end
        else begin
            $display("FAIL: Reset verification");
            fail_count = fail_count + 1;
        end

        reset = 1'b0;

        // Directed test cases
        test_multiply(16'd0,     16'd0);
        test_multiply(16'd0,     16'd65535);
        test_multiply(16'd1,     16'd1);
        test_multiply(16'd1,     16'd65535);
        test_multiply(16'd2,     16'd32768);
        test_multiply(16'd15,    16'd15);
        test_multiply(16'd255,   16'd255);
        test_multiply(16'd256,   16'd256);
        test_multiply(16'd32768, 16'd2);
        test_multiply(16'd65535, 16'd65535);
        test_multiply(16'hAAAA,  16'h5555);
        test_multiply(16'hFFFF,  16'h0001);

        // Randomized test cases
        for (i = 0; i < 20; i = i + 1) begin
            test_multiply($random, $random);
        end

        // Final summary
        $display("-----------------------------------");
        $display("Test Summary");
        $display("Passed: %0d", pass_count);
        $display("Failed: %0d", fail_count);
        $display("-----------------------------------");

        if (fail_count == 0)
            $display("ALL TESTS PASSED");
        else
            $display("SOME TESTS FAILED");

        $finish;
    end

endmodule