j = sqrt(-1); #j as the imaginary unit

#---------------------------------Fourier funcion------------------------------#
#Define a function to compute the Fourier series for the sawtooth wave
#with a period of 4s
#Parameter N => number of harmonics

function [fourierserie] = FourierSerie(N)
    T = 4;
    w0 = 2*pi/T; #define fundamental frequency
    range = -2:0.002:2; #2000 samples
    index = 1;
    for t=range #for each k compute the value of the sum
        sum = 0;
        for k=-N:N #for each N, get the fourier serie
            if(k!=0)
                sum += (j*(-1)^k/(k*pi))*exp(j*k*w0*t);
            endif
        endfor
        fourierserie(index) = sum;
        index += 1;
    endfor
endfunction

#-------------------------------Sawtooth function------------------------------#
T = 4;
t = -2:0.002:2;
sawtooth = (2/T)*t;#define the sawtooth wave as T/2 t for the time range (-2<t<2)

#--------------------Graphs for fourier series with N harmonics----------------#
N01 = FourierSerie(1);
N10 = FourierSerie(10);
N20 = FourierSerie(20);
N50 = FourierSerie(50);

figure()
plot(t,sawtooth,color="b")
hold on
plot(t,N01,color = "r")
xlabel("t", "fontsize",16)
ylabel("x(t)", "fontsize",16)
title("Aproximação da série de Fourier com 1 harmônico","fontsize",22)

figure()
plot(t,sawtooth,color="b")
hold on
plot(t,N10,color = "r")
xlabel("t", "fontsize",16)
ylabel("x(t)", "fontsize",16)
title("Aproximação da série de Fourier com 10 harmônicos","fontsize",22)

figure()
plot(t,sawtooth,color="b")
hold on
plot(t,N20,color = "r")
xlabel("t", "fontsize",16)
ylabel("x(t)", "fontsize",16)
title("Aproximação da série de Fourier com 20 harmônicos","fontsize",22)

figure()
plot(t,sawtooth,color="b")
hold on
plot(t,N50,color = "r")
xlabel("t", "fontsize",16)
ylabel("x(t)", "fontsize",16)
title("Aproximação da série de Fourier com 50 harmônicos","fontsize",22)


