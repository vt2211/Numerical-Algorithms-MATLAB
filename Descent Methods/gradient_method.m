function c = gradient_method(f, v, x0, niter)

%cvx_sol = 8.32694;
cvx_sol = -2.17995;

a = 3;
b = 0.5;
c = 0;
seq_points = zeros(niter, length(x0));
seq_points(1, :) = x0';
seq_f = zeros(niter:1)';
seq_f(1) = subs(f, v, x0);

for i = 2:niter
    m = 0;
    while 1
        if (subs(f, v, x0 - a*(b^m)*vpa(subs(gradient(f)', v, x0)))) < (subs(f, v, x0)), break; end
        m = m+1;
    end
    t = a*(b^m);

    c = vpa(x0 - t.*vpa(subs(gradient(f)', v, x0)));
    seq_points(i, :) = c;
    seq_f(i) = subs(f, v, c);
    x0 = c;
end

figure(1)
x = 1:1:niter;
error = abs(seq_f - cvx_sol);
semilogy(x, error, 'LineWidth', 4)
xlabel('k', 'FontSize', 12); ylabel('log errors', 'FontSize', 12);
title('Gradient Method', 'FontSize', 16)
%axis([0, 40, 1e-9, 1])
grid on

%figure(2)
%plot3(seq_points(:,1), seq_points(:,2), seq_points(:,3), 'ob-', 'LineWidth', 2)
%xlabel('x1', 'FontSize', 12); ylabel('x2', 'FontSize', 12); zlabel('x3', 'FontSize', 12)
%title('Gradient Method', 'FontSize', 16)
%grid on

