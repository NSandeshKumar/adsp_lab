% Performing Histogram Normalization
clc;
close all;
clear all;
% Read the image.
imag=imread("lighthouse.jpg");
subplot(341)
imshow(imag)
subplot(343)
imhist(imag);
%Convert into grayscale
gray=rgb2gray(imag);
% Display the image and histogram.
subplot(345)
imshow(gray)
subplot(347)
imhist(gray);
% Set the minimum and maximum Values from histogram.
min_gray=45;
max_gray=180;
% Convert image into double.
IMG=double(imag);
% Apply the formula.
img_normal=(IMG-min_gray)./(max_gray-min_gray);
% Multiply with maximum possible value.
normalized=img_normal.*255;
% Convert the final result into uint8.
normalized=uint8(normalized);
% Display the enhanced image and histogram.
subplot(3,4,9)
imshow(normalized)
subplot(3,4,11)
imhist(normalized);
