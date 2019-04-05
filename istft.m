function x = istft(S,winStr,fM,zbg,zend)
%takes S, spectrogram/stft up to nyquist frequency which should have
%at least one window of zeros padded at beginning and end
%takes winStr, name of window used (hanning or hamming
%takes fM, frame shift
%takes zbg, number of zeros at beginning to cut out
%takes zend, number of zeros at end to cut out
%returns istft/inversts spectrogram back to time domain via overlap add
%note that there is a little added noise since sum of windows is not
%exactly constant for finite number of points in window
[lw,nFrames] = size(S);
lw = (lw-1)*2;
r = lw/fM; %overlap ratio
if strcmp(winStr,'hann')
    amp = r/2;
elseif strcmp(winStr,'hamming')
    amp = 1.08*r/2;
else
    error('use hann or hamming window')
end
x = zeros(lw + nFrames*fM,1);
for ind = 1:nFrames
    st = fM*(ind-1)+1;
    x(st:st+lw-1) = x(st:st+lw-1) + ifft([S(:,ind);conj(S(end-1:-1:2,ind))]);
end
x = x(zbg+1:end-zend);
x = 1/amp*x;
end