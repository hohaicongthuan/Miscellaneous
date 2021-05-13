# From: https://stackoverflow.com/questions/8751653/how-to-convert-a-binary-string-into-a-float-value
from codecs import decode
import struct

def bin_to_float(b):
    """ Convert binary string to a float. """
    bf = int_to_bytes(int(b, 2), 8)  # 8 bytes needed for IEEE 754 binary64.
    return struct.unpack('>d', bf)[0]

def int_to_bytes(n, length):  # Helper function
    """ Int/long to byte string.

        Python 3.2+ has a built-in int.to_bytes() method that could be used
        instead, but the following works in earlier versions including 2.x.
    """
    return decode('%%0%dx' % (length << 1) % n, 'hex')[-length:]

def float_to_bin(value):  # For testing.
    """ Convert float to 32-bit binary string. """
    [d] = struct.unpack(">Q", struct.pack(">d", value))
    return '{:064b}'.format(d)

def float_to_hex(f):
    return hex(struct.unpack('<I', struct.pack('<f', f))[0])
###############################################################################################
###############################################################################################
# My own code starts here

for i in range(255):
    x = float_to_hex(i / 255.0).replace("0x", "").zfill(8)
    print("8'h", hex(i).replace("0x", "").zfill(2), ": data_o = 32'h", x, ";", sep="")