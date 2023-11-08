% Performing arithmetic operations on image
clc;
close all;
clear;
I=imread("lenna.jpg");
subplot(221);
imshow(I);
title('original image');
A=imadd(I,125);
S=imsubtract(I,125);
M=immultiply(I,2);
D=imdivide(I,2);
subplot(222);
imshowpair(A,S,'montage');
title("Addition Subtraction");
subplot(223);
imshowpair(M,D,'montage');
title("Multiplication Division");