function [A,p,iflag] = LUfac1(A)
   %
   %  Input:   A  an n by n matrix.
   %       
   %  Output:  A  overwritten with the LU decompositon
   %              L in strict lower triangle, U in upper triangle
   %
   %           p  an integer array of length n containing pivot 
   %              information.
   %
   %
   %  D.C. Sorensen 
   %  3 Oct 00
   %-----------------------------------------------------------------
   %     
      [m,n] = size(A);
      p = zeros(n,1);
      iflag = 0;
      if (m ~= n), iflag = 1; return; end
      for k = 1:n-1,
   %
   %    Find index of max elt. below diagonal, adjust for offset
   %    and  record in p(k)    
   %
          [amaxk,ik] = max(abs(A(k:n,k))); p(k) = ik+k-1;
   %
   %    Interchange row k with row p(k)
   %
          t = A(k,k:n); A(k,k:n) = A(p(k),k:n); A(p(k),k:n) = t;
   %
          if(amaxk > 0),  %skip step if amaxk = 0, kth column is zero
   %
   %         Scale by 1/A(k,k) to determine the kth column of L
   %
                A(k+1:n,k) = A(k+1:n,k)/A(k,k);
   %
   %         Update lower (n-k) by (n-k) block
   %
   
                for j = k+1:n,
                    for i = k+1:n,

                        A(i,j) = A(i,j) - A(i,k)*A(k,j);
                    end
                end
           end
      end