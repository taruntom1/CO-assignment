// 4-bit Carry Look-Ahead Adder
module cla4 (
    input  [3:0] A,
    input  [3:0] B,
    input        Cin,
    output [3:0] Sum,
    output       Cout,
    output       P,
    output       G
);

    wire [3:0] p, g;
    wire [4:0] c;

    assign p = A ^ B;
    assign g = A & B;

    assign c[0] = Cin;

    // Internal carry look-ahead equations
    assign c[1] = g[0] | (p[0] & c[0]);

    assign c[2] = g[1] |
                  (p[1] & g[0]) |
                  (p[1] & p[0] & c[0]);

    assign c[3] = g[2] |
                  (p[2] & g[1]) |
                  (p[2] & p[1] & g[0]) |
                  (p[2] & p[1] & p[0] & c[0]);

    assign c[4] = g[3] |
                  (p[3] & g[2]) |
                  (p[3] & p[2] & g[1]) |
                  (p[3] & p[2] & p[1] & g[0]) |
                  (p[3] & p[2] & p[1] & p[0] & c[0]);

    assign Sum = p ^ c[3:0];
    assign Cout = c[4];

    // Group propagate and generate
    assign P = &p;

    assign G = g[3] |
               (p[3] & g[2]) |
               (p[3] & p[2] & g[1]) |
               (p[3] & p[2] & p[1] & g[0]);

endmodule


// 16-bit Carry Look-Ahead Adder
module cla16 (
    input  [15:0] A,
    input  [15:0] B,
    input         Cin,
    output [15:0] Sum,
    output        Cout
);

    wire [3:0] block_P;
    wire [3:0] block_G;
    wire [4:0] C;

    assign C[0] = Cin;

    // Look-ahead carry equations between 4-bit blocks
    assign C[1] = block_G[0] |
                  (block_P[0] & C[0]);

    assign C[2] = block_G[1] |
                  (block_P[1] & block_G[0]) |
                  (block_P[1] & block_P[0] & C[0]);

    assign C[3] = block_G[2] |
                  (block_P[2] & block_G[1]) |
                  (block_P[2] & block_P[1] & block_G[0]) |
                  (block_P[2] & block_P[1] & block_P[0] & C[0]);

    assign C[4] = block_G[3] |
                  (block_P[3] & block_G[2]) |
                  (block_P[3] & block_P[2] & block_G[1]) |
                  (block_P[3] & block_P[2] & block_P[1] & block_G[0]) |
                  (block_P[3] & block_P[2] & block_P[1] & block_P[0] & C[0]);

    // Four 4-bit CLA blocks
    cla4 CLA0 (
        .A(A[3:0]),
        .B(B[3:0]),
        .Cin(C[0]),
        .Sum(Sum[3:0]),
        .Cout(),
        .P(block_P[0]),
        .G(block_G[0])
    );

    cla4 CLA1 (
        .A(A[7:4]),
        .B(B[7:4]),
        .Cin(C[1]),
        .Sum(Sum[7:4]),
        .Cout(),
        .P(block_P[1]),
        .G(block_G[1])
    );

    cla4 CLA2 (
        .A(A[11:8]),
        .B(B[11:8]),
        .Cin(C[2]),
        .Sum(Sum[11:8]),
        .Cout(),
        .P(block_P[2]),
        .G(block_G[2])
    );

    cla4 CLA3 (
        .A(A[15:12]),
        .B(B[15:12]),
        .Cin(C[3]),
        .Sum(Sum[15:12]),
        .Cout(),
        .P(block_P[3]),
        .G(block_G[3])
    );

    assign Cout = C[4];

endmodule