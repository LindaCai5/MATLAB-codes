function plotspline(a,b,c,d,x,n)
dx = (x(n)-x(1))/100;
for j=1:101
    xx(j)=x(1)+dx*(j-1);
    yy(j)=evalspline(a,b,c,d,xx(j),x,n);
end
plot(xx,yy)