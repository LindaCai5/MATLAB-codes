function numl = adpsim2()
a = 0;
b = 2;
tol = 1.0e-05;
fun = @(x)(2/sqrt(pi))*(exp(-(x^2)));
level = 1;
levmax = 30;
h = (b-a)/4;
%x=a:h/4:b; %divide into 4 intervals
for j=1:5 %total of 5 points to compute
    x(j) = a+h*(j-1);
    f(j)=feval(fun,x(j));
end
l1