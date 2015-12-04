function dy = f1(time,y)

% Tim Becker
% 11/2/12
% CAAM 553 Homework 7, Problem 4a.
%
% function dy = deriv1(time,y)
%
% deriv1.m is a function that gives the system of first order differential
% equations for the second order system for Homework 7, Problem 4a


dy = zeros(2,1);
dy(1) = @(y) y(2);
dy(2) = @(y) -8*exp(t)*cos(2*t)+3*y(2)+4*y(1);




