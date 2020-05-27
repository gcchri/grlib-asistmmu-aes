# Xilinx planAhead script for LEON/GRLIB
# Create a new project
create_project  ./planahead/ -part xc5vlx110t-ff1136-1 -force
# Board, part and design properties
set_property target_simulator ModelSim [current_project]
set_property top_lib work [current_fileset]
set_property top_arch rtl [current_fileset]
set_property top leon3mp [current_fileset]
set_property target_language VHDL [current_project]
# Add files for simulation and synthesis
set_property top testbench [get_filesets sim_1]
source ./compile.planAhead
read_vhdl -library work ../../lib/gaisler/pcie/pcie.vhd
read_vhdl -library work config.vhd
read_vhdl -library work ahb2mig_ml50x.vhd
read_vhdl -library work ahbrom.vhd
read_vhdl -library work svga2ch7301c.vhd
read_vhdl -library work leon3mp.vhd
add_files -fileset sim_1 testbench.vhd
add_files -fileset sim_1 prom.srec ram.srec
# Read board specific constraints
set_property steps.xst.args.netlist_hierarchy as_optimized [get_runs synth_1]
set_property strategy XST Defaults [get_runs synth_1]
