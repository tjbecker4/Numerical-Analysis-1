
function [x,iflag] = Usolvesolution(U,c);
%
%  solves  Ux = c where U is an upper triangular
%  matrix
%
%  Input:  U   an n by n array holding an upper
%              triangular matrix
%
%          c   an n vector  (the right hand side)
%
%  Output: x   an n vector (x could overwrite c)
%
%          iflag  an integer
%                 contains
%                   0  if solution successful, 
%
%                   j  if U(j,j) = 0
%
%------------------------------------------------------------
%
%  D.C. Sorensen 27 Jan 2011
%
%

   iflag = 0;
   n = length(c);  
   x = zeros(n,1);

%
%  check for singularity step n
%
   if (abs(U(n,n)) > 0),
      x(n) = c(n)/U(n,n);
   else
      iflag = n;
      return
   end

%
%  Back Substitution loop
%

   for i = n-1:-1:1,
   
       s = c(i) ;
       for j = i+1:n,

           s = s - U(i,j)*x(j);
       end
%
%      check for singularity
%
       if (abs(U(i,i)) > 0),
           x(i) = s/U(i,i);
       else
          iflag = i;
          return
       end
   end