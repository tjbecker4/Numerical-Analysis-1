function LagrangePlot

%
% Tim Becker
% CAAM 553 Homework 6 Problem 1
% 10/24/2012
%
% LagrangePlot.m takes the values of f(x), p_1(x) and |f(x)-p_1(x)| and
% plots them together over the interval [-1,1]
%
% function LagrangePlot


f= @(x) x.^2;
p_1 = @(x) f(-1)*(x-1)/(-2)+f(1)*(x+1)/2;

x = linspace(-1,1,1000);

% Creates the axis labels and title
title('Lagrange Interpolating Polynomial'),
hold
xlabel('x')
ylabel('f(x)')


semilogy(x, f(x),'r'), axis tight, hold on
semilogy(x, p_1(x),'b'), axis tight, hold on
semilogy(x, abs(f(x)-p_1(x)),'g'), axis tight

% Creates the legend
legend('f(x)', 'p_1(x)', '|f(x)-p_1(x)|', 'location', 'eastoutside')




