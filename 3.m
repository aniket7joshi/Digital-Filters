
%spectrogram inbuilt
%for train 
prompt = 'enter the window size ';
window_size = input(prompt)
prompt = 'enter the stride value ';
stride = input(prompt)

disp('spectrogram for train inbuilt');
load('train');
%window length
window=hamming(512);
noverlap=256;
nfft=1024;
%size of the fft
figure;
[S,F,T,P]=spectrogram(y,window,noverlap,nfft,Fs,'yaxis');

%inbuilt spectrogram

surf(T,F,10*log10(P),'edgecolor','none');axis tight; view(0,90);
colormap(hot);
set(gca,'clim',[-80,-30]);
xlabel('Temps (Seconds)');ylabel('Frequency Hz');
 

%spectrogram using stft

load('train');
 window=hamming(512);
 noverlap=256;
 nfft=1024;%size of the fft
x=y;
fs=Fs;
[N xcol] = size(x);
if N < xcol
x = x';
% Insure that the input is a row vector 
N = xcol;
%    (if not already)
end  
incr = nfft -noverlap; 
% Calculate window increment
hwin = fix(nfft/2);
% Half window size
f = (1:hwin)*(fs/nfft);  
% Calculate frequency vector
%
x_mod = [zeros(hwin,1); x; zeros(hwin,1)];
% Zero pad data array for edge effects
%
j = 1;
% Used to index output and time vector
for i = 1:incr:N  % Calculate spectra for each window position  
data = x_mod(i:i+nfft-1) .* hanning(nfft); 
%Apply Hanning window
ft = abs(fft(data));
% Magnitude data
sp(:,j) = ft(1:hwin);   
% Limit spectral points
% calculate the time and frequency vectors
t(j) = i/fs;
% Calculate time vector
j = j + 1;
% Increment index
end
% spectrogram 
figure;
imagesc(f,t,abs(sp));
%surf(t,f,10*log10(P),'edgecolor','none');axis tight; view(0,90);
colormap(hot);
xlabel('Temps (Seconds)');ylabel('Frequency Hz');


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%for laughter 
prompt = 'enter the window size for laughter ';
window_size = input(prompt)
prompt = 'enter the stride value  for laughter';
stride = input(prompt)

disp('spectrogram for laughter inbuilt');
load('laughter');
%window length
window=hamming(512);
noverlap=256;
nfft=1024;
%size of the fft
figure;
[S,F,T,P]=spectrogram(y,window,noverlap,nfft,Fs,'yaxis');

%inbuilt spectrogram

surf(T,F,10*log10(P),'edgecolor','none');axis tight; view(0,90);
colormap(hot);
%changes the color for better understanding
set(gca,'clim',[-80,-30]);
xlabel('Temps (Seconds)');ylabel('Frequency Hz');
 

%spectrogram using stft matlab script

load('laughter');
 window=hamming(512);
 noverlap=256;
 nfft=1024;%size of the fft
x=y;
fs=Fs;
[N xcol] = size(x);
if N < xcol
x = x';
% Insure that the input is a row vector 
N = xcol;
%    (if not already)
end  
incr = nfft -noverlap; 
% Calculate window increment
hwin = fix(nfft/2);
% Half window size
f = (1:hwin)*(fs/nfft);  
% Calculate frequency vector
%
x_mod = [zeros(hwin,1); x; zeros(hwin,1)];
% Zero pad data array for edge effects
%
j = 1;
% Used to index output and time vector
for i = 1:incr:N  % Calculate spectra for each window position  
data = x_mod(i:i+nfft-1) .* hanning(nfft); 
%Apply Hanning window
ft = abs(fft(data));
% Magnitude data
sp(:,j) = ft(1:hwin);   
% Limit spectral points
% calculate the time and frequency vectors
t(j) = i/fs;
% Calculate time vector
j = j + 1;
% Increment index
end
% spectrogram 
figure;
imagesc(f,t,abs(sp));
%surf(t,f,10*log10(P),'edgecolor','none');axis tight; view(0,90);
colormap(hot);
%changes the color for better understanding
xlabel('Temps (Seconds)');ylabel('Frequency Hz');
