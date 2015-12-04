function dy = heat(t,y)

%
% Tim Becker
% CAAM 553 Homework 8 Problem 4
% 11/16/2012
%
% heat.m is called by ode45 to solve our semi-discretized ODE system from 
% the heat equation.
%
% function dy = heat(t,y)
%
%
% Input:
%
% t         A time vector
% y         A vector for y
%
% Output:
%
% dy        The solution to A*y
%


global h;
global x;

dy = zeros(numel(x),1);

dy(1) = (-2*y(1)+y(2))*((0.1/numel(x))*(1/h.^2));

for j = 2:numel(x)-1
    dy(j) = (y(j-1) -2*y(j) + y(j+1))*((0.1/numel(x))*(1/h.^2));
end

dy(numel(x)) = (y(numel(x)-1) - 2*y(numel(x)))*((0.1/numel(x))*(1/h.^2));
