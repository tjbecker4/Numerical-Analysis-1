function [f df] = funder(x)

% Tim Becker
% 8/31/12
% CAAM 553 Homework 1, Problem 3.
%
% [f df] = funder(x)
%
% funder.m is a function that allows the user to use the function as well
% as the derivative. It is, thus, called into the safeguarded Newton method
% script.

f = (x-10)*(x-20)*(x-30); % User's function
df = 3*x^2-120*x+1100;     % Derivative
return

