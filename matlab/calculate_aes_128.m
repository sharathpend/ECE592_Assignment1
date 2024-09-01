% AES-128
% Fixed Secret Key
% Round Keys provided

function cypher_text = calculate_aes_128(plain_text)
    
    % All round keys given in problem statement. Did not implement key
    % expansion function
    round_key_1  = '000102030405060708090a0b0c0d0e0f';
    round_key_2  = 'd6aa74fdd2af72fadaa678f1d6ab76fe';
    round_key_3  = 'b692cf0b643dbdf1be9bc5006830b3fe';
    round_key_4  = 'b6ff744ed2c2c9bf6c590cbf0469bf41';
    round_key_5  = '47f7f7bc95353e03f96c32bcfd058dfd';
    round_key_6  = '3caaa3e8a99f9deb50f3af57adf622aa';
    round_key_7  = '5e390f7df7a69296a7553dc10aa31f6b';
    round_key_8  = '14f9701ae35fe28c440adf4d4ea9c026';
    round_key_9  = '47438735a41c65b9e016baf4aebf7ad2';
    round_key_10 = '549932d1f08557681093ed9cbe2c974e';
    round_key_11 = '13111d7fe3944a17f307a78b4d2b30c5';
    num_rows = 4; % row size of state matrix for AES-128
    total_rounds = 11;

    all_round_keys_hex = strcat(round_key_1, round_key_2, round_key_3, round_key_4, ...
                                round_key_5, round_key_6, round_key_7, round_key_8, ...
                                round_key_9, round_key_10, round_key_11);
    round_keys_matrix = initialize_round_keys(all_round_keys_hex, num_rows);
    
    % Calculate S-Box matrix one time.
    Sbox_ram = calc_sbox_matrix();

    % Take 2 characters at a time, automatically calculate missing
    % dimension. Convert that value from hext to dec. This results in a
    % column vector with decimal value. Then reshape it into 4x4 matrix.
    plain_text_dec = hex2dec(reshape(plain_text, 2, [])');
    state_matrix = reshape(plain_text_dec, num_rows, []);
    
    % Round 1 (Initial Round)
    round_num = 1;
    fprintf("\n\nRound = %d (Initial Round, Add Key) \t\t\t\t...\t", (round_num-1));
    state_matrix = add_round_key(state_matrix, round_keys_matrix(:,1:4));
    fprintf("Complete");
    
    % Round 2 to 10
    for round_num = 2:(total_rounds-1)
        fprintf("\nRound = %d \t\t\t\t\t\t\t\t\t\t...\t", (round_num-1));
        state_matrix = sub_bytes(state_matrix, Sbox_ram);
        state_matrix = shift_rows(state_matrix);
        state_matrix = mix_columns(state_matrix);
        state_matrix = add_round_key(state_matrix, round_keys_matrix(:, (4*(round_num-1)+1):(4*round_num)));
        fprintf("Complete");
    end
    
    % Round 11 (Final Round)
    round_num = round_num + 1;
    fprintf("\nRound = %d (Final Round, All but Mix Columns)\t...\t", (round_num-1));
    state_matrix = sub_bytes(state_matrix, Sbox_ram);
    state_matrix = shift_rows(state_matrix);
    state_matrix = add_round_key(state_matrix, round_keys_matrix(:, (4*(round_num-1)+1):(4*round_num)));
    fprintf("Complete");

    cypher_text = state_matrix(:); %changes output to column vector
    cypher_text = lower(dec2hex(cypher_text(1:length(plain_text_dec)))'); %converts output to hex
    cypher_text = cypher_text(:)'; %converts output to row vector
    fprintf("\n\nCypher Text (hex) = 0x%s\n\n", cypher_text)
end