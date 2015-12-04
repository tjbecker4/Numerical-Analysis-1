function [a, b, x, ithist, iflag] = bisectsolution( f, a, b, tolx, maxit )
%
%  function [a, b, x, ithist, iflag] = bisect( f, a, b, tolx, maxit )
%
%  use the bisection method to compute an approximate root of f.
%
%  Input parameters:
%    f       name of a matlab function that evaluates 
%    a, b    real numbers satisfying f(a)*f(b) < 0
%    tolx    stopping tolerance (optional. Default tolx = 1.e-7)
%            the bisection method stops if  b-a < tolx
%    maxit   maximum number of iterations (optional. Default maxit = 100)
%
%
%  Output parameters:
%    a, b    real numbers satisfying f(a)*f(b) < 0; a root of f is
%            located between a and b
%    x       approximation of the solution. x = 0.5*(a+b).
%    ithist  array with the iteration history
%            The i-th row of ithist contains  [it, a, b, c, fc]
%    ifag    return flag
%            iflag = -1  error in input data, f(a)*f(b) > 0
%            iflag =  0  |b-a| < tolx and |x-x*| < 0.5*tolx, where x*
%                        is a root of f
%            iflag =  1  iteration terminated because maximum number of 
%                        iterations was reached. |b-a| >= tolx
%
%
%  Matthias Heinkenschloss
%  Department of Computational and Applied Mathematics
%  Rice University
%  Jan 17, 2002
%
%

if (b < a), t = a; a = b; b = t; end
%fa = feval(f, a);
%fb = feval(f, b);
fa=f(a);
fb=f(b);
if( sign(fa) == sign(fb) ),
   iflag = -1;
   return
end

% set tolerances if necessary
if( nargin < 4 ) tolx = 1.e-7; maxit = 100; end
if( nargin < 5 ) maxit = 100; end
   
it    = 0;
iflag = 0;
while( it < maxit & abs(b-a) >= tolx )
   c  = a + (b-a)/2;
   %   fc = feval(f, c);
   fc=f(c);
   ithist(it+1,:) = [it, a, b, c, fc];
   
   if( fc == 0 )
       x=c;
       return;
   end
   
   if( sign(fc) == sign(fb) ),
       b = c; fb = fc;
   else
       a = c; fa = fc;
   end
   it = it+1;
end

x = a + (b-a)/2; 

% check why the bisection method truncated and set iflag
if( abs(b-a) >= tolx )
    % the bisection method truncated because the maximum number of iterations
    % was reached
    iflag = 1;
    return
end