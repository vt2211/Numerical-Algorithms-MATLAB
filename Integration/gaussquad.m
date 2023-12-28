function [I, error] = gaussquad(f, var, a, b, n)
% Compute Gaussian quadrature points and coefficients
%a, b can be any arbitrary points

P = zeros(n+1,n+1);
P([1,2],1) = 1;
for k = 1:n-1
    P(k+2,1:k+2) = ((2*k+1)*[P(k+1,1:k+1) 0] - ...
                    k*[0 0 P(k,1:k)]) / (k+1);
end
x = sort(roots(P(n+1,1:n+1)));

A = zeros(n,n);
for i = 1:n
    A(i,:) = polyval(P(i,1:i),x)';
end
c = A \ [2; zeros(n-1,1)];

I = 0;
t = ((b-a) .* x + (b+a))/2;
for i = 1:n
    I = I + (c(i)*subs(f, var, t(i)));
end
I = vpa(I * ((b-a)/2));
error = vpa(int(f, var, a, b) - I);

