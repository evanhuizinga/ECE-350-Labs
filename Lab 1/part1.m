% Variable Assignment  Question 1 Part 1 %
matrix1 = [1 11 5 9
    8 19 4 6
    4 17 13 5];

matrix2 = matrix1.'; % Transposed Matrix %

%  Question 2 %
matrix3 = 5:5:250;

% Question 3 %
t = -5:0.01:10;
t(6);
size(t);
length(t);

% % Question 4 %
% y = cos(t);
% plot(t,y);
% title('Evan Huizinga: Plot of cos(t)');
% xlabel('Time');
% ylabel('cos(t)');
% 
% % Question 5 %
% y2 = 2*sin(t);
% plot(t,y2);
% title('Evan Huizinga: Plot of 2*sin(t)');
% xlabel('Time');
% ylabel('2*sin(t)');
% 
% % Question 6 %
% y3 = cos(4*t);
% plot(t,y3);
% title('Evan Huizinga: Plot of cos(4t)');
% xlabel('Time');
% ylabel('cos(4t)');
% 
% % Question 7 %
% y4 = cos((2*t) + (pi / 4));
% plot(t,y4);
% title('Evan Huizinga: Plot of cos(2*t + pi/4)');
% xlabel('Time');
% ylabel('cos(2*t + pi/4');

% Question 8 %

y1 = cos(t);
figure;
plot(t,y1);
title('Evan Huizinga: Plot of cos(t)');
xlabel('Time');
ylabel('cos(t)');

y2 = 2*sin(t);
figure;
plot(t,y2);
title('Evan Huizinga: Plot of 2*sin(t)');
xlabel('Time');
ylabel('2*sin(t)');

y3 = cos(4*t);
figure;
plot(t,y3);
title('Evan Huizinga: Plot of cos(4t)');
xlabel('Time');
ylabel('cos(4t)');

y4 = cos((2*t) + (pi / 4));
figure;
plot(t,y4);
title('Evan Huizinga: Plot of cos(2*t + pi/4)');
xlabel('Time');
ylabel('cos(2*t + pi/4');

% Question 9 %
mu = 5;
y9 = my_unit_step(t,mu);
figure;
plot(t,y9);
title('Evan Huizinga: Plot of t vs step function y9');
xlabel('Time');
ylabel('y9');

% Question 10 %

% Function x(t) returns the value 0 for all points except when 0<=t<4 
xt = 2 * (my_unit_step(t,0) - my_unit_step(t,4));
% Function x(t) returns the value of 4 for the range -1<=t<4, the value
% -1 for the range 2<=t<6, and the value 0 for 6<=t
yt = 4 * (my_unit_step(t, -1) - my_unit_step(t, 2)) - 1 * (my_unit_step(t, 2) - my_unit_step(t, 6));

plot(t, xt);
hold;
plot(t, yt); 
hold;

title('Plot of step functions x(t) and y(t)');
xlabel('Time');
ylabel('x(t) and y(t)');
legend('x(t)', 'y(t)');
