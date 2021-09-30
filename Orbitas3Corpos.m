% Órbitas de 3 corpos

clc
clear all
format long
tf=20;
dt=0.01;
tf=ceil(tf/dt);
t=0;
beta=2;
Mt=5.972E24;
Mj=1.898E27;
Ms=1.989E30;
f(1,1)=1; %x10
f(2,1)=0; %y10
f(3,1)=0; %vx10
f(4,1)=1; %vy10
f(5,1)=5; %x20
f(6,1)=0; %y20
f(7,1)=0; %vx20
f(8,1)=3; %vy20
g=@(t,y,b)[y(3);...
    y(4);...
    -4*pi^2*((y(1)/(sqrt(y(1)^2+y(2)^2)^b+1))+(Mj*(y(1)-y(5))/(Ms*(sqrt((y(1)-y(5))^2+(y(2)-y(6))^2))^3)));...
    -4*pi^2*((y(2)/(sqrt(y(1)^2+y(2)^2)^b+1))+(Mj*(y(2)-y(6))/(Ms*(sqrt((y(1)-y(5))^2+(y(2)-y(6))^2))^3)));...
    y(7);...
    y(8);...
    -4*pi^2*((y(5)/(sqrt(y(5)^2+y(6)^2)^b+1))-(Mt*(y(1)-y(5))/(Ms*(sqrt((y(1)-y(5))^2+(y(2)-y(6))^2))^3)));...
    -4*pi^2*((y(6)/(sqrt(y(5)^2+y(6)^2)^b+1))-(Mt*(y(2)-y(6))/(Ms*(sqrt((y(1)-y(5))^2+(y(2)-y(6))^2))^3)));];
for j=1:tf
    k1=g(t,f(:,j),beta);
    k2=g(t+dt/2,f(:,j)+dt*k1/2,beta);
    k3=g(t+dt/2,f(:,j)+dt*k2/2,beta);
    k4=g(t+dt,f(:,j)+dt*k3,beta);
    f(:,j+1)=f(:,j)+(dt/6)*(k1+2*k2+2*k3+k4);
    t=t+dt;
    j=j+1;
    plot(f(1,1:j),f(2,1:j),f(5,1:j),f(6,1:j));
    Anim(j)=getframe;
    area=sqrt((f(1,j)^2+f(2,j)^2))*sqrt((f(1,j)-f(1,j-1))^2-(f(2,j)-f(2,j-1))^2);
    sem=max(sqrt(f(1,j)^2+f(2,j)^2),sqrt(f(1,j-1)^2+f(2,j-1)^2));
end
