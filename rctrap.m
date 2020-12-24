function n=rctrap(f,a,b,tol,display)

interval_num=1;
h=b-a;
I_T=zeros(1,100); %Let I_T be the array that holds the computation result 
%of the trapezoid evaluation at 2^n, where n is the index of the array.
I_T(1)=h*(feval(f,a)+feval(f,b))/2;
error=1;
n=1;
if display 
             disp('   error               n=iteration      I_T(n)              ')
             disp('----------------------------------------------------------------------------')    
end
fprintf('                        %4d %23.15e \n', n, I_T(n));
while(error>tol)
         %first calculate the right side accumulation sum in equation part
         %*1
         %every loop will increase the exponent of base 2 by 1
         %so we multiply by 2 each time we enter the loop
         interval_num=2*interval_num; 
         h=h/2;
         acc=0;
         %iterate to calculate the value inside the summation of function
         %evaluations
         for i=1:interval_num/2
            acc=acc+feval(f,a+h*(2*i-1));
         end
         %then calculate the entire equation with respect to the previous
         %term
         I_T(n+1)=(0.5)*I_T(n)+h*acc;  %compute the I_T(2^n) by I_T(2^(n-1))
         error=abs(I_T(n)-I_T(n+1));         
         fprintf('%23.15e %4d %23.15e \n', error, n+1, I_T(n+1));
         n = n + 1;      
end


