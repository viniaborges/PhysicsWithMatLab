% Propagação de onda em membrana retangular

clc

% Condições iniciais, de contorno e variáveis
L=1;
v=300;
dx=0.01;
dy=dx;
r=0.7; %r=v*dt/dx
t=0.02;
dt=r*dx/v;
f0=zeros(L/dx,L/dy,t/dt);
f=zeros(L/dx,L/dy,t/dt);
x0=L/2;
y0=x0;
sigma=L/8;
for j=1:L/dy
 for i=1:L/dx
 f(i,j,1:2)=exp((-((i*dx-x0)^2)-((j*dy-y0)^2))/sigma^2);
 end
end
for k=2:t/dt-1
 for j=2:L/dy-1
 for i=2:L/dx-1
 f(i,j,k+1)=2*(1-2*r^2)*f(i,j,k)+r^2*(f(i+1,j,k)+f(i1,j,k)+f(i,j+1,k)+f(i,j-1,k))-f(i,j,k-1);
 end
 end
 surf(f(1:L/dx,1:L/dy,k));
 axis([0 (L/dx) 0 (L/dy) -1 1]);
 shading interp;
 F(k)=getframe;
end
movie2avi(F,'Video.avi');