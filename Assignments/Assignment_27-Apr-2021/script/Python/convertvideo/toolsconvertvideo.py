import cv2 as cv
import numpy as np

# Create a VideoCapture object and read from input file
# If the input is the camera, pass 0 instead of the video file name
cap = cv.VideoCapture('homework.mp4')

# Check if camera opened successfully
if (cap.isOpened()== False): 
  print("Error opening video stream or file")

# Read until video is completed
while(cap.isOpened()):
  # Capture frame-by-frame
  ret, frame = cap.read()
  if ret == True:
  
  # Convert to grayvideo 
      gray = cv.cvtColor(frame,cv.COLOR_BGR2GRAY)

    # Display the resulting frame
      cv.imshow('Frame',gray)

    # Press Q on keyboard to  exit
      if cv.waitKey(25) & 0xFF == ord('q'):
         break

  # Break the loop
  else: 
    break

# When everything done, release the video capture object
cap.release()

# Closes all the frames
cv.destroyAllWindows()

