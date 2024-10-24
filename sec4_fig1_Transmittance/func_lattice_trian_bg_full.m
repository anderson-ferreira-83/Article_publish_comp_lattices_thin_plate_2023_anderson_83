
function [frq_inf,frq_sup,delta_f_gap] = func_lattice_trian_bg_full(fr_f)
%%

% Inicio da contagem de tempo de carregamento de dados
%%
path_database = 'I:\Meu Drive\200_ARTIGO_REVISTAS\Artigo_1_Revista_comp_lattices_thin_plate_2023\4_Modelagem_Python_Matlab_Comsol\0_Codes_Matlab_COMSOL\0_BACKUPS_CODES\PWE_Kirchhoff\2_Plot_Line\1_database';
cd(path_database);
% Load Data PWE Resonator
pwe_file_w_res = strcat('3_1_a_0.10_h_0.002_lattice_t_res_',num2str(fr_f),'_pwe_w_data_full_path.csv');
pwe_file_f_res = strcat('3_2_a_0.10_h_0.002_lattice_t_res_',num2str(fr_f),'_pwe_f_data_full_path.csv');
w_kk_pwe_res = csvread(pwe_file_w_res);
freq_pwe_res = csvread(pwe_file_f_res);
% Full bandgap
%disp('A - Point M')
posA = find(w_kk_pwe_res(1,:) == 0);
k_pA = w_kk_pwe_res(1,posA(1));
f_pA = freq_pwe_res(1,posA(1));
%disp('B - Point Gamma')
posB = find(w_kk_pwe_res(2,:) == 1);
k_pB = w_kk_pwe_res(2,posB(1));
f_pB = freq_pwe_res(2,posB(1));
%disp('C - Point X')
posC = find(w_kk_pwe_res(1,:) == 2);
k_pC = w_kk_pwe_res(1,posC(1));
f_pC = freq_pwe_res(1,posC(1));
%disp('D - Point X')
posD = find(w_kk_pwe_res(2,:) == 2);
k_pD = w_kk_pwe_res(2,posD(1));
f_pD = freq_pwe_res(2,posD(1));
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
index10 =  minIndex1;
delta_f_gap = minDist;
frq_inf = freq_1(index10);
frq_sup = freq_1(index10) + delta_f_gap;
end
