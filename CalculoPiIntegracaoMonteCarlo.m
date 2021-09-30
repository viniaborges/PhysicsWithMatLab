% Cálculo do valor de Pi utilizando o método de Integração de Monte Carlo

clc
for j=3:5
 Nt = 10^j;
 Ntx = rand(1,Nt);
 Nty = rand(1,Nt);
 Nc = 0;
 for i=1:Nt
 if Nty(i)<sqrt(1-(Ntx(i)^2))
 Nc = Nc+1;
 end
 end
 SolPi=4*Nc/Nt
end