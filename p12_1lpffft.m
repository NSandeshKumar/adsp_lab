%Low pass filtering using FFT
clc;
clear;
close all;

x = imread("cameraman.jpg");
y = rgb2gray(x);
a = imresize(y, 0.5);

subplot(231);
imshow(a);
title("original image");

af = fftshift(fft2(a));
subplot(232);
imshow(mat2gray(log(1 + abs(af))));
title("FFT of Original image");

[M, N] = size(af);
[x, k] = meshgrid(-N/2:N/2-1, -M/2:M/2-1);

z = sqrt(x.^2 + k.^2);
c = (z < 15);

subplot(233);
imshow(c);
title("Ideal LPF");

% Resize the filter to match the dimensions of af
c = imresize(c, [M, N]);

LF = af .* c;

subplot(234);
imshow(mat2gray(log(1 + abs(LF))));
title("Output of filter");

lf = ifft2(ifftshift(LF));

subplot(236);
imshow(mat2gray(abs(lf)));
title("IFFT performed on filtered image");

