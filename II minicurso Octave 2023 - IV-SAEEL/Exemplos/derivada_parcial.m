clc;

v1 = sym("v1");
theta1 = sym("theta1");

h = -0.15-21*(0.33*v1+(-0.33*cos(theta1)+2.9*sin(theta1)));

diff(h, v1)

