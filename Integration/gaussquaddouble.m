function J = gaussquaddouble(f, c, d, a, b, n)
%gaussian quadrature for double integrals

syms x; syms y;
[t, r] = gaussquadvals(n);

J = 0;
ty = ((d-c) .* t + (d+c))/2;
tx = ((b-a) .* t + (b+a))/2;

for i = 1:n
    for j = 1:n
        J = J + (r(j)*r(i)*subs(f, [x,y], [tx(i), ty(j)]));
    end
    
end
J = vpa(J * ((b-a)*(d-c)/4));

