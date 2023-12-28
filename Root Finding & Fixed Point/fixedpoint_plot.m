function p = fixedpoint_plot(g, var, p0, iter, xmin, xmax)
% Solve g(p) = p using fixed-point iteration.
% Like fixedpoint, but no convergence check 
% and plotting the graph and the iterations.

% Print header
fprintf(' n         p          |p-p0|   \n');
fprintf('-------------------------------\n');

% Plot g(x) and x
xx=linspace(xmin,xmax,1000);
plot(xx,subs(g, var, xx),xx,xx,'linewidth',2)
axis equal,grid on,axis([xmin,xmax,xmin,xmax])

for n = 1:iter
    p = vpa(subs(g, var, p0));
    fprintf('%2d  %12.8f  %12.8f\n', n, p, abs(p-p0));
    line([p0,p0], [p0,p], 'color','r', 'linewidth',2); pause(1);
    line([p0,p] , [p,p],  'color','r', 'linewidth',2); pause(1);
    p0 = p;
end