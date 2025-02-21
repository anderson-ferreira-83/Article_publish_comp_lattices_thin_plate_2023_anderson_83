function func3_lattice4_hexagonal_plot_line_fig2 = honeycomb_dispersion(i_fi_f,i_ff_f)
%%
i_fi = i_fi_f;
i_ff = i_ff_f;
% Intervalos para Bandas em funcao do Numero de onda
i_bdi = 0;
i_bdf = 5;
%----------------------------------------------------------------------
% Load Data Curve FBGW
data_pwe_res_freq=csvread('4_0_a_0.1_h_0.002_lattice_hexagonal_all_data_res.csv');
% Load Data PWE Bare Plate
w_kk_pwe_bare = csvread('4_1_a_0.10_h_0.002_lattice_h_bare_pwe_w_data_full_path.csv');
freq_pwe_bare = csvread('4_2_a_0.10_h_0.002_lattice_h_bare_pwe_f_data_full_path.csv');
%----------------------------------------------------------------------
%%
% % Variavel para alocacao dos dados a serem exportados
% data_res = [];
% cont_sub_plot = 1;
% for sub_plot_freq=10:10:200
%     % Load Data PWE Resonator
%     % Numberwave
%     pwe_file_w_res = strcat('4_1_a_0.10_h_0.002_lattice_h_res_',...
%         num2str(sub_plot_freq),'_pwe_w_data_full_path.csv');
%     w_kk_pwe_res = csvread(pwe_file_w_res);
%     % Frequency
%     pwe_file_f_res = strcat('4_2_a_0.10_h_0.002_lattice_h_res_',...
%         num2str(sub_plot_freq),'_pwe_f_data_full_path.csv');
%     freq_pwe_res = csvread(pwe_file_f_res);
%     %===================================================
%     % Varredura para determinar a largura do Band Gap
%     %===================================================
%     % Coords Modo 1
%     w_kk_1 = w_kk_pwe_res(1,:);
%     % freq
%     freq_1 = freq_pwe_res(1,:);
%     %---------------------------------------------------------------------
%     % Coords Modo 2
%     % Num onda
%     w_kk_2 = w_kk_pwe_res(2,:);
%     % freq
%     freq_2 = freq_pwe_res(2,:);
%     %---------------------------------------------------------------------
%     % Coords Modo 3
%     % Num onda
%     w_kk_3 = w_kk_pwe_res(3,:);
%     % freq
%     freq_3 = freq_pwe_res(3,:);
%     %---------------------------------------------------------------------
%     % Coords Modo 4
%     % Num onda
%     w_kk_4 = w_kk_pwe_res(4,:);
%     % freq
%     freq_4 = freq_pwe_res(4,:);
%     %---------------------------------------------------------------------
%     % Encontrar a menor distância entre os modos 1 e 2
%     y1 = freq_pwe_res(1,:);
%     y2 = freq_pwe_res(2,:);
%     % Inicializar a menor distância com um valor grande
%     minDist = Inf;
%     minIndex1 = 0;
%     minIndex2 = 0;
%     % Loop para comparar todas as combinações de pontos
%     for i = 1:length(y1)
%         for j = 1:length(y2)
%             % Calcula a distância entre os pontos
%             distY = abs(y1(i) - y2(j));
%             % Verifica se a distância atual é menor que a mínima distância encontrada até agora
%             if distY < minDist
%                 minDist = distY;
%                 minIndex1 = i;
%                 minIndex2 = j;
%             end
%         end
%     end
%     delta_f_gap0 = minDist;
%     index10 =  minIndex1;
%     index20 =  minIndex2;
%     % Encontrar a menor distância entre os modos 2 e 3
%     y1 = freq_pwe_res(2,:);
%     y2 = freq_pwe_res(3,:);
%     % Inicializar a menor distância com um valor grande
%     minDist = Inf;
%     minIndex1 = 0;
%     minIndex2 = 0;
%     % Loop para comparar todas as combinações de pontos
%     for i = 1:length(y1)
%         for j = 1:length(y2)
%             % Calcula a distância entre os pontos
%             distY = abs(y1(i) - y2(j));
%             % Verifica se a distância atual é menor que a mínima distância encontrada até agora
%             if distY < minDist
%                 minDist = distY;
%                 minIndex1 = i;
%                 minIndex2 = j;
%             end
%         end
%     end
%     delta_f_gap1 = minDist;
%     index11 =  minIndex1;
%     index21 =  minIndex2;
%     % Encontrar a menor distância entre os modos 3 e 4
%     y1 = freq_pwe_res(3,:);
%     y2 = freq_pwe_res(4,:);
%     % Inicializar a menor distância com um valor grande
%     minDist = Inf;
%     minIndex1 = 0;
%     minIndex2 = 0;
%     % Loop para comparar todas as combinações de pontos
%     for i = 1:length(y1)
%         for j = 1:length(y2)
%             % Calcula a distância entre os pontos
%             distY = abs(y1(i) - y2(j));
%             % Verifica se a distância atual é menor que a mínima distância encontrada até agora
%             if distY < minDist
%                 minDist = distY;
%                 minIndex1 = i;
%                 minIndex2 = j;
%             end
%         end
%     end
%     delta_f_gap2 = minDist;
%     index12 =  minIndex1;
%     index22 = minIndex2;
%     %%
%     data_res(cont_sub_plot,:) = [sub_plot_freq...
%         freq_2(index11) freq_3(index21) delta_f_gap1...
%         freq_3(index12) freq_4(index22) delta_f_gap2];
%     %%
%     fig1 = figure(11);
%     colorPalette = {
%         '#EDB120', ...
%         '#40E0D0', ...
%         '#FA8072', ...
%         '#CCCCFF', ...
%         '#D95319', ...
%         '#0072BD', ...
%         '#4DBEEE'
%         };
%     subplot(5,4,cont_sub_plot)
%     box on
%     hold on
%     % Primeiro controle: Assegura indices de legendas com ou sem band gaps
%     % completos
%     %cont=1;
%     % Modos 1 e 2
%     if (delta_f_gap0 >= 1)
%         rectangle_position = [0, freq_1(index10), 5,delta_f_gap0]; % [x, y, largura, altura]
%         rectangle('Position', rectangle_position, 'FaceColor', 'g', 'EdgeColor', 'none')
%     end
%     % Modos 2 e 3
%     if (delta_f_gap1 >= 1)
%         rectangle_position = [0, freq_2(index11), 5,delta_f_gap1]; % [x, y, largura, altura]
%         rectangle('Position', rectangle_position, 'FaceColor', 'r', 'EdgeColor', 'none')
%     end
%     % Modos 3 e 4
%     if (delta_f_gap2 >= 1)
%         rectangle_position = [0, freq_3(index12), 5,delta_f_gap2]; % [x, y, largura, altura]
%         rectangle('Position', rectangle_position, 'FaceColor', 'b', 'EdgeColor', 'none')
%     end
%     for i=1:5
%         plot(w_kk_pwe_res(i,:),freq_pwe_res(i,:),'Color',colorPalette{i},'LineWidth',2)
%         plot(w_kk_pwe_bare(i,:),freq_pwe_bare(i,:),'--k','LineWidth',1)
%     end
%     %legendText{cont} = sprintf('K-L: Hexagonal Lattice (PWE): %g [Hz]',sub_plot_freq);
%     if (delta_f_gap0 >= 1)
%         sz1 = 40;
%         scatter(w_kk_1(index10),freq_1(index10),sz1,'MarkerEdgeColor','k','MarkerFaceColor','g','LineWidth',1)
%         scatter(w_kk_2(ponto20),freq_2(ponto20),sz1,'MarkerEdgeColor','k','MarkerFaceColor','g','LineWidth',1)
%     end
%     if (delta_f_gap1 >= 1)        
%         sz1 = 40;
%         scatter(w_kk_2(index11),freq_2(index11),sz1,'MarkerEdgeColor','k','MarkerFaceColor','r','LineWidth',1)
%         scatter(w_kk_3(index21),freq_3(index21),sz1,'MarkerEdgeColor','k','MarkerFaceColor','r','LineWidth',1)
%     end
%     if (delta_f_gap2 >= 1)
%         sz1 = 40;
%         scatter(w_kk_3(index12),freq_3(index12),sz1,'MarkerEdgeColor','r','MarkerFaceColor','b','LineWidth',1)
%         scatter(w_kk_4(index22),freq_4(index22),sz1,'MarkerEdgeColor','r','MarkerFaceColor','b','LineWidth',1)
%     end
%     set(gca,'YScale', 'log')
%     set(gca,'fontSize',8,'fontweight','b')
%     xlim([0 5])
%     if (sub_plot_freq > 40)
%         i_fi=40;
%         i_ff=120;
%     end
%     if (sub_plot_freq > 80)
%         i_fi=80;
%         i_ff=170;
%     end
%     if (sub_plot_freq > 120)
%         i_fi=110;
%         i_ff=180;
%     end
%     if(sub_plot_freq > 160)
%         i_fi=130;
%         i_ff=220;
%     end
%     ylim([i_fi i_ff])
%     grid on
%     for i=1:5
%         xline(i,'--k','LineWidth',0.5);
%     end
%     x = linspace(i_bdi, i_bdf, 100); % Intervalo de valores de x
%     y = sub_plot_freq * ones(size(x));    % Valores constantes de y (30)
%     curve_handles(1,1)= plot(x,y,...
%     'DisplayName',sprintf('fr =  %g [Hz],\\Deltaf_{23} = %.1f [Hz],\\Deltaf_{34} = %.1f [Hz]',...
%     sub_plot_freq,delta_f_gap1,delta_f_gap2),...
%     'LineStyle', '-.','LineWidth', 1.2,'Color','k');
%     % Selecionar as curvas específicas para a legenda final
%     selected_curves = [1];  % Índice das curvas selecionadas
%     % Criar legenda com as curvas selecionadas
%     legend([curve_handles(1, selected_curves(1))],...
%     'Location', 'northwest');
%     set(legend,'FontSize',7);    
%     % Give common xlabel, ylabel and title to your figure
%     han=axes(fig1,'visible','off');
%     han.Title.Visible='on';
%     han.XLabel.Visible='on';
%     xlabel({'M´ \rightarrow \Gamma \rightarrow X \rightarrow M \rightarrow X´ \rightarrow M´'},'fontsize',20,'fontweight','b')
%     han.YLabel.Visible='on';
%     ylabel(han,'Frequency [Hz]','fontsize',22,'fontweight','b');
%     %xlabel(han,'yourXLabel');
%     title(han,'Honeycomb reduced wave vector k','fontsize',22,'fontweight','b');
%     cont_sub_plot = cont_sub_plot +1;
% end
% % Definindo o rotulo da figura
% label_file_res = sprintf('4_3_a_%g_h_%g_lattice_hexagonal_res',0.1,0.002);
% % Obtendo o caminho do diretorio acima do diretorio atual
% [pai, ~, ~] = fileparts(pwd);
% % Exportando figura com extensao .fig
% fig_11 = fullfile(strcat(pai,'\3_figs\figs_2'), [label_file_res, '.fig']);
% savefig(fig_11);
% % Exportando figura com extensao .eps
% fig1_eps = fullfile(strcat(pai,'\3_figs\figs_2'), [label_file_res, '.eps']);
% saveas(fig1,fig1_eps,'epsc');
% % Exportando figura com extensao .png
% fig1_png = fullfile(strcat(pai,'\3_figs\figs_2'), [label_file_res, '.png']);
% saveas(fig1,fig1_png,'png');
% %%
% % Modos 2 e 3
% % Encontre o valor máximo da curva e sua posição
% [maximo1, indice_maximo1] = max(data_pwe_res_freq(:,9));
% legendText{1} = sprintf('Max \\Deltaf_{23} = %.2f [Hz] in fr = %d [Hz]',...
%     data_pwe_res_freq(indice_maximo1,9), data_pwe_res_freq(indice_maximo1,3));
% legendText{2} = ('Curve Fbgw beteween Modes 2 and 3');
% % Modos 3 e 4
% % Encontre o valor máximo da curva e sua posição
% [maximo2, indice_maximo2] = max(data_pwe_res_freq(:,12));
% legendText{3} = sprintf('Max \\Deltaf_{34} = %.2f [Hz] in fr = %d [Hz]',...
%     data_pwe_res_freq(indice_maximo2,12), data_pwe_res_freq(indice_maximo2,3));
% legendText{4} = ('Curve Fbgw beteween Modes 3 and 4');
% % Figura 2
% fig2 = figure(12);
% subplot(1,3,1)
% box on
% hold on
% scatter(data_pwe_res_freq(indice_maximo1,3),data_pwe_res_freq(indice_maximo1,9),...
%     120,'MarkerEdgeColor','k','MarkerFaceColor','r','LineWidth',1.5)
% plot(data_pwe_res_freq(:,3),data_pwe_res_freq(:,9),'-r','LineWidth',4)
% scatter(10:10:200,data_res(:,4),100,'MarkerEdgeColor','k','MarkerFaceColor','r','LineWidth',1.5)
% legend(legendText{1},legendText{2})
% set(legend,'FontSize',12);
% set(gca,'fontSize',8,'fontweight','b')
% %xlabel('Resonator frequency [Hz]','fontsize',20,'fontweight','b')
% %ylabel('Full band gap width [Hz]','fontsize',20,'fontweight','b')
% grid on
% %title('Full band gap witdth in Honeycomb lattice','fontsize',15)
% set(gca,'fontSize',15,'fontweight','b')
% ylim([0 16])
% xlim([0 200])
% 
% subplot(1,3,2)
% box on
% hold on
% scatter(data_pwe_res_freq(indice_maximo2,3),data_pwe_res_freq(indice_maximo2,12),...
%     120,'MarkerEdgeColor','r','MarkerFaceColor','b','LineWidth',1.5)
% plot(data_pwe_res_freq(:,3),data_pwe_res_freq(:,12),'-b','LineWidth',4)
% scatter(10:10:200,data_res(:,7),100,'MarkerEdgeColor','r','MarkerFaceColor','b','LineWidth',1.2)
% legend(legendText{3},legendText{4})
% set(legend,'FontSize',12);
% set(gca,'fontSize',8,'fontweight','b')
% %xlabel('Resonator frequency [Hz]','fontsize',20,'fontweight','b')
% %ylabel('Full band gap width [Hz]','fontsize',20,'fontweight','b')
% grid on
% %title('Full band gap witdth in Honeycomb lattice','fontsize',15)
% set(gca,'fontSize',15,'fontweight','b')
% ylim([0 30])
% xlim([0 200])
% 
% subplot(1,3,3)
% axis off; % Desativa os rótulos dos eixos e as grades
% box off;  % Remove a caixa ao redor do eixo
% % box on
% % hold on
% % scatter(data_pwe_res_freq(indice_maximo1,3),data_pwe_res_freq(indice_maximo1,9),...
% %     120,'MarkerEdgeColor','k','MarkerFaceColor','r','LineWidth',1.5)
% % plot(data_pwe_res_freq(:,3),data_pwe_res_freq(:,9),'-r','LineWidth',3)
% % scatter(data_pwe_res_freq(indice_maximo2,3),data_pwe_res_freq(indice_maximo2,12),...
% %     120,'MarkerEdgeColor','r','MarkerFaceColor','b','LineWidth',1.5)
% % plot(data_pwe_res_freq(:,3),data_pwe_res_freq(:,12),'-b','LineWidth',3)
% % scatter(10:10:200,data_res(:,4),100,'MarkerEdgeColor','k','MarkerFaceColor','r','LineWidth',1.5)
% % scatter(10:10:200,data_res(:,7),100,'MarkerEdgeColor','r','MarkerFaceColor','b','LineWidth',1.5)
% % %legend(legendText)
% % %set(legend,'FontSize',12);
% % set(gca,'fontSize',8,'fontweight','b')
% % %xlabel('Resonator frequency [Hz]','fontsize',20,'fontweight','b')
% % %ylabel('Full band gap width [Hz]','fontsize',20,'fontweight','b')
% % grid on
% % %title('Full band gap witdth in Honeycomb lattice','fontsize',15)
% % set(gca,'fontSize',15,'fontweight','b')
% % ylim([0 30])
% % xlim([0 200])
% %
% % Give common xlabel, ylabel and title to your figure
% han=axes(fig2,'visible','off');
% han.Title.Visible='on';
% han.XLabel.Visible='on';
% %xlabel(han,'Resonator frequency [Hz]','fontsize',20,'fontweight','b')
% han.YLabel.Visible='on';
% %ylabel(han,'Full band gap width [Hz]','fontsize',22,'fontweight','b');
% %xlabel(han,'yourXLabel');
% %title(han,'Honeycomb reduced wave vector k','fontsize',22,'fontweight','b');
% % Definindo o rotulo da figura
% label_file_res = sprintf('4_4_a_%g_h_%g_lattice_hexagonal_res',0.1,0.002);
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
% %%
% % Criando e exportando dados das 20 sim da Rede quadrada
% % Specify the CSV file name
% csvFileName = sprintf('4_5_a_%g_h_%g_lattice_hexagonal_data_res.csv',0.1,0.002);
% % Criar nome de arquivo temporário
% tempFileName = 'tempfile.csv';
% % Exportar novos dados para o arquivo temporário
% csvwrite(tempFileName, data_res);
% % Substituir o arquivo original pelo temporário
% delete(csvFileName); % Excluir o arquivo original
% movefile(tempFileName, csvFileName); % Renomear o arquivo temporário para o nome original
% disp(['Arquivo CSV atualizado: ', csvFileName]);
% %%
% % Nome do arquivo LaTeX para escrita
% latexFileName1 = '4_0_hexagonal_lattice_data_res_full.tex';
% latexFileName2 = '4_1_hexagonal_lattice_data_res.tex';
% latexFileName3 = '4_2_hexagonal_lattice_data_res.tex';
% latexFileName4 = '4_3_hexagonal_lattice_data_res.tex';
% latexFileName5 = '4_4_hexagonal_lattice_data_res.tex';
% % Obtendo o caminho do diretorio acima do diretorio atual
% [pai, ~, ~] = fileparts(pwd);
% % Caminho completo para escrita do arquivo Latex
% path_file1 = fullfile(strcat(pai,'\2_data_latex'),latexFileName1);
% path_file2 = fullfile(strcat(pai,'\2_data_latex'),latexFileName2);
% path_file3 = fullfile(strcat(pai,'\2_data_latex'),latexFileName3);
% path_file4 = fullfile(strcat(pai,'\2_data_latex'),latexFileName4);
% path_file5 = fullfile(strcat(pai,'\2_data_latex'),latexFileName5);
% % Abrindo o arquivo do Latex para escrita
% latexFile1 = fopen(path_file1, 'w');
% latexFile2 = fopen(path_file2, 'w');
% latexFile3 = fopen(path_file3, 'w');
% latexFile4 = fopen(path_file4, 'w');
% latexFile5 = fopen(path_file5, 'w');
% % Escreva o código LaTeX para a tabela
% fprintf(latexFile1, '\\documentclass{article}\n');
% fprintf(latexFile2, '\\documentclass{article}\n');
% fprintf(latexFile3, '\\documentclass{article}\n');
% fprintf(latexFile4, '\\documentclass{article}\n');
% fprintf(latexFile5, '\\documentclass{article}\n');
% %
% fprintf(latexFile1, '\\usepackage{caption}\n');
% %
% fprintf(latexFile1, '\\begin{document}\n');
% fprintf(latexFile2, '\\begin{document}\n');
% fprintf(latexFile3, '\\begin{document}\n');
% fprintf(latexFile4, '\\begin{document}\n');
% fprintf(latexFile5, '\\begin{document}\n');
% %
% fprintf(latexFile1, '\\begin{table}[htb]\n');
% fprintf(latexFile2, '\\begin{table}[htb]\n');
% fprintf(latexFile3, '\\begin{table}[htb]\n');
% fprintf(latexFile4, '\\begin{table}[htb]\n');
% fprintf(latexFile5, '\\begin{table}[htb]\n');
% %
% fprintf(latexFile1, '\\centering\n');
% fprintf(latexFile2, '\\centering\n');
% fprintf(latexFile3, '\\centering\n');
% fprintf(latexFile4, '\\centering\n');
% fprintf(latexFile5, '\\centering\n');
% %
% fprintf(latexFile1, '\\caption{The lower and upper edge frequencies in modes 2 and 3, along with the width of the first full band gap; The lower and upper edge frequencies in modes 3 and 4, alongside the width of the second full band gap in a Honeycomb lattice.}\n');
% fprintf(latexFile1, '\\label{tab400}\n');
% %
% fprintf(latexFile1, '\\begin{tabular}{ccccccc}\n');
% fprintf(latexFile2, '\\begin{tabular}{ccc}\n');
% fprintf(latexFile3, '\\begin{tabular}{ccc}\n');
% fprintf(latexFile4, '\\begin{tabular}{cc}\n');
% fprintf(latexFile5, '\\begin{tabular}{cc}\n');
% %
% fprintf(latexFile1, '\\hline\n');
% fprintf(latexFile2, '\\hline\n');
% fprintf(latexFile3, '\\hline\n');
% fprintf(latexFile4, '\\hline\n');
% fprintf(latexFile5, '\\hline\n');
% %
% fprintf(latexFile1, '$f_R$[Hz] & $f_2$[Hz] & $f_3$[Hz] & $\\Delta f _{23}$[Hz] & $f_3$[Hz] & $f_4$[Hz] & $\\Delta f _{34}$[Hz]\\\\ \\hline\n');
% fprintf(latexFile2, '$f_R$[Hz] & $f_2$[Hz] & $f_3$[Hz]  \\\\ \\hline\n');
% fprintf(latexFile3, '$f_R$[Hz] & $f_3$[Hz] & $f_4$[Hz]\\\\ \\hline\n');
% fprintf(latexFile4, '$f_R$[Hz] & $\\Delta f_{23}$[Hz]  \\\\ \\hline\n');
% fprintf(latexFile5, '$f_R$[Hz] & $\\Delta f_{34}$[Hz]  \\\\ \\hline\n');
% % Lendo os dados csv e escrevendo em uma tabela do Latex
% data = csvread(csvFileName);
% for i = 1:size(data, 1)
%     fprintf(latexFile1, '%d & %.2f & %.2f & %.2f & %.2f & %.2f & %.2f \\\\ \\hline\n',data(i, :));
%     fprintf(latexFile2, '%d & %.2f & %.2f  \\\\ \\hline\n',data(i, [1,2,3]));
%     fprintf(latexFile3, '%d & %.2f & %.2f   \\\\ \\hline\n',data(i, [1,5,6]));
%     fprintf(latexFile4, '%d & %.2f \\\\ \\hline\n',data(i, [1,4]));
%     fprintf(latexFile5, '%d & %.2f \\\\ \\hline\n',data(i, [1,7]));
% end
% %
% fprintf(latexFile1, '\\end{tabular}\n');
% fprintf(latexFile2, '\\end{tabular}\n');
% fprintf(latexFile3, '\\end{tabular}\n');
% fprintf(latexFile4, '\\end{tabular}\n');
% fprintf(latexFile5, '\\end{tabular}\n');
% %
% fprintf(latexFile1, '\\end{table}\n');
% fprintf(latexFile2, '\\end{table}\n');
% fprintf(latexFile3, '\\end{table}\n');
% fprintf(latexFile4, '\\end{table}\n');
% fprintf(latexFile5, '\\end{table}\n');
% %
% fprintf(latexFile1, '\\end{document}\n');
% fprintf(latexFile2, '\\end{document}\n');
% fprintf(latexFile3, '\\end{document}\n');
% fprintf(latexFile4, '\\end{document}\n');
% fprintf(latexFile5, '\\end{document}\n');
% % Fecha o arquivo LaTeX
% fclose(latexFile1);
% fclose(latexFile2);
% fclose(latexFile3);
% fclose(latexFile4);
% fclose(latexFile5);
% %
% disp(['Tabela LaTeX criada no arquivo: ', latexFileName1]);
% disp(['Tabela LaTeX criada no arquivo: ', latexFileName2]);
% disp(['Tabela LaTeX criada no arquivo: ', latexFileName3]);
% disp(['Tabela LaTeX criada no arquivo: ', latexFileName4]);
% disp(['Tabela LaTeX criada no arquivo: ', latexFileName5]);
% %%
% Variavel para alocacao dos dados a serem exportados
cont_sub_plot = 1;
for sub_plot_freq=[10,60,150]
    % Load Data PWE Resonator
    % Numberwave
    pwe_file_w_res = strcat('4_1_a_0.10_h_0.002_lattice_h_res_',...
        num2str(sub_plot_freq),'_pwe_w_data_full_path.csv');
    w_kk_pwe_res = csvread(pwe_file_w_res);
    % Frequency
    pwe_file_f_res = strcat('4_2_a_0.10_h_0.002_lattice_h_res_',...
        num2str(sub_plot_freq),'_pwe_f_data_full_path.csv');
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
    %%
    fig2 = figure(2);
    colorPalette = {
        '#EDB120', ...
        '#40E0D0', ...
        '#FA8072', ...
        '#CCCCFF', ...
        '#D95319', ...
        '#0072BD', ...
        '#4DBEEE'
        };
    subplot(1,3,cont_sub_plot)
    box on
    hold on
    % Primeiro controle: Assegura indices de legendas com ou sem band gaps
    % completos
    %cont=1;
    % Modos 1 e 2
    if (delta_f_gap0 >= 1)
        rectangle_position = [0, freq_1(index10), 5,delta_f_gap0]; % [x, y, largura, altura]
        rectangle('Position', rectangle_position, 'FaceColor', 'g', 'EdgeColor', 'none')
    end
    % Modos 2 e 3
    if (delta_f_gap1 >= 1)
        rectangle_position = [0, freq_2(index11), 5,delta_f_gap1]; % [x, y, largura, altura]
        rectangle('Position', rectangle_position, 'FaceColor', '#FB0688', 'EdgeColor', 'none')
    end
    % Modos 3 e 4
    if (delta_f_gap2 >= 1)
        rectangle_position = [0, freq_3(index12), 5,delta_f_gap2]; % [x, y, largura, altura]
        rectangle('Position', rectangle_position, 'FaceColor', '#EC4D09', 'EdgeColor', 'none')
    end
    for i=1:7
        plot_pwe_res{i} = plot(w_kk_pwe_res(i,:),freq_pwe_res(i,:),'Color',colorPalette{i},'LineWidth',6)
    end
    for i=1:7
        plot_pwe_bare{i} = plot(w_kk_pwe_bare(i,:),freq_pwe_bare(i,:),...
            'LineStyle', '-','LineWidth', 2,'Color','k');
    end
    %legendText{cont} = sprintf('K-L: Hexagonal Lattice (PWE): %g [Hz]',sub_plot_freq);
    if (delta_f_gap0 >= 1)
        scatter(w_kk_1(index10),freq_1(index10),70,'MarkerEdgeColor','k','MarkerFaceColor','g','LineWidth',1)
        scatter(w_kk_2(ponto20),freq_2(ponto20),70,'MarkerEdgeColor','k','MarkerFaceColor','g','LineWidth',1)
    end
    if (delta_f_gap1 >= 1)        
        scatter(w_kk_2(index11),freq_2(index11),70,'MarkerEdgeColor','k','MarkerFaceColor','r','LineWidth',1)
        scatter(w_kk_3(index21),freq_3(index21),70,'MarkerEdgeColor','k','MarkerFaceColor','r','LineWidth',1)
    end
    if (delta_f_gap2 >= 1)
        scatter(w_kk_3(index12),freq_3(index12),70,'MarkerEdgeColor','r','MarkerFaceColor','b','LineWidth',1)
        scatter(w_kk_4(index22),freq_4(index22),70,'MarkerEdgeColor','r','MarkerFaceColor','b','LineWidth',1)
    end
    plot_res = yline(sub_plot_freq,'--','Color','b','LineWidth',3);
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
    %
    legend([fullBandgap1,...
        fullBandgap2,...
    plot_pwe_res{2},...   
    plot_pwe_res{3},...   
    plot_pwe_res{4},...   
    plot_pwe_bare{1},...
    plot_res], ...
    sprintf('FBGW 1 - f_2 = %.2f [Hz], f_3 = %.2f [Hz], \\Deltaf_{23} = %.2f [Hz]',...
    freq_2(index11),freq_3(index21),delta_f_gap1),...
    sprintf('FBGW 2 - f_3 = %.2f [Hz], f_4 = %.2f [Hz], \\Deltaf_{34} = %.2f [Hz]',...
    freq_3(index12),freq_4(index22),delta_f_gap2),...
    sprintf('K-L: Mode %g - LRSC in honeycomb lattice (PWE)',2),...
    sprintf('K-L: Mode %g - LRSC in honeycomb lattice (PWE)',3),...
    sprintf('K-L: Mode %g - LRSC in honeycomb lattice (PWE)',4),...
    sprintf('K-L: Bare Plate - LRSC in honeycomb lattice (PWE)'),...
    sprintf('LRSC: %g [Hz]',sub_plot_freq));
    annot1 = annotation('textbox', [.2,.4, 0.2, 0.1], 'String', 'f_1','FontName', 'Times', 'FitBoxToText',...
    'on', 'BackgroundColor', 'none');
    annot2 = annotation('textbox', [.2,.3, 0.2, 0.1], 'String', 'f_2','FontName', 'Times', 'FitBoxToText',...
    'on', 'BackgroundColor', 'none');
    % Editar os parâmetros da anotação
    set(annot1, 'Color', 'black', 'EdgeColor', 'none', 'FontSize', 18, 'FontWeight', 'bold');
    set(annot2, 'Color', 'black', 'EdgeColor', 'none', 'FontSize', 18, 'FontWeight', 'bold');
    set(gca,'YScale', 'log')
    set(gca,'fontSize',18,'fontweight','b')    
    set(gca,'YScale', 'log')
    xlim([0 5])
    ylim([5 500])
    ylabel('Frequency [Hz]','fontsize',20,'fontweight','b')
    xticks([0 1 2 3 4 5]);
    xticklabels({'M^\prime','\Gamma','X','M','X^\prime','M^\prime'})
    set(legend,'FontSize',8);
    grid on
    set(gca,'fontSize',18,'fontweight','b')
    cont_sub_plot = cont_sub_plot +1;
end
%title('Honeycomb reduced wave vector k','fontsize',22,'fontweight','b');
% Definindo o rotulo da figura
label_file_res = sprintf('5_6_a_%g_h_%g_lattice_hexagonal_res',0.1,0.002);
% Obtendo o caminho do diretorio acima do diretorio atual
[pai, ~, ~] = fileparts(pwd);
% Exportando figura com extensao .fig
fig_41 = fullfile(strcat(pai,'\3_figs\figs_2'), [label_file_res, '.fig']);
savefig(fig_41);
% Exportando figura com extensao .eps
fig4_eps = fullfile(strcat(pai,'\3_figs\figs_2'), [label_file_res, '.eps']);
saveas(fig2,fig4_eps,'epsc');
% Exportando figura com extensao .png
fig4_png = fullfile(strcat(pai,'\3_figs\figs_2'), [label_file_res, '.png']);
saveas(fig2,fig4_png,'png');
end