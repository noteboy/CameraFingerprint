import dlib         # 人脸识别的库dlib
import numpy as np  # 数据处理的库numpy
import cv2          # 图像处理的库OpenCv
import os
# dlib预测器
detector = dlib.get_frontal_face_detector()
predictor = dlib.shape_predictor('shape_predictor_68_face_landmarks.dat')

# 读取图像的路径
path_read = "C:\\Users\\BEIK\\Desktop\\richmodel\\richmodelCode\\dataset\\image\\neg_1\\"
# 用来存储生成的单张人脸的路径
path_save = "C:\\Users\\BEIK\\Desktop\\richmodel\\richmodelCode\\dataset\\image\\neg_face\\"

filename = os.listdir(path_read)
for i in filename:
	img = cv2.imread(path_read+i)
	dets = detector(img,1)
	for k,d in enumerate(dets):
		pos_start = tuple([d.left(),d.top()])
		pos_end = tuple([d.right,d.bottom])
		height = d.bottom()-d.top()
		width = d.right()-d.left()

		img_blank = np.zeros((height,width,3),np.uint8)

		for j in range(height):
			for kk in range(width):
				img_blank[j][kk] = img[d.top()+j][d.left()+kk]
		cv2.imwrite(path_save+i+"_"+str(k+1)+".jpg",img_blank)

"""

img = cv2.imread("C:\\Users\\BEIK\\Desktop\\richmodel\\richmodelCode\\dataset\\image\\1.pgm")
dets = detector(img,1)
for k,d in enumerate(dets):
	pos_start = tuple([d.left(),d.top()])
	pos_end = tuple([d.right,d.bottom])
	height = d.bottom()-d.top()
	width = d.right()-d.left()
	img_blank = np.zeros((height,width,3),np.uint8)

	for j in range(height):
		for kk in range(width):
			img_blank[j][kk] = img[d.top()+j][d.left()+kk]
	cv2.imwrite(path_save+i+"_"+str(k+1)+".pgm",img_blank)



"""