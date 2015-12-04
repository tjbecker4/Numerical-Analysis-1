function [L,U,P] = LUperm(A,p,iflag)

%
% function [L,U,P] = LUperm(A,p)
%
% LUperm.m takes the output of LUfac1(A) and returns a permutation matrix
% P, a unit lower triangular matrix L, and an upper triangular matrix U.
%
% Input:
% A1        LU factorization of a given matrix A
% p         A vector containing the pivoting information from the LU
%           factorization
%
% Output:
% L         A unit lower triangular matrix such that PA=LU
% U         An upper triangular matrix such that PA=LU
% P         A permutation matrix such that PA=LU
%
%



if iflag ~= 0,    % Check whether LU factorization was successful
    disp('Error: LU Factorization was unsuccessful');
    return
end

[m,n] = size(A);

% Initialize our permutation matrix
P = eye(n); 

% Initialize L
L = P + tril(A,-1);

% Find U
U = triu(A);


% Change the final value of p from 0 to n
if p(end) == 0,
    p(end) = n;
end

% Switch the rows back
for i = 1:n,
    P([i,p(i)], :  ) = P([p(i),i], :  );
    L([i,p(i)],1:i-1) = L([p(i),i],1:i-1); 
end



