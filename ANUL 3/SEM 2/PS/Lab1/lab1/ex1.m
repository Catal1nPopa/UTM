%E 1.1.Exerciţiu:
%Fie vectorii linie
%a = [0, 0.1, 0.2, … , 2] şi coloană b = [1⋮1]
%a) Ce lungime trebuie să aibă b astfel, încât să aibă sens înmulţirea (în sens matricial) a*b? Iniţializaţi 
%în MATLAB cei doi vectori şi efectuați înmulţirea.
%b) Efectuați înmulţirea b*a.

a = 0:0.1:2;
b = ones(length(a),1)
res = a * b
res2 = b * a

