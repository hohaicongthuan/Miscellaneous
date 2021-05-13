import cv2
import numpy as np
import sys

# Create a VideoCapture object
cap = cv2.VideoCapture(str(sys.argv[1]))

# Check if camera opened successfully
if (cap.isOpened() == False): 
  print("Unable to read camera feed")

# Default resolutions of the frame are obtained.The default resolutions are system dependent.
# We convert the resolutions from float to integer.
frame_width = int(cap.get(3))
frame_height = int(cap.get(4))

def Grayvideo(r, g, b):
    Gray = 0.299 * r + 0.587 * g + 0.114 * b
    return int(Gray * 255)

# Define the codec and create VideoWriter object.The output is stored in 'outpy.avi' file.
out = cv2.VideoWriter('python_out.avi', cv2.VideoWriter_fourcc('M','J','P','G'), 20, (frame_width,frame_height))

while(True):
  ret, frame = cap.read()

  if ret == True: 
  
    # Convert to grayvideo 
    frame_widths = frame.shape[0]
    frame_heights = frame.shape[1]
    grey = np.zeros((frame_widths, frame_heights, 3), np.uint8)
    
    for i in range(frame_widths):
        for j in range(frame_heights):
            r = frame[i, j][0] / 255.0
            g = frame[i, j][1] / 255.0
            b = frame[i, j][2] / 255.0
        
            temp = Grayvideo(r, g, b)
         
            grey[i,j] = (temp, temp, temp)
   
    # Display the resulting frame    
    cv2.imshow('frame', grey)
        
    # Write the frame into the file 'output.avi'
    out.write(grey)
    
    # Press Q on keyboard to stop recording
    if cv2.waitKey(1) & 0xFF == ord('q'):
      break
    
  # Break the loop
  else:
    break  

# When everything done, release the video capture and video write objects
cap.release()
out.release()

# Closes all the frames
cv2.destroyAllWindows()

