%Plot Histogram and perform histogram equalization
clc;
close all;
clear;
I=imread("lenna.jpg");
subplot(221);
imshow(I);
title('original image');
subplot(222);
imhist(I);
axis tight,
title("Histogram");
subplot(223);
p=imadjust(I,[],[],0.5);
imshow(p);
title('Histogram Stretching');
subplot(224);
R=histeq(I);
imshow(R);
title("Histogram Equalisation");
