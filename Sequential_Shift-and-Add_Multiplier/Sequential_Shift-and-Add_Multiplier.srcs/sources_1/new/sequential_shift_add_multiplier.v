module sequential_shift_add_multiplier (
    input wire clk,
    input wire reset,
    input wire start,
    input wire [15:0] multiplicand,
    input wire [15:0] multiplier,

    output reg [31:0] product,
    output reg done
);

    reg [31:0] accumulator;
    reg [31:0] multiplicand_reg;
    reg [15:0] multiplier_reg;
    reg [4:0] count;
    reg busy;

    wire [31:0] sum;

    // Add the multiplicand when the current multiplier bit is 1
    assign sum = multiplier_reg[0] ?
                 accumulator + multiplicand_reg :
                 accumulator;

    always @(posedge clk) begin
        if (reset) begin
            accumulator     <= 32'd0;
            multiplicand_reg <= 32'd0;
            multiplier_reg  <= 16'd0;
            count            <= 5'd0;
            product           <= 32'd0;
            busy              <= 1'b0;
            done              <= 1'b0;
        end
        else begin
            // done is asserted for one clock cycle
            done <= 1'b0;

            if (!busy) begin
                if (start) begin
                    // Load operands and initialize multiplication
                    accumulator      <= 32'd0;
                    multiplicand_reg <= {16'd0, multiplicand};
                    multiplier_reg   <= multiplier;
                    count             <= 5'd0;
                    busy              <= 1'b1;
                end
            end
            else begin
                // Perform one shift-and-add iteration
                accumulator      <= sum;
                multiplicand_reg <= multiplicand_reg << 1;
                multiplier_reg   <= multiplier_reg >> 1;
                count             <= count + 1'b1;

                // Finish after 16 iterations
                if (count == 5'd15) begin
                    product <= sum;
                    done    <= 1'b1;
                    busy    <= 1'b0;
                end
            end
        end
    end

endmodule