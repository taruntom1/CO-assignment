create_clock -period 10.000 -name vclk
set_input_delay -clock vclk 0.000 [get_ports {{A[*]} {B[*]} Cin}]
set_output_delay -clock vclk 0.000 [get_ports {{Sum[*]} Cout}]
