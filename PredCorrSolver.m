function [t Y] = PredCorrSolver(f,t0,tf,N,y)

%
% Tim Becker
% CAAM 553 Homework 7 Problem 4a
% 11/2/2012
%
% PredCorrSolver.m uses Forward Euler as a predictor and Trapezoidal Rule
% as a corrector, including Newton's method, to solve the ODE system
%
% function [t Y] = PredCorrSolver(deriv,t0,tf,N,y)
%
%
% Input:
%
% t0        Initial time value
% tf        Final time value
% N         Number of steps    
% y         Initial conditions for y_1 and y_2
%
% Output:
%
% t         vector of times at which the system was evaluated
% Y         Solutions to y_1 and y_2


dt = (tf-t0)/N;
t = linspace(t0,tf,N);

Y = zeros(length(y),N);
Y(:,1) = y;

for i=1:N-1
    % Euler Method
    dy = f1(t(i),Y(:,i));
    yy = Y(:,i) + dy*dt;
    
    F = @(z) z - (dt/2)*(f1(t(i),Y(:,i))+f1(t(i+1),z)) - Y(:,i);
    
    J = @(z) eye(2) - (dt/2)*df1(t(i+1),z);
        
    % Trapezoid Rule with Newton
    z = NewtonCorrector(F,J,1e-5,yy); 
    Y(:,i+1) = z;
end
    

% Given solutions for part a. Commented out when solving part b
y11 = zeros(1,N);
y22 = zeros(1,N);

for i=1:N
    y11(i) = exp(t(i)) + exp(4*t(i)) + (10/13)*exp(t(i))*cos(2*t(i)) + (2/13)*exp(t(i))*sin(2*t(i));
    y22(i) = -exp(-t(i)) + 4*exp(4*t(i)) + (14/13)*exp(t(i))*cos(2*t(i)) - (18/13)*exp(t(i))*sin(2*t(i));
end

plot(t,Y(1,:),'r'); hold on
plot(t,Y(2,:),'g'); hold on

% Plotting solutions for part a. Commented out when solving part b
plot(t,y11,'-.k'); hold on
plot(t,y22,'-.b');

xlabel('Time')
ylabel('Y')

title('Predictor-Corrector ODE Solver')

% Legend is shortened when solving part b
legend('Computed y_1(t)', 'Computed y_2(t)', 'Given y_1(t)', 'Given y_2(t)', 'location', 'northwest')






    
    