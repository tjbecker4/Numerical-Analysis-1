%
% Tim Becker
% CAAM 553 Homework 9 Problem 2c
% 12/5/2012
%
%
% HW9Problem2Driver.m uses the generalized power method in genpower to find
% the largest eigenvalue of the matrix even though it is complex. It
% compares the eigenvalue(s) to what is given by eig as well as...
%
% HW9Problem2Driver.m
%
%
%


clear all
close all
clc

% Initialization
D = diag(randn(50,1));
xi = 10*max(abs(diag(D)));
eta = xi*randn;
D(1,1) = xi; 
D(2,2) = xi; 
D(2,1) = eta; 
D(1,2) = -eta;
[Q,R] = qr(randn(50));
A = Q'*D*Q;

L = randn(length(A(:,1)),2);

% Using the Generalized Power Method
[V,H] = genpower(A,L,1e-8);

% finding the eigenvalues of H
T1 = (H(1,1)+H(2,2))/2;
T2 = (sqrt((H(1,1)+H(2,2))^2-4*(H(1,1)*H(2,2)-H(2,1)*H(1,2))))/2;
lambda = [T1+T2 T1-T2];


disp('Maximum Magnitude Eigenvalues of A using Generalized Power');
disp('----------------------------------------------------------');
disp(lambda);


disp('Maximum Magnitude Eigenvalues of A using eigs');
disp('-------------------------------------------');
disp(eigs(A,2));

% Find eigenvalues without using eig (Upper 2X2 block of D)
la = [xi+sqrt(-eta^2) xi-sqrt(-eta^2)];

disp('Maximum Magnitude Eigenvalues of A without using eig');
disp('----------------------------------------------------');
disp(la);


