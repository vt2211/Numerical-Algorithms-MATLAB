function app = adaptivequad(f, var, aa, bb, eps, n)
%plots the graph as well

 cnt = 0;
 app = 0;
 i = 1;
 tol = zeros(1,n);
 a = zeros(1,n);
 xs = zeros(1, 2*n); ys = zeros(1, 2*n); count = 0; 
 h = zeros(1,n);
 fa = zeros(1,n);
 fc = zeros(1,n);
 fb = zeros(1,n);
 s = zeros(1,n);
 l = zeros(1,n);
 fd = zeros(1,n);
 fe = zeros(1,n);

 v = zeros(1,7);
 tol(i) = 10*eps;
 a(i) = aa; xs(i+count) = aa;
 h(i) = 0.5*(bb-aa);
 fa(i) = subs(f, var, aa); 
 cnt = cnt+1;
 fc(i) = subs(f, var, (aa+h(i)));
 cnt = cnt+1;
 fb(i) = subs(f, var, bb);
 cnt = cnt+1;


 s(i) = h(i)*(fa(i)+4*fc(i)+fb(i))/3;
 l(i) = 1;

 while i > 0 
   fd = subs(f, var, (a(i)+0.5*h(i)) );

   cnt = cnt+1;
   fe = subs(f, var, (a(i)+1.5*h(i)));
   cnt = cnt+1;
   s1 = h(i)*(fa(i)+4*fd+fc(i))/6;
   s2 = h(i)*(fc(i)+4*fe+fb(i))/6;
   v(1) = a(i); xs(i+count) = a(i);
   v(2) = fa(i);
   v(3) = fc(i);
   v(4) = fb(i);
   v(5) = h(i);
   v(6) = tol(i);
   v(7) = s(i);
   lev = l(i);
   i = i-1;
   if abs(s1+s2-v(7)) < v(6)
     app = app+(s1+s2);

   else
     if lev >= n
       fprintf('Procedure exceeds limit');
       break;
     else
      i = i+1;
      a(i) = v(1)+v(5); xs(i+count) = v(1)+v(5); count = count+1;
      fa(i) = v(3); 
      fc(i) = fe;
      fb(i) = v(4);

      h(i) = 0.5*v(5);
      tol(i) = 0.5*v(6);
      s(i) = s2;
      l(i) = lev+1;
      i = i+1;
      a(i) = v(1);
      fa(i) = v(2);
      fc(i) = fd;
      fb(i) = v(3);
      h(i) = h(i-1);
      tol(i) = tol(i-1);
      s(i) = s1;
      l(i) = l(i-1);
     end
   end
 end

app = vpa(app);

xs = nonzeros(xs);
ys = subs(f, var, xs);

xx = linspace(aa, bb, 500);
yy = subs(f, var, xx);

plot(xs, ys, 'o', xx, yy, 'r'); grid on; 
axis auto;