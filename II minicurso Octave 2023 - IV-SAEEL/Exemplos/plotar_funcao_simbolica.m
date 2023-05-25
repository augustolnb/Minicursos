eixo_x = [-10:1:10]


for i = 0:19
  y(i) = subs(H, x, eixo_x(i))
  printf("\n");

endfor
