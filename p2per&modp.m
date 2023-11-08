% TO PLOT THE PERIODOGRAM OF A NOISY SIGNAL AND ESTIMATE THE POWER SPECTRAL DENSITY USING PERIODOGRAM &AMP; MODIFIED 
% PERIODOGRAM METHODS
clc;
close all;
clear;
%% psd calculation using fft
t = 0:1023;
x = sin(2*pi*50/1000*t)+sin(2*pi*120/1000*t);
y = x+randn(size(t));
N=length(y);
f1=1000*(0:N/2-1)/N;
p=abs(fft(y).^2)/N;
subplot(221);
plot(f1,10*log10(p(1:512)));
grid;
xlabel('frequency-->');
ylabel('Power in dB-->');
title(' PSD estimation using fft')
%% psd calculation using periodogram
[Pxx,w]=periodogram(y);
subplot(222);
plot(1000*w/(2*pi),10*log10(Pxx));
grid;
xlabel('frequency-->');
ylabel('Power in dB-->');
title('PSD using periodogram');
%% psd calculation using modified periodogram
w=hanning(N);
[Pxx,w]=periodogram(y,w);
subplot(223);
plot(1000*w/(2*pi),10*log10(Pxx));
7
grid;
xlabel('frequency-->');
ylabel('Power in dB-->');
title('Modified periodogram');
%% psd calculation using auto correlation and fft
z=xcorr(y);
m=length(z);
g1=abs(fft(z));
n2=1000*(0:(m/2)-1)/m;
subplot(224);
plot(n2,10*log10(g1(1:1023)));
grid;
xlabel('frequency-->');
ylabel('Power in dB-->');
title('PSD estimate by auto correlation and fft');