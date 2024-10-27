function func3_frf_disp = func3_frf_disp(index_lat_f,freq_f,f_lim_inf_f,f_lim_sup_f)
%----------------------------------------------------------------------
% Insercao dos parametros da rede
index_lat = index_lat_f;
freq = freq_f;
f_lim_inf = f_lim_inf_f
f_lim_sup = f_lim_sup_f
%----------------------------------------------------------------------
%%
path_file = 'path/database'
string_lat_w = { '\1_1_a_0.10_h_0.002_lattice_s_res_',...
    '\2_1_a_0.10_h_0.002_lattice_r_res_',...
    '\3_1_a_0.10_h_0.002_lattice_t_res_',...
    '\4_1_a_0.10_h_0.002_lattice_h_res_',...
    '\5_1_a_0.10_h_0.002_lattice_k_res_'
    };
string_lat_f= {'\1_2_a_0.10_h_0.002_lattice_s_res_',...
    '\2_2_a_0.10_h_0.002_lattice_r_res_',...
    '\3_2_a_0.10_h_0.002_lattice_t_res_',...
    '\4_2_a_0.10_h_0.002_lattice_h_res_',...
    '\5_2_a_0.10_h_0.002_lattice_k_res_'
    };
% Load Data PWE
pwe_file_w_res = strcat(string_lat_w{index_lat},...
    num2str(freq),'_pwe_w_data_gamma_x_path.csv');
full_path = strcat(path_file,pwe_file_w_res);
w_kk_pwe_res = csvread(full_path);
% Frequency vector
pwe_file_f_res = strcat(string_lat_f{index_lat},...
    num2str(freq),'_pwe_f_data_gamma_x_path.csv');
full_path = strcat(path_file,pwe_file_f_res);
freq_pwe_res = csvread(full_path);
%----------------------------------------------------------------------
% Load Data EPWE Curve Gamma
% Wavenumber vector
epwe_file_real_w_res = strcat(string_lat_w{index_lat},...
    num2str(freq),'_epwe_real_w_data_gamma_x_path.csv');
full_path = strcat(path_file,epwe_file_real_w_res);
w_kk_epwe_real_res = csvread(full_path);
%
epwe_file_imag_w_res = strcat(string_lat_w{index_lat},...
    num2str(freq),'_epwe_imag_w_data_gamma_x_path.csv');
full_path = strcat(path_file,epwe_file_imag_w_res);
w_kk_epwe_imag_res = csvread(full_path);
% Frequency vector
epwe_file_f_res = strcat(string_lat_f{index_lat},...
    num2str(freq),'_epwe_f_data_gamma_x_path.csv');
full_path = strcat(path_file,epwe_file_f_res);
freq_epwe_res = csvread(full_path);
%%
% Selecao de cores para o PWE
colorPalette_pwe = {
    '#EDB120', ...
    '#40E0D0', ...
    '#FA8072', ...
    '#CCCCFF', ...
    '#D95319', ...
    '#9FE2BF', ...
    '#4DBEEE', ...
    '#DFFF00', ...
    '#6495ED'
    };
% Selecao de cores para o EPWE
colorPalette_epwe = {
    '#1f77b4','#4DBEEE', '#ff7f0e', '#2ca02c', '#d62728', '#9467bd', ...
    '#8c564b','#A2142F', '#e377c2', '#7f7f7f', '#bcbd22', '#17becf', ...
    '#393b79','#77AC30', '#637939', '#8c6d31', '#843c39', '#7b4173'
    };
%----------------------------------------------------------------------
%%
pwd_current = pwd;
% Chamada da funcao que determina intervalo de Bands gaps parciais e totais
if index_lat == 1
    [frq_inf,frq_sup,delta_f_gap] = func_lattice_square_bg_full(freq);
    cd(pwd_current);
    [frq_inf1,frq_sup1,delta_f_gap1,frq_inf2,frq_sup2,delta_f_gap2] = func_lattice_square_bg_partial(freq);
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
% Plot PWE
figure(1)
subplot(1,3,1)
box on
hold on
%%
rectangle_plot1(freq,index_lat,0,2);
%%
m_pwe_real_10 = [3,3,3,4,5];
m_pwe_real_20 = [3,3,3,4,5];
m_pwe_real_30 = [3,3,3,4,5];
m_pwe_real_40 = [3,3,3,4,5];
m_pwe_real_50 = [3,3,3,4,5];
m_pwe_real_60 = [3,3,3,4,5];
m_pwe_real_70 = [3,3,3,4,5];
m_pwe_real_80 = [3,3,3,4,5];
m_pwe_real_90 = [3,3,3,4,5];
m_pwe_real_100 = [3,3,3,4,5];
m_pwe_real_110 = [3,3,3,4,5];
m_pwe_real_120 = [3,3,3,4,5];
m_pwe_real_130 = [3,3,3,4,5];
m_pwe_real_140 = [3,3,3,4,5];
m_pwe_real_150 = [3,3,3,4,5];
%
nome_variavel_pwe = ['m_pwe_real_', num2str(freq)]  % Cria o nome da variável

if index_lat == 1
    valor_variavel_pwe = eval(nome_variavel_pwe)
    var1 = valor_variavel_pwe(1)
elseif index_lat == 2
    valor_variavel_pwe = eval(nome_variavel_pwe);
    var1 = valor_variavel_pwe(2);
elseif index_lat == 3
    valor_variavel_pwe = eval(nome_variavel_pwe);
    var1 = valor_variavel_pwe(3);
elseif index_lat == 4
    valor_variavel_pwe = eval(nome_variavel_pwe);
    var1 = valor_variavel_pwe(4);
elseif index_lat == 5
    valor_variavel_pwe = eval(nome_variavel_pwe);
    var1 = valor_variavel_pwe(5);
end
%
m_epwe_real_10 = {1,[3], 2,[3,6], 2,[4,6], 2,[3,5], 3,[3,6,8]};
m_epwe_real_20 = {1,[3], 2,[3,6], 2,[4,6], 3,[4,5,9], 1,[3]};
m_epwe_real_30 = {1,[3], 2,[4,6], 2,[4,5], 1,[3], 1,[4]};
m_epwe_real_40 = {1,[4], 2,[4,6], 2,[2,3], 1,[3], 3,[4,5,9]};
m_epwe_real_50 = {2,[4,5], 2,[3,6], 2,[2,4], 2,[4,5], 3,[4,6,7]};
m_epwe_real_60 = {2,[4,5], 2,[4,6], 2,[1,4], 2,[3,5], 2,[4,6]};
m_epwe_real_70 = {2,[3,5], 2,[3,6], 2,[2,3], 2,[4,5], 2,[3,6]};
m_epwe_real_80 = {2,[4,6], 2,[3,6], 2,[2,3], 2,[3,6], 3,[4,6,9]};
m_epwe_real_90 = {2,[4,6], 2,[4,5], 2,[1,4], 2,[4,6], 4,[4,5,6,9]};
m_epwe_real_100 = {2,[3,5], 2,[4,6], 1,[3], 2,[4,5], 4,[4,5,6,9]};
m_epwe_real_110 = {3,[1,3,5], 3,[1,4,6], 1,[3], 2,[3,5], 3,[3,5,6]};
m_epwe_real_120 = {4,[1,3,6,9], 3,[2,4,6], 1,[3], 2,[4,6], 4,[3,4,5,6]};
m_epwe_real_130 = {4,[1,3,6,7], 3,[2,4,6], 1,[3], 3,[3,5,6], 3,[3,5,6]};
m_epwe_real_140 = {3,[2,3,6], 3,[2,4,6], 1,[3], 3,[4,5,6], 3,[3,5,6]};
m_epwe_real_150 = {3,[2,4,6], 3,[2,4,6], 1,[4], 3,[4,5,6], 3,[4,5,6]};
%
nome_variavel_epwe = ['m_epwe_real_', num2str(freq)]  % Cria o nome da variável
valor_variavel_epwe = eval(nome_variavel_epwe)
%
if index_lat == 1
    valor_variavel_epwe = eval(nome_variavel_epwe)
    var2 = valor_variavel_epwe{1}
elseif index_lat == 2
    valor_variavel_epwe = eval(nome_variavel_epwe);
    var2 = valor_variavel_epwe{3};
elseif index_lat == 3
    valor_variavel_epwe = eval(nome_variavel_epwe);
    var2 = valor_variavel_epwe{5};
elseif index_lat == 4
    valor_variavel_epwe = eval(nome_variavel_epwe);
    var2 = valor_variavel_epwe{7};
elseif index_lat == 5
    valor_variavel_epwe = eval(nome_variavel_epwe);
    var2 = valor_variavel_epwe{9};
end
%%
num_iteracoes = var1 + var2 

if index_lat == 1 || index_lat == 2 || index_lat == 3
    % Inicialize uma célula para armazenar as strings de legenda
    legend_strings = cell(1,num_iteracoes);
    legend_strings{1} = sprintf('FBGW 1 - \\Delta f_{12} = %.2f [Hz]', delta_f_gap)
    %legend_strings{2} = sprintf('Partial Band gap 1 - \\Delta f_{12} %.2f [Hz]', delta_f_gap1);
    %legend_strings{3} = sprintf('Partial Band gap 2 - \\Delta f_{23} %.2f [Hz]', delta_f_gap2);
    % Contador para posicao dos indices das legendas
    cont = 2
elseif index_lat == 4
    % Inicialize uma célula para armazenar as strings de legenda
    legend_strings = cell(1, num_iteracoes);
    legend_strings{1} = sprintf('FBGW 1 - \\Delta f_{23} = %.2f [Hz]',delta_f_gap11);
   %legend_strings{2} = sprintf('Partial Band gap 1 - \\Delta f_{23} %.2f [Hz]',delta_f_gap12);
    legend_strings{2} = sprintf('FBGW 2 - \\Delta f_{34} = %.2f [Hz]',delta_f_gap21);
    %legend_strings{4} = sprintf('Partial Band gap 2 - \\Delta f_{34} %.2f [Hz]',delta_f_gap22);
    % Contador para posicao dos indices das legendas
    cont = 3;
elseif index_lat == 5
    % Inicialize uma célula para armazenar as strings de legenda
    legend_strings = cell(1,num_iteracoes);
    legend_strings{1} = sprintf('FBGW 1 - \\Delta f_{34} = %.2f [Hz]',delta_f_gap11);
    %legend_strings{2} = sprintf('Partial Band gap 1 - \\Delta f_{34} %.2f [Hz]',delta_f_gap12);
    legend_strings{2} = sprintf('FBGW 2 - \\Delta f_{45} = %.2f [Hz]',delta_f_gap21);
    %legend_strings{4} = sprintf('Partial Band gap 2 - \\Delta f_{45} %.2f [Hz]',delta_f_gap22);
    % Contador para posicao dos indices das legendas
    cont = 3;
end

% Inicialize uma célula para armazenar os plots do pwe
plot_pwe = cell(1,var1)
%----------------------------------------------------------------------
% Plot PWE - parte real
% Selecao modos
% Loop para iterar sobre os modos do pwe
for modo = 1:var1
    plot_pwe{modo} = plot(w_kk_pwe_res(modo,:),freq_pwe_res(modo,:),'LineStyle', '-','LineWidth', 5,'Color',colorPalette_pwe{modo});
    legend_strings{cont} = sprintf('K-L (PWE): Mode %g',modo)
    cont = cont + 1
end
%----------------------------------------------------------------------
% Plot EPWE - parte real
% Selecao modos
% Inicialize uma célula para armazenar os plots do epwe
plot_epwe = cell(1,var2)
% Loop para iterar sobre os modos do pwe
if index_lat == 1
    for modo=1:valor_variavel_epwe{1}
        plot_epwe{modo} =  plot(w_kk_epwe_real_res(valor_variavel_epwe{2}(modo),:),freq_epwe_res(:),...
            'LineStyle', '-.','LineWidth', 3,'Color',...
            colorPalette_epwe{modo})
        legend_strings{cont} = sprintf('K-L (EPWE - \\Re) - Mode %g',modo);
        cont = cont + 1
    end
elseif index_lat == 2
    for modo=1:valor_variavel_epwe{3}
        plot_epwe{modo} = plot(w_kk_epwe_real_res(valor_variavel_epwe{4}(modo),:),freq_epwe_res(:),...
            'LineStyle', '-.','LineWidth', 3,'Color',...
            colorPalette_epwe{modo})
        legend_strings{cont} = sprintf('K-L (EPWE - \\Re) - Mode %g',modo);
        cont = cont + 1
    end
elseif index_lat == 3
    for modo=1:valor_variavel_epwe{5}
        plot_epwe{modo} = plot(w_kk_epwe_real_res(valor_variavel_epwe{6}(modo),:),freq_epwe_res(:),...
            'LineStyle', '-.','LineWidth', 3,'Color',...
            colorPalette_epwe{modo})
        legend_strings{cont} = sprintf('K-L (EPWE - \\Re) - Mode %g',modo);
        cont = cont + 1
    end
elseif index_lat == 4
    for modo=1:valor_variavel_epwe{7}
        plot_epwe{modo} = plot(w_kk_epwe_real_res(valor_variavel_epwe{8}(modo),:),freq_epwe_res(:),...
            'LineStyle', '-.','LineWidth', 3,'Color',...
            colorPalette_epwe{modo})
        legend_strings{cont} = sprintf('K-L (EPWE - \\Re) - Mode %g',modo);
        cont = cont + 1
    end
elseif index_lat == 5
    for modo=1:valor_variavel_epwe{9}
        plot_epwe{modo} = plot(w_kk_epwe_real_res(valor_variavel_epwe{10}(modo),:),freq_epwe_res(:),...
            'LineStyle', '-.','LineWidth', 3,'Color',...
            colorPalette_epwe{modo})
        legend_strings{cont} = sprintf('K-L (EPWE - \\Re) - Mode %g',modo);
        cont = cont + 1
    end
end
%----------------------------------------------------------------------
% Inserindo linha de referencia da ressonância local
plot_res = yline(freq,'-.','Color','b','LineWidth',2.5);
legend_strings{cont} = sprintf('Lrsc: %g [Hz]', freq);
%----------------------------------------------------------------------
grid on
if index_lat == 1 || index_lat == 2 || index_lat == 3
    % Partial band gap Modes 1 and 2
    partialBandgap1 = patch(nan,nan,'k');
    partialBandgap1.FaceColor = '#066EFB';
    partialBandgap1.FaceAlpha = 0.8;
    partialBandgap1.EdgeColor = "k";
    % Partial band gap Modes 2 and 3
    partialBandgap2 = patch(nan,nan,'k');
    partialBandgap2.FaceColor = '#0649FB';
    partialBandgap2.FaceAlpha = 0.8;
    partialBandgap2.EdgeColor = "k";
    % Full band gap Modes 1 and 2
    fullBandgap1 = patch(nan,nan,'k');
    fullBandgap1.FaceColor = '#FB0688';
    fullBandgap1.FaceAlpha = 0.8;
    fullBandgap1.EdgeColor = "k";
elseif index_lat == 4
    % Partial band gap Modes 2 and 3
    partialBandgap1 = patch(nan,nan,'k');
    partialBandgap1.FaceColor = '#066EFB';
    partialBandgap1.FaceAlpha = 0.8;
    partialBandgap1.EdgeColor = "k";
    % Partial band gap Modes 3 and 4
    partialBandgap2 = patch(nan,nan,'k');
    partialBandgap2.FaceColor = '#0649FB';
    partialBandgap2.FaceAlpha = 0.8;
    partialBandgap2.EdgeColor = "k";
    % Full band gap Modes 2 and 3
    fullBandgap1 = patch(nan,nan,'k');
    fullBandgap1.FaceColor = '#FB0688';
    fullBandgap1.FaceAlpha = 0.8;
    fullBandgap1.EdgeColor = "k";
    % Full band gap Modes 3 and 4
    fullBandgap2 = patch(nan,nan,'k');
    fullBandgap2.FaceColor = '#EC4D09';
    fullBandgap2.FaceAlpha = 0.8;
    fullBandgap2.EdgeColor = "k";
elseif index_lat == 5
    % Partial band gap Modes 3 and 4
    partialBandgap1 = patch(nan,nan,'k');
    partialBandgap1.FaceColor = '#066EFB';
    partialBandgap1.FaceAlpha = 0.8;
    partialBandgap1.EdgeColor = "k";
    % Partial band gap Modes 4 and 5
    partialBandgap2 = patch(nan,nan,'k');
    partialBandgap2.FaceColor = '#0649FB';
    partialBandgap2.FaceAlpha = 0.8;
    partialBandgap2.EdgeColor = "k";
    % Full band gap Modes 3 and 4
    fullBandgap1 = patch(nan,nan,'k');
    fullBandgap1.FaceColor = '#FB0688';
    fullBandgap1.FaceAlpha = 0.8;
    fullBandgap1.EdgeColor = "k";
    % Full band gap Modes 4 and 5
    fullBandgap2 = patch(nan,nan,'k');
    fullBandgap2.FaceColor = '#ed5fb9';
    fullBandgap2.FaceAlpha = 0.8;
    fullBandgap2.EdgeColor = "k";
end
%
%legend([fullBandgap, partialBandgap1, partialBandgap2,plot_pwe{:}, plot_epwe{:}, plot_res], legend_strings);
if index_lat == 1 || index_lat == 2 || index_lat == 3
    legend([fullBandgap1,plot_pwe{:}, plot_epwe{:}, plot_res], legend_strings)
    %legend([fullBandgap, partialBandgap1, partialBandgap2,plot_pwe{:}, plot_epwe{:}, plot_res], legend_strings);
elseif index_lat == 4 || index_lat == 5
    legend([fullBandgap1,fullBandgap2,plot_pwe{:}, plot_epwe{:}, plot_res], legend_strings)
    %legend([fullBandgap1,partialBandgap1,fullBandgap2,partialBandgap2,plot_pwe{:}, plot_epwe{:}, plot_res], legend_strings);
end
set(legend,'FontSize',9);
ylabel('Frequency [Hz]','fontsize',20,'fontweight','b')
%xlabel('[dB]','fontsize',16,'fontweight','b')
set(gca,'fontSize',20,'fontweight','b')
set(gca,'YScale', 'log')
%title('Real Part','fontsize',24,'fontweight','b')
%Configurando xlim e ylim dos plots
lat_a = .1;
gamma   =  [0 0];
if index_lat == 1 || index_lat == 2
    % Trajetorias
    X = pi*[1/lat_a 0];
    xticks([(lat_a/(2*pi))*gamma(1) (lat_a/(2*pi))*X(1)]);
    xlim([(lat_a/(2*pi))*gamma(1) (lat_a/(2*pi))*X(1)]);
    xticklabels({'\Gamma','X'});
elseif index_lat == 3
    % Trajetorias
    X       = (pi/lat_a)*[4/3   0];
    xticks([(lat_a/(2*pi))*gamma(1) (lat_a/(2*pi))*X(1)]);
    xlim([(lat_a/(2*pi))*gamma(1) (lat_a/(2*pi))*X(1)]);
    xticklabels({'\Gamma','X'});
elseif index_lat == 4
    % Trajetorias
    X       = (pi/lat_a)*[4/(3*sqrt(3))   0];
    xticks([(lat_a/(2*pi))*gamma(1) (lat_a/(2*pi))*X(1)]);
    xlim([(lat_a/(2*pi))*gamma(1) (lat_a/(2*pi))*X(1)]);
    xticklabels({'\Gamma','X'});
elseif index_lat == 5
    % Trajetorias
    X       = (pi/lat_a)*[2/3   0];
    xticks([(lat_a/(2*pi))*gamma(1) (lat_a/(2*pi))*X(1)]);
    xlim([(lat_a/(2*pi))*gamma(1) (lat_a/(2*pi))*X(1)]);
    xticklabels({'\Gamma','X'});
end
ylim([f_lim_inf f_lim_sup])

% Parte Imaginaria
subplot(1,3,2)
box on
hold on
%
m_epwe_imag_10 = [4,4,3,4,4];
m_epwe_imag_20 = [4,4,3,3,4];
m_epwe_imag_30 = [4,3,3,4,3];
m_epwe_imag_40 = [3,3,4,4,5];
m_epwe_imag_50 = [3,4,3,3,6];
m_epwe_imag_60 = [3,3,3,4,3];
m_epwe_imag_70 = [4,4,4,5,6];
m_epwe_imag_80 = [3,4,4,6,3];
m_epwe_imag_90 = [3,5,3,3,3];
m_epwe_imag_100 = [4,6,4,3,3];
m_epwe_imag_110 = [4,3,4,5,4];
m_epwe_imag_120 = [4,6,4,3,4];
m_epwe_imag_130 = [4,6,4,3,4];
m_epwe_imag_140 = [4,3,4,3,4];
m_epwe_imag_150 = [3,3,3,3,3];
%
nome_variavel = ['m_epwe_imag_', num2str(freq)];  % Cria o nome da variável
%
valor_variavel = eval(nome_variavel);
set(gca,'XScale', 'log');
%
rectangle_plot1(freq,index_lat,1e-4,1);
%%
% Inicialize uma célula para armazenar as strings de legenda
if index_lat == 1 || index_lat == 2 || index_lat == 3
    legend_strings = cell(1, 1 + 1);
    %
    legend_strings{1} = sprintf('FBGW 1 - \\Delta f_{12} = %.2f [Hz]', delta_f_gap);
    %legend_strings{2} = sprintf('Partial Band gap 1 - \\Delta f_{12} %.2f [Hz]', delta_f_gap1);
    %legend_strings{3} = sprintf('Partial Band gap 2 - \\Delta f_{23} %.2f [Hz]', delta_f_gap2);
elseif index_lat == 4
    legend_strings = cell(1, 1 + 1);
    %
    legend_strings{1} = sprintf('FBGW 1 - \\Delta f_{23} = %.2f [Hz]',delta_f_gap11);
    %legend_strings{2} = sprintf('Partial Band gap 1 - \\Delta f_{23} %.2f [Hz]',delta_f_gap12);
    legend_strings{2} = sprintf('FBGW 2 - \\Delta f_{34} = %.2f [Hz]',delta_f_gap21);
    %legend_strings{4} = sprintf('Partial Band gap 2 - \\Delta f_{34} %.2f [Hz]',delta_f_gap22);
elseif index_lat == 5
    legend_strings = cell(1, 1 + 1);
    %
    legend_strings{1} = sprintf('FBGW 1 - \\Delta f_{34} = %.2f [Hz]',delta_f_gap11);
    %legend_strings{2} = sprintf('Partial Band gap 1 - \\Delta f_{34} %.2f [Hz]',delta_f_gap12);
    legend_strings{2} = sprintf('FBGW 2 - \\Delta f_{45} = %.2f [Hz]',delta_f_gap21);
    %legend_strings{4} = sprintf('Partial Band gap 2 - \\Delta f_{45} %.2f [Hz]',delta_f_gap22);
end
%%
vec_max = [];
if index_lat == 1
    plot_epwe_im = plot(w_kk_epwe_imag_res(valor_variavel(1),:),freq_epwe_res(:),...
        'LineStyle', '-','LineWidth', 4,'Color','#F3C92F');
    legend_strings{2} = sprintf('K-L (EPWE - \\Im) - Mode %g',valor_variavel(1));
    [maxValue, maxIndex] = max(w_kk_epwe_imag_res(valor_variavel(1),:));
    vec_max = [vec_max;maxValue maxIndex];
    scatter(vec_max(1,1),freq_epwe_res(vec_max(1,2)),...
        100,'MarkerEdgeColor','k','MarkerFaceColor','#F3C92F','LineWidth',1.5);
elseif index_lat == 2
    plot_epwe_im = plot(w_kk_epwe_imag_res(valor_variavel(2),:),freq_epwe_res(:),...
        'LineStyle', '-','LineWidth', 4,'Color','#F3C92F');
    legend_strings{2} = sprintf('K-L (EPWE - \\Im) - Mode %g',valor_variavel(2));
    [maxValue, maxIndex] = max(w_kk_epwe_imag_res(valor_variavel(2),:));
    vec_max = [vec_max;maxValue maxIndex];
    scatter(vec_max(1,1),freq_epwe_res(vec_max(1,2)),...
        100,'MarkerEdgeColor','k','MarkerFaceColor','#F3C92F','LineWidth',1.5);
elseif index_lat == 3
    plot_epwe_im = plot(w_kk_epwe_imag_res(valor_variavel(3),:),freq_epwe_res(:),...
        'LineStyle', '-','LineWidth', 4,'Color','#F3C92F');
    legend_strings{2} = sprintf('K-L (EPWE - \\Im): Mode %g',valor_variavel(3));
    [maxValue, maxIndex] = max(w_kk_epwe_imag_res(valor_variavel(3),:));
    vec_max = [vec_max;maxValue maxIndex];
    scatter(vec_max(1,1),freq_epwe_res(vec_max(1,2)),...
        100,'MarkerEdgeColor','k','MarkerFaceColor','#F3C92F','LineWidth',1.5);
elseif index_lat == 4
    plot_epwe_im = plot(w_kk_epwe_imag_res(valor_variavel(4),:),freq_epwe_res(:),...
        'LineStyle', '-','LineWidth', 4,'Color','#F3C92F');
    legend_strings{3} =  sprintf('K-L (EPWE - \\Im): Mode %g',valor_variavel(4));
    [maxValue, maxIndex] = max(w_kk_epwe_imag_res(valor_variavel(4),:));
    vec_max = [vec_max;maxValue maxIndex];
    scatter(vec_max(1,1),freq_epwe_res(vec_max(1,2)),...
        100,'MarkerEdgeColor','k','MarkerFaceColor','#F3C92F','LineWidth',1.5);
elseif index_lat == 5
    plot_epwe_im = plot(w_kk_epwe_imag_res(valor_variavel(5),:),freq_epwe_res(:),...
        'LineStyle', '-','LineWidth', 4,'Color','#F3C92F');
    legend_strings{3} =  sprintf('K-L (EPWE - \\Im): Mode %g',valor_variavel(5));
    [maxValue, maxIndex] = max(w_kk_epwe_imag_res(valor_variavel(5),:));
    vec_max = [vec_max;maxValue maxIndex];
    scatter(vec_max(1,1),freq_epwe_res(vec_max(1,2)),...
        100,'MarkerEdgeColor','k','MarkerFaceColor','#F3C92F','LineWidth',1.5);
end
% Inserindo linha de referencia da ressonância local
plot_res = yline(freq,'-.','Color','b','LineWidth',2.5);
if index_lat == 1 || index_lat == 2 || index_lat == 3
    legend_strings{3} = sprintf('Lrsc: %g [Hz]', freq);
elseif index_lat == 4 || index_lat == 5
    legend_strings{4} = sprintf('Lrsc: %g [Hz]', freq);
end
%----------------------------------------------------------------------
grid on
if index_lat == 1 || index_lat == 2 || index_lat == 3
        % Partial band gap Modes 1 and 2
        partialBandgap1 = patch(nan,nan,'k');
        partialBandgap1.FaceColor = '#066EFB';
        partialBandgap1.FaceAlpha = 0.8;
        partialBandgap1.EdgeColor = "k";
        % Partial band gap Modes 2 and 3
        partialBandgap2 = patch(nan,nan,'k');
        partialBandgap2.FaceColor = '#0649FB';
        partialBandgap2.FaceAlpha = 0.8;
        partialBandgap2.EdgeColor = "k";
        % Full band gap Modes 1 and 2
        fullBandgap1 = patch(nan,nan,'k');
        fullBandgap1.FaceColor = '#FB0688';
        fullBandgap1.FaceAlpha = 0.8;
        fullBandgap1.EdgeColor = "k";
elseif index_lat == 4
    % Partial band gap Modes 2 and 3
    partialBandgap1 = patch(nan,nan,'k');
    partialBandgap1.FaceColor = '#066EFB';
    partialBandgap1.FaceAlpha = 0.8;
    partialBandgap1.EdgeColor = "k";
    % Partial band gap Modes 3 and 4
    partialBandgap2 = patch(nan,nan,'k');
    partialBandgap2.FaceColor = '#0649FB';
    partialBandgap2.FaceAlpha = 0.8;
    partialBandgap2.EdgeColor = "k";
    % Full band gap Modes 2 and 3
    fullBandgap1 = patch(nan,nan,'k');
    fullBandgap1.FaceColor = '#FB0688';
    fullBandgap1.FaceAlpha = 0.8;
    fullBandgap1.EdgeColor = "k";
    % Full band gap Modes 3 and 4
    fullBandgap2 = patch(nan,nan,'k');
    fullBandgap2.FaceColor = '#EC4D09';
    fullBandgap2.FaceAlpha = 0.8;
    fullBandgap2.EdgeColor = "k";
elseif index_lat == 5
    % Partial band gap Modes 3 and 4
    partialBandgap1 = patch(nan,nan,'k');
    partialBandgap1.FaceColor = '#066EFB';
    partialBandgap1.FaceAlpha = 0.8;
    partialBandgap1.EdgeColor = "k";
    % Partial band gap Modes 4 and 5
    partialBandgap2 = patch(nan,nan,'k');
    partialBandgap2.FaceColor = '#0649FB';
    partialBandgap2.FaceAlpha = 0.8;
    partialBandgap2.EdgeColor = "k";
    % Full band gap Modes 3 and 4
    fullBandgap1 = patch(nan,nan,'k');
    fullBandgap1.FaceColor = '#FB0688';
    fullBandgap1.FaceAlpha = 0.8;
    fullBandgap1.EdgeColor = "k";
    % Full band gap Modes 4 and 5
    fullBandgap2 = patch(nan,nan,'k');
    fullBandgap2.FaceColor = '#ed5fb9';
    fullBandgap2.FaceAlpha = 0.8;
    fullBandgap2.EdgeColor = "k";
end
% Crie a legenda usando as variáveis e strings de legenda
if index_lat == 1 || index_lat == 2 || index_lat == 3
    legend([fullBandgap1,plot_epwe_im, plot_res], legend_strings);
    %legend([fullBandgap, partialBandgap1, partialBandgap2,plot_epwe_im, plot_res], legend_strings);
elseif index_lat == 4 || index_lat == 5
    legend([fullBandgap1,fullBandgap2,plot_epwe_im, plot_res], legend_strings);
    %legend([fullBandgap1,partialBandgap1,fullBandgap2,partialBandgap2,plot_epwe_im, plot_res], legend_strings);
end
ylabel('Frequency [Hz]','fontsize',20,'fontweight','b')
set(legend,'FontSize',9);
set(legend,'Location','northwest');
set(gca,'YScale', 'log');
set(gca,'fontSize',20,'fontweight','b');
%title('Imaginary Part','fontsize',24,'fontweight','b');
grid on
xlim([1e-4 1]);
ylim([f_lim_inf f_lim_sup]);
%
subplot(1,3,3)
lim_inf_frf_rect = -400;
lim_sup_frf_rect = 50;
%%
pwd_current = pwd;
% Chamada da funcao que determina intervalo de Bands gaps parciais e totais
if index_lat == 1
    [frq_inf,frq_sup,delta_f_gap] = func_lattice_square_bg_full(freq)
    cd(pwd_current);
    [frq_inf1,frq_sup1,delta_f_gap1,frq_inf2,frq_sup2,delta_f_gap2] = func_lattice_square_bg_partial(freq)
    cd(pwd_current);
elseif index_lat == 2
    [frq_inf,frq_sup,delta_f_gap] = func_lattice_rect_bg_full(freq)
    cd(pwd_current);
    [frq_inf1,frq_sup1,delta_f_gap1,frq_inf2,frq_sup2,delta_f_gap2] = func_lattice_rect_bg_partial(freq);
    cd(pwd_current);
elseif index_lat == 3
    [frq_inf,frq_sup,delta_f_gap] = func_lattice_trian_bg_full(freq)
    cd(pwd_current);
    [frq_inf1,frq_sup1,delta_f_gap1,frq_inf2,frq_sup2,delta_f_gap2] = func_lattice_trian_bg_partial(freq);
    cd(pwd_current);
elseif index_lat == 4
    [frq_inf11,frq_sup11,delta_f_gap11,frq_inf21,frq_sup21,delta_f_gap21] = func_lattice_hex_bg_full(freq)
    cd(pwd_current);
    [frq_inf12,frq_sup12,delta_f_gap12,frq_inf22,frq_sup22,delta_f_gap22] = func_lattice_hex_bg_partial(freq)
    cd(pwd_current);
elseif index_lat == 5
    [frq_inf11,frq_sup11,delta_f_gap11,frq_inf21,frq_sup21,delta_f_gap21] = func_lattice_kag_bg_full(freq)
    cd(pwd_current);
    [frq_inf01,frq_sup01,delta_f_gap01,frq_inf02,frq_sup02,delta_f_gap02,...
        frq_inf12,frq_sup12,delta_f_gap12,frq_inf22,frq_sup22,delta_f_gap22] = func_lattice_kag_bg_partial(freq);
    cd(pwd_current);
end
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
% Carregamento total para acesso das FRFs da Placa lisa
F_exec_0 = csvread(strcat(pwd,'\0_bare_plate_2mm\2_Transmittance\',str_vec_dp));
mps_0_1 = csvread(strcat(pwd,'\0_bare_plate_2mm\2_Transmittance\',str_vec_mp1));
mps_0_2 = csvread(strcat(pwd,'\0_bare_plate_2mm\2_Transmittance\',str_vec_mp2));
mps_0_3 = csvread(strcat(pwd,'\0_bare_plate_2mm\2_Transmittance\',str_vec_mp3));
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
% Vetor de frequencia para a placa lisa
freq_0 = F_exec_0(:,1);
% Vetores de Transmitância para a placa lisa
T0_1 = (mps_0_1(:,2) - F_exec_0(:,2));
T0_2 = (mps_0_2(:,2) - F_exec_0(:,2));
T0_3 = (mps_0_3(:,2) - F_exec_0(:,2));
% Vetor de frequencia para a placa com ressonador local
freq_1 = F_exec_1(:,1);
% Vetores de Transmitância para a placa com ressonador local
freq_11 = F_exec_1(:,1);
T1_1 = (mps_1_1(:,2) - F_exec_1(:,2));
T1_2 = (mps_1_2(:,2) - F_exec_1(:,2));
T1_3 = (mps_1_3(:,2) - F_exec_1(:,2));
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
box on
grid on
hold on
rectangle_plot1(freq,index_lat,lim_inf_frf_rect,lim_sup_frf_rect)
plot_T1 = plot(T1_1,F_exec_1(:,1),'LineStyle', '-','LineWidth', 2,'Color','#01FA67')
%plot_T2 = plot(T1_2,F_exec_1(:,1),'LineStyle', '-','LineWidth', 2,'Color','#AE01FA')
%plot_T3 = plot(T1_3,F_exec_1(:,1),'LineStyle', '-','LineWidth', 2,'Color','c')
plot_res = yline(freq,'-.','Color','b','LineWidth',2.5);
plot(coords_trans1(:,2),coords_trans1(:,1),'o','Color','k','MarkerFaceColor','#01FA67','MarkerSize',10,'LineWidth',2)
%plot(coords_trans2(:,2),coords_trans2(:,1),'o','Color','k','MarkerFaceColor','#AE01FA','MarkerSize',10,'LineWidth',2)
%plot(coords_trans3(:,2),coords_trans3(:,1),'o','Color','k','MarkerFaceColor','c','MarkerSize',10,'LineWidth',2)
if index_lat == 1 || index_lat == 2 || index_lat == 3
    % Partial band gap Modes 1 and 2
    partialBandgap1 = patch(nan,nan,'k');
    partialBandgap1.FaceColor = '#066EFB';
    partialBandgap1.FaceAlpha = 0.8;
    partialBandgap1.EdgeColor = "k";
    % Partial band gap Modes 2 and 3
    partialBandgap2 = patch(nan,nan,'k');
    partialBandgap2.FaceColor = '#0649FB';
    partialBandgap2.FaceAlpha = 0.8;
    partialBandgap2.EdgeColor = "k";
    % Full band gap Modes 1 and 2
    fullBandgap = patch(nan,nan,'k');
    fullBandgap.FaceColor = '#FB0688';
    fullBandgap.FaceAlpha = 0.8;
    fullBandgap.EdgeColor = "k";
elseif index_lat == 4
    % Partial band gap Modes 2 and 3
    partialBandgap1 = patch(nan,nan,'k');
    partialBandgap1.FaceColor = '#066EFB';
    partialBandgap1.FaceAlpha = 0.8;
    partialBandgap1.EdgeColor = "k";
    % Partial band gap Modes 3 and 4
    partialBandgap2 = patch(nan,nan,'k');
    partialBandgap2.FaceColor = '#0649FB';
    partialBandgap2.FaceAlpha = 0.8;
    partialBandgap2.EdgeColor = "k";
    % Full band gap Modes 2 and 3
    fullBandgap1 = patch(nan,nan,'k');
    fullBandgap1.FaceColor = '#FB0688';
    fullBandgap1.FaceAlpha = 0.8;
    fullBandgap1.EdgeColor = "k";
    % Full band gap Modes 3 and 4
    fullBandgap2 = patch(nan,nan,'k');
    fullBandgap2.FaceColor = '#EC4D09';
    fullBandgap2.FaceAlpha = 0.8;
    fullBandgap2.EdgeColor = "k";
elseif index_lat == 5
    % Partial band gap Modes 3 and 4
    partialBandgap1 = patch(nan,nan,'k');
    partialBandgap1.FaceColor = '#066EFB';
    partialBandgap1.FaceAlpha = 0.8;
    partialBandgap1.EdgeColor = "k";
    % Partial band gap Modes 4 and 5
    partialBandgap2 = patch(nan,nan,'k');
    partialBandgap2.FaceColor = '#0649FB';
    partialBandgap2.FaceAlpha = 0.8;
    partialBandgap2.EdgeColor = "k";
    % Full band gap Modes 3 and 4
    fullBandgap1 = patch(nan,nan,'k');
    fullBandgap1.FaceColor = '#FB0688';
    fullBandgap1.FaceAlpha = 0.8;
    fullBandgap1.EdgeColor = "k";
    % Full band gap Modes 4 and 5
    fullBandgap2 = patch(nan,nan,'k');
    fullBandgap2.FaceColor = '#ed5fb9';
    fullBandgap2.FaceAlpha = 0.8;
    fullBandgap2.EdgeColor = "k";
end
% Defina as legendas usando sprintf
if index_lat == 1 || index_lat == 2 || index_lat == 3
    legend([fullBandgap,...
        plot_T1,plot_res], ...
        sprintf('FBGW 1 - \\Delta f_{12} = %.2f [Hz]',delta_f_gap), ...
        sprintf('K-L: Lrsc %g [Hz] (FEM) - FRF - Peak value: %.2f [dB]',freq,coords_trans1(:,2)), ...
        sprintf('LRSC: %g [Hz]',freq));
        %sprintf('Partial Band gap 1 - \\Delta f_{12} %.2f [Hz]',delta_f_gap1), ...
        %sprintf('Partial Band gap 2 - \\Delta f_{23} %.2f [Hz]',delta_f_gap2), ...
elseif index_lat == 4
    legend([fullBandgap1,fullBandgap2,...
        plot_T1,plot_res], ...
        sprintf('FBGW 1 - \\Delta f_{23} = %.2f [Hz]',delta_f_gap11), ...
        sprintf('FBGW 2 - \\Delta f_{34} = %.2f [Hz]',delta_f_gap21), ...        
        sprintf('K-L: LRSC %g [Hz] (FEM) - FRF - Peak value: %.2f [dB]',freq,coords_trans1(:,2)), ...
        sprintf('LRSC: %g [Hz]',freq));
        %sprintf('Partial Band gap 1 - \\Delta f_{23} %.2f [Hz]',delta_f_gap12), ...
        %sprintf('Partial Band gap 2 - \\Delta f_{34} %.2f [Hz]',delta_f_gap22), ...
elseif index_lat == 5
    legend([fullBandgap1,fullBandgap2,...
        plot_T1,plot_res], ...
        sprintf('FBGW 1 - \\Delta f_{34} = %.2f [Hz]',delta_f_gap11), ...
        sprintf('FBGW 2 - \\Delta f_{45} = %.2f [Hz]',delta_f_gap21), ...       
        sprintf('K-L: LRSC %g [Hz] (FEM) - FRF - Peak value: %.2f [dB]',freq,coords_trans1(:,2)), ...
        sprintf('LRSC: %g [Hz]',freq));
        %sprintf('Partial Band gap 1 - \\Delta f_{34} %.2f [Hz]',delta_f_gap12), ...
        %sprintf('Partial Band gap 2 - \\Delta f_{45} %.2f [Hz]',delta_f_gap22), ...
end
set(legend,'FontSize',9);
ylabel('Frequency [Hz]','fontsize',20,'fontweight','b')
xlabel('Receptance [dB re 1.0 m/N]','fontsize',20,'fontweight','b')
set(gca,'fontSize',20,'fontweight','b')
set(gca,'YScale', 'log')
%title('Transmittance','fontsize',24,'fontweight','b')
%
menor_valor = min(min([T1_1, T1_2, T1_3]));
%
xlim([menor_valor-10 30])
ylim([f_lim_inf f_lim_sup]) ;
cd('3_figs_frfs')
path_figs = pwd;
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
% Configuração do tamanho A4 em paisagem
% Ajustar o tamanho da figura para ocupar o máximo possível em um papel A4
set(gcf, 'Units', 'centimeters');
pos = get(gcf, 'Position');
width = 29.7; % Largura do papel A4 em centímetros (modo paisagem)
height = 21; % Altura do papel A4 em centímetros (modo paisagem)
set(gcf, 'Position', [pos(1) pos(2) width height]);

name_fig = strcat('fig_1_',num2str(index_lat),'_tr_',str_lat(index_lat),'_lattice_fig_1_re_im_tr')
file_fig = strcat(path_full, name_fig,'.fig');
savefig(1,file_fig);
file_eps = strcat(path_full, name_fig,'.eps');
saveas(1,file_eps,'epsc');
file_png = strcat(path_full, name_fig,'.png');
saveas(1,file_png);

% Salvar a figura em um arquivo
print(name_fig, '-dpdf', '-r300'); % Substitua 'nome_do_arquivo' pelo nome desejado

h = figure(1)
set(h, 'WindowStyle', 'Docked');
cd(pwd_current)

