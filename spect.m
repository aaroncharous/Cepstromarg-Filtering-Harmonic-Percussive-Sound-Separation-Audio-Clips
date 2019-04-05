function [zbg,zend,S] = spect(x,win,fM)
%takes x, audio data
%takes win, window with length(win) < length(x)
%takes fM, frame shift, where length(win) is integer multiple of fM
%returns spectrogram with zero padding at beginning and end
%up to Nyquist frequency
%returns number of zeros to cut off at beginning and end
lw = length(win);
zbg = lw;
zend = lw + fM - mod(length(x),fM);
x = [zeros(zbg,1);x;zeros(zend,1)]; %zero pad
nFrames = length(x)/fM - lw/fM;
S = zeros(lw/2+1,nFrames);
for ind = 1:nFrames
    st = fM*(ind-1)+1;
    ft = fft(win.*x(st:st+lw-1));
    S(:,ind) = ft(1:end/2+1);
end
end