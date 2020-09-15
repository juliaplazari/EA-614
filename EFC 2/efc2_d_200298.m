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

#----------------------------Fourier series with N harmonics-------------------#
N01 = FourierSerie(1);
N10 = FourierSerie(10);
N20 = FourierSerie(20);
N50 = FourierSerie(50);


#--------------------------------Error energy----------------------------------#
#Calculate the energy error based on the sawooth function and its
#fourier serie approximation
#use the average as its a discrete sign
function energy = EnergyError(sawtooth,fourier) 
    T = 4; #period of 4s
    range = -2:0.002:2; #time range
    index = 1;
    dif = 0;
    for t = range #for each of the t values 
        dif += (real(sawtooth(index) - fourier(index)))^2;
        index += 1;
    endfor
    energy = dif/(T*2000); #energy of the error
end


e01 = EnergyError(sawtooth,N01);
disp("Energia do erro para 1 harmônico: "),disp(e01)
e10 = EnergyError(sawtooth,N10);
disp("Energia do erro para 10 harmônicos: "),disp(e10)
e20 = EnergyError(sawtooth,N20);
disp("Energia do erro para 20 harmônicos: "),disp(e20)
e50 = EnergyError(sawtooth,N50);
disp("Energia do erro para 50 harmônicos: "),disp(e50)




    