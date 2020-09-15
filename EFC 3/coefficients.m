%Function that calculates the coefficients of the 
%Chebyshev's polynomial

%Parameters
            % w: frequency vector (0:0.02:20)
            % wc: cutoff frequency (rad/s)
            % n: order of the Chebyshev's filter
            
%Output Tn: vector with the coefficients (same size as the frequency vector)

function Tn = coefficients(w,wc,n)

Tn(abs(w)<wc) = cos(n.*acos(w(abs(w)<wc)./wc));
Tn(abs(w)>=wc) = cosh(n.*acosh(w(abs(w)>=wc)./wc));

endfunction
