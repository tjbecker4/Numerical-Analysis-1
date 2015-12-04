function [x,xhist, niters, flag] = SGNewtonSolution(funder,a,b,tol,maxiter);
%
% Usage  [x,xhist, niters, flag] = SGNewton(funder,a,b,tol,maxiter);
%
% This code implements Newtons method safeguarded by Bisection
% to solve f(x) = 0
%
% Input:
%
%  funder  a Matlab function that evaluates f(x) and df(x)/dx
%          The call [f, df] = funder(x) should return f = f(x)  
%          and df = df(x)/dx
%
%     a,b  two real numbers with  a < b and  f(a)*f(b) < 0
%     tol  a  positive real number (the stopping tolerance)
%  maxitr  a positive integer (max number iterations allowed)
%
% Output:
%
%       x  a real number (the solution to f(x) = 0 )
%   xhist  an array (a vector) of the values of x_k at
%          each iteration k = 1, 2, ... up to the final
%          iterate 
%  niters  the number of iterations taken
%    flag  an integer signifying stopping condition
%
%          flag = 0   normal return with x as a solution
%          flag = 1   incorrect input detected - either a > b 
%                     or f(a)*f(b) > 0
%          flag = 2   niters exceeded maxiter x is probably 
%                     not a solution

%
% set default tolerances if necessary
%
if( nargin <= 3 ) tolx = 1.e-7; maxiter = 100; end
if( nargin <= 4 ) maxiter = 100; end


iter=1;
flag = 0;
gamma = .5;
theta = .8;

xhist=[];
niters=[];

[fa, dfa] = feval(funder,a);
[fb, dfb] = feval(funder,b);
if (a >= b | sign(fa) == sign(fb) ) 
   flag = 1; % incorrect input flagged
   return
end


x = a + (b - a)/2;
[fx, dfx] = feval(funder,x);
f0 = abs(fx); 

%  In the code below,
%
%     fa, dfa  are function value and derivative at a
%     fb, dfb  are function value and derivative at b
%     fx, dfx  are function value and derivative at x
%     
%              x is the current Newton iterate
%


%
%  set an artificial xold to pass through convergence test the first time
%
xold = inf;

%
%  The stopping rule here assures that the iterate x  will not be
%  accepted until there are -log(tol) digits of accuracy (i.e. tol = 10^{-d}
%  will assure d digits of accuracy)  in the solution and also that the
%  function has been reduced from its original value by a factor of tol
%  This may cause there to be more iterations taken than is actually required
%  to achieve the desired accuracy.   Indeed, that is the case for this problem.
%  However, the idea here is to be sure there have been enough iterations to 
%  reach the desired accuracy.   If one or two more iterations were taken than 
%  necessary, that is acceptable as a necessary cost of a guaranteed result. 
%  
%

while (abs(fx) > tol*(1 + f0)  | abs(x - xold)  > (1 + abs(x))*tol) 
    xold = x;
    fold = fx;
    iter=iter+1;
    bisect = true;
%
%   Basic Newton Step
%
    c = x-fx/dfx;  
    if(a < c & c < b),
%
%      c within interval,  evaluate f(c) and df(c)/dx
%                          set x = c   
%
       [fc,dfc] = feval(funder,c);
       x = c; fx = fc; dfx = dfc;
       if (fc == 0),
%
%          return with solution
%
           xhist=[xhist;x];
           niters =  iter;
           return;
       end
   
       if(abs(fc) < gamma*abs(fold)),
%
%         accept Newton step but do NOT reduce
%         the interval,   sufficient decrease in abs(f(x))
%         was achieved with this step
%
          
          bisect = false;

       end
    else
%
%      determine that Newton step will reduce interval length
%      by a factor of theta
%
       if (sign(fa) == sign(fc) & (b - c) < theta*(b - a)),

          a = c; fa = fc;  dfa = dfc;
          bisect = false;

       end

       if (sign(fb) == sign(fc) & (c - a) < theta*(c - a)),

          b = c; fb = fc;  dfb = dfc;
          bisect = false;

       end
    end
%
%   if bisect is false then a Newton step was accepted and
%   the bisection step is skipped.
%

    if (bisect),
%
%      take a bisection step
%
   
       c = a + (b - a)/2;
       [fc,dfc] = feval(funder,c);
       if (fc == 0),
%
%          return with solution
%
           x = c; fx = fc; 
           xhist=[xhist;x];
           niters = iter;
           return;

       end
%
%      do a bisection step
%

       if (sign(fa) == sign(fc) ),

          a = c; fa = fc;  dfa = dfc;

       else

          b = c; fb = fc;  dfb = dfc;

       end
%
%      reset current Newton iterate to
%      best point 
%
    
       if (abs(fa) < abs(fb)),
          x = a; fx = fa; dfx = dfa;
       else
          x = b; fx = fb; dfx = dfb;
       end

    end


    xhist=[xhist;x];
    if (iter > maxiter),
       flag = 2;  % max iters exceeded flagged
       niters=iter;
       return
    end
end
niters=iter;

