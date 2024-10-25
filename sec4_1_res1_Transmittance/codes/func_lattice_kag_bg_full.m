
function [frq_inf11,frq_sup11,delta_f_gap11,frq_inf21,frq_sup21,delta_f_gap21] = func_lattice_kag_bg_full(fr_f)
%%
% Inicio da contagem de tempo de carregamento de dados
%%
path_database = 'path/database';
cd(path_database);
% Load Data PWE Resonator
pwe_file_w_res = strcat('5_1_a_0.10_h_0.002_lattice_k_res_',num2str(fr_f),'_pwe_w_data_full_path.csv');
pwe_file_f_res = strcat('5_2_a_0.10_h_0.002_lattice_k_res_',num2str(fr_f),'_pwe_f_data_full_path.csv');
w_kk_pwe_res = csvread(pwe_file_w_res);
freq_pwe_res = csvread(pwe_file_f_res);
%===================================================
% Varredura para determinar a largura do Band Gap
%===================================================
% Coords Modo 3
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
% Coords Modo 5
% Num onda
w_kk_5 = w_kk_pwe_res(5,:);
% freq
freq_5 = freq_pwe_res(5,:);
%---------------------------------------------------------------------
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
index10 =  minIndex1;
delta_f_gap11 = minDist;
frq_inf11 = freq_3(index10);
frq_sup11 = freq_3(index10) + delta_f_gap11;
%===================================================
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
index20 =  minIndex1;
delta_f_gap21 = minDist;
frq_inf21 = freq_4(index20);
frq_sup21 = freq_4(index20) + delta_f_gap21;
end
