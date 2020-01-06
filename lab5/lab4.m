close all;
clear all;
LineW = 0.5;

Theta_o = [1/2, 2];
N = 10000;
n = 1:1:N;
v_0 = 0;
RAND_N = 1/4;

u = 2*sin(n*pi()/36);


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
clear Theta;

Theta_o = [0.4, 0.3, 1, 1];
RAND_N = 1/32;

clear v;
clear y;

y(1) = Theta_o(1)*v_0 + Theta_o(2)*v_0 + Theta_o(3)*u(2) + Theta_o(4)*u(1) + (rand()-0.5)*RAND_N;;
y(2) = Theta_o(1)*y(1) + Theta_o(2)*v_0 + Theta_o(3)*u(3) + Theta_o(4)*u(2) + (rand()-0.5)*RAND_N;;

for i = 3:(1000)
    y(i) = Theta_o(1)*y(i-1) + Theta_o(2)*y(i-2) + Theta_o(3)*u(i) + Theta_o(4)*u(i-1) + (rand()-0.5)*RAND_N;

    Phi = [y(2:(i-1)).' , y(1:(i-2)).' ,  u(3:i).' , u(2:(i-1)).'];

    Theta(:,i) = (Phi.' * Phi)^(-1) * Phi.' * y(3:i).';
end

Theta_o = [0.4, 0.4, 1, 1];
for i = (1000):N
    y(i) = Theta_o(1)*y(i-1) + Theta_o(2)*y(i-2) + Theta_o(3)*u(i) + Theta_o(4)*u(i-1) + (rand()-0.5)*RAND_N;

    Phi = [y(2:(i-1)).' , y(1:(i-2)).' ,  u(3:i).' , u(2:(i-1)).'];

    Theta(:,i) = (Phi.' * Phi)^(-1) * Phi.' * y(3:i).';
end

%Phi = [y(2:(N-1)).' , y(1:(N-2)).' ,  u(3:N).' , u(2:(N-1)).'];

%Theta_2 = (Phi.' * Phi)^(-1) * Phi.' * y(3:N).'

% 
figure(1)
hold on;
plot([1, N], [Theta_o(1), Theta_o(1)], 'k--', 'LineWidth', LineW*2);
plot(n, Theta(1,:), 'k', 'LineWidth', LineW);
plot([1, N], [Theta_o(2), Theta_o(2)], 'r--', 'LineWidth', LineW*2);
plot(n, Theta(2,:), 'r', 'LineWidth', LineW);
plot([1, N], [Theta_o(3), Theta_o(3)], 'g--', 'LineWidth', LineW*2);
plot(n, Theta(3,:), 'g', 'LineWidth', LineW);
plot([1, N], [Theta_o(4), Theta_o(4)], 'b--', 'LineWidth', LineW*2);
plot(n, Theta(4,:), 'b', 'LineWidth', LineW);

%% 3
clear Theta;

theta_0 = [0.4, 0.3, 1, 1];%[0;0;0;0];
p_0 = [[100,0,0,0]; [0,100,0,0]; [0,0,100,0]; [0,0,0,100]];
p(:,:,1) = p_0;
p(:,:,2) = p_0;
%p(:,:,2) = p_0 - 
Theta(:,1) = theta_0;
Theta(:,2) = theta_0;

for i = 3:N
    phi(:,i) = [y(i-1); y(i-2); u(i); u(i-1)];
    p(:,:,i) = p(:,:,i-1) - (p(:,:,i-1) * phi(:,i) *  phi(:,i).' * p(:,:,i-1)) / (1 + phi(:,i).' * p(:,:,i-1) *  phi(:,i));
    Theta(:,i) = Theta(:,i-1) + p(:,:,i) * phi(:,i) * (y(i) - phi(:,i).' * Theta(:,i-1));
end

figure(2)
hold on;
plot([1, N], [Theta_o(1), Theta_o(1)], 'k--', 'LineWidth', LineW*2);
plot(n, Theta(1,:), 'k', 'LineWidth', LineW);
plot([1, N], [Theta_o(2), Theta_o(2)], 'r--', 'LineWidth', LineW*2);
plot(n, Theta(2,:), 'r', 'LineWidth', LineW);
plot([1, N], [Theta_o(3), Theta_o(3)], 'g--', 'LineWidth', LineW*2);
plot(n, Theta(3,:), 'g', 'LineWidth', LineW);
plot([1, N], [Theta_o(4), Theta_o(4)], 'b--', 'LineWidth', LineW*2);
plot(n, Theta(4,:), 'b', 'LineWidth', LineW);

Theta(:,N)




% 
% %% 2:
% 
% Theta_o = [0.4, , 1, 1/3];
% 
% clear v;
% clear y;
% 
% v(1) = Theta_o(1)*v_0 + Theta_o(2)*v_0 + Theta_o(3)*u(2) + Theta_o(4)*u(1);
% v(2) = Theta_o(1)*v(1) + Theta_o(2)*v_0 + Theta_o(3)*u(3) + Theta_o(4)*u(2);
% for i = 3:N
%     v(i) = Theta_o(1)*v(i-1) + Theta_o(2)*v(i-2) + Theta_o(3)*u(i) + Theta_o(4)*u(i-1);
% end
% for i = 1:N
%     y(i) = v(i) + (rand()-0.5)*RAND_N;
% end
% 
% Phi = [y(2:(N-2)).' , y(1:(N-3)).' ,  u(4:N).' , u(3:(N-1)).'];  % !!!! Czemu y <-> u ??
% 
% Theta_2 = (Phi.' * Phi)^(-1) * Phi.' * y(4:N).'
