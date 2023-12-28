function [I, est_error, act_error] = ctrapezoid(f, var, a, b, n)

h = (b - a) / n;
x = zeros(1, n+1);

x(1) = a; 
x(n+1) = b;

for i = 1:n-1
    x(i+1) = a + i*h;
end

fx = subs(f, var, x);
fx

I = h/2*(fx(1) + fx(n+1));

for j = 2:(n)
    I = I + h/2*(2*fx(j));
end

I = vpa(I);

est_error = (b - a)/12 * h^2 * diff(f, var, 2);
%if sin or cos, bound diff term by 1
%if both sin AND cos, just choose one term (when one is max, other is min)

act_error = abs(vpa(int(f, var, a, b)) - I);


