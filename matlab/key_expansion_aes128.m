function expanded_keys = key_expansion_aes128(key, num_rows, Sbox_ram)
    % https://www.brainkart.com/article/AES-Key-Expansion_8410/
    expanded_keys = initialize_round_keys(key, num_rows);
    for i = [4:1:43]
        temp_keys = expanded_keys(:, i);
        if mod(i, 4) == 0
            temp_keys = sub_bytes(circshift(temp_keys,-1), Sbox_ram);
            n=1;
            m=0;
            while m < (i/4)-1
                n = peasants_algorithm_mult(2,n);
                m = m+1;
            end
            temp_keys = bitxor(temp_keys, [n,0,0,0]');
        end
        expanded_keys(:, i+1) = bitxor(expanded_keys(:,(i-4)+1), temp_keys);
    end
end