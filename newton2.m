function [x,ithist] = newton2(fx,fpx,tolx,maxit)

% Tim Becker
% 8/31/12
% CAAM 553 Homework 1, Problem 1.
%
% [x,ithist] = newton2(fx,fpx,tolx,maxit)
%
% newton1.m uses the Newton method to find a root of the function. It takes
% an initial "guess" and computes a root of the function.
%
% Input Commands
% x0        Original guess at root of function.
% tolx      Stopping tolerance.
% maxit     Maximum number of iterations before terminating. 
%
% Output Commands
% x         Approximation of Solution.
% ithist    Array with iteration history
%

x0 = 4;

it = 0;
 
fx0 = fx(x0);
fpx0 = fpx(x0);

if abs(fx0) <= tolx,
    display('The initial guess was inside the tolerance, so the root is the initial guess'); %If initial guess was within the tolerance, just return the initial guess.
    x0;
    return;
end;


while abs(fx0) > tolx,
    it = it +1;
    ithist(it+1,:) = [it x0 fx0 fpx0];
    fx0 = fx(x0);
    fpx0 = fpx(x0);
  if fpx0==0,                    
    error('The derivative is 0')   % If the derivative is 0, the error function prints message and exits
  end;

  x = x0 - fx0/fpx0;               %% Newton step
 
  x0 = x;
  
  if(it > maxit)
      display('Maximum Number of Iterations Reached');
      return;
  end;

end;
disp('       it        x0      fx0      fpx0')

disp(ithist)


