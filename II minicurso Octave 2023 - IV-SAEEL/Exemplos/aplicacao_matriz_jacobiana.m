clc; close; clear all;
x0 = [0;0;1]; #matriz de incógnitas, com o valores inicias definidos
#syms theta1 theta3 v1
# tolerancia aceita
tolerancia = 1e-3;
# funções (P1, P3 e Q1)
p1 = @(theta1, v1) (-0.15-v1*(0.33*v1+(-0.33*cos(theta1)+2.9*sin(theta1))));
p3 = @(theta3) (0.2-(0.077+(-0.077*cos(theta3)+1.22*sin(theta3))));
q1 = @(theta1, v1) (0.05-v1*(3.21*v1+(-0.33*sin(theta1)-2.9*cos(theta1))));
# montagem da matriz jacobiana


#f=inline(ff, "theta1", "theta3", "v1");
#fj=inline(fjacob, "theta1", "theta3", "v1");



