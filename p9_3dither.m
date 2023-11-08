%To perform Dithering for grayscale image to two grayscales
clc;
clear;
close all;
x=imread("Lena.jpg");
y=im2gray(x);
y=imresize(y,[512,512]);
subplot(2,3,1);
imshow(y);
title("original image");
D=[0 128;192 64];
r=repmat(D,256,256);
x2=y>r;
subplot(2,3,2);
imshow(x2);
title("dithered image using D");
D2=[0 128 32 160;192 64 224 96;48 176 16 144;240 112 208 80];
r2=repmat(D2,128,128);
x4=y>r2;
subplot(2,3,3);
imshow(x4);
title("dithered image using D2");
z=dither(y);
subplot(2,3,4)
imshow(z)
