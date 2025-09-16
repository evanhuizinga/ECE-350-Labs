% Lab 3 Main Script %

% 1-2 %
n = -5:1:10; % Creates integer based array from -5 to 10

h1 = 0.6*(my_unit_step(n, 1) - my_unit_step(n, 6)); % Creates h1 function %
h2 = 0.6*(my_unit_step(n, -2) - my_unit_step(n, 3)); % Creates h2 function %
x1 = 1.5*(my_unit_step(n, 0) - my_unit_step(n, 3)) + 0.5*(my_unit_step(n, 3) - my_unit_step(n, 9)); % Creates x1 function %
x2 = 0.4*my_unit_step(n, 0) + 0.3*n.*my_unit_step(n, 0) - 0.4*my_unit_step(n, 6) - 0.3*n.*my_unit_step(n, 6); % Creates x2 function %

% Plot in 2x2 grid 1-3 %
subplot(2,2,1) % Creats 2x2 subplots and assigns to first quadrant %
stem(n,h1,'filled') % Creates discrete plot with n and h1 and filled circles %
xlabel('n'); % Assigns x label to n %
ylabel('h1[n]'); % Assigns y label to h1[n] %
title('h1[n] using my_unit_step EH') % Assigns Title of Plot %

subplot(2,2,2) % Assigns to second quadrant %
stem(n,h2,'filled') % Creates discrete plot with n and h2 and filled circles %
xlabel('n'); % Assigns x label to n %
ylabel('h2[n]'); % Assigns y label to h2[n] %
title('h2[n] using my_unit_step EH') % Assigns Title of Plot %

subplot(2,2,3) % Assigns to third quadrant %
stem(n,x1,'filled') % Creates discrete plot with n and x1 and filled circles %
xlabel('n'); % Assigns x label to n %
ylabel('x1[n]'); % Assigns y label to x1[n] %
title('x1[n] using my_unit_step EH') % Assigns Title of Plot %

subplot(2,2,4) % Assigns to fourth quadrant %
stem(n,x2,'filled') % Creates discrete plot with n and x2 and filled circles %
xlabel('n'); % Assigns x label to n %
ylabel('x2[n]'); % Assigns y label to x2[n] %
title('x2[n] using my_unit_step EH') % Assigns Title of Plot %

% Part 2-1 %

% Convolve x1[n] with h1[n] using my_discr_conv %
[y1, ny1] = my_discr_conv(x1, n, h1, n);

% Plot output y1[ny1] %
figure;
stem(ny1, y1, 'filled') % Creates Discrete plot with ny1, and n and filled circles %
xlabel('n'); % Assigns x label to n %
ylabel('y1[n]'); % Assigns y label to y1[n] %
title('Convolution: y1[n] = x1[n] * h1[n] EH'); % Creates title %

% Part 2-2 %

% Convolve h1[n] with x1[n] using my_discr_conv
[y1_alt, ny1_alt] = my_discr_conv(h1, n, x1, n);

% Plot output y1_alt[ny1_alt]
figure;
stem(ny1_alt, y1_alt, 'filled') % Creates Discrete plot with ny1_alt, and y1_alt and filled circles %
xlabel('n'); % Assigns x label to n %
ylabel('y1_alt[n]'); % Assigns y label to y1[n] %
title('Output y1_alt[n] = h1[n] * x1[n] is equal to previous EH'); % Creates title %

% Part 2-3 % 

figure;

subplot(2,2,1); % Creats 2x2 subplots and assigns to first quadrant %
stem(n, h1, 'filled') % Creates discrete plot with n and h1 and filled circles %
xlabel('n'); % Assigns x label to n %
ylabel('h1[n]'); % Assigns y label to h1[n] %
title('Input Signal h1[n] EH'); % Assigns Title %

subplot(2,2,2); % Creats 2x2 subplots and assigns to second quadrant %
stem(n, x1, 'filled') % Creates discrete plot with n and x1 and filled circles %
xlabel('n'); % Assigns x label to n %
ylabel('x1[n]'); % Assigns y label to x1[n] %
title('Impulse Response x1[n] EH'); % Assigns Title %

subplot(2,2,3); % Creats 2x2 subplots and assigns to third quadrant %
stem(ny1, y1, 'filled') % Creates discrete plot with ny1 and y1 and filled circles %
xlabel('n'); % Assigns x label to n %
ylabel('y1[n]'); % Assigns y label to y1[n] %
title('Output y1[n] = x1[n] * h1[n] EH'); % Assigns Title %

subplot(2,2,4); % Creats 2x2 subplots and assigns to fourth quadrant %
stem(ny1_alt, y1_alt, 'filled') % Creates discrete plot with ny1_alt and y1_alt and filled circles %
xlabel('n'); % Assigns x label to ny1_alt %
ylabel('y1_alt[n]'); % Assigns y label to y1_alt[ny1_alt] %
title('Output y1_alt[n] = h1[n] * x1[n] EH'); % Assigns Title %

% Part 3-1 %

% Convolve x2[n] with h1[n] to get y2[n]
[y2, ny2] = my_discr_conv(x2, n, h1, n);

% Plot y2[n]
figure;
stem(ny2, y2, 'filled') % Creates discrete plot with ny2 and y2 with filled circles %
xlabel('n'); % Assigns x label to n %
ylabel('y2[n]'); % Assigns y label to y2[n] %
title('Output y2[n] = x2[n] * h1[n] EH'); % Assigns Title %

% Part 3-2 %

% Create x3[n] = x1[n] + x2[n]
x3 = x1 + x2;

% Convolve x3[n] with h1[n] to get y3[n]
[y3, ny3] = my_discr_conv(x3, n, h1, n);

% Plot y3[n]
figure;
stem(ny3, y3, 'filled') % Creates discrete plot with ny3 and y3 with filled circles %
xlabel('n'); % Assigns x label to n %
ylabel('y3[n]'); % Assigns y label to y3[n] %
title('Output y3[n] = x3[n] * h1[n] EH'); % Assigns Title %

% Part 3-3 %

% Align y1 and y2 over a common index range
ny3b = min(ny1(1), ny2(1)) : max(ny1(end), ny2(end));

% Zero-pad y1 and y2 to match ny3b
y1_padded = zeros(size(ny3b));
y2_padded = zeros(size(ny3b));

% Place y1 into y1_padded
y1_padded((ny1(1):ny1(end)) - ny3b(1) + 1) = y1;

% Place y2 into y2_padded
y2_padded((ny2(1):ny2(end)) - ny3b(1) + 1) = y2;

% Now add them
y3b = y1_padded + y2_padded;

% Plot y3b[n]
figure;
stem(ny3b, y3b, 'filled') % Creates a discrete plot with ny3b and y3b with filled circles %
xlabel('n'); % Assigns x label to n %
ylabel('y3b[n]'); % Assigns y label to y3b[n] %
title('Output y3b[n] = y1[n] + y2[n] EH'); % Assigns Title %

% Part 3-5 %

% Create x4[n] = 5 * x1[n]
x4 = 5 * x1;

% Convolve x4[n] with h1[n] to get y4[n]
[y4, ny4] = my_discr_conv(x4, n, h1, n);

% Plot y4[n]
figure;
stem(ny4, y4, 'filled') % Creates a discrete plot with ny4 and y4 with filled circles %
xlabel('n'); % Assigns x label to n %
ylabel('y4[n]'); % Assigns y label to y4[n] %
title('Output y4[n] = x4[n] * h1[n] EH'); % Assigns Title %

% Part 3-6 %

% Scale y1[n] by 5 to get y4b[n]
y4b = 5 * y1;

% Plot y4b[n]
figure;
stem(ny1, y4b, 'filled') % Creates a discrete plot with ny1 and y4b with filled circles %
xlabel('n'); % Assigns x label to n %
ylabel('y4b[n]'); % Assigns y label to y4b[n] %
title('Output y4b[n] = 5 * y1[n] EH'); % Assigns title %

% Part 3-8 %

% Create x5[n] = 4*x2[n] - 2*x1[n]
x5 = 4 * x2 - 2 * x1;

% Convolve x5[n] with h1[n] to get y5[n]
[y5, ny5] = my_discr_conv(x5, n, h1, n);

% Plot y5[n]
figure;
stem(ny5, y5, 'filled') % Creates a discrete plot with ny5 and y5 with filled circles %
xlabel('n'); % Assigns x label to n %
ylabel('y5[n]'); % Assigns y label to y5[n]%
title('Output y5[n] = (4*x2[n] - 2*x1[n]) * h1[n] EH'); % Assigns Title %

% Part 3-9 %

% Align y1 and y2 over a common index range if needed
ny5b = min(ny1(1), ny2(1)) : max(ny1(end), ny2(end));

% Zero-pad y1 and y2 to match ny5b
y1_padded = zeros(size(ny5b));
y2_padded = zeros(size(ny5b));

y1_padded((ny1(1):ny1(end)) - ny5b(1) + 1) = y1;
y2_padded((ny2(1):ny2(end)) - ny5b(1) + 1) = y2;

% Compute y5b[n] = 4*y2[n] - 2*y1[n]
y5b = 4 * y2_padded - 2 * y1_padded;

% Plot y5b[n]
figure;
stem(ny5b, y5b, 'filled') % Creates a discrete plot with ny5b and y5b with filled circles %
xlabel('n'); % Assigns x label to n %
ylabel('y5b[n]'); % Assigns y label to y5b[n] %
title('Output y5b[n] = 4*y2[n] - 2*y1[n] EH'); % Assigns Title %

% Part 4-1 %

figure;

subplot(3,1,1)
stem(n, x1, 'filled') % Creates a discrete plot with n and x1 with filled circles %
xlabel('n'); % Assigns x label to n %
ylabel('x1[n]'); % Assigns y label to x1[n] %
title('Input Signal x1[n] EH'); % Assigns Title %

subplot(3,1,2)
stem(n, h1, 'filled') % Creates a discrete plot with n and h1 with filled circles %
xlabel('n'); % Assigns x label to n %
ylabel('h1[n]'); % Assigns y label to h1[n] %
title('Impulse Response h1[n] EH'); % Assigns Title %

subplot(3,1,3)
stem(ny1, y1, 'filled') % Creates a discrete plot with ny1 and y1 with filled circles %
xlabel('n'); % Assigns x label to n %
ylabel('y1[n]'); % Assigns y label to y1[n] %
title('Output Signal y1[n] = x1[n] * h1[n] EH'); % Assigns Title %

% Part 4-2 %

figure;

subplot(2,1,1)
stem(n, h1, 'filled') % Creates a discrete plot with n and h1 with filled circles %
xlabel('n'); % Assigns x label to n %
ylabel('h1[n]'); % Assigns y label to h1[n] %
title('Impulse Response h1[n] EH'); % Assigns Title %

subplot(2,1,2)
stem(n, h2, 'filled') % Creates a discrete plot with n and h2 with filled circles %
xlabel('n'); % Assigns x label to n %
ylabel('h2[n]'); % Assigns y label to h2[n] %
title('Impulse Response h2[n] EH'); % Assigns Title %

% Part 4-3 %

% Convolve x1[n] with h2[n] to get y12[n]
[y12, ny12] = my_discr_conv(x1, n, h2, n);

% Plot x1[n], h2[n], and y12[n] in 3x1 subplots
figure;

subplot(3,1,1)
stem(n, x1, 'filled') % Creates a discrete plot with n and x1 with filled circles %
xlabel('n'); % Assigns x label to n %
ylabel('x1[n]'); % Assigns y label to x1[n] %
title('Input Signal x1[n] EH'); % Assigns Title %

subplot(3,1,2)
stem(n, h2, 'filled') % Creates a discrete plot with n and h2 with filled circles %
xlabel('n'); % Assigns x label to n %
ylabel('h2[n]'); % Assigns y label to h2[n] %
title('Impulse Response h2[n] EH'); % Assigns Title %

subplot(3,1,3)
stem(ny12, y12, 'filled') % Creates a discrete plot with ny12 and y12 with filled circles %
xlabel('n'); % Assigns x label to n %
ylabel('y12[n]'); % Assigns y label to y12[n] %
title('Output Signal y12[n] = x1[n] * h2[n] EH'); % Assigns Title %
