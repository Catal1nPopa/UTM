clear all
clc
close all
t= [0:0.02:9];

%Punctul II

%a) Necoerente: w1!=w2

figure(1)
w1=pi/4;
w2=pi/2;
alfa=0;
oscilatiiX(t,w1,w2,alfa,'Oscilatii Armonice Necoerente');

%b) Coerente: w1=w2 

figure(2)
w1=pi/4;
w2=pi/4;
alfa=0; 
oscilatiiX(t,w1,w2,alfa,'Oscilatii Armonice Coerente');

%c) Necoerente (tip bataie): w1~w2

figure(3)
t= [0:0.02:100];
w1=pi/2;
w2=pi/2.2;
alfa=0; 
oscilatiiX(t,w1,w2,alfa,'Oscilatii Armonice Necoerente Tip Bataie');

%d) Coerente: w1=w2

figure(4)
t= [0:0.02:10];
w1=pi/3;
w2=pi/3;
alfa=[0,pi/6,pi/4,pi/3,pi/2,2*pi/3,3*pi/4,5*pi/6,pi]
n=1
for i=alfa
  subplot(3,3,n)
  oscilatiiX(t,w1,w2,i,['def = ', num2str(i)]);
  n+=1
end

%Punctul III

figure(5)
t= [0:0.02:100];
w1=pi/3;
w2=pi/3;
alfa=[0,pi/6,pi/4,pi/3,pi/2,2*pi/3,3*pi/4,5*pi/6,pi]
n=1
for i=alfa
  subplot(3,3,n)
  oscilatiiXY(t,w1,w2,i,['def = ', num2str(i)]);
  n+=1
end