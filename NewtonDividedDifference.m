clear
clc
syms x

%this MATLAB script was coded by Ibrahim Abouhassanin , ID NO: 2118222
%for the second assignment of MECH310 (Numerical Methods)

%it's main function is to calculate the Newton's Divided Difference
%of a set of points with it's given y values.

%Keep in mind that the xi and yi arrays can be changed
%The code will work with whatever number of points as long as both x and y
%arrays are of the same length



%n is just a counter
%m is the column number in which divided difference values will be added to
%b is how many less values there are after each table column
n=1;
m=3;
b=1;

%the xi and yi are the x and y values respectively
xi = [-2, -1, 0, 1, 2, 3];
yi = [1, 4, 11, 16, 13, -4];
A = [];

%will terminate the script if the xi and yi arrays are not of equal length
if length(xi) ~= length(yi)
    error('The x and y arrays do not have the same length')
end

%f is going to be the polynomial
%ftemp is just a temporary function
f = symfun (0, x);
ftemp = symfun (1,x);

%this loop will add the values of x into the A matrix
while (n <= length(xi))
    A(n,1)= xi(n);
    n=n+1;
end

A

n =1;

%this loop will add the values of y into the A matrix
while (n <= length(yi))
    A(n,2)= yi(n);
    n=n+1;
end

A

n=1;

%this loop will do the divided differencing table and input the values into
%the A matrix
while (n <= length(xi) - 1)
    i=1;
        while (i <= length(xi) - b)
          A(i,m)= (A(i+1,m-1) - A(i,m-1))/(A(i+b,1) - A(i,1));
          i=i+1;
        end
        A
    b=b+1;
    m=m+1;
    n=n+1;
end

A

n=1;
%this loop will take the first value of each column after the first column
%and multiply it with it's respective (x-n) values
while (n <= size(A,2) - 1)
    i = 1;
    ftemp = A(1,n+1);
        while (i < n)
            ftemp = ftemp*(x - A(i,1));
            i=i+1;
        end
        ftemp
    %here the remporary function is added to the polynomial
    f = f + ftemp
    n=n+1;
end


%the bits of code here just shows the function
disp('-----------------------------------------------------------')
txt = ['The function is a polynomial of order ' num2str(size(A,2) - 2) '. And the polynomial is as follows'];
disp(txt)
f
double(f(1.5))
txt2 = ['And the value at x=1.5 is: ' num2str(double(f(1.5)))];
disp(txt2)
disp('-----------------------------------------------------------')


%this infinite while loop is for testing the function with any number inupt
%it can be terminated using CTRL+C
while 1
prompt = 'Input a number to test (or press CTRL+C to exit): ';
z = input(prompt);
double(f(z))
end