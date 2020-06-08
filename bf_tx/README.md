1. Open the Vivado Console and
`source top.tcl`.
You may want to modify top.tcl to increase the number of jobs
in `launch_runs synth_1 -jobs 4` and `launch_runs impl_1 -to_step write_bitstream -jobs 4` to accelerate the compilation.
This script will create Vivado project _bf_rx_.

2. Use _bram_init.mem_ file generated with _../sw_sim/mem_file_gen.py_ file to update the generated bitstream with `updatemem` command.

How to use `updatemem` command in Vivado console:

`updatemem -meminfo top_wrapper.mmi -data bram_init.mem -proc top_tx_i/microblaze_stuff/microblaze_0 -bit top_tx_wrapper.bit -out tx_bitstream_initialized.bit -force`

3. File->Export->Export Hardware
4. File->Launch SDK.
5. Use _./sdk_src/main.c_ as the main file of the Microblaze. You may need to adjust linker script's heap/stack size.
6. Build the system.
7. Click _Program FPGA_ icon. This specifies the bitstream and the ELF files that reside in BRAM memory.
8. Do the same for the RX system.
9. Start the TX FPGA's Microblaze to send the 4 datastream. Start the RX FPGA's Microblaze to read the data.

Verified in Vivado ver. 2018.3.
