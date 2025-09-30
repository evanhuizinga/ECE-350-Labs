% ECE 350 Lab 5 Main Script %

% Part 2-4 %
% ARMA form: y[n] = x[n] + 0.5 x[n-1000]

% Coefficients for system
a = 1;                  % AR part (a0=1, no feedback)
b = [1 zeros(1,999) 0.5]; % MA part: b0=1, b1000=0.5

% Create unit impulse signal, length 4000
delta = [1 zeros(1,3999)];

% Compute impulse response
h_1 = filter(b, a, delta);

% Plot impulse response
subplot(3,1,1)
stem(h_1, 'LineWidth', 1.5)
title('Impulse Response h_1[n]')
xlabel('n')
ylabel('h_1[n]')
grid on;

% Part 3-3 %

% parameters
N = 1000;
alpha = 0.5;

% coefficients for Eq(3): z[n] + alpha*z[n-N] = y[n]
b2 = [1];                      % MA coeffs (b0 = 1)
a2 = [1 zeros(1,N-1) alpha];   % AR coeffs (a0=1, aN = alpha)

% create delta of length 4000 (same length used earlier)
L = 4000;
delta = [1 zeros(1,L-1)];

% compute impulse response h_2 (finite approximation)
h_2 = filter(b2, a2, delta);

% plot h_2 in second subplot (assume first subplot used earlier)
subplot(3,1,2)
stem(0:length(h_2)-1, h_2, 'Marker','none', 'LineWidth', 1.5)  % simple stem plot
title('Impulse response h_2[n] (inverse filter approx)')
xlabel('n')
ylabel('h_2[n]')
xlim([0 3000])   % zoom so you can see first few pulses
grid on;

% Part 3-4 %

n1 = 0:length(h_1)-1;   % index vector for h_1
n2 = 0:length(h_2)-1;   % index vector for h_2

[h_3, n3] = my_discr_conv(h_1, n1, h_2, n2); % Convolve h_1 and h_2 %

% plot h_3
subplot(3,1,3)
stem(n3, h_3, 'Marker','none', 'LineWidth', 1.5)
title('h_3[n] = h_1 * h_2 (overall)')
xlabel('n')
ylabel('h_3[n]')
grid on;

% Part 3-5 %

z = filter(b2, a2, y);   % remove echo

% plot y and z (small time window to visualize)
t = (0:length(y)-1)/8000;         % time axis in seconds
subplot(2,1,1)
plot(t(1:4000), y(1:4000))        % plot first 4000 samples (~0.5 s)
title('Original y[n] (with echo)')
xlabel('time (s)')

subplot(2,1,2)
plot(t(1:4000), z(1:4000))
title('Restored z[n] (after inverse filter)')
xlabel('time (s)')

% play sounds (use headset)
sound(y, 8000)   % listen to original with echo
pause(length(y)/8000 + 0.5)
sound(z, 8000)   % listen to restored signal

% Part 3-6 %

N2 = 500;
alpha2 = 0.8;

% create new echo y2 from original clean x
b_new = [1 zeros(1,N2-1) alpha2];
a_new = 1;
y2 = filter(b_new, a_new, x);   % new echoed signal

% design inverse filter for new parameters
b_inv = 1;
a_inv = [1 zeros(1,N2-1) alpha2];

% restore z2
z2 = filter(b_inv, a_inv, y2);

% plot x, y2, z2 (small window)
subplot(3,1,1)
plot(0:999, x(1:1000))
xlabel('n')
title('x[n] (original)')
subplot(3,1,2)
plot(0:999, y2(1:1000))
xlabel('n')
title(sprintf('y2[n] with N=%d, alpha=%.2f (echo)', N2, alpha2))
subplot(3,1,3)
plot(0:999, z2(1:1000))
xlabel('n')
title('z2[n] after inverse filter')

% play examples
sound(x,8000); pause(length(x)/8000 + 0.5);
sound(y2,8000); pause(length(y2)/8000 + 0.5);
sound(z2,8000);

% short printed comments
fprintf('Used N2=%d, alpha2=%g.  Larger alpha -> louder echo. Larger N -> longer delay.\n', N2, alpha2);
