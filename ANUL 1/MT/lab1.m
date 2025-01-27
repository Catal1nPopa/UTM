% Popa, Catalin, grupa TI-211
% Varianta -17
% Ex.2
clear
clc
% 2.1. Calculul intr-un rand
x = -1.75*1e-3;
y = 3.1*pi;
disp('Rezultatul intr-un rand')
A1 =(((x+log(abs(cos(y))))/(x+abs(cot(y))))^2.5)+sqrt(((x+abs(cot(y)))^3)/(x+...
log(cos(y))))
H2 = asin((x^2+(cos(y))^2)/sqrt(abs(x-log(y))))^1.3+sqrt(abs(x-log(y)))
% 2.2. Optimizare cu var interm
disp('Rezultatul cu var intermediare')
a = x+log(abs(cos(y)));
b = x+abs(cot(y));
A1 = ((a/b)^2.5)+sqrt((b^3)/a)
c = x^2+(cos(y))^2;
d = sqrt(abs(x-log(y)));
H2 = asin(c/d)^1.3+d
% 2.3. Diferite formate
format short
disp('Format short:');
 A1,H2
format long
disp('Format long:'); 
A1,H2
format hex
disp('Format hex:')
A1
H2
disp('Comanda whos:')
whos
% Ex.3
pause
clc
clear
format short
% De calculat valorile functiei pe segmentul dat in N puncte lab
#intervale egale unul de altul.
disp('Ex.3.')
a = 1;
b = 3;
N = 7;
pas = (b-a)/(N-1);
x = [a:pas:b]
f = x.^2.*sin(x).*(log(abs(x))+4)
