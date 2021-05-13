import cv2 as cv
import numpy

from codecs import decode
import struct

import sys

def float_to_hex(f):
    return hex(struct.unpack('<I', struct.pack('<f', f))[0])

img = cv.imread(str(sys.argv[1]))
img_width = img.shape[0]
img_height = img.shape[1]

# Save image's dimension in a different file
f = open("bitmap.meta", "w")
f.write(str(img_width) + "\n")
f.write(str(img_height))
f.close()

i = 0
j = 0

for i in range(img_height):
    for j in range(img_width):
        r = hex(img[j, i][2]).replace('0x', '').zfill(2)
        g = hex(img[j, i][1]).replace('0x', '').zfill(2)
        b = hex(img[j, i][0]).replace('0x', '').zfill(2)

        # r = float_to_hex(r).replace('0x', '').zfill(2)
        # g = float_to_hex(g).replace('0x', '').zfill(2)
        # b = float_to_hex(b).replace('0x', '').zfill(2)
        print(r, g, b, sep='')