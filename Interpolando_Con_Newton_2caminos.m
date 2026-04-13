clear
clc
x=0:0.25:1;
y=[1 3 5 4.5 3];

N=length(y);
M(:,1)=y;

for k=2:N %columna
  for i=1:N-k+1 %fila
    M(i,k) =  (M(i+1,k-1) - M(i,k-1))/(x(i+k-1)-x(i))
  endfor
endfor
b= M(1,:);

P=@(X) b(1) + b(2).*(X-x(1)) + b(3).*((X-x(1)).*(X-x(2))) +b(4).*((X-x(1)).*(X-x(2)).*(X-x(3))) + b(5).*((X-x(1)).*(X-x(2)).*(X-x(3)).*(X-x(4)));

XXX=linspace(x(1),x(end),500)
YYY= P(XXX); %evaluo mi funcion anonima esto me sirve para "evitar" la parte de conv

plot(x,y,'r*')
hold on
plot(XXX,YYY)




N=length(b) %
pn=0; %Vector de los coeficientes
pol=1 %
for i=1:N
  pn=pn + b(i)*[zeros(1,N-i) pol]
  pol=conv(pol, [1 -x(i)]) %convolucion:multiplica 2 pol
end
coef=pn;

XXX=linspace(x(1),x(end),300);
YYY=polyval(coef,XXX);

plot(x,y,'r*')
hold on
plot(XXX,YYY)










