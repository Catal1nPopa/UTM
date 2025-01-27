% Definirea timpului
t = 0:1/60:2;  % Timpul cu un pas de 1/60 secunde

% Amplitudinea ajustată pentru a atinge 1 pe axa y
A = 1;

% Generarea semnalului triunghiular și scalarea acestuia
y = A * sawtooth(4 * pi * t, 0.5);

% Plotează semnalul triunghiular continuu
subplot(2,1,1);
plot(t, y);
title('Semnal triunghiular continuu');
xlabel('Timp (s)');
ylabel('Amplitudine');

% Plotează semnalul triunghiular discretizat
subplot(2,1,2);
stem(t, y);
title('Semnal triunghiular discretizat');
xlabel('Timp (s)');
ylabel('Amplitudine');

