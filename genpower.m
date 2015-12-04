function [L,H] = genpower(A,L,tol)

%
% Tim Becker
% CAAM 553 Homework 9 Problem 2b
% 12/5/2012
%
% genpower.m uses the generalized power method to find an invariant
% subspace so that we can find the largest eigenvalue, even if it is
% complex
%
% function [L,H] = genpower(A,L,tol)
%
%
% Input:
%
% A         Input matrix (n x n dimesions)
% L         Beginning n x k matrix
% tol       Stopping tolerance
%
% Output:
%
% L         Invariant subspace 
% H         New matrix with same eigenvalues as A


% PART B OF QUESTION 2

% Initialization
W = A*L;
H = L'*W;

% Convergence to an invariant subspace
while norm(W-L*H) > tol*norm(H)
    [L,~] = qr(W,0);
    W = A*L;
    H = L'*W;
    disp('Convergence Check')
    disp(norm(W-L*H))
end






