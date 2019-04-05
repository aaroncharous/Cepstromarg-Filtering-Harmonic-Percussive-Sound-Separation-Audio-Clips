function out = alphaRho(y,nm,km,w)
%takes y, bin from complete spectrogram
%takes nm, n-mean
%takes km, k-mean
%takes w, weighting constant
%returns update value for harmonic element
out = rho(((y - km)*w + nm)/(1+w),0,y);
end