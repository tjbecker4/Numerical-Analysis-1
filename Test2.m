function y = ErfDerivative(x)

% Tim Becker
% 8/31/12
% CAAM 553 Homework 1, Problem 1.
%
% y = Test2(x)
%
% Test2.m gives the value of the derivative for problem 1 on Homework 1 for
% CAAM 553. It returns the value of the derivative at a given x value.

t = 5184000;
Ti = 20;
Ts = -15;
alpha = .138e-6;

y = 2/sqrt(pi)*exp((-(x)/(2*sqrt(alpha*t)))^2)*(Ti-Ts)*1/(2*sqrt(alpha*t));
return
