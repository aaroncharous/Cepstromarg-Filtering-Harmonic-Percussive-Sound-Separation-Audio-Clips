function out = deconstruct(S)
%takes S, full 2d DFT from real-data
%returns upper half of DFT
out = S(1:floor(end/2)+1,:);
end