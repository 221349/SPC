close all;
clear all;

k = 2;
tau = pi;%/4;
T = 1;
w = 1/2;

a = 1/2;
f = 8;

figure(1)
grid on;
hold on;

sim('phase_sin_s');
plot(t, U, 'k');
plot(t, Y, 'g');