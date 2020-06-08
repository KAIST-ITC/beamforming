from sim_linear import generateDataStream
from fixed_point_converter import convert2Fixed16_15


def main():
    """ It generates 4 data stream in fixed point and saves them in .coe file format which
        can initialize Xilinx Vivado BRAM.
    """
    sizeDataStream = 1024
    numDataStream = 4
    cmplx_val_list = [-1.0 - 1.0j, -1.0 + 1.0j, 1.0 - 1.0j, 1.0 + 1.0j]
    index_data_stream = 0

    list_data_stream = generateDataStream(numDataStream, sizeDataStream, cmplx_val_list)

    print(list_data_stream[index_data_stream])

    list_data_stream_fp = []
    for data_stream in list_data_stream:
        data_stream_fp = []
        for cmplx_elem in data_stream:
            data_stream_fp = data_stream_fp + [convert2Fixed16_15(cmplx_elem.imag) + convert2Fixed16_15(cmplx_elem.real)]
        list_data_stream_fp = list_data_stream_fp + [data_stream_fp]
    # print(list_data_stream_fp)
    # print(len(list_data_stream_fp))
    # print(len(list_data_stream_fp[0]))

    file_name = 'data_stream_' + str(index_data_stream) + '.coe'
    with open(file_name, 'w') as coe_file:
        coe_file.write('memory_initialization_radix=16;' + '\n')
        coe_file.write('memory_initialization_vector=' + '\n')
        data_stream = list_data_stream_fp[index_data_stream]
        for index, cmplx_elem_fp in enumerate(data_stream):
            if(index < len(data_stream) - 1):
                coe_file.write(cmplx_elem_fp + ',' + '\n')
            else:
                coe_file.write(cmplx_elem_fp + ';')

    print("done!")


if __name__ == '__main__':
    main()
