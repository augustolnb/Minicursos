[x,y]=meshgrid(-8:.5:8,-8:.5:8);
r=sqrt(x.^2+y.^2)+eps;
z=sin(r)./r;
mesh(x,y,z)