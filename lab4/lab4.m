close all;
clear all;
LineW = 0.5;

Theta_o = [1/2, 2];
N = 1000;
n = 1:1:N;
v_0 = 0;
RAND_N = 1/4;

u = sin(n*pi()/36);


v(1) = Theta_o(1)*v_0 + Theta_o(2)*u(1);
y(1) = v(1) + (rand()-0.5)*RAND_N;
for i = 2:N
    v(i) = Theta_o(1)*v(i-1) + Theta_o(2)*u(i);
    y(i) = v(i) + (rand()-0.5)*RAND_N;
end


Phi = [y(1:(N-1)).' , u(2:N).'];  % !!!! Czemu y <-> u ??

Theta = (Phi.' * Phi)^(-1) * Phi.' * y(2:N).'

% figure(2)
% hold on;
% %subplot(212)
% plot(n, u, 'k', 'LineWidth', LineW);
% plot(n, v, 'b', 'LineWidth', LineW);
% plot(n, y, 'g', 'LineWidth', LineW);
% grid on;
% xlabel("n");
% ylabel("");

%% 2:

Theta_o = [1/2, 1/4, 1, 1/3];

clear v;
clear y;

v(1) = Theta_o(1)*v_0 + Theta_o(2)*v_0 + Theta_o(3)*u(2) + Theta_o(4)*u(1);
v(2) = Theta_o(1)*v(1) + Theta_o(2)*v_0 + Theta_o(3)*u(3) + Theta_o(4)*u(2)
for i = 3:N
    v(i) = Theta_o(1)*v(i-1) + Theta_o(2)*v(i-2) + Theta_o(3)*u(i) + Theta_o(4)*u(i-1);
end
for i = 1:N
    y(i) = v(i) + (rand()-0.5)*RAND_N;
end

Phi = [u(3:N).' , u(2:(N-1)).' , y(2:(N-1)).' , y(1:(N-2)).'];  % !!!! Czemu y <-> u ??

Theta_2 = (Phi.' * Phi)^(-1) * Phi.' * y(3:N).'
