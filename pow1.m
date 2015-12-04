function [v,lamdba,niters] = pow1(A,v0,tol,method,sigma)

%
%
%
%
%
%
%
%
%
%
%


y = zeros();
y1 = zeros();
l = zeros();
niters = 0;

if method == 'pow'
    y(0) = v0/norm(v0);
    while tol
        niters = niters + 1;
        y1(k) = (A-sigma*eye(k-1))*y(k-1);
        l(k) = dot(y1(k),y(k-1)) + sigma;
        y(k) = y1(k)/norm(y1(k));
    end
    lambda = l(k);
    v = y;
end

if method == 'invpow'
    y(0) = v0/norm(v0);
    while tol
        niters = niters + 1;
        y1(k) = (A-sigma*eye(k-1))\y(k-1);
        l(k) = 1/(dot(y1(k),y(k-1))) + sigma;
        y(k) = y1(k)/norm(y1(k));
    end
    lambda = l(k);
    v = y;
end

if method == 'rpi'
     y(0) = v0/norm(v0);
     l(0) = dot(A*y(0),y(0));
    while tol
        niters = niters + 1;
        y1(k) = (A-l(k-1)*eye(k-1))\y(k-1);
        y(k) = y1(k)/norm(y1(k));
        l(k) = dot(A*y(k),y(k));
    end
    lambda = l(k);
    v = y;
end



