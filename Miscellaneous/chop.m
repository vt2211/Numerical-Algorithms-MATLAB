function chopped = chop(num, digits)
% digits from the decimal point (1 = tenths, -1 = ones)
    factor = 10^(digits);
    chopped = fix(num * factor) / factor;
end

