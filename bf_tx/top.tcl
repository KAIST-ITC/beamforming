set outputDir ./bf_tx
file mkdir $outputDir
create_project bf_tx ./bf_tx -part xc7vx485tffg1761-2 -force
set board xilinx.com:vc707:part0:1.4
set_property board_part $board [current_project]
set ip_repo_dir ./ip_repo
set_property  ip_repo_paths $ip_repo_dir [current_project]

update_ip_catalog

add_files -norecurse ./src/applyH.v
add_files -norecurse ./src/w_tx.v

source ./top_design.tcl

make_wrapper -files [get_files ./bf_tx/bf_tx.srcs/sources_1/bd/top_tx/top_tx.bd] -top
add_files -norecurse ./bf_tx/bf_tx.srcs/sources_1/bd/top_tx/hdl/top_tx_wrapper.v
update_compile_order -fileset sources_1

set_property top top_tx_wrapper [current_fileset]
update_compile_order -fileset sources_1

read_xdc ./src/pins.xdc
launch_runs synth_1 -jobs 4

launch_runs impl_1 -to_step write_bitstream -jobs 4
