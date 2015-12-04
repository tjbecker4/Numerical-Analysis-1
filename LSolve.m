function [c,iflag] = Lsolve(A,p,b)

% [c, iflag] = Lsolve(A, p, b)
%
% Solves L c = b with L in lower triangle of A
% Includes pivoting at each step.
%
% Input:
% A:            the n by n matrix A overwritten with its
%               LU decomposition computed by LUfac
%               Only the strict lower triangle is referenced.
%
% p:            an n-vector containing pivot information
%
% b:            an n-vector containing the right hand side
%
% Output:
% c:            an n-vector containing the solution
%
%
% iflag:        error flag
%
%               iflag = 0 the solution completed successfully
%               iflag = 1 dimensions of A and b are incorrect
%
%

iflag = 0;                              % Initialization
n = length(b);
c = b;
[r,x] = size(A);
[m,y] = size(b);


if (x ~= m),                            % Check if dimensions match
    iflag = 1;
    disp('Error: Dimensions do not match');
    return
end
       


for j = 1:n-1,                          % Solve for L with pivots
    t = c(j);  
    c(j) = c(p(j));
    c(p(j)) = t;
   
    for i = j+1:n,
        c(i) = c(i) - A(i,j)*c(j);
    end 
end

iflag = 0;

end


