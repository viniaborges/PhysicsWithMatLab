% Determinar o potencial elétrico, o campo elétrico e as equipotenciais para duas placas metálicas pelo método de Jacobi.

clc

% Condições de contorno e variáveis
V1=2;
V2=-2;
h=0.1;
Lx=3;
Ly=3;
A=3;
d=2;
e=0.5;
tol=1e-5;
x=h:h:2*Lx+d+2*e;
y=h:h:2*Ly+A;
Ex=zeros((2*Lx+d+2*e)/h,(2*Ly+A)/h);
Ey=zeros((2*Lx+d+2*e)/h,(2*Ly+A)/h);
V=zeros((2*Lx+d+2*e)/h,(2*Ly+A)/h);
Vtmp=ones((2*Lx+d+2*e)/h,(2*Ly+A)/h);

% Ajuste dos valores de Vtmp nas bordas
for i=1:(2*Lx+d+2*e)/h
 Vtmp(i,1)=0;
 Vtmp(i,(2*Ly+A)/h)=0;
end
for i=1:(2*Ly+A)/h
 Vtmp(1,i)=0;
 Vtmp((2*Lx+d+2*e)/h,i)=0;
end
while (max(max(abs(Vtmp-V)))/max(max(abs(Vtmp))))>tol
 V=Vtmp;

 % Ajuste dos valores de Vtmp
 for j=2:(2*Ly+A)/h-1
 for i=2:(2*Lx+d+2*e)/h-1
 Vtmp(i,j)=0.25*(V(i,j+1)+V(i,j-1)+V(i+1,j)+V(i-1,j));
 end
 end

 % Ajuste dos valores de Vtmp nas regiões R1 e R2
 for i=Lx/h:(Lx+e)/h
 for j=Ly/h:(Ly+A)/h
 Vtmp(i,j)=V1;
 end
 end
 for i=(Lx+e+d)/h:(Lx+2*e+d)/h
 for j=Ly/h:(Ly+A)/h
 Vtmp(i,j)=V2;
 end
 end
end

% Calculando o campo elétrico
for i=1:(2*Lx+d+2*e)/h-1
 for j=1:(2*Ly+A)/h-1
 Ex(i,j)=(Vtmp(i+1,j)-Vtmp(i,j))/h;
 Ey(i,j)=(Vtmp(i,j+1)-Vtmp(i,j))/h;
 end
end
[X,Y]=meshgrid(x,y);
contour(X,Y,Vtmp');
hold on;
quiver(X,Y,Ex',Ey');
hold off;