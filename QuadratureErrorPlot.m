function QuadratureErrorPlot(fx,a,b,z)

%
% Tim Becker
% CAAM 553 Homework 6 Problem 2
% 10/24/2012
%
% QuadratureErrorPlot.m plots the number of points in the approximation of
% each function versus the error in each of the three methods and the
% exact integral.
%
% function QuadratureErrorPlot1(fx,a,b,z)
%
% Input:
%
% fx        User's function
% a         Left hand endpoint
% b         Right hand endpoint
% z         Exact integral for f(x) from a to b
%


figure 
err = [];

% Newton-Cotes

for N=1:50
    [w,omega,x,y] = QuadWeights(a,b,N); 
    NC = fx(x)*w';
    err = [err abs(NC - z)];
end

semilogy(1:N, err, '.-g'), hold on


err = [];

% Clenshaw-Curtis

for N=1:50
    [w,omega,x,y] = QuadWeights(a,b,N);
    CC = fx(y)*omega';
    err = [err abs(CC - z)];
end

semilogy(1:N, err, '.-r'), hold on


% Composite Trapezoid Rule
err = [];
x = a;
for N=1:50
    sum = 0;
    dx = (b-a)/N;
    for i=0:N
        x = a + i*dx;
        if(i==0 || i==N)
            sum = sum + .5*fx(x);
        else
            sum = sum + fx(x);
        end
    end
    sum = sum*dx;
    err = [err abs(sum - z)];
end

semilogy(1:N, err, '.-b'),

ylim([1e-18 1000])
xlabel('N')
ylabel('Error')

% I changed the title for each different plot so that the correct function 
% was represented. This printout is for the first function, so it says
% exp(-x^2)

title('Newton-Cotes, Clenshaw-Curtis, and Composite Trapezoid for |x|')
legend('Newton-Cotes', 'Clenshaw-Curtis', 'Composite Trapezoid', 'location', 'eastoutside')



