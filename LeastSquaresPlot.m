function LeastSquaresPlot(b,n,a)

%
% LeastSquaresPlot.m takes in the vectors and plots the data points and
% polynomial curve on the same graph
%
% function LeastSquaresPlot(b,n,a)
%
% Input:
%
% b         vector containing the information about flops
% n         vector containing size of matrices
% a         vector containing polynomial coefficients
%



% Flip a for polyval
aa = flipud(a);



% Plot the data points from vectors b and n
semilogy(n,b,'b*')

% Creates the axis labels and title
title('Least Squares Cubic Polynomial Fit'),
hold
xlabel('Matrix Size')
ylabel('FLOPS')


% Plots the polynomial
nmin = min(n);
nmax = max(n);
n1 = [nmin: (nmax-nmin)/100: nmax];

semilogy(n1,polyval(aa,n1),'r'), axis tight

% Creates the legend
legend('Data Points', 'Cubic Polynomial')

