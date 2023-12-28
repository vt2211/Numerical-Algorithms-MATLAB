function newton(f, var, p0, tol)
% Solve f(p) = 0 using Newton's method.

while 1
    df = diff(f, var);
    p = vpa(p0 - subs(f, var, p0)/subs(df, var, p0));
    if abs(p-p0) < tol, break; end
    p0 = p;
end

vpa(p)