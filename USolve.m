function [x,iflag] = Usolve(A,c)

% [x, iflag] = Usolve(A, c)
%
% Solves U x = c with U in upper triangle of A
%
% Input:
%
% A:        the n by n matrix A overwritten with its
%           LU decomposition computed by LUfac
%           Only the upper triangle is referenced.
%  
% c:        an n-vector containing the right hand side
%
% Output:
% x:        an n-vector containing the solution
%
%
% iflag:    error flag
%           iflag = 0 the solution completed successfully
%           iflag = 1 dimensions of A and c are incorrect
%           iflag = k an exact zero is detected in A(k-1,k-1)
%           U is singular.
%
%



iflag = 0;                              % Initialization
x = c;
[y,r] = size(A);
[m,z] = size(c);
n = length(c);


if (r ~= m)                             % Check if dimensions are correct
    iflag = 1;
    disp('Dimensions of A and c are incorrect!');
    return
end



for j = n:-1:2,                         % Solve for U with backwards solve
    if A(j,j) == 0,                   
        iflag = j+1;
        disp('U is singular!')          % Check for singularity   
        return
    end
    x(j) = c(j)/(A(j,j));
    for i = 1:j-1,
        c(i) = c(i) - A(i,j)*x(j);
    end
end

x(1) = c(1);
iflag = 0;

end

