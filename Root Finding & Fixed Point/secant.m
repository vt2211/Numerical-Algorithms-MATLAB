function secant(f, var, p0, p1, tol)
% Solve f(p) = 0 using Newton's method.

while 1
    f0 = subs(f, var, p0);
    f1 = subs(f, var, p1);
    p = vpa(p1 - (f1*(p1 - p0))/(f1 - f0));
    if abs(p-p0) < tol
        break;
    end
    p0 = p;
end

vpa(p)