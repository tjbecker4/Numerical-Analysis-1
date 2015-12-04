function [b,n,N] = LUCost

%
% LUCost.m does an LU factorization on each successive matrix and returns
% the size of the matrix as well as the time that it took for each to
% factor.
%
% function [b,n] = LUCost
%
% Output:
% b         a vector with the times that LUfac1 took to factor each matrix
% n         a vector with the sizes of each matrix
% N         Coefficient matrix
%
%

% Initialize
c = zeros(23,1);


% LU factorization of first 14 matrices
for j = 100:50:750
    A = randn(j);
    tic,
    [M,p,info] = LUfac1(A);
    c(j) = toc;   
end


% LU factorization of last 9 matrices
for j=800:100:1600 
    A = randn(j);
    tic,
    [M,p,info] = LUfac1(A);
    c(j) = toc;
end

% Callibration
a = randn;
x = rand;
d = randn;
tic
for j=1:10^5
    y = a*x + d;
end
time = toc;
time_per_flop = time/(2*10^5);
    


% Making units correct
b1 = [c(100); c(150); c(200); c(250); c(300); c(350); c(400); c(450); c(500);
    c(550); c(600); c(650); c(700); c(750); c(800); c(900); c(1000);
    c(1100); c(1200); c(1300); c(1400); c(1500); c(1600)];

b = b1 ./ time_per_flop;

% Print out vector of matrix sizes
n = [100; 150; 200; 250; 300; 350; 400; 450; 500; 550; 600; 650; 700; 750;
    800; 900; 1000; 1100; 1200; 1300; 1400; 1500; 1600]

% Compute and output the coefficient matrix
N = zeros(23,4);
N(:,1) = ones(23,1);
N(:,2) = n;
N(:,3) = (n.^2);
N(:,4) = (n.^3);
N


    
    
    