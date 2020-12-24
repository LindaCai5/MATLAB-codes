function result = adpsim(a,b,tol,level,levmax,fun)
h = (b-a)/4;
%x=a:h/4:b; %divide into 4 intervals
for j=1:5 %total of 5 points to compute
    x(j) = a+h*(j-1);
    f(j)=feval(fun,x(j));
end
nofun=5;
%level=0 means entire interval is covered, hence finished
result = adploop(tol,level,levmax,fun,f,x,1);
