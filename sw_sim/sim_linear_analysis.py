import random
import numpy as np
import logging
from cmath import sin, cos, exp, pi
from low_bit_converter import convertLowBit1, convertLowBit2, convertLowBit3, convertLowBit4, convertLowBit5, convertLowBit6, convertLowBit7
random.seed(42)  # deterministic random


logging.basicConfig(level=logging.INFO)
sizeDataStream = 1024

numDataStream = 4
cmplx_val_list = [-1.0 - 1.0j, -1.0 + 1.0j, 1.0 - 1.0j, 1.0 + 1.0j]

num_W = numDataStream
w_N = 8  # at the moment
w_RX_N = 16

# angles are all degrees
THETA_TX_0 = 5
THETA_TX_1 = 25
THETA_TX_2 = 45
THETA_TX_3 = 65
list_THETA = [THETA_TX_0, THETA_TX_1, THETA_TX_2, THETA_TX_3]


######################
## HELPER FUNCTIONS ##
######################

def convertLowBit(mat_output, bit, scale, list_mat_output_all):
    """ Returns a quantized version of mat_output
    """
    list_mat_output_all = list_mat_output_all + list(mat_output)
    downsized_mat_output = mat_output / scale
    # print("mat_output...")
    # print(mat_output)
    # print("downsized...")
    # print(downsized_mat_output)
    low_bit_mat_output = []
    if(bit == "infinite"):
        low_bit_mat_output = downsized_mat_output
    elif(bit == "1"):
        for downsized_val in downsized_mat_output:
            low_bit_val_real = convertLowBit1(downsized_val.real)
            low_bit_val_imag = convertLowBit1(downsized_val.imag)
            low_bit_mat_output = low_bit_mat_output + [complex(low_bit_val_real, low_bit_val_imag)]
    elif(bit == "2"):
        for downsized_val in downsized_mat_output:
            low_bit_val_real = convertLowBit2(downsized_val.real)
            low_bit_val_imag = convertLowBit2(downsized_val.imag)
            low_bit_mat_output = low_bit_mat_output + [complex(low_bit_val_real, low_bit_val_imag)]
    elif(bit == "3"):
        for downsized_val in downsized_mat_output:
            low_bit_val_real = convertLowBit3(downsized_val.real)
            low_bit_val_imag = convertLowBit3(downsized_val.imag)
            low_bit_mat_output = low_bit_mat_output + [complex(low_bit_val_real, low_bit_val_imag)]
    elif(bit == "4"):
        for downsized_val in downsized_mat_output:
            low_bit_val_real = convertLowBit4(downsized_val.real)
            low_bit_val_imag = convertLowBit4(downsized_val.imag)
            low_bit_mat_output = low_bit_mat_output + [complex(low_bit_val_real, low_bit_val_imag)]
    elif(bit == "5"):
        for downsized_val in downsized_mat_output:
            low_bit_val_real = convertLowBit5(downsized_val.real)
            low_bit_val_imag = convertLowBit5(downsized_val.imag)
            low_bit_mat_output = low_bit_mat_output + [complex(low_bit_val_real, low_bit_val_imag)]
    elif(bit == "6"):
        for downsized_val in downsized_mat_output:
            low_bit_val_real = convertLowBit6(downsized_val.real)
            low_bit_val_imag = convertLowBit6(downsized_val.imag)
            low_bit_mat_output = low_bit_mat_output + [complex(low_bit_val_real, low_bit_val_imag)]
    elif(bit == "7"):
        for downsized_val in downsized_mat_output:
            low_bit_val_real = convertLowBit7(downsized_val.real)
            low_bit_val_imag = convertLowBit7(downsized_val.imag)
            low_bit_mat_output = low_bit_mat_output + [complex(low_bit_val_real, low_bit_val_imag)]
    return low_bit_mat_output, list_mat_output_all


def calculateRange(cmplx_arr):
    """ Returns a max and min(either real or imag) from an array of complex number
    """
    list_max_min = np.array([cmplx_arr.real.max(), cmplx_arr.real.min(), cmplx_arr.imag.max(), cmplx_arr.imag.min()])
    return [list_max_min.max(), list_max_min.min()]


#############
## TX SIDE ##
#############

def generateListMatW(list_THETA, w_N, num_W):
    """ Returns a list of 1d matrix, [(1 x w_N), ... ,(1 x w_N)]
        Generate mat_w's
    """
    list_mat_w = []  # list of w matrix. Because mat_w is 1d list, list_mat_w is 2d list.
    for index_mat_w in range(num_W):
        mat_w = [0 for n in range(w_N)]  # initialize mat_w, linear beamforming

        for n in range(w_N):
            THETA = list_THETA[index_mat_w]
            mat_w[n] = exp(complex(0, - n * pi * sin(THETA * pi / 180)))
        mat_w = np.array(mat_w)
        # print(mat_w)
        list_mat_w = list_mat_w + [mat_w]
    return list_mat_w
# print(generateListMatW(list_THETA, w_N, num_W))
# generateListMatW(list_THETA, w_N, num_W)


def generateDataStream(numDataStream, sizeDataStream, cmplx_val_list):
    """ Returns a list of data stream, [(1 x sizeDataStream), ..., (1 x sizeDataStream)]
        Generate random data streams
    """
    list_data_stream = []  # list of data_streams (2d list)
    for j in range(numDataStream):
        data_stream = []  # data stream, 1d list, each elem is data
        for i in range(sizeDataStream):
            rand_index = random.randrange(0, len(cmplx_val_list))  # 0 or 1 or 2 or 3 in this case
            rand_val = cmplx_val_list[rand_index]  # one val from cmplx_val_list
            data_stream = data_stream + [rand_val]
            # print(rand_val)
            # print(type(rand_val))
            # print(rand_val.real)
            # print(rand_val.imag)
        list_data_stream = list_data_stream + [data_stream]
    # print(list_data_stream)
    # print(len(list_data_stream))
    # print(len(list_data_stream[0]))
    return list_data_stream
# print(generateDataStream(numDataStream, sizeDataStream, cmplx_val_list))
# print(generateDataStream(numDataStream, sizeDataStream, cmplx_val_list)[0])


def applyIFFT(list_data_stream):
    """ Returns a list of IFFT result, [(1 x sizeDataStream), ... , (1 x sizeDataStream)]
        Apply IFFT
    """
    list_IFFT_result = []  # list of the results after IFFT, 2d list
    for index_data_stream in range(len(list_data_stream)):
        data_stream = list_data_stream[index_data_stream]
        IFFT_result = np.fft.ifft(data_stream)
        # list_IFFT_result = list_IFFT_result + [7.95833333333 * IFFT_result]
        list_IFFT_result = list_IFFT_result + [IFFT_result]
    return list_IFFT_result
# 7.95833333333

# list_data_stream = generateDataStream(numDataStream, sizeDataStream, cmplx_val_list)
# list_IFFT_result = applyIFFT(list_data_stream)
# print(len(list_IFFT_result))
# print(len(list_IFFT_result[0]))
# print(list_IFFT_result[0])
# list_first_data_IFFT_result = [list_IFFT_result[0][1], list_IFFT_result[1][1], list_IFFT_result[2][1], list_IFFT_result[3][1]]
# print(list_first_data_IFFT_result)


def generateTXoutput(list_data, list_mat_w):
    """ Returns a list of 1d matrix, [(w_N x 1), ... , (w_N x 1)]
        list_data is list of data from each data stream at the given time. (DIFFERENT FROM DATASTREAM!)
        Before channel
    """
    num_W = len(list_mat_w)  # extract param
    w_N = len(list_mat_w[0])  # extract param
    list_mat_tx = []
    # print()
    # print("IFFT applied data at this time is... ", list_data)
    # mat_TX = [[0 for m in range(w_M)] for n in range(w_N)]
    for i in range(num_W):
        data = list_data[i]
        mat_w = list_mat_w[i]
        # print("start!!!----------------------------")
        # print(data)
        # print(mat_w)
        mat_tX = data * mat_w  # elem-wise multiplication
        list_mat_tx = list_mat_tx + [mat_tX]
    return list_mat_tx


def generateMatH(THETA, w_N, w_RX_N):
    """ Returns a list of 2d matrix, [(w_N x w_RX_N), ... , (w_N x w_RX_N)]
        Generate mat_H
    """
    mat_H = [[0 for i in range(w_N)] for j in range(w_RX_N)]  # initialize mat_H
    for i in range(w_N):
        for j in range(w_RX_N):
            mat_H[j][i] = exp(complex(0, (w_RX_N - 1 - j) * pi * sin(THETA * pi / 180))) * exp(complex(0, i * pi * sin(THETA * pi / 180)))
    return np.array(mat_H)


def applyChannel(list_mat_tx, list_THETA, w_RX_N, list_max_min, bit, scale, list_mat_output_all):
    """ Returns a 1d matrix, (w_RX_N x 1)
        Multiply channel matrix H and SUM THEM ALL (IMPORTANT)
    """
    num_W = len(list_mat_tx)  # extract param
    w_N = len(list_mat_tx[0])  # extract param
    list_post_channel_mat = []

    for i in range(num_W):
        THETA = list_THETA[i]
        mat_tx = list_mat_tx[i]
        mat_H = generateMatH(THETA, w_N, w_RX_N)
        list_flatten = np.array(mat_H).flatten()
        list_max_min = list_max_min + calculateRange(list_flatten)
        # print("check mat H")
        # print(mat_H)
        mat_post_H = np.matmul(mat_H, mat_tx)
        list_post_channel_mat = list_post_channel_mat + [mat_post_H]

    list_flatten = np.array(list_post_channel_mat).flatten()
    list_max_min = list_max_min + calculateRange(list_flatten)

    mat_output = [0 for j in range(w_RX_N)]
    # print("post channel matrix, before summing them up")
    # print(list_post_channel_mat)
    for mat_post_H in list_post_channel_mat:
        mat_output = mat_output + mat_post_H

    # print("original...")
    # print(mat_output)
    low_bit_mat_output, list_mat_output_all = convertLowBit(mat_output, bit, scale, list_mat_output_all)

    # print("quantized...")
    # print(low_bit_mat_output)
    return low_bit_mat_output, list_max_min, list_mat_output_all


# list_mat_w = generateListMatW(list_THETA, w_N, num_W)
# print("list_mat_w is...", list_mat_w)
# list_data_stream = generateDataStream(numDataStream, sizeDataStream, cmplx_val_list)
# # print(list_data_stream)
# list_IFFT_result = applyIFFT(list_data_stream)
# print(list_IFFT_result)
# for t in range(sizeDataStream):
#     list_data_IFFT_result = np.array(list_IFFT_result)[:, t]  # list of data at time t
#     # print(list_IFFT_result)
#     # print(list_data_IFFT_result)
#     print("At t=", str(t), "list_data_IFFT_result is ...", list_data_IFFT_result)

#     list_mat_tx = generateTXoutput(list_data_IFFT_result, list_mat_w)  # this is mat_TX at time t
#     print("At t=", str(t), "list_mat_tx is ...", list_mat_tx)

#     list_post_channel_mat = applyChannel(list_mat_tx, list_THETA, w_RX_N)
#     print()
#     print("At t=", str(t), "m list_post_channel_mat is ...", list_post_channel_mat)
#     if(t == 1):
#         break

# mat_H = np.array([[i + j for i in range(4)] for j in range(8)])
# mat_test = np.array([i for i in range(4)])
# mat_output = np.matmul(mat_H, mat_test)
# print(mat_output)
# mat_test_2 = np.array([1 for i in range(8)])
# print(mat_test_2.shape)
# print(mat_test_2.T.shape)
# mat_output = np.matmul(mat_output, mat_test_2.T)
# print(mat_output)

#############
## RX SIDE ##
#############


def receiveTXoutput(mat_post_channel, THETA_RX, list_max_min):
    """ Returns one complex value, the value received by the RX antenna at a given time
        mat_post_channel : (w_RX_N x 1)
    """
    w_RX_N = len(mat_post_channel)  # extract param
    mat_w_rx = [0 for n in range(w_RX_N)]  # initialize mat_w_rx
    for n in (range(w_RX_N)):
        mat_w_rx[n] = exp(complex(0, - (w_RX_N - 1 - n) * pi * sin(THETA_RX * pi / 180)))

    list_flatten = np.array(mat_w_rx).flatten()
    list_max_min = list_max_min + calculateRange(list_flatten)

    mat_w_rx = np.array(mat_w_rx)
    return np.matmul(mat_post_channel, mat_w_rx), list_max_min


def demod(data_stream_rx):
    """ Demodulate to (+-1, +-1i)
    """
    demod_data_stream_rx = []
    for data in data_stream_rx:
        data_r = data.real
        data_i = data.imag
        if(data_r > 0):
            new_r = 1
        else:
            new_r = -1
        if(data_i > 0):
            new_i = 1
        else:
            new_i = -1
        demod_data_stream_rx = demod_data_stream_rx + [complex(new_r, new_i)]
    return demod_data_stream_rx


def top(bit, scale, list_data_stream):
    """ The top module for the testing. 4 different datastreams are sent from the TX side.
        This function changes RX side's angle and checks whether it receives corresponding TX datastream.
    """
    logging.debug("TEST STARTS")
    logging.debug("Size of data stream: {}".format(sizeDataStream))
    logging.debug("Num of data stream: {}".format(numDataStream))
    logging.debug("TX antenna size: {}".format(w_N))
    logging.debug("RX antenna size: {}".format(w_RX_N))

    numTotalMismatches = 0
    for i in range(4):
        list_max_min = []
        logging.debug("Test {}".format(str(i)))
        list_mat_w = generateListMatW(list_THETA, w_N, num_W)
        list_flatten = np.array(list_mat_w).flatten()
        list_max_min = list_max_min + calculateRange(list_flatten)

        list_flatten = np.array(list_data_stream).flatten()
        list_max_min = list_max_min + calculateRange(list_flatten)
        # data_stream_0 = list_data_stream[0]
        # data_stream_1 = list_data_stream[1]
        # data_stream_2 = list_data_stream[2]
        # data_stream_3 = list_data_stream[3]
        # for j in range(1024):
        #     selected_data = data_stream_0[j]
        #     print("At " + str(j) + ", data is " + str(selected_data))

        # print("intput datastream_3: ", list_data_stream[3])
        # break

        THETA_RX = list_THETA[i]
        golden_data_stream = list_data_stream[i]  # RX is receiving the data sent from the frist TX antenna
        data_stream_rx_pre_fft = []
        list_mat_output_all = []  # stores all the mat_output from RX FPGA side

        list_IFFT_result = applyIFFT(list_data_stream)
        # print("IFFT result for datastream_0: ", list_IFFT_result[0])
        # print("IFFT result for datastream_1: ", list_IFFT_result[1])
        # print("IFFT result for datastream_2: ", list_IFFT_result[2])
        # print("IFFT result for datastream_3: ", list_IFFT_result[3])
        list_flatten = np.array(list_IFFT_result).flatten()
        list_max_min = list_max_min + calculateRange(list_flatten)

        for t in range(sizeDataStream):
            list_data_IFFT_result = np.array(list_IFFT_result)[:, t]  # list of data at time t
            # print(list_IFFT_result)
            # print(list_data_IFFT_result)
            # break
            # print(list_mat_w)
            list_mat_tx = generateTXoutput(list_data_IFFT_result, list_mat_w)  # this is mat_TX at time t
            # print("At t=", str(t), " ... after tx weight multiplication")
            # print(list_mat_tx)
            list_flatten = np.array(list_mat_tx).flatten()
            list_max_min = list_max_min + calculateRange(list_flatten)

        #     # Because mat_H is generated in side applyChannel() function, list_max_min should be an input and output argument
            mat_post_channel, list_max_min, list_mat_output_all = applyChannel(list_mat_tx, list_THETA, w_RX_N, list_max_min, bit, scale, list_mat_output_all)
            # break
            # print(mat_post_channel)
            list_flatten = np.array(mat_post_channel).flatten()
            list_max_min = list_max_min + calculateRange(list_flatten)
            # print("At t=", str(t), " ... after channel multiplication")
            # print(len(mat_post_channel))

            # mat_post_channel = mat_post_channel / 32
            # print("mat_post_channel is...")
            # print(mat_post_channel)
            # print(mat_post_channel / 8)
            # print(list_max_min)
            # break

            # Because mat_H is generated in side receiveTXoutput() function, list_max_min should be an input and output argument
            data_rx_pre_fft, list_max_min = receiveTXoutput(mat_post_channel, THETA_RX, list_max_min)
            list_flatten = np.array(data_rx_pre_fft).flatten()
            list_max_min = list_max_min + calculateRange(list_flatten)
            # print("At t=", str(t), " ... pre fft")
            # print(data_rx_pre_fft)

            data_stream_rx_pre_fft = data_stream_rx_pre_fft + [data_rx_pre_fft]
            # if(t == 2):
            #     break
        data_stream_rx = np.fft.fft(data_stream_rx_pre_fft)
        list_flatten = np.array(data_stream_rx).flatten()
        list_max_min = np.array(list_max_min + calculateRange(list_flatten))
        logging.debug("max val in this process: {}".format(list_max_min.max()))
        logging.debug("min val in this process: {}".format(list_max_min.min()))
        list_mat_output_all = np.array(list_mat_output_all)
        # print(list_mat_output_all)
        list_mat_output_all_real = list_mat_output_all.real
        list_mat_output_all_imag = list_mat_output_all.imag
        list_mat_output_all_power = abs(list_mat_output_all)
        r_max = max(list_mat_output_all_real)
        r_avg = np.mean(list_mat_output_all_real)
        r_min = min(list_mat_output_all_real)
        i_max = max(list_mat_output_all_imag)
        i_avg = np.mean(list_mat_output_all_imag)
        i_min = min(list_mat_output_all_imag)
        p_max = max(list_mat_output_all_power)
        p_avg = np.mean(list_mat_output_all_power)
        p_min = min(list_mat_output_all_power)

        logging.debug("real max: {}".format(r_max))
        logging.debug("real avg: {}".format(r_avg))
        logging.debug("real min: {}".format(r_min))
        logging.debug("imag max: {}".format(i_max))
        logging.debug("imag avg: {}".format(i_avg))
        logging.debug("imag min: {}".format(i_min))
        logging.debug("power max: {}".format(p_max))
        logging.debug("power avg: {}".format(p_avg))
        logging.debug("power min: {}".format(p_min))

        logging.debug("Received datastream is: {}".format(data_stream_rx))
        data_stream_rx = demod(data_stream_rx)
        data_stream_rx = np.array(data_stream_rx)
        golden_data_stream = np.array(golden_data_stream)
        logging.debug("Demodulated datastream is: {}".format(data_stream_rx))
        logging.debug("Golden datastream is: {}".format(golden_data_stream))
        mismatches = np.count_nonzero(data_stream_rx != golden_data_stream)
        # for i in range(len(data_stream_rx)):
        #     if(data_stream_rx[i] != golden_data_stream[i]):
        #         print(i)
        #         print(data_stream_rx[i])
        #         print(golden_data_stream[i])

        logging.debug("The number of mismatch: {}".format(mismatches))
        numTotalMismatches = numTotalMismatches + mismatches
        logging.debug("------------------------------------")
    # print("The number of total mismatches: ", numTotalMismatches)
    print(numTotalMismatches)
    # print("")


##################
## RUN THE CODE ##
##################

if __name__ == '__main__':
    # Note that the num of mismatches increases as the bit value decreases.
    # Use same data streams for all tests...
    list_data_stream = generateDataStream(numDataStream, sizeDataStream, cmplx_val_list)
    print("bit==1")
    for scale_val in np.arange(1.00, 4.00, 0.02):
        # print("scale value is: ", scale_val)
        top(bit="1", scale=scale_val, list_data_stream=list_data_stream)

    print("bit==2")
    for scale_val in np.arange(1.00, 4.00, 0.02):
        # print("scale value is: ", scale_val)
        top(bit="2", scale=scale_val, list_data_stream=list_data_stream)

    print("bit==3")
    for scale_val in np.arange(1.00, 4.00, 0.02):
        # print("scale value is: ", scale_val)
        top(bit="3", scale=scale_val, list_data_stream=list_data_stream)

    # print("bit==4")
    # for scale_val in np.arange(1.00, 2.50, 0.01):
    #     print("scale value is: ", scale_val)
    #     top(bit="4", scale=scale_val, list_data_stream=list_data_stream)
