%Elaborați un program MATLAB care generază un vector cu elemente complexe. Elaborați (un alt fişier) o funcţie MATLAB care, 
%având drept parametru de intrare vectorul cu valori complexe, returnează ca parametri de ieşire:
%- media aritmetică a părţilor reale ale elementelor vectorului;
%- un vector ce conţine elementele vectorului iniţial ridicate la pătrat;
%- o matrice obţinută din înmulţirea vectorului iniţial cu transpusul său.
%Atenţie: pentru a nu se afişa rezultate intermediare din funcţie sau elementele unor variabile se va folosi ; la sfârşitul liniei respective de program.


% Generarea unui vector cu elemente complexe
num_elements = 5;  % Schimbați numărul de elemente după necesități
complex_vector = randn(1, num_elements) + 1i * randn(1, num_elements);

% Afisarea vectorului generat
disp('Vectorul cu elemente complexe:');
disp(complex_vector);

% Apelarea funcției și afișarea rezultatelor
addpath('d:/UTM/ANUL 3/SEM 2/PS/Lab1/lab1');

[media_partilor_reale, vector_patrat, matrice_inmultire] = functie_complexa(complex_vector);

disp('Rezultatele functiei:');
disp(['Media partilor reale: ' num2str(media_partilor_reale)]);
disp('Vectorul cu elementele ridicate la patrat:');
disp(vector_patrat);
disp('Matricea obtinuta din inmultirea vectorului cu transpusul sau:');
disp(matrice_inmultire);
