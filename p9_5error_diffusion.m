%Matlab Implementation of Error Diffusion using Floyd’s and Steinberg’s filter weights
clc;
clear;
close all;
x=imread("Lena.jpg");
y=im2gray(x);
subplot(221);
imshow(y);
title("original image");
height=size(y,1);
width=size(y,2);
m=uint8(zeros(height,width));
z=zeros(height+2,width+2);
z(2:height+1,2:width+1)=y;
for i=2:height+1
 for j=2:width+1
 if z(i,j)<128
 m(i-1,j-1)=0;
 e=z(i,j);
 else 
 m(i-1,j-1)=255;
 e=z(i,j)-255;
 end
 z(i,j+1)=z(i,j+1)+7*e/16;
 z(i+1,j-1)=z(i+1,j-1)+3*e/16;
 z(i+1,j)=z(i+1,j)+5*e/16;
 z(i+1,j+1)=z(i+1,j+1)+e/16;
 end
end
subplot(224);
imshow(mat2gray(z));
title("error diffusion");
subplot(222);
imshow(dither(y));
title("Direct method");
