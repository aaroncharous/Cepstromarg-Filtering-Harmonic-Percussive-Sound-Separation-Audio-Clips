function [vert,horz] = filt1(n,m)
%takes number of rows and columns
%returns filters to filter out vertical
%and horizontal features
vert = zeros(n,m);
vert(1,1) = 1/2;
vert(2:end,1) = 1;
fm = floor(m/2)+1;
for j = 2:fm
    vert(45*j:end,j) = 1;
    vert(45*j:end,end+2-j)= 1;
end
horz = 1 - vert;
end