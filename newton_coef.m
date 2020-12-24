function a = newton_coef(x,y)
%
% input
%   x:  column (n+1)-vector with distinct components
%   y:  column (n+1)-vector
%
% output
%   a: column vector containing the coefficients of the Newton IP
%
np1 = length(x);
for k = 1:(np1-1)
    y(k+1:np1) = (y(k+1:np1) - y(k)) ./ (x(k+1:np1) -x(k));
end
a = y;