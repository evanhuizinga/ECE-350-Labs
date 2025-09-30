function [y, ty] = my_cont_conv(x, tx, h, th)
    t_step_x = tx(2) - tx(1);
    t_step_h = th(2) - th(1);

    if abs(t_step_x - t_step_h) > 1e-10
        error('time steps for x and h must be equal');
    end
    
    t_step = t_step_x;

    y = conv(x, h) * t_step;

    t_start = tx(1) + th(1);
    t_end   = tx(end) + th(end);

    ty = t_start : 0.1 : t_end;
end
