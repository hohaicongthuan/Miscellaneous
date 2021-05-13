# This script converts a video file into text
import cv2 as cv
import numpy as np

from codecs import decode
import struct

import sys

def float_to_hex(f):
    return hex(struct.unpack('<I', struct.pack('<f', f))[0])

video = cv.VideoCapture(str(sys.argv[1]))

# Check if the video is opened successfully
if (video.isOpened() == False):
    print("Unable to read video")

frame_width = int(video.get(4))
frame_height = int(video.get(3))

f = open("video.meta", "w")
f.write(str(frame_width) + "\n")
f.write(str(frame_height))
f.close()

while (video.isOpened()):
    ret, frame = video.read()
    if (ret == False):
        break
    
    i = 0
    j = 0

    for i in range(frame_height):
        for j in range(frame_width):
            r = hex(frame[j, i][2]).replace('0x', '').zfill(2) #/ 255.0
            g = hex(frame[j, i][1]).replace('0x', '').zfill(2) #/ 255.0
            b = hex(frame[j, i][0]).replace('0x', '').zfill(2) #/ 255.0

            # r = float_to_hex(r).replace('0x', '').zfill(2)
            # g = float_to_hex(g).replace('0x', '').zfill(2)
            # b = float_to_hex(b).replace('0x', '').zfill(2)
            print(r, g, b, sep='')