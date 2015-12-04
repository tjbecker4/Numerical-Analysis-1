function y = Integrand2


%
% Integrand2.m is the function (1+25*x.^2)^(-1) that will be used in Problem 2
% of homework 6 for CAAM 553
%
%
% function y = Integrand2(x)
%
%




y = @(x) (1+25*x.^2).^(-1); % User's function.
return
