function QuadratureErrorPlot(fx)

%
% QuadratureErrorPlot1.m plots the number of points in the approximation of
% f(x) = exp(-x^2) versus the error in each of the three methods and the
% exact integral.
%
% function QuadratureErrorPlot1
%







figure 
err = [];

% Newton-Cotes
NC = 0;
for N=1:50
    for j=1:N
        x(j) = x(0) + (b-a)/N;  
    for k=1:N
        if k == j, 
            continue; 
        end
        lx = lx .* (x - x(k))/(x(k)-x(j));
    end
    w(j) = polyint(a,b,polyval(lx,x(j)));
    NC = NC + f(x(j))*w(j);
    err = [err abs(NC - sqrt(pi)*erf(1))];
    end
end

semilogy(N, err, '.-', LW, 1, MS, 16),

err = [];

% Clenshaw-Curtis
CC = 0;
for N=1:50
    for j=1:N
        x(j) = (a+b)/2+cos(j*pi/N)*(b-a)/2;
    for k=1:N
        if k == j, 
            continue; 
        end
        lx = lx .* (x - x(k))/(x(k)-x(j));
    end
    w(j) = polyint(a,b,polyval(lx,x(j)));
    CC = CC + f(x(j))*w(j);
    err = [err abs(CC - sqrt(pi)*erf(1))];
    end
end

semilogy(N, err, '.-r', LW, 1, MS, 16),


% Composite Trapezoid Rule
err = [];
sum = 0;
for N=1:50
    dx = (b-a)/N;
    for i=0:N
        x = x+i*dx;
        fx = f(x);
        if(i==0 || i==N)
            sum = sum + .5*fx;
        else
            sum = sum + fx;
        end
    end
sum = sum*dx;    
err = [err abs(sum - sqrt(pi)*erf(1))];
end

semilogy(N, err, '.-b', LW, 1, MS, 16),

ylim([1e-18 1])
xlabel('N', FS, 12)
ylabel('Error', FS, 12)
title('Newton-Cotes, Clenshaw-Curtis, and Composite Trapezoid for exp(-x^2)')
legend('Newton-Cotes', 'Clenshaw-Curtis', 'Composite Trapezoid', 'location', 'northeast')
