function func3_4_lattices_plot_line_fig2 = lattices_dispersion(i_fi_f,i_ff_f)
%%
i_fi = i_fi_f;
i_ff = i_ff_f;
%----------------------------------------------------------------------
% Load Data Curve FBGW (all Resonators (df = 1 Hz) with )
data_pwe_res_freq_s=csvread('1_0_a_0.1_h_0.002_lattice_square_all_data_res.csv');
data_pwe_res_freq_r=csvread('2_0_a_0.1_h_0.002_lattice_rectangular_all_data_res.csv');
data_pwe_res_freq_t=csvread('3_0_a_0.1_h_0.002_lattice_triangular_all_data_res.csv');
data_pwe_res_freq_h=csvread('4_0_a_0.1_h_0.002_lattice_hexagonal_all_data_res.csv');
data_pwe_res_freq_k=csvread('5_0_a_0.1_h_0.002_lattice_kagome_all_data_res.csv');
%
freq_res_base= 10:10:1000;
lattice_string = string({'s','r','t','h','k'});
lattice_color = string({'m','b','c','r','g'});
lattice_type_line = string({'-','-','-','-','-'});
%----------------------------------------------------------------------
%%
cont_plot1 = 1;
cont_plot2 = 1;
for w=1:3
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
    if w == 1
        legendText1{cont_plot1} = ('Square Lattice in First FBGW - Mode 1');
        legendText2{cont_plot1} = ('Square Lattice in First FBGW - Mode 2');
    elseif w == 2
        legendText1{cont_plot1} = ('Rectangular Lattice in First FBGW - Mode 1');
        legendText2{cont_plot1} = ('Rectangular Lattice in First FBGW - Mode 2');
    elseif w == 3
        legendText1{cont_plot1} = ('Triangular Lattice in First FBGW - Mode 1');
        legendText2{cont_plot1} = ('Triangular Lattice in First FBGW - Mode 2');
    end
    cont_plot1 = cont_plot1 + 1
    %
    if w == 1
        legendText3{cont_plot2} = ('Square Lattice - FBGW 1');
    elseif w == 2
        legendText3{cont_plot2} = ('Triangular Lattice - FBGW 1');
    elseif w == 3
        legendText3{cont_plot2} = ('Rectangular Lattice - FBGW 1');
    end        
    cont_plot2 = cont_plot2 + 1;
    legendText3{cont_plot2} = sprintf('Max \\Deltaf_{12} = %.2f [Hz] in f_r = %d [Hz]',...
        data_pwe_res_freq(indice_maximo,6), data_pwe_res_freq(indice_maximo,3));
    cont_plot2 = cont_plot2 + 1;
    % Figura 1
    fig1 = figure(1);
    subplot(1,2,1)
    box on
    hold on
    if w == 1
    plot(data_res(1:22,1),data_res(1:22,2),lattice_type_line{w},'Color',lattice_color{w},'LineWidth',2)
    elseif w == 2
    plot(data_res(1:12,1),data_res(1:12,2),lattice_type_line{w},'Color',lattice_color{w},'LineWidth',2)
    elseif w == 3
    plot(data_res(:,1),data_res(:,2),lattice_type_line{w},'Color',lattice_color{w},'LineWidth',2)
    end
    grid on
    
    subplot(1,2,2)
    box on
    hold on
    if w == 1
    plot(data_res(1:22,1),data_res(1:22,3),lattice_type_line{w},'Color',lattice_color{w},'LineWidth',2)
    elseif w == 2
    plot(data_res(1:12,1),data_res(1:12,3),lattice_type_line{w},'Color',lattice_color{w},'LineWidth',2)
    elseif w == 3
    plot(data_res(:,1),data_res(:,3),lattice_type_line{w},'Color',lattice_color{w},'LineWidth',2)
    end
    grid on
    
    % Figura 2
    fig2 = figure(2);
    subplot(1,2,1)
    box on
    hold on
    plot(data_pwe_res_freq(:,3),data_pwe_res_freq(:,6),lattice_type_line{w},'Color',lattice_color{w},'LineWidth',2)
    scatter(data_pwe_res_freq(indice_maximo,3),data_pwe_res_freq(indice_maximo,6),...
        120,'MarkerEdgeColor','k','MarkerFaceColor',lattice_color{w},'LineWidth',2)
    grid on
end
%%
for w=4:5
    % Variavel para alocacao dos dados a serem exportados
    data_res = [];
    cont_sub_plot = 1;
    if w == 4
        sub_plot_freq = sort([freq_res_base,37,59]);
    elseif w == 5
        sub_plot_freq = sort([freq_res_base,35,101]);
    end
    for z=1:102
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
        % Coords Modo 3
        % Num onda
        w_kk_3 = w_kk_pwe_res(3,:);
        % freq
        freq_3 = freq_pwe_res(3,:);
        %---------------------------------------------------------------------
        % Coords Modo 4
        % Num onda
        w_kk_4 = w_kk_pwe_res(4,:);
        % freq
        freq_4 = freq_pwe_res(4,:);
        %---------------------------------------------------------------------
        if w == 5
            % Coords Modo 5
            % Num onda
            w_kk_5 = w_kk_pwe_res(5,:);
            % freq
            freq_5 = freq_pwe_res(5,:);
        end
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
        delta_f_gap0 = minDist;
        index10 =  minIndex1;
        index20 =  minIndex2;
        % Encontrar a menor distância entre os modos 2 e 3
        y1 = freq_pwe_res(2,:);
        y2 = freq_pwe_res(3,:);
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
        delta_f_gap1 = minDist;
        index11 =  minIndex1;
        index21 =  minIndex2;
        % Encontrar a menor distância entre os modos 3 e 4
        y1 = freq_pwe_res(3,:);
        y2 = freq_pwe_res(4,:);
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
        delta_f_gap2 = minDist;
        index12 =  minIndex1;
        index22 = minIndex2;
        if w == 5
            % Encontrar a menor distância entre os modos 4 e 5
            y1 = freq_pwe_res(4,:);
            y2 = freq_pwe_res(5,:);
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
            delta_f_gap3 = minDist;
            index13 =  minIndex1;
            index23 =  minIndex2;
        end
        %%
        if w == 4
            data_res(cont_sub_plot,:) = [sub_plot_freq(z)...
                freq_2(index11) freq_3(index21) delta_f_gap1...
                freq_3(index12) freq_4(index22) delta_f_gap2];
        elseif w == 5
            data_res(cont_sub_plot,:) = [sub_plot_freq(z)...
                freq_3(index12) freq_4(index22) delta_f_gap2...
                freq_4(index13) freq_5(index23) delta_f_gap3];
        end
        cont_sub_plot = cont_sub_plot + 1;
    end
    %%
    if w == 4
        data_pwe_res_freq = data_pwe_res_freq_h;
        % Modos 2 e 3
        % Encontre o valor máximo da curva e sua posição
        legendText1{cont_plot1} = ('Honeycomb Lattice in First FBGW - Mode 2');
        legendText2{cont_plot1} = ('Honeycomb Lattice in First FBGW - Mode 3');
        cont_plot1 = cont_plot1 + 1;
        [maximo1, indice_maximo1] = max(data_pwe_res_freq(:,9));
        legendText3{cont_plot2} = ('Honeycomb Lattice - FBGW 1');
        cont_plot2 = cont_plot2 + 1;
        legendText3{cont_plot2} = sprintf('Max \\Deltaf_{23} = %.2f [Hz] in f_r = %d [Hz]',...
            data_pwe_res_freq(indice_maximo1,9), data_pwe_res_freq(indice_maximo1,3));
        cont_plot2 = cont_plot2 + 1;
        % Modos 3 e 4
        % Encontre o valor máximo da curva e sua posição
        legendText1{cont_plot1} = ('Honeycomb Lattice in Second FBGW - Mode 3');
        legendText2{cont_plot1} = ('Honeycomb Lattice in Second FBGW - Mode 4');
        [maximo2, indice_maximo2] = max(data_pwe_res_freq(:,12));
        legendText3{cont_plot2} = ('Honeycomb Lattice - FBGW 2');
        cont_plot2 = cont_plot2 + 1;
        legendText3{cont_plot2} = sprintf('Max \\Deltaf_{34} = %.2f [Hz] in f_r = %d [Hz]',...
            data_pwe_res_freq(indice_maximo2,12), data_pwe_res_freq(indice_maximo2,3));
        cont_plot2 = cont_plot2 + 1;
    elseif w == 5
        data_pwe_res_freq = data_pwe_res_freq_k;
        legendText1{cont_plot1} = ('Kagome Lattice in First FBGW - Mode 3');
        legendText2{cont_plot1} = ('Kagome Lattice in First FBGW - Mode 4');
        cont_plot1 = cont_plot1 + 1;
        % Modos 3 e 4
        % Encontre o valor máximo da curva e sua posição
        [maximo1, indice_maximo1] = max(data_pwe_res_freq(:,12));
        legendText3{cont_plot2} = ('Kagome Lattice - FBGW 1');
        cont_plot2 = cont_plot2 + 1;
        legendText3{cont_plot2} = sprintf('Max \\Deltaf_{34} = %.2f [Hz] in fr = %d [Hz]',...
            data_pwe_res_freq(indice_maximo1,12), data_pwe_res_freq(indice_maximo1,3));
        cont_plot2 = cont_plot2 + 1;        
        % Modos 4 e 5
        % Encontre o valor máximo da curva e sua posição
        legendText1{cont_plot1} = ('Kagome Lattice in Second FBGW - Mode 4');
        legendText2{cont_plot1} = ('Kagome Lattice in Second FBGW - Mode 5');
        [maximo2, indice_maximo2] = max(data_pwe_res_freq(:,15));
        legendText3{cont_plot2} = ('Kagome Lattice - FBGW 2');
        cont_plot2 = cont_plot2 + 1;
        legendText3{cont_plot2} = sprintf('Max \\Deltaf_{45} = %.2f [Hz] in f_r = %d [Hz]',...
            data_pwe_res_freq(indice_maximo2,15), data_pwe_res_freq(indice_maximo2,3));
        cont_plot2 = cont_plot2 + 1;       
    end
    cont_plot1 = cont_plot1 + 1;
    % Figura 1
    fig1 = figure(1);
    subplot(1,2,1)
    if w == 4
    plot(data_res(1:8,1),data_res(1:8,2),lattice_type_line{w},'Color',lattice_color{w},'LineWidth',2)
    elseif w == 5
    plot(data_res(1:10,1),data_res(1:10,2),lattice_type_line{w},'Color',lattice_color{w},'LineWidth',2)
    end
    %
    subplot(1,2,2)
    if w == 4
    plot(data_res(1:8,1),data_res(1:8,2),lattice_type_line{w},'Color',lattice_color{w},'LineWidth',2)
    elseif w == 5
    plot(data_res(1:10,1),data_res(1:10,2),lattice_type_line{w},'Color',lattice_color{w},'LineWidth',2)
    end
    
    % Figura 2
    fig2 = figure(2);
    subplot(1,2,1)
    box on
    hold on
    if w == 4
        plot(data_pwe_res_freq(:,3),data_pwe_res_freq(:,9),lattice_type_line{w},'Color',lattice_color{w},'LineWidth',2)
        scatter(data_pwe_res_freq(indice_maximo1,3),data_pwe_res_freq(indice_maximo1,9),...
            120,'MarkerEdgeColor','k','MarkerFaceColor',lattice_color{w},'LineWidth',2)
    elseif w ==5
        plot(data_pwe_res_freq(:,3),data_pwe_res_freq(:,12),lattice_type_line{w},'Color',lattice_color{w},'LineWidth',2)
        scatter(data_pwe_res_freq(indice_maximo1,3),data_pwe_res_freq(indice_maximo1,12),...
            120,'MarkerEdgeColor','k','MarkerFaceColor',lattice_color{w},'LineWidth',2)
        grid on
    end
    % Figura 1
    fig1 = figure(1);
    subplot(1,2,1)
    box on
    hold on
    if w == 4
    plot(data_res(1:8,1),data_res(1:8,5),'--','Color',lattice_color{w},'LineWidth',2)    
    elseif w == 5
    plot(data_res(1:10,1),data_res(1:10,5),'--','Color',lattice_color{w},'LineWidth',2)    
    end
    grid on
    
    subplot(1,2,2)
    box on
    hold on
    if w == 4
    plot(data_res(1:8,1),data_res(1:8,6),'--','Color',lattice_color{w},'LineWidth',2)   
    elseif w == 5
    plot(data_res(1:10,1),data_res(1:10,6),'--','Color',lattice_color{w},'LineWidth',2)
    end
    grid on
    % Figura 2
    fig2 = figure(2);
    subplot(1,2,1)
    box on
    hold on
    if w == 4
        plot(data_pwe_res_freq(:,3),data_pwe_res_freq(:,12),'--','Color',lattice_color{w},'LineWidth',2)
        scatter(data_pwe_res_freq(indice_maximo2,3),data_pwe_res_freq(indice_maximo2,12),...
            120,'MarkerEdgeColor','k','MarkerFaceColor',lattice_color{w},'LineWidth',2)
        grid on
    elseif  w == 5
        plot(data_pwe_res_freq(:,3),data_pwe_res_freq(:,15),'--','Color',lattice_color{w},'LineWidth',2)
        scatter(data_pwe_res_freq(indice_maximo2,3),data_pwe_res_freq(indice_maximo2,15),...
            120,'MarkerEdgeColor','k','MarkerFaceColor',lattice_color{w},'LineWidth',2)
        grid on
    end
end

cont_plot1
figure(1)
subplot(1,2,1)
legend(legendText1)
set(legend,'FontSize',14);
xlabel('Resonator frequency [Hz]','fontsize',20,'fontweight','b')
ylabel('Lower edge frequency [Hz]','fontsize',25,'fontweight','b')
set(gca, 'XScale', 'log');
set(gca, 'YScale', 'log');
set(gca,'fontSize',22,'fontweight','b')
xlim([10 1e3])
ylim([5 200])
grid on

subplot(1,2,2)
legend(legendText2)
set(legend,'FontSize',14);
xlabel('Resonator frequency [Hz]','fontsize',20,'fontweight','b')
ylabel('Upper edge frequency [Hz]','fontsize',25,'fontweight','b')
set(gca, 'XScale', 'log');
set(gca, 'YScale', 'log');
set(gca,'fontSize',22,'fontweight','b')
xlim([10 1e3])
ylim([5 200])
grid on
%%
figure(2)
subplot(1,2,1)
legend(legendText3)
set(legend,'FontSize',14);
xlabel('Resonator frequency [Hz]','fontsize',20,'fontweight','b')
ylabel('Full band gap width (FBGW) [Hz]','fontsize',20,'fontweight','b')
set(gca, 'XScale', 'log');
set(gca, 'YScale', 'log');
set(gca,'fontSize',22,'fontweight','b')
xlim([10 1e3])
ylim([1 70])
grid on

h=[figure(1), figure(2)];
set(h, 'WindowStyle', 'Docked');
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