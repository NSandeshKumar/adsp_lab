% POWER SPECTRAL DENSITY ESTIMATION USING BARTLETT METHOD 
clc;
close all;
clear all;
t=0:1023
x=sin(2*pi*50/1000*t)+sin(2*pi*120/1000*t);
y=x+randn(size(t));
N=length(y);
k=4;
M=N/k;
x1=y(1:M);
x2=y(M+1:2*M);
x3=y(2*M+1:3*M);
x4=y(3*M+1:4*M);
px41=(1/M)*((abs(fft(x1))).^2);
px42=(1/M)*((abs(fft(x2))).^2);
px43=(1/M)*((abs(fft(x3))).^2);
px44=(1/M)*((abs(fft(x4))).^2);
px5=(px41+px42+px43+px44)/k;
n1=1000*(0:M/2)/M;
plot(n1,px5(1:M/2+1));
grid;
xlabel('Normalized frequency in Hz -->');
ylabel('-->Power Spectrum in dB');
title('PSD ESTIMATION USING BARLETT METHOD')