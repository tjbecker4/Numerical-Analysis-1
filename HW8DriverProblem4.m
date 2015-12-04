%
% Tim Becker
% CAAM 553 Homework 8 Problem 4
% 11/16/2012
%
%
% HW8DriverProblem4.m is a script for solving the heat equation
% numerically using the method of lines and the Backwards Euler method
%
% HW8DriverProblem4.m
%
%
%

clear all
close all
clc

t = linspace(0,0.1,1000);
g(x) = @(x) sin(pi*x);


for k=4:10:1

h = 1/(2^k+1);
x = [h:h:1-h]';

a = (-2)*ones(numel(x),1);
b = ones(numel(x)-1,1);
A = diag(a) + diag(b,1) + diag(b,-1);
A = sparse(A);

[L,U] = lu(A);
y(:,1) = g(x);


for t=0:0.1:1000
    y=(L*U)\x;
    
end


    if k == 4 || k == 10
    
        mesh(t,x,yfinal)
        view(150,50);
        xlabel('t');
        ylabel('x');
        zlabel('Solution');
        
        
    
    end

    % Maximum error
    disp('maximum error =')
    disp(norm(ANSWER-exp(-pi^2*t)*sin(pi*x)))
    disp('Relative error compared with ode45 =')
    disp()
end




