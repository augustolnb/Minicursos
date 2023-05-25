clear all; clc;
%matriz admitância
y =[-9.8i, 0, 4i, 5i; 0, -8.3i, 2.5i, 5i; 4i, 2.5i, -15.3i, 8i; 5i, 5i, 8i, -18i];
%invertendo a matriz admitancia
%encontramos a matriz impendancia
z = inv(y);
%vetor corrente eletrica
i = [-1.2i; -0.72-0.96i; -1.2i; 0];
%produto da matriz impendancia com
%o vetor corrente
%resulta o vetor tensão elétrica
v = z * i;

for i = 1:4
    j = v(i);
    
    modulo = abs(j); %calculo do modulo do valor complexo
    fase = (atan(imag(j)/real(j))) * 180 / pi; %calculo da fase e conversao para graus
    
    printf("V(%i):\n", i)
    modulo
    fase 
    printf("\n"); 
    
endfor