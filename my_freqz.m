function [db,mag,pha,grp,w]=my_freqz(b,a)
[H,w]=freqz(b,a,1000,'whole');
H=(H(1:501))';
w=(w(1:501))';
mag=abs(H);
db=20*log10((mag+eps)/max(mag));
pha=angle(H);
grp=grpdelay(b,a,w);