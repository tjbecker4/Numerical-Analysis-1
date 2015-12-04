%
% Tim Becker
% CAAM 553 Homework 9 Problem 4b,4c,4d,4e
% 12/5/2012
%
%
% HW9Problem4Driver.m solves the integral equation using the trapezoidal
% method and then uses Matlab's backslash or SVD Truncation to solve the 
% resulting Au=f system. 
%
% HW9Problem4Driver.m
%
%
%

clear all
close all
clc

n = [50,100,200];
g = @(s,t) sqrt(s^2+t^2);

for l = 1:length(n)
    
    disp(['n = ' num2str(n(l))])
    disp('==============')
   
    % Part 4b. Setting up Au=f.
    s = linspace(0,1,n(l)+1);
    t = linspace(0,1,n(l)+1);
     
    % Matrix A
    A = zeros(n(l)+1,n(l)+1);
    h = 1/(n(l));
    
    % Right Hand Side
    f = zeros(n(l)+1,1);
    
    % True solution
    d = zeros(n(l)+1,1);
    
    for i = 1:n(l)+1
        % RHS
        f(i) = (((t(i))^2+1)^(3/2)-(t(i))^3)/3;
        % True solution
        d(i) = i;
        % Matrix A
        for j = 1:n(l)+1
            if j == 1 || j == n(l)+1
                A(i,j) = h*(1/2)*g(s(i),t(j));
            else
                A(i,j) = h*g(s(i),t(j));
            end
        end
    end
    
    % Part 4c. Using Backslash to solve
    u = A\f;
   
    % Checking errors with given solution
    errrel = norm(u-d)/norm(d);
    err = norm(u-d);
    
    disp('Part c')
    disp('------')
   
    disp('Relative error for computed solution with Backslash when compared')
    disp(['with given solution for n = ' num2str(n(l))]);
    disp(errrel)
         
    disp('Absolute error for computed solution when with Backslash compared')
    disp(['with given solution for n = ' num2str(n(l))]);
    disp(err)
    
    % Part 4d. Finding the condition number
    
    disp('Part d')
    disp('------')
    disp('Condition number of A')
    disp(cond(A))
      
    % Part 4e. Using SVD.
    [U,S,V] = svd(A);
    sigma = diag(S);
 
    % Find truncation index with a given tolerance
    tol = 1e-6;
    index = 0;
    for m = 1:n(l)+1
        if sigma(m+1) < sigma(1)*tol
            index = m;
            break
        end
    end
    
    index
 
    % solve for v with truncated SVD (use backslash to compute inv(S))
    Y =(S(1:m,1:m))\(U(:,1:m)'*f);
    v = V(:,1:m)*Y*n(l);
    
    % Check errors with given solution
    errrel = norm(v-d)/norm(d);
    err = norm(v-d);
   
    disp('Part e')
    disp('------')
   
    disp('Relative error for computed solution with SVD when compared');
    disp(['with given solution for n = ' num2str(n(l))]);
    disp(errrel)
         
    disp('Absolute error for computed solution with SVD when compared');
    disp(['with given solution for n = ' num2str(n(l))]);
    disp(err)
    
    % Plot Truncated SVD solution vs given solution
    figure
    hold on
    plot(s,v,'b');
    hold on
    plot(s,d,'r');
    
    legend('Truncated SVD Solution','Given Solution','location','northwest');
    title(['Truncated SVD for threshold = ' num2str(tol)]);
    xlabel('s');
    ylabel('u(s)');
    
end



