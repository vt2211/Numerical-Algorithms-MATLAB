function [J, error] = simpsondouble(f, c, d, a, b, m, n)
%SIMPSONDOUBLE Algorithm 4.4 in Burden/Faires
%   J = SIMPSONDOUBLE(F, C, D, A, B, M, N) where F,C,D are functions,
%   A,B are the endpoints, and M,N are postive integers
% int a to b, c to d, f dydx
%c,d are lower,upper bounds for dy, can be functions of x (INNER integral)
%a,b are lower,upper bounds for dx (OUTER integral)

syms x; syms y;

h = (b-a) / n;
k = (d-c) / m;
J1 = 0; J2 = 0; J3 = 0;
for i = 0:n
    xs = a + i*h;
    dx = subs(d, x, xs);
    cx = subs(c, x, xs);
    HX = (dx - cx)/ m;
    K1 = subs(f, [x, y], [xs, cx]) + subs(f, [x, y], [xs, dx]);
    K2 = 0;
    K3 = 0;
    for j = 1:m-1
        ys = cx + j*HX;
        Q = subs(f, [x,y], [xs, ys]);
        
        if mod(j,2) == 0    % j even
            K2 = K2 + Q;
        else                % j odd
            K3 = K3 + Q;
        end
    end
    L = (K1 + 2*K2 + 4*K3) * HX/3;
    if i == 0 || i == n     % end points
        J1 = J1 + L;
    elseif mod(i,2) == 0    % i even
        J2 = J2 + L;
    else                    % i odd
        J3 = J3 + L;        
    end
end
fprintf('%d/3 ( %d + 2*%d + 4*%d)' , h, J1, J2, J3);
J = vpa(h*(J1 + 2*J2 + 4*J3) / 3);

error = -(d-c)*(b-a)/180 * (h^4 * diff(f, x, 4) + k^4 * diff(f, y, 4));
