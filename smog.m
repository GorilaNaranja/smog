
clc
clear all

trango= [0 5760]; %Rango de tiempo evaluado, 0 a 4 días (5760min)
inic=[0 ; 0 ; 0.01 ; 0.1 ; 0.1 ; 0 ; 0 ; 0 ]; %Concentraciones iniciales troposfera
[t,C]=ode15s(@fun,trango,inic); %Soluciones de C en diferentes tiempos

plot(t/60,C) %Gráfica, pasamos el tiempo de minutos a horas
xlabel('Tiempo (horas)');
ylabel('Concentración (ppm)');
legend('O3','O','NO','NO2','HCHO','OH','HO2','HNO3');
