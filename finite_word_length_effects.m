clc;
clear all;
close all;

f = [5000 5500];
a = [1 0];
dev = [0.00115062 0.001];
FT = 20000;

[N, fo, ao, w] = firpmord(f, a, dev, FT);
b = firpm(N, fo, ao, w);

[h, w] = freqz(b, 1, 512);
l = 0;
d = abs(b);
n = 6;

while fix(d) > 0
    l = l + 1;
    d = abs(b) / (2^l);
end

beq = fix(d * 2^n);
beq = sign(b) .* beq .* 2^(l - n);

[hq, w] = freqz(beq, 1, 512);

plot(w/pi, 20*log10(abs(h)), w/pi, 20*log10(abs(hq)), 'g');
hold on;
grid;
axis([0 1 -80 5]);
xlabel('\omega/\pi');
ylabel('Gain, dB');

l = 0;
d = abs(b);
n = 6;

while fix(d) > 0
    l = l + 1;
    d = abs(b) / (2^l);
end

beq = fix(d * 2^n + 0.5);
beq = sign(b) .* beq .* 2^(l - n);

[hq, w] = freqz(beq, 1, 512);

plot(w/pi, 20*log10(abs(h)), w/pi, 20*log10(abs(hq)), 'b');
hold off;
grid;
axis([0 1 -80 5]);
xlabel('\omega/\pi');
ylabel('Gain, dB');
legend('truncation', 'rounding');
