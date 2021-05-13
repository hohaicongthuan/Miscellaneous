import cv2 as cv
import numpy as np
import sys

# Read picture
pic = cv.imread(str(sys.argv[1]))


pic_width = pic.shape[0]
pic_height = pic.shape[1]

# Mảng trống này có kích thước cùng với kích thước ảnh input
# Có 3 channel màu
# Khởi tạo ban đầu là màu đen
grey = np.zeros((pic_width, pic_height, 3), np.uint8)

i = 0
j = 0

def RGBtoGray(R,G,B):
    Gray = 0.299 * r + 0.587 * g+ 0.114 * b
    # Kết quả của Gray ở dạng float trong khoảng [0..1] ông cần chuyển nó về
    # integer bằng cách nhân 255 và lấy phần nguyên
    return int(Gray * 255)
    
for i in range(pic_height):
    for j in range(pic_width):
        r = pic[j, i][2]/255.0
        g = pic[j, i][1]/255.0
        b = pic[j, i][0]/255.0
        
        # Tính toán giá trị Grey và bỏ tạm vào một biến
        temp = RGBtoGray(r, g, b)

        # Gán tất cả 3 channel cùng một giá trị grey
        grey[j, i] = (temp, temp, temp)

cv.imwrite ("python_out.jpg", grey)                 
