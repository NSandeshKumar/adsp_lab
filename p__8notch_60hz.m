% DESIGN AND SIMULATE A NOTCH FILTER TO REMOVE 60HZ HUM/AND 
% UNWANTED FREQUENCY COMPONENT OF A GIVEN SPEECH SIGNAL
clear; close all;clc;

fs=400;
notch_fre=50;
notch_samples=2*pi*notch_fre/fs;
r=0.7;
zeros=[exp(1i*notch_samples) exp(-1i*notch_samples)];
poles=[r*exp(1i*notch_samples) r*exp(-1i*notch_samples)];
disp('zeros');
disp(zeros)
disp('poles');
disp(poles)
zplane(zeros,poles)
b=poly(zeros);
a=poly(poles);

figure(2)
[db,mag,pha,grp,w]=my_freqz(b,a);
subplot(311)
plot(w*fs/(2*pi),db);
xlabel('Frequency in Hz');
ylabel('dB');
title('Notch Filter Frequency Response');

% Time domain signal
% t=0:1/fs:1;
% x=sin(2*pi*50*t) + sin(2*pi*100*t);

load mit200
subplot(312)
plot(tm,ecgsig)
% hold on
% 
% plot(tm(ann),ecgsig(ann),'r.')  % Annotations
xlabel('Seconds')
ylabel('Amplitude')
title('Subject - MIT-BIH 200')

subplot(313)
plot(tm(1:1000),ecgsig(1:1000));

%% Spectrum of input signal
t=0:1/fs:1;
n=sin(2*pi*50*t);
x=ecgsig(1:401)+n(1:401)';
X=fft(x);
X_mag=abs(X);
f=(0:length(X)-1)*fs/length(X);
figure(3)
subplot(211)
plot(f, X_mag)
xlabel('Frequency in Hz');
ylabel('FFT of original signal');
title('Spectrum of Original Signal');

% Filtered output
y=filter(b,a,x);
X1=fft(y);
m1=abs(X1);
f1=(0:length(X1)-1)*fs/length(X1);
subplot(212)
plot(f1, m1)
xlabel('Frequency in Hz');
ylabel('Filtered signal');
title('Spectrum of Filtered Signal');

%%
figure(4)
subplot(2,1,1)
plot(x)
title('Original Signal');

subplot(2,1,2)
plot(y)
title('Filtered Signal');

function [db,mag,pha,grp,w]=my_freqz(b,a)
[H,w]=freqz(b,a,1000,'whole');
H=(H(1:501))';
w=(w(1:501))';
mag=abs(H);
db=20*log10((mag+eps)/max(mag));
pha=angle(H);
grp=grpdelay(b,a,w);
end

