function p = steffensen_table(g, var, p0, niter)
% Solve g(p) = p using Steffensen's method.
% Like steffensen, but no convergence check (always niter iterations).

% Print header
fprintf(' n         p          |p-p0|   \n');
fprintf('-------------------------------\n');

for n = 1:niter
    p1 = subs(g, var, p0);
    p2 = subs(g, var, p1);
    if vpa(p2 -2*p1 + p0) == 0   % Avoid divide by zero
        break; 
    end   
    p = vpa(p0 - (p1-p0)^2 / (p2-2*p1+p0));
    fprintf('%2d  %12.8f  %12.8f\n', n, p, abs(p-p0));
    p0 = p;
end