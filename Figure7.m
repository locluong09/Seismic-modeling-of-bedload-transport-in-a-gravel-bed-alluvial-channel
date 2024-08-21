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
PSD = zeros(length(D),1);
estimate = [];
freqs = linspace(30,80,10);
ave_freqs = [];



pd = makedist('Lognormal', 'mu', log(0.08), 'sigma', 1);
pd1 = makedist('Normal', 'mu', 0.08, 'sigma', 0.2);

lower = 0.01; %0.03
upper = 0.5; %0.4

t_dist = truncate(pd,lower,upper);

xx = linspace(lower,upper,100);
xx1 = linspace(-1,1,500);



tD = pdf(t_dist,xx)';
PSD_tD = zeros(length(tD),1);

for j = 1:length(H)
    for k = 1:length(freqs)
        for i = 1:length(D)
            for t = 1:length(tD)
                PSD_tD(t) = model_multimode(freqs(k),D(i),H(j), 1, 10, 0.7, 17, ...
                    xx(t), 250, 0.089, 20, 0);
            end
            PSD(i) = trapz(xx, PSD_tD.*tD);
        end
        PSD_estimated(k) = trapz(D,PSD.*pD);
    end
    ave_freqs = [ave_freqs,mean(PSD_estimated)];
end


% Inverted bedload from PSD
observe = 10.^(PSD_seismic/10);
qbd = observe./ave_freqs';



fig = figure('Units','normalized','Position',[0 0 1 0.75],'Color', [1 1 1]);
fig.Units = 'Pixels';
ax = multiplot(1,2, 'gapsize',150, 'marginsize', 80, 'labelsize', 35, 'fontsize', 30);

hold(ax(1,1), 'on')

% plot(ax(1,1), xx,pdf(pd1,xx),'b--', 'LineWidth',5)
plot(ax(1,1), xx,pdf(t_dist,xx),'r--', 'LineWidth',5)
ylabel(ax(1,1),"pdf(t_{D}) [s^{-1}]", 'FontSize', 35)
xlabel(ax(1,1),"Hop times (s)", 'FontSize', 35)

legend(ax(1,1),'Truncated lognormal distribution',"Location","best");
set(ax(1,1), 'XScale', 'log')
xticks(ax(1,1), [0.01 0.03 0.05 0.1 0.2 0.3 0.5])
yticks(ax(1,1), [0.5 1 2 5 9])

text(ax(1,1),0.012, 9.5," a)", "FontSize",40)


times = linspace(1,317,317);
t1 = 5:28;

hold(ax(1,2), 'on')

colororder({'k','k'})
yyaxis(ax(1,2), 'left') 
plot(ax(1,2), t1, bedload, 'ko:', 'LineWidth', 2.5)
plot(ax(1,2), times(5:240), qbd(5:240)*2700, 'ro:', 'LineWidth',3)
ylabel(ax(1,2),"Bedload flux (kg m^{-1}s^{-1})", 'FontSize',35)
xlabel(ax(1,2),"Time since flood started (min)",'FontSize',35)

text(ax(1,2), 5.5, 12.6," b)", "FontSize",40)
set(ax(1,2), 'XScale', 'log')

yyaxis(ax(1,2), 'right') 
plot(ax(1,2), times(5:240), H(5:240), 'b--', 'LineWidth',3)
set(ax(1,2), 'XScale', 'log')
ylabel(ax(1,2),"Water depth (m)", 'FontSize', 35)

legend(ax(1,2),"Observed bedload", "Inverted bedload", "Water depth", "Location", "best");
