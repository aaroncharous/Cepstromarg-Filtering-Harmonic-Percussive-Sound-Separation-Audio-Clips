function nm = nMean(S,n,k,M)
%takes spectrogram S, each column is a spectrum
%takes n, time index
%takes k, frequency index
%takes M, # of points to consider in mean
%returns time-mean for S(k,n)
% nm = mean([S(k,max(1,n-M):max(n-1,0)),S(k,min(n+1,end+1):min(n+M,end))]);
count = 0;
s = size(S,2);
nm = 0;
for i = n-M:n+M
    if (i~=n) && (i>0) && (i<=s)
        nm = nm + S(k,i);
        count = count + 1;
    end
end
nm = nm/count;
end