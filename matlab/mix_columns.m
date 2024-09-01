function state_matrix_out = mix_columns(state_matrix)
%{
   [ 02 03 01 01 ]  * [ 1   5   9  13 ]
     01 02 03 01        2   6  10  14  
     01 01 02 03        3   7  11  15  
     03 01 01 02        4   8  12  16  
%}
state_matrix_out=state_matrix;
for a=1:4:13
    state_matrix_out(a)  =bitxor(bitxor(bitxor(peasants_algorithm_mult(state_matrix(a),2),  peasants_algorithm_mult(state_matrix(a+1),3)), state_matrix(a+2)),state_matrix(a+3));
    state_matrix_out(a+1)=bitxor(bitxor(bitxor(peasants_algorithm_mult(state_matrix(a+1),2),peasants_algorithm_mult(state_matrix(a+2),3)), state_matrix(a)),  state_matrix(a+3));
    state_matrix_out(a+2)=bitxor(bitxor(bitxor(peasants_algorithm_mult(state_matrix(a+2),2),peasants_algorithm_mult(state_matrix(a+3),3)), state_matrix(a)),  state_matrix(a+1));
    state_matrix_out(a+3)=bitxor(bitxor(bitxor(peasants_algorithm_mult(state_matrix(a+3),2),peasants_algorithm_mult(state_matrix(a),3)),   state_matrix(a+1)),state_matrix(a+2));
end
end