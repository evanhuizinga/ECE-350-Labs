% Main Script Lab 6 Evan Huizinga %
 % 1-3 %
 
 t = -10.0:0.01:10.0; % Time vector 

% 1-4 %

% Parameters
T = 8;                % period
w0 = pi/4;            % fundamental frequency
t = -10:0.01:10;      % time vector
a0 = 2/T;             % DC coefficient = 0.25

% Hard-coded numeric version of ak formula so eval sees constants
ak_fcn_string = '(2*sin(k*pi/4)./(k*pi/4*8))';   % equivalent to (2*sin(k*w0)/(k*w0*T))

% N values
Nvals = [3 5 7 50];

figure;

% Actual x(t)
x_actual = zeros(size(t));
for n = 1:length(t)
    tmod = mod(t(n) + T/2, T) - T/2;
    if abs(tmod) <= 1
        x_actual(n) = 1;
    end
end

% Subplots for each N
subplot_index = 1;
for N = Nvals
    k = -N:N;
    y = fourier_series(ak_fcn_string, a0, w0, k, t);
    subplot(4,1,subplot_index);
    plot(t, y, 'b', 'LineWidth', 1.2);
    hold on;
    plot(t, x_actual, 'r--', 'LineWidth', 1);
    title(['Fourier Series Approximation, N = ' num2str(N)]);
    xlabel('t');
    ylabel('x_N(t)');
    grid on;
    ylim([-0.5 1.5]);
    subplot_index = subplot_index + 1;
end

% Part 2-1 %

k = -50:50;                  % fixed k range for smooth approximation
a0_values = [0, 1, -2, 6];   % test values for a0

figure;
for i = 1:length(a0_values)
    a0 = a0_values(i);
    y = fourier_series(ak_fcn_string, a0, w0, k, t);

    subplot(2,2,i);
    plot(t, y, 'b', 'LineWidth', 1.2);
    grid on;
    title(['a_0 = ' num2str(a0)]);
    xlabel('t'); ylabel('x(t)');
    axis([-10 10 -3 7]);    % same axis limits for comparison
end
sgtitle('Effect of DC Term a_0 on Fourier Series Approximation');

% Part 3-1 & 3-2 %

k = -50:50;          % harmonic range
a0 = 2/T;            % same DC coefficient as before
w0_values = [1, 2, 4];   % different fundamental frequencies to test

figure;
for i = 1:length(w0_values)
    w0_current = w0_values(i);
    y = fourier_series(ak_fcn_string, a0, w0_current, k, t);

    subplot(3,1,i);
    plot(t, y, 'b', 'LineWidth', 1.2);
    grid on;
    title(['\omega_0 = ' num2str(w0_current)]);
    xlabel('t');
    ylabel('x(t)');
    axis([-10 10 -0.5 1.5]);
end
sgtitle('Effect of Fundamental Frequency \omega_0 on Fourier Series Approximation');

% Part 4-2 %

k = -50:50;        % harmonics
w0 = pi/4;         % same fundamental frequency
a0_x = 2/T;        % DC term for x(t)
a0_y1 = 4 * a0_x;  % scaled DC term for y1(t)

ak_fcn_string_x = '(2*sin(k*pi/4)./(k*pi/4*8))'; % ak for x(t)
ak_fcn_string_y1 = '(4*2*sin(k*pi/4)./(k*pi/4*8))'; % ak for y1(t), scaled

% Calculate x(t) and y1(t)
y_x = fourier_series(ak_fcn_string_x, a0_x, w0, k, t);
y_y1 = fourier_series(ak_fcn_string_y1, a0_y1, w0, k, t);

% Plot comparison
figure;
plot(t, y_x, 'b', 'LineWidth', 1.2);
hold on;
plot(t, y_y1, 'r--', 'LineWidth', 1.2);
grid on;
xlabel('t');
ylabel('Amplitude');
title('Comparison of x(t) and y1(t) = 4x(t)');
legend('x(t)', 'y1(t) = 4x(t)');

% Part 4-4 %

k = -50:50;          % harmonics
w0 = pi/4;           % same fundamental frequency
a0_x = 2/T;          % DC term for x(t)
a0_y2 = -3 * a0_x;   % scaled DC term for y2(t)

ak_fcn_string_x = '(2*sin(k*pi/4)./(k*pi/4*8))';       % ak for x(t)
ak_fcn_string_y2 = '(-3*2*sin(k*pi/4)./(k*pi/4*8))';   % ak for y2(t), scaled

% Calculate x(t) and y2(t)
y_x = fourier_series(ak_fcn_string_x, a0_x, w0, k, t);
y_y2 = fourier_series(ak_fcn_string_y2, a0_y2, w0, k, t);

% Plot comparison
figure;
plot(t, y_x, 'b', 'LineWidth', 1.2);
hold on;
plot(t, y_y2, 'r--', 'LineWidth', 1.2);
grid on;
xlabel('t');
ylabel('Amplitude');
title('Comparison of x(t) and y2(t) = -3x(t)');
legend('x(t)', 'y2(t) = -3x(t)');

% Part 5-2 %

k = -50:50;          % harmonic indices
w0 = pi/4;           % fundamental frequency
a0_x = 2/T;          % DC term for x(t)

% Fourier coefficients for x(t)
ak_fcn_string_x = '(2*sin(k*pi/4)./(k*pi/4*8))';

% Time shift: tau = 1
tau = 1;
% Apply phase shift to ak for z1(t)
ak_fcn_string_z1 = ['(2*sin(k*pi/4)./(k*pi/4*8)).*exp(-1j*k*pi/4*' num2str(tau) ')'];

% Calculate x(t)
y_x = fourier_series(ak_fcn_string_x, a0_x, w0, k, t);

% Calculate z1(t)
y_z1 = fourier_series(ak_fcn_string_z1, a0_x, w0, k, t);

% Plot comparison
figure;
plot(t, y_x, 'b', 'LineWidth', 1.2);
hold on;
plot(t, y_z1, 'r--', 'LineWidth', 1.2);
grid on;
xlabel('t');
ylabel('Amplitude');
title('Verification of Time Shift: x(t) vs z1(t) = x(t-1)');
legend('x(t)', 'z1(t) = x(t-1)');

% Part 5-4 %

k = -50:50;          % harmonic indices
w0 = pi/4;           % fundamental frequency
a0_x = 2/T;          % DC term for x(t)

% Fourier coefficients for x(t)
ak_fcn_string_x = '(2*sin(k*pi/4)./(k*pi/4*8))';

% Time shift: tau = -2 (because t+2 means shift left)
tau = -2;
% Apply phase shift to ak for z2(t)
ak_fcn_string_z2 = ['(2*sin(k*pi/4)./(k*pi/4*8)).*exp(-1j*k*pi/4*' num2str(tau) ')'];

% Calculate x(t)
y_x = fourier_series(ak_fcn_string_x, a0_x, w0, k, t);

% Calculate z2(t)
y_z2 = fourier_series(ak_fcn_string_z2, a0_x, w0, k, t);

% Plot comparison
figure;
plot(t, y_x, 'b', 'LineWidth', 1.2);
hold on;
plot(t, y_z2, 'r--', 'LineWidth', 1.2);
grid on;
xlabel('t');
ylabel('Amplitude');
title('Verification of Time Shift: x(t) vs z2(t) = x(t+2)');
legend('x(t)', 'z2(t) = x(t+2)');

% Part 6-2 %

T = 6;                  % period
w0 = 2*pi/T;           % fundamental frequency
d0 = 3;                 % DC term

k = -50:50;            % harmonics
dk_fcn_string = '1j*(3/(pi*k))';  % given dk formula

t = -10:0.01:10;       % time vector

% Calculate sawtooth wave s(t)
s_t = fourier_series(dk_fcn_string, d0, w0, k, t);

% Plot the sawtooth wave
figure;
plot(t, s_t, 'b', 'LineWidth', 1.2);
grid on;
xlabel('t');
ylabel('s(t)');
title('Sawtooth Wave using Fourier Series');

% Part 6-4 %

T = 6;                    % period
w0 = 2*pi/T;              % fundamental frequency
d0 = 3;                   % DC term

k = -50:50;               % harmonics
dk_fcn_string = '1j*(3/(pi*k))';  % given dk formula

% Time reversal: e0 = d0, ek = d_{-k} = -d_k for this sawtooth
e0 = d0;
ek_fcn_string = '-1j*(3/(pi*k))';

t = -10:0.01:10;         % time vector

% s(t)
s_t = fourier_series(dk_fcn_string, d0, w0, k, t);

% s2(t) = s(-t)
s2_t = fourier_series(ek_fcn_string, e0, w0, k, t);

% Plot both in subplots
figure;
subplot(2,1,1);
plot(t, s_t, 'b', 'LineWidth', 1.2);
grid on;
xlabel('t');
ylabel('s(t)');
title('Original Signal s(t)');

% Plot inverted s(t) = s2(t) %
subplot(2,1,2);
plot(t, s2_t, 'r--', 'LineWidth', 1.2);
grid on;
xlabel('t');
ylabel('s_2(t)');
title('Time-Reversed Signal s_2(t) = s(-t)');

% Part 7-2 %

% Parameters
T = 6;
w0 = pi/3;
f0 = 3/2;
k = -50:50;
t = -10:0.01:10;

q_t = fourier_series('(-6./((pi*k).^2))', f0, w0, k, t);

figure;
plot(t, q_t, 'b', 'LineWidth', 1.2);
grid on;
xlabel('t');
ylabel('q(t)');
title('Triangular Wave q(t) using Fourier Series');

% Part 7-4 %

% Parameters 
k = -50:50;                
t = -10:0.01:10;           
w0 = pi/3;                  
f0 = 3/2;                   

% q(t)
fk_string = '(-6./((pi*k).^2))';
q = fourier_series(fk_string, f0, w0, k, t);

% q2(t)
g0 = 0;
gk_string = '(-1j./(2*pi*k))';
q2 = fourier_series(gk_string, g0, w0, k, t);

% Plot results
figure;
subplot(2,1,1);
plot(t, q, 'b', 'LineWidth', 1.2);
title('q(t) – Triangular Wave');
xlabel('t'); ylabel('Amplitude');
grid on;

subplot(2,1,2);
plot(t, q2, 'r', 'LineWidth', 1.2);
title('q_2(t) = dq(t)/dt');
xlabel('t'); ylabel('Amplitude');
grid on;