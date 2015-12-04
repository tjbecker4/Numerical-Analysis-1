function [NC,CC,x,y] = Quadweights(a,b,n)

%
% Tim Becker
% CAAM 553 Homework 6 Problem 2
% 10/24/2012
%
% Quadweights.m takes in a function and computes the quadrature weights for 
% Newton-Cotes and Clenshaw-Curtis.
%
% function [NC,CC] = Quadweights(a,b,n)
%
% Input:
% 
% a         The left endpoint
% b         The right endpoint
% n         Number of nodes + 1
%
% Output:
%
% NC        An array of Newton-Cotes weights
% CC        An array of Clenshaw-Curtis weights
% x         A vector of Newton-Cotes nodes
% y         A vector of Clenshaw-Curtis nodes



% Initialization of weight vectors
NC = zeros(1,n+1);
CC = zeros(1,n+1);

% Newton-Cotes nodes
x = linspace(a,b,n+1);

% Initialization of numerator of Lagrange for NC
q = zeros(1,n);

% Compute weights for Newton-Cotes
for j=1:n+1
    c=1;
    for k=1:j-1
        c = c*(x(j)-x(k));           % Denominator of Lagrange
        q(k) = x(k);                 % Roots of numerator of Lagrange
    end
    for k=j+1:n+1
        c = c*(x(j)-x(k));           % Denominator of Lagrange
        q(k-1) = x(k);               % Roots of numerator of Lagrange
    end
   p = poly(q);
   p1 = p/c;
   pt = polyint(p1,0);
   NC(j) = polyval(pt,b)-polyval(pt,a);
end

% Clenshaw-Curtis nodes

y = zeros(1,n+1);

for j=1:n+1
    y(j) = (a+b)/2 + cos((j-1)*pi/n)*(b-a)/2;
end

% Initialization of numerator of Lagrange for CC
z = zeros(1,n);

% Compute weights for Clenshaw-Curtis
for j=1:n+1
    c = 1;
    for k=1:j-1
        c = c*(y(j)-y(k));              % Denominator of Lagrange
        z(k) = y(k);                    % Roots of numerator of Lagrange 
    end
    for k=j+1:n+1
        c = c*(y(j)-y(k));              % Denominator of Lagrange
        z(k-1) = y(k);                  % Roots of numerator of Lagrange   
    end
   t = poly(z);
   t1 = t/c;
   tt = polyint(t1,0);
   CC(j) = polyval(tt,b)-polyval(tt,a);  
end










