function check(p)

for k=2:p
    a = det(myA(k));
    b = lupp2(myA(k));
    fprintf("size %d by %d:  det = %d , lupp2 = %d\n", k, k, a, b);
end

