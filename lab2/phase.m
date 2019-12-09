close all;
clear all;

k = 2;
tau = pi/4;
T = 1;
w_s = [3/4 7 1/4];
col = 'rbg';

for n = 1:2
    w = w_s(n);
    p(n) = (-(T*w*k*sin(w*tau) -k*cos(w*tau))/(T*T*w*w +1) + i*(-(T*w*k*cos(w*tau) +k*sin(w*tau)) / (T*T*w*w +1)));
    A(n) = norm(p(n));
    phi(n) = -atan2d(imag(p(n)), real(p(n)));
    phi_r(n) = degtorad(phi(n));
end


figure(1)
grid on;
hold on;

sim('phase_s');
plot(realX, imagY, 'k');
xlabel("Re");
ylabel("Im");
xlim([-2 2]); 
ylim([-2 2]);
leg='';
for n = 1:2
    p_line = [0*i p(n)];
    plot(real(p_line), imag(p_line), col(n));
    plot(real(p(n)), imag(p(n)), '*', 'Color', col(n));
    leg = [leg; sprintf('%s_%d=%.2f Hz, A=%.2f, φ = %s/%.2f', '\omega', n, w_s(n), A(n), '\pi', pi()/phi_r(n))];
end
text(0, 0, leg, 'EdgeColor', 'k')
title(sprintf('k = %.2f, %s = %s/%.2f, T = %.2f', k, '\tau', '\pi', pi()/tau, T));

figure(2)
for n = 1:2
    subplot(1,2,n);
    grid on;
    hold on;
    sim('phase_sin_s');
    plot(t, U, 'k');
    plot(t, (A(n)+t*0), '--', 'Color', col(n));
    plot(t, Y, 'Color', col(n));
    plot([0 phi_r(n)], [0 0], '-', 'LineWidth', 3, 'Color', col(n));
    txt_phi = sprintf('φ = %s/%.2f', '\pi', pi()/phi_r(n));
    legend(sprintf('U(t)=sin(%st)', '\omega'), sprintf('A=%.2f', A(n)), 'Y(t)', txt_phi, 'Location', 'southeast');
    title(sprintf('k = %.2f, %s = %s/%.2f, T = %.2f, %s_%d = %.2f', k, '\tau', '\pi', pi()/tau, T, '\omega', n, w_s(n)));
end