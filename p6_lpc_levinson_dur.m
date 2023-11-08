% DESIGNING OF A LPC FILTER USING LEVINSON-DURBIN ALGORITHM
clc;
clear;
close all;
fs = 8000;
f1 = 1000;
f2 = 2000;
N = 200;
n = 1:N;
signal = sin(2 * pi * f1 * n / fs) + 2 * sin(3 * pi * f2 * n / fs);
p = input('Enter the order of LPC filter>>> ');
[b, g] = lpc(signal, p);
imp = randn(1, N);

% Signal generated by LPC
output_signal_lpc = filter(g, b, imp);
output_signal_lpc = output_signal_lpc / max(output_signal_lpc);

% Signal generated by built-in function
output_signal_builtin = filter(g, 1, imp); % Using a direct impulse input

% Normalize both signals
output_signal_builtin = output_signal_builtin / max(output_signal_builtin);

% Plot both signals
subplot(2, 1, 1);
plot(output_signal_lpc);
title('Signal generated by LPC');

subplot(2, 1, 2);
plot(output_signal_builtin,'r');
title('Signal generated by built-in function');
