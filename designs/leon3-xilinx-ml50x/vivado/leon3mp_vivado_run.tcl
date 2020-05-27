synth_design -rtl -name rtl_1
set_property flow {Vivado Synthesis 2012} [get_runs synth_1]
set_property strategy {Vivado Synthesis Defaults} [get_runs synth_1]
launch_runs synth_1
wait_on_run -timeout 360 synth_1
get_ips
# Launch place and route
set_property strategy {Vivado Implementation Defaults} [get_runs impl_1]
set_property steps.write_bitstream.args.mask_file true [get_runs impl_1]
set_msg_config -suppress -id {Drc 23-20}
launch_runs impl_1 -to_step write_bitstream
wait_on_run -timeout 360 impl_1
#report_timing_summary -delay_type min_max -path_type full_clock_expanded -report_unconstrained -check_timing_verbose -max_paths 10 -nworst 1 -significant_digits 3 -input_pins -name timing_1 -file ./vivado/leon3mp_post_timing.rpt
#report_drc -file leon3mp_drc_route.rpt
