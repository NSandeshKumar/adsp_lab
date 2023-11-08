% High Boost Filtering
clc; 
clear all; 
close all;
x=imread("lenna.jpg");
subplot(3,1,1);
imshow(x); title('Original Image');
id=[0 0 0;0 1 0;0 0 0];
f=fspecial('average');
hb1=3*id-2*f;
hb2=1.25*id-0.25*f;
x1=convn(hb1,x);
subplot(3,1,2);
imshow(x1/255);
title('high boost filtering with filter hb1');
x2=convn(hb2,x);
subplot(3,1,3);
imshow(x2/255);
title('high boost filtering with filter hb2');
