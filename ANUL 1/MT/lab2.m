% Popa, Catalin, grupa TI-211, Varianta 17
% Lab Nr.2. Grafica in Octave
% Ex.2
close all
clear
clc
x = [-1:0.05:3];
f = (x.^2).*sin(x).^2;
g = x.*cos(x);

% a) In ferestre diferite
figure(1)
plot(x,f,'c--','linewidth',3)
title('Functia f(x)','fontSize',20)
xlabel('{ x}','fontSize',20)
ylabel('{ y}','fontSize',20)
grid; grid minor

figure(2)
plot(x,g,'g--*','linewidth',3)
title('{ Functia g(x)}','fontSize',18)
xlabel('X','fontSize',18);
ylabel('Y','fontSize',18)
grid; grid minor

% b) Intr-o fereastra pe aceleasi axe;
figure(3)
plot(x,f,'r:*')
hold on
plot(x,g,'b--*')
title('{ Graficul functiei f(x) si g(x)}','fontSize',18)
legend('f(x) = (x.^2)*sin(x).^2','g(x) = x.*cos(x)')
xlabel('X','fontSize',18);
ylabel('Y','fontSize',18)
grid; grid minor

%c) folosind comanda subplot :
% c1) Intr-o fereastra pe axe diferite :
%orizontal:
figure(4)
subplot(3,1,1);
plot(x,f,'b')
title('Mini-grafic f(x)')
xlabel('X')
ylabel('Y')
grid; grid minor
subplot(3,1,2)
hold on
plot(x,g,'g-.')
title('Graficul g(x)')
xlabel('X')
ylabel('Y')
grid; grid minor
subplot(3,1,3)
hold on
plot(x,f,'b')
plot(x,g,'g-.')
title('Mini-grafic f(x) si g(x)') 
xlabel('X')
ylabel('Y')
legend('f(x),g(x)')
legend('f(x)','g(x)')
grid; grid minor

%vertical ambele pe axele din dreapta
figure(5)
subplot(1,3,1);
plot(x,f,'b')
title('Min-graf f(x)')
xlabel('axa OX')
ylabel('axa OY')
grid; grid minor
subplot(1,3,2)
plot(x,g,'g-.')
title('Min-graf g(x)')
ylabel('axa OY')
xlabel('axa OX')
grid; grid minor
subplot(1,3,3)
hold on
plot(x,f,'b')
plot(x,g,'g-.')
title('Min-graf f(x) si g(x)')
xlabel('axa OX')
ylabel('axa OY')
legend('f(x)','g(x)')
grid; grid minor

%intr-o fereastra – fiecare aparte pe axe diferite si ambele pe aceleasi axe:
%ambele pe axele din dreapta:
figure(6)
subplot(2,3,[1,2]);
plot(x,f,'b')
title('Min-graf g(x)')
xlabel('axa OX')
ylabel('axa OY')
grid; grid minor
subplot(2,3,[4,5]);
plot(x,g,'g-.')
title('Min-graf g(x)')
xlabel('axa OX')
ylabel('axa OY')
grid; grid minor
subplot(2,3,[3,6]);
hold on
plot(x,f,'b')
plot(x,g,'g-.')
title('Min-graf f(x) si g(x)')
xlabel('axa OX')
ylabel('axa OY')
legend('f(x)','g(x)')
grid; grid minor

%ambele pe axele de sus:
figure(7)
subplot(2,2,3);
plot(x,f,'b')
title('Min-graf f(x)')
xlabel('axa OX')
ylabel('axa OY')
grid; grid minor
subplot(2,2,4);
plot(x,g,'g-.')
title('Min-graf g(x)')
xlabel('axa OX')
ylabel('axa OY')
grid; grid minor
subplot(2,2,[1,2]);
hold on
plot(x,f,'b')
plot(x,g,'g-.')
title('Min-graf f(x) si g(x)')
xlabel('axa OX')
ylabel('axa OY')
legend('f(x)','g(x)')
grid; grid minor