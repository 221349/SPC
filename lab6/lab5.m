close all;
clear all;
LineW = 0.5;

N = 1000;
n = 1:1:N;
RAND_N = 1/2; % Szum amplituda 

u1 = 1*1*sin(n*pi()/36);
u2 = 1*3*sin(n*pi()/30);
u3 = 1*1/2*sin(n*pi()/20);
u4 = 1*0.5*sin(n*pi()/60);
u5 = 1*2*sin(n*pi()/74);

u(1:N) = 0*n(1:N) + 1;
% 
U1 = timeseries(u1);
U2 = timeseries(u2);
U3 = timeseries(u3);
U4 = timeseries(u4);
U5 = timeseries(u5);

E1 = timeseries((rand(1, N)-0.5)*RAND_N);
E2 = timeseries((rand(1, N)-0.5)*RAND_N);
E3 = timeseries((rand(1, N)-0.5)*RAND_N);
E4 = timeseries((rand(1, N)-0.5)*RAND_N);
E5 = timeseries((rand(1, N)-0.5)*RAND_N);

H = [0,0,0,0,1; 1,0,0,0,0; 0,1,0,0,0; 0,0,1,0,0; 0,0,0,1,0];

A = [1, 1, 1, 1.3, 1/2];
B = [2, 3, 2, 2, 2];

Y = [5; 4; 3; 2; 1];

A_ =[A(1),0,0,0,0; 0,A(2),0,0,0; 0,0,A(3),0,0; 0,0,0,A(4),0; 0,0,0,0,A(5)];
B_ =[B(1),0,0,0,0; 0,B(2),0,0,0; 0,0,B(3),0,0; 0,0,0,B(4),0; 0,0,0,0,B(5)];

I = eye(5);
K = (I - A_*H)^(-1) * B_;
U = K^(-1) * Y

% **********************************
% Odkomentować dla wysterowania
% **********************************
% U1 = timeseries(0*n + U(1));
% U2 = timeseries(0*n + U(2));
% U3 = timeseries(0*n + U(3));
% U4 = timeseries(0*n + U(4));
% U5 = timeseries(0*n + U(5));
% **********************************

load_system("lab5_sim")
%set_param('lab5_sim','AlgebraicLoopSolver','LineSearch')
%set_param('lab5_sim','AlgebraicLoopSolver','TrustRegion')
sim("lab5_sim")


y1 = Y1.Data(1,:);
y2 = Y2.Data(1,:);
y3 = Y3.Data(1,:);
y4 = Y4.Data(1,:);
y5 = Y5.Data(1,:);
c1 = C1.Data.';
c2 = C2.Data.';
c3 = C3.Data.';
c4 = C4.Data.';
c5 = C5.Data.';

Phi_1 = [c1(1:N).' , u1(1:N).'];
Phi_2 = [c2(1:N).' , u2(1:N).'];
Phi_3 = [c3(1:N).' , u3(1:N).'];
Phi_4 = [c4(1:N).' , u4(1:N).'];
Phi_5 = [c5(1:N).' , u5(1:N).'];
Theta_1 = (Phi_1.' * Phi_1)^(-1) * Phi_1.' * y1(1:N).';
Theta_2 = (Phi_2.' * Phi_2)^(-1) * Phi_2.' * y2(1:N).';
Theta_3 = (Phi_3.' * Phi_3)^(-1) * Phi_3.' * y3(1:N).';
Theta_4 = (Phi_4.' * Phi_4)^(-1) * Phi_4.' * y4(1:N).';
Theta_5 = (Phi_5.' * Phi_5)^(-1) * Phi_5.' * y5(1:N).';

figure(1)
hold on;
%title("offline");
%plot(n, u, 'k', 'LineWidth', LineW);
plot(n, y1, 'r', 'LineWidth', LineW);
plot(n, y2, 'g', 'LineWidth', LineW);
plot(n, y3, 'b', 'LineWidth', LineW);
plot(n, y4, 'LineWidth', LineW);
plot(n, y5, 'LineWidth', LineW);
xlabel("n");
legend("y1(n)", "y2(n)", "y3(n)", "y4(n)", "y5(n)");
