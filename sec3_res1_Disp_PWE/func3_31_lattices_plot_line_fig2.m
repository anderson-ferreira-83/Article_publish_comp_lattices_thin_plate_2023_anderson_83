function func3_3_lattices_plot_line_fig2 = lattices_dispersion(i_fi_f,i_ff_f)
%%
i_fi = i_fi_f;
i_ff = i_ff_f;
% Intervalos para Bandas em funcao do Numero de onda
i_bdi = 0;
i_bdf = 3;
%----------------------------------------------------------------------
% Load Data Curve FBGW (all Resonators (df = 1 Hz) with )
data_pwe_res_freq_h=csvread('4_0_a_0.1_h_0.002_lattice_hexagonal_all_data_res.csv');
data_pwe_res_freq_k=csvread('5_0_a_0.1_h_0.002_lattice_kagome_all_data_res.csv');
%
freq_res_base= [10:10:1000];
lattice_string = string({'s','r','t','h','k'});
lattice_color = string({'m','b','c','r','g'});
lattice_type_line = string({'-','-','-','-','-'});
%lattice_type_line = string({'-',':','-.','--','-.'});
%----------------------------------------------------------------------
colorPalette = {
    '#EDB120', ...
    '#40E0D0', ...
    '#FA8072', ...
    '#CCCCFF', ...
    '#D95319', ...
    '#0072BD', ...
    '#4DBEEE'
    };
%%
cont_plot1 = 1;
cont_plot2 = 1;
cont_plot31 = 1;
cont_plot32 = 1;

for w = 4:4
    % Variavel para alocacao dos dados a serem exportados
    data_res = [];
    cont_sub_plot = 1;
    if w == 4
        sub_plot_freq = sort([freq_res_base,59,137]);
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
        elseif w==5
            data_res(cont_sub_plot,:) = [sub_plot_freq(z)...
                freq_3(index12) freq_4(index22) delta_f_gap2...
                freq_4(index13) freq_5(index23) delta_f_gap3];
        end
        cont_sub_plot = cont_sub_plot + 1;
    end
    %%
    if w == 4
        data_pwe_res_freq = data_pwe_res_freq_h;
    elseif w == 5
        data_pwe_res_freq = data_pwe_res_freq_k;
    end
    
    if w == 4
        % Modos 2 e 3
        % Encontre o valor máximo da curva e sua posição
        [maximo1, indice_maximo1] = max(data_pwe_res_freq(:,9));
        legendText31{cont_plot31} = ('Hexagonal Lattice - FBGW 1');
        cont_plot31 = cont_plot31 + 1;
        legendText31{cont_plot31} = sprintf('Max \\Deltaf_{23} = %.2f [Hz] in f_r = %d [Hz]',...
            data_pwe_res_freq(indice_maximo1,9), data_pwe_res_freq(indice_maximo1,3));
        cont_plot31 = cont_plot31 + 1;
    elseif w == 5
        [maximo1, indice_maximo1] = max(data_pwe_res_freq(:,12));
        legendText31{cont_plot31} = ('Kagome Lattice - FBGW 1');
        cont_plot31 = cont_plot31 + 1;
        legendText31{cont_plot31} = sprintf('Max \\Deltaf_{34} = %.2f [Hz] in fr = %d [Hz]',...
            data_pwe_res_freq(indice_maximo1,12), data_pwe_res_freq(indice_maximo1,3));
        cont_plot31 = cont_plot31 + 1;
    end
    if w == 4
        % Modos 3 e 4
        % Encontre o valor máximo da curva e sua posição
        [maximo2, indice_maximo2] = max(data_pwe_res_freq(:,12));
        legendText32{cont_plot32} = ('Hexagonal Lattice - FBGW 2');
        cont_plot32 = cont_plot32 + 1;
        legendText32{cont_plot32} = sprintf('Max \\Deltaf_{34} = %.2f [Hz] in f_r = %d [Hz]',...
            data_pwe_res_freq(indice_maximo2,12), data_pwe_res_freq(indice_maximo2,3));
        cont_plot32 = cont_plot32 + 1;
    elseif w == 5
        [maximo2, indice_maximo2] = max(data_pwe_res_freq(:,15));
        legendText32{cont_plot32} = ('Kagome Lattice - FBGW 2');
        cont_plot32 = cont_plot32 + 1;
        legendText32{cont_plot32} = sprintf('Max \\Deltaf_{45} = %.2f [Hz] in f_r = %d [Hz]',...
            data_pwe_res_freq(indice_maximo2,15), data_pwe_res_freq(indice_maximo2,3));
        cont_plot32 = cont_plot32 + 1;
    end
    % Figura 1
    fig2 = figure(2);
    subplot(1,3,1)
    if w == 4
        legendText11{cont_plot1} = ('Hexagonal Lattice - FBGW 1 - Mode 2')
    elseif w == 5
        legendText11{cont_plot1} = ('Kagome Lattice - FBGW 1 - Mode 3')
    end
    box on
    hold on
    if w == 4
    plot(data_res(1:16,1),data_res(1:16,2),lattice_type_line{w},'Color',colorPalette{2},'LineWidth',3)
    elseif w == 5
    plot(data_res(1:16,1),data_res(1:16,2),lattice_type_line{w},'Color',colorPalette{3},'LineWidth',3)    
    end
    if w == 4
    scatter(data_res(1:16,1),data_res(1:16,2),80,'MarkerEdgeColor','k','MarkerFaceColor',lattice_color{w},'LineWidth',1)
    elseif w == 5
    scatter(data_res(1:16,1),data_res(1:16,2),80,'MarkerEdgeColor','k','MarkerFaceColor',lattice_color{w},'LineWidth',1)
    end
    grid on
    
    subplot(1,3,2)
    if w == 4
        legendText21{cont_plot2} = ('Hexagonal Lattice - FBGW 1 - Mode 3')
    elseif w == 5
        legendText21{cont_plot2} = ('Kagome Lattice - FBGW 1 - Mode 4')
    end
    box on
    hold on
    if w == 4
    plot(data_res(1:16,1),data_res(1:16,3),lattice_type_line{w},'Color',colorPalette{3},'LineWidth',3)
    elseif w == 5
    plot(data_res(1:16,1),data_res(1:16,3),lattice_type_line{w},'Color',colorPalette{4},'LineWidth',3)    
    end  
    if w == 4
    scatter(data_res(1:16,1),data_res(1:16,3),80,'MarkerEdgeColor','k','MarkerFaceColor',lattice_color{w},'LineWidth',1)
    elseif w == 5
    scatter(data_res(1:16,1),data_res(1:16,3),80,'MarkerEdgeColor','k','MarkerFaceColor',lattice_color{w},'LineWidth',1)
    end
    grid on
    
    subplot(1,3,3)
    box on
    hold on
    if w == 4
        plot(data_pwe_res_freq(:,3),data_pwe_res_freq(:,9),lattice_type_line{w},'Color',lattice_color{w},'LineWidth',3)
        scatter(data_res(1:16,1),data_res(1:16,4),80,'MarkerEdgeColor','k','MarkerFaceColor',lattice_color{w},'LineWidth',1)
    elseif w ==5
        plot(data_pwe_res_freq(:,3),data_pwe_res_freq(:,12),lattice_type_line{w},'Color',lattice_color{w},'LineWidth',3)
        scatter(data_res(1:16,1),data_res(1:16,4),80,'MarkerEdgeColor','k','MarkerFaceColor',lattice_color{w},'LineWidth',1)
        grid on
    end
    
    % Figura 2
    %fig3 = figure(3);
    subplot(1,3,1)
    if w == 4
        legendText11{cont_plot1+1} = ('Hexagonal Lattice - FBGW 2 - Mode 3')
    elseif w == 5
        legendText11{cont_plot1+1} = ('Kagome Lattice - FBGW 2 - Mode 4')
    end
    box on
    hold on
    if w == 4
    plot(data_res(1:30,1),data_res(1:30,5),'--','Color',colorPalette{3},'LineWidth',3)
    elseif w == 5
    plot(data_res(:,1),data_res(:,5),'--','Color',colorPalette{4},'LineWidth',3)
    end
    if w == 4
    scatter(data_res(1:16,1),data_res(1:16,5),80,'MarkerEdgeColor','k','MarkerFaceColor',lattice_color{w},'LineWidth',1)
    elseif w == 5
    scatter(data_res(1:16,1),data_res(1:16,5),80,'MarkerEdgeColor','k','MarkerFaceColor',lattice_color{w},'LineWidth',1)
    end
    grid on
    
    subplot(1,3,2)
    if w == 4
        legendText21{cont_plot2+1} = ('Hexagonal Lattice - FBGW 2 - Mode 4')
    elseif w == 5
        legendText21{cont_plot2+1} = ('Kagome Lattice - FBGW 2 - Mode 5')
    end
    box on
    hold on
    if w == 4
    plot(data_res(1:30,1),data_res(1:30,6),'--','Color',colorPalette{4},'LineWidth',3)
    elseif w == 5
    plot(data_res(1:32,1),data_res(1:32,6),'--','Color',colorPalette{5},'LineWidth',3)
    end
    if w == 4
    scatter(data_res(1:16,1),data_res(1:16,6),80,'MarkerEdgeColor','k','MarkerFaceColor',lattice_color{w},'LineWidth',1)
    elseif w == 5
    scatter(data_res(1:16,1),data_res(1:16,6),80,'MarkerEdgeColor','k','MarkerFaceColor',lattice_color{w},'LineWidth',1)
    end
    grid on
    
    subplot(1,3,3)
    box on
    hold on
    if w == 4
        plot(data_pwe_res_freq(:,3),data_pwe_res_freq(:,12),'--','Color',lattice_color{w},'LineWidth',3)
        scatter(data_res(1:16,1),data_res(1:16,7),80,'MarkerEdgeColor','k','MarkerFaceColor',lattice_color{w},'LineWidth',1)
        grid on
    elseif  w == 5
        plot(data_pwe_res_freq(:,3),data_pwe_res_freq(:,15),'--','Color',lattice_color{w},'LineWidth',3)
        scatter(data_res(1:16,1),data_res(1:16,7),80,'MarkerEdgeColor','k','MarkerFaceColor',lattice_color{w},'LineWidth',1)
        grid on
    end
    cont_plot1 = cont_plot1 +  1;
    cont_plot2 = cont_plot2 +  1;
end
figure(2)
subplot(1,3,1)
legend(legendText11)
set(legend,'FontSize',14);
set(gca,'fontSize',8,'fontweight','b')
xlabel('Resonator frequency [Hz]','fontsize',20,'fontweight','b')
ylabel('Lower edge frequency [Hz]','fontsize',25,'fontweight','b')
%set(gca, 'XScale', 'log');
%set(gca, 'YScale', 'log');
set(gca,'fontSize',22,'fontweight','b')
if w == 4
    xlim([5 100])
elseif w == 5
    xlim([5 150])
end
if w == 4
    ylim([5 80])
elseif w == 5
    ylim([0 100])
end
grid on

subplot(1,3,2)
legend(legendText21)
set(legend,'FontSize',14);
set(gca,'fontSize',8,'fontweight','b')
xlabel('Resonator frequency [Hz]','fontsize',20,'fontweight','b')
ylabel('Upper edge frequency [Hz]','fontsize',25,'fontweight','b')
%set(gca, 'XScale', 'log');
%set(gca, 'YScale', 'log');
set(gca,'fontSize',22,'fontweight','b')
if w == 4
    xlim([5 100])
elseif w == 5
    xlim([5 150])
end
if w == 4
    ylim([5 80])
elseif w == 5
    ylim([0 100])
end
grid on

subplot(1,3,3)
legend(legendText31)
set(legend,'FontSize',12);
set(gca,'fontSize',8,'fontweight','b')
xlabel('Resonator frequency [Hz]','fontsize',20,'fontweight','b')
ylabel('Full band gap width [Hz]','fontsize',20,'fontweight','b')
%set(gca, 'XScale', 'log');
%set(gca, 'YScale', 'log');
set(gca,'fontSize',22,'fontweight','b')
if w == 4
    xlim([5 100])
elseif w == 5
    xlim([5 150])
end
if w == 4
    ylim([0 18])
elseif w == 5
    ylim([0 8])
end
grid on

end