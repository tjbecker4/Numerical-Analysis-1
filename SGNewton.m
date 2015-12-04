function [x,xhist,niters] = SGNewton(funder,a,b,tolx,maxit)

% Tim Becker
% 8/31/12
% CAAM 553 Homework 1, Problem 3.
%
% [x,xhist,niters] = SGNewton(funder,a,b,tolx,maxit)
%
% SGNewton.m uses the Newton method to find a root of the function,
% while safeguarding with the Bisection method. 
%
% Input Commands
% funder     a user supplied function
%
% a,b        real numbers with a < b and f(a)*f(b) < 0
%
% tolx       a positive real number (the stopping tolerance)
%
% maxit      a positive integer specifying the max number
%           of iterations allowed.
%
% Output Commands      
% x         a real number (the approximate solution to f(x) = 0 )
%
% xhist     an array (a vector) of the values of x_k at each iterate.
%
% niters    The number of iterations that were taken.


it = 0;      %Initialization
x0 = b;
theta = .9;
gamma = .8;
fa = funder(a);
fb = funder(b);
xx = b;


[f df] = funder(b);

if abs(funder(x0))<= tolx,                       %If initial guess was within the tolerance, just return the initial guess.
    display('The initial guess was inside the tolerance so the root is the initial guess'); 
    x0, 
   
    return;
end

while(abs(funder(x0))>tolx || abs(xx-x0)>tolx*(1+x0)),    
    it = it+1;
    xhist(it+1,:) = [it x0];
    s = -f/df;                                    % Newton Step
    xx = x0+s;
    
    if sign(funder(xx))==sign(a),
        dist = abs(xx-b);
    else 
        dist = abs(xx-a);
    end
    
    
    if((abs(xx-a) < abs(b-a) && abs(xx-b) < abs(b-a)) && dist<theta*abs(b-a) && abs(funder(xx))<gamma*abs(funder(x0))), 
                                                  % Check whether to do the Newton step or bisection.
        x0 = xx;
    else
        x0 = (a+b)/2;                             % Bisection method
    end
    [f df] = funder(x0);
    if sign(f)==sign(fa),
        a = x0;
        fa = f;
    else
        b=x0;
        fb = f;
    end
    
    
    
    if(it > maxit),                                % Error message if root is not found in the maximum number of iterations. 
      display('Maximum Number of Iterations Reached'); 
      return;
    end
end

format long e
disp('                it                      x0') % Labels for the array with history of x0
disp('     =============================================== ') 
disp(xhist)                                        % Display the array with x0 history.
niters = it                                        % Show the number of iterations undertaken.
root = x0                                          % Show the root found.
