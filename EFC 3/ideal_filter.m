%Function that calculates the frequency response of
% an ideal filter

%Parameters
            % w: frequency vector (0:0.02:20)
            % wc: cutoff frequency (rad/s)
            
%Output Hideal: vector with the frequency response to the filter


function [Hideal] = ideal_filter(w,wc)
index = 1;
for w=w
    if (w<wc) #if frequency < cutoff frequency
        Hideal(index) = 1; #response is 1
    else #otherwise
        Hideal(index) = 0; #response is 0
    endif
    index += 1;
endfor
endfunction
    
