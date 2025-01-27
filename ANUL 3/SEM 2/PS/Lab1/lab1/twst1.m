% Generare vectorul x
x = 1:100;

% Generare vectorul y
y = 2:2:200;

% a) Reprezentare grafic y in functie de x folosind functia stem
figure;
subplot(2, 2, 1);
stem(x, y);
title('a) Stem Plot');

% b) Reprezentare grafic y in functie de x folosind functia plot
subplot(2, 2, 2);
plot(x, y);
title('b) Plot');

% c) Reprezentare grafic in aceeasi figura, y in functie de x folosind plot si stem cu culori diferite
subplot(2, 2, [3, 4]);
plot(x, y, 'b'); % folosim albastru pentru plot
hold on;
stem(x, y, 'r'); % folosim rosu pentru stem
title('c) Plot and Stem');
legend('Plot', 'Stem');

% d) Reprezentare grafic in aceeasi figura, in sistem de coordonate diferite
figure;
subplot(2, 1, 1);
plot(x, y);
title('d) Plot');

subplot(2, 1, 2);
stem(x, y);
title('d) Stem');
