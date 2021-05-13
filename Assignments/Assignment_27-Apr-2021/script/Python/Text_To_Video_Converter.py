# This script converts a video file into text
import cv2 as cv
import numpy as np

from codecs import decode
import struct

import sys

def float_to_hex(f):
    return hex(struct.unpack('<I', struct.pack('<f', f))[0])

# Function that converts a hex string to float
def Hex_To_Float(x):
    return struct.unpack('!f', bytes.fromhex(x))[0]

# Retrieve the sizes
f = open("video.meta", "r")
frame_width = int(f.readline())
frame_height = int(f.readline())
f.close()

# video = cv.VideoCapture(str(sys.argv[1]))

# Create an empty image with black colour
frame = np.zeros((frame_width, frame_height, 3), np.uint8)

# Check if the video is opened successfully
# if (video.isOpened() == False):
#     print("Unable to read video")

# Define the codec and create VideoWriter object.The output is stored in 'outpy.avi' file.
out = cv.VideoWriter('verilog_out.avi', cv.VideoWriter_fourcc('M','J','P','G'), 20, (frame_height, frame_width))

f = open("bitmap.out", "r")
lines = f.readlines()

i = 0
j = 0
k = 0
n = 1

loop_range = int(len(lines) / (frame_height * frame_width))

# print("Loop range = ", loop_range)
# print("Video width = ", frame_width)
# print("Video height = ", frame_height)
# print("Lines length = ", len(lines))

for n in range(loop_range):
    for i in range(frame_height):
        for j in range(frame_width):
            # temp = int(Hex_To_Float(lines[k]) * 255)
            frame[j, i] = (int(lines[k],16), int(lines[k],16), int(lines[k],16))
            # print("k = ", k)
            k = k + 1

    cv.imshow("Frame", frame)
    cv.waitKey(1)
    out.write(frame)

out.release()

cv.destroyAllWindows() 