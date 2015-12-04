function ErfPlot

% Tim Becker
% 8/31/12
% CAAM 553 Homework 1, Problem 1.
%
% ErfPlot
%
% ErfPlot.m plots the given function from 0 to 3, demonstrating that f(0)<0
% and f(3)>0, so the Intermediate Value Theorem confirms that there must be
% a root in this interval. We see the short-term behavior of the
% temperature as the depth of the soil changes.

t = 5184000; % Variable values for the function.
Ti = 20;
Ts = -15;
alpha = .138e-6;


x = 0:.1:4;                                  % The plotting region.
y = erf((x)/(2*(alpha*t)^(1/2)))*(Ti-Ts)+Ts; % USer's function.
plot(x,y)
xlabel('Meters') 
ylabel('Soil Temperature (in Celsius)')
title('CAAM 553 Problem 1 Plot: Temperature of Soil vs. Depth')