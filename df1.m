function J = df1(t,y)

% Tim Becker
% 11/2/12
% CAAM 553 Homework 7, Problem 4a.
%
% function J = df1(t,y)
%
% df1.m is a function that gives the derivatives of the system of 
% first order differential equations for the second order system 
% for Homework 7, Problem 4a.


df = zeros(2,1);
df(1) =  y(2);
df(2) = -8*exp(t)*cos(2*t)+3*y(2)+4*y(1);

J = [ 0 1; 4 3];
