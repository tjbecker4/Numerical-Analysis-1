% This script solves problem 1 from the homework
% Parameters for the problem.
Ti=20;
Ts=-15;
alpha=0.138*1e-6;
%
% 60 days must be converted to seconds
%
t=60*24*3600 ;

% The function and its derivative

f = @(x) (Ts+(Ti-Ts)*erf(x/(2*sqrt(alpha*t))));
df = @(x) ((Ti-Ts)*exp(-(x/(2*sqrt(alpha*t)))^2)*(1/(sqrt(pi*alpha*t))));

% Right Endpoint: Upper bound for bisection

xbar=4;

% Plot the function.  Note xbar was determined by plotting the
% function.

xspan=linspace(0,xbar);
plot(xspan,f(xspan),'-','linewidth',1.5)
hold on
plot(xspan,0*xspan,'k','linewidth',1.5)
hold off
title('Graph of Temperature','fontsize',18)
xlabel('Depth of Water Main in Meters','fontsize',12)
ylabel('Temperature in Degrees C','fontsize',12)


% solve using bisection 

[a b x ithist iflag] = bisect(f,0,xbar,1e-6,20);
disp(x)
disp(['x from Bisection == ' num2str(x,'%21.15e')])


% Solve using Newton's method
% First with starting value x_0 = .01 meters and then with x_0 = xbar;
for x= [.01 2  xbar],

   tol=1E-16;
   iter=1;
   
   xhist=[];
   niters=[];
   fx=f(x);
   
   %
   % Note, some students may have used the relative change in x as stopping criteria.
   % Or, they may have used a combination.   All are acceptable as long as they
   % observe the quadratic convergence.
   %
   disp(['x_0 == ' num2str(x,'%21.15e')])
   while ( (abs(fx)) > tol ), 
       dfx=df(x);
       x=x-fx/dfx;  
       fx=f(x);
       iter=iter+1;
       xhist=[xhist;x];
   end
   niters=iter-1;

   disp(['x from Newton == ' num2str(x,'%21.15e')])

     fprintf('iteration  |       x value       \n');
     fprintf('-----------|---------------------\n');
     for i=1:niters
        fprintf('%5d      | %21.15e\n',i,xhist(i))
     end
     fprintf('           |                     \n');

end
   
            