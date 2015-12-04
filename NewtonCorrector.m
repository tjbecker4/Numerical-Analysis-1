function [x] = NewtonCorrector(fx,fpx,tolx,guess)

% Tim Becker
% 11/2/12
% CAAM 553 Homework 7, Problem 4a.
%
% function [x] = NewtonCorrector(fx,fpx,tolx,guess)
%
% NewtonCorrector.m uses the Newton method to find a root of the function. It 
% takes an initial "guess" and computes a root of the function. It is used
% here as a corrector for a predictor-corrector ODE solver
%
% Input Commands
% fx        ODE system
% fpx       Derivatives of ODE system
% tolx      Stopping tolerance.
% guess     Initial guess at root of function.
% t         Time steps
%
% Output Commands
% x         Approximation of Solution.
%


 
fx0 = fx(guess);
fpx0 = fpx(guess);

if norm(fx0) <= tolx,
    display('The initial guess was inside the tolerance, so the root is the initial guess'); %If initial guess was within the tolerance, just return the initial guess.
    x = guess;
    return;
end;

while norm(fx0) > tolx,
    fx0 = fx(guess);
    fpx0 = fpx(guess);
  if fpx0==0,                    
    error('The Jacobian is 0')   % If the derivative is 0, the error function prints message and exits
  end;
  s = (fpx0)\(-fx0);
  
  x = guess + s;              % Newton step
  
  guess = x;
  

end;



