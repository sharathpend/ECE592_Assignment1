function state_matrix = inverse_shift_rows(state_matrix)
    % Y = circshift(A,K) circularly shifts the elements in array A by K
    % positions. If K is an integer, then circshift shifts along the first
    % dimension of A whose size does not equal 1. If K is a vector of
    % integers, then each element of K indicates the shift amount in the
    % corresponding dimension of A.
    % Y = circshift(A,K,dim) circularly shifts the values in array A by K
    % positions along dimension dim. Inputs K and dim must be scalars.
    % https://www.mathworks.com/help/matlab/ref/circshift.html
    state_matrix(2,:) = circshift(state_matrix(2,:), 1);
    state_matrix(3,:) = circshift(state_matrix(3,:), 2);
    state_matrix(4,:) = circshift(state_matrix(4,:), -1);
end