function dy = f2(t,y)

% Tim Becker
% 11/2/12
% CAAM 553 Homework 7, Problem 4a.
%
% function dy = f2(t,y)
%
% f2.m is a function that gives the system of first order differential
% equations for the predator prey model for Homework 7, Problem 4a


dy = zeros(2,1);
dy(1) = 1.2*y(1)-(y(1))^2-(y(1)*y(2))/(y(1)+0.2);
dy(2) = (1.5*y(1)*y(2))/(y(1)+0.2)-y(2);


