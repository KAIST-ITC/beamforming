import numpy as np
import random
random.seed(42)  # deterministic random


def convert2Fixed16_15(float_val):
    """ Two's complement converter that takes float value like -0.987 and outputs it in
        fixed16_15 form(1 sign bit, 15 fractional bits)
        Assumes the float value ranges from -1.0 to 1.0
    """
    if(float_val == 1.0):
        fixed16_15 = '7fff'
    elif(0 < float_val and float_val < 1.0):  # positive
        sign_bit = '0'
        frac_bit_shifted = abs(int(round(float_val * 2**(15))))  # left-shift fractional part and round to an int
        frac_bit = ('{0:04x}'.format(frac_bit_shifted))  # cast this to hex values, e.g.: 1777, this is enough because 16th bit is zero anyway
        fixed16_15 = frac_bit
    elif(0 == float_val):  # zero
        fixed16_15 = '0000'
    elif(-1 < float_val and float_val < 0):  # negative
        sign_bit = '1'
        frac_bit_shifted = abs(int(round(float_val * 2**(15))))  # left-shift fractional part and remove sign
        # print(frac_bit_shifted)
        mask = int('111111111111111', 2)  # 15 1's
        frac_bit_masked = (mask ^ frac_bit_shifted) + 1
        frac_bit = ('{0:015b}'.format(frac_bit_masked))  # cast this to 15bits of binary
        output_b = sign_bit + frac_bit  # 16bits of binary
        output_d = int(output_b, 2)
        fixed16_15 = '{0:04x}'.format(output_d)
    elif(float_val == -1.0):  # negative
        fixed16_15 = '8000'
    else:
        print("dont get here")
    return fixed16_15


def convert2Fixed19_15(float_val):
    """ Two's complement converter that takes float value like -0.987 and outputs it in
        fixed19_15 form(1 sign bit, 3 int bit, 15 fractional bits)
        Assumes the float value ranges from -8.0 to 8.0
    """
    if(float_val == 8.0):
        fixed19_15 = '3ffff'

    elif(0 < float_val and float_val < 8.0):  # positive
        sign_bit = '0'
        frac_bit_shifted = abs(int(round(float_val * 2**(15))))  # left-shift fractional part and round to an int
        frac_bit = ('{0:05x}'.format(frac_bit_shifted))  # cast this to hex values, e.g.: 1ffff
        fixed19_15 = frac_bit
    elif(0 == float_val):  # zero
        fixed19_15 = '00000'
    elif(-8.0 < float_val and float_val < 0):  # negative
        sign_bit = '1'
        frac_bit_shifted = abs(int(round(float_val * 2**(15))))  # left-shift fractional part
        mask = int('111111111111111111', 2)  # 18 1's
        frac_bit_masked = (mask ^ frac_bit_shifted) + 1
        frac_bit = ('{0:018b}'.format(frac_bit_masked))  # cast this to 18bits of binary
        output_b = sign_bit + frac_bit  # 19bits of binary
        output_d = int(output_b, 2)
        fixed19_15 = '{0:05x}'.format(output_d)
    elif(float_val == -8.0):  # negative
        fixed19_15 = '40000'
    else:
        print("dont get here")
    return fixed19_15
