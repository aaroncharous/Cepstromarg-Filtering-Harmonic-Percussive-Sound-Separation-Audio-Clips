function [H,P] = updateS1b(Y,H,P,M,w)
%takes Y, total spectrogram
%takes H, harmonic spectrogram
%takes P, percussive spectrogram
%takes M, number of neighbor bins on either side considered in mean
%takes w, weighting constant
%updates each element of H and P one iteration
%returns new H and P
%implements HPSS1-B
[lk,ln] = size(Y);
for k = 1:lk
    for n = 1:ln
        nm = nMean(H,n,k,M);
        km = kMean(P,n,k,M);
        H(k,n) = alphaRho(Y(k,n),nm,km,w);
        P(k,n) = betaRho(Y(k,n),nm,km,w);
    end
end
end