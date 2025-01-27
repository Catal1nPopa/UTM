function oscilatiiXY(t,w1,w2,alfa,titlu);

a1=4;
alfa01 = pi/3;
a2=1;
alfa02=alfa01-alfa;

x=a1.*cos(w1.*t+alfa01)
y=a2.*cos(w2.*t+alfa02)

hold on
plot(x,y,'r-','linewidth',3)
title(titlu,'fontSize',20)
xlabel('{\it x cm}','fontSize',20)
ylabel('{\it y cm}','fontSize',20)
grid; grid minor;

T1=2*pi/w1

