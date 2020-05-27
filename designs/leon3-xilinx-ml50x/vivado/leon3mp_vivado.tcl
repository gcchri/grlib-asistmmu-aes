create_project  ./vivado/ -part xc5vlx110t-ff1136-1 -force
set_property top testbench [get_filesets sim_1]
set_property target_language verilog [current_project]
# Add files for simulation and synthesis
source ./compile.vivado
add_files -fileset sim_1 testbench.vhd
add_files -fileset sim_1 prom.srec ram.srec
read_vhdl -library work ../../lib/gaisler/pcie/pcie.vhd
read_vhdl -library work config.vhd
read_vhdl -library work ahb2mig_ml50x.vhd
read_vhdl -library work ahbrom.vhd
read_vhdl -library work svga2ch7301c.vhd
read_vhdl -library work leon3mp.vhd
# Read board specific constraints
# Board, part and design properties
set_property target_simulator ModelSim [current_project]
set_property top_lib work [current_fileset]
set_property top_arch rtl [current_fileset]
set_property top leon3mp [current_fileset]
