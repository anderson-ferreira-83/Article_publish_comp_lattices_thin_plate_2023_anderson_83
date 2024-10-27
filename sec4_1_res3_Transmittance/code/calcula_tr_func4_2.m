clear all
close all
clc
%%
% Indice da rede
% 1 -> Quadrada ; 2 -> Retangular ; 3 -> Triangular ; 4 -> Hexagonal ; 5 -> Kagome ;
data_stat = [];
data_stat1 = [];
data_stat2 = [];
for j= 1:1:1
    cont_plot = 1;
    for w=1:1
        index_lat = j;
        % Cor original em formato hexadecimal
        cor_original_hex = {'#fc0fc0','#0000ff','#00ffee','#16ff24','#ff1602'};
        % Converter cor hexadecimal para RGB
        cor_original_rgb = hex2rgb(cor_original_hex{index_lat})
        % Criar tons mais claros
        tons_mais_claros = zeros(3, 3);
        %
        tons_mais_claros;
        % Ajustar os valores dos canais RGB para criar tons mais claros
        if w==1
            tons_mais_claros(w, :) = cor_original_rgb
        else
            tons_mais_claros(w, :) = cor_original_rgb + (1 - cor_original_rgb)*(w-1)*.15; % Aumentar os valores dos canais de cor
        end 
        %
        type_line = {'-','-.','--'}
        %
        type_point = {'o','s','d'}
        %%
        %
        %if index_lat == 1 || index_lat == 2 || index_lat == 3
            %plot_coords = cell(1,15);
            %legend_strings_mp1 = cell(1,15)
            %legend_strings_mp2 = cell(1,15)
            %legend_strings_mp3 = cell(1,15)
        %elseif index_lat == 4 || index_lat == 5
            plot_coords = {}
            legend_strings_mp1 = {}
            legend_strings_mp2 = {}
            legend_strings_mp3 = {}
        %end
        %
        cont = 1
        for i=10:10:150
            % Frequencia do ressonador local
            freq = i;
            %%
            if freq == 10
                % Limite inferior e superior do Plot na frequência
                f_lim_inf = 5;
                f_lim_sup = 200;
            elseif freq >=20 && freq <= 80
                f_lim_inf = 10;
                f_lim_sup = 200;
            else
                f_lim_inf = 10;
                f_lim_sup = 200;
            end
            index_color = freq/10;
            %%
            lim_inf_frf_rect = -350;
            lim_sup_frf_rect = 50;
            %%
            str_lat = {'square','rectangular','triangular','honeycomb','kagome'};
            % Convertendo celula para string
            str_lat = string(str_lat);
            %%
            pwd_current = pwd;
            % Chamada da funcao que determina intervalo de Bands gaps parciais e totais
            % para Insercao dos valores no sprintf
            if index_lat == 1
                [frq_inf,frq_sup,delta_f_gap] = func_lattice_square_bg_full(freq);
                cd(pwd_current);
                [frq_inf1,frq_sup1,delta_f_gap1,frq_inf2,frq_sup2,delta_f_gap2] = func_lattice_square_bg_partial(freq)
                cd(pwd_current);
            elseif index_lat == 2
                [frq_inf,frq_sup,delta_f_gap] = func_lattice_rect_bg_full(freq);
                cd(pwd_current);
                [frq_inf1,frq_sup1,delta_f_gap1,frq_inf2,frq_sup2,delta_f_gap2] = func_lattice_rect_bg_partial(freq);
                cd(pwd_current);
            elseif index_lat == 3
                [frq_inf,frq_sup,delta_f_gap] = func_lattice_trian_bg_full(freq);
                cd(pwd_current);
                [frq_inf1,frq_sup1,delta_f_gap1,frq_inf2,frq_sup2,delta_f_gap2] = func_lattice_trian_bg_partial(freq);
                cd(pwd_current);
            elseif index_lat == 4
                [frq_inf11,frq_sup11,delta_f_gap11,frq_inf21,frq_sup21,delta_f_gap21] = func_lattice_hex_bg_full(freq);
                cd(pwd_current);
                [frq_inf12,frq_sup12,delta_f_gap12,frq_inf22,frq_sup22,delta_f_gap22] = func_lattice_hex_bg_partial(freq);
                cd(pwd_current);
            elseif index_lat == 5
                [frq_inf11,frq_sup11,delta_f_gap11,frq_inf21,frq_sup21,delta_f_gap21] = func_lattice_kag_bg_full(freq);
                cd(pwd_current);
                [frq_inf01,frq_sup01,delta_f_gap01,frq_inf02,frq_sup02,delta_f_gap02,...
                    frq_inf12,frq_sup12,delta_f_gap12,frq_inf22,frq_sup22,delta_f_gap22] = func_lattice_kag_bg_partial(freq);
                cd(pwd_current);
            end
            %%
            path_figs = 'path\4_Data_Process_FRF_Comsol\Transmittance\3_figs_frfs';
            if index_lat == 1
                path_full = strcat(path_figs,'\1_square_lattice\');
            elseif index_lat == 2
                path_full = strcat(path_figs,'\2_rect_lattice\');
            elseif index_lat == 3
                path_full = strcat(path_figs,'\3_trian_lattice\');
            elseif index_lat == 4
                path_full = strcat(path_figs,'\4_hex_lattice\');
            elseif index_lat == 5
                path_full = strcat(path_figs,'\5_kag_lattice\');
            end
            
            %%
            %%
            % Declaracao da variaveis de rede em strings
            str_lat = {'square','rectangular','triangular','honeycomb','kagome'};
            str_lat = string(str_lat);
            %%
            % String parcial para acesso das FRFs da Placa lisa
            str_vec_dp = strcat('drive_point_placa_',str_lat(index_lat),'_res_bc_free_free.csv');
            str_vec_mp1 = strcat('measure_point1_res_',str_lat(index_lat),'_bc_free_free.csv');
            str_vec_mp2 = strcat('measure_point2_res_',str_lat(index_lat),'_bc_free_free.csv');
            str_vec_mp3 = strcat('measure_point3_res_',str_lat(index_lat),'_bc_free_free.csv');
            % Carregamento total para acesso das FRFs da Placa com ressonador local
            F_exec_1 = csvread(strcat(pwd,'\1_freq_',string(freq),'\2_Transmittance\',str_vec_dp));
            mps_1_1 = csvread(strcat(pwd,'\1_freq_',string(freq),'\2_Transmittance\',str_vec_mp1));
            mps_1_2 = csvread(strcat(pwd,'\1_freq_',string(freq),'\2_Transmittance\',str_vec_mp2));
            mps_1_3 = csvread(strcat(pwd,'\1_freq_',string(freq),'\2_Transmittance\',str_vec_mp3));
            %%
            % Variavel de alocacao para dados da placa lisa
            coords_trans01 = [];
            coords_trans02 = [];
            coords_trans03 = [];
            % Variavel de alocacao para dados da placa com ressonador local
            coords_trans1 = [];
            coords_trans2 = [];
            coords_trans3 = [];
            % Vetor de frequencia para a placa com ressonador local
            freq_1 = F_exec_1(:,1);
            csvwrite(strcat('f0_0_',string(index_lat),'_',str_lat(index_lat),strcat('_',string(freq)),...
                '_lattice_freq_plate.csv'),freq_1);
            T1_1 = (mps_1_1(:,2) - F_exec_1(:,2));
            % Export em csv dos dados da transmitancia do mp1 placa ressonador
            csvwrite(strcat('T1_1_',string(index_lat),'_',str_lat(index_lat),strcat('_',string(freq)),...
                '_lattice_tr_mp1_res_plate.csv'),T1_1);
            T1_2 = (mps_1_2(:,2) - F_exec_1(:,2));
            % Export em csv dos dados da transmitancia do mp2 placa ressonador
            csvwrite(strcat('T1_2_',string(index_lat),'_',str_lat(index_lat),strcat('_',string(freq)),...
                '_lattice_tr_mp2_res_plate.csv'),T1_2);
            T1_3 = (mps_1_3(:,2) - F_exec_1(:,2));
            % Export em csv dos dados da transmitancia do mp3 placa ressonador
            csvwrite(strcat('T1_3_',string(index_lat),'_',str_lat(index_lat),strcat('_',string(freq)),...
                '_lattice_tr_mp3_res_plate.csv'),T1_3);
            %% Measure Points
            % Determinacao dos pontos de minimo para measure point
            % Valores minimos e sua posicao no vetor
            [minY01, minYIndex01] = min(mps_1_1(:, 2));
            [minY02, minYIndex02] = min(mps_1_2(:, 2));
            [minY03, minYIndex03] = min(mps_1_3(:, 2));
            % Valores minimos
            coords_trans01 = [coords_trans01;minY01];
            coords_trans02 = [coords_trans02;minY02];
            coords_trans03 = [coords_trans03;minY03];
            %% Transmittance
            % Determinacao dos pontos de minimo para Transmittance
            % Valores minimos e sua posicao no vetor
            [minY1, minYIndex1] = min(T1_1(:, 1));
            [minY2, minYIndex2] = min(T1_2(:, 1));
            [minY3, minYIndex3] = min(T1_3(:, 1));
            % Posicao da frequencia Valores minimos
            minX1 = F_exec_1(minYIndex1, 1);
            minX2 = F_exec_1(minYIndex2, 1);
            minX3 = F_exec_1(minYIndex3, 1);
            % Coordenadas para o ponto de minimo
            coords_trans1 = [coords_trans1;minX1 minY1];
            coords_trans2 = [coords_trans2;minX2 minY2];
            coords_trans3 = [coords_trans3;minX3 minY3];
            %
            %selected_curves = 1;  % Índice das curvas selecionadas
            %%
            colorPalette_points = {
                '#1f77b4','#4DBEEE', '#ff7f0e', '#2ca02c', '#d62728', '#9467bd', ...
                '#8c564b','#A2142F', '#e377c2', '#7f7f7f', '#bcbd22', '#17becf', ...
                '#393b79','#77AC30', '#637939', '#8c6d31', '#843c39', '#7b4173'
                };
            %%
            line_style = {'-','-.','--'}
            figure(20 + w)
            subplot(1,3,[1 2])
            %subplot(3,1,w)
            %subplot(3,2,cont_plot)
            box on
            grid on
            hold on
            %% Para as redes Quadradas, Retangular e Triangular
            if index_lat == 1 || index_lat == 2 || index_lat == 3
                plot(freq_1,eval(['T1_' num2str(w)]),'LineStyle',line_style{w},'LineWidth', 2,'Color',colorPalette_points{index_color})
                % Indice da Transmitancia 1 para o Measure Point 1
                index_mp_f = w
                % Intervalos das frequencias das regioes:
                % R1 - Band gap parcial para os modos 1 e 2    -> [frq_inf1 frq_inf]
                % R2 - Band gap completo para os modos 1 e 2   -> [frq_inf frq_sup]
                % R3 - Região entre R2 e R4                     -> [frq_sup frq_inf2]
                % R4 - Band gap parcial para os mnodos 2 e 3    -> [frq_inf2 frq_sup2]
                intervalos = [  frq_inf1 frq_inf;...
                    frq_inf frq_sup;...
                    frq_sup frq_inf2;...
                    frq_inf2 frq_sup2];
                if index_lat == 2 && freq == 120
                    intervalos = intervalos(3,:);
                elseif index_lat == 2 && freq > 120
                    intervalos = intervalos(4,:);
                else
                    intervalos = intervalos(2,:);
                end
                % Chamada da funcao para identificaco dos picos de transmitancia
                [valor_minimo,data] = func1_1_mp_tr(index_lat,freq,index_mp_f,intervalos);
                % Encontre os indices das linhas que nao contem zeros na coluna das regioes
                indices_nao_zeros = ~(valor_minimo(:, 2) == 0);
                % Selecione apenas as linhas que nao contem zeros na coluna das regioes
                coordenadas_sem_zeros =valor_minimo(indices_nao_zeros, :);
                % Criacao das celulas para amarzenamento dos plots dos pontos contendo os picos de atenuacao
                line_coord_zero = size(coordenadas_sem_zeros);
                % Plot dos picos de transmitancia para as Redes:
                % Quadrada, Retangular e Triangular                
                for i=1:line_coord_zero(1)
                    plot_coords{cont} = plot(coordenadas_sem_zeros(i,3),coordenadas_sem_zeros(i,2),type_point{w},...
                        'MarkerFaceColor',colorPalette_points{index_color},'MarkerEdgeColor','k','MarkerSize',12,'LineWidth',1.2)
                    if index_lat == 2 && freq >= 120
                        if w==1
                            legend_strings_mp1{cont} = sprintf(strcat('f_r = %g [Hz] (FEM) - Peak value : %.2f [dB] in %.2f [Hz]'),freq,...
                            coordenadas_sem_zeros(i,2),coordenadas_sem_zeros(i,3))
                        elseif w==2
                            legend_strings_mp2{cont} = sprintf(strcat('f_r = %g [Hz] (FEM) - ',' FRF'),freq)
                            
                        elseif w==3
                            legend_strings_mp3{cont} = sprintf(strcat('f_r = %g [Hz] (FEM) - ',' FRF'),freq)
                        end
                    else
                        if w==1
                            legend_strings_mp1{cont} = sprintf(strcat('f_r = %g [Hz] (FEM) - Peak value : %.2f [dB] in %.2f [Hz]'),freq,...
                            coordenadas_sem_zeros(i,2),coordenadas_sem_zeros(i,3))
                        elseif w==2
                            legend_strings_mp2{cont} = sprintf(strcat('f_r = %g [Hz] (FEM) - ',' FRF'),freq)
                        elseif w==3
                            legend_strings_mp3{cont} = sprintf(strcat('f_r = %g [Hz] (FEM) - ',' FRF'),freq)
                        end
                    end
                end
                data_stat = [data_stat;freq coordenadas_sem_zeros(i,2) coordenadas_sem_zeros(i,3)];
                cont = cont + 1;
                %%
                % Para a Rede de Honeycomb ou Kagome:
            elseif index_lat == 4 || index_lat == 5
                plot(freq_1,eval(['T1_' num2str(w)]),'LineStyle', line_style{w},'LineWidth', 2,'Color',colorPalette_points{index_color});
                % Indice da Transmitancia 1 para o Measure Point 1
                index_mp_f = w;
                % Intervalos das frequencias das regioes:
                % R1 - Band gap completo para os modos 2 e 3    -> [frq_inf11 frq_sup11]
                % R2 - Região entre R2 e R4                     -> [frq_sup11 frq_inf21]
                % R3 - Band gap parcial para os modos 3 e 4     -> [frq_inf22 frq_sup22]
                % R4 - Band gap completo para os modos 3 e 4    -> [frq_inf21 frq_sup22]
                if index_lat == 4
                    intervalos = [frq_inf11 frq_sup11;...
                    frq_sup11 frq_inf21;...
                    frq_inf22 frq_sup22;...
                    frq_inf21 frq_sup21];
                    intervalos = [intervalos(1,:);intervalos(4,:)];                    
                elseif  index_lat == 5
                    intervalos = [frq_inf12 frq_sup12;...
                        frq_inf11 frq_sup11;...
                        frq_inf22 frq_sup22;...
                        frq_inf21 frq_sup21]
                    intervalos = [intervalos(2,:);intervalos(4,:)];
                end
                % Chamada da funcao para identificaco
                [valor_minimo,data] = func1_1_mp_tr(index_lat,freq,index_mp_f,intervalos);
                % Encontre os indices das linhas que nao contem zeros na coluna das regioes
                indices_nao_zeros = ~(valor_minimo(:, 2) == 0);
                % Selecione apenas as linhas que nao contem zeros na coluna das regioes
                coordenadas_sem_zeros = valor_minimo(indices_nao_zeros, :)
                % Criacao das celulas para amarzenamento dos plots dos pontos contendo os picos de atenuacao
                line_coord_zero = size(coordenadas_sem_zeros);
                % Plot dos picos de transmitancia para as Redes:
                for i=1:line_coord_zero(1)
                    plot_coords{cont} = plot(coordenadas_sem_zeros(i,3),coordenadas_sem_zeros(i,2),type_point{w},...
                        'MarkerFaceColor',colorPalette_points{index_color},'MarkerEdgeColor','k','MarkerSize',12,'LineWidth',1.2)
                    if w==1
                        legend_strings_mp1{cont} = sprintf(strcat('f_r = %g [Hz] (FEM) - Peak value : %.2f [dB] in %.2f [Hz]'),freq,...
                            coordenadas_sem_zeros(i,2),coordenadas_sem_zeros(i,3))
                    elseif w==2
                        legend_strings_mp2{cont} = sprintf(strcat('f_r = %g [Hz] (FEM) - ',' FRF_',num2str(w),'- Peak value : %.2f [dB] in %.2f [Hz]'),freq,...
                            coordenadas_sem_zeros(i,2),coordenadas_sem_zeros(i,3))
                    elseif w==3
                        legend_strings_mp3{cont} = sprintf(strcat('f_r = %g [Hz] (FEM) - ',' FRF_',num2str(w),'- Peak value : %.2f [dB] in %.2f [Hz]'),freq,...
                            coordenadas_sem_zeros(i,2),coordenadas_sem_zeros(i,3))
                    end
                    cont = cont + 1
                    if i==1
                    data_stat1 = [data_stat1;freq coordenadas_sem_zeros(i,2) coordenadas_sem_zeros(i,3)];
                    else i==2
                    data_stat2 = [data_stat2;freq coordenadas_sem_zeros(i,2) coordenadas_sem_zeros(i,3)];
                    end
                end    
            end                        
        end
        %%
        if w==1
            legend([plot_coords{:}], legend_strings_mp1);
        elseif  w==2
            legend([plot_coords{:}], legend_strings_mp2);
        elseif w==3
            legend([plot_coords{:}], legend_strings_mp3);
        end
        % Ajuste da Legenda conforme a disposicao dos resultados
        if freq >=10 && freq <= 40
            set(legend,'Location','southeast','FontSize',10)
        else
            set(legend,'Location','northwest','FontSize',10)
        end
        if j == 4 || j == 5 
           set(legend,'FontSize',8) 
        end
        xlim([5 200])
        xlabel('Frequency [Hz]','fontsize',20,'fontweight','b')
        ylabel('Receptance [dB re 1.0 m/N]','fontsize',20,'fontweight','b')
        %set(gca,'XScale', 'log')
        set(gca,'fontSize',20,'fontweight','b')
        subplot(1,3,3)
        axis off;
        %title(upper(strcat(str_lat(index_lat),' lattice')),'fontsize',20,'fontweight','b')
        %ylim([min(eval(['T1_' num2str(w)]))-10 50]) ;
        %xlim([f_lim_inf f_lim_sup]);
        % Configuração do tamanho A4 em paisagem
        set(gcf, 'Units', 'centimeters');
        pos = get(gcf, 'Position');
        width = 29.7; % Largura do papel A4 em centímetros (modo paisagem)
        height = 21; % Altura do papel A4 em centímetros (modo paisagem)
        set(gcf, 'Position', [pos(1) pos(2) width height]);
        %
        name_fig = strcat('fig_',num2str(20+w),'_',num2str(index_lat),'_tr_',str_lat(index_lat),'_lattice_mp',num2str(w),'_freq_',num2str(freq))
        %
        file_fig = strcat(path_full, name_fig, '.fig');
        %
        savefig(20+w, file_fig);
        %
        file_eps = strcat(path_full, name_fig, '.eps');
        %
        saveas(20+w, file_eps, 'epsc');
        %
        file_png = strcat(path_full, name_fig, '.png');
        saveas(20+w, file_png);        
        cont_plot = cont_plot + 2;
        h=[figure(21), figure(22), figure(23)];
        set(h, 'WindowStyle', 'Docked');
    end
    data_stat
    data_stat1
    data_stat2    
    if j == 1 || j == 2 || j == 3
    string_name = strcat(num2str(j),'_data_stat_',str_lat{j},'_hist.csv')    
    writematrix(data_stat,string_name)
    else
        j == 4 || j == 5
    string_name = strcat(num2str(j),'_data_stat1_',str_lat{j},'_hist.csv')    
    writematrix(data_stat1,string_name)  
    string_name = strcat(num2str(j),'_data_stat2_',str_lat{j},'_hist.csv')    
    writematrix(data_stat2,string_name) 
    end
end