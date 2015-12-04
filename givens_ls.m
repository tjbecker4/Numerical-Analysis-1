function [x,gamma] = givens_ls(A,b)

%
% givens_ls computes the Givens rotation of a matrix A and then solves the
% least squares problem for A*x=b
%
% function [x,rho] = givens_ls(A,b)
%
% Input:
%
% A         A random rectangular matrix
% b         A random column vector
%
% Output 
%
% x         Solution to the least squares problem after the Givens rotation
%           of A
% gamma     The least squares residual
%
%

[m,n] = size(A);

% Compute QR factorization for first n rows to obtain R
for j = 2:n
    for i = 1:j-1
        [c,s,rho] = givens_matrix(A(i,i),A(j,i));
        A(i,i) = rho;
        A(j,i) = 0;
        for k = i+1:n
            p = c*A(i,k)+s*A(j,k);
            A(j,k) = -s*A(i,k) + c*A(j,k);
            A(i,k) = p;
        end
    end
end
R = A(1:n,:);

% Factor the next incoming rows, from n+1 to m
for j = n+1:m
    a = A(j,:);
    for i = 1:n
        [c,s,rho] = givens_matrix(A(i,i),a(i));
        A(i,i) = rho;
        a(i) = 0;
        for k = i+1:n
            q = c*A(i,k) + s*a(k);
            a(k) = -s*A(j,k) + c*a(k);
            A(j,k) = q;
        end
    end
end


% Solve Rx = b by adding the column vector b to the right hand side
R = [A(1:n,:),b(1:n)];
x = R(1:n,n+1);

for i = n:-1:2
    x(i) = x(i)/R(i,i);
    for j = 1:i-1
        x(j) = x(j)-R(j,i)*x(i);
    end
end
x(1) = x(1)/R(1,1);
gamma = abs(R(n,n+1))


