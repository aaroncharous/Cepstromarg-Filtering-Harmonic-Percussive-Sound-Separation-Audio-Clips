function km = kMean(S,n,k,M)
%takes spectrogram S, each column is a spectrum
%takes n, time index
%takes k, frequency index
%takes M, # of points to consider in mean
%returns frequency-mean for S(k,n)
% km = mean([S(max(1,k-M):max(k-1,0),n);S(min(k+1,end+1):min(k+M,end),n)]);
count = 0;
s = size(S,1);
km = 0;
for i = k-M:k+M
    if (i~=k) && (i>0) && (i<=s)
        km = km + S(i,n);
        count = count + 1;
    end
end
km = km/count;
end