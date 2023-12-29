function c = golden_section(f, a, b, tol)

syms x;
r = (1+sqrt(5))/2 - 1;
x1 = a + (1-r)*(b-a);
x2 = a + r*(b-a);

while (b-a) > tol
    if subs(f, x, x1) >= subs(f, x, x2)
        a = x1;
        x1 = x2;
        x2 = a + r*(b-a);
    else
        b = x2;
        x2 = x1;
        x1 = a + (1-r)*(b-a);
    end
end

c = (a+b)/2;


