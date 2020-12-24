function A = myA(n)

if n>100
   error("n cannot exceed 100."); 
end

A = zeros(n,n);

for i=1:n
    for j=1:n
        A(i,j) = abs(i-j);
    end
end






