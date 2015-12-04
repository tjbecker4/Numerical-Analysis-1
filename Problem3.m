% Problem 3, Part C
%
% This is a program that runs myexp.m and returns the data for each value
% of x and the formats the output into a table to be easily read.

format long g
display('Problem 3')

data = [-20,-15,-10,-5,0,5,10,15,20];
hist=zeros(9,4);                                 % Initializes table.
for i=1:9,          
    [s] = myexp(data(i),100);               
    rerr = abs(exp(data(i))-s)/exp(data(i));
    hist(i,:)=[data(i),exp(data(i)),s,rerr];     % Fills table with values.   
end
disp('                        X               exp(x)                  myexp(x)');
disp('                   ================================================================');
disp(hist(:,1:3));
disp('         Relative Error');
disp('        ==================');
disp(hist(:,4));