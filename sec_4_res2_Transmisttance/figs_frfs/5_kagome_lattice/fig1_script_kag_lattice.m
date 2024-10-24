% Limpar a área de trabalho e fechar todas as figuras anteriores
clear all
close all
clc

% Nomes dos arquivos das figuras
fig_11_filename = 'fig_3_5_tr_kagome_lattice_fig_2_mp1_freq_20.fig';
fig_12_filename = 'fig_3_5_tr_kagome_lattice_fig_2_mp1_freq_60.fig';
fig_13_filename = 'fig_3_5_tr_kagome_lattice_fig_2_mp1_freq_150.fig';
% Abrir as figuras
fig11 = openfig(fig_11_filename);
fig12 = openfig(fig_12_filename);
fig13 = openfig(fig_13_filename);
%
y_i = 10;
y_f = 300;
% Criar um novo subplot de 1 linha e 3 colunas
figure(24);

str_frf = string('Receptance [dB re 1.0 m/N]')

subplot(1, 3, 1);
rectangle_position_f12 = [-350,17.25,100-(-300),24.5-17.25]; % [x, y, largura, altura]
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
    17.25,24.5,24.5-17.25))
set(legend,'Location','northwest','FontSize',8)
ylabel('Frequency [Hz]','fontsize',20,'fontweight','b')
xlabel(str_frf,'fontsize',20,'fontweight','b')
ylim([y_i y_f])
xlim([-320 40])
copyobj(allchild(get(fig11, 'CurrentAxes')), gca);

subplot(1, 3, 2);
rectangle_position_f12 = [-350,55.375,100-(-300),99.5-55.375]; % [x, y, largura, altura]
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
    55.38,99.5,99.5-55.38))
set(legend,'Location','northwest','FontSize',8)
ylabel('Frequency [Hz]','fontsize',20,'fontweight','b')
xlabel(str_frf,'fontsize',20,'fontweight','b')
ylim([y_i y_f])
xlim([-320 40])
copyobj(allchild(get(fig12, 'CurrentAxes')), gca);

subplot(1, 3, 3);
rectangle_position_f12 = [-350,109.5,100-(-300),190-109.5]; % [x, y, largura, altura]
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
    109.5,190,190-109.5))
set(legend,'Location','northwest','FontSize',8)
ylabel('Frequency [Hz]','fontsize',20,'fontweight','b')
xlabel(str_frf,'fontsize',20,'fontweight','b')
ylim([y_i y_f])
xlim([-320 40])
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
name_fig = strcat('fig_24_1_tr_kagome_lattice_all_mps_freq')
file_fig = strcat( name_fig,'.fig');
%
savefig(24,file_fig);
file_eps = strcat(name_fig,'.eps');
%
saveas(24,file_eps,'epsc');

file_png = strcat(name_fig,'.png');
saveas(24,file_png);

