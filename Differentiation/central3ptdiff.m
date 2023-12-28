function [dfx0, est_error, act_error] = central3ptdiff(f, var, h, x0)

dfx0 = vpa(1/(2*h) * (subs(f, var, x0 + h) - subs(f, var, x0 - h)));

error_func = (h^2 / 6) * diff(f, var, 3);

est_error = max(vpa(subs(error_func, var, x0-h)), vpa(h/2 * subs(error_func, var, x0+h)) );

act_error = abs(subs(diff(f, var), var, x0) - dfx0);

