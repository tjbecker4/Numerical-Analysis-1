function [x,y] = GammaFunction(N,a)



f = @(t) t^(x-1)*exp(-t);
fx = @(x) polyval(polyint(f,0),a)-polyval(polyint(f,0),0);




% Composite Trapezoidal

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
    