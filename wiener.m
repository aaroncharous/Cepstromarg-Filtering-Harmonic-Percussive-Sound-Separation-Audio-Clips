function [H,P] = wiener(H,P,Y)
%takes spectrograms H,P,Y
%returns weiner filtered spectrograms
%for H and P with the phase of Y
m = H./(H+P);
m(isnan(m)) = 1/2; %if H and P are zero, split the spectrum evenly
H = m.*Y;
P = (1-m).*Y;
end