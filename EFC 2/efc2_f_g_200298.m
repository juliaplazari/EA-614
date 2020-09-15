j = sqrt(-1); # j as the imaginary unit

#----------------------------Frequency response--------------------------------#
R = 100*10^3;
C = 1* 10^-6;
wc = 1/(R*C);

#Function to calculate the frequency response
function [H,w] = freqresponse(N,wc)
    T = 4; #period
    w0 = 2*pi/T; #fundamental frequency
    index = 1;
    for k=-N:N
        w(index) = w0*k; #frequency
        if k != 0
            H(index) = 1/(1-(j*(wc/w(index)))); #response
        else
            H(index) = 0;
        endif
        index += 1;
    endfor
endfunction

#get frequency response of the circuit
[H_jw,w50] = freqresponse(50,wc);
mod_H = abs(H_jw);
phase_H = angle(H_jw);

#graphs
figure()
stem(w50,mod_H,"markersize", 1,"filled",color="m","linestyle", "none")
xlabel("w para N=50","fontsize",14)
ylabel("Módulo de H","fontsize",14)
title("Módulo de H em função de w","fontsize",18)

figure()
stem(w50,phase_H,"markersize", 1,"filled",color="m","linestyle", "none")
xlabel("w para N=50","fontsize",14)
ylabel("Fase de H","fontsize",14)
title("Fase de H em função de w","fontsize",18)

#-------------------------Response for sawtooth wave---------------------------#
#Define the response of the circuit for the sawtooth 
#based on the number of harmonics and the frequency response
function [Y] = y(N,H)
    T = 4;
    w0 = 2*pi/T; #define fundamental frequency
    range = -2:0.002:2; #2000 samples
    index = 1;
    for t=range #for each t compute the value of y
        sum = 0;
        index2 = 1;
        for k=-N:N #for each N get the value of x(t)*H(jw)
            if(k!=0)
                sum += H(index2)*(j*(-1)^k/(k*pi))*exp(j*k*w0*t);
            endif
        index2 += 1;
        endfor
        Y(index) = sum;
        index += 1;
    endfor
endfunction

#response for 50 harmonics and H_jw (calculated above)
yt = y(50,H_jw);

t = -2:0.002:2;

#graph
figure()
plot(t,yt)
xlabel("t","fontsize",14)
ylabel("y(t)","fontsize",14)
title("y(t) para onda 'dente de serra' como entrada","fontsize",18)


