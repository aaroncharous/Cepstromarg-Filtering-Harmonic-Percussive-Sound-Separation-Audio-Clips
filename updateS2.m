function [H,P] = updateS2(Y,H,P,M,w,mu)
%takes Y, total spectrogram
%takes H, harmonic spectrogram
%takes P, percussive spectrogram
%takes M, number of neighbor bins on either side considered in mean
%takes w, weighting constant
%takes mu, parameter
%updates each element of H and P one iteration
%returns new H and P
%implements HPSS2
mup = mu/w;
a1 = 2 + mu;
a2 = 2 + mup;
theta = H.^2./(H.^2 + P.^2);
theta(isnan(theta)) = 0; %handle division by zero
c1 = mu*theta.*Y.^2;
c2 = mup*(1-theta).*Y.^2;
[lk,ln] = size(Y);
for k = 1:lk
    for n = 1:ln
        b1(k,n) = nMean(H,n,k,M);
        b2(k,n) = kMean(P,n,k,M);
    end
end
H = (b1 + sqrt(b1.^2 + a1*c1))/a1;
P = (b2 + sqrt(b2.^2 + a2*c2))/a2;
end
