% Entropia de grãos de pólen utilizando Movimento Browniano

clc
M=2000;
iter=1000;
L=50;
r=2;
dx=0.1;
dy=0.1;
x=zeros(M,iter);
y=zeros(M,iter);
P=zeros(2*L/r,2*L/r,iter);
S=zeros(iter);
for i=2:iter
    for m=1:M
        rdm=rand(1);
        dirx=0;
        diry=0;
        if rdm<0.5
            if rdm<0.25
                dirx=1;
            else
                dirx=-1;
            end
        else
            if rdm<0.75
                diry=1;
            else
                diry=-1;
            end
        end
        x(m,i)=x(m,i-1)+dirx*dx;
        y(m,i)=y(m,i-1)+diry*dy;
    end
    for m=1:M
        px=floor((x(m,i)+L)/r);
        py=floor((x(m,i)+L)/r);
        P(px,py,i)=P(px,py,i)+1/M;
    end
    for k=1:2*L/r
        for l=1:2*L/r
            S(i)=S(i)-P(k,l,i)*log(P(k,l,i));
        end
    end
end
plot(S);