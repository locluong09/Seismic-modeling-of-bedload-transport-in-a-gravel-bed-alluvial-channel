clear all
close all
clc

f = linspace(0.1,100,100)'; %frequency ranges

% For D grain size
PSD1_D = model_multimode(f,0.05,2);
PSD2_D = model_multimode(f,0.1,2);
PSD3_D = model_multimode(f,0.2,2);
PSD4_D = model_multimode(f,0.4,2);

PSD_D1 = model_saltation(f, 0.05,2); 
PSD_D2 = model_saltation(f,0.1,2);
PSD_D3 = model_saltation(f,0.2,2);
PSD_D4 = model_saltation(f,0.4,2);


% For H flow depth
PSD1_H = model_multimode(f,0.05,0.25);
PSD2_H = model_multimode(f,0.05,0.5);
PSD3_H = model_multimode(f,0.05,1);
PSD4_H = model_multimode(f,0.05,2);

PSD_H1 = model_saltation(f,0.05,0.25); 
PSD_H2 = model_saltation(f,0.05,0.5);
PSD_H3 = model_saltation(f,0.05,1);
PSD_H4 = model_saltation(f,0.05,2);


% For hop time t
PSD1_T = model_u(f,0.1,0.5, 1, 1e-3, 50, 1.4, 600, 0.05);
PSD2_T = model_u(f,0.1,0.5, 1, 1e-3, 50, 1.4, 600, 0.1);
PSD3_T = model_u(f,0.1,0.5, 1, 1e-3, 50, 1.4, 600, 0.25);
PSD4_T = model_u(f,0.1,0.5, 1, 1e-3, 50, 1.4, 600, 0.5);

PSD_T1 = model_t_Tsai(f,0.1,0.5, 1, 1e-3, 50, 1.4, 600, 0.05);
PSD_T2 = model_t_Tsai(f,0.1,0.5, 1, 1e-3, 50, 1.4, 600, 0.1);
PSD_T3 = model_t_Tsai(f,0.1,0.5, 1, 1e-3, 50, 1.4, 600, 0.25);
PSD_T4 = model_t_Tsai(f,0.1,0.5, 1, 1e-3, 50, 1.4, 600, 0.5);


% For bedload velocity Ub
PSD1_U = model_u(f,0.1,0.5, 0.5, 1e-3, 50, 1.4, 600, 0.15);
PSD2_U = model_u(f,0.1,0.5, 1, 1e-3, 50, 1.4, 600, 0.15);
PSD3_U = model_u(f,0.1,0.5, 2, 1e-3, 50, 1.4, 600, 0.15);
PSD4_U = model_u(f,0.1,0.5, 4, 1e-3, 50, 1.4, 600, 0.15);

PSD_U1 = model_t_Tsai(f,0.1,0.5, 0.5, 1e-3, 50, 1.4, 600, 0.15);
PSD_U2 = model_t_Tsai(f,0.1,0.5, 1, 1e-3, 50, 1.4, 600, 0.15);
PSD_U3 = model_t_Tsai(f,0.1,0.5, 2, 1e-3, 50, 1.4, 600, 0.15);
PSD_U4 = model_t_Tsai(f,0.1,0.5, 4, 1e-3, 50, 1.4, 600, 0.15);


fig = figure('Units','normalized','Position',[0 0 1 1],'Color', [1 1 1]);
fig.Units = 'Pixels';
ax = multiplot(2,2, 'gapsize',120, 'marginsize', 100, 'labelsize', 35, 'fontsize', 30, ...
    'yaxislabel', "PSD (dB)", 'xaxislabel', 'Frequency (Hz)');

hold(ax(1,1), 'on')
plot(ax(1,1), f, 10*log10(PSD1_D),'--', 'color', [0 0.4470 0.7410], 'linewidth',4)
plot(ax(1,1), f, 10*log10(PSD2_D),'--', 'color', [0.8500 0.3250 0.0980], 'linewidth',4)
plot(ax(1,1), f, 10*log10(PSD3_D),'--', 'color', [0.9290 0.6940 0.1250], 'linewidth',4)
plot(ax(1,1), f, 10*log10(PSD4_D),'--', 'color', [0.4940 0.1840 0.5560], 'linewidth',4)

plot(ax(1,1), f, 10*log10(PSD_D1),'', 'color', [0 0.4470 0.7410], 'linewidth',4)
plot(ax(1,1), f, 10*log10(PSD_D2),'', 'color', [0.8500 0.3250 0.0980], 'linewidth',3)
plot(ax(1,1), f, 10*log10(PSD_D3),'', 'color', [0.9290 0.6940 0.1250], 'linewidth',4)
plot(ax(1,1), f, 10*log10(PSD_D4),'', 'color', [0.4940 0.1840 0.5560], 'linewidth',4)
ylim(ax(1,1), [-200,-134])
legend(ax(1,1),"D = 0.05 m", "D = 0.1 m", "D = 0.2 m", "D = 0.4 m", 'Location', 'best')
text(ax(1,1), 1, -128," a)", "FontSize",40)


hold(ax(1,2), 'on')
plot(ax(1,2), f, 10*log10(PSD1_H),'--', 'color', [0 0.4470 0.7410], 'linewidth',4)
plot(ax(1,2), f, 10*log10(PSD2_H),'--', 'color', [0.8500 0.3250 0.0980], 'linewidth',4)
plot(ax(1,2), f, 10*log10(PSD3_H),'--', 'color', [0.9290 0.6940 0.1250], 'linewidth',4)
plot(ax(1,2), f, 10*log10(PSD4_H),'--', 'color', [0.4940 0.1840 0.5560], 'linewidth',4)

plot(ax(1,2), f, 10*log10(PSD_H1),'', 'color', [0 0.4470 0.7410], 'linewidth',4)
plot(ax(1,2), f, 10*log10(PSD_H2),'', 'color', [0.8500 0.3250 0.0980], 'linewidth',4)
plot(ax(1,2), f, 10*log10(PSD_H3),'', 'color', [0.9290 0.6940 0.1250], 'linewidth',4)
plot(ax(1,2), f, 10*log10(PSD_H4),'', 'color', [0.4940 0.1840 0.5560], 'linewidth',4)
ylim(ax(1,2), [-200,-134.0001])
legend(ax(1,2),"H = 0.25 m", "H = 0.5 m", "H = 1m", "H = 2 m", 'Location', 'best')

text(ax(1,2), 1, -128," b)", "FontSize",40)


hold(ax(2,1), 'on')
plot(ax(2,1), f, 10*log10(PSD1_T),'--', 'color', [0 0.4470 0.7410], 'linewidth',4)
plot(ax(2,1), f, 10*log10(PSD2_T),'--', 'color', [0.8500 0.3250 0.0980], 'linewidth',4)
plot(ax(2,1), f, 10*log10(PSD3_T),'--', 'color', [0.9290 0.6940 0.1250], 'linewidth',4)
plot(ax(2,1), f, 10*log10(PSD4_T),'--', 'color', [0.4940 0.1840 0.5560], 'linewidth',4)

plot(ax(2,1), f, 10*log10(PSD_T1),'', 'color', [0 0.4470 0.7410], 'linewidth',4)
plot(ax(2,1), f, 10*log10(PSD_T2),'', 'color', [0.8500 0.3250 0.0980], 'linewidth',4)
plot(ax(2,1), f, 10*log10(PSD_T3),'', 'color', [0.9290 0.6940 0.1250], 'linewidth',4)
plot(ax(2,1), f, 10*log10(PSD_T4),'', 'color', [0.4940 0.1840 0.5560], 'linewidth',4)
ylim(ax(2,1), [-210,-140])
legend(ax(2,1),"t_{D} = 0.05 s", "t_{D}  = 0.1 s", "t_{D}  = 0.25 s", "t_{D}  = 0.5 s", 'Location', 'best')
text(ax(2,1), 1, -134," c)", "FontSize",40)


hold(ax(2,2), 'on')
plot(ax(2,2), f, 10*log10(PSD1_U),'--', 'color', [0 0.4470 0.7410], 'linewidth',4)
plot(ax(2,2), f, 10*log10(PSD2_U),'--', 'color', [0.8500 0.3250 0.0980], 'linewidth',4)
plot(ax(2,2), f, 10*log10(PSD3_U),'--', 'color', [0.9290 0.6940 0.1250], 'linewidth',4)
plot(ax(2,2), f, 10*log10(PSD4_U),'--', 'color', [0.4940 0.1840 0.5560], 'linewidth',4)

plot(ax(2,2), f, 10*log10(PSD_U1),'', 'color', [0 0.4470 0.7410], 'linewidth',4)
plot(ax(2,2), f, 10*log10(PSD_U2),'', 'color', [0.8500 0.3250 0.0980], 'linewidth',4)
plot(ax(2,2), f, 10*log10(PSD_U3),'', 'color', [0.9290 0.6940 0.1250], 'linewidth',4)
plot(ax(2,2), f, 10*log10(PSD_U4),'', 'color', [0.4940 0.1840 0.5560], 'linewidth',4)
ylim(ax(2,2), [-210,-140])
legend(ax(2,2),"U_{b} = 0.5 m/s", "U_{b} = 1 m/s", "U_{b} = 2 m/s", "U_{b} = 4 m/s", 'Location', 'best')
text(ax(2,2), 1, -134," d)", "FontSize",40)

ylabel(ax(1,1), "PSD (dB)", 'FontSize',35)
ylabel(ax(2,1), "PSD (dB)", 'FontSize',35)
xlabel(ax(2,1), "Frequency (Hz)",'FontSize',35)
xlabel(ax(2,2), "Frequency (Hz)",'FontSize',35)

% str2 = {'Solid: bedrock model','Dash: alluvial model'};
str2 = {'Solid: saltation-mode model','Dash: multi-mode model'};
text(ax(1,2), 2.5,-150,str2,  "FontSize",30)



