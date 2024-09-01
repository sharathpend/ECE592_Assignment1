function round_keys = initialize_round_keys(round_keys_hex, num_rows)

    % Take 2 characters at a time, automatically calculate missing dimension
    % convert that value from hext to dec.
    % results in column vector with decimal value.
    round_keys_dec = hex2dec(reshape(round_keys_hex, 2, [])');

    % Convert into standard 4x4 matrix as per what is used by AEX-128.
    % I'll then expand it to 4xN matrix where N=4*number_of_round_keys
    % and each set of 4X(4*(i-1)+1:4*i) matrix where i is in 1:number_of_round_keys
    % will be a standard 4x4 matrix containt that specific round's key
    round_keys = reshape(round_keys_dec, num_rows, []);

end