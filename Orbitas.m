% Simulação de órbitas

clc
clear all
format long
tf=326;
dt=0.1;
tf=ceil(tf/dt);
t=0;
beta=2; %Expoente da distância
f(1,1)=10; %x0
f(2,1)=0; %y0
f(3,1)=0; %vx0
f(4,1)=1; %vy0
g=@(t,y,b)[y(3);y(4);-4*pi^2*y(1)/sqrt(y(1)^2+y(2)^2)^(b+1);-
4*pi^2*y(2)/sqrt(y(1)^2+y(2)^2)^(b+1)];
j=1;
for j=1:tf
    k1=g(t,f(:,j),beta);
    k2=g(t+dt/2,f(:,j)+dt*k1/2,beta);
    k3=g(t+dt/2,f(:,j)+dt*k2/2,beta);
    k4=g(t+dt,f(:,j)+dt*k3,beta);
    f(:,j+1)=f(:,j)+(dt/6)*(k1+2*k2+2*k3+k4);
    t=t+dt;
    j=j+1;
    plot(f(1,1:j),f(2,1:j));
    Anim(j)=getframe;
    area=sqrt((f(1,j)^2+f(2,j)^2))*sqrt((f(1,j)-f(1,j-1))^2-(f(2,j)-
    f(2,j-1))^2);
    sem=max(sqrt(f(1,j)^2+f(2,j)^2),sqrt(f(1,j-1)^2+f(2,j-1)^2));
end
xmax=max(f(1,:))
ymax=max(f(2,:))
ymax-xmax
KeplerCirc=t^2/ymax^3
kepler3=t^2/sem^3