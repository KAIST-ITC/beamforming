def main():
    """ It turns out that .coe file can't initialize BRAMs when they are controlled by BRAM controller.
        This file was initially created to create a C code that runs on MicroBlaze and initializes BRAMs of the system.
        Then, it turns out that the code size gets too big, and I finally switched to generate .mem file to
        initialize BRAM.
        Use init.mem file in Xilinx Vivado console after bitstream generation.
    """
    file_name = 'data_stream_0.coe'
    counter = 0
    addr = 0
    with open(file_name, 'r') as coe_file:
        for line in coe_file:
            if(counter > 1):
                data_0 = line[0:2]
                data_1 = line[2:4]
                data_2 = line[4:6]
                data_3 = line[6:8]
                addr_header = "@C000"
                addr_str = addr_header + '{0:04x}'.format(addr)
                # if(addr > 0):
                #     printString = "Xil_Out32(XPAR_BRAM_0_BASEADDR" + "+" + str(addr) + ", 0x" + str(data) + ");"
                # else:
                #     printString = "Xil_Out32(XPAR_BRAM_0_BASEADDR" + ", 0x" + str(data) + ");"
                memStr = addr_str + " " + data_3 + " " + data_2 + " " + data_1 + " " + data_0
                print(memStr)
                addr = addr + 4
            counter = counter + 1

    print()

    file_name = 'data_stream_1.coe'
    counter = 0
    addr = 0
    with open(file_name, 'r') as coe_file:
        for line in coe_file:
            if(counter > 1):
                data_0 = line[0:2]
                data_1 = line[2:4]
                data_2 = line[4:6]
                data_3 = line[6:8]
                addr_header = "@C200"
                addr_str = addr_header + '{0:04x}'.format(addr)
                # if(addr > 0):
                #     printString = "Xil_Out32(XPAR_BRAM_0_BASEADDR" + "+" + str(addr) + ", 0x" + str(data) + ");"
                # else:
                #     printString = "Xil_Out32(XPAR_BRAM_0_BASEADDR" + ", 0x" + str(data) + ");"
                memStr = addr_str + " " + data_3 + " " + data_2 + " " + data_1 + " " + data_0
                print(memStr)
                addr = addr + 4
            counter = counter + 1

    print()

    file_name = 'data_stream_2.coe'
    counter = 0
    addr = 0
    with open(file_name, 'r') as coe_file:
        for line in coe_file:
            if(counter > 1):
                data_0 = line[0:2]
                data_1 = line[2:4]
                data_2 = line[4:6]
                data_3 = line[6:8]
                addr_header = "@C400"
                addr_str = addr_header + '{0:04x}'.format(addr)
                # if(addr > 0):
                #     printString = "Xil_Out32(XPAR_BRAM_0_BASEADDR" + "+" + str(addr) + ", 0x" + str(data) + ");"
                # else:
                #     printString = "Xil_Out32(XPAR_BRAM_0_BASEADDR" + ", 0x" + str(data) + ");"
                memStr = addr_str + " " + data_3 + " " + data_2 + " " + data_1 + " " + data_0
                print(memStr)
                addr = addr + 4
            counter = counter + 1

    print()

    file_name = 'data_stream_3.coe'
    counter = 0
    addr = 0
    with open(file_name, 'r') as coe_file:
        for line in coe_file:
            if(counter > 1):
                data_0 = line[0:2]
                data_1 = line[2:4]
                data_2 = line[4:6]
                data_3 = line[6:8]
                addr_header = "@C600"
                addr_str = addr_header + '{0:04x}'.format(addr)
                # if(addr > 0):
                #     printString = "Xil_Out32(XPAR_BRAM_0_BASEADDR" + "+" + str(addr) + ", 0x" + str(data) + ");"
                # else:
                #     printString = "Xil_Out32(XPAR_BRAM_0_BASEADDR" + ", 0x" + str(data) + ");"
                memStr = addr_str + " " + data_3 + " " + data_2 + " " + data_1 + " " + data_0
                print(memStr)
                addr = addr + 4
            counter = counter + 1


if __name__ == '__main__':
    main()
