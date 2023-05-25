close all; clear all; clc;

v_phi = [20,30,40,62,81,101,119,138,160,182,202,220,240,260,282,310,320,330,340,350,360,370,380,390,400,410,420];

i_campo = [2,4.75,7.52,12.95,17.05,21.63,25.5,28.8,33.63,37.9,41.9,45.42,49.43,52.77,57.75,63.7,65.7,68.39,70.3,71.7,74.1,76.15,78.68,80.4,82.5,85.15,87.36];

i_campo_cc = [2.45,74,112.2,162.3,230,300,320];

i_cc = [2,70,100,150,200,250,270];

subplot(3,1,1)
plot(i_campo, v_phi, 'red')
xlabel("if [mA]")
ylabel("Vt [volt]")
title("Característica à vazio")
grid minor

subplot(3,1,2)
plot(i_campo_cc, i_cc, 'green')
xlabel("if [mA]")
ylabel("icc [mA]")
title("Ensaio em curto circuito")
grid minor

subplot(3,1,3)
plot(i_campo, v_phi, i_campo_cc, i_cc, 'red', 'green')
xlabel("if [mA]")
title("Ensaio em curto circuito x Característica à vazio")
grid minor




