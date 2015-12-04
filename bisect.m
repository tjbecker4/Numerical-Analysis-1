function [x,ithist] = bisect(f,a,b,tolx,maxit)

% Tim Becker
% 8/31/12
% CAAM 553 Homework 1, Problem 1.
%
% [x,ithist] = bisect(f,a,b,tolx,maxit)
%
% bisect.m uses the Bisection method to find a root of the function. It
% takes a function and endpoints and computes a root in the enclosed
% interval.
%
% Input Commands
% f         Name of the Matlab Function being called
% a,b       Real numbers such that f(a)*f(b)<0
% tolx      Stopping tolerance
% maxit     Maximum number of iterations before terminating. 
%
% Output Commands      
% x         Approximation of solution: x=0.5*(a+b)
% ithist    Array with iteration history

it = 0;
   


fa = f(a);
if fa==0, root = a; return; end; 
fb = f(b);
if fb==0, root = b; return; end;

if sign(fa)==sign(fb),
    display('Error: f(a) and f(b) have same sign.') % Check to see if initial conditions are met.
    return
end;


while abs(b-a) > tolx,
    c = (a+b)/2;      % Bisection Method
    fc = f(c);
    it = it+1;
    ithist(it+1,:) = [it a b c fc];
    if (fc==0), root = c, return, end;
    
    if sign(fc)==sign(fa), % Check on which endpoint to reassign.
        a = c;
        fa = fc;
    else
        b=c;
        fb = fc;
        
   if(it > maxit), %Output if root is not found in the given maximum number of iterations.
       display('Maximum Number of Iterations Reached');
       return;
    end;
   
end;
end;

disp('        it        a        b        c        fc')

disp(ithist)

root = (a+b)/2



    