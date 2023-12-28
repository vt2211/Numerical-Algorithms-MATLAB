function phat = aitken(pn, var, p0, niter)


%need to tweak as per requirement

%if dependent only on index, not on prev term
     %nums = (1:(niter+2))';
     %n = vpa(subs(pn, var, nums));

n = zeros(niter+2, 1);
n(1) = p0;

%where n is the previous term in the function
     %not reliable if there are other terms (e.g. p(n-2), p(n+1), etc.
for i = 1:niter
    n(i+1) = vpa(subs(pn, var, n(i)));
end

p0 = n(1:niter);
p1 = n(2:(niter+1));
p2 = n(3:(niter+2));

phat = p0 - ((p1 - p0).^2)./(p2 - 2.*p1 + p0);

end

