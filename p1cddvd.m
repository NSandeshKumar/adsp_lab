% Program to convert CD data into DVD data
clc;
clear all; 
close all;
fm=input('enter the signal frequency fm:');
fs=input('enter the sampling frequency fs:');
T=input('enter the duration of the signal in seconds:');
dt=1/fs;
t=0:pi/100:pi;
m=sin(2*pi*fm*t);
subplot(2,2,1);
plot(m);
xlabel('time-->');
ylabel('amplitude-->');
title("cd continuous");
subplot(2,2,2);
stem(m);
xlabel('time-->');
ylabel('amplitude-->');
title("cd discrete");
y=resample(m,96,44);
subplot(2,2,3)
stem(y);
xlabel('time-->');
ylabel('amplitude-->');
title("dvd discrete");
subplot(2,2,4)
plot(y);
xlabel('time-->');
ylabel('amplitude-->');
title("dvd continuous");