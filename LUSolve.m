function [c] = LSolve(L,b);

L = L(i,j);
c = c(i);
b = b(i);

iflag = 0;
n = length(b);
c = b;

for j=1:n-1,
    c(j) = b(j)/(L(j,j));
    for i = j+1:n,
        b(i) = b(i) - L(i,j)*c(j);
    end
end

c(n) = b(n)/L(n,n);
