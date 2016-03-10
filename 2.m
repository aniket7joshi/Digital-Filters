%loading the train
load('train');
p=audioplayer(y,Fs);
p.play;

%y contains the signal Fs= sampling frequency
N=size(y,1);
df=Fs/N;
w = (-(N/2):(N/2)-1)*df;
y1=fft(y(:,1));
y2=fftshift(y1);
Total=size(unique(y2));
figure;
plot(w,abs(y2));


%for a =0.001
T=0.001*max(abs(y2));
D1=y2;
D1(abs(D1)<T)=0;
U1=size(unique(D1))-1;
c1=U1/Total;
figure;
plot(w,abs(D1));

Y1=ifft(ifftshift(D1));
distort_1=100* (norm(y-Y1)*norm(y-Y1))/(norm(y)*norm(y));
%Y1=ifft(ifftshift(y2));

disp(c1)
disp( 'and distortion ratio is')
disp( distort_1 )
disp('and quality is less than others')

p1=audioplayer(Y1,Fs);
p1.play;


%a=0.01
y2=fftshift(y1);
T=0.01*max(abs(y2));
D2=y2;
D2(abs(D2)<T)=0;
U2=size(unique(D2))-1;
c2=U2/Total;
plot(w,abs(D2));
Y2=ifft(ifftshift(D2));
distort_2=100* (norm(y-Y2)*norm(y-Y2))/(norm(y)*norm(y));
disp(c2)
disp( 'and distortion ratio is')
disp( distort_2 )
disp('and quality is greater than a=0.001')

p2=audioplayer(Y2,Fs);
p2.play;


%a=0.1
y2=fftshift(y1);
T=0.1*max(abs(y2));
D3=y2;
D3(abs(D3)<T)=0;
U3=size(unique(D3))-1;
c3=U3/Total;
figure;
plot(w,abs(D3));
Y3=ifft(ifftshift(D3));
distort_3=100* (norm(y-Y3)*norm(y-Y3))/(norm(y)*norm(y));

disp(c3)
disp( 'and distortion ratio is')
disp( distort_3 )
disp('and quality is lesser than a=0.5')

p3=audioplayer(Y3,Fs);
p3.play;

%a=0.5
y2=fftshift(y1);
T=0.5*max(abs(y2));
D4=y2;
D4(abs(D4)<T)=0;
U4=size(unique(D4))-1;
c4=U4/Total;

figure;
plot(w,abs(D4));
Y4=ifft(ifftshift(D4));
distort_4=100* (norm(y-Y4)*norm(y-Y4))/(norm(y)*norm(y));
disp(c4)
disp( 'and distortion ratio is')
disp( distort_4 )
disp('and quality highest')



p4=audioplayer(Y4,Fs);
p4.play;

%completed the tresholding
% part b
% 100* norm(y-ythresh)^2/norm(y)^2;
%distort_1=100* (norm(y-D1)*norm(y-D1))/norm(y)*norm(y);
%compression_ratio=(non_zero after thresholding)/(total unique coff)

