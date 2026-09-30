module fp16_multiplier (
    input  [15:0] a,
    input  [15:0] b,
    output reg [15:0] product
);

    // Field extraction
    reg        sign_result;
    reg [4:0]  exponent_a;
    reg [4:0]  exponent_b;
    reg [9:0]  fraction_a;
    reg [9:0]  fraction_b;

    // 11-bit significands: implicit leading 1 for normalized numbers
    reg [10:0] mantissa_a;
    reg [10:0] mantissa_b;

    // 22-bit multiplication result
    reg [21:0] mantissa_product;

    // Result exponent
    reg signed [6:0] exponent_result;

    reg [9:0] fraction_result;

    always @* begin

        // Extract fields
        sign_result = a[15] ^ b[15];

        exponent_a = a[14:10];
        exponent_b = b[14:10];

        fraction_a = a[9:0];
        fraction_b = b[9:0];

        // Default values
        product          = 16'b0;
        mantissa_a       = 11'b0;
        mantissa_b       = 11'b0;
        mantissa_product = 22'b0;
        exponent_result  = 7'sd0;
        fraction_result  = 10'b0;

        // ------------------------------------------------------------
        // Special case 1: NaN
        // Exponent = 31 and fraction != 0
        // ------------------------------------------------------------
        if (((exponent_a == 5'b11111) && (fraction_a != 10'b0)) ||
            ((exponent_b == 5'b11111) && (fraction_b != 10'b0))) begin

            product = 16'h7E00;   // Quiet NaN

        end

        // ------------------------------------------------------------
        // Special case 2: Infinity
        // Infinity * Zero = NaN
        // ------------------------------------------------------------
        else if ((exponent_a == 5'b11111) ||
                 (exponent_b == 5'b11111)) begin

            if ((exponent_a == 5'b00000) ||
                (exponent_b == 5'b00000)) begin

                product = 16'h7E00;   // NaN

            end
            else begin

                product = {sign_result, 5'b11111, 10'b0000000000};
            end
        end

        // ------------------------------------------------------------
        // Special case 3: Zero / subnormal input
        // For this simplified implementation, exponent = 0 is
        // treated as zero.
        // ------------------------------------------------------------
        else if ((exponent_a == 5'b00000) ||
                 (exponent_b == 5'b00000)) begin

            product = {sign_result, 15'b0};

        end

        // ------------------------------------------------------------
        // Normalized floating-point multiplication
        // ------------------------------------------------------------
        else begin

            // Add the implicit leading 1
            mantissa_a = {1'b1, fraction_a};
            mantissa_b = {1'b1, fraction_b};

            // 11-bit x 11-bit = 22-bit multiplication
            mantissa_product = mantissa_a * mantissa_b;

            // Exponent:
            // Ea + Eb - Bias
            exponent_result =
                $signed({2'b00, exponent_a}) +
                $signed({2'b00, exponent_b}) -
                7'sd15;

            // --------------------------------------------------------
            // Normalize the significand
            //
            // Product range is [1,4), so the product either:
            //   1.xxxxx -> no additional shift
            //   10.xxxx -> shift right by one and increment exponent
            // --------------------------------------------------------
            if (mantissa_product[21] == 1'b1) begin

                fraction_result = mantissa_product[20:11];
                exponent_result = exponent_result + 7'sd1;

            end
            else begin

                fraction_result = mantissa_product[19:10];

            end

            // --------------------------------------------------------
            // Overflow -> Infinity
            // --------------------------------------------------------
            if (exponent_result >= 7'sd31) begin

                product = {sign_result, 5'b11111, 10'b0};

            end

            // --------------------------------------------------------
            // Underflow -> Zero
            // --------------------------------------------------------
            else if (exponent_result <= 7'sd0) begin

                product = {sign_result, 15'b0};

            end

            // --------------------------------------------------------
            // Normal result
            // --------------------------------------------------------
            else begin

                product = {
                    sign_result,
                    exponent_result[4:0],
                    fraction_result
                };

            end
        end

    end

endmodule