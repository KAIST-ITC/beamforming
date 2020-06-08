1. Open the Vivado Console and
`source top.tcl`. You may want to modify _top.tcl_ to increase the number of jobs 
in `launch_runs synth_1 -jobs 4` and `launch_runs impl_1 -to_step write_bitstream -jobs 4` to accelerate the compilation.
This script will create Vivado project _bf_rx_.
2. File->Export->Export Hardware
3. File->Launch SDK.
4. Use _./sdk_src/main.c_ as the main file of the Microblaze. You may need to adjust linker script's heap/stack size.
5. Build the system.
6. Click _Program FPGA_ icon. This specifies the bitstream and the ELF files that reside in BRAM memory.
7. Start the TX FPGA's Microblaze to send the 4 datastream. Start the RX FPGA's Microblaze to read the data.

Verified in Vivado ver. 2018.3.
