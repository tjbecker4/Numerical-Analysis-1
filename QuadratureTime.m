function QuadratureTime(a,b)

% 
% Tim Becker
% CAAM 553 Homework 6 Problem 2
% 10/24/2012
%
% QuadratureTime.m finds the time to compute the integral of f(x) =
% exp(-x^2) using Composite-Trapezoid and Clenshaw-Curtis and compares them
% with the time required to do the same with MATLAB's 'quad' routine.
%
% function [t1,t2,t3] = QuadratureTime.m
%
% Input:
% 
% a         Left hand endpoint
% b         Right hand endpoint
%


% Initialization

fx= @(x)exp(-(x.^2));


% Composite-Trapezoid
tic; 
x = a;
sum = 0;
dx = (b-a)/20;
for i=0:20
    x = a + i*dx;
    if(i==0 || i==20)
        sum = sum + .5*fx(x);
    else
        sum = sum + fx(x);
    end
end
sum = sum*dx ; 

CompositeTrapezoid = toc

% Clenshaw-Curtis nodes

tic
omega = zeros(1,21);
y = zeros(1,21);
CC = 0;

for j=1:21
    y(j) = (a+b)/2 + cos((j-1)*pi/20)*(b-a)/2;
end

% Initialization of numerator of Lagrange for CC
z = zeros(1,20);

% Compute weights for Clenshaw-Curtis
for j=1:21
    c = 1;
    for k=1:j-1
        c = c*(y(j)-y(k));              % Denominator of Lagrange
        z(k) = y(k);                    % Roots of numerator of Lagrange 
    end
    for k=j+1:21
        c = c*(y(j)-y(k));              % Denominator of Lagrange
        z(k-1) = y(k);                  % Roots of numerator of Lagrange   
    end
   t = poly(z);
   t1 = t/c;
   tt = polyint(t1,0);
   omega(j) = polyval(tt,b)-polyval(tt,a);  
   CC = fx(y)*omega';
end

ClenshawCurtis = toc

% MATLAB's quad routine
tic;
Q = quad(fx,-1,1, 1e-15);
MATLABquad = toc

CompQuadAbsError = abs(CompositeTrapezoid-MATLABquad)
ClenQuadAbsError = abs(ClenshawCurtis-MATLABquad)



