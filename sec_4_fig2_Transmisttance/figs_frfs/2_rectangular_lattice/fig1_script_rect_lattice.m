% Limpar a área de trabalho e fechar todas as figuras anteriores
clear all
close all
clc

% Nomes dos arquivos das figuras
fig_11_filename = 'fig_3_2_tr_rectangular_lattice_fig_2_mp1_freq_40.fig';
fig_12_filename = 'fig_3_2_tr_rectangular_lattice_fig_2_mp1_freq_90.fig';
fig_13_filename = 'fig_3_2_tr_rectangular_lattice_fig_2_mp1_freq_150.fig';
% Abrir as figuras
fig11 = openfig(fig_11_filename);
fig12 = openfig(fig_12_filename);
fig13 = openfig(fig_13_filename);
%
y_i = 10;
y_f = 300;
% Criar um novo subplot de 1 linha e 3 colunas
figure(24);
%
str_frf = string('Receptance [dB re 1.0 m/N]')
% Adicionar a primeira figura no subplot (1,3,1)
subplot(1, 3, 1);
rectangle_position_f12 = [-300,36.75,50-(-300),61.5-36.75]; % [x, y, largura, altura]
rectangle('Position', rectangle_position_f12, 'FaceColor', '#FAC902', 'EdgeColor', 'k')
box on
grid on
hold on
set(gca,'YScale', 'log')
set(gca,'fontSize',16,'fontweight','b')
fullBandgap = patch(nan,nan,'k');
fullBandgap.FaceColor = '#FAC902';
legend(fullBandgap, ...
    sprintf('FBGW - f_1 = %.2f [Hz], f_2 = %.2f [Hz], \\Delta f_{12} = %.2f [Hz]',...
    36.75,61.5,61.5-36.75))
set(legend,'Location','northwest','FontSize',8)
ylabel('Frequency [Hz]','fontsize',20,'fontweight','b')
xlabel(str_frf,'fontsize',20,'fontweight','b')
ylim([y_i y_f])
xlim([-200 40])
copyobj(allchild(get(fig11, 'CurrentAxes')), gca);

subplot(1, 3, 2);
rectangle_position_f12 = [-300,64.5,50-(-300),132.06-64.5]; % [x, y, largura, altura]
rectangle('Position', rectangle_position_f12, 'FaceColor', '#FAC902', 'EdgeColor', 'k')
box on
grid on
hold on
set(gca,'YScale', 'log')
set(gca,'fontSize',16,'fontweight','b')
fullBandgap = patch(nan,nan,'k');
fullBandgap.FaceColor = '#FAC902';
legend(fullBandgap, ...
    sprintf('FBGW - f_1 = %.2f [Hz], f_2 = %.2f [Hz], \\Delta f_{12} = %.2f [Hz]',...
    71,160.18,160.18-71))
set(legend,'Location','northwest','FontSize',8)
ylabel('Frequency [Hz]','fontsize',20,'fontweight','b')
xlabel(str_frf,'fontsize',20,'fontweight','b')
ylim([y_i y_f])
xlim([-200 40])
copyobj(allchild(get(fig12, 'CurrentAxes')), gca);

subplot(1, 3, 3);
rectangle_position_f12 = [-300,140,50-(-300),213.5-140]; % [x, y, largura, altura]
rectangle('Position', rectangle_position_f12, 'FaceColor', '#FAC902', 'EdgeColor', 'k')
box on
grid on
hold on
set(gca,'YScale', 'log')
set(gca,'fontSize',16,'fontweight','b')
fullBandgap = patch(nan,nan,'k');
fullBandgap.FaceColor = '#FAC902';
legend(fullBandgap, ...
    sprintf('FBGW - f_1 = %.2f [Hz], f_2 = %.2f [Hz], \\Delta f_{12} = %.2f [Hz]',...
    140,213.5,213.5-140))
set(legend,'Location','northwest','FontSize',8)
ylabel('Frequency [Hz]','fontsize',20,'fontweight','b')
xlabel(str_frf,'fontsize',20,'fontweight','b')
ylim([y_i y_f])
xlim([-200 40])
copyobj(allchild(get(fig13, 'CurrentAxes')), gca);

% Fechar as figuras originais
close(fig11);
close(fig12);
close(fig13);
%
set(gcf, 'Units', 'centimeters');
pos = get(gcf, 'Position');
width = 29.7; % Largura do papel A4 em centímetros (modo paisagem)
height = 21; % Altura do papel A4 em centímetros (modo paisagem)
set(gcf, 'Position', [pos(1) pos(2) width height]);
%
name_fig = strcat('fig_24_1_tr_rect_lattice_all_mps_freq')
file_fig = strcat( name_fig,'.fig');
%
savefig(24,file_fig);
file_eps = strcat(name_fig,'.eps');

saveas(24,file_eps,'epsc');

file_png = strcat(name_fig,'.png');
saveas(24,file_png);

