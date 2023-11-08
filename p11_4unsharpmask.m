%Unsharp Masking
clc; 
close all; 
clear all;
a = imread("Lena.jpg");
subplot(121)
imshow(a), title('Original Image');
b = imsharpen(a,'Radius',2,'Amount',1);
subplot(122)
imshow(b)
title('Sharpened Image');
