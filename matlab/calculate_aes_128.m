% spendya@ncsu.edu
% NC State - ECE 592 - Assignment 1
% AES-128
% Fixed Secret Key
% Round Keys Provided
% https://github.com/sharathpend/ECE592_Assignment1
% You might have to request access if you want to see that repo.

function cipher_text = calculate_aes_128(plain_text, key, debug)
    
    if nargin > 3
        fprintf("Too many arguments.");
    elseif nargin < 1
        fprinf("Too few arguments.");
    elseif nargin == 1
        key = '000102030405060708090a0b0c0d0e0f';
        debug = 0;
    elseif nargin == 2
        debug = 0;
    end

    % All round keys given in problem statement. Did not implement key
    % expansion function
    %round_key_1  = '000102030405060708090a0b0c0d0e0f';
    %round_key_2  = 'd6aa74fdd2af72fadaa678f1d6ab76fe';
    %round_key_3  = 'b692cf0b643dbdf1be9bc5006830b3fe';
    %round_key_4  = 'b6ff744ed2c2c9bf6c590cbf0469bf41';
    %round_key_5  = '47f7f7bc95353e03f96c32bcfd058dfd';
    %round_key_6  = '3caaa3e8a99f9deb50f3af57adf622aa';
    %round_key_7  = '5e390f7df7a69296a7553dc10aa31f6b';
    %round_key_8  = '14f9701ae35fe28c440adf4d4ea9c026';
    %round_key_9  = '47438735a41c65b9e016baf4aebf7ad2';
    %round_key_10 = '549932d1f08557681093ed9cbe2c974e';
    %round_key_11 = '13111d7fe3944a17f307a78b4d2b30c5';
    num_rows = 4; % row size of state matrix for AES-128
    num_cols = 4;
    total_rounds = 11;

    % Calculate S-Box matrix one time.
    Sbox_ram = calc_sbox_matrix();

    %all_round_keys_hex = strcat(round_key_1, round_key_2, round_key_3, round_key_4, ...
    %                            round_key_5, round_key_6, round_key_7, round_key_8, ...
    %                            round_key_9, round_key_10, round_key_11);
    %round_keys_matrix = initialize_round_keys(all_round_keys_hex, num_rows);

    round_keys_matrix = key_expansion_aes128(key, num_rows, Sbox_ram);
    

    % Take 2 characters at a time, automatically calculate missing
    % dimension. Convert that value from hext to dec. This results in a
    % column vector with decimal value. Then reshape it into 4x4 matrix.
    % Working in decimal as bitxor() works with numbers.
    plain_text_dec = hex2dec(reshape(plain_text, 2, [])');
    display_message_length = length(plain_text_dec); % =16
    state_matrix = reshape(plain_text_dec, num_rows, num_cols);
    
    % Round 0 (Initial Transformation)
    round_num = 1;
    if debug >= 1
        fprintf("\n\nRound = %d (Initial Transformation, Add Key) Start", (round_num-1));
    end

    state_matrix = add_round_key(state_matrix, round_keys_matrix(:,1:4));

    if debug >= 2
        state_matrix_hex_str = conv_state_to_hex_str(state_matrix, display_message_length);
        fprintf("\n State after Initial Transform  = 0x%s", lower(state_matrix_hex_str));
    end
    if debug >= 1
        fprintf("\nRound = %d End", (round_num-1));
    end
    
    % Round 1 to 10
    for round_num = 2:(total_rounds)
        if debug >= 1
            fprintf("\n\nRound = %d Start", (round_num-1));
        end
        
        % Sub Bytes
        state_matrix = sub_bytes(state_matrix, Sbox_ram);
        if debug >= 2
            state_matrix_hex_str = conv_state_to_hex_str(state_matrix, display_message_length);
            fprintf("\n State after Sub Bytes     = 0x%s", lower(state_matrix_hex_str));
        end

        % Shift Rows
        state_matrix = shift_rows(state_matrix, 1);
        if debug >= 2
            state_matrix_hex_str = conv_state_to_hex_str(state_matrix, display_message_length);
            fprintf("\n State after Shift Rows    = 0x%s", lower(state_matrix_hex_str));
        end

        % Mix Columns
        if round_num ~= total_rounds
            state_matrix = mix_columns(state_matrix);
            if debug >= 2
                state_matrix_hex_str = conv_state_to_hex_str(state_matrix, display_message_length);
                fprintf("\n State after Mix Cols      = 0x%s", lower(state_matrix_hex_str));
            end
        end
        
        % Add Round Key
        state_matrix = add_round_key(state_matrix, round_keys_matrix(:, (((round_num-1)*4)+1):(round_num*4)));
        if debug >= 2
            state_matrix_hex_str = conv_state_to_hex_str(state_matrix, display_message_length);
            fprintf("\n State after Add Round Key = 0x%s", lower(state_matrix_hex_str));
        end

        if debug >= 1
            fprintf("\nRound = %d End", (round_num-1));
        end
    end

    cipher_text = conv_state_to_hex_str(state_matrix, display_message_length);
    cipher_text_lower_case = lower(cipher_text);

    if debug >= 1
        fprintf("\n\nCypher Text Upper Case (hex) = 0x%s", cipher_text);
        fprintf("\nCypher Text Lower Case (hex) = 0x%s\n\n", cipher_text_lower_case);
    end

    cipher_text = cipher_text_lower_case;
end