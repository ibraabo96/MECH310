clear
syms x
f = symfun(x^2 - x, x)

a = 0
b = 2

txt = ['Interval width at the start is : ' num2str(abs(a-b)) ', where the interval is : [' num2str(a) ',' num2str(b), ']' ];
disp(txt)

c=0;

while( abs(a-b) >= 0.1)
c=c+1;
ite = ['---------- Iteration number ' num2str(c) ' ----------'];
disp(ite)
d = ((sqrt(5)-1) /2)*(b-a);
x1 = a+d
x2 = b-d
txtfx1 = ['f(x1) = ' num2str(double(f(x1)))];
disp(txtfx1)
txtfx2 = ['f(x2) = ' num2str(double(f(x2)))];
disp(txtfx2)
    if (f(x1) > f(x2))
     b = x1;
     disp('f(x1)>f(x2)')
     xop = x2;
    else
     a = x2;
     disp('f(x1)<f(x2)')
     xop = x1;
    end
txt = ['Interval width is : ' num2str(abs(a-b)) ', where the interval is : [' num2str(a) ',' num2str(b), ']. And xop = ' num2str(xop)];
disp(txt)
end

disp('----------------------------------------')
txt2 = ['After ' num2str(c) ' iterations, the inerval is [' num2str(a) ',' num2str(b), '] , and the interval width is : ' num2str(abs(a-b)) '  And xop = ' num2str(xop)];
disp(txt2)