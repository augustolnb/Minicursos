clc;close;clear all;

printf("\n\t   Calculadora de faltas\n\tUtilizando método das matrizes\n\n\t* Considerar matrizes \n\t  de seq+ e seq- iguais\n\n");
v = 1;
j = complex(0, 1);
n_barras = 3;

y_sp = [-65.55, 20, 40; 20, -75.38, 40;40, 40, -87.7];
y_sn = [-65.55, 20, 40; 20, -75.38, 40;40, 40, -87.7];

z_sp = inv(y_sp*j);
z_sn = inv(y_sn*j);

### calculo de curto circuito bifasico sem impedancia de falta
### falta bifasica: corrente das fases envolvidas é igual
### considera-se que a falta ocorra nas fases B e C

i_sequencia = zeros(n_barras, 3);
i_real = zeros(n_barras, 3);

## calculos da corrente das componentes de sequencia
for x=1:n_barras
    i_sequencia(x,1) = v/(z_sp(x,x)+z_sn(x,x));
    i_sequencia(x,2) = -i_sequencia(x,1);
endfor

## calculos das correntes reais
for x=1:n_barras
            [fase, modulo]=cart2pol(0, imag(i_sequencia(x,1)));

            [r1, im1] = pol2cart(((240*pi/180)+fase), modulo);
            [r2, im2] = pol2cart(((120*pi/180)+fase+pi), modulo);

            i_real(x,1) = complex(r1+r2, im1+im2);
            i_real(x, 2) = -i_real(x,1);
endfor


printf("\nCorrentes de sequencia:\n");
i_sequencia

printf("\nCorrentes reais [pu]:\n");
i_real

