% % plot the convergence of P1 SL Lobatto for mesh refinement
function SpaceTime_Plot(quad_pt,meth)
close all

p_ord = length(quad_pt) - 1;


cell_base = { sprintf('Marshak_Results/%s_P%i_20_cell',meth,p_ord) ...
                 sprintf('Marshak_Results/%s_P%i_80_cell',meth,p_ord) ...
                 sprintf('Marshak_Results/%s_P%i_320_cell',meth,p_ord) ...
                 sprintf('Marshak_Results/%s_P%i_1280_cell',meth,p_ord) };
             
data_base = { sprintf('Marshak_Results/Marshak_Wave_%s_P%i_Base',meth,p_ord) ...
                sprintf('Marshak_Results/Marshak_Wave_%s_P%i_Base_Refine_4_Cells_1_Time',meth,p_ord) ...
                sprintf('Marshak_Results/Marshak_Wave_%s_P%i_Base_Refine_16_Cells_1_Time',meth,p_ord) ...
                sprintf('Marshak_Results/Marshak_Wave_%s_P%i_Base_Refine_64_Cells_1_Time',meth,p_ord) };
            

[dfem_mat,junk] = feshpln( linspace(-1,1,p_ord +3) , quad_pt , p_ord);
            
Dark_Arts_Plotter(1,2,cell_base,data_base,dfem_mat)



% temperature 
figure(1)
% axis([0.34 0.41 -0.1 1])
h = legend('20 Cell' , '80 Cell' , '320 Cell' , '1280 Cell');

% radiation 
figure(2)
% axis([0.32 0.42 -0.1 1.5])
h = legend('20 Cell' , '80 Cell' , '320 Cell' , '1280 Cell');

cell_base = {   sprintf('Marshak_Results/%s_P%i_1280_cell',meth,p_ord) };
    
data_base = {   sprintf('Marshak_Results/Marshak_Wave_%s_P%i_Base_Refine_64_Cells_1_Time',meth,p_ord) ...
                sprintf('Marshak_Results/Marshak_Wave_%s_P%i_Base_Refine_64_Cells_4_Time',meth,p_ord) ...
                sprintf('Marshak_Results/Marshak_Wave_%s_P%i_Base_Refine_64_Cells_16_Time',meth,p_ord) ...
                sprintf('Marshak_Results/Marshak_Wave_%s_P%i_Base_Refine_64_Cells_64_Time',meth,p_ord) };
        
Dark_Arts_Plotter(3,4 , cell_base, data_base,dfem_mat);

return
end