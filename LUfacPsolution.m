 function [L,U,P] = LUfacPsolution(A,p);
   %
   %  Input:   A  an n by n matrix. (A is unaltered on return)
   %           p  an n-vector 
   %       
   %           A  Contains the LU decompositon as produced by [A,p,info] = LUfac(A)
   %              L is represented in the  strict lower triangle and U in upper triangle
   %              of the array A.   The vector p contains the pivoting information.
   %
   %              The L,U are explicitly constructed from this input so that
   %              
   %                       PA = LU
   %
   %  Output:  L  a unit lower triangular n by n matrix
   %
   %           U  an n by n upper triangular matrix
   %
   %           P  an n by n permutation matrix
   %
   %
   %
   %
   %  D.C. Sorensen 
   %  25 Sep 12
   %-----------------------------------------------------------------
   %     
      n = length(p);
   %
   %  Apply permutations successively to the identity to get P
   %  and to the multipliers (lower triangle of overwritten A)     
   %  Note: the k-th permutation is applied only to column
   %  entries 1 : k-1 in rows k and p(k)
   %
      P = eye(n);
      t = P(1,:); P(1,:) = P(p(1),:); P(p(1),:) = t;

      for k = 2:n-1;
          t = A(k,1:k-1); A(k,1:k-1) = A(p(k),1:k-1); A(p(k),1:k-1) = t;
          t = P(k,:); P(k,:) = P(p(k),:); P(p(k),:) = t;
      end 
      L = eye(n) + tril(A,-1);
      U = triu(A); 