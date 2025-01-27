#Popa Catalin  TI-211
#Laborator 7

clc
clear

#1
x0 = 3;
x0p = 0;
q0 = [x0,x0p]
t = [0, 0.5]
[t,q] = ode45(@fun, t ,q0)

figure(1)
plot(t, q(:,1), '-b')
title('Ecuatia diferentiala');
grid; grid minor;

#2

coef = [-3,0,1,-7,0,-2]
a = roots(coef);

for i = [1,2,3,4,5]
  if isreal(a(i,1)) && a(i,1)>=0
      a = a(i,1)
  end
end

a