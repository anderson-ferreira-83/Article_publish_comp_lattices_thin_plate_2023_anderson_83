clear all
close all
clc
%%
current_pwd = pwd

f_lim_inf = 1
f_lim_sup = 300
% Strings das redes para nome dos arquivos
str_lat = {'square','rectangular','triangular','honeycomb','kagome'}
str_lat = string(str_lat);
% String das redes para legenda das figuras
str_lat_leg = {' square',' rectangular',' triangular',' honeycomb',' kagome'}
%
str_lat_leg1 = {' Square ',' Rectangular ',' Triangular ',' Honeycomb ',' Kagome '}
str_lat_leg1 = string(str_lat_leg1);
%
colorPalette_points = {
    '#1f77b4','#4DBEEE', '#ff7f0e', '#2ca02c', '#d62728', '#9467bd', ...
    '#8c564b','#A2142F', '#e377c2', '#7f7f7f', '#bcbd22', '#17becf', ...
    '#393b79','#77AC30', '#637939', '#8c6d31', '#843c39', '#7b4173'
    };
%%
intervalo = [1:5;6:10;11:15]
for r=1:3
    for j=1:5
        index_lat = j
        [path_full, R1_mp1, R1_mp2, R1_mp3, R2_mp1, R2_mp2, R2_mp3] = func6_read_mps(j)
        cd(current_pwd)
        % Cores das Redes dos measures point para comparacao em formato hexadecimal
        cor_original_hex = {'#fc0fc0','#0000ff','#00ffee','#ff1602','#16ff24'};
        % Converter cor hexadecimal para RGB
        cor_original_rgb = hex2rgb(cor_original_hex{index_lat})
        % Criar tons mais claros
        tons_mais_claros = zeros(3, 3)
        % Ajustar os valores dos canais RGB para criar tons mais claros
        for i = 1:3
            if i==1
                tons_mais_claros(i, :) = cor_original_rgb
            else
                tons_mais_claros(i, :) = cor_original_rgb + (1 - cor_original_rgb)*(i-1)*.05; % Aumentar os valores dos canais de cor
            end
        end
        figure(60)
        subplot(1,3,r)
        box on
        hold on
        if index_lat == 1 || index_lat == 2 || index_lat == 3
            plot(R1_mp1(intervalo(r,:),2),(R1_mp1(intervalo(r,:),3)),'-','Color',tons_mais_claros(1, :),'LineWidth',2.0)
            for i=intervalo(r,:)
                plot_T_res{i} = plot(R1_mp1(i,2),(R1_mp1(i,3)),'o','MarkerFaceColor',colorPalette_points{i},...
                    'MarkerEdgeColor','k','MarkerSize',12,'LineWidth',2)
            end
        elseif index_lat == 4
            box on
            hold on
            grid on
            plot(R1_mp1(intervalo(r,:),2),(R1_mp1(intervalo(r,:),3)),'-','Color',tons_mais_claros(1, :),'LineWidth',2.0)
            plot(R2_mp1(intervalo(r,:),2),(R2_mp1(intervalo(r,:),3)),':','Color',tons_mais_claros(1, :),'LineWidth',2.0)
            for i=intervalo(r,:)
                plot(R1_mp1(i,2),(R1_mp1(i,3)),'o','MarkerFaceColor',colorPalette_points{i},...
                    'MarkerEdgeColor','k','MarkerSize',12,'LineWidth',2)
                plot(R2_mp1(i,2),(R2_mp1(i,3)),'o','MarkerFaceColor',colorPalette_points{i},...
                    'MarkerEdgeColor','k','MarkerSize',12,'LineWidth',2)
            end
        elseif index_lat == 5
            box on
            hold on
            grid on
            plot(R1_mp1(intervalo(r,:),2),(R1_mp1(intervalo(r,:),3)),'-','Color',tons_mais_claros(1, :),'LineWidth',2.0)
            plot(R2_mp1(intervalo(r,:),2),(R2_mp1(intervalo(r,:),3)),':','Color',tons_mais_claros(1, :),'LineWidth',2.0)
            for i=intervalo(r,:)
                plot(R1_mp1(i,2),(R1_mp1(i,3)),'o','MarkerFaceColor',colorPalette_points{i},...
                    'MarkerEdgeColor','k','MarkerSize',12,'LineWidth',2)
                plot(R2_mp1(i,2),(R2_mp1(i,3)),'o','MarkerFaceColor',colorPalette_points{i},...
                    'MarkerEdgeColor','k','MarkerSize',12,'LineWidth',2)
            end
        end
        legend_strings{j} = sprintf('f_r = %g [Hz]',10*intervalo(r,j))
    end
    % Ativar o grid e configurar os espaçamentos
    grid on;
    grid minor; % Opcional: para espaçamentos menores
    % Configurar as propriedades do eixo atual (X e Y)
    ax = gca;  % Obtém o objeto do eixo atual
    % Configurar os espaçamentos do grid para o eixo X
    ax.XGrid = 'on';       % Ativa o grid no eixo X
    ax.XMinorGrid = 'on'; % Desativa o grid menor no eixo X
    % Configurar os espaçamentos do grid para o eixo Y
    ax.YGrid = 'on';       % Ativa o grid no eixo Y
    ax.YMinorGrid = 'on'; % Desativa o grid menor no eixo Y
    ylim([-320 50])
    if r==1
        xlabel('Frequency [Hz]','fontsize',22,'fontweight','b')
        ylabel('Receptance [dB re 1.0 m/N]','fontsize',22,'fontweight','b')
        %title(sprintf(strcat('Measure point %g - Region 1'),r),'fontsize',15)
        set(gca,'fontSize',18,'fontweight','b')
        set(legend,'Location','northeast','FontSize',10);
        legend([plot_T_res{:}], legend_strings);
        plot_T_res = {}
        legend_strings = {}
    else
        xlabel('Frequency [Hz]','fontsize',22,'fontweight','b')
        ylabel('Receptance [dB re 1.0 m/N]','fontsize',22,'fontweight','b')
        %title(sprintf(strcat('Measure point 1 - Region %g'),r),'fontsize',15)
        set(gca,'fontSize',18,'fontweight','b')
        set(legend,'Location','northeast','FontSize',10);
        legend([plot_T_res{:}], legend_strings);
        plot_T_res = {}
        legend_strings = {}
    end
end
% Configuração do tamanho A4 em paisagem
set(gcf, 'Units', 'centimeters');
pos = get(gcf, 'Position');
width = 29.7; % Largura do papel A4 em centímetros (modo paisagem)
height = 21; % Altura do papel A4 em centímetros (modo paisagem)
set(gcf, 'Position', [pos(1) pos(2) width height]);

name_fig = strcat('fig_',num2str(60),'_tr_comp_lattices_mp1_all_freqs')
file_fig = strcat(current_pwd, name_fig,'.fig');
cd(current_pwd)
savefig(60,file_fig);
file_eps = strcat(current_pwd, name_fig,'.eps');
saveas(60,file_eps,'epsc');
file_png = strcat(current_pwd, name_fig,'.png');
saveas(60,file_png);
%%
% 
% for r=1:3
%     for j=1:5
%         index_lat = j
%         [path_full, R1_mp1, R1_mp2, R1_mp3, R2_mp1, R2_mp2, R2_mp3] = func6_read_mps(j)
%         % Cores das Redes dos measures point para comparacao em formato hexadecimal
%         cor_original_hex = {'#fc0fc0','#0000ff','#00ffee','#16ff24','#ff1602'};
%         % Converter cor hexadecimal para RGB
%         cor_original_rgb = hex2rgb(cor_original_hex{index_lat})
%         % Criar tons mais claros
%         tons_mais_claros = zeros(3, 3)
%         % Ajustar os valores dos canais RGB para criar tons mais claros
%         for i = 1:3
%             if i==1
%                 tons_mais_claros(i, :) = cor_original_rgb
%             else
%                 tons_mais_claros(i, :) = cor_original_rgb + (1 - cor_original_rgb)*(i-1)*.05; % Aumentar os valores dos canais de cor
%             end
%         end
%         figure(70)
%         subplot(1,3,r)
%         box on
%         hold on
%         if index_lat == 1 || index_lat == 2 || index_lat == 3
%             plot(R1_mp2(intervalo(r,:),2),(R1_mp2(intervalo(r,:),3)),'-.','Color',tons_mais_claros(2, :),'LineWidth',2.0)
%             for i=intervalo(r,:)
%                 plot_T_res{i} = plot(R1_mp2(i,2),(R1_mp2(i,3)),'s','MarkerFaceColor',colorPalette_points{i},...
%                     'MarkerEdgeColor','k','MarkerSize',12,'LineWidth',2)
%             end
%         elseif index_lat == 4
%             box on
%             hold on
%             grid on
%             plot(R1_mp2(intervalo(r,:),2),(R1_mp2(intervalo(r,:),3)),'-.','Color',tons_mais_claros(2, :),'LineWidth',2.0)
%             plot(R2_mp2(intervalo(r,:),2),(R2_mp2(intervalo(r,:),3)),'-.','Color','#01A61D','LineWidth',2.0)
%             for i=intervalo(r,:)
%                 plot(R1_mp2(i,2),(R1_mp2(i,3)),'s','MarkerFaceColor',colorPalette_points{i},...
%                     'MarkerEdgeColor','k','MarkerSize',12,'LineWidth',2)
%                 plot(R2_mp2(i,2),(R2_mp2(i,3)),'s','MarkerFaceColor',colorPalette_points{i},...
%                     'MarkerEdgeColor','k','MarkerSize',12,'LineWidth',2)
%             end
%         elseif index_lat == 5
%             box on
%             hold on
%             grid on
%             plot(R1_mp2(intervalo(r,:),2),(R1_mp2(intervalo(r,:),3)),'-.','Color',tons_mais_claros(2, :),'LineWidth',2.0)
%             plot(R2_mp2(intervalo(r,:),2),(R2_mp2(intervalo(r,:),3)),'-.','Color','#FA8D02','LineWidth',2.0)
%             for i=intervalo(r,:)
%                 plot(R1_mp2(i,2),(R1_mp2(i,3)),'s','MarkerFaceColor',colorPalette_points{i},...
%                     'MarkerEdgeColor','k','MarkerSize',12,'LineWidth',2)
%                 plot(R2_mp2(i,2),(R2_mp2(i,3)),'s','MarkerFaceColor',colorPalette_points{i},...
%                     'MarkerEdgeColor','k','MarkerSize',12,'LineWidth',2)
%             end
%         end
%         cd(current_pwd)
%         legend_strings{j} = sprintf('f_r = %g [Hz]',10*intervalo(r,j))
%     end
%     % Ativar o grid e configurar os espaçamentos
%     grid on;
%     grid minor; % Opcional: para espaçamentos menores
%     % Configurar as propriedades do eixo atual (X e Y)
%     ax = gca;  % Obtém o objeto do eixo atual
%     % Configurar os espaçamentos do grid para o eixo X
%     ax.XGrid = 'on';       % Ativa o grid no eixo X
%     ax.XMinorGrid = 'on'; % Desativa o grid menor no eixo X
%     % Configurar os espaçamentos do grid para o eixo Y
%     ax.YGrid = 'on';       % Ativa o grid no eixo Y
%     ax.YMinorGrid = 'on'; % Desativa o grid menor no eixo Y
%     ylim([-220 50])
%     if r ==1
%         xlabel('Frequency [Hz]','fontsize',22,'fontweight','b')
%         ylabel('Receptance [dB re 1.0 m/N]','fontsize',22,'fontweight','b')
%         %title(sprintf(strcat('Measure point 2 - Region %g'),r),'fontsize',15)
%         set(gca,'fontSize',18,'fontweight','b')
%         legend([plot_T_res{:}], legend_strings);
%         set(legend,'Location','northeast','FontSize',10);
%         plot_T_res = {}
%         legend_strings = {}
%     else
%         xlabel('Frequency [Hz]','fontsize',22,'fontweight','b')
%         ylabel('Receptance [dB re 1.0 m/N]','fontsize',22,'fontweight','b')
%         %title(sprintf(strcat('Measure point 2 - Region %g'),r),'fontsize',15)
%         set(gca,'fontSize',18,'fontweight','b')
%         legend([plot_T_res{:}], legend_strings);
%         set(legend,'Location','northeast','FontSize',10);
%         plot_T_res = {}
%         legend_strings = {}
%     end
% end
% %%
% % Configuração do tamanho A4 em paisagem
% set(gcf, 'Units', 'centimeters');
% pos = get(gcf, 'Position');
% width = 29.7; % Largura do papel A4 em centímetros (modo paisagem)
% height = 21; % Altura do papel A4 em centímetros (modo paisagem)
% set(gcf, 'Position', [pos(1) pos(2) width height]);
% 
% name_fig = strcat('fig_',num2str(70),'_tr_comp_lattices_mp2_all_freqs')
% file_fig = strcat(current_pwd, name_fig,'.fig');
% cd(current_pwd)
% savefig(70,file_fig);
% file_eps = strcat(current_pwd, name_fig,'.eps');
% saveas(70,file_eps,'epsc');
% file_png = strcat(current_pwd, name_fig,'.png');
% saveas(70,file_png);
% for r=1:3
%     for j=1:5
%         index_lat = j
%         [path_full, R1_mp1, R1_mp2, R1_mp3, R2_mp1, R2_mp2, R2_mp3] = func6_read_mps(j)
%         % Cores das Redes dos measures point para comparacao em formato hexadecimal
%         cor_original_hex = {'#fc0fc0','#0000ff','#00ffee','#16ff24','#ff1602'};
%         % Converter cor hexadecimal para RGB
%         cor_original_rgb = hex2rgb(cor_original_hex{index_lat})
%         % Criar tons mais claros
%         tons_mais_claros = zeros(3,3)
%         % Ajustar os valores dos canais RGB para criar tons mais claros
%         for i = 1:3
%             if i==1
%                 tons_mais_claros(i, :) = cor_original_rgb
%             else
%                 tons_mais_claros(i, :) = cor_original_rgb + (1 - cor_original_rgb)*(i-1)*.05; % Aumentar os valores dos canais de cor
%             end
%         end
%         figure(80)
%         subplot(1,3,r)
%         box on
%         hold on
%         if index_lat == 1 || index_lat == 2 || index_lat == 3
%             plot(R1_mp3(intervalo(r,:),2),(R1_mp3(intervalo(r,:),3)),'--','Color',tons_mais_claros(2, :),'LineWidth',2.0)
%             for i=intervalo(r,:)
%                 plot_T_res{i} = plot(R1_mp3(i,2),(R1_mp3(i,3)),'d','MarkerFaceColor',colorPalette_points{i},...
%                     'MarkerEdgeColor','k','MarkerSize',12,'LineWidth',2)
%             end
%         elseif index_lat == 4
%             box on
%             hold on
%             grid on
%             plot(R1_mp3(intervalo(r,:),2),(R1_mp3(intervalo(r,:),3)),'--','Color',tons_mais_claros(2, :),'LineWidth',2.0)
%             plot(R2_mp3(intervalo(r,:),2),(R2_mp3(intervalo(r,:),3)),'--','Color','#01A61D','LineWidth',2.0)
%             for i=intervalo(r,:)
%                 plot(R1_mp3(i,2),(R1_mp3(i,3)),'d','MarkerFaceColor',colorPalette_points{i},...
%                     'MarkerEdgeColor','k','MarkerSize',12,'LineWidth',2)
%                 plot(R2_mp3(i,2),(R2_mp3(i,3)),'d','MarkerFaceColor',colorPalette_points{i},...
%                     'MarkerEdgeColor','k','MarkerSize',12,'LineWidth',2)
%             end
%         elseif index_lat == 5
%             box on
%             hold on
%             grid on
%             plot(R1_mp3(intervalo(r,:),2),(R1_mp3(intervalo(r,:),3)),'--','Color',tons_mais_claros(2, :),'LineWidth',2.0)
%             plot(R2_mp3(intervalo(r,:),2),(R2_mp3(intervalo(r,:),3)),'--','Color','#FA8D02','LineWidth',2.0)
%             for i=intervalo(r,:)
%                 plot(R1_mp3(i,2),(R1_mp3(i,3)),'d','MarkerFaceColor',colorPalette_points{i},...
%                     'MarkerEdgeColor','k','MarkerSize',12,'LineWidth',2)
%                 plot(R2_mp3(i,2),(R2_mp3(i,3)),'d','MarkerFaceColor',colorPalette_points{i},...
%                     'MarkerEdgeColor','k','MarkerSize',12,'LineWidth',2)
%             end
%         end
%         cd(current_pwd)
%         legend_strings{j} = sprintf('f_r = %g [Hz]',10*intervalo(r,j))
%     end
%     % Ativar o grid e configurar os espaçamentos
%     grid on;
%     grid minor; % Opcional: para espaçamentos menores
%     % Configurar as propriedades do eixo atual (X e Y)
%     ax = gca;  % Obtém o objeto do eixo atual
%     % Configurar os espaçamentos do grid para o eixo X
%     ax.XGrid = 'on';       % Ativa o grid no eixo X
%     ax.XMinorGrid = 'on'; % Desativa o grid menor no eixo X
%     % Configurar os espaçamentos do grid para o eixo Y
%     ax.YGrid = 'on';       % Ativa o grid no eixo Y
%     ax.YMinorGrid = 'on'; % Desativa o grid menor no eixo Y
%     ylim([-200 50])
%     if r==1
%         xlabel('Frequency [Hz]','fontsize',22,'fontweight','b')
%         ylabel('Receptance [dB re 1.0 m/N]','fontsize',22,'fontweight','b')
%         %title(sprintf(strcat('Measure point 3 - Region %g'),r),'fontsize',15)
%         set(gca,'fontSize',18,'fontweight','b')
%         legend([plot_T_res{:}], legend_strings);
%         set(legend,'Location','northeast','FontSize',10);
%         plot_T_res = {}
%         legend_strings = {}
%     end
%     xlabel('Frequency [Hz]','fontsize',22,'fontweight','b')
%     ylabel('Receptance [dB re 1.0 m/N]','fontsize',22,'fontweight','b')
%     %title(sprintf(strcat('Measure point 3 - Region %g'),r),'fontsize',15)
%     set(gca,'fontSize',18,'fontweight','b')
%     legend([plot_T_res{:}], legend_strings);
%     set(legend,'Location','northeast','FontSize',10);
%     plot_T_res = {}
%     legend_strings = {}
% end
% % Configuração do tamanho A4 em paisagem
% set(gcf, 'Units', 'centimeters');
% pos = get(gcf, 'Position');
% width = 29.7; % Largura do papel A4 em centímetros (modo paisagem)
% height = 21; % Altura do papel A4 em centímetros (modo paisagem)
% set(gcf, 'Position', [pos(1) pos(2) width height]);
% 
% name_fig = strcat('fig_',num2str(80),'_tr_comp_lattices_mp3_all_freqs')
% file_fig = strcat(current_pwd, name_fig,'.fig');
% cd(current_pwd)
% savefig(80,file_fig);
% file_eps = strcat(current_pwd, name_fig,'.eps');
% saveas(80,file_eps,'epsc');
% file_png = strcat(current_pwd, name_fig,'.png');
% saveas(80,file_png);
%%
h = figure(60)
%     figure(70),...
%     figure(80)
%];
set(h, 'WindowStyle', 'Docked');