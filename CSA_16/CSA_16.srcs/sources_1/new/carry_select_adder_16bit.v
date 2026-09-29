module carry_select_adder_16bit (
    input  [15:0] a,
    input  [15:0] b,
    input         cin,
    output [15:0] sum,
    output        cout
);

    wire [8:0] lower_result;

    wire [8:0] upper_sum_cin0;
    wire [8:0] upper_sum_cin1;

    wire [7:0] upper_sum;

    // Lower 8-bit addition
    assign lower_result = {1'b0, a[7:0]}
                        + {1'b0, b[7:0]}
                        + cin;

    // Upper 8-bit addition assuming carry-in = 0
    assign upper_sum_cin0 = {1'b0, a[15:8]}
                          + {1'b0, b[15:8]};

    // Upper 8-bit addition assuming carry-in = 1
    assign upper_sum_cin1 = {1'b0, a[15:8]}
                          + {1'b0, b[15:8]}
                          + 1'b1;

    // Select the correct upper result
    assign upper_sum = lower_result[8]
                     ? upper_sum_cin1[7:0]
                     : upper_sum_cin0[7:0];

    // Combine lower and upper sums
    assign sum = {upper_sum, lower_result[7:0]};

    // Select the corresponding final carry-out
    assign cout = lower_result[8]
                ? upper_sum_cin1[8]
                : upper_sum_cin0[8];

endmodule