function [t, w] = backeuler(f, dfdy, a, b, alpha, N, maxiter, tol)

h = (b-a)/N;
w = zeros(N,1);
t = zeros(N,1);

w(1) = alpha;
t(1) = a;
fprintf(' t            y\n');

for i = 1:N
    th = t(i) + h;
    w0 = w(i);
    
    f_n = @(z) z - w0 - h*f(th, z);
    df_n = @(z) 1 - h*dfdy(th, z);

    w(i+1) = newton_p4(f_n, df_n, w0, tol, maxiter);
    t(i+1) = th;
    fprintf('%2d  %12.8f\n', t(i+1), w(i+1));
end

end
    

