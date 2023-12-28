function [v, w] = eulers_de(f, var, a, b, alpha, h)

syms t;
n = (b-a)/h;
w = zeros(1, n+1);
w(1) = alpha;


for i = 2:n+1
    w(i) = w(i-1) + h*(subs(f, [t, var], [a+(i-1)*h, w(i-1)]));
end

v = w(n+1);