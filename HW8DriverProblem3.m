%
% Tim Becker
% CAAM 553 Homework 8 Problem 3
% 11/16/2012
%
%
% HW8DriverProblem3.m is the driver for the power, inverse power, and
% Rayleigh-Quotient methods for solving for eigenvalues. 
%
% HW8DriverProblem3.m
%
%
%

clear all
close all
clc


a = 2*ones(100,1);
b = ones(99,1)*(-1);
A = diag(a) + diag(b,1) + diag(b,-1);
tol = 1e-8;

v0 = randn(100,1);

disp('Largest eigenvalue with Power Method')
disp('------------------------------------')

[v,lambda,niters] = pow(A,v0,tol,'pow',0);


disp('Eigenvalue = ')
disp(lambda)
disp('Number of Iterations = ')
disp(niters)


% Check convergence
disp('Convergence check = ')
disp(norm(A*v-v*lambda,inf))
disp('tol*norm(A,1) = ')
disp(tol*norm(A,1))

disp('Largest eigenvalue with Inverse Power Method')
disp('---------------------------------------------')

[v,lambda,niters] = pow(A,v0,tol,'invpow',4);


disp('Eigenvalue = ')
disp(lambda)
disp('Number of Iterations = ')
disp(niters)

% Check convergence
disp('Convergence check = ')
disp(norm(A*v-v*lambda,inf))
disp('tol*norm(A,1) = ')
disp(tol*norm(A,1))

disp('Smallest eigenvalue with Inverse Power Method')
disp('---------------------------------------------')

[v,lambda,niters] = pow(A,v0,tol,'invpow',0);

disp('Eigenvalue = ')
disp(lambda)
disp('Number of Iterations = ')
disp(niters)

% Check convergence
disp('Convergence check = ')
disp(norm(A*v-v*lambda,inf))
disp('tol*norm(A,1) = ')
disp(tol*norm(A,1))

disp('Largest eigenvalue with Rayleigh Quotient Method')
disp('------------------------------------------------')

[v,lambda,niters] = pow(A,v0,tol,'rqi',4);


disp('Eigenvalue = ')
disp(lambda)
disp('Number of Iterations = ')
disp(niters)

% Check convergence
disp('Convergence check = ')
disp(norm(A*v-v*lambda))
disp('tol*norm(A,1) = ')
disp(tol*norm(A,1))

disp('Smallest eigenvalue with Rayleigh Quotient Method')
disp('-------------------------------------------------')

[v,lambda,niters] = pow(A,v0,tol,'rqi',0);


disp('Eigenvalue = ')
disp(lambda)
disp('Number of Iterations = ')
disp(niters)

% Check convergence
disp('Convergence check = ')
disp(norm(A*v-v*lambda))
disp('tol*norm(A,1) = ')
disp(tol*norm(A,1))


