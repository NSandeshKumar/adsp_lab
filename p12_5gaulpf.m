%Applying Gaussian Low Pass Filter

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

% Create a Gaussian low-pass filter
filter_size = [M, N]; % Size of the filter, same as the image size
sigma = 10; % Adjust as needed for the desired filter strength
g1 = fspecial('gaussian', filter_size, sigma);

% Resize the filter to match the dimensions of af
g1 = imresize(g1, [M, N]);

subplot(233);
imshow(g1);
title("Gaussian LPF");

afg1 = af .* g1;

subplot(234);
imshow(mat2gray(log(1 + abs(afg1))));
title("Output of filter");

afli = ifft2(ifftshift(afg1));

subplot(235);
imshow(mat2gray(abs(afli)));
title("IFFT performed on filter image");
