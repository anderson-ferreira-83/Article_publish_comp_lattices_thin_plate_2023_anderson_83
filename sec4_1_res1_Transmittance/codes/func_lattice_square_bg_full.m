
function [frq_inf,frq_sup,delta_f_gap] = func_lattice_square_bg_full(fr_f)
%%

% Inicio da contagem de tempo de carregamento de dados
%%
path_database = 'path/database';
cd(path_database);
% Load Data PWE Resonator
pwe_file_w_res = strcat('1_1_a_0.10_h_0.002_lattice_s_res_',num2str(fr_f),'_pwe_w_data_full_path.csv');
pwe_file_f_res = strcat('1_2_a_0.10_h_0.002_lattice_s_res_',num2str(fr_f),'_pwe_f_data_full_path.csv');
w_kk_pwe_res = csvread(pwe_file_w_res);
freq_pwe_res = csvread(pwe_file_f_res);


%===================================================
% Varredura para determinar a largura Full bandgap
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
index10 =  minIndex1;
delta_f_gap = minDist;
frq_inf = freq_1(index10);
frq_sup = freq_1(index10) + delta_f_gap;
end
