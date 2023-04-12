clc;clear all;
printf("############################\n##Calculadora de Correntes##\n############################\n\n");

qline = input("Quant. de linhas da matriz?\n-> ");
z = zeros(qline); # Matriz resistencia (impendancia[z])
v = zeros(qline,1); # Matriz das tensões
I = zeros(1,qline); # Matriz das correntes

for i=1:qline
  for j=1:qline
    printf("\nElemento [%d][%d]\n", i, j);
    z(i,j) = input("Impendancia: ");    
  endfor
endfor

for i=1:qline
  printf("\nTensao na %dº malha\n", i);
  v(i,1) = input("Tensao: ");
endfor

format bank;
I=inv(z)*v;
I