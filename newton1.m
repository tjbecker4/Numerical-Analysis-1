function [x] = newton1(x0,tolx)


% newton1.m uses the Newton method to find a root of the function. It takes
% an initial "guess" and computes a root of the function.
%
% Input Commands
% x0        Original guess at root of function.
% tolx      Stopping tolerance.
%
% Output Commands
% x         Approximation of Solution.
%
%

function f(x)
t = 5184000;
Ti = 20;
Ts = -15;
alpha = .138e-6;

f(x) = erf((x)/(2*sqrt(alpha*t)))*(Ti-Ts)+Ts;       %% The user's function.
	return;
    
function fprime(x)
t = 5184000;
Ti = 20;
Ts = -15;
alpha = .138e-6;

fprime(x) = 2/sqrt(pi)*exp((-(x)/(2*sqrt(alpha*t)))^2)*(Ti-Ts)*1/(2*sqrt(alpha*t));
return

x = x0;   
fx = f(x0);
if abs(fx) <= tolx             %% check to see if initial guess satisfies
    root = x                      
end;


while abs(fx) > tolx,
  if fprime(x)==0,                    
    error('The derivative is 0')   %% If the derivative is 0, the error function prints message and exits
  end;

  x = x - fx/fprime(x);               %% Newton step
  fx = f(x);
  display('x=%d, fx=%d\n',x,fx)
  root = x
end;


