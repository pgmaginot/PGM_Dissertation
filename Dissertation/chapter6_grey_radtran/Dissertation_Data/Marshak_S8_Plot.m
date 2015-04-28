close all

cell_base = {   ...
    sprintf('Marshak_Results/Marshak_Wave_SL_Gauss_P4_S8_More_Cells')...
    sprintf('Marshak_Results/Marshak_Wave_10k')...
        };
    
data_base = {   ...
    sprintf('Marshak_Results/Marshak_Wave_SL_Gauss_P4_S8_More_Cells')...
    sprintf('Marshak_Results/Marshak_Wave_10k')...
        };
    
p_ord = 4;
[q,w] = GLNodeWt(p_ord+1);
plot_p = linspace(-1,1,20);
[dfem_mat , junk] = feshpln(plot_p,q,p_ord);

p_ord = 3;
[q,w] = lglnodes(p_ord+1);
plot_p = linspace(-1,1,20);
[dfem_mat_2 , junk] = feshpln(plot_p,q,p_ord);

Dark_Arts_Plotter_Two_Lines(1,2,cell_base, data_base , dfem_mat , dfem_mat_2);


figure(1)
h = legend('$S_8$','$S_2$');
set(h,'Interpreter','latex','FontSize',18)

SavePretty( gcf , 'S8_vs_S2_Material_Temperature')

figure(2)
h = legend('$S_8$','$S_2$');
set(h,'Interpreter','latex','FontSize',18)
SavePretty( gcf , 'S8_vs_S2_Radiation_Energy_Density')