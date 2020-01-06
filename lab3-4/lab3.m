close all;
clear all;

t0 = 0;
t_max = 100;
y0 = 1;

Lo = [1]; 
Mo = [1, 3, 3, 1];
k = 5;

LineW = 1

%% 1:
k2 = 0;
t_max = 30;


c = ["k", "b"];
ks = [5, 8.5];

figure(1)
grid on;
hold on;

for i=1:2
    k = ks(i);

    sim('lab3_s');
    
    plot(t, Y, c(i) + "--", 'LineWidth', LineW);
    plot(t, E.^2, c(i), 'LineWidth', LineW);
end

xlabel("t");
ylabel("Y");
legend("y(t), k = 5", "\epsilon(t), k = 5", "y(t), k = 8.5", "\epsilon(t), k = 8.5");

%% 2.1:
k = 5;
k2_min = 0;
k2_max = 1.5;
steps = 100;
t_max = 100;

K2 = k2_min:(k2_max/steps):k2_max;

for n = 1:(steps+1)
    k2 = K2(n);
    sim('lab3_q');
    Qk(n) = q;
end
figure(2)
%subplot(212)
plot(K2, Qk, 'k', 'LineWidth', LineW);
grid on;
xlabel("k_2");
ylabel("Q( k_2)");


%% 2.2:
k2 = 0.33; % -> E_min
t_max = 50;

c = ["k", "b"];
k2s = [1, 0.33];

figure(3)
grid on;
hold on;

for i=1:2
    k2 = k2s(i);

    sim('lab3_s');
    plot(t, Y, c(i) + "--", 'LineWidth', LineW);
    plot(t, E.^2, c(i) + ":", 'LineWidth', LineW);
    plot(t, Q, c(i), 'LineWidth', LineW);
end

xlabel("t");
ylabel("Y");
legend("y(t), k_2 = 1", "\epsilon(t), k_2 = 1", "Q(t), k_2 = 1", "y(t), k_2 = 0.33", "\epsilon(t), k_2 = 0.33", "Q(t), k_2 = 0.33");


%% 3.1:
k2 = 0.33; % -> E_min
t_max = 50;

d = 0.1;
T = d;
Lrz = [k, (k2*T-k)];
Mrz = [1, -1];


sim('lab3_z');

% figure(2)
% subplot(212)
% grid on;
% hold on;

plot(t, Y, 'b--', 'LineWidth', LineW);
plot(t, E.^2, 'b:', 'LineWidth', LineW);
plot(t, Q, 'b', 'LineWidth', LineW);
xlabel("t");
ylabel("Y");
%title("T_d = %d", T);
legend("y(t)", "\epsilon(t)", "Q(t)", "y_d(t)", "\epsilon_d(t)", "Q_d(t)");

%% 3.1:
k2 = 0.33; % -> E_min
t_max = 50;

c = ["b", "g", "r"];
ds = [0.01, 0.1, 0.2];


figure(4)
grid on;
hold on;

for i=1:3
    d = ds(i);
    T = d;
    Lrz = [k, (k2*T-k)];
    Mrz = [1, -1];

    sim('lab3_z');
    h1 = plot(t, Y, c(i) + "--", 'LineWidth', LineW);
    h2 = plot(t, E.^2, c(i) + ":", 'LineWidth', LineW);
    plot(t, Q, c(i), 'LineWidth', LineW);
end
xlabel("t");
ylabel("Y");
legend("y_d(t), T_d=0.01", "\epsilon_d(t), T_d=0.01", "Q_d(t), T_d=0.01", "y_d(t), T_d=0.1", "\epsilon_d(t), T_d=0.1", "Q_d(t), T_d=0.1", "y_d(t), T_d=0.2", "\epsilon_d(t), T_d=0.2", "Q_d(t), T_d=0.2");
%title(sprintf("T_d_1 = %d [blue], T_d_2 = %d [green], T_d_3 = %d [red]", ds(1), ds(2), ds(3)));

%% 3.3:
k = 5;
k2 = 0.33; 
Q_k2 = 1.76;

Q = 0;
T_min = 0.001;
T_max = 0.4;
steps = 50;
t_max = 100;

Ts = T_min:(T_max/steps):T_max;

for n = 1:(steps)
    T = Ts(n);
    Lrz = [k, (k2*T-k)];
    Mrz = [1, -1];
    sim('lab3_zq');
    Q(n) = q;
end

figure(5)
grid on;
hold on;

plot(Ts, Q, 'k', 'LineWidth', LineW);
plot([0 T_max], [Q_k2 Q_k2], 'r--', 'LineWidth', LineW);
legend("Q_d(T_d) - dyskretny", "Q() - ciagły");
xlabel("T_d");
ylabel("Q(T_d)");