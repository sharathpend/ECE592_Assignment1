function state_matrix_out = inverse_mix_columns(state_matrix)
    %{
       [ 14 11 13 09 ]  * [ 1   5   9  13 ]
         09 14 11 13        2   6  10  14  
         13 09 14 11        3   7  11  15  
         11 13 09 14        4   8  12  16  
    %}
    
    % j = 1, 5, 9, 13.
    % out(4j)   = 02.in(4j) + 03.in(4j+1) + in(4j+2) + in(4j+3)
    % out(4j+1) = in(4j) + 02.in(4j+1) + 03.in(4j+2) + in(4j+3)
    % out(4j+2) = in(4j) + in(4j+1) + 02.in(4j+2) + 03.in(4j+3)
    % out(4j+3) = 03.in(4j) + in(4j+1) + in(4j+2) + 02.in(4j+3)

    state_matrix_out=state_matrix;
    for j=1:4:13
        state_matrix_out(j)   = bitxor( bitxor(peasants_algorithm_mult(state_matrix(j),14), peasants_algorithm_mult(state_matrix(j+1),11)), ...
                                        bitxor(peasants_algorithm_mult(state_matrix(j+2),13), peasants_algorithm_mult(state_matrix(j+3),9)));
        state_matrix_out(j+1) = bitxor( bitxor(peasants_algorithm_mult(state_matrix(j),9), peasants_algorithm_mult(state_matrix(j+1),14)), ...
                                        bitxor(peasants_algorithm_mult(state_matrix(j+2),11), peasants_algorithm_mult(state_matrix(j+3),13)));
        state_matrix_out(j+2) = bitxor( bitxor(peasants_algorithm_mult(state_matrix(j),13), peasants_algorithm_mult(state_matrix(j+1),9)), ...
                                        bitxor(peasants_algorithm_mult(state_matrix(j+2),14), peasants_algorithm_mult(state_matrix(j+3),11)));
        state_matrix_out(j+3) = bitxor( bitxor(peasants_algorithm_mult(state_matrix(j),11), peasants_algorithm_mult(state_matrix(j+1),13)), ...
                                        bitxor(peasants_algorithm_mult(state_matrix(j+2),9), peasants_algorithm_mult(state_matrix(j+3),14)));
    end
end