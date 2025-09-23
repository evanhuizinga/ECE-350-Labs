% Main lab 4 Script %

% Part 2-1 %
load Matched_Filter_1   % loads variable 'ping' into workspace

Ts = 0.01;              % sampling period (sec)
fs = 1/Ts;              % sampling frequency (Hz)
N = length(ping);       % number of samples in ping
t = (0:N-1) * Ts;       % time vector starting at 0

% Part 2-2 %
figure;
plot(t, ping, 'b', 'LineWidth', 1.5); % Creates plot of ping vs t %
xlabel('Time (s)'); % Adds label to x axis %
ylabel('Amplitude'); % Adds label to y axis %
title('Transmitted Ping Signal'); % Creates title %
grid on;

% Part 2-3 %
listen =[zeros(1,800) ping zeros(1,200)]; 
N_listen = length(listen); % Will be 1026 long %

% Part 2-4 %
Ts = 0.01;                      % sampling interval
t_listen = (0:N_listen-1) * Ts; % time vector

figure;
plot(t_listen, listen, 'b', 'LineWidth', 1.5); % Creates plot of listen vs t_listen %
xlabel('Time (s)'); % Creates x axis %
ylabel('Amplitude'); % Creates y axis %
title('Listening Signal'); % Creates title %
grid on;
xlim([7.5,9]); % Narrows down graph to zoom in on nonzero points %

% Add interactive labels
%gtext('send ping');
%gtext('start receiving ping');
%gtext('ping reflected off object');
%gtext('end receiving ping');
%gtext('stop listening (at ~t=10.25)');

% Part 3-1 %

h = fliplr(ping);            % Creates impulse response by flipping ping %
N_h = length(h);              % Gets number of samples in h %
t_h = (0:N_h-1) * Ts;        % Creates time vector for h %

figure;
plot(t_h, h, 'r', 'LineWidth', 1.5); % Creates plot of h vs t_h %
xlabel('Time (s)');                  % Creates x axis %
ylabel('Amplitude');                 % Creates y axis %
title('Impulse Response (h)');      % Creates title %
grid on;                             % Turns on grid %

% Part 3-2 %
[conv_out, t_conv] = my_cont_conv(listen, t_listen, h); % Convolve listen with impulse response h %

% Plot the result
figure;
plot(t_conv, conv_out, 'm', 'LineWidth', 1.5); % Creates plot of convolution output %
xlabel('Time (s)');                             % Creates x axis %
ylabel('Amplitude');                            % Creates y axis %
title('Matched Filter Output (convolution)');   % Creates title %
grid on;                                        % Turns on grid %

% Part 3-3

% Plot listen signal
figure;
plot(t_listen, listen, 'b', 'LineWidth', 1.5); % Creates plot of listen vs t_listen %
xlabel('Time (s)');                             % Creates x axis %
ylabel('Amplitude');                            % Creates y axis %
title('Listening Signal vs Matched Filter Output'); % Creates title %
grid on;                                        % Turns on grid %
hold on;

% Plot convolution output on same figure
plot(t_conv, conv_out, 'r', 'LineWidth', 1.5); % Creates plot of conv_out vs t_conv %
legend('listen', 'matched filter output');     % Adds legend %
hold off;

% Part 3-4 %

[~, index_e] = max(conv_out);   % Finds index of the peak (end of signal) %

% Determine beginning of signal
index_b = index_e - length(h) + 1;  % Subtract length of impulse response minus 1 %

% Part 3-5 %
time_e = t_conv(index_e);  % Time corresponding to end of signal %
time_b = t_conv(index_b);  % Time corresponding to beginning of signal %

% Part 3-6 %

v_sound = 1500; % Speed of sound in water (m/s) %

% Time for the ping to travel to the object and back
time_total = time_e - time_b; % Total round-trip time (s) %

% One-way time is half of the round-trip
time_one_way = time_total / 2;

% Calculate distance to the object
distance_boat = v_sound * time_one_way; % Distance in meters %

% Create a new signal of the same size as conv_out with this distance value
distance = distance_boat * ones(size(conv_out)); % Signal indicating distance %

% Part 4-1 %

N = 1026;                   % Length of noise vector %
t_noise = (0:N-1) * Ts;     % Time vector for plotting %

% Standard deviations
sigma = [0.5, 1, 2];

% Create noise signals
noise1 = sigma(1) * randn(1, N); % Gaussian noise with mean 0 and std 0.5 %
noise2 = sigma(2) * randn(1, N); % Gaussian noise with std 1 %
noise3 = sigma(3) * randn(1, N); % Gaussian noise with std 2 %

% Plot in 2x3 subplots (top row)
subplot(2,3,1);
plot(t_noise, noise1, 'b', 'LineWidth', 1.5); % Creates plot of noise1 vs t_noise %
xlabel('Time (s)');                            % Creates x axis %
ylabel('Amplitude');                           % Creates y axis %
title('Noise \sigma=0.5');                     % Creates title %
axis([0 t_noise(end) -6 6]);
grid on;

subplot(2,3,2);
plot(t_noise, noise2, 'r', 'LineWidth', 1.5); % Creates plot of noise2 vs t_noise %
xlabel('Time (s)');                            % Creates x axis %
ylabel('Amplitude');                           % Creates y axis %
title('Noise \sigma=1');                       % Creates title %
axis([0 t_noise(end) -6 6]);
grid on;

subplot(2,3,3);
plot(t_noise, noise3, 'g', 'LineWidth', 1.5); % Creates plot of noise3 vs t_noise %
xlabel('Time (s)');                            % Creates x axis %
ylabel('Amplitude');                           % Creates y axis %
title('Noise \sigma=2');                       % Creates title %
axis([0 t_noise(end) -6 6]);
grid on;

% Part 4-2 %

subplot(2,3,4);
hist(noise1, 11);                            % Creates histogram of noise1 with 11 bins %
xlabel('Amplitude');                          % Creates x axis %
ylabel('Frequency');                          % Creates y axis %
title('Histogram \sigma=0.5');               % Creates title %
axis([-6 6 0 500]);                           % Same axis scale for comparison %
grid on;

subplot(2,3,5);
hist(noise2, 11);                            % Creates histogram of noise2 with 11 bins %
xlabel('Amplitude');                          % Creates x axis %
ylabel('Frequency');                          % Creates y axis %
title('Histogram \sigma=1');                 % Creates title %
axis([-6 6 0 500]);                           % Same axis scale for comparison %
grid on;

subplot(2,3,6);
hist(noise3, 11);                            % Creates histogram of noise3 with 11 bins %
xlabel('Amplitude');                          % Creates x axis %
ylabel('Frequency');                          % Creates y axis %
title('Histogram \sigma=2');                 % Creates title %
axis([-6 6 0 500]);                           % Same axis scale for comparison %
grid on;

% Part 4-3 %

listen1 = listen + sigma(1) * noise1;   % Listen with noise σ=0.5 %
listen2 = listen + sigma(2) * noise2;   % Listen with noise σ=1 %
listen3 = listen + sigma(3) * noise3;   % Listen with noise σ=2 %

figure;

subplot(3,1,1);
plot(t_listen, listen1, 'b', 'LineWidth', 1.5); % Creates plot of listen1 %
xlabel('Time (s)');                              % Creates x axis %
ylabel('Amplitude');                             % Creates y axis %
title('Listen with Noise \sigma=0.5');           % Creates title %
axis([0 t_listen(end) -2 2]);                    % Same axis scale %
grid on;

subplot(3,1,2);
plot(t_listen, listen2, 'r', 'LineWidth', 1.5); % Creates plot of listen2 %
xlabel('Time (s)');                              % Creates x axis %
ylabel('Amplitude');                             % Creates y axis %
title('Listen with Noise \sigma=1');             % Creates title %
axis([0 t_listen(end) -2 2]);                    % Same axis scale %
grid on;

subplot(3,1,3);
plot(t_listen, listen3, 'g', 'LineWidth', 1.5); % Creates plot of listen3 %
xlabel('Time (s)');                              % Creates x axis %
ylabel('Amplitude');                             % Creates y axis %
title('Listen with Noise \sigma=2');             % Creates title %
axis([0 t_listen(end) -2 2]);                    % Same axis scale %
grid on;

% Part 4-4 %

distance = zeros(3,10); % Preallocate 3x10 matrix for distances %

for I = 1:3
    % Set standard deviation based on I
    if I == 1
        std_dev = 0.5;
    elseif I == 2
        std_dev = 1;
    else
        std_dev = 2;
    end
    
    for J = 1:10
        % Generate new random noise
        noise = randn(1,length(listen));
        
        % Add noise to original listen signal
        listenX = listen + std_dev*noise;
        
        % Apply matched filter (convolution)
        intermediate = conv(listenX, h);
        
        % Find index of maximum (end of ping)
        index_e = find(max(intermediate) == intermediate);
        
        % Calculate one-way distance (subtract 26 samples for ping length, 0.01 s per sample)
        distance(I,J) = (index_e - 26) * 0.01 * 1500 / 2
    end
end