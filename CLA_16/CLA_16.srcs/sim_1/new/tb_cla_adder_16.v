`timescale 1ns / 1ps

module cla16_tb;

    reg  [15:0] A, B;
    reg         Cin;

    wire [15:0] Sum;
    wire        Cout;

    reg  [16:0] Expected;
    integer i;
    integer pass_count;
    integer fail_count;

    // DUT instantiation
    cla16 DUT (
        .A(A),
        .B(B),
        .Cin(Cin),
        .Sum(Sum),
        .Cout(Cout)
    );

    // Task to apply inputs and verify outputs
    task check_result;
        input [15:0] test_A;
        input [15:0] test_B;
        input        test_Cin;
        begin
            A = test_A;
            B = test_B;
            Cin = test_Cin;

            // Allow combinational logic to settle
            #10;

            // Independent reference calculation
            Expected = {1'b0, A} + {1'b0, B} + Cin;

            if ({Cout, Sum} === Expected) begin
                pass_count = pass_count + 1;
            end
            else begin
                fail_count = fail_count + 1;
                $display("FAIL: A=%h B=%h Cin=%b", A, B, Cin);
                $display("Expected=%h, Actual=%h",
                         Expected, {Cout, Sum});
            end
        end
    endtask

    initial begin
        $dumpfile("cla16.vcd");
        $dumpvars(0, cla16_tb);

        pass_count = 0;
        fail_count = 0;

        // Directed test cases
        check_result(16'h0000, 16'h0000, 1'b0);
        check_result(16'h0000, 16'h0000, 1'b1);
        check_result(16'h0001, 16'h0001, 1'b0);
        check_result(16'hFFFF, 16'h0001, 1'b0);
        check_result(16'hFFFF, 16'hFFFF, 1'b0);
        check_result(16'hFFFF, 16'hFFFF, 1'b1);
        check_result(16'h7FFF, 16'h0001, 1'b0);
        check_result(16'h8000, 16'h8000, 1'b0);
        check_result(16'h0FFF, 16'h0001, 1'b0);
        check_result(16'h00FF, 16'h0001, 1'b0);
        check_result(16'h5555, 16'hAAAA, 1'b0);
        check_result(16'hAAAA, 16'h5555, 1'b1);
        check_result(16'h1111, 16'hEEEE, 1'b0);
        check_result(16'hFFFF, 16'h0000, 1'b1);

        // Randomized test cases
        for (i = 0; i < 1000; i = i + 1) begin
            check_result($random, $random, $random);
        end

        // Final test summary
        $display("--------------------------------");
        $display("16-bit CLA Test Summary");
        $display("Passed: %0d", pass_count);
        $display("Failed: %0d", fail_count);
        $display("--------------------------------");

        if (fail_count == 0)
            $display("TEST RESULT: PASS");
        else
            $display("TEST RESULT: FAIL");

        $finish;
    end

endmodule