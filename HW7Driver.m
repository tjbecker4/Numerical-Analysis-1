%
% Tim Becker
% CAAM 553 Homework 7 Problem 3b
% 11/2/2012
%
%
% HW7Driver.m is the driver for the Chebyshev Gauss Quadrature for plotting
% the values of F_n and F with various values of n
%
% HW7Driver.m
%
%
%

clear all
close all
clc

n = [10 20 50 100 500];

x = linspace(-1,1,1000);

for i=1:length(n),
    
    [theta1 omega1] = ChebyGauss(n(i),1);
    [theta2 omega2] = ChebyGauss(n(i),2);
    
    F1 = Stieltjes(x,-1,1,theta1,omega1);
    F2 = Stieltjes(x,-1,1,theta2,omega2);
   
    
    if(n(i) == 50 || n(i) == 500), 
        figure(1)
        hold on
        plot(x,F1,'r');
        figure(2)
        hold on
        plot(x,F2,'r');
        
        
        theta1nodes = -cos(pi*(2*(1:n(i))-1)./(2*n(i)));
        theta2nodes = -cos(((1:n(i))*pi)/(n(i)+1));
        omega1weights = pi/n(i);
        omega2weights = (pi/(n(i)+1))*(sin(((1:n(i))*pi)/(n(i)+1))).^2;
        
        disp('n = ')
        disp(n(i));
        Error1 = norm((theta1'-theta1nodes))/norm(theta1nodes);
        disp('Relative error in first kind Chebyshev nodes:');
        disp(Error1);
        Error2 = norm((theta2'-theta2nodes))/norm(theta2nodes);
        disp('Relative error in second kind Chebyshev nodes:');
        disp(Error2);
        Error3 = norm((omega1'-omega1weights))/norm(omega1weights);
        disp('Relative error in first kind Chebyshev weights:');
        disp(Error3);
        Error4 = norm((omega2-omega2weights))/norm(omega2weights);
        disp('Relative error in second kind Chebyshev weights:');
        disp(Error4);
        
    end
end

figure(1)
plot(x,asin(x)-asin(-1),'b');
legend('F_{50}(x)','F_{500}(x)','F(x)','location','northeast');
title('Chebyshev First Kind Polynomials');
xlabel('x');
ylabel('f(x)');

figure(2)
plot(x,(1/2)*(sqrt(1-x.^2).*x+asin(x))-(1/2)*asin(-1),'b');
legend('F_{50}(x)','F_{500}(x)','F(x)','location','northeast');
title('Chebyshev Second Kind Polynomials');
xlabel('x');
ylabel('f(x)');

