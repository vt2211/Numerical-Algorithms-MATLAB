function sum = taylor_sum(f, degree, var, point, loc)
     poly = taylor(f, 'Order', degree, 'ExpansionPoint', point, 'OrderMode', 'Relative');
     sum = vpa(subs(poly, var, loc));
end

