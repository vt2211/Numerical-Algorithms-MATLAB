function [I, est_error, act_error] = csimpson(f, var, a, b, n)

h = (b - a) / n;
x = zeros(1, n+1);

x(1) = a;
x(n+1) = b;

for i = 1:n-1
    x(i+1) = a + i*h;
end

fx = subs(f, var, x);

I = h/3*(fx(1) + fx(n+1));

for j = 3:2:(n)
    I = I + h/3*(2*fx(j));
end

for j = 2:2:(n)
    I = I + h/3*(4*fx(j));
end

%I = vpa(I);

est_error = (b - a)/180 * h^4 * diff(f, var, 4);
%if sin or cos, bound diff term by 1
%if both sin AND cos, just choose one term (when one is max, other is min)

act_error = abs(vpa(int(f, var, a, b)) - I);






