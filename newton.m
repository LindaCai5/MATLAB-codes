function root = newton(f,fd,x,xtol,ftol,n_max,display,myroot)
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
fx = feval(f,x); % f is either a string name or the handle of f(x)
% fx = f(x);  % f is the handle of f(x)
rel = abs(x-myroot)/abs(myroot);
if display, 
   disp('   n             x                    f(x)                     rel')
   disp('----------------------------------------------------------------------------')
   disp(sprintf('%4d %23.15e %23.15e %23.15e', n, x, fx, rel))
end
if abs(fx) <= ftol
   root = x;
   return
end

for n = 1:n_max
    fdx = feval(fd,x); % fd is either a string name or the handle of f(x)
%    fdx = fd(x);  % fd is the handle of f'(x)
    d = fx/fdx;   
    x = x - d;
    fx = feval(f,x); % f is either a string name or the handle of f(x)
%    fx = f(x);   % f is the handle of f(x)  
    rel = abs(x-myroot)/abs(myroot);
    if display, 
       disp(sprintf('%4d %23.15e %23.15e %23.15e', n, x, fx, rel)), end
    if abs(d) <= xtol | abs(fx) <= ftol
       root = x;
       return
    end
end
root = x;
