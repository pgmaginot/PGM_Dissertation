% clear all
% close all

cell_base = {   ...
    sprintf('Marshak_Results/Marshak_Wave_SL_Gauss_P4_S8_More_Cells')...
  ...  sprintf('Marshak_Results/Marshak_Wave_SL_Lobatto_P3_S32_1k_Cell_5k_Time')...
  sprintf('Marshak_Results/Marshak_Wave_SL_Gauss_P4_S32_1k_Cell_5k_Time')...
        };
    
data_base = {   ...
    sprintf('Marshak_Results/Marshak_Wave_SL_Gauss_P4_S8_More_Cells')...
%     sprintf('Marshak_Results/Marshak_Wave_SL_Lobatto_P3_S32_1k_Cell_5k_Ti
%     me')...
  sprintf('Marshak_Results/Marshak_Wave_SL_Gauss_P4_S32_1k_Cell_5k_Time')...
        };
    
p_ord = 4;
[q,w] = GLNodeWt(p_ord+1);
plot_p = linspace(-1,1,20);
[dfem_mat , junk] = feshpln(plot_p,q,p_ord);

p_ord = 3;
[q,w] = lglnodes(p_ord+1);
plot_p = linspace(-1,1,20);
[dfem_mat_2 , junk] = feshpln(plot_p,q,p_ord);

Dark_Arts_Plotter_Two_Lines(1,2,cell_base, data_base , dfem_mat , dfem_mat);


figure(1)
axis([0 0.5 0 1.4])
h = legend('$S_8$','$S_{32}$');
set(h,'Interpreter','latex','FontSize',24)
xlabel('Position','FontSize',24,'Interpreter','latex');
ylabel('Temperature','FontSize',24,'Interpreter','latex');

set(gca,'XTick',[0. 0.1 0.2 0.3 0.4 0.5])
set(gca,'FontName','Times','FontSize',30)
set(h,'Interpreter','latex','FontSize',30)

set(gcf,'OuterPosition',[-7 33 1936 1056],'PaperPosition',[0.2500  2.5000 8.0000 6.0000],'PaperSize',[8.5 11] , 'Position', [1 41 1920  964])

SavePretty( gcf , 'S8_vs_S32_Material_Temperature')

figure(2)
axis([0 0.5 0 2.5])
h = legend('$S_8$','$S_{32}$');
set(h,'Interpreter','latex','FontSize',24)
xlabel('Position','FontSize',24,'Interpreter','latex');
ylabel('Angle Integrated Intensity','FontSize',24,'Interpreter','latex');

set(gca,'XTick',[0. 0.1 0.2 0.3 0.4 0.5])
set(gca,'FontName','Times','FontSize',30)
set(h,'Interpreter','latex','FontSize',30)

set(gcf,'OuterPosition',[-7 33 1936 1056],'PaperPosition',[0.2500  2.5000 8.0000 6.0000],'PaperSize',[8.5 11] , 'Position', [1 41 1920  964])

SavePretty( gcf , 'S8_vs_S32_Radiation')