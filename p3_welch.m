% POWER SPECTRAL DENSITY ESTIMATION USING WELCH METHOD
clc;
close all;
clear;
fs=1024;
f1=200;
f2=400;
M=128;
t=0:1/fs:1;
x=sin(2*pi*f1*t)+sin(2*pi*f2*t)+rand(size(t));
L=length(x);
K=L/M;
wi=hann(M+1);

su=[];
for i=1:M/2:L-M+1
 y=wi'.*x(i:M+i);
 w2=abs(fft(y).^2);
 su=[su;w2];
end
su1=sum(su);
su2=sum(wi.^2);
w1=su1/su2;
w12=10*log(w1);
fs1=(fs/K)+2;
t1=((1:fs1)/fs1);
plot(t1,w12);
grid;
xlabel('Normalized frequency -->');
ylabel('-->Power Spectrum in dB');
