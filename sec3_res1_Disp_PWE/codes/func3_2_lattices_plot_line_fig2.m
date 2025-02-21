function func3_2_lattices_plot_line_fig2 = lattices_dispersion(i_fi_f,i_ff_f)
%%
i_fi = i_fi_f;
i_ff = i_ff_f;
% Intervalos para Bandas em funcao do Numero de onda
i_bdi = 0;
i_bdf = 3;
%----------------------------------------------------------------------
% Load Data Curve FBGW (all Resonators (df = 1 Hz) with )
data_pwe_res_freq_s=csvread('1_0_a_0.1_h_0.002_lattice_square_all_data_res.csv');
data_pwe_res_freq_r=csvread('2_0_a_0.1_h_0.002_lattice_rectangular_all_data_res.csv');
data_pwe_res_freq_t=csvread('3_0_a_0.1_h_0.002_lattice_triangular_all_data_res.csv');
%
freq_res_base= [10:10:1000];
lattice_string = string({'s', 'r', 't'});
lattice_color = string({'m', 'b', 'c'});
lattice_type_line = string({'-', '-', '-'});
%lattice_type_line = string({':', '--', '-.'});
colorPalette = {
    '#EDB120', ...
    '#40E0D0', ...
    '#FA8072', ...
    '#CCCCFF', ...
    '#D95319', ...
    '#0072BD', ...
    '#4DBEEE'
    };
%----------------------------------------------------------------------
%%
cont_plot1 = 1;
cont_plot2 = 1;
cont_plot3 = 1;

for w = 2:2
    % Variavel para alocacao dos dados a serem exportados
    data_res = [];
    cont_sub_plot = 1;
    if w == 1
        sub_plot_freq = sort([freq_res_base,105]);
    elseif w == 2
        sub_plot_freq = sort([freq_res_base,99]);
    elseif w == 3
        sub_plot_freq = sort([freq_res_base,145]);
    end
    for z=1:101
        % Load Data PWE Resonator
        % Numberwave
        pwe_file_w_res = strcat(num2str(w),'_1_a_0.10_h_0.002_lattice_',lattice_string{w},'_res_',...
            num2str(sub_plot_freq(z)),'_pwe_w_data_full_path.csv');
        w_kk_pwe_res = csvread(pwe_file_w_res);
        % Frequency
        pwe_file_f_res = strcat(num2str(w),'_2_a_0.10_h_0.002_lattice_',lattice_string{w},'_res_',...
            num2str(sub_plot_freq(z)),'_pwe_f_data_full_path.csv');
        freq_pwe_res = csvread(pwe_file_f_res);
        %===================================================
        % Varredura para determinar a largura do Band Gap
        %===================================================
        % Coords Modo 1
        w_kk_1 = w_kk_pwe_res(1,:);
        % freq
        freq_1 = freq_pwe_res(1,:);
        %---------------------------------------------------------------------
        % Coords Modo 2
        % Num onda
        w_kk_2 = w_kk_pwe_res(2,:);
        % freq
        freq_2 = freq_pwe_res(2,:);
        %---------------------------------------------------------------------
        % Encontrar a menor distância entre os modos 1 e 2
        y1 = freq_pwe_res(1,:);
        y2 = freq_pwe_res(2,:);
        % Inicializar a menor distância com um valor grande
        minDist = Inf;
        minIndex1 = 0;
        minIndex2 = 0;
        % Loop para comparar todas as combinações de pontos
        for i = 1:length(y1)
            for j = 1:length(y2)
                % Calcula a distância entre os pontos
                distY = abs(y1(i) - y2(j));
                % Verifica se a distância atual é menor que a mínima distância encontrada até agora
                if distY < minDist
                    minDist = distY;
                    minIndex1 = i;
                    minIndex2 = j;
                end
            end
        end
        delta_f_gap = minDist;
        index10 =  minIndex1;
        index20 =  minIndex2;
        delta_f_gap;
        % Armazenando dados dos ressonadores locais
        data_res(cont_sub_plot,:) = [sub_plot_freq(z)  freq_1(index10) freq_2(index20) delta_f_gap];
        cont_sub_plot = cont_sub_plot + 1;
    end
    %%
    if w == 1
        data_pwe_res_freq = data_pwe_res_freq_s;
    elseif w == 2
        data_pwe_res_freq = data_pwe_res_freq_r;
    elseif w == 3
        data_pwe_res_freq = data_pwe_res_freq_t;
    end
    % Encontre o valor máximo da curva e sua posição
    [maximo, indice_maximo] = max(data_pwe_res_freq(:,6));
    %
    legendText3{cont_plot3} = ('Square Lattice - FBGW 1');
    cont_plot3 = cont_plot3 + 1;
    legendText3{cont_plot3} = sprintf('Max \\Deltaf_{12} = %.2f [Hz] in f_r = %d [Hz]',...
        data_pwe_res_freq(indice_maximo,6), data_pwe_res_freq(indice_maximo,3));
    cont_plot3 = cont_plot3 + 1;
    % Figura 2
    fig1 = figure(1);
    
    subplot(1,3,1)
    if w == 1
        legendText1{cont_plot1} = ('Square Lattice - FBGW 1 - Mode 1')
    elseif w == 2
        legendText1{cont_plot1} = ('Rectangular Lattice - FBGW 1 - Mode 1')
    elseif w == 3
        legendText1{cont_plot1} = ('Triangular Lattice - FBGW 1 - Mode 1')
    end
    box on
    hold on
    if w == 1
        plot(data_res(1:22,1),data_res(1:22,2),lattice_type_line{w},'Color',colorPalette{1},'LineWidth',4)
    elseif w == 2
        %plot(data_res(1:13,1),data_res(1:13,2),lattice_type_line{w},'Color',colorPalette{1},'LineWidth',4)
        plot(data_res(1:22,1),data_res(1:22,2),lattice_type_line{w},'Color',colorPalette{1},'LineWidth',4)
    elseif w == 3
        plot(data_res(:,1),data_res(:,2),lattice_type_line{w},'Color',colorPalette{1},'LineWidth',4)
    end
    if w == 1 || w ==  3
        line_color = {'k'}
    elseif w == 2
        line_color = {'r'}
    end
    if w == 2
    %scatter(data_res(1:13,1),data_res(1:13,2),80,'MarkerEdgeColor',line_color{1},'MarkerFaceColor',lattice_color{w},'LineWidth',1)
    scatter(data_res(1:16,1),data_res(1:16,2),80,'MarkerEdgeColor',line_color{1},'MarkerFaceColor',lattice_color{w},'LineWidth',1)
    else
    scatter(data_res(1:16,1),data_res(1:16,2),80,'MarkerEdgeColor',line_color{1},'MarkerFaceColor',lattice_color{w},'LineWidth',1)
    end
    grid on
    
    subplot(1,3,2)
    if w == 1
        legendText2{cont_plot2} = ('Square Lattice - FBGW 1 - Mode 2')
    elseif w == 2
        legendText2{cont_plot2} = ('Rectangular Lattice - FBGW 1 - Mode 2')
    elseif w == 3
        legendText2{cont_plot2} = ('Triangular Lattice - FBGW 1 - Mode 2')
    end
    box on
    hold on
    if w == 1
        plot(data_res(1:22,1),data_res(1:22,3),lattice_type_line{w},'Color',colorPalette{2},'LineWidth',4)
    elseif w == 2
        %plot(data_res(1:13,1),data_res(1:13,3),lattice_type_line{w},'Color',colorPalette{2},'LineWidth',4)
        plot(data_res(1:13,1),data_res(1:13,3),lattice_type_line{w},'Color',colorPalette{2},'LineWidth',4)
    elseif w == 3
        plot(data_res(:,1),data_res(:,3),lattice_type_line{w},'Color',colorPalette{2},'LineWidth',4)
    end
    if w == 1 || w ==  3
        line_color = {'k'}
    elseif w == 2
        line_color = {'r'}
    end
    if w == 2
    scatter(data_res(1:13,1),data_res(1:13,3),80,'MarkerEdgeColor',line_color{1},'MarkerFaceColor',lattice_color{w},'LineWidth',1)
    else
    scatter(data_res(1:16,1),data_res(1:16,3),80,'MarkerEdgeColor',line_color{1},'MarkerFaceColor',lattice_color{w},'LineWidth',1)
    end    
    xlim([0 200])
    grid on
    
    subplot(1,3,3)
    box on
    hold on
    plot(data_pwe_res_freq(:,3),data_pwe_res_freq(:,6),lattice_type_line{w},'Color',lattice_color{w},'LineWidth',4)
    if w == 1 || w ==  3
        line_color = {'k'}
    elseif w == 2
        line_color = {'r'}
    end
    if w == 2
    %scatter(data_res(1:13,1),data_res(1:13,4),80,'MarkerEdgeColor',line_color{1},'MarkerFaceColor',lattice_color{w},'LineWidth',1)
    scatter(data_res(1:16,1),data_res(1:16,4),80,'MarkerEdgeColor',line_color{1},'MarkerFaceColor',lattice_color{w},'LineWidth',1)
    else
    scatter(data_res(1:16,1),data_res(1:16,4),80,'MarkerEdgeColor',line_color{1},'MarkerFaceColor',lattice_color{w},'LineWidth',1)
    end
    grid on
    cont_plot1 = cont_plot1 +  1;
    cont_plot2 = cont_plot2 +  1;
end

fig1
subplot(1,3,1)
legend(legendText1)
set(legend,'FontSize',14);
set(gca,'fontSize',8,'fontweight','b')
xlabel('Resonator frequency [Hz]','fontsize',20,'fontweight','b')
ylabel('Lower edge frequency [Hz]','fontsize',25,'fontweight','b')
%     legend('Square Lattice (First FBGW) - Mode 1','Rectangular Lattice (First FBGW) - Mode 1',...
%         'Triangular Lattice (First FBGW) - Mode 1','fontSize',14,'fontweight','b')
%set(gca, 'XScale', 'log');
%set(gca, 'YScale', 'log');
set(gca,'fontSize',22,'fontweight','b')
if w == 1
    xlim([5 220])
elseif w == 2
    xlim([5 150])
elseif w == 3
    xlim([5 1e3])
end
if w == 1
    ylim([0 150])
elseif w == 2
    ylim([0 150])
elseif w == 3
    ylim([0 180])
end
grid on

subplot(1,3,2)
legend(legendText2)
set(legend,'FontSize',14);
set(gca,'fontSize',8,'fontweight','b')
xlabel('Resonator frequency [Hz]','fontsize',20,'fontweight','b')
ylabel('Upper edge frequency [Hz]','fontsize',25,'fontweight','b')
%     legend('Square Lattice (First FBGW) - Mode 2','Rectangular Lattice (First FBGW) - Mode 2',...
%         'Triangular Lattice (First FBGW) - Mode 2','fontSize',14,'fontweight','b')
%set(gca, 'XScale', 'log');
%set(gca, 'YScale', 'log');
set(gca,'fontSize',22,'fontweight','b')
if w == 1
    xlim([5 220])
elseif w == 2
    xlim([5 150])
elseif w == 3
    xlim([5 1e3])
end
if w == 1
    ylim([0 150])
elseif w == 2
    ylim([0 150])
elseif w == 3
    ylim([0 180])
end
grid on

subplot(1,3,3)
legend(legendText3)
set(legend,'FontSize',14);
set(gca,'fontSize',8,'fontweight','b')
xlabel('Resonator frequency [Hz]','fontsize',20,'fontweight','b')
ylabel('Full band gap width [Hz]','fontsize',20,'fontweight','b')
grid on
%set(gca, 'XScale', 'log');
%set(gca, 'YScale', 'log');
set(gca,'fontSize',22,'fontweight','b')
if w == 1
    xlim([5 220])
elseif w == 2
    xlim([5 220])
elseif w == 3
    xlim([5 1e3])
end
if w == 1
    ylim([0 40])
elseif w == 2
    ylim([0 30])
elseif w == 3
    ylim([0 70])
end

% % Give common xlabel, ylabel and title to your figure
% han=axes(fig2,'visible','off');
% han.Title.Visible='on';
% han.XLabel.Visible='on';
% han.YLabel.Visible='on';
% % Definindo o rotulo da figura
% label_file_res = sprintf('1_4_a_%g_h_%g_lattice_square_res',0.1,0.002);
% % Obtendo o caminho do diretorio acima do diretorio atual
% [pai, ~, ~] = fileparts(pwd);
% % Exportando figura com extensao .fig
% fig_12 = fullfile(strcat(pai,'\3_figs\figs_2'), [label_file_res, '.fig']);
% savefig(fig_12);
% % Exportando figura com extensao .eps
% fig2_eps = fullfile(strcat(pai,'\3_figs\figs_2'), [label_file_res, '.eps']);
% saveas(fig2,fig2_eps,'epsc');
% % Exportando figura com extensao .png
% fig2_png = fullfile(strcat(pai,'\3_figs\figs_2'), [label_file_res, '.png']);
% saveas(fig2,fig2_png,'png');
end