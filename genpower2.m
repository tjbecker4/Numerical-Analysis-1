function [V,H] = genpower2(A,W,tol)



[V,~] = qr(W);
%V = V/norm(V);
H = zeros(50,2);


while norm(W-V*H,inf)>tol*norm(H,1)
    [V,~] = qr(W,0);
    V = V/norm(V);
    W = A*V;
    H = V'*W;
    
    %norm(W-V*H)
    %norm(W,inf)
    %norm(V*H,inf)
    %norm(W-V*H,inf)
end

