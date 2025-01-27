%E 1.2. Exerciţiu:
%Se creează un fişier nou care trebuie salvat în directorul d:/student/pns/nrgrupa.
%Folosind sintaxele şi indicaţiile din secţiunile 1.2.6 şi 1.2.7, elaborați un program MATLAB care să genereze un vector cu elemente aleatoare cu distribuţie normală
% (gaussiană) şi să afişeze elementele negative ale acestui vector.

% Setarea directorului de lucru
path = 'd:/UTM/ANUL 3/SEM 2/PS/Lab1/lab1';
if ~exist(path, 'dir')
    mkdir(path);
end

% Generarea vectorului cu elemente aleatoare cu distribuție normală
num = 100;  % Schimbați numărul de elemente după necesități
m = 0;  % Medie
deviatia_standart = 1;  % Deviație standard
random_vector = m + deviatia_standart * randn(1, num);

% Afișarea elementelor negative
negative_elements = random_vector(random_vector < 0);
disp('Elemente negative:');
disp(negative_elements);

% Salvarea elementelor negative într-un fișier
file_path = fullfile(path, 'elemente_negative.txt');
fid = fopen(file_path, 'w');
fprintf(fid, 'Elemente negative:\n');
fprintf(fid, '%f\n', negative_elements);

fclose(fid);

disp(['Elementele negative au fost salvate în fișier: ']);