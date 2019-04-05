%% Cepstromarg Filtering

%load audio data and make mono
[pp2,fs] = audioread('piano_percussion.wav');
pp = pp2(:,1);
wl = 2^12; %set window length
win = hann(wl);
fm = 2^9; %set frame size
[z3,z4,ppS] = spect(pp,win,fm); %create spectrogram

fs = 44.1e3;
freq = (0:(wl-1))*fs/wl;
freq = freq(1:end/2+1);
time = linspace(0,1/fs*length(pp),size(ppS,2));

n1 = size(ppS,1);
ftpp = fft2(abs(ppS)); %create cepstromarg

df = fs/wl;
time2 = (-(n1-1)/2:(n1-1)/2)/(df*n1); %zero-centered time
T2 =time(2)-time(1);
%zero-centered frequency
freq2 = (-size(ppS,2)/2:size(ppS,2)/2-1)/(T2*size(ppS,2));

%contour of cepstromarg
figure
pcolor(freq2,time2,fftshift(fftshift((abs(ftpp)),1),2))
xlabel('Frequency [Hz]')
ylabel('Time [s]')
title('Magnitude Cepstromarg')
shading interp
colormap jet
colorbar

ftpp = deconstruct(ftpp); %get rid of redundant half of spectromarg

[n,m] = size(ftpp);
[v,h] = filt1(n,m); %generate filter
[v2,h2] = filtLow(n,m);
%get rid of redundant half of cepstromarg
ftppPart = deconstruct(fft2(abs(ppS)));

%filter
harm = v.*ftppPart;
perc = h2.*ftppPart;

%add back redundancies for inversion
harmFull = reconstruct(harm,n1);
percFull = reconstruct(perc,n1);

%invert back to spectrogram
harmRe = ifft2(harmFull);
percRe = ifft2(percFull);

%find mode to add back DC component
[N,edges] = histcounts(harmRe,1e4);
[mx,in] = max(N);
mh = (edges(in) + edges(in+1))/2; %midpoint of edges with maximum
harmRe = harmRe - mh;
percRe= percRe + mh;

%wiener filtering and add back phase
[harmReW,percReW] = wiener(abs(harmRe).^2,abs(percRe).^2,ppS);

%invert to time domain using overlap-add
harmFinal = istft(harmReW,'hann',fm,z3,z4);
percFinal = istft(percReW,'hann',fm,z3,z4);

%% Second Stage
[xha,xva,Va1,Ha] = separate(harmFinal,'hann',2^13,2^12,1,.5,1,10,.1);