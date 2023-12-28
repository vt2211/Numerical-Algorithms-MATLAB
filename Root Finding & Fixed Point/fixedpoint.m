function p = fixedpoint(g, var, p0, tol)
% Solve g(p) = p using fixed-point iteration.

while 1
    p = vpa(subs(g, var, p0));
    if abs(p - p0) < tol
        break; 
    end
    p0 = p;
end
