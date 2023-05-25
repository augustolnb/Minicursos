% Programa para cálculo de correntes de falta
% Calculo de curto circuito utilizando matrizes para sistemas com N barras
% Testado com Octave 7.1.0
% Desenvolvido por: Lucas Augusto Nunes de Barros
% Estudante de Engenharia Elétrica - IFTO
% Código desenvolvido para disciplina de Análise de Sistemas de Potência I
% v01 19/06/2022

clc;close;clear all;

printf("\n\t   Calculadora de faltas\n\tUtilizando método das matrizes\n\n\t* Considerar matrizes \n\t  de seq+ e seq- iguais\n\n");
v = 1;
j = complex(0, 1);
#n_barras = input("\nNúmero de barras no circuito: ");
n_barras = 3;
y_sp = ones(n_barras);
y_sn = ones(n_barras);
y_sz = ones(n_barras);

##############################
## preenchimento automatico, apagar no final#
##############################

#y_sp = [-100, 20, 40, 33.33, 0, 0, 0;20, -126, 40, 0, 33.33, 0, 33.33;40, 40, -113.33, 0, 0, 33.33, 0; 33.33, 0, 0, -40, 0, 0, 0; 0, 33.33, 0, 0, -43.44, 0, 0; 0, 0, 33.33, 0, 0, -43.44, 0;0, 33.33, 0, 0, 0, 0, -43.33];
#y_sn = [-100, 20, 40, 33.33, 0, 0, 0;20, -126, 40, 0, 33.33, 0, 33.33;40, 40, -113.33, 0, 0, 33.33, 0; 33.33, 0, 0, -40, 0, 0, 0; 0, 33.33, 0, 0, -43.44, 0, 0; 0, 0, 33.33, 0, 0, -43.44, 0;0, 33.33, 0, 0, 0, 0, -43.33];
#y_sz = [-200000, 6.67, 13.33, 0, 0, 0, 0; 6.67, -56.67, 13.33, 0, 0, 0, 0;13.33, 13.33, -200000, 0, 0, 0, 0;0, 0, 0, -14.29, 0, 0, 0;0, 0, 0, 0, -20, 0, 0; 0, 0, 0, 0,0, -20, 0; 0, 0, 0, 0, 0, 0,-20];

y_sp = [-65.55, 20, 40; 20, -75.38, 40;40, 40, -87.7];
y_sn = [-65.55, 20, 40; 20, -75.38, 40;40, 40, -87.7];
y_sz = [-25.5, 15, 7.5; 15, -28.5, 7.5;7.5, 7.5, -18];

##############################
####Sequencia positiva
#printf("\nMatrizes de sequência positiva e negativa:\n\tMatriz impedancia");
#for i=1:n_barras
#    printf("\n%dª linha:\n", i);
#    for k=1:n_barras
#    printf("Elemento [%d][%d]: ", i, k);
#    y_sp(i, k) = input("");
#    y_sn(i, k) = y_sp(i, k);
#    if((i == k && y_sp(i,k) == 0) || (i == k && y_sn(i,k) == 0))
#        printf("\nA diagonal principal não deve ter valores nulos\n");
#        break
#    endif
#    endfor
#endfor

####Sequencia zero
#printf("\n\n\tMatriz de sequência zero:\n");
#for i=1:n_barras
#    printf("\n%dª linha:\n", i);
#    for k=1:n_barras
#    printf("Elemento [%d][%d]: ", i, k);
#    y_sz(i, k) = input("");
#    if(i == k && y_sz(i,k) == 0)
#        printf("\nA diagonal principal não deve ter valores nulos\n");
#        break
#    endif
#    endfor
#endfor

z_sp = inv(y_sp*j);
z_sn = inv(y_sn*j);
z_sz = inv(y_sz*j);

### calculo de curto circuito monofasico sem impedancia de falta
### falta monofasica: componentes de corrente iguais

i_sequencia = zeros(n_barras, 1);
i_real = zeros(n_barras, 1);

## calculos das componentes de sequencia
for x=1:n_barras
    i_sequencia(x,1) = v/(z_sp(x,x)+z_sn(x,x)+z_sz(x,x));
endfor

printf("\nCorrente de sequencia:\n");

for i=1:3
    printf("Barra %d: %.2f\n", i, abs(i_sequencia(i)));
endfor

## calculos das correntes reais
for x=1:n_barras
    i_real(x,1) = 3 * i_sequencia(x,1);
endfor

printf("\nCorrentes reais [pu]:\n");

for i=1:3
    printf("Barra %d: %.2f\n", i, abs(i_real(i)));
endfor

## Registro dos resultados no arquivo corrente.txt
correntes = fopen("correntes.txt", "w");
fputs(correntes, "\n\tRegistro dos valores de corrente para faltas monofasicas\n\n");
fputs(correntes, "\n\tCorrentes de sequencia:\n\n");
for x=1:n_barras
    fputs(correntes, num2str(i_sequencia(x,1)));
    fputs(correntes, "\n");
endfor

fputs(correntes, "\n\tCorrentes reais [pu]:\n\n");
for x=1:n_barras
    fputs(correntes, num2str(i_real(x,1)));
    fputs(correntes, "\n");
endfor

fclose(correntes);


