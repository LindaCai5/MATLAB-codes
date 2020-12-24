function [a,b,c,d] = genspline(x,y,n)
for i=1:n-1
    h(i) = x(i+1)-x(i);
end
A(1,1)=1;
A(n,n)=1;
f=zeros(n,1);
for i=2:n-1
    A(i,i)=2*(h(i)+h(i-1));
    f(i)=6*((y(i+1)-y(i))/h(i)-(y(i)-y(i-1))/h(i-1));
end
for i=1:n-2
    A(i,i+1)=h(i+1);
end
for i=3:n-1
    A(i,i-1)=h(i);
end
s = A\f;
for i=1:n-1
    a(i)=(s(i+1)-s(i))/(6*h(i));
    b(i)=s(i)/2;
    c(i)=(y(i+1)-y(i))/h(i)-(2*h(i)*s(i)+h(i)*s(i+1))/6;
    d(i)=y(i);
end