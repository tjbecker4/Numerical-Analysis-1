function J = df2(t,y)

% Tim Becker
% 11/2/12
% CAAM 553 Homework 7, Problem 4a.
%
% function J = df2(t,y)
%
% df2.m is a function that gives the derivatives for the system of 
% first order differential equations for the predator prey model 
% for Homework 7, Problem 4a.



df = zeros(2,1);
df(1) = 1.2*y(1)-(y(1))^2-(y(1)*y(2))/(y(1)+0.2);
df(2) = (1.5*y(1)*y(2))/(y(1)+0.2)-y(2);



J = [1.2-2*y(1)-(0.2*y(2))/((y(1)+0.2)^2) (-y(1))/(y(1)+0.2);...
    0.3*y(2)/((y(1)+0.2)^2) 1.5*y(1)/(y(1)+0.2)-1];

