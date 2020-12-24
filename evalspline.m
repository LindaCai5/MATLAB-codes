function yy=evalspline(a,b,c,d,new_x,x,sample_num)
for i=1:sample_num-1
    if (new_x<=x(i+1))
       break;
    end
end
part1 = a(i)*(new_x-x(i))^3;
part2 = b(i)*(new_x-x(i))^2;
part3 = c(i)*(new_x-x(i));
part4 = d(i);
yy=part1+part2+part3+part4; %sum up the polynomials