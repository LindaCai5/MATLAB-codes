
function pas()
A = pascal(10); %use the built-in function to get the Hilbert matrix
for loop = 1:10
    
    rn = randn(10,5);
    realX = rn;
    B = A * realX;
    compX = gepp2(A,B);
    %use Frobenius norm to calculate
    err = norm(compX - realX,'fro')/norm(realX,'fro'); %∥Xc−Xt∥F/∥Xt∥F
    bound = eps * cond(A,'fro'); %ϵ∥A∥F∥A−1∥F
    relative_residual = norm(B-A*compX,'fro')/(norm(A,'fro')*norm(compX,'fro')); %∥B−AXc∥F/(∥A∥F∥Xc∥F)
    
    fprintf('∥Xc−Xt∥F/∥Xt∥F is: %e\n',err)
    fprintf('ϵ∥A∥F∥A−1∥F is %e\n',bound)
    fprintf('∥B−AXc∥F/(∥A∥F∥Xc∥F) : %e\n',relative_residual)
    fprintf('epsilon is %e\n',eps)
    
    fprintf('------ \n');
end
