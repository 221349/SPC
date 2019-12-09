close all;
clear all;

aS=[3 1 0  0.5  0 -0.5];
bS=[2 0 -4 1.05 1 1.05];
titles=["Stabilny" "Na granicy stabilności" "Niestabilny" "Stabilny oscylacyjny" "Na granicy s. oscylacyjny" "Niestabilny oscylacyjny"];

for i=4:4;
  a=aS(i);
  b=bS(i);
sim('skok')
r = [(-a + sqrt(a*a -4*b)) / 2; (-a - sqrt(a*a -4*b)) / 2];

figure('rend','painters','pos',[10 10 1300 480])
%figure(i);
%subplot(1,2,1)
%hold on;
plot(t, y, 'b');
grid on;
grid minor;
%title(titles(i))
xlabel("t");
ylabel("odpowiedz s.");
% 
% subplot(1,2,2)
% %hold on;
% plot(real(r), imag(r), 'r*');
% grid on;
% title("Bieguny");
% xlabel("Re");
% ylabel("Im");
% xlim([-2.5 2.5]); 
% ylim([-2 2]);
% set(gca, 'XAxisLocation', 'origin');
% set(gca, 'YAxisLocation', 'origin')
end



%g=5;
%z="Niestabilny"
%for i=2:2:4;
%  a=a1(i);
%  b=b1(i);
%sim('skok')
%subplot(3,2,g)
%figure(g);
%grid on;grid minor;
%plot(t,log(wy))
%title(z)
%xlabel("t");
%ylabel("odpowiedz s.");
%g=6;
%z="Niestabilny oscylacyjny";
%end 