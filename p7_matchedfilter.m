% DESIGN AND VERIFICATION OF MATCHED FILTER
clc;clear all;close all;

load n_418.mat;
tmplt=n_418(1:1000);
plot(tmplt);
% load wav.mat
% tmplt=real(wav);
subplot(311);plot(tmplt);
title('Channel ECG');
ylabel('ECG');
axis tight;

%% Creating a matched filter
mtch_filt=wrev(tmplt);
subplot(312);plot(mtch_filt);
axis tight;
title('Matched filter input');
xlabel('Delay in Seconds');

Nu=mtch_filt;
De=[1 0];



hd1=dfilt.df2(Nu,De);
c=filter(hd1,tmplt);  %% F3 channel
subplot(313);plot(c);
axis tight;
title('Output of Matched Filter');
xlabel('Delay in Seconds');
% Peak(down) in original and peak(up) indicate 
% the presence of spike-and-wave complexes in EEG
% Matched filter causes a lag in the output (i.e to make the signal as
% causal