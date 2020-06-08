

import numpy as np
# import random

# arr = np.random.random(1000) + np.random.random(1000) * 1j
# maxreal = arr.real.max()  # maximum real part
# maximag = arr.imag.max()  # maximum imaginary part
# print(arr.real)
# print(maximag)


w_RX_N = 16
# THETA_RX = 5
from cmath import sin, cos, exp, pi
from fixed_point_converter import convert2Fixed16_15
w_N = 8  # at the moment
# THETA_TX_0 = 5
# THETA_TX_1 = 25
# THETA_TX_2 = 45
# THETA_TX_3 = 65
# list_THETA = [THETA_TX_0, THETA_TX_1, THETA_TX_2, THETA_TX_3]

# mat_w = [0 for n in range(w_N)]  # initialize mat_w, linear beamforming
# mat_w_fixed_point_imag = [0 for n in range(w_N)]  # initialize mat_w, linear beamforming
# mat_w_fixed_point_real = [0 for n in range(w_N)]  # initialize mat_w, linear beamforming
# for n in range(w_N):
#     THETA = list_THETA[0]
#     val = exp(complex(0, - n * pi * sin(THETA * pi / 180)))
#     mat_w[n] = val
#     mat_w_fixed_point_imag[n] = convert2Fixed16_15(val.imag)
#     mat_w_fixed_point_real[n] = convert2Fixed16_15(val.real)

# print(mat_w)
# print(mat_w_fixed_point_imag)
# print(mat_w_fixed_point_real)

# print(convert2Fixed16_15(0.09326172)) # real
# print(convert2Fixed16_15(0.10880534)) # imag

# val_0 = complex(0.09326172, 0.10880534)
# val_1 = complex(0.96274824, -0.27039938)
# print(val_0 * val_1)


# THETA = 65
# mat_H = [[0 for i in range(w_N)] for j in range(w_RX_N)]  # initialize mat_H
# mat_H_fixed_point = [[0 for i in range(w_N)] for j in range(w_RX_N)]  # initialize mat_H

# mat_H_fixed_point_imag = [[0 for i in range(w_N)] for j in range(w_RX_N)]  # initialize mat_H
# mat_H_fixed_point_real = [[0 for i in range(w_N)] for j in range(w_RX_N)]  # initialize mat_H
# for i in range(w_N):
#     for j in range(w_RX_N):
#         val = exp(complex(0, (w_RX_N - 1 - j) * pi * sin(THETA * pi / 180))) * exp(complex(0, i * pi * sin(THETA * pi / 180)))
#         mat_H[j][i] = val
#         mat_H_fixed_point[j][i] = convert2Fixed16_15(val.imag) + convert2Fixed16_15(val.real)
#         mat_H_fixed_point_imag[j][i] = convert2Fixed16_15(val.imag)
#         mat_H_fixed_point_real[j][i] = convert2Fixed16_15(val.real)

# print(mat_H)
# print(mat_H_fixed_point)


# for row in range(16):
#     head_string = "            6'b11" + '{0:04b}'.format(row)
#     print(head_string, end="")
#     print(": mat_H_row <= 256'h", end="")
#     for count, elem in enumerate(mat_H_fixed_point[row]):
#         if(count < 7):
#             print(elem, end="_")
#         else:
#             print(elem, end=";")
#             print()
# print(len(mat_H))
# print(len(mat_H[0]))

# for i in range(4):
#     print("wire [255:0] ", end="")
#     for j in range(16):
#         if(j < 15):
#             print("mat_H_row_" + str(i) + "_" + str(j) + ", ", end="")
#         else:
#             print("mat_H_row_" + str(i) + "_" + str(j) + ";")


# for i in range(4):
#     print("wire signed [50:0] ",end="")
#     for j in range(16):
#         if(j < 15):
#             print("post_H_" + str(i) + "_" + str(j) + "_imag, ", end="")
#         else:
#             print("post_H_" + str(i) + "_" + str(j) + "_imag;")
# print()

# for i in range(4):
#     print("wire signed [50:0] ",end="")
#     for j in range(16):
#         if(j < 15):
#             print("post_H_" + str(i) + "_" + str(j) + "_real, ", end="")
#         else:
#             print("post_H_" + str(i) + "_" + str(j) + "_real;")
# print()


# for i in range(4):
#     print("wire signed [50:0] ",end="")
#     for j in range(16):
#         if(j < 15):
#             print("post_H_" + str(i) + "_" + str(j) + ", ", end="")
#         else:
#             print("post_H_" + str(i) + "_" + str(j) + ";")
# print()

# for i in range(4):
#     for j in range(16):
#         print("    computeH ch_" + str(i) + "_" + str(j) + "(.clk(clk), .reset(reset), .mat_H_row(mat_H_row_" + str(i) + "_" + str(j) + "), .w_tx_out(w_tx_out_" + str(i) + "), .post_H(post_H_" + str(i) + "_" + str(j) + "));")
#     print()

# print("wire [103:0] ", end="")
# for j in range(16):
#     if(j < 15):
#         print("post_H_sum_" + str(j) + ", ", end="")
#     else:
#         print("post_H_sum_" + str(j) + ";")

# for i in range(4):
#     for j in range(16):
#         print("assign {post_H_" + str(i) + "_" + str(j) + "_imag, " + "post_H_" + str(i) + "_" + str(j) + "_real} = " + "post_H_" + str(i) + "_" + str(j) + ";")

# for j in range(16):
#     print("assign post_H_sum_" + str(j) + " = {", end="")
#     for i in range(4):
#         if(i < 3):
#             print("post_H_" + str(i) + "_" + str(j) + "_imag + ", end="")
#         else:
#             print("post_H_" + str(i) + "_" + str(j) + "_imag, ", end="")
#     for i in range(4):
#         if(i < 3):
#             print("post_H_" + str(i) + "_" + str(j) + "_real + ", end="")
#         else:
#             print("post_H_" + str(i) + "_" + str(j) + "_real};")


#         val = exp(complex(0, (w_RX_N - 1 - j) * pi * sin(THETA * pi / 180))) * exp(complex(0, i * pi * sin(THETA * pi / 180)))
#         mat_H[j][i] = val
#         mat_H_fixed_point[j][i] = convert2Fixed16_15(val.imag) + convert2Fixed16_15(val.real)

THETA_RX = 25
mat_w_rx = [0 for n in range(w_RX_N)]  # initialize mat_w_rx
mat_w_rx_imag = [0 for n in range(w_RX_N)]  # initialize mat_w_rx
mat_w_rx_real = [0 for n in range(w_RX_N)]  # initialize mat_w_rx
for n in (range(w_RX_N)):
    val = exp(complex(0, - (w_RX_N - 1 - n) * pi * sin(THETA_RX * pi / 180)))
    mat_w_rx[n] = val
    mat_w_rx_imag[n] = convert2Fixed16_15(val.imag)
    mat_w_rx_real[n] = convert2Fixed16_15(val.real)

mat_w_rx = np.array(mat_w_rx)

print("{16'h" + mat_w_rx_imag[0] + ", 16'h" + mat_w_rx_imag[1] + ", 16'h" + mat_w_rx_imag[2] + ", 16'h" + mat_w_rx_imag[3] + ", 16'h" + mat_w_rx_imag[4] + ", 16'h" + mat_w_rx_imag[5] + ", 16'h" + mat_w_rx_imag[6] + ", 16'h" + mat_w_rx_imag[7] + ", 16'h" + mat_w_rx_imag[8] + ", 16'h" + mat_w_rx_imag[9] + ", 16'h" + mat_w_rx_imag[10] + ", 16'h" + mat_w_rx_imag[11] + ", 16'h" + mat_w_rx_imag[12] + ", 16'h" + mat_w_rx_imag[13] + ", 16'h" + mat_w_rx_imag[14] + ", 16'h" + mat_w_rx_imag[15] + "}")
print("{16'h" + mat_w_rx_real[0] + ", 16'h" + mat_w_rx_real[1] + ", 16'h" + mat_w_rx_real[2] + ", 16'h" + mat_w_rx_real[3] + ", 16'h" + mat_w_rx_real[4] + ", 16'h" + mat_w_rx_real[5] + ", 16'h" + mat_w_rx_real[6] + ", 16'h" + mat_w_rx_real[7] + ", 16'h" + mat_w_rx_real[8] + ", 16'h" + mat_w_rx_real[9] + ", 16'h" + mat_w_rx_real[10] + ", 16'h" + mat_w_rx_real[11] + ", 16'h" + mat_w_rx_real[12] + ", 16'h" + mat_w_rx_real[13] + ", 16'h" + mat_w_rx_real[14] + ", 16'h" + mat_w_rx_real[15] + "}")

print(mat_w_rx)
print(mat_w_rx_imag)
print(mat_w_rx_real)
