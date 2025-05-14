## Clock signal
set_property PACKAGE_PIN W5 [get_ports Clk]
	set_property IOSTANDARD LVCMOS33 [get_ports Clk]
	create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports Clk]

## Switches
set_property PACKAGE_PIN V17 [get_ports {change_program}]
	set_property IOSTANDARD LVCMOS33 [get_ports {change_program}]
## LEDs
set_property PACKAGE_PIN U16 [get_ports {LED[0]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {LED[0]}]
set_property PACKAGE_PIN E19 [get_ports {LED[1]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {LED[1]}]
set_property PACKAGE_PIN U19 [get_ports {LED[2]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {LED[2]}]
set_property PACKAGE_PIN V19 [get_ports {LED[3]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {LED[3]}]
	
set_property PACKAGE_PIN P1 [get_ports {Zero}]
	set_property IOSTANDARD LVCMOS33 [get_ports {Zero}]
set_property PACKAGE_PIN L1 [get_ports {Overflow}]
	set_property IOSTANDARD LVCMOS33 [get_ports {Overflow}]


##7 segment display
set_property PACKAGE_PIN W7 [get_ports {S_7seg[0]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {S_7seg[0]}]
set_property PACKAGE_PIN W6 [get_ports {S_7seg[1]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {S_7seg[1]}]
set_property PACKAGE_PIN U8 [get_ports {S_7seg[2]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {S_7seg[2]}]
set_property PACKAGE_PIN V8 [get_ports {S_7seg[3]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {S_7seg[3]}]
set_property PACKAGE_PIN U5 [get_ports {S_7seg[4]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {S_7seg[4]}]
set_property PACKAGE_PIN V5 [get_ports {S_7seg[5]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {S_7seg[5]}]
set_property PACKAGE_PIN U7 [get_ports {S_7seg[6]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {S_7seg[6]}]

set_property PACKAGE_PIN U2 [get_ports {anode[0]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {anode[0]}]
set_property PACKAGE_PIN U4 [get_ports {anode[1]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {anode[1]}]
set_property PACKAGE_PIN V4 [get_ports {anode[2]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {anode[2]}]
set_property PACKAGE_PIN W4 [get_ports {anode[3]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {anode[3]}]


##Buttons
set_property PACKAGE_PIN U18 [get_ports Reset]
	set_property IOSTANDARD LVCMOS33 [get_ports Reset]
