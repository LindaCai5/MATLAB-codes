function X = gepp2(A,B)
% X = gepp(A,B) solves linear systems with multiple right hand sides by
% Gauss elimination with partial pivoting
%
% input: A is an n x n nonsingular matrix
% B is an n x p matrix
% output: X is the solution of AX=B.
%
[n, p] = size(B);
for k = 1:n-1
    [maxval, maxindex] = max(abs(A(k:n,k))); %comparisons
    q = maxindex+k-1;
    if maxval == 0, error('A is singular'), end
    A([k,q],k:n) = A([q,k],k:n);
    B([k,q],:) = B([q,k],:);
    for i = k+1:n
        mult = A(i,k)/A(k,k); %multipliers
        A(i,k+1:n) = A(i,k+1:n)-mult*A(k,k+1:n);
        B(i,:) = B(i,:) - mult*B(k,:);
    end
end
X = zeros(n,p);
X(n,:) = B(n,:)/A(n,n);
for k = n-1:-1:1
    X(k,:) = (B(k,:) - A(k,k+1:n)*X(k+1:n,:))/A(k,k);
end
