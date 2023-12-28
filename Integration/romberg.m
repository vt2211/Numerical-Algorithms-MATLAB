function R = romberg(f, var, a, b, n)
% Compute integral of f(x) from a to b using Romberg integration.
%needed values are on the main diagonal

h = b-a;
R = zeros(n,n);
R(1,1) = vpa(h/2 * (subs(f, var, a) + subs(f, var, b)));
for i = 2:n
    R(i,1) = vpa(1/2 * (R(i-1,1) + h*sum(subs(f, var, (a + ((1:2^(i-2))-0.5)*h)))));
    for j = 2:i
        R(i,j) = vpa(R(i,j-1) + (R(i,j-1)-R(i-1,j-1)) / (4^(j-1)-1));
    end
    h = h/2;
end

