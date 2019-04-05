function [xh,xp,H,P] = separate(x,winStr,lw,fM,M,gamma,w,I,mu)
%takes x, audio
%takes winStr, window name
%takes lw, length of window
%takes fM, frame shift
%takes M, number of neighbor bins to consider
%takes gamma, exponential of spectrogram
%takes w, weighting factor
%takes I, number of updates
%takes mu, parameter relevant for updateS2
%returns harmonic audio, percussive audio
%returns harmonic spectrogram, percussive spectrogram
if strcmp(winStr,'hann')
    win = hann(lw);
elseif strcmp(winStr,'hamming')
    win = hamming(lw);
else
    error('use hann or hamming window')
end
[zbg,zend,Y] = spect(x,win,fM);
Yg = abs(Y).^gamma;
% Yg = sqrt(2*abs(Y))-1;
% H = sqrt(1+abs(Y).^2)/sqrt(2) - 1;
% P = H;
H = Yg/(2^gamma);
P = H;
for ind = 1:I
    [H,P] = updateS1b(Yg,H,P,M,w); %updateS1a(Yg,H,P,M,w); updateS2(Yg,H,P,M,w,mu);
end
H = H.^(1/gamma);
P = P.^(1/gamma);

[H,P] = binaryMask(H,P,Y);
% H = 1/2 + H + H.^2/2;
% P = 1/2 + P + P.^2/2;
% ce = Y./abs(Y);
% ce(isnan(ce)) = 0; %catch division by zero
% xh = istft(H.*ce,winStr,fM,zbg,zend);
% xp = istft(P.*ce,winStr,fM,zbg,zend);

% [H,P] = wiener(H.^2,P.^2,Y);
xh = istft(H,winStr,fM,zbg,zend);
xp = istft(P,winStr,fM,zbg,zend);
end