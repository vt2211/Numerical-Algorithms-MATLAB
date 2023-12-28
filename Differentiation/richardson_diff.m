function N = richardson_diff(f, var, h0, x0, maxN, type)
%h0 must be BIGGEST step size
%x0 is which point to calculate at
%maxN is the number of 'N's

% O(h^n), n = maxN or n = 2*maxN (depending on the type)
    %e.g. taylor of cos(x), sin(x) skips a degree, so will use 2*maxN
% Change the 2 to 4 at places

% can repeat by literally changing function behind in 'holder' line
    % also works for integration, just need to update.
    % note that the function MUST depend on h

%rows(N(h), N2(h), N3(h), ...)
%columns(h, h/2, h/4, ...)


h = zeros(1, maxN); %initialize h array
h(1, 1) = h0;
for i = 1:maxN
    h(1, i+1) = h0/(2^i); %fill h array
end

if type == "numeric diff"
    N = zeros(maxN, maxN); %initialize final matrix
    for i = 1:maxN
      holder = numericdiff(f, var, h(i), x0); %use numericdiff to fill in N1(h)
        N(i, 1) = holder;
    end

    for j = 2:maxN
        Nk = N(2:end, j-1) + (N(2:end, j-1) - N(1:end-1, j-1)) ./ (2.^(j-1) - 1); %O(h)
        for k = 1:length(Nk)
            N(k, j) = Nk(k);
        end
    end
end

if type == "central 3pt"
    N = zeros(maxN, maxN); %initialize final matrix
    for i = 1:maxN
      holder = central3ptdiff(f, var, h(i), x0); %use numericdiff to fill in N1(h)
        N(i, 1) = holder;
    end

    for j = 2:maxN
        Nk = N(2:end, j-1) + (N(2:end, j-1) - N(1:end-1, j-1)) ./ (4.^(j-1) - 1); %O(h2)
        for k = 1:length(Nk)
           N(k, j) = Nk(k);
        end
    end
end

%make all nonsense values 0 (below the anti-diagonal)
k = maxN;
for m = 1:maxN
    for n = 1:maxN
        if k < n
            N(n, m) = 0;
        end
    end
    k = k-1;
end

    
%Persson's Matlab file

% Richardson's Extrapolation Demo
% Forward difference approximation of f'(0) with f(x) = exp(x)

%h = [1; 0.5; 0.25; 0.125];
%N1 = (exp(h) - 1) ./ h
%N2 = N1(2:end) + (N1(2:end) - N1(1:end-1)) / 1
%N3 = N2(2:end) + (N2(2:end) - N2(1:end-1)) / 3
%N4 = N3(2:end) + (N3(2:end) - N3(1:end-1)) / 7