function [c,iflag] = Lsolve(A,p,b);

% [c, iflag] = Lsolve(A, p, b)
%
% Solves L c = b with L in lower triangle of A
% Includes pivoting at each step.
%
% input:
% A: the n by n matrix A overwritten with its
% LU decomposition computed by LUfac
% Only the strict lower triangle is referenced.
%
% p: an n-vector containing pivot information
%
% b: an n-vector containing the right hand side
%
% output:
% c: an n-vector containing the solution
%
%
% iflag: error flag
%
% iflag = 0 the solution completed successfully
% iflag = 1 dimensions of A and b are incorrect
%
%

iflag = 0;
n = length(b);
c = b;


for j = 1:n-1,
    t = c(j);
    c(j) = c(p(j));
    c(p(j)) = t;
    
    for i = j+1:n,
        c(i) = c(i) - L(i,j)*c(j);
    end
    
end
