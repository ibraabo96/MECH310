clc
clear

syms x;
f = symfun(x^3 + x^2 + x + 1, x);

a = 1;
b = 5;
n = 10;

odd = [];
even = [];
fOdd = [];
fEven = [];

i = 1;
c = a;
o = 1;
e = 1;

eSum = 0;
oSum = 0;

while i < n
    c = c + ((b-a)/n);
    
    if mod(i,2) == 1
        odd(o) = c;
        o = o+1;
    end
    
    if mod(i,2) == 0
        even(e) = c;
        e = e+1;
    end
    i = i+1;
end

odd
even

i = 1;

while i <= length(odd)
   fOdd(i) = f(odd(i));
   i = i+1;
end

fOdd

i = 1;

while i <= length(even)
   fEven(i) = f(even(i));
   i = i+1;
end

fEven

I = double((b-a)*(( f(a) + 2*sum(fEven) + 4*sum(fOdd) + f(b) )/(3*n)))

txt = ['The approximated integral is : ' num2str(I)];
disp(txt)