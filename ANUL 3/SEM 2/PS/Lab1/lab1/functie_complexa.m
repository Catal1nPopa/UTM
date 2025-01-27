function [media_partilor_reale, vector_patrat, matrice_inmultire] = functie_complexa(complex_vector)
    % Calcularea mediei partilor reale
    media_partilor_reale = mean(real(complex_vector));

    % Calcularea vectorului cu elementele ridicate la patrat
    vector_patrat = complex_vector.^2;

    % Calcularea matricei obtinute din inmultirea vectorului cu transpusul sau
    matrice_inmultire = complex_vector' * complex_vector;
end
