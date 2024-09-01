function state_matrix = add_round_key(state_matrix, round_key_matrix)
for j = 1:4
    state_matrix(:, j) = bitxor(state_matrix(:, j), round_key_matrix(:, j));
end
end