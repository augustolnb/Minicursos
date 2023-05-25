% Programa para calculo do fluxo de potência de um motor trifásico
% Plotagem do gráfico Velocidade x Torque
% Testado com Octave 7.1.0
% Lucas Augusto Nunes de Barros
% Estudante de Engenharia Elétrica
% Código desenvolvido para disciplina de Máquinas Elétricas I
% v01 31/05/2022
%
% O arquivo z_paralelo.m deve estar na mesma pasta deste arquivo
% para o perfeito funcionamento de todas as funções dessa aplicação.

clc;
######### Valores Elementares
 r1 = 0.641;
 x1 = 1.106;
 r2 = 0.332;
 x2 = 0.464;
 xm = 26.3;
 f = 60;
 v_linha = 460;
 polos = 4;
 p_rot = 1100;
 p_core = 1100;
 s = 0.022;
 v_fase = v_linha / sqrt(3);
 rc = 3 * v_fase^2/p_core;

 ######### Corrente da rede e Fator de Potencia ###########

###  impendancia resultante e corrente do ramo de magnetização
 z_magnetico = z_paralelo(rc, 0, 0, xm);    #= z_paralelo (real1, img1, real2, img2)
 i_magnetico = complex((v_fase/  real(z_magnetico)), -imag(z_magnetico));  #forma polar

 ###  impendancia resultante e corrente do relativos ao rotor
 z2 = complex((r1+r2/s),(x1+(x2)));
 i2 = complex((v_fase/real(z2)), -imag(z2));

 ###  calculo da corrente drenada da rede + fator de potencia
 [i_mag_real, i_mag_img] = pol2cart((imag(i_magnetico )*pi/180), real(i_magnetico));
 [i2_real, i2_img] = pol2cart((imag(i2)*pi/180), real(i2));
 [i1_fase, i1_modulo] = cart2pol ((i2_real+i_mag_real), (i2_img+i_mag_img));

 i1_fase = i1_fase*180/pi;
 fp = cos(i1_fase*pi/180);
 printf("\n\tRESPOSTA LETRA A\n\n\tCorrente da rede = %.2f  | %.2fº A\n\tFator de potencia = %.4f\n\n", i1_modulo, i1_fase, fp);

############# Torque Interno ###########
 # velocidade do campo girante
 w_campo = 2*pi*((120*f/polos) /(60));
 # potencia transferida
 pg = 3*((i2_real)^2)*r2/s;
 printf("\n\tRESPOSTA LETRA B\n\n\tTorque interno = %.2f N.m\n\n", pg/w_campo);

 ############# Torque no eixo ###########
# velocidade do eixo
w_eixo = 2*pi*(((120*f/polos)*(1-s)) /(60));
# potecia no eixo
p_eixo = (pg *(1-s)) - p_rot;
printf("\n\tRESPOSTA LETRA C\n\n\tTorque no eixo = %.2f N.m\n\n", p_eixo/w_eixo);

 ############# Potencia de saida [HP] ###########
printf("\n\tRESPOSTA LETRA D\n\n\tPotencia no eixo = %.2f HP\n\n", p_eixo/746);

############# Rendimento ###########
# potencia de entrada da rede
p_in = sqrt(3)*v_linha*i1_modulo*fp;
rend = p_eixo/p_in;
printf("\n\tRESPOSTA LETRA E\n\n\tRendimento = %.2f %%\n\n", rend*100);

############# Torque de partida ###########
pg_parado = 3*((i2_real)^2)*r2;
torque_partida = pg_parado/w_campo;
printf("\n\tRESPOSTA LETRA F\n\n\tTorque de partida = %.2f N.m\n\n", torque_partida);

############# Escorregamento do torque maximo ###########
s_max = r2/(sqrt(((r1)^2)+((x1+x2)^2)));
printf("\n\tRESPOSTA LETRA G\n\n\tEscorregamento do torque maximo = %.2f %%\n\n", s_max*100);

############# A corrente durante o torque maximo ###########
 torque_max = (3*v_fase^2)/(w_campo*2*(r1+sqrt((r1^2)+((x1+x2)^2))));
 # modulo da corrente de rotor
 i2_torque_max = sqrt(((torque_max*w_campo)*s_max)/(3*r2));
 # fase da corrente de rotor
 z2_torque_max = complex((r1+r2/s_max), (x1+x2));
 [z2_torque_max_fase, z2_torque_max_modulo] = cart2pol (real(z2_torque_max), imag(z2_torque_max));
 i2_torque_max = complex(i2_torque_max, -(z2_torque_max_fase*180/pi)); # forma polar
 [i2_torque_max_real, i2_torque_max_img] = pol2cart((imag(i2_torque_max)*pi/180), real(i2_torque_max));
 i1_torque_max = complex((i2_torque_max_real+i_mag_real), (i_mag_img+i2_torque_max_img));
 [i1_torque_max_fase, i1_torque_max_modulo] = cart2pol (real(i1_torque_max), imag(i1_torque_max));

 printf("\n\tRESPOSTA LETRA H\n\n\tCorrente da rede    = %.2f  | %.2fº A\n\tdurante torque max\n\n", i1_torque_max_modulo, i1_torque_max_fase*180/pi);

 ############# Torque maximo ###########
 printf("\n\tRESPOSTA LETRA I\n\n\tTorque maximo = %.2f N.m\n\n", torque_max);

############ Etapa Gráfica ####################

 tamanho = 50;
 conjugado = linspace(1, 0, tamanho);
 pot_eixo = linspace(0,1, tamanho);
 freq_eixo =  linspace(0,1, tamanho); % rad/s
 torque_eixo = linspace(0,1, tamanho);
 n_eixo = linspace(0,1800, tamanho);

 %%  Calculo dos valores de torque
 for cont = 1:tamanho-1
    z2 = complex((r1+r2/conjugado(cont)), (x1+x2));
    [z2_fase, z2_modulo] = cart2pol(real(z2), imag(z2));
    p_mec = (3*r2/conjugado(cont)) * (((v_fase)/(z2_modulo))^2) * (1- conjugado(cont));

    if p_mec > p_rot
        pot_eixo(cont) = p_mec - p_rot;
        freq_eixo(cont) = 2*pi*((120*f/polos)*(1-conjugado(cont))/60); % rad/s
        torque_eixo(cont) = pot_eixo(cont)/freq_eixo(cont);
        n_eixo(cont) = (120*f/polos)*(1-conjugado(cont));  % rpm
    else
        torque_eixo(cont) = 1.50;
    endif

 endfor

 %%  Configuraçoes do gráfico
 plot(n_eixo,  torque_eixo, "-k")  %% Torque no eixo
 xlabel("N [rpm]")
 ylabel("Torque [N.m]")
 title("Curva Velocidade x Torque")
 grid minor
 hold off

 clear all;
