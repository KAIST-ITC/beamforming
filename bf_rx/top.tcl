set outputDir ./bf_rx
file mkdir $outputDir
create_project bf_rx ./bf_rx -part xc7vx485tffg1761-2 -force
set board xilinx.com:vc707:part0:1.4
set_property board_part $board [current_project]
update_ip_catalog

add_files -norecurse ./src/post_fft_bram_controller.v
add_files -norecurse ./src/w_rx.v
add_files -norecurse ./src/fifo_rx_controller.v

source ./top_design.tcl

make_wrapper -files [get_files ./bf_rx/bf_rx.srcs/sources_1/bd/top_rx/top_rx.bd] -top
add_files -norecurse ./bf_rx/bf_rx.srcs/sources_1/bd/top_rx/hdl/top_rx_wrapper.v
update_compile_order -fileset sources_1

set_property top top_rx_wrapper [current_fileset]
update_compile_order -fileset sources_1

read_xdc ./src/pins.xdc
launch_runs synth_1 -jobs 4

launch_runs impl_1 -to_step write_bitstream -jobs 4
