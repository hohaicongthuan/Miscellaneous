import numpy as np
import cv2 as cv
import sys

imgveri = cv.imread("verilog_out.jpg")
imgpython = cv.imread("python_out.jpg")
origin = cv.imread(str(sys.argv[1]))

compareimg = cv.absdiff(imgveri, imgpython)
cv.imwrite("compareimg.jpg", compareimg)

while (True):
    cv.imshow("Original Image", origin)
    cv.imshow("Result from Verilog", imgveri)
    cv.imshow("Result from Python", imgpython)
    cv.imshow("Results Difference", compareimg)

    if (cv.waitKey(1) & 0xFF == 27):
        break

cv.destroyAllWindows()
