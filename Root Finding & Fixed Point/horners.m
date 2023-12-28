function [y, z] = horners(a, x0)
% Evaluate polynomial:
%    P(x) = a(1)x^n + a(2)x^(n-1) + ... + a(n)x + a(n+1)
% and its derivative at x0 using Horner's method.
% Outputs: y = P(x0), z = P'(x0).

if isa(a, 'double')
    coeffs = a;
else
    coeffs = sym2poly(a);
end

n = length(coeffs)-1;
y = coeffs(1);
z = coeffs(1);
for j = 2:n
    y = vpa(x0*y + coeffs(j));
    z = vpa(x0*z + y);
end
y = x0*y + coeffs(n+1);
