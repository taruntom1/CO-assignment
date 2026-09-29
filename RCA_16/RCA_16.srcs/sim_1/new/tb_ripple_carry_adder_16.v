`timescale 1ns / 1ps

module tb_ripple_carry_adder_16;

    reg  [15:0] A;
    reg  [15:0] B;
    reg         Cin;

    wire [15:0] Sum;
    wire        Cout;

    ripple_carry_adder_16 DUT (
        .A(A),
        .B(B),
        .Cin(Cin),
        .Sum(Sum),
        .Cout(Cout)
    );

    initial begin

        // Test 1
        A = 16'h0000;
        B = 16'h0000;
        Cin = 1'b0;
        #10;

        // Test 2
        A = 16'h0001;
        B = 16'h0001;
        Cin = 1'b0;
        #10;

        // Test 3
        A = 16'h00FF;
        B = 16'h0001;
        Cin = 1'b0;
        #10;

        // Test 4
        A = 16'hFFFF;
        B = 16'h0001;
        Cin = 1'b0;
        #10;

        // Test 5
        A = 16'hAAAA;
        B = 16'h5555;
        Cin = 1'b0;
        #10;

        // Test 6
        A = 16'hFFFF;
        B = 16'hFFFF;
        Cin = 1'b0;
        #10;

        // Test 7
        A = 16'h1234;
        B = 16'h5678;
        Cin = 1'b1;
        #10;

        $finish;

    end

endmodule