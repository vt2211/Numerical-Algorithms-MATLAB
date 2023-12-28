function l = modified_newton_plot(f, var, p0, iter, xmin, xmax)
%MODIFIED_NEWTON Summary of this function goes here
%   Detailed explanation goes here
df = diff(f, var);
ddf = diff(df, var);
g = var - ((f*df) / ((df)^2 - (f*ddf)));
l = fixedpoint_plot(g, var, p0, iter, xmin, xmax);
end

