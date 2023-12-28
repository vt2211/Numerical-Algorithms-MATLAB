function I = laguerrequad(f, var, n, k)
%calculates indefinite integrals
%n = number of points
%k = 2 means both sides go to infinity, k = 1 means only one side.
%calculates from 0 to infinity. might need to subtract another integral.

[x, c] = laguerrequadvals(n);
I = 0;
lag = f * exp(var);
for i = 1:n
    I = I + (c(i) * subs(lag, var, x(i)));
end

if k == 2
    I = vpa(2 * I);
elseif k == 1
    I = vpa(I);
else
    fprintf('Error in Bound')
end




