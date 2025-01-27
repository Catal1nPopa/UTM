clear
clc
%Popa Catalin TI-211,laborator 5
%1.Ex.1 
%a)
%fi_e = 2*t^3-t^2+t
%fi_1 = 65,grade
%2*t^3 - t^2 + t = 65 * (pi/180)

coef = [ 2, -1, 1, -65 * pi/180];

t1 = roots(coef);
for i = [1,2,3]
    if isreal(t1(i,1))&& t1(i,1) >=0
        t1 = t1(i,1)
    end
end

%b)
pkg load symbolic 
syms t

fi_e = 2*t.^3 - t.^2 + t;
w = diff(fi_e);
eps = diff(w);

t = t1;
w1 = eval(w);
eps1 = eval(eps);

%c)

R = 25;%cm
OM = R./4;%cm
MD = R - OM
O1M = sqrt(2*R.^2 - MD.^2 )
vm = w1 * O1M
a_ax = w.^2.*O1M
a_ax1 = eval(a_ax)
a_rot = eps1 * O1M
a = sqrt(a_ax.^2 + a_rot^2)
a1 = eval(a)

%Ex 2
%a)

t1 = fzero('f',65*pi./180)


%b)

pkg load symbolic 
syms t

fie =18*sin(2*pi*t) 
w = diff(fie)
eps = diff(w)
t = t1
w1 = eval(w)
eps1 = eval(eps)

%c)

OO1 = sqrt(R^2+R^2)
Vm = w1 * OO1
a_ax = w1^2*OO1
a_rot = eps1 * OO1
a = sqrt(a_ax.^2+a_rot.^2)


%Ex3
pkg load symbolic
syms t

%Datele problemei
s = 42.*cos(2*pi*t); %cm
s1= eval(s);
t1 = 1./6;
AB = 42 %cm
AM = 14 %cm
MB = AB - AM;
%calcule simbolice
x = acos(s/AB);
VB = diff(s);
OB = sqrt(AB.^2 - s^2)
Va = diff(OB)
Va1 = eval(Va)
OM = sqrt(AB^2 + s^2 + 2*AB*s*cos(x))
OM1 = eval(OM)
Xm = s - ((s*MB)/AB)
Vmx = diff(Xm)

%calcule numerice
t = t1;
VB = eval(VB)
s = eval(s)

Vmx1 = eval(Vmx)

%b
t1 = 1./6
t=[0:0.01:1]
[y] = f(t)
plot(t,y);
title('Traiectoria lui M', 'fontSize',20);
xlabel('x')
ylabel('y')
grid;grid minor;
hold on
[y] = f(t1)

plot(t1,y,'-g*','linewidth',1)


%c

w = Va1 / s
vm = w * OM1
Va = w * s1