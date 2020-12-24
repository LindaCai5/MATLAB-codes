function pval = newton_pval(a,x,xx)
% 
% input  a:  a (n+1)-vector 
%        x:  a vector with at least n elements
%        xx: a vector at which the Newton form of IP will be evaluated
% output pval: a vector of the same size as xx with the property that if
%              p(x) = a(1)+a(2)(x-x(1))+...+a(n+1)(x-x(1))...(x-x(n))
%              then pval(i)=p(xx(i)) for i=1:size(xx).

np1 = length(a);
pval = a(np1)*ones(size(xx));
for i = (np1-1):-1:1
    pval = a(i) + (xx-x(i)) .* pval;
    ytrue = 1/(1+25*xx(i)^2);
    
end
disp(sprintf('%23.15e %23.15e %23.15e',ytrue, pval, ytrue-pval));