function [y, ny] = my_discr_conv(x, nx, h, nh)

y = conv(x, h);

    ny_start = nx(1) + nh(1);
    ny_end   = nx(end) + nh(end);
    ny = ny_start : ny_end;
end
