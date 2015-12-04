function [y,iflag] = LUSolve_trans(A,d)

% [A] = LUSolve_trans(A,d)
%
% LUSolve_trans.m takes a matrix A that has been factored into LU form and
% solves for y in the linear equation A'*y=d for a vector d of length n.
% This is done by first solving for U'and then for L' and then using p to
% permute y back to the answer.
%
% Input:
% A:            the n by n matrix A
%
% d:            an n vector containing the right hand side
%
% Output:
% y:            an n vector containing the solution
%
%


[A,p,iflag] = LUfac(A);             % Call LUfac(A)


At = A';                            % Initialization
[r,cc] = size(At);
iflag = 0;
n = length(d);
x = d;


% Check if dimensions match

if (cc ~= n),                      
    iflag = 1;
    disp('Error: Dimensions do not match');
    return
end

% Solve for U' using forward solve

for j = 1:n-1,
    if (At(j,j) == 0),              % Check if singular
        iflag = j+1;
        disp('U is singular!')
        return
    end
    x(j) = d(j)/At(j,j);
    for i = j+1:n,
        d(i) = d(i) - At(i,j)*x(j);
    end
    
    
    
end

x(n) = d(n)/At(n,n);

y = x;


% solve for L' using backwards solve


for j = n:-1:2,
    y(j) = d(j)/At(j,j);
    for i = 1:j-1,
        d(i) = d(i) - At(i,j)*y(j);
    end
    
end

y(1) = d(1);




% Use p to get y back to the correct form of the answer

for j = 2:n-1,
t = A(j,1:j-1);
A(j,1:j-1) = A(p(j),1:j-1);
A(p(j),1:j-1) = t;
end


    
    
% Check our solution versus Matlab's solution   
   
A = [-2 3 0 2; 2 0 4 5; 4 1 2 3; 2 -1 6 5];
d = [22; 2; 38; 41];
    

yy = A'\d;

diff = norm(y-yy);


disp(' ')
disp('Difference in solutions')
disp(diff)


disp('Exact solution')
disp(yy)



end


