% Limpar a área de trabalho e fechar todas as figuras anteriores
clear all
close all
clc

% Nomes dos arquivos das figuras
fig_11_filename = 'fig_3_1_tr_square_lattice_fig_2_mp1_freq_40.fig';
fig_12_filename = 'fig_3_1_tr_square_lattice_fig_2_mp1_freq_100.fig';
fig_13_filename = 'fig_3_1_tr_square_lattice_fig_2_mp1_freq_150.fig';
% Abrir as figuras
fig11 = openfig(fig_11_filename);
fig12 = openfig(fig_12_filename);
fig13 = openfig(fig_13_filename);

y_i = 10;
y_f = 300;

% Criar um novo subplot de 1 linha e 3 colunas
figure(24);

str_frf = string('Receptance [dB re 1.0 m/N]')

% Adicionar a primeira figura no subplot (1,3,1)
subplot(1, 3, 1);
rectangle_position_f12 = [-300,33,50-(-300),53.2-33]; % [x, y, largura, altura]
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
    33,53.2,53.2-33))
set(legend,'Location','northwest','FontSize',8)
ylabel('Frequency [Hz]','fontsize',20,'fontweight','b')
xlabel(str_frf,'fontsize',20,'fontweight','b')
ylim([y_i y_f])
xlim([-200 40])
copyobj(allchild(get(fig11, 'CurrentAxes')), gca);


subplot(1, 3, 2);
rectangle_position_f12 = [-300,70.8125,50-(-300),122.9375-70.8125]; % [x, y, largura, altura]
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
    70.81,122.94,122.94-70.81))
set(legend,'Location','northwest','FontSize',8)
ylabel('Frequency [Hz]','fontsize',20,'fontweight','b')
xlabel(str_frf,'fontsize',20,'fontweight','b')
ylim([y_i y_f])
xlim([-200 40])
copyobj(allchild(get(fig12, 'CurrentAxes')), gca);

subplot(1, 3, 3);
rectangle_position_f12 = [-300,77.875,50-(-300),103-77.875]; % [x, y, largura, altura]
rectangle('Position', rectangle_position_f12, 'FaceColor', '#FAC902', 'EdgeColor', 'k')
rectangle_position_f12 = [-300,131.875,50-(-300),154-131.875]; % [x, y, largura, altura]
rectangle('Position', rectangle_position_f12, 'FaceColor', '#FAC902', 'EdgeColor', 'k')
box on
grid on
hold on
set(gca,'YScale', 'log')
set(gca,'fontSize',16,'fontweight','b')
set(legend,'Location','northwest','FontSize',8)

fullBandgap1 = patch(nan,nan,'k');
fullBandgap1.FaceColor = '#FAC902';

fullBandgap2 = patch(nan,nan,'k');
fullBandgap2.FaceColor = '#FAC902';

legend([fullBandgap1,fullBandgap2], ...
    sprintf('FBGW - f_1 = %.2f [Hz], f_2 = %.2f [Hz], \\Delta f_{12} = %.2f [Hz]',...
    77.88,103,103-77.88),...
    sprintf('FBGW - f_1 = %.2f [Hz], f_2 = %.2f [Hz], \\Delta f_{12} = %.2f [Hz]',...
    131.88,154,154-33))

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
name_fig = strcat('fig_24_1_tr_square_lattice_all_mps_freq')
file_fig = strcat( name_fig,'.fig');
%
savefig(24,file_fig);
file_eps = strcat(name_fig,'.eps');
saveas(24,file_eps,'epsc');

file_png = strcat(name_fig,'.png');
saveas(24,file_png);

% close all
% 
% 
% fig_11_filename = 'fig_24_1_tr_square_lattice_all_mps_freq.fig';
% % Abrir as figuras
% fig11 = openfig(fig_11_filename);
% 
% legenda_subplot_1 = legend(subplot(1, 3, 1))
% strings_subplot_1 = legenda_subplot_1.String
% nova_ordem_subplot_1 = {strings_subplot_1{2},...
%                         strings_subplot_1{3},...
%                         strings_subplot_1{4},...
%                         strings_subplot_1{5},...
%                         strings_subplot_1{6},...
%                         strings_subplot_1{7},...
%                         strings_subplot_1{1}};
% 
% legenda_subplot_2 = legend(subplot(1, 3, 2))
% strings_subplot_2 = legenda_subplot_2.String
% nova_ordem_subplot_2 = {strings_subplot_2{2},...
%                         strings_subplot_2{3},...
%                         strings_subplot_2{4},...
%                         strings_subplot_2{5},...
%                         strings_subplot_2{6},...
%                         strings_subplot_2{7},...
%                         strings_subplot_2{1}};
% 
% legenda_subplot_3 = legend(subplot(1, 3, 3))
% strings_subplot_3 = legenda_subplot_3.String
% nova_ordem_subplot_3 = {strings_subplot_3{2},...
%                         strings_subplot_3{3},...
%                         strings_subplot_3{4},...
%                         strings_subplot_3{5},...
%                         strings_subplot_3{6},...
%                         strings_subplot_3{7},...
%                         strings_subplot_3{1}};
% 
% legend(subplot(1, 3, 1), nova_ordem_subplot_1)
% legend(subplot(1, 3, 2), nova_ordem_subplot_2)
% legend(subplot(1, 3, 3), nova_ordem_subplot_3)


