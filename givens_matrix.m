function [c,s,rho] = givens_matrix(xi, eta)

%
% givens_matrix.m takes in a column vector with 2 elements and solves for
% c and s in the givens matrix to use in givens rotation.
%
% function [c,s,rho] = givens_matrix(xi,eta)
%
% Input
%
% xi        First entry of the column vector
% eta       Second entry of the column vector
%
% Output
%
% c         corresponding c of the givens matrix
% s         corresponding s of the givens matrix
% rho       new value after the matrix has zero-ed out everything below

% Check if eta is 0
if eta == 0
    c = 1;
    s = 0;
    rho = xi;
    
% Check if xi is 0    
else if xi == 0
        c = 0;
        s = -1;
        rho = eta;
        
% Find values for c and s depending on which is larger between xi and eta        
else if abs(xi) > abs(eta)
        q = eta/xi;
        rho = sqrt(1+q^2);
        c = 1/rho;
        s = q*c;
        rho = xi*rho;
    else
        q = xi/eta;
        rho = sqrt(1+q^2);
        s = 1/rho;
        c = q*s;
        rho = eta*rho;
    end
    end
end