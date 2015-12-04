function [v,lambda,niters] = pow(A,v0,tol,method,sigma)

%
% Tim Becker
% CAAM 553 Homework 8 Problem 3
% 11/16/2012
%
% pow.m uses the power method, inverse power method, or Rayleigh Quotient
% to solve for an eigenvalue and eigenvector of the given matrix A
%
% function [v,lambda,niters] = pow(A,v0,tol,method,sigma)
%
%
% Input:
%
% A         Input matrix
% v0        Guess at eigenvector
% tol       Stopping tolerance
% method    Which method to use
% sigma     Shift close to eigenvalue of interest
%
% Output:
%
% v         The found eigenvector
% lambda    The found eigenvalue
% niters    The number of iterations taken



niters = 0;

% Power Method (uses inf norm)
if strcmp(method,'pow'),
    
    v = v0/norm(v0,inf);
    lambda = 0;
    w = A*v;
    
    while (norm(w-v*lambda,inf)>tol*norm(A,1))
       [~,j] = max(w);
       lambda = w(j);
       v = w/lambda;
       w = A*v;
       niters = niters + 1;
    end  
end

% Inverse Power Method (uses inf norm)
if strcmp(method,'invpow'),
    v = v0/norm(v0,inf);
    w = (A-sigma*eye(size(A)))\v;
    lambda = 0;
    while(norm(A*v-v*lambda,inf)>tol*norm(A,1))
        [~,j] = max(abs(w));
        mu = w(j);
        lambda = sigma + 1/mu;
        v = w/mu;
        w = (A-sigma*eye(size(A)))\v;
        niters = niters + 1;
    end
end

% Rayleigh Quotient Method (uses 2 norm)
if strcmp(method,'rqi'),
    lambda = 0;
    v = v0/norm(v0);
    w = (A-sigma*eye(size(A)))\v;
    while(norm(A*v-v*lambda)>tol*norm(A,1))
        lambda = sigma + (conj(w)'*v)/(conj(w)'*w);
        v = w/norm(w);
        sigma = lambda;
        w = (A-sigma*eye(size(A)))\v;
        niters = niters + 1;
    end
end


