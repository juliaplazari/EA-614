%Function that calculates the frequency response of
% the Chebyshev filter

%Parameters
            % w: frequency vector (0:0.02:20)
            % wc: cutoff frequency (rad/s)
            % e: cutoff frequency gain
            % n: order of the Chebyshev's filter
            
%Output Habs: vector with the frequency response to the filter


function [Habs] = chebyshev_filter(w,wc,e,n)
index = 1;

for w=w
    Tn = coefficients(w,wc,n); #call coeffientes function
    Habs(index) = 1/(sqrt(1+(e^2)*(Tn^2)*(w/wc))); #calculate Habs
    index += 1;
endfor
endfunction




