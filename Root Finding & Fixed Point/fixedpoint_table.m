function p = fixedpoint_table(g, var, p0, niter)
% Solve g(p) = p using fixed-point iteration.
% Like fixedpoint, but no convergence check (always niter iterations).

% Print header
fprintf(' n         p          |p-p0|   \n');
fprintf('-------------------------------\n');

for n = 1:niter
    p = vpa(subs(g, var, p0));
    fprintf('%2d  %12.8f  %12.8f\n', n, p, abs(p-p0));
    p0 = p;
end
