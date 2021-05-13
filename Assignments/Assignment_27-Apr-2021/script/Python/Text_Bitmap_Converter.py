import struct
import numpy as np
import cv2 as cv
import sys

# Function that converts a hex string to float
def Hex_To_Float(x):
    return struct.unpack('!f', bytes.fromhex(x))[0]

# Output file handler
f = open("bitmap.out", "r")
f2 = open("bitmap.meta", "r")

# Retrieve image's width and height
img_width = int(f2.readline())
img_height = int(f2.readline())
# print("Width is: ", img_width)
# print("Height is: ", img_height)

# Create an empty image with black colour
blank_image = np.zeros((img_width, img_height, 3), np.uint8)

# This list store all pixels read from the input file
pixels = []

for x in f:
    pixels.append(int(x, 16))

i = 0
j = 0
k = 0

for i in range(img_height):
    for j in range(img_width):
        blank_image[j, i] = (pixels[k], pixels[k], pixels[k])
        k = k + 1

# Write image
cv.imwrite("verilog_out.jpg", blank_image)
f.close()
f2.close()