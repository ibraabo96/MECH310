clear
syms x xi ea
y = symfun(xi^3 +3*xi +1, xi)
g = symfun(diff(y), xi)
f = symfun(xi - ((y/g)),xi)
eaform = symfun(abs((x-xi)/x), [x xi])


ea = 100
tol = 1*10^-7
xi=-2
c = 0;

while(ea>tol)
c = c+1;
txt = ['---------- Iteration number ' num2str(c) ' ----------'];
disp(txt)
x = f(xi);
ea = eaform(x,xi);
xi = x;
x = double(x)
ea = double(ea)
end
disp('----------------------------------------')
txt2 = ['After ' num2str(c) ' iterations, the approximated root is : ' num2str(x, 15) ', and the approximated error is: ' num2str(ea, 15)];
disp(txt2)