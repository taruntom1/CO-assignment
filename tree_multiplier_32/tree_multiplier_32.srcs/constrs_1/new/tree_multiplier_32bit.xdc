create_clock -name virtual_clk -period 10.000

# --------------------------------------------------------------------------
# Input delay constraints
# Customize these values according to the external system interface.
# --------------------------------------------------------------------------
set_input_delay -clock virtual_clk 0.000 \
    [get_ports {multiplicand multiplier}]


# --------------------------------------------------------------------------
# Output delay constraints
# Customize these values according to the external system interface.
# --------------------------------------------------------------------------
set_output_delay -clock virtual_clk  0.0 \
    [get_ports product]
