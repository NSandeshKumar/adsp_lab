%High Pass Filtering using FFT

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
title("fft of original image");

% Define the cutoff frequency for the high-pass filter
cutoff_frequency = 15;

% Create a meshgrid to match the dimensions of af
[M, N] = size(af);
[x, y] = meshgrid(-N/2:N/2-1, -M/2:M/2-1);
z = sqrt(x.^2 + y.^2);

% Create the ideal high-pass filter
hpf = double(z > cutoff_frequency);

% Resize the filter to match the size of af
hpf = imresize(hpf, [M, N]);

subplot(233);
imshow(hpf);
title("ideal HPF");

% Apply the high-pass filter in the frequency domain
HF = af .* hpf;
subplot(234);
imshow(mat2gray(log(1 + abs(HF))));
title("output of filter");

% Perform the inverse FFT to get the filtered image
hf = ifft2(ifftshift(HF));
subplot(236);
imshow(mat2gray(abs(hf)));
title("ifft performed on filter image");
