function [dfx0, est_error, act_error] = numericdiff(f, var, h, x0)

dfx0 = vpa((subs(f, var, x0+h) - subs(f, var, x0))/h);
%f'(x0) ~ (f(x0+h) - f(x0))/h

est_error = h/2 * diff(f, var, 2);

act_error = abs(subs(diff(f, var), var, x0) - dfx0);
%actual(f'(x0)) - predicted(f'(x0))

