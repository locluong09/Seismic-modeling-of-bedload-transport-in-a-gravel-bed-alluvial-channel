clc
close all
clear all

H = [0.01, 0.08, 0.1, 0.2, 0.4, 0.5, 0.7, 1];
theta = 1.4;
D = 0.007;
ks = 0.07;
[vel1, vel2, vel3] = velocity(H, theta, D, ks, 2650, 1000);

fig1 = figure();
set(fig1, 'Position', [0 0 1000 700])
plot(H, vel1, '--', 'LineWidth', 6)
hold on
plot(H, vel2, '--', 'LineWidth', 6)
plot(H, vel3, '--', 'LineWidth', 6)
plot(0.4, 2.5, 'o', 'LineWidth', 5)
lgd = legend("Julien & Bounvilay (2013)", "Sklar & Dietrich (2004)", ...
    'Gimbert et al. (2019)', 'ECM measurement', "Location", 'northwest');
lgd.FontSize = 30;
xlabel("Water depth (m)", "FontSize", 30)
ylabel("Bedload velocity (m/s)", "FontSize", 30)
set(gca, 'FontSize', 30)
ylim([0 6])

