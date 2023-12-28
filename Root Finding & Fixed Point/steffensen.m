function p = steffensen(g, var, p0, tol)
% Solve g(p) = p using Steffensen's method.

while 1
    p1 = subs(g, var, p0);
    p2 = subs(g, var, p1);
    p = vpa(p0 - (p1-p0)^2 / (p2-2*p1+p0));
    if abs(p-p0) < tol
        break;
    end
    p0 = p;
end