clear all
close all
clc
%%
% Indice da rede
% 1 -> Quadrada ; 2 -> Retangular ; 3 -> Triangular ; 4 -> Hexagonal ; 5 -> Kagome;
for j = 1:1
    index_lat = j;
    %%
    if index_lat == 1
        % Frequencia do ressonador local
        freq = 40;
        % Limite inferior e superior do Plot na frequência
        f_lim_inf = 10;
        f_lim_sup = 200;
    elseif index_lat == 2
        % Frequencia do ressonador local
        freq = 40;
        % Limite inferior e superior do Plot na frequência
        f_lim_inf = 10;
        f_lim_sup = 200;
    elseif index_lat == 3
        % Frequencia do ressonador local
        freq = 60;
        % Limite inferior e superior do Plot na frequência
        f_lim_inf = 10;
        f_lim_sup = 200;
    elseif index_lat == 4
        % Frequencia do ressonador local
        freq = 30;
        % Limite inferior e superior do Plot na frequência
        f_lim_inf = 10;
        f_lim_sup = 100;
    elseif index_lat == 5
        % Frequencia do ressonador local
        freq = 20;
        % Limite inferior e superior do Plot na frequência
        f_lim_inf = 10;
        f_lim_sup = 100;
    end
    %%
    % Chamada da funcao
    func3_frf_disp(index_lat,freq,f_lim_inf,f_lim_sup)
    %close all
end
