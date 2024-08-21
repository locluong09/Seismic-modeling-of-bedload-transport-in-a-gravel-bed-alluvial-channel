close all
clc
clear all


%% First flood
filename = 'data/additional_floods/2018_0727_data.xlsx';
dat = readtable(filename);

bedload = dat{63:79, 12}; % 90 before
H = dat{63:393, 9};
PSD_seismic = dat{63:393, 36};
H = H/100;




grain = load("data/2021_0705_flood/07_05.txt");
percentiles = [10,16,50,84,90,95];

% Grain size distribution using log-raised consine distributionn
D = linspace(0.0001,0.07,100)';
sigma_g = 0.55;%1.25
mu = 0.009;
s = sigma_g/sqrt(1/3-2/pi^2);
pD = raised_cosine_distribution(log(D),log(mu),s)./D;





% This is for the final PSD over the grain size distribution



pd = makedist('Lognormal', 'mu', log(0.1), 'sigma', 1);
lower = 0.01;
upper = 0.5;

t = truncate(pd,lower,upper);
xx = linspace(lower,upper,100);
tD = pdf(t,xx)';

freqs = linspace(30,80,20);

PSD = zeros(length(D),1);

PSD_tD = zeros(length(tD),1);
PSD_Tsai = zeros(length(D),1);

ave_freqs = zeros(length(H), 1);
ave_freqs_Tsai = zeros(length(H), 1);

for j = 1:length(H)
    for k = 1:length(freqs)
        for i = 1:length(D)
            for t = 1:length(tD)
                PSD_tD(t) = model_multimode(freqs(k),D(i),H(j), 1, 10, 0.7, 17, ...
                    xx(t), 250, 0.089, 20, 0);
            end
            PSD(i) = trapz(xx, PSD_tD.*tD);
            PSD_Tsai(i) = model_saltation(freqs(k),D(i),H(j), 1, 10, 0.7, 17, ...
                0.045, 0.005, 250, 0.089, 20, 0);
        end
        PSD_estimated(k) = trapz(D,PSD.*pD);
        PSD_estimated_Tsai(k) = trapz(D,PSD_Tsai.*pD);
    end
    ave_freqs(j) = mean(PSD_estimated);
    ave_freqs_Tsai(j) = mean(PSD_estimated_Tsai);

end


% Inverted bedload from PSD
observe = 10.^(PSD_seismic/10);
qbd = observe./ave_freqs;
qbd_Tsai = observe./ave_freqs_Tsai;


%% Second flood
data = load("data/2021_0705_flood/PSD_07_05.txt"); % computed PSD from seimic noise
depth = load("data/2021_0705_flood/flowdepth.txt"); % flow depth during 2021_07_05 flood

idx = 49:(49+316); % correct time for both PSD and depth

PSD_load = data(idx);
PSD_seismic1 = PSD_load;
H1 = depth/100; % flow depth in m

field_obs = load("data/2021_0705_flood/field_data.txt"); % load fluvial data
flow_depth = field_obs(:,1);
bedload1 = field_obs(:,2);


% Grain size distribution using log-raised consine distributionn
D = linspace(0.0001,0.07,100)';
sigma_g = 0.85;
mu = 0.009;
s = sigma_g/sqrt(1/3-2/pi^2);
pD = raised_cosine_distribution(log(D),log(mu),s)./D;

% This is for the final PSD over the grain size distribution
PSD1 = zeros(length(D),1);

PSD_tD1 = zeros(length(tD),1);
PSD_Tsai1 = zeros(length(D),1);

ave_freqs1 = zeros(length(H1), 1);
ave_freqs_Tsai1 = zeros(length(H1), 1);

for j = 1:length(H1)
    for k = 1:length(freqs)
        for i = 1:length(D)
            for t = 1:length(tD)
                PSD_tD1(t) = model_multimode(freqs(k),D(i),H1(j), 1, 10, 0.7, 17, ...
                    xx(t), 250, 0.089, 20, 0);
            end
            PSD1(i) = trapz(xx, PSD_tD1.*tD);
            PSD_Tsai1(i) = model_saltation(freqs(k),D(i),H1(j), 1, 10, 0.7, 17, ...
                0.045, 0.005, 250, 0.089, 20, 0);
        end
        PSD_estimated1(k) = trapz(D,PSD1.*pD);
        PSD_estimated_Tsai1(k) = trapz(D,PSD_Tsai1.*pD);
    end
    ave_freqs1(j) = mean(PSD_estimated1);
    ave_freqs_Tsai1(j) = mean(PSD_estimated_Tsai1);
end


% Inverted bedload from PSD
observe1 = 10.^(PSD_seismic1/10);
qbd1 = observe1./ave_freqs1;
qbd_Tsai1 = observe1./ave_freqs_Tsai1;


%% Third flood
filename = 'data/additional_floods/2021_0823_data.xlsx';
dat = readtable(filename);

bedload2 = dat{87:122, 12};
H2 = dat{82:203, 9};
PSD_seismic2 = dat{80:201, 44};
H2 = H2/100;



% Grain size distribution using log-raised consine distributionn
D = linspace(0.0001,0.07,100)';
sigma_g = 0.75;
mu = 0.009;
s = sigma_g/sqrt(1/3-2/pi^2);
pD = raised_cosine_distribution(log(D),log(mu),s)./D;




% This is for the final PSD over the grain size distribution
PSD2 = zeros(length(D),1);


PSD_tD2 = zeros(length(tD),1);
PSD_Tsai2 = zeros(length(D),1);

ave_freqs2 = zeros(length(H2), 1);
ave_freqs_Tsai2 = zeros(length(H2), 1);


for j = 1:length(H2)
    for k = 1:length(freqs)
        for i = 1:length(D)
            for t = 1:length(tD)
                PSD_tD2(t) = model_multimode(freqs(k),D(i),H2(j), 1, 10, 0.7, 17, ...
                    xx(t), 250, 0.089, 20, 0);
            end
            PSD2(i) = trapz(xx, PSD_tD2.*tD);
            PSD_Tsai2(i) = model_saltation(freqs(k),D(i),H2(j), 1, 10, 0.7, 17, ...
                0.045, 0.005, 250, 0.089, 20, 0);
        end
        PSD_estimated2(k) = trapz(D,PSD2.*pD);
        PSD_estimated_Tsai2(k) = trapz(D,PSD_Tsai2.*pD);
    end
    ave_freqs2(j) = mean(PSD_estimated2);
    ave_freqs_Tsai2(j) = mean(PSD_estimated_Tsai2);

end


% Inverted bedload from PSD
observe2 = 10.^(PSD_seismic2/10);
qbd2 = observe2./ave_freqs2;
qbd_Tsai2 = observe2./ave_freqs_Tsai2;

%% Fourth 
filename = 'data/additional_floods/2022_0709_data.xlsx';
dat = readtable(filename);

bedload3 = dat{62:114, 12};
H3 = dat{62:266, 9};
PSD_seismic3 = dat{62:266, 37};
H3 = H3/100;


% Grain size distribution using log-raised consine distributionn
D = linspace(0.0001,0.07,100)';
sigma_g = 0.65;
mu = 0.005;
s = sigma_g/sqrt(1/3-2/pi^2);
pD = raised_cosine_distribution(log(D),log(mu),s)./D;





% This is for the final PSD over the grain size distribution
PSD3 = zeros(length(D),1);

PSD_tD3 = zeros(length(tD),1);
PSD_Tsai3 = zeros(length(D),1);
ave_freqs3 = zeros(length(H3), 1);
ave_freqs_Tsai3 = zeros(length(H3), 1);

for j = 1:length(H3)
    for k = 1:length(freqs)
        for i = 1:length(D)
            for t = 1:length(tD)
                PSD_tD3(t) = model_multimode(freqs(k),D(i),H3(j), 1, 10, 0.7, 17, ...
                    xx(t), 250, 0.089, 20, 0);
            end
            PSD3(i) = trapz(xx, PSD_tD3.*tD);
            PSD_Tsai3(i) = model_saltation(freqs(k),D(i),H3(j), 1, 10, 0.7, 17, ...
                0.045, 0.005, 250, 0.089, 20, 0);
        end
        PSD_estimated3(k) = trapz(D,PSD3.*pD);
        PSD_estimated_Tsai3(k) = trapz(D,PSD_Tsai3.*pD);
    end
    ave_freqs3(j) = mean(PSD_estimated3);
    ave_freqs_Tsai3(j) = mean(PSD_estimated_Tsai3);

end


% Inverted bedload from PSD
observe3 = 10.^(PSD_seismic3/10);
qbd3 = observe3./ave_freqs3;
qbd_Tsai3 = observe3./ave_freqs_Tsai3;



%% Plot

fig = figure('Units','normalized','Color', [1 1 1]);
fig.Units = 'Pixels';
ax = multiplot(2,2,'gapsize',30, 'marginsize', 0, 'labelsize', 20, ... 
    'labelsize', 35, 'fontSize', 25, 'lineWidth', 1.5, 'boxSwitch' , 'on', ...
    'minorTickSwitch', 'on', 'insideTickLabels', 'off');
% fig = figure('Units','normalized','Position',[0 0 0.9 0.45],'Color', [1 1 1]);




hold(ax(1,1), 'on')
times = linspace(1,331,331);
t = 1:17;
plot(ax(1,1), t, bedload, 'ko', 'LineWidth', 2.5)
plot(ax(1,1), times, qbd*2700, 'o--', 'LineWidth',2.5, 'color', 'r')
plot(ax(1,1), times, qbd_Tsai*2700, 'o--', 'LineWidth',2.5, 'Color', [0 0.4470 0.7410])
% plot(ax(1,1), times, H, 'b--', 'LineWidth', 2.5)
set(ax(1,1), 'XScale', 'log')
set(ax(1,1), 'YScale', 'log')
ylabel(ax(1,1), "Bedload flux (kg m^{-1}s^{-1})", 'FontSize',30)

% str_H1 = sprintf('Depth (H) = %.1fm',H1);
str1 = {'a)'};
text(ax(1,1), 1.5, 3500,str1, "FontSize",35)


hold(ax(1,2), "on")
times1 = linspace(1,317,317);

idx_plot = 1:1:257;
t1 = 1:24;
plot(ax(1,2), t1, bedload1, 'ko', 'LineWidth', 2.5)
plot(ax(1,2), times1(idx_plot), qbd1(idx_plot)*2700, 'ro--', 'LineWidth',2.5)
plot(ax(1,2), times1(idx_plot), qbd_Tsai1(idx_plot)*2700, 'o--', 'LineWidth',2.5, 'Color', [0 0.4470 0.7410])
% plot(ax(1,2), times1(idx_plot), H1(idx_plot), 'b--', 'LineWidth', 2.5)
set(ax(1,2), 'XScale', 'log')
set(ax(1,2), 'YScale', 'log')

str1 = {'b)'};
text(ax(1,2), 1.5, 3500,str1, "FontSize",35)

hold(ax(2,1), "on")
times2 = linspace(1,122,122);
t2 = 1:36;
plot(ax(2,1), t2, bedload2, 'ko', 'LineWidth', 2.5)
plot(ax(2,1), times2, qbd2*2700, 'ro--', 'LineWidth',2.5)
plot(ax(2,1), times2, qbd_Tsai2*2700, 'o--', 'LineWidth',2.5, 'Color', [0 0.4470 0.7410])
% plot(ax(2,1), times2, H2, 'b--', 'LineWidth', 2.5)
set(ax(2,1), 'XScale', 'log')
set(ax(2,1), 'YScale', 'log')
ylabel(ax(2,1), "Bedload flux (kg m^{-1}s^{-1})", 'FontSize',30)
xlabel(ax(2,1), "Time since flood started (min)",'FontSize',30)

str1 = {'c)'};
text(ax(2,1), 1.5, 300,str1, "FontSize",35)


hold(ax(2,2), "on")
times3 = linspace(1,205,205);
t3 = 1:53;
plot(ax(2,2),t3, bedload3, 'ko', 'LineWidth', 2.5)
plot(ax(2,2),times3, qbd3*2700, 'ro--', 'LineWidth',2.5)
plot(ax(2,2),times3, qbd_Tsai3*2700, 'o--', 'LineWidth',2.5, 'Color', [0 0.4470 0.7410])
% plot(ax(2,2), times3, H3, 'b--', 'LineWidth', 2.5)
set(ax(2,2), 'XScale', 'log')
set(ax(2,2), 'YScale', 'log')

str1 = {'d)'};
text(ax(2,2), 1.5, 300,str1, "FontSize",35)

% ylabel(ax(2,2), "Bedload flux (kg m^{-1}s^{-1})", 'FontSize',20)
xlabel(ax(2,2), "Time since flood started (min)",'FontSize',30)
legend(ax(2,2), "Observed", "Inverted (multi-mode model)",...
    "Inverted (saltation-mode model)", "Location", ...
    "best");

ylim(ax(1,1), [1e-4 1e3])
% set(ax(1,1), 'XMinorTick', 'on', 'YMinorTick', 'on')
ylim(ax(1,2), [1e-4 1e3])
ylim(ax(2,1), [1e-4 1e2])
ylim(ax(2,2), [1e-4 1e2])
yticks(ax(1,1), [1e-4 1e-2 1e0 1e2])
yticks(ax(1,2), [1e-4 1e-2 1e0 1e2])

xlim(ax(1,2), [1 400])
xlim(ax(1,1), [1 400])
xlim(ax(2,1), [1 400])
xlim(ax(2,2), [1 400])

p = patch(ax(1,2), [1 5 5 1 ],[1e-4 1e-4 1e3 1e3],[17 17 17]/255,'FaceAlpha',0.2);
p1 = patch(ax(2,1), [1 4 4 1 ],[1e-4 1e-4 1e2 1e2],[17 17 17]/255,'FaceAlpha',0.2);


