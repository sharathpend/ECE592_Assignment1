function state_matrix_hex_str = conv_state_to_hex_str(state_matrix, length_of_str)
    
    % Change to Column Vector, convert that to hex, and then change it back
    % to a row vector to display it like a string.
    
    state_matrix_hex_str = state_matrix(:);
    state_matrix_hex_str = dec2hex(state_matrix_hex_str(1:length_of_str))';
    state_matrix_hex_str = state_matrix_hex_str(:)';
end