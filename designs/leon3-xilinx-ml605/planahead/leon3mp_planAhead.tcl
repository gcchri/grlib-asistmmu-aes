# Xilinx planAhead script for LEON/GRLIB
# Create a new project
create_project leon3-xilinx-ml605 ./planahead/leon3-xilinx-ml605 -part XC6VLX240T-ff1156-1 -force
# Board, part and design properties
set_property target_simulator ModelSim [current_project]
set_property top_lib work [current_fileset]
set_property top_arch rtl [current_fileset]
set_property top leon3mp [current_fileset]
set_property target_language VHDL [current_project]
# Add files for simulation and synthesis
set_property top testbench [get_filesets sim_1]
source ./compile.planAhead
read_verilog -library work mig/user_design/rtl/controller/arb_mux.v
read_verilog -library work mig/user_design/rtl/controller/arb_row_col.v
read_verilog -library work mig/user_design/rtl/controller/arb_select.v
read_verilog -library work mig/user_design/rtl/controller/bank_cntrl.v
read_verilog -library work mig/user_design/rtl/controller/bank_common.v
read_verilog -library work mig/user_design/rtl/controller/bank_compare.v
read_verilog -library work mig/user_design/rtl/controller/bank_mach.v
read_verilog -library work mig/user_design/rtl/controller/bank_queue.v
read_verilog -library work mig/user_design/rtl/controller/bank_state.v
read_verilog -library work mig/user_design/rtl/controller/col_mach.v
read_verilog -library work mig/user_design/rtl/controller/mc.v
read_verilog -library work mig/user_design/rtl/controller/rank_cntrl.v
read_verilog -library work mig/user_design/rtl/controller/rank_common.v
read_verilog -library work mig/user_design/rtl/controller/rank_mach.v
read_verilog -library work mig/user_design/rtl/controller/round_robin_arb.v
read_verilog -library work mig/user_design/rtl/ecc/ecc_buf.v
read_verilog -library work mig/user_design/rtl/ecc/ecc_dec_fix.v
read_verilog -library work mig/user_design/rtl/ecc/ecc_gen.v
read_verilog -library work mig/user_design/rtl/ecc/ecc_merge_enc.v
read_verilog -library work mig/user_design/rtl/ip_top/clk_ibuf.v
read_verilog -library work mig/user_design/rtl/ip_top/ddr2_ddr3_chipscope.v
read_verilog -library work mig/user_design/rtl/ip_top/infrastructure.v
read_verilog -library work mig/user_design/rtl/ip_top/iodelay_ctrl.v
read_verilog -library work mig/user_design/rtl/ip_top/mem_intfc.v
read_verilog -library work mig/user_design/rtl/ip_top/memc_ui_top.v
read_verilog -library work mig/user_design/rtl/ip_top/mig.v
read_verilog -library work mig/user_design/rtl/phy/circ_buffer.v
read_verilog -library work mig/user_design/rtl/phy/phy_ck_iob.v
read_verilog -library work mig/user_design/rtl/phy/phy_clock_io.v
read_verilog -library work mig/user_design/rtl/phy/phy_control_io.v
read_verilog -library work mig/user_design/rtl/phy/phy_data_io.v
read_verilog -library work mig/user_design/rtl/phy/phy_dly_ctrl.v
read_verilog -library work mig/user_design/rtl/phy/phy_dm_iob.v
read_verilog -library work mig/user_design/rtl/phy/phy_dq_iob.v
read_verilog -library work mig/user_design/rtl/phy/phy_dqs_iob.v
read_verilog -library work mig/user_design/rtl/phy/phy_init.v
read_verilog -library work mig/user_design/rtl/phy/phy_pd.v
read_verilog -library work mig/user_design/rtl/phy/phy_pd_top.v
read_verilog -library work mig/user_design/rtl/phy/phy_rdclk_gen.v
read_verilog -library work mig/user_design/rtl/phy/phy_rdctrl_sync.v
read_verilog -library work mig/user_design/rtl/phy/phy_rddata_sync.v
read_verilog -library work mig/user_design/rtl/phy/phy_rdlvl.v
read_verilog -library work mig/user_design/rtl/phy/phy_read.v
read_verilog -library work mig/user_design/rtl/phy/phy_top.v
read_verilog -library work mig/user_design/rtl/phy/phy_write.v
read_verilog -library work mig/user_design/rtl/phy/phy_wrlvl.v
read_verilog -library work mig/user_design/rtl/phy/rd_bitslip.v
read_verilog -library work mig/user_design/rtl/phy/circ_buffer.v
read_verilog -library work mig/user_design/rtl/phy/phy_ck_iob.v
read_verilog -library work mig/user_design/rtl/phy/phy_clock_io.v
read_verilog -library work mig/user_design/rtl/phy/phy_control_io.v
read_verilog -library work mig/user_design/rtl/phy/phy_data_io.v
read_verilog -library work mig/user_design/rtl/phy/phy_dly_ctrl.v
read_verilog -library work mig/user_design/rtl/phy/phy_dm_iob.v
read_verilog -library work mig/user_design/rtl/phy/phy_dq_iob.v
read_verilog -library work mig/user_design/rtl/phy/phy_dqs_iob.v
read_verilog -library work mig/user_design/rtl/phy/phy_init.v
read_verilog -library work mig/user_design/rtl/phy/phy_pd.v
read_verilog -library work mig/user_design/rtl/phy/phy_pd_top.v
read_verilog -library work mig/user_design/rtl/phy/phy_rdclk_gen.v
read_verilog -library work mig/user_design/rtl/phy/phy_rdctrl_sync.v
read_verilog -library work mig/user_design/rtl/phy/phy_rddata_sync.v
read_verilog -library work mig/user_design/rtl/phy/phy_rdlvl.v
read_verilog -library work mig/user_design/rtl/phy/phy_read.v
read_verilog -library work mig/user_design/rtl/phy/phy_top.v
read_verilog -library work mig/user_design/rtl/phy/phy_write.v
read_verilog -library work mig/user_design/rtl/phy/phy_wrlvl.v
read_verilog -library work mig/user_design/rtl/phy/rd_bitslip.v
read_verilog -library work mig/user_design/rtl/ui/ui_cmd.v
read_verilog -library work mig/user_design/rtl/ui/ui_rd_data.v
read_verilog -library work mig/user_design/rtl/ui/ui_top.v
read_verilog -library work mig/user_design/rtl/ui/ui_wr_data.v
read_verilog -library work C:/Xilinx/14.4/ISE_DS/ISE/verilog/src/glbl.v
read_vhdl -library work ../../lib/gaisler/pcie/pcie.vhd
read_vhdl -library work ahb2mig_ml605.vhd
read_vhdl -library work config.vhd
read_vhdl -library work ahbrom.vhd
read_vhdl -library work svga2ch7301c.vhd
read_vhdl -library work gtxclk.vhd
read_vhdl -library work leon3mp.vhd
add_files -fileset sim_1 testbench.vhd
add_files -fileset sim_1 prom.srec ram.srec
# Read board specific constraints
read_ucf leon3mp_mig39.ucf
read_ucf mig/user_design/par/mig.ucf
set_property steps.xst.args.netlist_hierarchy as_optimized [get_runs synth_1]
set_property strategy TimingWithIOBPacking [get_runs synth_1]
