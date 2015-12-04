%
% Tim Becker
% CAAM 553 Homework 8 Problem 4
% 11/16/2012
%
%
% HW8ScriptProblem4.m is a script for solving the heat equation
% numerically using the method of lines and the Backwards Euler method
%
% HW8ScriptProblem4.m
%
%
%

clear all
close all
clc

% Initial value
g = @(x) sin(pi*x);

global h;
global x;

for k=4:1:10

    % Method of Lines
    h = 1/(2^k+1);
    x = (h:h:1-h)';
    t = linspace(0,0.1,numel(x));

    a = (-2)*ones(numel(x),1);
    b = ones(numel(x)-1,1);
    A = (diag(a) + diag(b,1) + diag(b,-1))*(1/h.^2);
    A = sparse(A);

    [L,U] = lu(eye(numel(x))-(.1/numel(x))*A);
    y = zeros(size(A));
    y(:,1) = g(x);
   
    % Backwards Euler
    for i = 1:numel(x)-1
        
        y(:,i+1) = U\(L\(y(:,i)));
        
    end
    
    % Plot and find errors for k=4,10
    if k == 4 || k == 10
        figure
        [T,X] = meshgrid(t,x);
        mesh(T,X,y);
        xlabel('t');
        ylabel('x');
        zlabel('y');  
        title(['Solution to Heat Equation using Backwards Euler for k = ' num2str(k)]);
    
        % True solution
        u = exp(-pi^2.*T).*sin(pi.*X);
        
        % Ode45 solution
        f = @(t,z) A*z;
        [T,Y] = ode45(f,t,g(x));
        Y = Y';
        
        errrel = max(max(abs((y-u)./u)));
        err = max(max(abs(y-u)));
        err1rel = max(max(abs((Y-u)./u)));
        err1 = max(max(abs(Y-u)));
        
                        
        disp(['Relative error for computed solution when compared with given solution for k = ' num2str(k)]);
        disp(errrel)
        
        disp(['Absolute error for computed solutions when compared with given solution for k = ' num2str(k)]);
        disp(err)
    
        disp(['Relative error for ode45 compared with given solution for k = ' num2str(k)])
        disp(err1rel)
        
        disp(['Absolute error for ode45 when compared with given solution for k = ' num2str(k)])
        disp(err1)
        
        disp('-------------------------------------------------------------')
        
    end
    
end