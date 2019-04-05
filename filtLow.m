function [vert,horz] = filtLow(n,m)
%takes number of rows and columns
%returns filters to filter out vertical
%and horizontal features by using a 45 degree division
vert = zeros(n,m);
vert(1,1) = 1/2;
vert(2:end,1) = 1;
fm = floor(m/2)+1;
vert(3:end,2:end) = 1;
horz = 1 - vert;
end