%Function that calculates the frequency response of
% the Butterworth filter

%Parameters
            % w: frequency vector (0:0.02:20)
            % wc: cutoff frequency (rad/s)
            % n: order of the Butterworth's filter
            
%Output Habs: vector with the frequency response to the filter


function [Habs] = butterworth_filter(w,wc,n)
index = 1;

for w=w
    Habs(index) = 1/(sqrt(1+(w/wc)^(2*n))); #calculate Habs
    index += 1;
endfor
endfunction

