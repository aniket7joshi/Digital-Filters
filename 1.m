
% reading the input audio file
[y,Fs]=audioread('signal_0.wav');
%f is the frequency and fs is the sampling rate


pOrig=audioplayer(y,Fs);
pOrig.play;

df=Fs/N;
w = (-(N/2):(N/2)-1)*df;

y1=fft(y(:,1));
y2=fftshift(y1);

figure;
N=size(y,1);
stem(1:N,y(:,1)); 

Total=size(unique(y2));

%for thresholding the value of a=0.009
[y, Fs] = audioread('signal_0.wav');
T=0.009*max(abs(y2));
D1=y2;
D1(abs(D1)<T)=0;
figure;
plot(w,abs(D1));

Y1=ifft(ifftshift(D1));

%using thresholding and eliminating the higher frequencies 

sound(y1, Fs);
%y contains the signal Fs= sampling frequency

