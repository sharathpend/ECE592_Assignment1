function expanded_keys = inverse_key_expansion_aes128(key)
    % https://en.wikipedia.org/wiki/AES_key_schedule
    Inverse_Sbox_ram = calc_inverse_sbox_matrix();
    N = 4;
    num_rounds = 11;
    rc = [1 2 4 8 16 32 64 128 27 54];
    
    expanded_keys = zeros(4,(num_rounds*4));
    expanded_keys(:,(((num_rounds-1)*4)+1):end) = initialize_round_keys(key, N); % stored in 41:44
    
    for i = ((4*num_rounds)-1):-1:4 % 43:-1:4
        temp_key = expanded_keys(:, i);
        if mod(i, 4) == 0
            temp_key = bitxor(sub_bytes(circshift(temp_key,1), Inverse_Sbox_ram), [rc(i/N); 0; 0; 0]);
        end
        expanded_keys(:, (i-N+1)) = bitxor(temp_key, expanded_keys(:, (i+1)));
    end
    
end