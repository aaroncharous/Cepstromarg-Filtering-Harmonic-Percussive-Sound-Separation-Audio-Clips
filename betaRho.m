function out = betaRho(y,nm,km,w)
%takes y, bin from complete spectrogram
%takes nm, n-mean
%takes km, k-mean
%takes w, weighting constant
%returns update value for percussive element
out = rho((y - nm + w*km)/(1+w),0,y);
end