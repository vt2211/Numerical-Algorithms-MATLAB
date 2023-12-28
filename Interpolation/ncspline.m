function [a1, b, c, d] = ncspline(x, a) %added a1 term in output args (see below)
% Natural Cubic Spline
% Interpolate the data points x(i),a(i) using a natural cubic spline
% See Burden & Faires for desription of coefficients

x = x(:)'; a = a(:)'; % Make sure inputs are row vectors

h = diff(x);
n = length(x)-1;

% Form tridiagonal matrix for clambed cubic splines
A = sparse(2:n, 1:n-1, h(1:n-1), n+1, n+1) + ...
    sparse(2:n, 3:n+1, h(2:n), n+1, n+1) + ...
    sparse(2:n, 2:n,   2*(h(1:n-1) + h(2:n)), n+1, n+1);
A(1,1) = 1; 
A(n+1,n+1) = 1;

% Note: This is the b in the right-hand side of Ax = b in Burden & Faires
b = [0, 3./h(2:n).*(a(3:n+1) - a(2:n)) - 3./h(1:n-1).*(a(2:n) - a(1:n-1)), 0]';
c = (A\b)';

% Note: This is the b in the actual spline coefficients
b = (a(2:n+1) - a(1:n))./h - h./3.*(2*c(1:n) + c(2:n+1));
d = (c(2:n+1) - c(1:n))./(3*h);
c = c(1:n);
a1 = a(1:n); %added to ease readability while using