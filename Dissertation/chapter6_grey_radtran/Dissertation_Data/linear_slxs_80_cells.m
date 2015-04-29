% % plot linear slxs lobatto solution with 80 cells

close all

cell_meth = 'SL_Lobatto';
data_meth = 'SL_Lobatto';
quad_f = @lglnodes;

cell_base = {   ... sprintf('Marshak_Results/%s_P%i_80_cell',cell_meth,1) ...
                sprintf('Marshak_Results/%s_P%i_80_cell',cell_meth,1) ...
};

data_base = {   ... sprintf('Marshak_Results/Marshak_Wave_Constant_XS_P%i_Refine_4_Cells_1_Time',1) ...       
                sprintf('Marshak_Results/Marshak_Wave_%s_P%i_Base_Refine_4_Cells_1_Time',data_meth,1) ...                         
                };
            
[q,w] = lglnodes(2);

x = linspace(-1,1,5);
[dfem_mat,junk] = feshpln(x,q,1);
            
Dark_Arts_Plotter(1,2 ,cell_base,data_base,dfem_mat)

temperature_file = sprintf('SLXS_Lobatto_80_Cells_Temperature');
rad_file = sprintf('SLXS_Lobatto_80_Cells_Radiation');

% Temperature
figure(1)
h = legend('P1 SLXS Lobatto');
set(h,'Interpreter','latex','FontSize',16);
set(gca,'FontName','Times','FontSize',18);
% % 
set(gca,'XTick',[0 0.2 0.4 0.6 0.8 1])
% axis([0.38 0.395 -0.05 0.6]);
SavePretty( figure(1) , temperature_file)
% 
% % Radiation
figure(2)
h = legend('P1 SLXS Lobatto');
set(h,'Interpreter','latex','FontSize',16);
set(gca,'FontName','Times','FontSize',18);
% axis([0.38 0.395 -0.05 0.7]);
SavePretty( figure(2) , rad_file)
set(gca,'XTick',[0 0.2 0.4 0.6 0.8 1])