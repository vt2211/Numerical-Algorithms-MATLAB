function p = muller_table(f, var, p0, p1, p2, niter)
% Solve f(p) = 0 using Muller's method.
% Like muller, but no convergence check (always niter iterations).

% Print header
fprintf(' n         p          |p-p2|   \n');
fprintf('-------------------------------\n');

h1 = p1 - p0;
h2 = p2 - p1;
d1 = vpa((subs(f, var, p1) - subs(f, var, p0))) / h1;
d2 = vpa((subs(f, var, p2) - subs(f, var, p1))) / h2;
d = (d2 - d1) / (h2 + h1);
for n = 1:niter
    b = d2 + h2*d;
    D = vpa(sqrt(b^2 - 4*subs(f, var, p2)*d));
    if abs(b - D) < abs(b + D)
        E = b + D;
    else
        E = b - D;
    end
    h = vpa(-2*subs(f, var, p2))/E;
    p = p2 + h;
    fprintf('%2d  %12.8f  %12.8f\n', n, p, abs(p - p2));
    p0 = p1;
    p1 = p2;
    p2 = p;
    h1 = p1 - p0;
    h2 = p2 - p1;
    d1 = vpa((subs(f, var, p1) - subs(f, var, p0))) / h1;
    d2 = vpa((subs(f, var, p2) - subs(f, var, p1))) / h2;
    d = (d2 - d1) / (h2 + h1);
end