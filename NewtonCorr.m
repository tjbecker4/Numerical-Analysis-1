function [z] = NewtonCorr(guess,maxiter,tol,F)


%
% Tim Becker
% CAAM 553 Homework 7 Problem 4a
% 11/2/2012
%
% NewtonCorr.m is the corrector using the Trapezoidal Rule in a
% predictor-corrector method for solving an ODE
%
% function [x] = NewtonCorr(guess,maxiter,dt)
%
% Input:
%
% guess     The initial guess from Forward Euler
% maxiter   The maximum number of iterations
% tol       Stopping tolerance
% F         Trapezoidal Rule Function
%
% Output:
%
% x         Newton solution 


x = zeros(maxiter,2);
x(1,:) = guess;
J = zeros(maxiter,maxiter);


for k=0:maxiter
    
    
    %J(x(k,:)) = jacobian(F,x(k,:));
    J
   
    s = (J(x(k,:)))\(-F);
    
    x(k+1,:) = x(k,:) +s;
    
    if (abs(F(x(k+1,:)) < tol))
        z = x(k+1,:);
        return;
    end
end

z = x(maxiter+1,:);

