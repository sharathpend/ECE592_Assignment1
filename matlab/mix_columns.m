function state_matrix_out = mix_columns(state_matrix)
    %{
       [ 02 03 01 01 ]  * [ 1   5   9  13 ]
         01 02 03 01        2   6  10  14  
         01 01 02 03        3   7  11  15  
         03 01 01 02        4   8  12  16  
    %}
    
    % j = 1, 5, 9, 13.
    % out(4j)   = 02.in(4j) + 03.in(4j+1) + in(4j+2) + in(4j+3)
    % out(4j+1) = in(4j) + 02.in(4j+1) + 03.in(4j+2) + in(4j+3)
    % out(4j+2) = in(4j) + in(4j+1) + 02.in(4j+2) + 03.in(4j+3)
    % out(4j+3) = 03.in(4j) + in(4j+1) + in(4j+2) + 02.in(4j+3)

    state_matrix_out = state_matrix;
    for j=1:4:13
        state_matrix_out(j)   = bitxor( bitxor(peasants_algorithm_mult(state_matrix(j),2), peasants_algorithm_mult(state_matrix(j+1),3)), ...
                                        bitxor(state_matrix(j+2), state_matrix(j+3)) );
        state_matrix_out(j+1) = bitxor( bitxor(state_matrix(j), peasants_algorithm_mult(state_matrix(j+1),2)), ...
                                        bitxor(peasants_algorithm_mult(state_matrix(j+2),3), state_matrix(j+3)) );
        state_matrix_out(j+2) = bitxor( bitxor(state_matrix(j), state_matrix(j+1)), ...
                                        bitxor(peasants_algorithm_mult(state_matrix(j+2),2), peasants_algorithm_mult(state_matrix(j+3),3)) );
        state_matrix_out(j+3) = bitxor( bitxor(peasants_algorithm_mult(state_matrix(j),3), state_matrix(j+1)), ...
                                        bitxor(state_matrix(j+2), peasants_algorithm_mult(state_matrix(j+3),2)) );
    end
end