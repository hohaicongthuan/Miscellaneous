import cv2 as cv
import numpy as np

ave = cv.imread("compareimg.png")

ave_width = ave.shape[0]
ave_height = ave.shape[1]

gray=np.zeros((ave_width,ave_height,3),np.uint8)
i=0
j=0

def Tong(c,d):
    Sum = c+d
    return float(Sum)

def TB(x):
    return float(x/(ave_width * ave_height))
    
sum = 0

for i in range(ave_height):
    for j in range(ave_width):
        # h = ave[i,j][0]
        # w = ave[i,j][1]
        # sum = Tong(h,w)
        sum = sum + ave[j, i][0]
    # av = TB(sum)

print (sum / (ave_width * ave_height))
