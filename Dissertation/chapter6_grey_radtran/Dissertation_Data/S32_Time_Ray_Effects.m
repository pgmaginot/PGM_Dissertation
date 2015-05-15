% plot each methd and P as the mesh get refined
% use the finest time step size
close all

p=3;
[q,w] = lglnodes(p+1);
[dfem_mat , d_dfem_mat] = feshpln(linspace(-1,1,10) , q , p);

cell_base = {   sprintf('Marshak_Results/MW_S32_Cv1_T01_SigA_1') ...
                sprintf('Marshak_Results/MW_S32_Cv1_T05_SigA_1') ...
                sprintf('Marshak_Results/MW_S32_Cv1_T1_SigA_1') ...
                sprintf('Marshak_Results/MW_S32_Cv1_T2_SigA_1') ...
                };

data_base = {   sprintf('Marshak_Results/MW_S32_Cv1_T01_SigA_1') ...
                sprintf('Marshak_Results/MW_S32_Cv1_T05_SigA_1') ...
                sprintf('Marshak_Results/MW_S32_Cv1_T1_SigA_1') ...
                sprintf('Marshak_Results/MW_S32_Cv1_T2_SigA_1') ...
                };

Dark_Arts_Plotter(1,2 ,cell_base,data_base,dfem_mat)
      
        
temperature_file = sprintf('S32_Time_Ray_Effects_Temperature_Cv1_SigA1');
rad_file = sprintf('S32_Time_Ray_Effects_Radiation_Cv1_SigA1');
        
% Temperature
figure(1)
h = legend('T=0.1','T=0.5','T=1','T=2' );
set(h,'Interpreter','latex','FontSize',24);
set(gca, 'FontName','Times','FontSize',30)
axis([0 0.8 -0.05 1.4]) 
set(gcf,'OuterPosition',[-7 33 1936 1056],'PaperPosition',[0.2500  2.5000 8.0000 6.0000],'PaperSize',[8.5 11] , 'Position', [1 41 1920  964])
xlabel('Position','FontName','Time','FontSize',30)
ylabel('Material Temperature','FontName','Time','FontSize',30)
SavePretty(gcf,temperature_file);



% Radiation
figure(2)
h = legend('T=0.1','T=0.5','T=1','T=2' );
set(h,'Interpreter','latex','FontSize',24);
set(gca, 'FontName','Times','FontSize',30)
axis([0 0.8 -0.05 2.5])
set(gcf,'OuterPosition',[-7 33 1936 1056],'PaperPosition',[0.2500  2.5000 8.0000 6.0000],'PaperSize',[8.5 11] , 'Position', [1 41 1920  964])
xlabel('Position','FontName','Time','FontSize',30)
ylabel('Radiation Energy Density','FontName','Time','FontSize',30)

SavePretty(gcf,rad_file);

        