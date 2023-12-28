function [x, c] = laguerrequadvals(n)
% Computer Gauss-Laguerre quadrature points and coefficients.

P = zeros(n+2,n+2);
P(1,1) = 1;
P(2,1:2) = [-1,1];
for k = 1:n
    P(k+2,1:k+2) = ((2*k+1)*[0,P(k+1,1:k+1)] - [P(k+1,1:k+1) 0] - ...
                    k*[0 0 P(k,1:k)]) / (k+1);
end
x = sort(roots(P(n+1,1:n+1)));
c = x ./ (n+1)^2 ./ polyval(P(n+2,:),x).^2;

