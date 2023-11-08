% Performing Contrast Stretching and Histogram Equalization
clear all;
close all;
clc;
image = imread("Lena.jpg");
image=im2gray(image);
% change the stretch limits [0.05 0.95] and observe the results
stretched_Image = imadjust(image, stretchlim(image, [0.5, 0.8]),[]); 
equalized_Image=histeq(image);
subplot(3,2,1), imshow(image), title('Original Image');
subplot(3,2,2), imhist(image), title('Histogram of Original Image');
subplot(3,2,3), imshow(stretched_Image), title('Strethced Image');
subplot(3,2,4), imhist(stretched_Image), title('Histogram of Stretched Image');
subplot(3,2,5), imshow(equalized_Image), title('Histogram-Equalized Image');
subplot(3,2,6), imhist(equalized_Image), title('Histogram of Histogram-Equalized Image');
