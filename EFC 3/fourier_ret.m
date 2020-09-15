%Function that calculates the Fourier transform
% for x(t) retangular

%Parameters
            % w: frequency vector (0:0.02:20)
            % wc: cutoff frequency (rad/s)
            
%Output X: fourier transform


function [X] = fourier_ret(w,wc)
index = 1;

for w=w #fourier transform for each value of w
    X(index) = (2/w)*sin(pi*w/wc); 
    index += 1;
endfor
endfunction


