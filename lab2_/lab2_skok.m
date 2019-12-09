close all;
clear all;

kp=[1 7 15];
ki=[0 1 15];
M = [[0 0 1 1]; [1 3 3 1]];

col = 'rgbcmk';
leg='';
%titles=["Stabilny" "Na granicy stabilności" "Niestabilny" "Stabilny oscylacyjny" "Na granicy s. oscylacyjny" "Niestabilny oscylacyjny"];
for i=1:2
    figure(i);
    for g=1:3;
        subplot(2,3,g);
        grid on;
        hold on;
        for s=1:3;
            sim('skok')
            plot(t, y, col(s));
            xlabel("t");
            ylabel("y(t)");
            leg=[leg; sprintf('kp=%3d', kp(s))];
        end
        title(sprintf('ki=%3d', ki(g)));
        legend(leg, 'Location', 'southwest');
        
        subplot(2,3,3+g);
        grid on;
        hold on;
        for s=1:3;
            sim('skok')
            plot(t, E_int, col(3+s));
            xlabel("t");
            ylabel("E(t)");
            leg=[leg; sprintf('kp=%3d', kp(s))];
        end
        title(sprintf('ki=%3d', ki(g)));
        legend(leg, 'Location', 'north');
    end
end
