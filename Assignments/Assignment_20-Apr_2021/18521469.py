import cv2 as cv
import numpy as np
import math

Gx =   [[-1, 0, 1],
        [-2, 0, 2],
        [-1, 0, 1]]

Gy =   [[-1, -2, -1],
        [0, 0, 0],
        [1, 2, 1]]

img = cv.imread("lena.jpg")

img_width = img.shape[0]
img_height = img.shape[1]

# Create an empty image with black colour
grey_image = np.zeros((img_width, img_height, 3), np.uint8)
max_pooling = np.zeros((img_width - 1, img_height - 1, 3), np.uint8)
avg_pooling = np.zeros((img_width - 1, img_height - 1, 3), np.uint8)

G_x_img = np.zeros((img_width - 2, img_height - 2, 3), np.uint8)
G_y_img = np.zeros((img_width - 2, img_height - 2, 3), np.uint8)
G_xy_img = np.zeros((img_width - 2, img_height - 2, 3), np.uint8)

for i in range(img_height):
    for j in range(img_width):
        tmp = (img[j][i][2] / 255.0) * 0.299
        tmp += (img[j][i][1] / 255.0) * 0.587
        tmp += (img[j][i][0] / 255.0) * 0.114
        tmp = int(tmp * 255)

        grey_image[j][i] = (tmp, tmp, tmp)

for i in range(img_height - 1):
    for j in range(img_width - 1):
        max = grey_image[j][i][0]
        if (grey_image[j + 1][i][0] > max):
            max = grey_image[j + 1][i][0]
        if (grey_image[j][i + 1][0] > max):
            max = grey_image[j][i + 1][0]
        if (grey_image[j + 1][i + 1][0] > max):
            max = grey_image[j + 1][i + 1][0]
        max_pooling[j][i] = (max, max, max)

for i in range(img_height - 1):
    for j in range(img_width - 1):
        tmp = grey_image[j][i][0]
        tmp += grey_image[j + 1][i][0]
        tmp += grey_image[j][i + 1][0]
        tmp += grey_image[j + 1][i + 1][0]
        tmp /= 4
        avg_pooling[j][i] = (tmp, tmp, tmp)

for i in range(img_height - 2):
    for j in range(img_width - 2):
        tmp = Gx[0][0] * grey_image[j][i][0]
        tmp += Gx[1][0] * grey_image[j + 1][i][0]
        tmp += Gx[2][0] * grey_image[j + 2][i][0]

        tmp += Gx[0][2] * grey_image[j + 1][i + 2][0]
        tmp += Gx[1][2] * grey_image[j + 1][i + 2][0]
        tmp += Gx[2][2] * grey_image[j + 1][i + 2][0]

        if (tmp < 0):
            tmp = 0

        G_x_img[j][i] = (tmp, tmp, tmp)

for i in range(img_height - 2):
    for j in range(img_width - 2):
        tmp = Gy[0][0] * grey_image[j][i][0]
        tmp += Gy[0][1] * grey_image[j][i + 1][0]
        tmp += Gy[0][2] * grey_image[j][i + 2][0]

        tmp += Gy[2][0] * grey_image[j + 2][i][0]
        tmp += Gy[2][1] * grey_image[j + 2][i + 1][0]
        tmp += Gy[2][2] * grey_image[j + 2][i + 2][0]

        if (tmp < 0):
            tmp = 0

        G_y_img[j][i] = (tmp, tmp, tmp)

for i in range(img_height - 2):
    for j in range(img_width - 2):
        # tmp = G_x_img[j][i][0] * G_x_img[j][i][0]
        # tmp += G_y_img[j][i][0] * G_y_img[j][i][0]
        # tmp = math.sqrt(tmp)

        # if (tmp < 0):
        #     tmp = 0

        G_xy_img = G_x_img + G_y_img

cv.imwrite("grey_image.jpg", grey_image)
cv.imwrite("G_x_image.jpg", G_x_img)
cv.imwrite("G_y_image.jpg", G_y_img)
cv.imwrite("G_xy_image.jpg", G_xy_img)
cv.imwrite("max_pooling.jpg", max_pooling)
cv.imwrite("avg_pooling.jpg", avg_pooling)