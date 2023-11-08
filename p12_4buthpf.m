%Applying Butterworth HPF

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
[x, y] = meshgrid(-N/2:N/2-1, -M/2:M/2-1);

% Define filter parameters
cutoff_frequency = 15; % Adjust as needed
n = 2; % Butterworth filter order, adjust as needed

b1 = 1 - 1./(1 + (sqrt(x.^2 + y.^2) / cutoff_frequency).^(2*n));

% Resize the filter to match the dimensions of af
b1 = imresize(b1, [M, N]);

subplot(233);
imshow(b1);
title("Butterworth HPF");

afb1 = af .* b1;

subplot(234);
imshow(mat2gray(log(1 + abs(afb1))));
title("Output of filter");

afli = ifft2(ifftshift(afb1));

subplot(235);
imshow(mat2gray(abs(afli)));
title("IFFT performed on filter image");
