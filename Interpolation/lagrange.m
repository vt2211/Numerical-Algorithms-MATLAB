function [L, P] = lagrange(X, Y)
%X is the vector of x-values, Y is the vector of corresponding y-values

n = length(X);
L = zeros(n, n);

for i = 1:n
    V = 1;
    for j = 1:n
        if i~=j
            V = conv(V, poly(X(j)))/(X(i)-X(j));
        end
    end
    L(i, :) = V*Y(i);
end

A = sum(L);
syms x;
P = poly2sym(A, x);