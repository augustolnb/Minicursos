clc;
# Lista de funções da biblioteca symbolic
# https://octave.sourceforge.io/symbolic/overview.html
pkg load symbolic

x = sym("x");
t = sym("t");

h = cos(x);

f = x^2 + 3*x - 6

# Resolução de equações
solve(f, x)

# Derivada
print("Derivada:\n");
diff(h, v1)

# Integral indefinida
print("Integral");
int(h, v1)

t = cos(x)
# Integral definida
F = int(t, x, 1, 2)

# Calculo de limites
L1 = limit(sin(x)/x, x, 0)
L2 = limit(1/x, x, 0, 'left')
L3 = limit(1/x, x, 0, 'right')

H = (x+1)/(x-1)
plot(H)

limit(H, x)

# Se quiser calcular o limite à medida que x se aproxima do menos infinito x→-∞,
# digite o mesmo comando adicionando -inf no terceiro parâmetro
limit((x+1)/(x-1),x,-inf)

# Transformada de Laplace
G = laplace(F)

# Transfomada de Laplace Inversa
inversa = ilaplace(G)

inversa
F

