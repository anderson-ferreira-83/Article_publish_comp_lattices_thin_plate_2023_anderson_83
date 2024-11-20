function [path_full, R1_mp1, R1_mp2, R1_mp3, R2_mp1, R2_mp2, R2_mp3] = func6_read_mps(index_lat_f)
%
index_lat = index_lat_f;
%
R1_mp1 = [];
R1_mp2 = [];
R1_mp3 = [];
R2_mp1 = [];
R2_mp2 = [];
R2_mp3 = [];
data_R1_latex_all_mps = [];
data_R2_latex_all_mps = [];
%
path_figs = 'data\Artigo_1_Revista_comp_lattices_thin_plate_2023\4_Modelagem_Python_Matlab_Comsol\0_Codes_Matlab_COMSOL\4_Data_Process_FRF_Comsol\Transmittance\3_figs_frfs';
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

% Declaracao da variaveis de rede em strings
str_lat = {'square','rectangular','triangular','honeycomb','kagome'};
str_lat = string(str_lat);
    %
    cd('4_data_regions_trs');
for i=1:15
    % Leitura do ponto de medicao 1
    mp1 = csvread(strcat(string(index_lat),'_',str_lat(index_lat),strcat('_',string(10*i)),...
        '_lattice_coords_peaks_tr_mp1.csv'));
    % Leitura do ponto de medicao 2
    mp2 = csvread(strcat(string(index_lat),'_',str_lat(index_lat),strcat('_',string(10*i)),...
        '_lattice_coords_peaks_tr_mp2.csv'));
    % Leitura do ponto de medicao 3
    mp3 = csvread(strcat(string(index_lat),'_',str_lat(index_lat),strcat('_',string(10*i)),...
        '_lattice_coords_peaks_tr_mp3.csv'));
    % Vetor que armazena os dados simultaneos dos tres pontos de medicoes
    if index_lat == 1 || index_lat == 2 || index_lat == 3
        data_R1_latex_all_mps = [data_R1_latex_all_mps;10*i  mp1(1,4) abs(mp1(1,5)) abs(mp1(1,6)) abs(mp1(1,7))  mp2(1,4) abs(mp2(1,5)) abs(mp2(1,6)) abs(mp2(1,7)) mp3(1,4)  abs(mp3(1,5)) abs(mp3(1,6)) abs(mp3(1,7))];
        R1_mp1  = [R1_mp1;10*i mp1(1,4) mp1(1,5)];
        R1_mp2  = [R1_mp2;10*i mp2(1,4) mp2(1,5)];
        R1_mp3  = [R1_mp3;10*i mp3(1,4) mp3(1,5)];
    elseif index_lat == 4 || index_lat == 5
        data_R1_latex_all_mps = [data_R1_latex_all_mps;10*i  mp1(1,4) abs(mp1(1,5)) abs(mp1(1,6)) abs(mp1(1,7))  mp2(1,4) abs(mp2(1,5)) abs(mp2(1,6)) abs(mp2(1,7)) mp3(1,4)  abs(mp3(1,5)) abs(mp3(1,6)) abs(mp3(1,7))];
        data_R2_latex_all_mps = [data_R2_latex_all_mps;10*i  mp1(2,4) abs(mp1(2,5)) abs(mp1(2,6)) abs(mp1(2,7))  mp2(2,4) abs(mp2(2,5)) abs(mp2(2,6)) abs(mp2(2,7)) mp3(2,4)  abs(mp3(2,5)) abs(mp3(2,6)) abs(mp3(2,7))];
        R1_mp1  = [R1_mp1;10*i mp1(1,4) mp1(1,5)];
        R2_mp1 = [R2_mp1;10*i mp1(2,4) mp1(2,5)];
        R1_mp2  = [R1_mp2;10*i mp2(1,4) mp2(1,5)];
        R2_mp2 = [R2_mp2;10*i mp2(2,4) mp2(2,5)];
        R1_mp3  = [R1_mp3;10*i mp3(1,4) mp3(1,5)];
        R2_mp3 = [R2_mp3;10*i mp3(2,4) mp3(2,5)];
    end
end
end