function [A,p,iflag] = LUfac(A)

% [A,p,iflag] = LUfac(A)
%
% LUfac.m takes in a matrix A and factors it into LU, a lower triangular
% matrix L and an upper triangular matrix U. It includes pivoting of the
% rows when factoring the matrix. It returns the new matrix A in LU form,
% as well as the permutation vector p.
%
% Input:
% A:            the n by n matrix A
%
% Output:
% A:            Overwritten with the LU-decomposition of A
%
% p:            a vector containing pivot information
%
% iflag:        error flag
%               iflag = 0 The LU Decomposition completed
%                         successfully
%               iflag = 1 A is not square
%

[m,n] = size(A);                       % Initialization
iflag = 0;


if (m ~= n),                           % Check if the matrix is square
    iflag = 1;
    disp('A is not square');
    return
end


p = zeros(n-1,1);                       % Initialization of permutation vector

for k = 1:n-1,
    [pivot,ik] = max(abs(A(k:n,k)));
    p(k) = ik + (k-1);

    t = A(k,k:n);                       % Pivots    
    A(k,k:n) = A(p(k),k:n);
    A(p(k),k:n) = t;

    if(pivot > 0),                     % Factoring of matrix with pivoting
         A(k+1:n,k) = A(k+1:n,k)/A(k,k);
         for j = k+1:n,
             for i = k+1:n,
                 A(i,j) = A(i,j) - A(i,k)*A(k,j);
             end
         end
    end
end



end


