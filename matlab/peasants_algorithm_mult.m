function p = peasants_algorithm_mult(a, b)
    % b = bitget(A,bit) returns the bit value at position bit in integer 
    % array A.
    % https://www.mathworks.com/help/matlab/ref/bitget.html
    % Peasant's Algorithm
    % https://en.wikipedia.org/wiki/Finite_field_arithmetic#Rijndael%27s_finite_field
    %{
        At the start and end of the algorithm, and the start and end of each iteration, this invariant is true: a b + p is the product.
        This is obviously true when the algorithm starts. When the algorithm terminates, a or b will be zero so p will contain the product.
        
        Run the following loop eight times (once per bit). It is OK to stop when a or b is zero before an iteration:
            - If the rightmost bit of b is set, exclusive OR the product p by the value of a. This is polynomial addition.
            - Shift b one bit to the right, discarding the rightmost bit, and making the leftmost bit have a value of zero.
                This divides the polynomial by x, discarding the x0 term.
            - Keep track of whether the leftmost bit of a is set to one and call this value carry.
            - Shift a one bit to the left, discarding the leftmost bit, and making the new rightmost bit zero.
                This multiplies the polynomial by x, but we still need to take account of carry which represented the coefficient of x7.
            - If carry had a value of one, exclusive or a with the hexadecimal number 0x1b (00011011 in binary).
                0x1b corresponds to the irreducible polynomial with the high term eliminated. Conceptually,
                the high term of the irreducible polynomial and carry add modulo 2 to 0.
        p now has the product
    %}
    

    p = 0;

    if bitget(b, 1)
        p = a; % equivalent to bitxor(p, a)
    end

    b = bitshift(b, -1);

    while b > 0
        a_msb = bitget(a, 8);
        a = bitshift(a, 1);

        if a_msb
            a = bitset(a, 9, 0);
            a = bitxor(a, hex2dec('1b'));
        end

        if bitget(b, 1)
            p = bitxor(p, a);
        end

        b = bitshift(b, -1);
    end
end    