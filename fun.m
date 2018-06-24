function funcion = fun( t,C)


%Valores de k (coeficiente cinético):
k1= 0.533*10^-2; %min^-1   PARA LAS 12am
k2= 2.21*10^-5; %ppm^-2 min^-1
k3= 26.7*10^-5; %ppm^-1 min^-1
k4a=1.16*10^-3; %ppm^-2 min^-1 PARA LAS 12am
k4b=2.11*10^-3; %min^-1    PARA LAS 12am
k5= 1.62*10^4; %ppm^-2 min^-1
k6= 1.22*10^4; %ppm^-1 min^-1
k7= 1.62*10^4; %ppm^-1 min^-1
M=10;


radiacion = sin( (2*pi*(t-360))/1440 );

if radiacion>0
%k1, k4a, k4b variando con la luz del sol
kluz1 = k1*radiacion; %  >0, ki=0 para otros instantes de tiempo t
kluz4a= k4a*radiacion;
kluz4b= k4b*radiacion;
else
kluz1=0;
kluz4a= 0;
kluz4b=0;
end

%Cambio de variables
O3=C(1);
O=C(2);
NO=C(3);
NO2=C(4);
HCHO=C(5);
OH=C(6);
HO2=C(7);
%HNO3=C(8); % No se usa
