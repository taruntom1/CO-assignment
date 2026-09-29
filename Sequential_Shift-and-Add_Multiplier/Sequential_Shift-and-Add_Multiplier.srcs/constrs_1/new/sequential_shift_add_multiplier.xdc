# Clock constraint
create_clock -name clk -period 10.000 [get_ports clk]

# Input delay constraints (excluding clock)
set_input_delay -clock clk 0.000 \
    [get_ports {reset start multiplicand[*] multiplier[*]}]


# Output delay constraints
set_output_delay -clock clk  0.000 \
    [get_ports {product[*] done}]
