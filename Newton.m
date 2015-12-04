function [x,xhist, niters] = Newton(tolx,maxit)


% Input Commands
% funder    A user supplied function
% a,b       Real numbers with a<b and f(a)*f(b)<0
% tolx      Stopping tolerance
% maxit     Maximum number of iterations before terminating
%
% Output Commands
% x         A real number; the approximate solution to f(x)=0
% xhist     An array of the values of x_k at each iteration k=1,2,...
% niters    The number of iterations taken

t = 5184000;
Ti = 20;
Ts = -15;
alpha = .138e-6;

x0 = 0;
f = erf((x)/(2*sqrt(alpha*t)))*(Ti-Ts)+Ts;
fprime = 2/sqrt(pi)*exp((-(x)/(2*sqrt(alpha*t)))^2)*(Ti-Ts)*1/(2*sqrt(alpha*t));

while(abs(f(x)) > 0)
    s = -f/fprime;
    x = x+s;
    xhist(x,:) = [x 
    
     if abs(f(x)) < tolx,
     root
        
     end
    
    
end