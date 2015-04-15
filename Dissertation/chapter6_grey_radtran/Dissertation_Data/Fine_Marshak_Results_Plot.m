function Fine_Marshak_Results_Plot()

cell_base = {   sprintf('Marshak_Results/Marshak_Wave_10k') ...
                sprintf('Marshak_Results/Marshak_Wave_10k_Low_t') ...
                sprintf('Marshak_Results/SL_Lobatto_P3_1280_cell') ...
            };
             
data_base = { sprintf('Marshak_Results/Marshak_Wave_10k') ...
              sprintf('Marshak_Results/Marshak_Wave_10k_Low_t') ...
              sprintf('Marshak_Results/Marshak_Wave_SL_Lobatto_P3_Base_Refine_64_Cells_64_Time') ...
              };
          
[quad_pt , w] = lglnodes(4);
[dfem_mat,junk] = feshpln( linspace(-1,1, 10) , quad_pt , 3);
            
Dark_Arts_Plotter(1,2,cell_base,data_base,dfem_mat)         

figure(1)
h = legend('10k Cell' , '10k Coarse $\Delta t$', '1280 cell');
set(h,'Interpreter','latex','FontSize',14)

% radiation 
figure(2)
h = legend('10k Cell' , '10k Coarse $\Delta t$', '1280 cell');
set(h,'Interpreter','latex')

return
end