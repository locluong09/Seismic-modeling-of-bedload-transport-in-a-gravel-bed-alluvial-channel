clc
clear all
close all


f = linspace(0.01,400,100)'; %frequency ranges

% first param is frequency, second grain size, third is H
D1 = 0.003;
D2 = 0.005;
D3 = 0.007;
D4 = 0.01;

D5 = 0.02;
D6 = 0.03;
D7 = 0.04;

D8 = 0.05;
D9 = 0.06;
D10 = 0.08;
D11 = 0.2;


H1 = 0.3;
H2 = 0.7;
H3 = 1.2;
H4 = 2;


PSD1_H1 = model_saltation(f, D1, H1, 1e-3, 50, 1.4, 20, 0.045, D1, 250, 0.089, 20, 0); 
PSD2_H1 = model_saltation(f, D2, H1, 1e-3, 50, 1.4, 20, 0.045, D2, 250, 0.089, 20, 0);
PSD3_H1 = model_saltation(f, D3, H1, 1e-3, 50, 1.4, 20, 0.045, D3, 250, 0.089, 20, 0);
PSD4_H1 = model_saltation(f, D4, H1, 1e-3, 50, 1.4, 20, 0.045, D4, 250, 0.089, 20, 0);
PSD5_H1 = model_saltation(f, D5, H1, 1e-3, 50, 1.4, 20, 0.045, D5, 250, 0.089, 20, 0);
PSD6_H1 = model_saltation(f, D6, H1, 1e-3, 50, 1.4, 20, 0.045, D6, 250, 0.089, 20, 0);
PSD7_H1 = model_saltation(f, D7, H1, 1e-3, 50, 1.4, 20, 0.045, D7, 250, 0.089, 20, 0);

PSD8_H1 = model_saltation(f, D8, H1, 1e-3, 50, 1.4, 20, 0.045, D8, 250, 0.089, 20, 0);
PSD9_H1 = model_saltation(f, D9, H1, 1e-3, 50, 1.4, 20, 0.045, D9, 250, 0.089, 20, 0);
PSD10_H1 = model_saltation(f, D10, H1, 1e-3, 50, 1.4, 20, 0.045, D10, 250, 0.089, 20, 0);
PSD11_H1 = model_saltation(f, D11, H1, 1e-3, 50, 1.4, 20, 0.045, D11, 250, 0.089, 20, 0);


P1_H1 = model_multimode(f,D1,H1, 1e-3, 50, 1.4, 20, 0.15, 250, 0.089, 20, 0);
P2_H1 = model_multimode(f,D2,H1, 1e-3, 50, 1.4, 20, 0.15, 250, 0.089, 20, 0);
P3_H1 = model_multimode(f,D3,H1, 1e-3, 50, 1.4, 20, 0.15, 250, 0.089, 20, 0);
P4_H1 = model_multimode(f,D4,H1, 1e-3, 50, 1.4, 20, 0.15, 250, 0.089, 20, 0);
P5_H1 = model_multimode(f,D5,H1, 1e-3, 50, 1.4, 20, 0.15, 250, 0.089, 20, 0);
P6_H1 = model_multimode(f,D6,H1, 1e-3, 50, 1.4, 20, 0.15, 250, 0.089, 20, 0);
P7_H1 = model_multimode(f,D7,H1, 1e-3, 50, 1.4, 20, 0.15, 250, 0.089, 20, 0);

P8_H1 = model_multimode(f,D8,H1, 1e-3, 50, 1.4, 20, 0.15, 250, 0.089, 20, 0);
P9_H1 = model_multimode(f,D9,H1, 1e-3, 50, 1.4, 20, 0.15, 250, 0.089, 20, 0);
P10_H1 = model_multimode(f,D10,H1, 1e-3, 50, 1.4, 20, 0.15, 250, 0.089, 20, 0);
P11_H1 = model_multimode(f,D11,H1, 1e-3, 50, 1.4, 20, 0.15, 250, 0.089, 20, 0);

PSD1_H2 = model_saltation(f, D1, H2, 1e-3, 50, 1.4, 20, 0.045, D1, 250, 0.089, 20, 0); 
PSD2_H2 = model_saltation(f, D2, H2, 1e-3, 50, 1.4, 20, 0.045, D2, 250, 0.089, 20, 0);
PSD3_H2 = model_saltation(f, D3, H2, 1e-3, 50, 1.4, 20, 0.045, D3, 250, 0.089, 20, 0);
PSD4_H2 = model_saltation(f, D4, H2, 1e-3, 50, 1.4, 20, 0.045, D4, 250, 0.089, 20, 0);
PSD5_H2 = model_saltation(f, D5, H2, 1e-3, 50, 1.4, 20, 0.045, D5, 250, 0.089, 20, 0);
PSD6_H2 = model_saltation(f, D6, H2, 1e-3, 50, 1.4, 20, 0.045, D6, 250, 0.089, 20, 0);
PSD7_H2 = model_saltation(f, D7, H2, 1e-3, 50, 1.4, 20, 0.045, D7, 250, 0.089, 20, 0);

PSD8_H2 = model_saltation(f, D8, H2, 1e-3, 50, 1.4, 20, 0.045, D8, 250, 0.089, 20, 0);
PSD9_H2 = model_saltation(f, D9, H2, 1e-3, 50, 1.4, 20, 0.045, D9, 250, 0.089, 20, 0);
PSD10_H2 = model_saltation(f, D10, H2, 1e-3, 50, 1.4, 20, 0.045, D10, 250, 0.089, 20, 0);
PSD11_H2 = model_saltation(f, D11, H2, 1e-3, 50, 1.4, 20, 0.045, D11, 250, 0.089, 20, 0);

P1_H2 = model_multimode(f,D1,H2, 1e-3, 50, 1.4, 20, 0.15, 250, 0.089, 20, 0);
P2_H2 = model_multimode(f,D2,H2, 1e-3, 50, 1.4, 20, 0.15, 250, 0.089, 20, 0);
P3_H2 = model_multimode(f,D3,H2, 1e-3, 50, 1.4, 20, 0.15, 250, 0.089, 20, 0);
P4_H2 = model_multimode(f,D4,H2, 1e-3, 50, 1.4, 20, 0.15, 250, 0.089, 20, 0);
P5_H2 = model_multimode(f,D5,H2, 1e-3, 50, 1.4, 20, 0.15, 250, 0.089, 20, 0);
P6_H2 = model_multimode(f,D6,H2, 1e-3, 50, 1.4, 20, 0.15, 250, 0.089, 20, 0);
P7_H2 = model_multimode(f,D7,H2, 1e-3, 50, 1.4, 20, 0.15, 250, 0.089, 20, 0);

P8_H2 = model_multimode(f,D8,H2, 1e-3, 50, 1.4, 20, 0.15, 250, 0.089, 20, 0);
P9_H2 = model_multimode(f,D9,H2, 1e-3, 50, 1.4, 20, 0.15, 250, 0.089, 20, 0);
P10_H2 = model_multimode(f,D10,H2, 1e-3, 50, 1.4, 20, 0.15, 250, 0.089, 20, 0);
P11_H2 = model_multimode(f,D11,H2, 1e-3, 50, 1.4, 20, 0.15, 250, 0.089, 20, 0);



PSD1_H3 = model_saltation(f, D1, H3, 1e-3, 50, 1.4, 20, 0.045, D1, 250, 0.089, 20, 0); 
PSD2_H3 = model_saltation(f, D2, H3, 1e-3, 50, 1.4, 20, 0.045, D2, 250, 0.089, 20, 0);
PSD3_H3 = model_saltation(f, D3, H3, 1e-3, 50, 1.4, 20, 0.045, D3, 250, 0.089, 20, 0);
PSD4_H3 = model_saltation(f, D4, H3, 1e-3, 50, 1.4, 20, 0.045, D4, 250, 0.089, 20, 0);
PSD5_H3 = model_saltation(f, D5, H3, 1e-3, 50, 1.4, 20, 0.045, D5, 250, 0.089, 20, 0);
PSD6_H3 = model_saltation(f, D6, H3, 1e-3, 50, 1.4, 20, 0.045, D6, 250, 0.089, 20, 0);
PSD7_H3 = model_saltation(f, D7, H3, 1e-3, 50, 1.4, 20, 0.045, D7, 250, 0.089, 20, 0);

PSD8_H3 = model_saltation(f, D8, H3, 1e-3, 50, 1.4, 20, 0.045, D8, 250, 0.089, 20, 0);
PSD9_H3 = model_saltation(f, D9, H3, 1e-3, 50, 1.4, 20, 0.045, D9, 250, 0.089, 20, 0);
PSD10_H3 = model_saltation(f, D10, H3, 1e-3, 50, 1.4, 20, 0.045, D10, 250, 0.089, 20, 0);
PSD11_H3 = model_saltation(f, D11, H3, 1e-3, 50, 1.4, 20, 0.045, D11, 250, 0.089, 20, 0);

P1_H3 = model_multimode(f,D1,H3, 1e-3, 50, 1.4, 20, 0.15, 250, 0.089, 20, 0);
P2_H3 = model_multimode(f,D2,H3, 1e-3, 50, 1.4, 20, 0.15, 250, 0.089, 20, 0);
P3_H3 = model_multimode(f,D3,H3, 1e-3, 50, 1.4, 20, 0.15, 250, 0.089, 20, 0);
P4_H3 = model_multimode(f,D4,H3, 1e-3, 50, 1.4, 20, 0.15, 250, 0.089, 20, 0);
P5_H3 = model_multimode(f,D5,H3, 1e-3, 50, 1.4, 20, 0.15, 250, 0.089, 20, 0);
P6_H3 = model_multimode(f,D6,H3, 1e-3, 50, 1.4, 20, 0.15, 250, 0.089, 20, 0);
P7_H3 = model_multimode(f,D7,H3, 1e-3, 50, 1.4, 20, 0.15, 250, 0.089, 20, 0);

P8_H3 = model_multimode(f,D8,H3, 1e-3, 50, 1.4, 20, 0.15, 250, 0.089, 20, 0);
P9_H3 = model_multimode(f,D9,H3, 1e-3, 50, 1.4, 20, 0.15, 250, 0.089, 20, 0);
P10_H3 = model_multimode(f,D10,H3, 1e-3, 50, 1.4, 20, 0.15, 250, 0.089, 20, 0);
P11_H3 = model_multimode(f,D11,H3, 1e-3, 50, 1.4, 20, 0.15, 250, 0.089, 20, 0);


PSD1_H4 = model_saltation(f, D1, H4, 1e-3, 50, 1.4, 20, 0.045, D1, 250, 0.089, 20, 0); 
PSD2_H4 = model_saltation(f, D2, H4, 1e-3, 50, 1.4, 20, 0.045, D2, 250, 0.089, 20, 0);
PSD3_H4 = model_saltation(f, D3, H4, 1e-3, 50, 1.4, 20, 0.045, D3, 250, 0.089, 20, 0);
PSD4_H4 = model_saltation(f, D4, H4, 1e-3, 50, 1.4, 20, 0.045, D4, 250, 0.089, 20, 0);
PSD5_H4 = model_saltation(f, D5, H4, 1e-3, 50, 1.4, 20, 0.045, D5, 250, 0.089, 20, 0);
PSD6_H4 = model_saltation(f, D6, H4, 1e-3, 50, 1.4, 20, 0.045, D6, 250, 0.089, 20, 0);
PSD7_H4 = model_saltation(f, D7, H4, 1e-3, 50, 1.4, 20, 0.045, D7, 250, 0.089, 20, 0);

PSD8_H4 = model_saltation(f, D8, H4, 1e-3, 50, 1.4, 20, 0.045, D8, 250, 0.089, 20, 0);
PSD9_H4 = model_saltation(f, D9, H4, 1e-3, 50, 1.4, 20, 0.045, D9, 250, 0.089, 20, 0);
PSD10_H4 = model_saltation(f, D10, H4, 1e-3, 50, 1.4, 20, 0.045, D10, 250, 0.089, 20, 0);
PSD11_H4 = model_saltation(f, D11, H4, 1e-3, 50, 1.4, 20, 0.045, D11, 250, 0.089, 20, 0);

P1_H4 = model_multimode(f,D1,H4, 1e-3, 50, 1.4, 20, 0.15, 250, 0.089, 20, 0);
P2_H4 = model_multimode(f,D2,H4, 1e-3, 50, 1.4, 20, 0.15, 250, 0.089, 20, 0);
P3_H4 = model_multimode(f,D3,H4, 1e-3, 50, 1.4, 20, 0.15, 250, 0.089, 20, 0);
P4_H4 = model_multimode(f,D4,H4, 1e-3, 50, 1.4, 20, 0.15, 250, 0.089, 20, 0);
P5_H4 = model_multimode(f,D5,H4, 1e-3, 50, 1.4, 20, 0.15, 250, 0.089, 20, 0);
P6_H4 = model_multimode(f,D6,H4, 1e-3, 50, 1.4, 20, 0.15, 250, 0.089, 20, 0);
P7_H4 = model_multimode(f,D7,H4, 1e-3, 50, 1.4, 20, 0.15, 250, 0.089, 20, 0);

P8_H4 = model_multimode(f,D8,H4, 1e-3, 50, 1.4, 20, 0.15, 250, 0.089, 20, 0);
P9_H4 = model_multimode(f,D9,H4, 1e-3, 50, 1.4, 20, 0.15, 250, 0.089, 20, 0);
P10_H4 = model_multimode(f,D10,H4, 1e-3, 50, 1.4, 20, 0.15, 250, 0.089, 20, 0);
P11_H4 = model_multimode(f,D11,H4, 1e-3, 50, 1.4, 20, 0.15, 250, 0.089, 20, 0);

labels=num2str([D1, D2, D3, D4]','D = %0.3f m');


fig = figure('Units','normalized','Position',[0 0 1 1],'Color', [1 1 1]);
fig.Units = 'Pixels';
ax = multiplot(2,2, 'gapsize',90, 'marginsize', 90, 'labelsize', 25, 'fontsize', 30,...
    'yaxislabel', "PSD (dB)", 'xaxislabel', 'Frequency (Hz)');


hold(ax(1,1), 'on')
plot(ax(1,1), f, 10*log10(PSD1_H1),'', 'color', [0 0.4470 0.7410], 'linewidth',4)
plot(ax(1,1), f, 10*log10(PSD2_H1),'', 'color', [0.8500 0.3250 0.0980], 'linewidth',4)
plot(ax(1,1), f, 10*log10(PSD3_H1),'', 'color', [0.9290 0.6940 0.1250], 'linewidth',4)
plot(ax(1,1), f, 10*log10(PSD4_H1),'', 'color', [0.4940 0.1840 0.5560], 'linewidth',4)

plot(ax(1,1), f, 10*log10(P1_H1),'--', 'color', [0 0.4470 0.7410], 'linewidth',4)
plot(ax(1,1), f, 10*log10(P2_H1),'--', 'color', [0.8500 0.3250 0.0980], 'linewidth',4)
plot(ax(1,1), f, 10*log10(P3_H1),'--', 'color', [0.9290 0.6940 0.1250], 'linewidth',4)
plot(ax(1,1), f, 10*log10(P4_H1),'--', 'color', [0.4940 0.1840 0.5560], 'linewidth',4)
ylim(ax(1,1), [-210,-130])
legend(ax(1,1),labels, 'Location', 'northeast')

str_H1 = sprintf('Depth (H) = %.1f m',H1);
str1 = {'Solid: saltation-mode model','Dash: multi-mode model', str_H1};
text(ax(1,1), 40,-190,str1, "FontSize",30)

text(ax(1,1), 10, -124," a)", "FontSize",40)


hold(ax(1,2), 'on')
plot(ax(1,2), f, 10*log10(PSD1_H2),'', 'color', [0 0.4470 0.7410], 'linewidth',4)
plot(ax(1,2), f, 10*log10(PSD2_H2),'', 'color', [0.8500 0.3250 0.0980], 'linewidth',4)
plot(ax(1,2), f, 10*log10(PSD3_H2),'', 'color', [0.9290 0.6940 0.1250], 'linewidth',4)
plot(ax(1,2), f, 10*log10(PSD4_H2),'', 'color', [0.4940 0.1840 0.5560], 'linewidth',4)

plot(ax(1,2), f, 10*log10(P1_H2),'--', 'color', [0 0.4470 0.7410], 'linewidth',4)
plot(ax(1,2), f, 10*log10(P2_H2),'--', 'color', [0.8500 0.3250 0.0980], 'linewidth',4)
plot(ax(1,2), f, 10*log10(P3_H2),'--', 'color', [0.9290 0.6940 0.1250], 'linewidth',4)
plot(ax(1,2), f, 10*log10(P4_H2),'--', 'color', [0.4940 0.1840 0.5560], 'linewidth',4)
ylim(ax(1,2), [-210,-130])

str_H2 = sprintf('Depth (H) = %.1f m',H2);
str2 = {str_H2};
text(ax(1,2), 40,-190,str2,  "FontSize",30)

text(ax(1,2), 10, -124," b)", "FontSize",40)


hold(ax(2,1), 'on')
plot(ax(2,1), f, 10*log10(PSD1_H3),'', 'color', [0 0.4470 0.7410], 'linewidth',4)
plot(ax(2,1), f, 10*log10(PSD2_H3),'', 'color', [0.8500 0.3250 0.0980], 'linewidth',4)
plot(ax(2,1), f, 10*log10(PSD3_H3),'', 'color', [0.9290 0.6940 0.1250], 'linewidth',4)
plot(ax(2,1), f, 10*log10(PSD4_H3),'', 'color', [0.4940 0.1840 0.5560], 'linewidth',4)

plot(ax(2,1), f, 10*log10(P1_H3),'--', 'color', [0 0.4470 0.7410], 'linewidth',4)
plot(ax(2,1), f, 10*log10(P2_H3),'--', 'color', [0.8500 0.3250 0.0980], 'linewidth',4)
plot(ax(2,1), f, 10*log10(P3_H3),'--', 'color', [0.9290 0.6940 0.1250], 'linewidth',4)
plot(ax(2,1), f, 10*log10(P4_H3),'--', 'color', [0.4940 0.1840 0.5560], 'linewidth',4)
ylim(ax(2,1), [-210,-130])

str_H3 = sprintf('Depth (H) = %.1f m',H3);
str3 = {str_H3};
text(ax(2,1), 40,-190,str3,  "FontSize",30)

text(ax(2,1), 10, -124," c)", "FontSize",40)


hold(ax(2,2), 'on')
plot(ax(2,2), f, 10*log10(PSD1_H4),'', 'color', [0 0.4470 0.7410], 'linewidth',4)
plot(ax(2,2), f, 10*log10(PSD2_H4),'', 'color', [0.8500 0.3250 0.0980], 'linewidth',4)
plot(ax(2,2), f, 10*log10(PSD3_H4),'', 'color', [0.9290 0.6940 0.1250], 'linewidth',4)
plot(ax(2,2), f, 10*log10(PSD4_H4),'', 'color', [0.4940 0.1840 0.5560], 'linewidth',4)

plot(ax(2,2), f, 10*log10(P1_H4),'--', 'color', [0 0.4470 0.7410], 'linewidth',4)
plot(ax(2,2), f, 10*log10(P2_H4),'--', 'color', [0.8500 0.3250 0.0980], 'linewidth',4)
plot(ax(2,2), f, 10*log10(P3_H4),'--', 'color', [0.9290 0.6940 0.1250], 'linewidth',4)
plot(ax(2,2), f, 10*log10(P4_H4),'--', 'color', [0.4940 0.1840 0.5560], 'linewidth',4)
ylim(ax(2,2), [-210,-130])

str_H4 = sprintf('Depth (H) = %.1f m',H4);
str4 = {str_H4};
text(ax(2,2), 40,-190,str4,  "FontSize",30)

text(ax(2,2), 10, -124," d)", "FontSize",40)

ylabel(ax(1,1), "PSD (dB)", 'FontSize',35)
ylabel(ax(2,1), "PSD (dB)", 'FontSize',35)
xlabel(ax(2,1), "Frequency (Hz)",'FontSize',35)
xlabel(ax(2,2), "Frequency (Hz)",'FontSize',35)



%% Figure 8

r1_H1 = [P1_H1./PSD1_H1 , P1_H2./PSD1_H2, P1_H3./PSD1_H3, P1_H4./PSD1_H4];%same D1
r1_H2 = [P2_H1./PSD2_H1 , P2_H2./PSD2_H2, P2_H3./PSD2_H3, P2_H4./PSD2_H4];%same D2
r1_H3 = [P3_H1./PSD3_H1 , P3_H2./PSD3_H2, P3_H3./PSD3_H3, P3_H4./PSD3_H4];%same D3
r1_H4 = [P4_H1./PSD4_H1 , P4_H2./PSD4_H2, P4_H3./PSD4_H3, P4_H4./PSD4_H4];%same D4
r1_H5 = [P5_H1./PSD5_H1 , P5_H2./PSD5_H2, P5_H3./PSD5_H3, P5_H4./PSD5_H4];%same D5
r1_H6 = [P6_H1./PSD6_H1 , P6_H2./PSD6_H2, P6_H3./PSD6_H3, P6_H4./PSD6_H4];%same D6
r1_H7 = [P7_H1./PSD7_H1 , P7_H2./PSD7_H2, P7_H3./PSD7_H3, P7_H4./PSD7_H4];%same D7
r1_H8 = [P8_H1./PSD8_H1 , P8_H2./PSD8_H2, P8_H3./PSD8_H3, P8_H4./PSD8_H4];%same D8
r1_H9 = [P9_H1./PSD9_H1 , P9_H2./PSD9_H2, P9_H3./PSD9_H3, P9_H4./PSD9_H4];%same D9
r1_H10 = [P10_H1./PSD10_H1 , P10_H2./PSD10_H2, P10_H3./PSD10_H3, P10_H4./PSD10_H4];%same D10
r1_H11 = [P11_H1./PSD11_H1 , P11_H2./PSD11_H2, P11_H3./PSD11_H3, P11_H4./PSD11_H4];%same D11

r_h1 = mean(r1_H1);
r_h2 = mean(r1_H2);
r_h3 = mean(r1_H3);
r_h4 = mean(r1_H4);
r_h5 = mean(r1_H5);
r_h6 = mean(r1_H6);
r_h7 = mean(r1_H7);
r_h8 = mean(r1_H8);
r_h9 = mean(r1_H9);
r_h10 = mean(r1_H10);
r_h11 = mean(r1_H11);


R = [r_h1; r_h2; r_h3; r_h4; r_h5; r_h6; r_h7; r_h8; r_h9; r_h10; r_h11];

D = [D1, D2, D3, D4, D5, D6, D7, D8, D9, D10, D11];
D = D*1000;
fig3 = figure(3);
set(fig3, 'Position', [0 0 900 600])

plot(D, R(:,1), "linewidth", 5)
hold on
plot(D, R(:,2), "linewidth", 5)
plot(D, R(:,3), "linewidth", 5)
plot(D, R(:,4), "linewidth", 5)
yline(1, '--', 'LineWidth',5)
legend("H = 0.3 m", "H = 0.7 m", "H = 1.2 m", "H = 2.0 m", 'FontSize', 24, 'location', 'best')
set(gca, 'YScale', 'log')
% set(gca, 'XScale', 'log')
ylabel("Multi-mode/Saltation-mode PSD ratio (-)", 'FontSize', 30)
xlabel("Grain size D (mm)", 'FontSize', 30)
xticks(gca, [3 20 50 100 200])
xlim(gca, [3 max(D)])
ax = gca; 
ax.FontSize = 25; 
text(60, 0.04," PSD_{multi-mode model} < PSD_{saltation-mode model}", "FontSize",20)
text(60, 5," PSD_{saltation-mode model} > PSD_{multi-mode model}", "FontSize",20)







