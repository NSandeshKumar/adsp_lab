% HPF Filtering: Laplacian, Laplacian of Gaussian
clc;clear all;close all;
% importing the image
I = rgb2gray(imread("yellowlily.jpg"));
subplot(1,4,1),
imshow(I);
title("Gray Scale Image");
% Apply Sobel Operator
% Display only the horizontal Edges
sob_horiz = edge(I,'sobel','horizontal');
subplot(1,4,2); 
imshow(sob_horiz,[]); title('For Horizontal Edges');
 
% Apply Sobel Operator
% Display only the vertical Edges
sob_verti = edge(I,'sobel','vertical');
subplot(1,4,3); 
imshow(sob_verti,[]); title('For Vertical Edges');
 
% Apply Sobel Operator
% Display both horizontal and vertical Edges
sobel_both = edge(I,'sobel','both');
subplot(1,4,4);imshow(sobel_both,[]); title('For Both Edges');
figure(2)
subplot(2, 4, 1);imshow(I);title("Gray Scale Image");
% Sobel Edge Detection
[J, sob_threshold] = edge(I, 'Sobel');
subplot(2, 4, 2);imshow(J);title("Sobel Method");
% Prewitt operator for Edge detection
[K, prew_threshold]= edge(I, 'Prewitt');
subplot(2, 4, 3);imshow(K);title("Prewitt Method");
% Robert operator for Edge Detection
[L, rob_threshold] = edge(I, 'Roberts');
subplot(2, 4, 4);imshow(L);title("Robert Method");
% Apply Laplacian Filter operator for Edge Detection
f=fspecial('laplacian'); 
lap_filt = imfilter(I,f,'symmetric'); 
subplot(2,4,5); 
imshow(lap_filt,[]); title('Laplacian Method');
% Laplacian of Gaussian for Edge Detection
[M, log_threshold] = edge(I, 'log');
subplot(2, 4, 6),imshow(M);title("LOG Method");
sigma=3.0;
log_I = edge(I,'log',[],sigma);
subplot(2, 4, 7);imshow(log_I);title(["LOG sigma value " num2str(sigma)]); 
% Zerocross Edge Detection
[M, zero_threshold] = edge(I, 'zerocross');
subplot(2, 4, 8);imshow(M);title("Zerocross Method");