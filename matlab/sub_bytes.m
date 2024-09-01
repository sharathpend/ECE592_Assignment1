function state_matrix = sub_bytes(state_matrix, Sbox_matrix)
    % +1 because matlab indices start with 1, but individual input values
    % of state_matrix could be 0.
    state_matrix = Sbox_matrix(state_matrix+1);
end