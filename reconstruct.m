function out = reconstruct(S,n)
%takes matrix S, one quarter of a 2d DFT from real data
%takes n, #rows of original matrix
%reconstructs full spectrum such that iDFT is real
out = zeros(n,size(S,2));
if mod(n,2)==0
   out(:,1) = [S(:,1);conj(S(end-1:-1:2,1))];
   out(1:end,2:end) = [S(:,2:end);conj(S(end-1:-1:2,end:-1:2))];
else
    out(:,1) = [S(:,1);conj(S(end:-1:2,1))];
    out(1:end,2:end) = [S(:,2:end);conj(S(end:-1:2,end:-1:2))];
end
end