function expanded_keys = key_expansion_aes128(key, num_rows, Sbox_ram)
    % https://en.wikipedia.org/wiki/AES_key_schedule

    expanded_keys = initialize_round_keys(key, num_rows);
    rc = [01 02 04 08 hex2dec('10') hex2dec('20') hex2dec('40') hex2dec('80') hex2dec('1B') ...
          hex2dec('36')];
    N = 4;
    num_rounds = 11;
    
    for i = 4:((4*num_rounds)-1)
        temp_key = expanded_keys(:, i);
        if mod(i, 4) == 0
            temp_key = bitxor(sub_bytes(circshift(temp_key,-1), Sbox_ram), [rc(i/N); 0; 0; 0]);
        end
        expanded_keys(:, (i+1)) = bitxor(temp_key, expanded_keys(:, (i-N)+1));
    end
    
end