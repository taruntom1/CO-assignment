//`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.09.2026 10:21:20
// Design Name: 
// Module Name: ripple_carry_adder_16
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module ripple_carry_adder_16 (
    input  [15:0] A,
    input  [15:0] B,
    input         Cin,
    output [15:0] Sum,
    output        Cout
);

    wire [16:0] C;

    assign C[0] = Cin;
    assign Cout = C[16];

    // Bit 0
    full_adder FA0 (
        .A(A[0]),
        .B(B[0]),
        .Cin(C[0]),
        .Sum(Sum[0]),
        .Cout(C[1])
    );

    // Bit 1
    full_adder FA1 (
        .A(A[1]),
        .B(B[1]),
        .Cin(C[1]),
        .Sum(Sum[1]),
        .Cout(C[2])
    );

    // Bit 2
    full_adder FA2 (
        .A(A[2]),
        .B(B[2]),
        .Cin(C[2]),
        .Sum(Sum[2]),
        .Cout(C[3])
    );

    // Bit 3
    full_adder FA3 (
        .A(A[3]),
        .B(B[3]),
        .Cin(C[3]),
        .Sum(Sum[3]),
        .Cout(C[4])
    );

    // Bit 4
    full_adder FA4 (
        .A(A[4]),
        .B(B[4]),
        .Cin(C[4]),
        .Sum(Sum[4]),
        .Cout(C[5])
    );

    // Bit 5
    full_adder FA5 (
        .A(A[5]),
        .B(B[5]),
        .Cin(C[5]),
        .Sum(Sum[5]),
        .Cout(C[6])
    );

    // Bit 6
    full_adder FA6 (
        .A(A[6]),
        .B(B[6]),
        .Cin(C[6]),
        .Sum(Sum[6]),
        .Cout(C[7])
    );

    // Bit 7
    full_adder FA7 (
        .A(A[7]),
        .B(B[7]),
        .Cin(C[7]),
        .Sum(Sum[7]),
        .Cout(C[8])
    );

    // Bit 8
    full_adder FA8 (
        .A(A[8]),
        .B(B[8]),
        .Cin(C[8]),
        .Sum(Sum[8]),
        .Cout(C[9])
    );

    // Bit 9
    full_adder FA9 (
        .A(A[9]),
        .B(B[9]),
        .Cin(C[9]),
        .Sum(Sum[9]),
        .Cout(C[10])
    );

    // Bit 10
    full_adder FA10 (
        .A(A[10]),
        .B(B[10]),
        .Cin(C[10]),
        .Sum(Sum[10]),
        .Cout(C[11])
    );

    // Bit 11
    full_adder FA11 (
        .A(A[11]),
        .B(B[11]),
        .Cin(C[11]),
        .Sum(Sum[11]),
        .Cout(C[12])
    );

    // Bit 12
    full_adder FA12 (
        .A(A[12]),
        .B(B[12]),
        .Cin(C[12]),
        .Sum(Sum[12]),
        .Cout(C[13])
    );

    // Bit 13
    full_adder FA13 (
        .A(A[13]),
        .B(B[13]),
        .Cin(C[13]),
        .Sum(Sum[13]),
        .Cout(C[14])
    );

    // Bit 14
    full_adder FA14 (
        .A(A[14]),
        .B(B[14]),
        .Cin(C[14]),
        .Sum(Sum[14]),
        .Cout(C[15])
    );

    // Bit 15
    full_adder FA15 (
        .A(A[15]),
        .B(B[15]),
        .Cin(C[15]),
        .Sum(Sum[15]),
        .Cout(C[16])
    );

endmodule