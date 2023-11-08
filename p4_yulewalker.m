% POWER SPECTRUM ESTIMATION USING YULE-WALKER METHOD
clc;
close all;
clear all; 
a=[1 -2.2137 2.9408 -2.1697 0.9609]; % AR filter coefficients
randn('state',1);
x=filter(1,a,randn(256,1)); % AR system output
pyulear(x,4); % Fourth-order estimate
xlabel('Normalized frequency -->');
ylabel('-->Power Spectrum in dB');
title('Yule-Walker method of Power Spectrum Estimation');