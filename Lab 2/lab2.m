% Part 2 %
nx = -1:1:2;       
nh = 0:1:3;         
    
x = [-2,-1,1,2]; 
h = [-1,-1,2,1];

[y,ny] = my_discr_conv(x, nx, h, nh);

stem(ny, y);

xlabel('n');
ylabel('y[n]');
title('Convolution y[n] = x[n] * h[n]');
grid on;

% Part 4 %

t = -2:0.1:8;

xt = my_unit_step(t, 1) - my_unit_step(t, 4);

ht = my_unit_step(t, 1) - my_unit_step(t, 5);

figure;
plot(t, ht, 'LineWidth', 2);
xlabel('t');
ylabel('x(t)');
title('x(t) = u(t - 1) - u(t - 4)');
grid on;

% 4-3 %

dt = 0.1;
yt = conv(xt, ht) * dt;

ty = (t(1) + t(1)) : dt : (t(end) + t(end));

figure;
plot(ty, yt, 'LineWidth', 2);
xlabel('t');
ylabel('y(t)');
title('y(t) = x(t) * h(t) (Continuous Convolution Approximation (unscaled)');
grid on;

% 4-6 %
[yt, ty] = my_cont_conv(xt, t, ht);

figure;
plot(ty, yt, 'LineWidth', 2);
xlabel('t');
ylabel('y(t)');
title('Continuous-Time Convolution from my_cont_conv');
grid on;
