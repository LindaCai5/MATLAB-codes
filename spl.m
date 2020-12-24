%spl.m
function spl(x,y,sample_num)

for i=2:sample_num-1
   x(i)=x(i-1)+(x(sample_num)-x(1))/(sample_num-1);
   y(i)=1/(1+25*x(i)^2);
end
for i=1:sample_num-1
    h(i) = x(i+1)-x(i);
end
U(1,1)=1;
U(sample_num,sample_num)=1;
V=zeros(sample_num,1);
for i=2:sample_num-1
    U(i,i)=2*(h(i)+h(i-1));
    V(i)=6*((y(i+1)-y(i))/h(i)-(y(i)-y(i-1))/h(i-1));
end
for i=1:sample_num-2
    U(i,i+1)=h(i+1);
end
for i=0:sample_num-4
    U(i+3,i+2)=h(i+3);
end
%back substitution
s = U\V;
for i=1:sample_num-1 %finding each individual vectors
    a(i)=(s(i+1)-s(i))/(6*h(i));
    b(i)=s(i)/2;
    c(i)=(y(i+1)-y(i))/h(i)-(2*h(i)*s(i)+h(i)*s(i+1))/6;
    d(i)=y(i);
end
%evaluation part
for i=1:100+1
  new_x(i)=x(1)+(i-1)*(x(sample_num)-x(1))/100;
  new_y(i)=evalspline(a,b,c,d,new_x(i),x,sample_num);
  actualF(i)=1/(1+25*new_x(i)^2);
  disp(sprintf('%23.15e %23.15e %23.15e', actualF(i), new_y(i), actualF(i)-new_y(i)));
end
plot(new_x,new_y,'bo',new_x,actualF,'g-')
