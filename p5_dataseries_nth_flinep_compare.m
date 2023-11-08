% ESTIMATION OF DATA SERIES USING Nth ORDER FORWARD PREDICTOR 
%AND COMPARING IT TO ORIGINAL SIGNAL
clc;
clear all;
close all;
randn('state',0);
noise = randn(50000,1); % Normalized white Gaussian noise
x = filter(1,[1 1/2 1/3 1/4 1/5 1/6 1/7 1/8 1/9],noise);
x = x(45904:50000);
N=input('enter the order:');
a = lpc(x,N);
est_x = filter([0 -a(2:end)],1,x); % Estimated signal
e = x - est_x; % Prediction error
[acs,lags]=xcorr(e,'coeff');
figure;
%compare the predicted signal to the original signal:
plot(1:97,x(4001:4097),1:97,est_x(4001:4097),'--');
%plot(x,est_x);
legend('original signal','lpc estimate');
figure;
plot(lags,acs);