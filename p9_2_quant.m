%To perform Quantisation for Gray Scale
clc;
clear;
close all;
x=imread("Lena.jpg");
y=im2gray(x);
subplot(3,4,1);
imshow(y);
title("original image");
subplot(3,4,3);
imshow(grayslice(y,128),gray(128));
title("image quantised2 128 gray levels");
subplot(3,4,5);
imshow(grayslice(y,64),gray(64));
title("64 gray levels");
subplot(3,4,6);
imshow(grayslice(y,32),gray(32));
title("32 gray levels");
subplot(3,4,7);
imshow(grayslice(y,16),gray(16));
title("16 gray levels");
subplot(3,4,8);
imshow(grayslice(y,8),gray(8));
title("8 gray levels");
subplot(3,4,9);
imshow(grayslice(y,4),gray(4));
title("4 gray levels");
subplot(3,4,10);
imshow(grayslice(y,2),gray(2));
title("2 gray levels");