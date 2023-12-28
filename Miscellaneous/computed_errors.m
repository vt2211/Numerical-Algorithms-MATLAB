function [abs_err, rel_err] = computed_errors(p,p1)
      abs_err = vpa(abs(p - p1));
      if p ~= 0
         rel_err = vpa(abs(p - p1) / (p));
     end
end
