
function [c] = LTsolvesolution(L,p,b);
%
%  solves  L'c = b where L is a (logically) unit lower triangular
%  matrix.   L actually represents  the product P_j L_j
%  where P_j is the permutation j <-> p(j) and L_j is I +  m_j e_j'
%  with m_j = L(j+1:n,j).
%
%  It is assumed that L is in the lower triangle of the matrix A
%  which has been overwritten by the LU factorization produced by LUfac(A)
%
%
%  Input:  L   an n by n array holding an lower
%              triangular matrix.   Ones are assumed
%              to be on diagonal and not stored.
%              The diagonal elements are not referenced.
%
%          p   an integer n vector containing the pivot information
%
%          b   an n vector  (the right hand side)
%
%  Output: c   an n vector (c could overwrite b)
%
%------------------------------------------------------------
%
%  D.C. Sorensen 27 Jan 2011
%

   n = length(b);  
   c = b;

%
%  Backward Substitution Loop
%

   c(n) = b(n);
   for i = n-1:-1:1,
   
       s = b(i);
       for j = i+1:n,

           s = s - L(j,i)*c(j);
       end
       c(i) = s;
       t = c(i); c(i) = c(p(i)); c(p(i)) = t;
   end
