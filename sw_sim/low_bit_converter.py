def convertLowBit1(downsized_val):
    """ Converts given value to 1 bit value
    """
    if(downsized_val < 0):
        return -1
    else:
        return 0


def convertLowBit2(downsized_val):
    """ Converts given value to 2 bit value
    """
    if(downsized_val < -0.75):
        return -1
    elif(-0.75 <= downsized_val < -0.25):
        return -0.5
    elif(-0.25 <= downsized_val < 0.25):
        return 0.0
    else:
        return 0.5


def convertLowBit3(downsized_val):
    """ Converts given value to 3 bit value
    """
    if(downsized_val < -0.875):
        return -1
    elif(-0.875 <= downsized_val < -0.625):
        return -0.75
    elif(-0.625 <= downsized_val < -0.375):
        return -0.5
    elif(-0.375 <= downsized_val < -0.125):
        return -0.25
    elif(-0.125 <= downsized_val < 0.125):
        return 0.0
    elif(0.125 <= downsized_val < 0.375):
        return 0.25
    elif(0.375 <= downsized_val < 0.625):
        return 0.5
    else:
        return 0.75


def convertLowBit4(downsized_val):
    """ Converts given value to 4 bit value
    """
    if(downsized_val < -0.9375):
        return -1
    elif(-0.9375 <= downsized_val < -0.8125):
        return -0.875
    elif(-0.8125 <= downsized_val < -0.6875):
        return -0.75
    elif(-0.6875 <= downsized_val < -0.5625):
        return -0.625
    elif(-0.5625 <= downsized_val < -0.4375):
        return -0.5
    elif(-0.4375 <= downsized_val < -0.3125):
        return -0.375
    elif(-0.3125 <= downsized_val < -0.1875):
        return -0.25
    elif(-0.1875 <= downsized_val < -0.0625):
        return -0.125
    elif(-0.0625 <= downsized_val < 0.0625):
        return 0.0
    elif(0.0625 <= downsized_val < 0.1875):
        return 0.125
    elif(0.1875 <= downsized_val < 0.3125):
        return 0.25
    elif(0.3125 <= downsized_val < 0.4375):
        return 0.375
    elif(0.4375 <= downsized_val < 0.5625):
        return 0.5
    elif(0.5625 <= downsized_val < 0.6875):
        return 0.625
    elif(0.6875 <= downsized_val < 0.8125):
        return 0.75
    else:
        return 0.875


def convertLowBit5(downsized_val):
    """ Converts given value to 5 bit value
    """
    if(downsized_val < -0.96875):
        return -1
    elif(-0.96875 <= downsized_val < -0.90625):
        return -0.9375
    elif(-0.90625 <= downsized_val < -0.84375):
        return -0.875
    elif(-0.84375 <= downsized_val < -0.78125):
        return -0.8125
    elif(-0.78125 <= downsized_val < -0.71875):
        return -0.75
    elif(-0.71875 <= downsized_val < -0.65625):
        return -0.6875
    elif(-0.65625 <= downsized_val < -0.59375):
        return -0.625
    elif(-0.59375 <= downsized_val < -0.53125):
        return -0.5625
    elif(-0.53125 <= downsized_val < -0.46875):
        return -0.5
    elif(-0.46875 <= downsized_val < -0.40625):
        return -0.4375
    elif(-0.40625 <= downsized_val < -0.34375):
        return -0.375
    elif(-0.34375 <= downsized_val < -0.28125):
        return -0.3125
    elif(-0.28125 <= downsized_val < -0.21875):
        return -0.25
    elif(-0.21875 <= downsized_val < -0.15625):
        return -0.1875
    elif(-0.15625 <= downsized_val < -0.09375):
        return -0.125
    elif(-0.09375 <= downsized_val < -0.03125):
        return -0.0625
    elif(-0.03125 <= downsized_val < 0.03125):
        return 0.0
    elif(0.03125 <= downsized_val < 0.09375):
        return 0.0625
    elif(0.09375 <= downsized_val < 0.15625):
        return 0.125
    elif(0.15625 <= downsized_val < 0.21875):
        return 0.1875
    elif(0.21875 <= downsized_val < 0.28125):
        return 0.25
    elif(0.28125 <= downsized_val < 0.34375):
        return 0.3125
    elif(0.34375 <= downsized_val < 0.40625):
        return 0.375
    elif(0.40625 <= downsized_val < 0.46875):
        return 0.4375
    elif(0.46875 <= downsized_val < 0.53125):
        return 0.5
    elif(0.53125 <= downsized_val < 0.59375):
        return 0.5625
    elif(0.59375 <= downsized_val < 0.65625):
        return 0.625
    elif(0.65625 <= downsized_val < 0.71875):
        return 0.6875
    elif(0.71875 <= downsized_val < 0.78125):
        return 0.75
    elif(0.78125 <= downsized_val < 0.84375):
        return 0.8125
    elif(0.84375 <= downsized_val < 0.90625):
        return 0.875
    else:
        return 0.9375


def convertLowBit6(downsized_val):
    """ Converts given value to 6 bit value
    """
    if(downsized_val < -0.984375):
        return -1
    elif(-0.984375 <= downsized_val < -0.953125):
        return -0.96875
    elif(-0.953125 <= downsized_val < -0.921875):
        return -0.9375
    elif(-0.921875 <= downsized_val < -0.890625):
        return -0.90625
    elif(-0.890625 <= downsized_val < -0.859375):
        return -0.875
    elif(-0.859375 <= downsized_val < -0.828125):
        return -0.84375
    elif(-0.828125 <= downsized_val < -0.796875):
        return -0.8125
    elif(-0.796875 <= downsized_val < -0.765625):
        return -0.78125
    elif(-0.765625 <= downsized_val < -0.734375):
        return -0.75
    elif(-0.734375 <= downsized_val < -0.703125):
        return -0.71875
    elif(-0.703125 <= downsized_val < -0.671875):
        return -0.6875
    elif(-0.671875 <= downsized_val < -0.640625):
        return -0.65625
    elif(-0.640625 <= downsized_val < -0.609375):
        return -0.625
    elif(-0.609375 <= downsized_val < -0.578125):
        return -0.59375
    elif(-0.578125 <= downsized_val < -0.546875):
        return -0.5625
    elif(-0.546875 <= downsized_val < -0.515625):
        return -0.53125
    elif(-0.515625 <= downsized_val < -0.484375):
        return -0.5
    elif(-0.484375 <= downsized_val < -0.453125):
        return -0.46875
    elif(-0.453125 <= downsized_val < -0.421875):
        return -0.4375
    elif(-0.421875 <= downsized_val < -0.390625):
        return -0.40625
    elif(-0.390625 <= downsized_val < -0.359375):
        return -0.375
    elif(-0.359375 <= downsized_val < -0.328125):
        return -0.34375
    elif(-0.328125 <= downsized_val < -0.296875):
        return -0.3125
    elif(-0.296875 <= downsized_val < -0.265625):
        return -0.28125
    elif(-0.265625 <= downsized_val < -0.234375):
        return -0.25
    elif(-0.234375 <= downsized_val < -0.203125):
        return -0.21875
    elif(-0.203125 <= downsized_val < -0.171875):
        return -0.1875
    elif(-0.171875 <= downsized_val < -0.140625):
        return -0.15625
    elif(-0.140625 <= downsized_val < -0.109375):
        return -0.125
    elif(-0.109375 <= downsized_val < -0.078125):
        return -0.09375
    elif(-0.078125 <= downsized_val < -0.046875):
        return -0.0625
    elif(-0.046875 <= downsized_val < -0.015625):
        return -0.03125
    elif(-0.015625 <= downsized_val < 0.015625):
        return 0.0
    elif(0.015625 <= downsized_val < 0.046875):
        return 0.03125
    elif(0.046875 <= downsized_val < 0.078125):
        return 0.0625
    elif(0.078125 <= downsized_val < 0.109375):
        return 0.09375
    elif(0.109375 <= downsized_val < 0.140625):
        return 0.125
    elif(0.140625 <= downsized_val < 0.171875):
        return 0.15625
    elif(0.171875 <= downsized_val < 0.203125):
        return 0.1875
    elif(0.203125 <= downsized_val < 0.234375):
        return 0.21875
    elif(0.234375 <= downsized_val < 0.265625):
        return 0.25
    elif(0.265625 <= downsized_val < 0.296875):
        return 0.28125
    elif(0.296875 <= downsized_val < 0.328125):
        return 0.3125
    elif(0.328125 <= downsized_val < 0.359375):
        return 0.34375
    elif(0.359375 <= downsized_val < 0.390625):
        return 0.375
    elif(0.390625 <= downsized_val < 0.421875):
        return 0.40625
    elif(0.421875 <= downsized_val < 0.453125):
        return 0.4375
    elif(0.453125 <= downsized_val < 0.484375):
        return 0.46875
    elif(0.484375 <= downsized_val < 0.515625):
        return 0.5
    elif(0.515625 <= downsized_val < 0.546875):
        return 0.53125
    elif(0.546875 <= downsized_val < 0.578125):
        return 0.5625
    elif(0.578125 <= downsized_val < 0.609375):
        return 0.59375
    elif(0.609375 <= downsized_val < 0.640625):
        return 0.625
    elif(0.640625 <= downsized_val < 0.671875):
        return 0.65625
    elif(0.671875 <= downsized_val < 0.703125):
        return 0.6875
    elif(0.703125 <= downsized_val < 0.734375):
        return 0.71875
    elif(0.734375 <= downsized_val < 0.765625):
        return 0.75
    elif(0.765625 <= downsized_val < 0.796875):
        return 0.78125
    elif(0.796875 <= downsized_val < 0.828125):
        return 0.8125
    elif(0.828125 <= downsized_val < 0.859375):
        return 0.84375
    elif(0.859375 <= downsized_val < 0.890625):
        return 0.875
    elif(0.890625 <= downsized_val < 0.921875):
        return 0.90625
    elif(0.921875 <= downsized_val < 0.953125):
        return 0.9375
    else:
        return 0.96875


def convertLowBit7(downsized_val):
    """ Converts given value to 7 bit value
    """
    if(downsized_val < -0.9921875):
        return -1
    elif(-0.9921875 <= downsized_val < -0.9765625):
        return -0.984375
    elif(-0.9765625 <= downsized_val < -0.9609375):
        return -0.96875
    elif(-0.9609375 <= downsized_val < -0.9453125):
        return -0.953125
    elif(-0.9453125 <= downsized_val < -0.9296875):
        return -0.9375
    elif(-0.9296875 <= downsized_val < -0.9140625):
        return -0.921875
    elif(-0.9140625 <= downsized_val < -0.8984375):
        return -0.90625
    elif(-0.8984375 <= downsized_val < -0.8828125):
        return -0.890625
    elif(-0.8828125 <= downsized_val < -0.8671875):
        return -0.875
    elif(-0.8671875 <= downsized_val < -0.8515625):
        return -0.859375
    elif(-0.8515625 <= downsized_val < -0.8359375):
        return -0.84375
    elif(-0.8359375 <= downsized_val < -0.8203125):
        return -0.828125
    elif(-0.8203125 <= downsized_val < -0.8046875):
        return -0.8125
    elif(-0.8046875 <= downsized_val < -0.7890625):
        return -0.796875
    elif(-0.7890625 <= downsized_val < -0.7734375):
        return -0.78125
    elif(-0.7734375 <= downsized_val < -0.7578125):
        return -0.765625
    elif(-0.7578125 <= downsized_val < -0.7421875):
        return -0.75
    elif(-0.7421875 <= downsized_val < -0.7265625):
        return -0.734375
    elif(-0.7265625 <= downsized_val < -0.7109375):
        return -0.71875
    elif(-0.7109375 <= downsized_val < -0.6953125):
        return -0.703125
    elif(-0.6953125 <= downsized_val < -0.6796875):
        return -0.6875
    elif(-0.6796875 <= downsized_val < -0.6640625):
        return -0.671875
    elif(-0.6640625 <= downsized_val < -0.6484375):
        return -0.65625
    elif(-0.6484375 <= downsized_val < -0.6328125):
        return -0.640625
    elif(-0.6328125 <= downsized_val < -0.6171875):
        return -0.625
    elif(-0.6171875 <= downsized_val < -0.6015625):
        return -0.609375
    elif(-0.6015625 <= downsized_val < -0.5859375):
        return -0.59375
    elif(-0.5859375 <= downsized_val < -0.5703125):
        return -0.578125
    elif(-0.5703125 <= downsized_val < -0.5546875):
        return -0.5625
    elif(-0.5546875 <= downsized_val < -0.5390625):
        return -0.546875
    elif(-0.5390625 <= downsized_val < -0.5234375):
        return -0.53125
    elif(-0.5234375 <= downsized_val < -0.5078125):
        return -0.515625
    elif(-0.5078125 <= downsized_val < -0.4921875):
        return -0.5
    elif(-0.4921875 <= downsized_val < -0.4765625):
        return -0.484375
    elif(-0.4765625 <= downsized_val < -0.4609375):
        return -0.46875
    elif(-0.4609375 <= downsized_val < -0.4453125):
        return -0.453125
    elif(-0.4453125 <= downsized_val < -0.4296875):
        return -0.4375
    elif(-0.4296875 <= downsized_val < -0.4140625):
        return -0.421875
    elif(-0.4140625 <= downsized_val < -0.3984375):
        return -0.40625
    elif(-0.3984375 <= downsized_val < -0.3828125):
        return -0.390625
    elif(-0.3828125 <= downsized_val < -0.3671875):
        return -0.375
    elif(-0.3671875 <= downsized_val < -0.3515625):
        return -0.359375
    elif(-0.3515625 <= downsized_val < -0.3359375):
        return -0.34375
    elif(-0.3359375 <= downsized_val < -0.3203125):
        return -0.328125
    elif(-0.3203125 <= downsized_val < -0.3046875):
        return -0.3125
    elif(-0.3046875 <= downsized_val < -0.2890625):
        return -0.296875
    elif(-0.2890625 <= downsized_val < -0.2734375):
        return -0.28125
    elif(-0.2734375 <= downsized_val < -0.2578125):
        return -0.265625
    elif(-0.2578125 <= downsized_val < -0.2421875):
        return -0.25
    elif(-0.2421875 <= downsized_val < -0.2265625):
        return -0.234375
    elif(-0.2265625 <= downsized_val < -0.2109375):
        return -0.21875
    elif(-0.2109375 <= downsized_val < -0.1953125):
        return -0.203125
    elif(-0.1953125 <= downsized_val < -0.1796875):
        return -0.1875
    elif(-0.1796875 <= downsized_val < -0.1640625):
        return -0.171875
    elif(-0.1640625 <= downsized_val < -0.1484375):
        return -0.15625
    elif(-0.1484375 <= downsized_val < -0.1328125):
        return -0.140625
    elif(-0.1328125 <= downsized_val < -0.1171875):
        return -0.125
    elif(-0.1171875 <= downsized_val < -0.1015625):
        return -0.109375
    elif(-0.1015625 <= downsized_val < -0.0859375):
        return -0.09375
    elif(-0.0859375 <= downsized_val < -0.0703125):
        return -0.078125
    elif(-0.0703125 <= downsized_val < -0.0546875):
        return -0.0625
    elif(-0.0546875 <= downsized_val < -0.0390625):
        return -0.046875
    elif(-0.0390625 <= downsized_val < -0.0234375):
        return -0.03125
    elif(-0.0234375 <= downsized_val < -0.0078125):
        return -0.015625
    elif(-0.0078125 <= downsized_val < 0.0078125):
        return 0.0
    elif(0.0078125 <= downsized_val < 0.0234375):
        return 0.015625
    elif(0.0234375 <= downsized_val < 0.0390625):
        return 0.03125
    elif(0.0390625 <= downsized_val < 0.0546875):
        return 0.046875
    elif(0.0546875 <= downsized_val < 0.0703125):
        return 0.0625
    elif(0.0703125 <= downsized_val < 0.0859375):
        return 0.078125
    elif(0.0859375 <= downsized_val < 0.1015625):
        return 0.09375
    elif(0.1015625 <= downsized_val < 0.1171875):
        return 0.109375
    elif(0.1171875 <= downsized_val < 0.1328125):
        return 0.125
    elif(0.1328125 <= downsized_val < 0.1484375):
        return 0.140625
    elif(0.1484375 <= downsized_val < 0.1640625):
        return 0.15625
    elif(0.1640625 <= downsized_val < 0.1796875):
        return 0.171875
    elif(0.1796875 <= downsized_val < 0.1953125):
        return 0.1875
    elif(0.1953125 <= downsized_val < 0.2109375):
        return 0.203125
    elif(0.2109375 <= downsized_val < 0.2265625):
        return 0.21875
    elif(0.2265625 <= downsized_val < 0.2421875):
        return 0.234375
    elif(0.2421875 <= downsized_val < 0.2578125):
        return 0.25
    elif(0.2578125 <= downsized_val < 0.2734375):
        return 0.265625
    elif(0.2734375 <= downsized_val < 0.2890625):
        return 0.28125
    elif(0.2890625 <= downsized_val < 0.3046875):
        return 0.296875
    elif(0.3046875 <= downsized_val < 0.3203125):
        return 0.3125
    elif(0.3203125 <= downsized_val < 0.3359375):
        return 0.328125
    elif(0.3359375 <= downsized_val < 0.3515625):
        return 0.34375
    elif(0.3515625 <= downsized_val < 0.3671875):
        return 0.359375
    elif(0.3671875 <= downsized_val < 0.3828125):
        return 0.375
    elif(0.3828125 <= downsized_val < 0.3984375):
        return 0.390625
    elif(0.3984375 <= downsized_val < 0.4140625):
        return 0.40625
    elif(0.4140625 <= downsized_val < 0.4296875):
        return 0.421875
    elif(0.4296875 <= downsized_val < 0.4453125):
        return 0.4375
    elif(0.4453125 <= downsized_val < 0.4609375):
        return 0.453125
    elif(0.4609375 <= downsized_val < 0.4765625):
        return 0.46875
    elif(0.4765625 <= downsized_val < 0.4921875):
        return 0.484375
    elif(0.4921875 <= downsized_val < 0.5078125):
        return 0.5
    elif(0.5078125 <= downsized_val < 0.5234375):
        return 0.515625
    elif(0.5234375 <= downsized_val < 0.5390625):
        return 0.53125
    elif(0.5390625 <= downsized_val < 0.5546875):
        return 0.546875
    elif(0.5546875 <= downsized_val < 0.5703125):
        return 0.5625
    elif(0.5703125 <= downsized_val < 0.5859375):
        return 0.578125
    elif(0.5859375 <= downsized_val < 0.6015625):
        return 0.59375
    elif(0.6015625 <= downsized_val < 0.6171875):
        return 0.609375
    elif(0.6171875 <= downsized_val < 0.6328125):
        return 0.625
    elif(0.6328125 <= downsized_val < 0.6484375):
        return 0.640625
    elif(0.6484375 <= downsized_val < 0.6640625):
        return 0.65625
    elif(0.6640625 <= downsized_val < 0.6796875):
        return 0.671875
    elif(0.6796875 <= downsized_val < 0.6953125):
        return 0.6875
    elif(0.6953125 <= downsized_val < 0.7109375):
        return 0.703125
    elif(0.7109375 <= downsized_val < 0.7265625):
        return 0.71875
    elif(0.7265625 <= downsized_val < 0.7421875):
        return 0.734375
    elif(0.7421875 <= downsized_val < 0.7578125):
        return 0.75
    elif(0.7578125 <= downsized_val < 0.7734375):
        return 0.765625
    elif(0.7734375 <= downsized_val < 0.7890625):
        return 0.78125
    elif(0.7890625 <= downsized_val < 0.8046875):
        return 0.796875
    elif(0.8046875 <= downsized_val < 0.8203125):
        return 0.8125
    elif(0.8203125 <= downsized_val < 0.8359375):
        return 0.828125
    elif(0.8359375 <= downsized_val < 0.8515625):
        return 0.84375
    elif(0.8515625 <= downsized_val < 0.8671875):
        return 0.859375
    elif(0.8671875 <= downsized_val < 0.8828125):
        return 0.875
    elif(0.8828125 <= downsized_val < 0.8984375):
        return 0.890625
    elif(0.8984375 <= downsized_val < 0.9140625):
        return 0.90625
    elif(0.9140625 <= downsized_val < 0.9296875):
        return 0.921875
    elif(0.9296875 <= downsized_val < 0.9453125):
        return 0.9375
    elif(0.9453125 <= downsized_val < 0.9609375):
        return 0.953125
    elif(0.9609375 <= downsized_val < 0.9765625):
        return 0.96875
    else:
        return 0.984375

# Use below code to generate functions above
# bit = "7"

# print("def convertLowBit" + bit + "(downsized_val):")
# numSteps = (2**eval(bit))
# step = 2 / numSteps

# low_bit_val_list = [-1 + step * i for i in range(numSteps)]
# boundary_list = [-1 + step / 2 + step * i for i in range(numSteps - 1)]
# # print(low_bit_val_list)
# # print(boundary_list)

# # val = low_bit_val_list[2]
# # print(str(val))
# for i in range(numSteps):
#     if(i == 0):
#         upper_bound = -1 + step / 2
#         print("    if(downsized_val<" + str(upper_bound) + "):")
#         print("        return -1")
#     elif(i == (numSteps - 1)):
#         print("    else:")
#         print("        return " + str(1 - step))
#     else:
#         lower_bound = boundary_list[i - 1]
#         upper_bound = boundary_list[i]
#         return_val = low_bit_val_list[i]
#         # print(lower_bound)
#         # print(upper_bound)
#         print("    elif(" + str(lower_bound) + "<=downsized_val<" + str(upper_bound) + "):")
#         print("        return " + str(return_val))
