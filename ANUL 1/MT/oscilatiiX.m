function oscilatiiX(t,w1,w2,alfa,titlu);

a1=4;
alfa01 = pi/3;
a2=1;
alfa02=alfa01-alfa;

x1=a1.*cos(w1.*t+alfa01)
x2=a2.*cos(w2.*t+alfa02)
x=x1+x2;
hold on
plot(t,x1,'k-','linewidth',3)
plot(t,x2,'c-','linewidth',3)
plot(t,x,'y-','linewidth',3)
legend('x1 ','x2 ','x ')
title(titlu,'fontSize',20)
xlabel('{\it t s}','fontSize',20)
ylabel('{\it y cm}','fontSize',20)
grid; grid minor;

T1=2*pi/w1
T2=2*pi/w2