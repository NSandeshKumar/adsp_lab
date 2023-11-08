% Mean Filtering
clc;
close all;
clear;
x=imread("lenna.jpg");
subplot(2,1,1);
imshow(x);
title("original image");
mf=ones(3,3)/9;
nf=imfilter(x,mf);
subplot(2,1,2);
imshow(nf);
title("Mean filtering");
