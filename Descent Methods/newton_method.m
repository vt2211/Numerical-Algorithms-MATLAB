function c = newton_method(f, var, a, b x0, niter, true_sol)

c = 0;
seq_points = zeros(niter, length(x0));
seq_points(1, :) = x0';
seq_f = zeros(niter, 1)';
seq_f(1) = subs(f, var, x0);

for i = 2:niter
    m = 0;
    while 1
        if subs(f, var, x0 - a*(b^m)*(vpa(subs(hessian(f), var, x0))\vpa(subs(gradient(f), var, x0)))') < subs(f, var, x0), break; end
        m = m+1;
    end
    t = a*(b^m);

    c = vpa(x0 - t.* (vpa(subs(hessian(f), var, x0))\vpa(subs(gradient(f), var, x0)))');
    seq_points(i, :) = c;
    seq_f(i) = subs(f, var, c);
    x0 = c;
end

figure(1)
x = 1:1:niter;
error = abs(seq_f - cvx_sol);
semilogy(x, error, 'LineWidth', 4)
xlabel('k', 'FontSize', 12); ylabel('log errors', 'FontSize', 12);
title('Newton Method', 'FontSize', 16)
grid on

figure(2)
plot3(seq_points(:,1), seq_points(:,2), seq_points(:,3), 'ob-', 'LineWidth', 2)
xlabel('x1', 'FontSize', 12); ylabel('x2', 'FontSize', 12); zlabel('x3', 'FontSize', 12)
title('Newton Method', 'FontSize', 16)
grid on 

