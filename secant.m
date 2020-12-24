function root = secant(f,x0,x1,xtol,ftol,n_max,display,myroot)
% root = newton(f,fd,x,xtol,ftol,n_max,display)
% Newton's method for solving f(x)=0.
% input:  f is a string name or the handle of the function f(x).
%         fd is a string name of the handle of the derivative f'(x).
%         x is the initial point
%         xtol and ftol are termination tolerances
%         n_max is the maximum number of iterations
%         display = 1 if step-by-step display is desired,
%                 = 0 otherwise
% output: root is the computed root of f(x)=0
%

n = 0;
fx = feval(f,x1);
rel = abs(x1-myroot)/abs(myroot);
if display, 
    disp('   n             x1                    f(x1)                     rel')
    disp('----------------------------------------------------------------------------')
    disp(sprintf('%4d %23.15e %23.15e %23.15e', n, x1, fx, rel))
end
if abs(fx) <= ftol
   root = x;
   return
end

for n = 1:n_max
    fx0 = feval(f,x0);
    fx1 = feval(f,x1);
    d =  ((x1-x0)/(fx1-fx0)) * fx1;
    x0 = x1;
    fx0 = fx1;
    x1 = x1 - d;
    fx1 = feval(f,x1);
    rel = abs(x1-myroot)/abs(myroot);
    if display, 
       disp(sprintf('%4d %23.15e %23.15e %23.15e', n, x1, fx1, rel)), end
    if abs(d) <= xtol | abs(fx1) <= ftol
       root = x1;
       return
    end
end
root = x1;
