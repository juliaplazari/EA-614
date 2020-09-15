j = sqrt(-1); #j as the imaginary unit

#-----------------------Ak coefficientes for Fourier serie---------------------#
#ak coefficientes for the sawtooth wave
function [ak] = Ak(N)
    index = 1;
    for k=-N:N #for each k get the ak coefficient
        if k!=0
            ak(index) = abs((j*(-1)^k/(k*pi))); #|ak| 
        endif
        index += 1;
    endfor
endfunction


#------------------------------W for 50 harmonic-------------------------------#
#W = w0*k
function [w] = W(N)
    T = 4; #period
    w0 = 2*pi/T; #fundamental frequency
    index = 1;
    for k=-N:N #for each k get W
        w(index) = w0*k;
        index += 1;
    endfor
endfunction

#--------------------Ak coefficients and W for 50 harmonics--------------------#
ak50 = Ak(50); #ak coefficients for 50 harmonics
w50 = W(50); #W for 50 harmonics

figure()
stem(w50,ak50,"markersize", 1,"filled",color="m","linestyle", "none")
xlabel("W","fontsize",14)
ylabel("Ak","fontsize",14)
title("|ak| em função de w","fontsize",18)


