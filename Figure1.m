clc
close all
clear all

% load seismic and flow data
x = importdata("data/seismic-data/data.txt");
flow = load("data/seismic-data/flow_depth.txt");



window =2^14; %length of segment
noverlap = 2^14/2;
nfft = 2^12;
fs = 1000;

time = 1:length(flow);



fig1 = figure(1);
set(fig1, 'Position', [0 0 1200 900])

ax1 = subplot(2,1,1);
spectrogram(x,window,noverlap,nfft,fs, 'yaxis')
set(gca,'FontSize',35)
yticks([0 30 80 120 200 300 400 500])
ylim([0 200])
colorbar off

ax1.TickDir = 'out';
ax1.TickLength = [0.01 0.01];

h = colorbar(ax1, "northoutside");
title(h, 'Power [dB rel. (m/s)^2/Hz]', 'FontSize',24)
clim([-160 -110])
colormap jet;

xlabel('')
text(0.5, 280," a)", "FontSize",50)

ax2 = subplot(2,1,2);
plot(time/60, flow, 'b-', 'LineWidth', 5)
ylabel("Water depth (cm)", "FontSize",35)
xlabel("Time since flood started (hour)", "FontSize",35)
set(gca,'FontSize',35)








Max = 250;
f = linspace(0.001,Max,1000); % define frequency [Hz] vector

W = 10; % river width
H = 0.5; % flow depth
theta = 0.7; % slope
r0 = 17; % source-receiver distance
D50 = 0.009; % mean grain size
Dstd = 0.85; % standard deviation
s = Dstd/(sqrt(1/3 - 2/pi()^2)); % from Tsai for log raised cosin dis.

lim_min = exp(-s+log(D50));
lim_max = exp(s+log(D50));
D = linspace(lim_min,lim_max,100);
D = D';

PSD_tur = model_turbulence(f, D, W, H, theta, r0, D50, Dstd, 250, 0.089, 20, 0);
PSD_turbulence = 10*log10(PSD_tur);

PSD_bed = model_saltation(f, D50, H, 0.005, 10, 0.7, 17, 0.045, 0.009, 250, 0.089, 20, 0); 
PSD_bedload = 10*log10(PSD_bed);


fig2 = figure(2);
set(fig2, 'Position', [0 0 1200 900])
plot(f,PSD_turbulence,'b-', 'LineWidth', 6)
hold on
plot(f,PSD_bedload,'r-', 'LineWidth', 6)
xlim([0 Max])
ylim([-180 -130])
xlabel("Frequency (Hz)",'FontSize', 35)
ylabel("Power spectral density (dB rel.(m/s)^2/Hz)", 'FontSize', 35)
lgd = legend("Turbulence", "Bedload");
lgd.FontSize = 35;
H=gca;
H.LineWidth=1;
set(gca, 'Box', 'on')
set(gca, 'FontSize', 35)
text(10, -127.5," b)", "FontSize",50)





