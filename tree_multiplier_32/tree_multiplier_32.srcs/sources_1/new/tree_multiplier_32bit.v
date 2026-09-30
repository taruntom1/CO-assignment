`timescale 1ns / 1ps

module tree_multiplier_32bit (
    input  wire [31:0] multiplicand,
    input  wire [31:0] multiplier,
    output wire [63:0] product
);

    // ------------------------------------------------------------------------
    // Stage 0: Generate 32 partial products.
    // Each partial product is either zero or a shifted version
    // of the 32-bit multiplicand.
    // ------------------------------------------------------------------------
    wire [63:0] partial_product [0:31];

    genvar i;

    generate
        for (i = 0; i < 32; i = i + 1) begin : GEN_PARTIAL_PRODUCTS
            assign partial_product[i] =
                multiplier[i] ?
                ({32'b0, multiplicand} << i) :
                64'b0;
        end
    endgenerate

    // ------------------------------------------------------------------------
    // Stage 1: 32 partial products -> 16 sums
    // ------------------------------------------------------------------------
    wire [63:0] stage1 [0:15];

    generate
        for (i = 0; i < 16; i = i + 1) begin : GEN_STAGE1
            assign stage1[i] =
                partial_product[2*i] +
                partial_product[2*i + 1];
        end
    endgenerate

    // ------------------------------------------------------------------------
    // Stage 2: 16 sums -> 8 sums
    // ------------------------------------------------------------------------
    wire [63:0] stage2 [0:7];

    generate
        for (i = 0; i < 8; i = i + 1) begin : GEN_STAGE2
            assign stage2[i] =
                stage1[2*i] +
                stage1[2*i + 1];
        end
    endgenerate

    // ------------------------------------------------------------------------
    // Stage 3: 8 sums -> 4 sums
    // ------------------------------------------------------------------------
    wire [63:0] stage3 [0:3];

    generate
        for (i = 0; i < 4; i = i + 1) begin : GEN_STAGE3
            assign stage3[i] =
                stage2[2*i] +
                stage2[2*i + 1];
        end
    endgenerate

    // ------------------------------------------------------------------------
    // Stage 4: 4 sums -> 2 sums
    // ------------------------------------------------------------------------
    wire [63:0] stage4 [0:1];

    assign stage4[0] = stage3[0] + stage3[1];
    assign stage4[1] = stage3[2] + stage3[3];

    // ------------------------------------------------------------------------
    // Stage 5: 2 sums -> final product
    // ------------------------------------------------------------------------
    assign product = stage4[0] + stage4[1];

endmodule