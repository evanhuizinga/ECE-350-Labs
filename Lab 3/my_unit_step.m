function y = my_unit_step(t,mu)

%   Step function using time t and scalar mu %
arguments (Input)
    t
    mu
end

arguments (Output)
    y
end

y = double(t >= mu);
end
