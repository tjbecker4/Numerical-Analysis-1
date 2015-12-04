%
% Tim Becker
% CAAM 553 Homework 9 Problem 4
% 12/5/2012
%
%
% HW9Problem4Driver.m solves the integral equation using the trapezoidal
% method and then uses Matlab's backslash or SVD to solve the resulting
% Au=f system. 
%
% HW9Problem4Driver.m
%
%
%

clear all
close all
clc




for n = 50,100,200
   
    
   g = @(s,t) sqrt(s^2+t^2);
    
   s = zeros(n+1);
   
   for k=0:n
       s(k) = k/n;
   end
   
   A = zeros(n+1,n+1);
   
   A(1,s) = (1/2*n)*g(s,s);
   A(n+1,s) = (1/2*n)*g(s,s);
   
   for i=2:n
       for j = 0:n
           A(i,j+1) = (1/n)*g(s,s);
       end
   end
   
   f = @(s) (((t^2+1)^(3/2)-t^3)/3);
   
   
   
    
    
    
    
end