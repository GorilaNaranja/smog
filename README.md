# INTRODUCCIÓN #

  Se llama "SMOG" a la contaminación atmosférica que se produce en algunas ciudades, como resultado de la combinación de unas determinadas circunstancias climatológicas y unos contaminantes concretos.

  En muchas ciudades el principal problema de contaminación es el llamado smog fotoquímico. Con este nombre nos referimos a una mezcla de contaminantes que se forman por reacciones producidas por la luz solar. Esta mezcla oscurece la atmósfera dejando un aire teñido de color marrón rojizo cargado de componentes dañinos para los seres vivos y los materiales. Es especialmente importante en los lugares con clima seco, cálido y soleado. También es importante en las grandes ciudades que tienen un gran tránsito de vehículos,  ya que estos emiten grandes cantidades de NOx e hidrocarburos volátiles, que son el origen de este tipo de contaminación.

  Las reacciones que originan el smog fotoquímico suceden cuando la mezcla de óxidos de nitrógeno, hidrocarburos volátiles y el oxígeno atmosférico reaccionan, inducidos por la luz solar, en un complejo sistema de reacciones que acaba formando ozono.


# ANÁLISIS QUÍMICO #

  Queremos estudiar como varían las concentraciones de diferentes compuestos con el tiempo. Los contaminantes que originan el proceso son los óxidos de nitrógeno (NOx) y el formaldehido (CH2O). Como conocemos las constantes cinéticas de las ocho reacciones, podemos plantear una ecuación de velocidad para cada reacción:

Reacción Química | Ecuación de velocidad
-- | --
NO2 + hv → NO + O | r1   = k1·[NO2]
O + O2 + M → O3 + M | r2   = k2·[O]·[M]
O3 + NO → NO2 + O2 | r3   = k3·[O3]·[NO]
HCHO + 2O2 + hv → 2HO2 + CO | r4a = k4a·[HCHO]
HCHO + hv → H2 + CO | r4b = k4b·[HCHO]
HCHO + OH + O2 → HO2 + CO + H2O | r5   = k5·[HCHO]·[OH]
HO2 + NO → NO2 + OH | r6   = k6·[HO2]·[NO]
NO2 + OH → HNO3 | r7   = k7·[NO2]·[OH]

_M= catalizador en la formación de ozono con una concentración constante en la atmósfera igual a 10 ppm.
El O2 también se considera constante, por lo que su valor ya está incluido en la constante cinética (k)._

Con estas ecuaciones, podemos saber la velocidad de producción y/o consumo de los diferentes compuestos, en función de las concentraciones de sus reactivos. Una vez conocido esto, queremos analizar como varían estas concentraciones respecto al tiempo, para ello planteamos los balances de materia para cada especie, mediante un sistema de ecuaciones diferenciales. Así, la variación de la concentración de un compuesto respecto al tiempo, la podemos expresar como la velocidad a la que GENERA – CONSUME:

BALANCE DE MATERIA   |  |  |          
-- | -- | --                      
d[O3]/dt= | r2 – r3 |  k2·[O]·[M]  - k3·[O3]·[NO]
d[O]/dt= |  r1 – r2 |  k1·[NO2]  -  k2·[O]·[M]
d[NO]/dt= |  r1 – ( r3 + r6 ) |  k1·[NO2] - (k3·[O3]·[NO]  -   k6·[HO2]·[NO] )
d[NO2]/dt= |  r3 + r6 – r1 – r7    | (k3·[O3]·[NO]+k6·[HO2]·[NO])-(k1·[NO2]+k7·[NO2]·[OH])
d[HCHO]/dt= |  – r4a – r4b – r5 | - ( k4a·[HCHO] + k4b·[HCHO] + k5·[HCHO]·[OH])
d[OH]/dt= |  r6 – ( r5 + r7 ) |   k6·[HO2]·[NO] – (k5·[HCHO]·[OH] + k7·[NO2]·[OH])
d[HO2]/dt= |  (2·r4a+r5)-r6 | (2·k4a·[HCHO] + k5·[HCHO]·[OH] ) - k6·[HO2]·[NO]
d[HNO3]/dt= |  r7 | k7·[NO2]·[OH]

_Nota: Como las concentraciones de M y O2 son constantes, no necesitamos plantear sus ecuaciones de balance. Tampoco se plantean ecuaciones para el CO, H2 ni H2O._

Para este ejemplo se han definido las siguientes concentraciones iniciales:
 - CNO2 = 0,1 ppm
 - CNO = 0,01 ppm  
 - CHCHO = 0,1 ppm
 - CO2 = 0,21x106 ppm  
 - Cero para las demás especies


Los valores cinéticos de las tres reacciones de fotólisis no son constantes como habíamos asumido hasta ahora, sino que varían en función de la radiación solar. Los datos de estas tres reacciones están definidos para las 12 a.m., es decir, el momento del día con máxima radiación. Para hacer el modelo más cercano a la realidad, debemos modificar los valores de k1, k4a y k4b para que varíen con el tiempo.

Definimos un índice de radiación (radiacion) que varía entre -1 y 1 para ajustar los valores de k en función de la hora, el valor -1 corresponde a las 12 de la noche y el valor 1 corresponde a las 12 de mediodía. Suponemos que la radiación solar empieza a las 6 a.m y acabando a las 6 p.m., siendo k=0 para los otros instantes de tiempo, ya que no habrá luz y no se producirá la reacción.

_radiacion = sin( (2*pi*(t-360))/1440 )_
![](/graphics/graphic3.png)


Creamos un condicionante que compruebe si el valor de radiacion es mayor o menor a 0. Si el valor del índice de radiación es menor a 0, entonces los valores para k serán 0. Por el contrario, si el valor de índice de radiación es superior a 0, entonces multiplicaremos ese índice por el valor inicial de k, obteniendo así una variación sinusoidal de los valores de k según la hora del día.





La gráfica resultante muestra la variación escalonada de las concentraciones, debido los periodos de seis horas sin luz y seis horas con luz cambiante. Además, como el O se genera muy rápido en presencia de luz y se consume lentamente en una reacción no fotolítica, podemos ver que durante el día su concentración es muy elevada y por la noche desciende ligeramente, hasta agotarse sus reactivos y producirse solamente su consumo. El ozono presenta un aumento constante ya que su producción no esta modelada por una reacción fotolítica.

![](/graphics/graphic1.png)


Probando diferentes configuraciones de concentraciones iniciales, podemos ver como la presencia de NOx en la atmósfera es uno de los factores más importantes en la producción de ozono, ya que el NO2 se descompone dando como productos NO y O, este último en presencia de O2 genera el molesto O3 troposférico. Como primer ejemplo hemos determinado unas concentraciones de NO y NO2 en 0.001 ppm, una concentración muy baja. Los resultados muestran que la concentración de ozono no aumenta significativamente.

![](/graphics/graphic2.png)
