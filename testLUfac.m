
     clear all;
     format short e
%    format short eng
%    format
%
%    Example 1
%
%    Random matrix with a given solution
%
     disp('  ')
     disp('  ')
     disp('1. Random matrix with a given solution ')
     disp('  ')

     z = cell(6);
     A = randn(10);
     A0 = A;
     x_exact = randn(10,1);
     b = A*x_exact;
   
     [A,p,iflag] = LUfac(A);

     [c,iflag] = Lsolve(A,p,b);
     [x,iflag] = Usolve(A,c);

     RelErrX = norm(x - x_exact)/norm(x_exact);
     Residual = norm(b - A0*x);
     z = ['RelErrX  ' num2str(RelErrX) '  Residual  ' num2str(Residual) '  iflag  ' num2str(iflag)];
     disp(z)
     disp('  ')
     disp('  ')

%
%    Example 2
%
%    Singular Random matrix with consistent rhs
%    and arbitrary rhs
%
     disp('  ')
     disp('  ')
     disp('Singular Random matrix ')
     disp('  ')

     A = randn(10);
     A(5,:) = A(1,:) - 2*A(3,:);
     A0 = A;

     x_exact = randn(10,1);
     b = A*x_exact;
     b_rand = randn(10,1);
 
   
     [A,p,iflag] = LUfac(A);

     [c,iflag] = Lsolve(A,p,b);
     [x,iflag] = Usolve(A,c);

     disp('2.1 Singular Random matrix with consistent rhs')
     disp('  ')
     RelErrX = norm(x - x_exact)/norm(x_exact);
     Residual = norm(b - A0*x);
     z = ['RelErrX  ' num2str(RelErrX) '  Residual  ' num2str(Residual) '  iflag  ' num2str(iflag)];
     disp(z)
     disp('  ')
     disp('  ')

     [c,iflag] = Lsolve(A,p,b_rand);
     [x,iflag] = Usolve(A,c);

     disp('2.2 Singular Random matrix with arbitrary rhs')
     disp('  ')
     x_mat = A0\b_rand;
     RelErrX = norm(x - x_mat)/norm(x_mat);
     Residual = norm(b_rand - A0*x);
     z = ['RelErrX  ' num2str(RelErrX) '  Residual  ' num2str(Residual) '  iflag  ' num2str(iflag)];
     disp(z)
     disp('  ')

%    Example 3
%
%    Exact Singular Random matrix with consistent rhs
%    
%

     disp('  ')
     disp('  ')
     disp('3. Exact Singular Random matrix with consistent rhs')
     disp('  ')

     n = 10;
     A = randn(10);
     A(5:10, 1:5) = zeros(6,5);
     A0 = A;

     [A,p,iflag] = LUfac(A);

     b = A0*ones(10,1);
     x_exact = ones(10,1);

     [c,iflag] = Lsolve(A,p,b);
     [x,iflag] = Usolve(A,c);
     
     RelErrX = norm(x - x_exact)/norm(x_exact);
     RelErrX_trunk = norm(x(1:n-1) - x_exact(1:n-1))/norm(x_exact(1:n-1));
     Residual = norm(b - A0*x);
     z = ['RelErrX  ' num2str(RelErrX) '  Residual  ' num2str(Residual) '  iflag  ' num2str(iflag)];
     disp(z)
     disp('  ')


%    Example 4
%
%    Hilbert matrix with consistent rhs
%    
%
     disp('  ')
     disp('  ')
     disp('4. Hilbert  matrix with consistent rhs')
     disp('  ')

     n = 10;
     A = zeros(n);
     for j = 1:n,
         for i = 1:n,
             A(i,j) = 1/(i + j - 1);
         end
     end
     A0 = A;
     condA = cond(A)
     b = A0*ones(n,1);
     b2 = b + eps*randn(n,1);
 
     
     
     [L,U,p] = lu(A0,'vector');
     Diff_A_LU = norm(A0(p,:) - L*U)

%    A = A0;
     [A,p,iflag] = LUfac(A);

     [c,iflag] = Lsolve(A,p,b);
     [x,iflag] = Usolve(A,c);

     [c2,iflag2] = Lsolve(A,p,b2);
     [x2,iflag2] = Usolve(A,c2);
     

     Residual = norm(b - A0*x);
     Residual2 = norm(b2 - A0*x);

     Xdiff = x - ones(n,1);
     Xdiff2 = x - ones(n,1);

%    X_Xexact_Xdiff = [x ones(n,1) Xdiff]
      
     RelErrX = norm(Xdiff)/norm(ones(n,1));
     RelErrX2 = norm(Xdiff2)/norm(ones(n,1));
     z = ['RelErrX  ' num2str(RelErrX) '  Residual  ' num2str(Residual) '  iflag  ' num2str(iflag)];
     z2 = ['RelErrX2  ' num2str(RelErrX2) '  Residual  ' num2str(Residual2) '  iflag  ' num2str(iflag2)];
     disp(z)
     disp('  ')
     disp(z2)
     disp('  ')
     
     