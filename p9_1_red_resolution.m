% Reducing Resolution of an image -Spatial Resolution
clc;
clear;
close all;
I=imread("Lena.jpg");
x=im2gray(I);
subplot(3,4,2),imshow(x),title("original image");
K=imresize(imresize(x,1/2),2);
L=imresize(imresize(x,1/4),4);
M=imresize(imresize(x,1/8),8);
N=imresize(imresize(x,1/16),16);
O=imresize(imresize(x,1/32),32);
P=imresize(imresize(x,1/64),64);
subplot(3,4,6);
imshow(K);
title("Reducing resolution to 256X256");
subplot(3,4,8),imshow(L);
title('128X128');
subplot(3,4,9);
imshow(M);
title('64X64');
subplot(3,4,10)
imshow(N);
title('32X32');
subplot(3,4,11),
imshow(O);
title('16X16');
subplot(3,4,12);
imshow(P);
title('8X8');
gtext("performing image resize operation','color','black','fontsize',14");