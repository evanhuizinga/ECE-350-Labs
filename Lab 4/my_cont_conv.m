function [y, ty] = my_cont_conv(xt, t, ht)
    t_step = t(2) - t(1);

    y = conv(xt, ht) * t_step;

    t_start = t(1) + t(1);
    t_end = t(end) + t(end);

    ty = linspace(t_start, t_end, length(y));
end
