function y = Erf(x)

% Tim Becker
% 8/31/12
% CAAM 553 Homework 1, Problem 1.
%
% y = Erf(x)
%
%Test1.m gives the value of the function for problem 1 on Homework 1 for
%CAAM 553. It returns the value of the function at a given x value.

t = 5184000;  % Variable values.
Ti = 20;
Ts = -15;
alpha = .138e-6;

y = erf((x)/(2*sqrt(alpha*t)))*(Ti-Ts)+Ts; % User's function.
return
