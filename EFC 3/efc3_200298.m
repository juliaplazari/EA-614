#==============================================================================#
#                     Exercício de Fixação de Conceitos                        #
#                           Filtros Analógicos                                 #
#                   Júlia Perassolli De Lázari RA: 200298                      #
#==============================================================================#

#This code uses the functions:
    #coefficients: coefficients of the Chebyshev filter
    #chebyshev_filter: frequency response of the Chebyshev filter
    #butterworth_filter: frequency response of the Butterworth filter
    #fourier_ret: fourier transform of the retangular pulse
    #ideial_filter: frequency response of the ideal filter

#for all the itens w varies from 0 to 20 rad/s
#   increments of 0.2 -> 1000 samples
w = 0:0.02:20;

#==============================================================================#
#                         Chebyshev filter                                     #
#==============================================================================#

#==============#
#      A       #
#==============#

#get the frequency response(habs vector)
#for each n (1,2,3,4,5) with fixed wc and e
#   wc = 5 rad/s
#   e = 0.2

habs_c_n1 = chebyshev_filter(w,5,0.2,1); #n = 1
habs_c_n2 = chebyshev_filter(w,5,0.2,2); #n = 2
habs_c_n3 = chebyshev_filter(w,5,0.2,3); #n = 3
habs_c_n4 = chebyshev_filter(w,5,0.2,4); #n = 4
habs_c_n5 = chebyshev_filter(w,5,0.2,5); #n = 5 

#plot
figure()
plot(w,habs_c_n1,color='r')
hold on
plot(w,habs_c_n2,color='g')
hold on
plot(w,habs_c_n3,color='b')
hold on
plot(w,habs_c_n4,color='m')
hold on
plot(w,habs_c_n5,color='y')
xlabel("w","fontsize",14)
ylabel("|Hc(jw)|","fontsize",14)
title("Filtro de Chebyshev variando a ordem (n)","fontsize",18)
legend ({"n=1", "n=2","n=3","n=4","n=5"}, "location", "southwest");
legend show

#==============#
#      B       #
#==============#

#get the frequency response(habs vector)
#for each e (0.1,0.3,0.5,0.7,0.9) with fixed wc and n
#   wc = 5 rad/s
#   n = 3

habs_c_e1 = chebyshev_filter(w,5,0.1,3); #e = 0.01
habs_c_e3 = chebyshev_filter(w,5,0.3,3); #e = 0.03
habs_c_e5 = chebyshev_filter(w,5,0.5,3); #e = 0.05
habs_c_e7 = chebyshev_filter(w,5,0.7,3); #e = 0.07
habs_c_e9 = chebyshev_filter(w,5,0.9,3); #e = 0.09

#plot
figure()
plot(w,habs_c_e1,color='r')
hold on
plot(w,habs_c_e3,color='g')
hold on
plot(w,habs_c_e5,color='b')
hold on
plot(w,habs_c_e7,color='m')
hold on
plot(w,habs_c_e9,color='y')
xlabel("w","fontsize",14)
ylabel("|Hc(jw)|","fontsize",14)
title("Filtro de Chebyshev variando o ganho de frequência (e)","fontsize",18)
legend ({"e=0.1", "e=0.3","e=0.5","e=0.7","e=0.9"}, "location", "southwest");
legend show

#==============================================================================#
#                        Butterworth filter                                    #
#==============================================================================#

#==============#
#      C       #
#==============#

#get the frequency response(habs vector) 
#for each n (fixed wc = 5 rad/s)

habs_b_n1 = butterworth_filter(w,5,1); #n = 1
habs_b_n2 = butterworth_filter(w,5,2); #n = 2
habs_b_n3 = butterworth_filter(w,5,3); #n = 3
habs_b_n4 = butterworth_filter(w,5,4); #n = 4
habs_b_n5 = butterworth_filter(w,5,5); #n = 5


#plot
figure()
plot(w,habs_b_n1,color='r')
hold on
plot(w,habs_b_n2,color='g')
hold on
plot(w,habs_b_n3,color='b')
hold on
plot(w,habs_b_n4,color='m')
hold on
plot(w,habs_b_n5,color='y')
xlabel("w","fontsize",14)
ylabel("|HB(jw)|","fontsize",14)
title("Filtro de Butterworth variando a ordem (n)","fontsize",18)
legend ({"n=1", "n=2","n=3","n=4","n=5"}, "location", "southwest");
legend show

#==============================================================================#
#                         Retangular pulse                                     #
#==============================================================================#

#==============#
#      D       #
#==============#

#get the fourier transform of the retangular pulse
#with wc = 5 rad/s

X_jw = abs(fourier_ret(w,5)); #use the absolute value

#plot
figure()
plot(w,X_jw,color='r')
xlabel("w","fontsize",14)
ylabel("|X(jw)|","fontsize",14)
title("Módulo da transformada de fourier de x(t)","fontsize",18)

#==============================================================================#
#                            Ideal filter                                      #
#==============================================================================#

#==============#
#      E       #
#==============#

#get the response of the ideal filter
#with wc = 5 rad/s
H_ideal = ideal_filter(w,5);

#filter the X_jw (fourier transform of the retangular pulse)
#with the ideal filter (H_ideal)
index = 1;
for i=w
    Y_ideal(index) = H_ideal(index)*X_jw(index); #Y(jw) module of the output
    index += 1;
endfor

#plot
figure()
plot(w,Y_ideal,color='b')
xlabel("w","fontsize",14)
ylabel("|Yideal(jw)|","fontsize",14)
title("Módulo da saída obtida |Yideal(jw)|=|Hideal(jw)| |X(jw)|","fontsize",18)

#==============================================================================#
#                            Chebyshev filter                                  #
#==============================================================================#

#==============#
#      F       #
#==============#

#get the frequency response of the Chebyshev filter with
    #wc = 5 rad/s 
    #n = 3
    #e = 0.9
H_C = chebyshev_filter(w,5,0.9,3);

#filter the X_jw (fourier transform of the retangular pulse)
#with the Chebyshev filter (H_C)
index = 1;
for i=w
    Y_C(index) = H_C(index)*X_jw(index);
    index += 1;
endfor

#plots
#frequency response H_C
figure()
plot(w,H_C,color='r')
xlabel("w","fontsize",14)
ylabel("|H_C(jw)|","fontsize",14)
title("Resposta em frequência do filtro de Chebyshev |H_C(jw)|","fontsize",18)

#output Y_C(jw) = (H_C(jw))(X(jw))
figure()
plot(w,Y_C,color='b')
xlabel("w","fontsize",14)
ylabel("|Y_C(jw)","fontsize",14)
title("Módulo do espectro da saída |Y_C(jw)|","fontsize",18)

#==============================================================================#
#                            Butterworth filter                                #
#==============================================================================# 
 
#==============#
#      G       #
#==============#

#get the frequency response of the Butterworth filter with
    #wc = 5 rad/s 
    #n = 2
H_B = butterworth_filter(w,5,2);

#filter the X_jw (fourier transform of the retangular pulse)
#with the Butterworth filter (H_B)
index = 1;
for i=w
    Y_B(index) = H_B(index)*X_jw(index);
    index += 1;
endfor

#plots
#frequency response H_B
figure()
plot(w,H_B,color='r')
xlabel("w","fontsize",14)
ylabel("|H_B(jw)|","fontsize",14)
title("Resposta em frequência do filtro de Butterworth |H_B(jw)|","fontsize",18)

#output Y_jw = (H_C)(X_jw)
figure()
plot(w,Y_B,color='b')
xlabel("w","fontsize",14)
ylabel("|Y_B(jw)","fontsize",14)
title("Módulo do espectro da saída |Y_B(jw)|","fontsize",18)

#==============================================================================#
#                                Compare filters                               #
#==============================================================================# 

#==============#
#      H       #
#==============#

#Compare the frequency response of the filters (ideal, Chebyshev and Butterworth)
figure()
plot(w,H_ideal,color='b')
hold on
plot(w,H_C, color ='g')
hold on
plot(w,H_B, color ='r')
xlabel("w","fontsize",14)
ylabel("|H(jw)|","fontsize",14)
title("Resposta em frequência dos filtros |H(jw)|","fontsize",18)
legend ({"Ideal", "Chebyshev","Butterworth"}, "location", "northeast");
legend show

#Compare the output of the filters (ideal, Chebyshev and Butterworth)
figure()
plot(w,Y_ideal,color='b')
hold on
plot(w,Y_C, color ='g')
hold on
plot(w,Y_B, color ='r')
xlabel("w","fontsize",14)
ylabel("|Y(jw)|","fontsize",14)
title("Módulo do espectro de saída dos filtros |Y(jw)|","fontsize",18)
legend ({"Ideal", "Chebyshev","Butterworth"}, "location", "northeast");
legend show

