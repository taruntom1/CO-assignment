`timescale 1ns / 1ps

module tb_carry_select_adder_16bit;

    reg  [15:0] a;
    reg  [15:0] b;
    reg         cin;

    wire [15:0] sum;
    wire        cout;

    reg  [16:0] expected;

    integer i;
    integer pass_count;
    integer fail_count;

    // Instantiate the DUT
    carry_select_adder_16bit uut (
        .a(a),
        .b(b),
        .cin(cin),
        .sum(sum),
        .cout(cout)
    );

    // Task to apply inputs and check the result
    task check_result;
        input [15:0] test_a;
        input [15:0] test_b;
        input        test_cin;
        begin
            a = test_a;
            b = test_b;
            cin = test_cin;

            // Allow combinational logic to settle
            #10;

            // Calculate expected result
            expected = {1'b0, test_a}
                     + {1'b0, test_b}
                     + test_cin;

            // Compare DUT output with expected result
            if ({cout, sum} === expected) begin
                pass_count = pass_count + 1;
            end
            else begin
                fail_count = fail_count + 1;

                $display("FAIL: a=%h, b=%h, cin=%b", a, b, cin);
                $display("Expected: %h, Actual: %h",
                         expected, {cout, sum});
            end
        end
    endtask

    initial begin
        // Initialize signals and counters
        a = 16'b0;
        b = 16'b0;
        cin = 1'b0;

        pass_count = 0;
        fail_count = 0;

        // Generate VCD waveform
        $dumpfile("carry_select_adder.vcd");
        $dumpvars(0, tb_carry_select_adder_16bit);

        // Directed test cases

        // Zero inputs
        check_result(16'h0000, 16'h0000, 1'b0);

        // Carry-in only
        check_result(16'h0000, 16'h0000, 1'b1);

        // Maximum values
        check_result(16'hFFFF, 16'hFFFF, 1'b0);
        check_result(16'hFFFF, 16'hFFFF, 1'b1);

        // Carry propagation across lower and upper sections
        check_result(16'h00FF, 16'h0001, 1'b0);
        check_result(16'h0FFF, 16'h0001, 1'b0);
        check_result(16'hFFFF, 16'h0001, 1'b0);

        // Carry-select upper section cases
        check_result(16'h00FF, 16'hFF00, 1'b0);
        check_result(16'h0100, 16'h0100, 1'b0);
        check_result(16'hFF00, 16'h0100, 1'b0);
        check_result(16'hFFFF, 16'h0000, 1'b1);

        // Alternating bit patterns
        check_result(16'hAAAA, 16'h5555, 1'b0);
        check_result(16'h5555, 16'hAAAA, 1'b1);

        // Randomized test cases
        for (i = 0; i < 1000; i = i + 1) begin
            check_result($random, $random, $random);
        end

        // Final test summary
        $display("--------------------------------");
        $display("Testbench Summary");
        $display("Total tests : %0d", pass_count + fail_count);
        $display("Passed      : %0d", pass_count);
        $display("Failed      : %0d", fail_count);
        $display("--------------------------------");

        if (fail_count == 0)
            $display("TEST PASSED");
        else
            $display("TEST FAILED");

        $finish;
    end

endmodule