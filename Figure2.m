close all
clc
clear all

data = load("data/2021_0705_flood/PSD_07_05.txt"); % computed PSD from seimic noise
depth = load("data/2021_0705_flood/flowdepth.txt"); % flow depth during 2021_07_05 flood



idx = 49:(49+316); % correct time for both PSD and depth
PSD_load = data(idx);
PSD_seismic = PSD_load;
H = depth/100; % flow depth in m

field_obs = load("data/2021_0705_flood/field_data.txt"); % load fluvial data
flow_depth = field_obs(:,1);
bedload = field_obs(:,2);

grain = load("data/2021_0705_flood/07_05.txt");
percentiles = [10,16,50,84,90,95];

% Grain size distribution using log-raised consine distributionn
D = linspace(0.0001,0.07,100)';
sigma_g = 0.85;
mu = 0.009;
s = sigma_g/sqrt(1/3-2/pi^2);
pD = raised_cosine_distribution(log(D),log(mu),s)./D;




% This is for the final PSD over the grain size distribution
res = zeros(length(D),1);
estimate = [];
freqs = linspace(30,80,10);
ave_freqs = [];
for j = 1:length(H)
    for k = 1:length(freqs)
        for i = 1:length(D)
            PSD = model_saltation(freqs(k),D(i),H(j), 1, 10, 0.7, 17, ...
                0.045, 0.005, 250, 0.089, 20, 0);
            res(i,1) = PSD;
        end
        PSD_estimated(k) = trapz(D,res.*pD);
    end
    ave_freqs = [ave_freqs,median(PSD_estimated)];
end

% Inverted bedload from PSD
observe = 10.^(PSD_seismic/10);
qbd = observe./ave_freqs';


fig = figure('Units','normalized','Position',[0 0 1 0.75],'Color', [1 1 1]);
fig.Units = 'Pixels';
ax = multiplot(1,2, 'gapsize',250, 'marginsize', 80, 'labelsize', 35, 'fontsize', 30);

% fig = figure;



hold(ax(1,1), 'on')

colororder({'k','k'})

yyaxis(ax(1,1), 'left') 
plot(ax(1,1),D,pD,'b-.', 'LineWidth',4)
ylabel(ax(1,1),"pdf(D) [m^{-1}]", 'FontSize', 35)
xlabel(ax(1,1), "Grain size D(m)", 'FontSize', 35)
text(ax(1,1), 0.0025, 84," a)", "FontSize",40)

yyaxis(ax(1,1), 'right') 
cdf = cumsum(pD);
plot(ax(1,1),D,cdf*(0.07-0.0001),'r-.', 'LineWidth',4)
plot(ax(1,1), grain/1000,percentiles,'ko', 'LineWidth',2.5)
ylabel(ax(1,1),"cdf(D) [%]", 'FontSize', 35)
legend(ax(1,1),"pdf", 'cdf', 'observations', 'Location','best');



times = linspace(1,317,317);
t1 = 5:28; % ignore the very beginning time where H < 4cm

hold(ax(1,2), 'on')

yyaxis(ax(1,2), 'left') 

plot(ax(1,2), t1, bedload, 'k:o', 'LineWidth', 2.5)
plot(ax(1,2), times(5:240), qbd(5:240)*2700, 'r:o', 'LineWidth',3)
ylabel(ax(1,2),"Bedload flux (kg m^{-1}s^{-1})", 'FontSize',35)
xlabel(ax(1,2),"Time since flood started (min)",'FontSize',35)

text(ax(1,2), 5.5, 42," b)", "FontSize",40)
set(ax(1,2), 'XScale', 'log')

yyaxis(ax(1,2), 'right') 
plot(ax(1,2), times(5:240), H(5:240), 'b--', 'LineWidth',3)
set(ax(1,2), 'XScale', 'log')
ylabel(ax(1,2),"Water depth (m)", 'FontSize', 35)

legend(ax(1,2),"Observed bedload", "Inverted bedload","Water depth", "Location", ...
    "best");