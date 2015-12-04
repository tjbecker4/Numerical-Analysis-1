function [F] = Stieltjes(x,a,b,theta,omega)


%
% Tim Becker
% CAAM 553 Homework 7 Problem 3a
% 11/2/2012
%
% Stieltjes.m finds the value of F_n(x), the distribution for the Stieltjes
% integral.
%
% function [F] = Stieltjes(x,n,w)
%
% Input:
%
% x         Given value in [a,b]
% a         Left side of interval
% b         Right side of interval
% theta     Vector of nodes
% omega     Corresponding vector of weights
%
% Output:
% 
% F         Value of F_n(x)
%

% Bounds checking
if( sum(x-b)>=0 || sum(x-a)<=0),
    error('x is outside of the interval');
end

F = zeros(1,length(x));

% Find the value of F_n(x)
for i=1:length(x)
    F(i) = sum(omega'.*(x(i) >= theta));
end





