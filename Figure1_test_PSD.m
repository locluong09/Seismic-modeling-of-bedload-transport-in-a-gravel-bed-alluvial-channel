clc
close all
clear all

% load seismic and flow data
x = importdata("data/seismic-data/data.txt");
flow = load("data/seismic-data/flow_depth.txt");



window =2^14; %length of segment
noverlap = 2^14/2;
nfft = 2^16;
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




% Generate a sample signal
fs = 1000;                 % Sampling frequency (Hz)
t = 0:1/fs:1-1/fs;         % Time vector (1 second duration)


% Calculate the Power Spectral Density (PSD)
window = hamming(2^14);     % Define a Hamming window of length 256 samples
noverlap = 2^14/2;            % Overlap of 128 samples between windows
nfft = 2^16;                % Number of FFT points
[psd, f] = pwelch(x, window, noverlap, nfft, fs); % Compute PSD

% Plot the PSD
figure;
plot(f, 10*log10(psd));    % Convert PSD to dB/Hz for better visualization
grid on;
xlabel('Frequency (Hz)');
ylabel('Power Spectral Density (dB/Hz)');
title('Power Spectral Density (PSD)');
xlim([0 200])




