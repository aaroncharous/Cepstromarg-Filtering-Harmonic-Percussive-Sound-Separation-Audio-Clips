function [H,P] = updateS1a(Y,H,P,M,w)
%takes Y, total spectrogram
%takes H, harmonic spectrogram
%takes P, percussive spectrogram
%takes M, number of neighbor bins on either side considered in mean
%takes w, weighting constant
%updates each element of H and P one iteration
%returns new H and P
%implements HPSS1-A
[lk,ln] = size(Y);
for k = 1:lk
    for n = 1:ln
        nm = nMean(H,n,k,M);
        km = kMean(P,n,k,M);
        nmkm = (nm+1)^2 + (km+1)^2; %handle division by zero
        if nmkm == 0
            H(k,n) = -1; %corresponds to zero in magnitude domain
            P(k,n) = -1; 
        else
            H(k,n) = -1+(nm+1)*(1+Y(k,n))/sqrt(nmkm);
            P(k,n) = -1+(km+1)*(1+Y(k,n))/sqrt(nmkm);
        end
    end
end
end