function [theta,omega] = ChebyGauss(n,type)

%
% Tim Becker
% CAAM 553 Homework 7 Problem 3b
% 11/2/2012
%
% ChebyGauss.m 
%
% function = ChebyGauss(n,type) computes the nodes and weights of first or
% second kind Chebyshev polynomials and plots F_n and F. Additionally, it
% compares the nodes and weights to known formulas using norms to check the
% accuracy of the computed solution.
%
%
% Input:
%
% n         number of zeros for the quadrature
% type      Chebyshev first or second kind
%
% Output:
%
% theta     Chebyshev nodes
% omega     Chebyshev weights
%

T = zeros(n,n);

if n < 2
    error('n must be greater than 1');
end

if type == 1,
    T(1:2,1:2) = diag(1/sqrt(2),1) + diag(1/sqrt(2),-1); 
    else if type == 2,
        T(1:2,1:2) = diag((1/2),1) + diag((1/2),-1);
        else
            error('Incorrect Chebyshev Type');
        end
end

T(2:n,2:n) = diag((1/2)*ones(1,n-2),1) + diag((1/2)*ones(1,n-2),-1);

[Q,D] = eig(T);

theta = diag(D);

% finding mu from the integral of the weight functions for 
% Chebyshev first and second kind
if type == 1,
    mu = pi;
else
    mu = pi/2;
end

omega = mu*Q(1,:).^2;

  






    

