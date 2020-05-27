
# PlanAhead Launch Script for Post PAR Floorplanning, created by Project Navigator

create_project -name leon3mp -dir "C:/cygwin64/home/grlib-asistmmu-aes/designs/leon3-xilinx-ml50x/planAhead_run_2" -part xc5vlx110tff1136-1
set srcset [get_property srcset [current_run -impl]]
set_property design_mode GateLvl $srcset
set_property edif_top_file "C:/cygwin64/home/grlib-asistmmu-aes/designs/leon3-xilinx-ml50x/leon3mp.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {C:/cygwin64/home/grlib-asistmmu-aes/designs/leon3-xilinx-ml50x} {../../netlists/xilinx/Virtex5} }
set_property target_constrs_file "C:/cygwin64/home/grlib-asistmmu-aes/designs/leon3-xilinx-ml50x/leon3mp.ucf" [current_fileset -constrset]
add_files [list {leon3mp.ucf}] -fileset [get_property constrset [current_run]]
add_files [list {ddr2spa.ucf}] -fileset [get_property constrset [current_run]]
add_files [list {svga.ucf}] -fileset [get_property constrset [current_run]]
link_design
read_xdl -file "C:/cygwin64/home/grlib-asistmmu-aes/designs/leon3-xilinx-ml50x/leon3mp.ncd"
if {[catch {read_twx -name results_1 -file "C:/cygwin64/home/grlib-asistmmu-aes/designs/leon3-xilinx-ml50x/leon3mp.twx"} eInfo]} {
   puts "WARNING: there was a problem importing \"C:/cygwin64/home/grlib-asistmmu-aes/designs/leon3-xilinx-ml50x/leon3mp.twx\": $eInfo"
}
